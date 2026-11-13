// One rigid KSP vessel, stock gravity, stock terrain contact. kOS supplies force commands.
using System;
using System.Globalization;
using System.Reflection;
using System.IO;
using System.Linq;
using UnityEngine;
using kOS.Safe.Encapsulation;
using kOS.Safe.Encapsulation.Suffixes;

[assembly: KSPAssembly("ApolloLanding", 1, 0)]
[assembly: KSPAssemblyDependency("kOS", 1, 6)]
[assembly: KSPAssemblyDependency("kOS.Safe", 0, 0)]

// Publish the completed sensor sample before kOS runs. Apply the last command
// after kOS runs, so the instruction budget fall inside the same window.
[DefaultExecutionOrder(-30000)]
public sealed class ApolloLandingSampler : MonoBehaviour {
    internal ApolloLandingHardware hardware;
    void FixedUpdate() { if (hardware!=null) hardware.BeginWindow(); }
}

[DefaultExecutionOrder(30000)]
public sealed class ApolloLandingHardware : PartModule
{
    [KSPField(isPersistant=true)] public string startName = "";
    [KSPField(isPersistant=true)] public string startRate = "0,0,0";
    public const double Dt = 0.02, Tick = Dt;
    const double DpsExhaust = 2955.88868, JetExhaust = 2840;
    static readonly CultureInfo CI = CultureInfo.InvariantCulture;
    [KSPField(isPersistant=true)] public double entryT = 0;
    [KSPField(isPersistant=true)] public double entryGet = 0;
    public int Frame { get; private set; }
    public double Elapsed { get { return (Frame+tick)*Tick; } }
    public string Status { get; private set; }
    public ListValue Sample { get; private set; }
    Orbit entryOrbit;
    Quaternion localRotation;
    Vector3 localRate;
    Part[] jets;
    Part engine;
    Rigidbody body;
    PartResource dps,rcs;
    bool initialized, running, pending, paced, startPending;
    int tick;
    float oldScale,oldFixed;
    double oldPlanet;
    int oldIpu;
    FieldInfo ipuField;
    const int FlightIpu = 10000000;
    Vector3 localForce, localTorque, nextForce, nextTorque;
    double nextDpsKg, nextRcsKg;
    Vector3 frameForceWorld, frameTorqueWorld;
    Vector3d actualDv;
    Quaternion frameAtt;
    public override void OnStart(StartState state) {
        base.OnStart(state);
        if (HighLogic.LoadedSceneIsFlight) Status = "Loading";
    }
    void Init() {
        var path=Path.Combine(KSPUtil.ApplicationRootPath,"saves",HighLogic.SaveFolder,"entry.sfs");
        var saved=ConfigNode.Load(path).GetNode("GAME").GetNode("FLIGHTSTATE").GetNode("VESSEL");
        var values=saved.GetNode("ORBIT");
        Func<string,double> number = key => double.Parse(values.GetValue(key),CI);
        var moon=vessel.mainBody;
        if (moon.bodyName!="Mun" || Math.Abs(moon.Radius-1735016.0963443539)>0.001 ||
            Math.Abs(moon.gravParameter-4.902778e12)>1 || Math.Abs(moon.rotationPeriod-2360591.6)>0.001)
            throw new InvalidDataException("Mun radius, gravity or rotation period differs from the landing configuration");
        entryOrbit=new Orbit(number("INC"),number("ECC"),number("SMA"),number("LAN"),
                             number("LPE"),number("MNA"),number("EPH"),moon);
        localRotation=ConfigNode.ParseQuaternion(saved.GetValue("rot"));
        localRate=ConfigNode.ParseVector3(startRate);
        jets=Enumerable.Range(39200011,16).Select(uid=>vessel.parts.Single(p=>p.flightID==(uint)uid)).ToArray();
        engine=vessel.parts.Single(p=>p.flightID==39200005);
        dps=part.Resources["EagleDPS"]; rcs=part.Resources["EagleRCS"];
        body=part.rb;
        if (vessel.parts.Any(p=>p!=part && p.rb!=null && p.rb!=body))
            throw new InvalidDataException("Expected the 24-part LM to share its root rigidbody");
        oldScale=Time.timeScale; oldFixed=Time.fixedDeltaTime; oldPlanet=Planetarium.fetch.fixedDeltaTime;
        ipuField=typeof(kOS.Module.kOSCustomParameters).GetField("instructionsPerUpdate",BindingFlags.Instance|BindingFlags.NonPublic);
        if (ipuField==null || ipuField.FieldType!=typeof(int))
            throw new InvalidDataException("kOS 1.6.0.1 instruction budget field unavailable");
        oldIpu=(int)ipuField.GetValue(kOS.Module.kOSCustomParameters.Instance);
        gameObject.AddComponent<ApolloLandingSampler>().hardware=this;
        paced=true; Pace(); initialized=true; Status="Holding";
    }
    void Pace() {
        if (FlightDriver.Pause || !paced) return;
        Time.timeScale=1f;
        Time.fixedDeltaTime=(float)Tick;
        Planetarium.fetch.fixedDeltaTime=Tick;
        ipuField.SetValue(kOS.Module.kOSCustomParameters.Instance,FlightIpu);
    }
    void Update() { if (paced) Pace(); }
    void Restore() {
        if (!paced) return;
        paced=false;
        Time.timeScale=oldScale; Time.fixedDeltaTime=oldFixed;
        if (Planetarium.fetch!=null) Planetarium.fetch.fixedDeltaTime=oldPlanet;
        ipuField.SetValue(kOS.Module.kOSCustomParameters.Instance,oldIpu);
    }
    void OnDestroy() { Restore(); }
    void Stop(string reason) {
        running=false; Status=reason;
        string msg=reason+" frame="+Frame+" tick="+tick;
        Debug.Log("[ApolloLanding] "+msg);
        string dir=Path.Combine(KSPUtil.ApplicationRootPath,"Ships","Script",startName=="orbit" ? "apollo-native" : "apollo-landing");
        if (Directory.Exists(dir)) {
            File.AppendAllText(Path.Combine(dir,"flight-end.txt"),msg+Environment.NewLine);
            var events=Path.Combine(dir,"landing.events.csv");
            if (!File.Exists(events)) File.WriteAllText(events,"t,get,event"+Environment.NewLine);
            File.AppendAllText(events,string.Format(CI,"{0:F2},{1:F2},{2}\n",entryT+Elapsed,entryGet+Elapsed,
                reason.Replace(","," ")));
        }
        Restore();
        if (reason=="AGC missed the physics-tick deadline") FlightDriver.SetPause(true);
    }
    void Inertia() {
        // KSP's Rigidbody mass unit is a tonne. Force is kN.
        body.centerOfMass=Vector3.zero;
        body.inertiaTensorRotation=Quaternion.identity;
        double kg=6633 + dps.amount + rcs.amount;
        body.mass=(float)(kg/1000);
        body.inertiaTensor=new Vector3(23.6f,23.8f,23.9f)*(float)(kg/15103);
        body.angularDrag=0;
    }
    void HoldEntry() {
        // Reuse only the saved orbit and surface-relative quaternion. Phase stays
        // at its saved epoch during port loading. Longitude is arbitrary on the sphere.
        var moon=vessel.mainBody;
        var pos=entryOrbit.getRelativePositionAtUT(entryOrbit.epoch).xzy;
        var velocity=entryOrbit.getOrbitalVelocityAtUT(entryOrbit.epoch).xzy;
        var q=moon.bodyTransform.rotation*Quaternion.AngleAxis((float)moon.rotationAngle, Vector3.up)*localRotation;
        vessel.SetRotation(q);
        vessel.SetPosition(moon.position+pos);
        var frameVelocity=Krakensbane.GetFrameVelocity();
        if (moon.inverseRotation) frameVelocity+=moon.getRFrmVel(moon.position+pos);
        vessel.SetWorldVelocity(velocity-frameVelocity);
        body.angularVelocity=q*localRate-(moon.inverseRotation ? (Vector3)moon.angularVelocity : Vector3.zero);
    }
    // World polar vectors in the Z-up inertial axes of the saved orbit, including
    // KSP's low-altitude rotating frame. Use surface positions at two longitudes.
    Vector3d OrbitalComponents(Vector3d w) {
        var moon=vessel.mainBody;
        var prime=(moon.GetWorldSurfacePosition(0,0,0)-moon.position).normalized;
        var east=(moon.GetWorldSurfacePosition(0,90,0)-moon.position).normalized;
        var north=(moon.GetWorldSurfacePosition(90,0,0)-moon.position).normalized;
        double a=moon.rotationAngle*Math.PI/180, x=Vector3d.Dot(w,prime), y=Vector3d.Dot(w,east);
        return new Vector3d(x*Math.Cos(a)-y*Math.Sin(a), x*Math.Sin(a)+y*Math.Cos(a),Vector3d.Dot(w,north));
    }
    static ListValue Vec(Vector3d v) {
        return new ListValue {ScalarValue.Create(v.x),ScalarValue.Create(v.y),ScalarValue.Create(v.z)};
    }
    void Measure() {
        var m=vessel.mainBody; var t=part.transform;
        var r=(Vector3d)body.worldCenterOfMass-m.position;
        var v=(Vector3d)body.velocity+Krakensbane.GetFrameVelocity();
        if (m.inverseRotation) v+=m.getRFrmVel(r+m.position);
        var c=new ListValue {Vec(OrbitalComponents(t.up)),Vec(OrbitalComponents(t.right)),Vec(OrbitalComponents(t.forward))};
        Sample=new ListValue {Vec(OrbitalComponents(r)),Vec(OrbitalComponents(v)),c,
            Vec(OrbitalComponents(actualDv/Dt)),ScalarValue.Create(dps.amount),
            ScalarValue.Create(6633+dps.amount+rcs.amount)};
    }
    public bool Arm() {
        if (Status!="Holding") return false;
        Frame=-1; startPending=true; Status="Arming"; return true;
    }
    internal void BeginWindow() {
        if (startPending) {
            Inertia(); HoldEntry(); Measure(); startPending=false;
            Frame=0; tick=0; running=true; Status="Flying"; frameAtt=part.transform.rotation;
        } else if (running && tick==1) {
            Measure(); Frame++; tick=0; actualDv=Vector3d.zero;
            frameForceWorld=frameTorqueWorld=Vector3.zero; frameAtt=part.transform.rotation;
        }
    }
    public void Halt() { Stop("Stopped by boot"); }
    static double Val(Structure v) { return ((ScalarValue)v).GetDoubleValue(); }
    public bool Submit(ListValue cmd) {
        if (!running || pending || cmd.Count!=5 || Val(cmd[0])!=Frame) return false;
        double thrust=Val(cmd[1])/1000, pitch=Val(cmd[2]), roll=Val(cmd[3]);
        var times=(ListValue)cmd[4];
        if (times.Count!=16 || thrust<0 || thrust>43.905 || Math.Abs(pitch)>0.104721 ||
            Math.Abs(roll)>0.104721) throw new ArgumentOutOfRangeException("actuator command");
        // lm.py uses [cos(p)cos(r),-sin(r),sin(p)] in its body axes.
        nextForce=(float)thrust*new Vector3((float)-Math.Sin(roll),
                 (float)(Math.Cos(pitch)*Math.Cos(roll)),(float)Math.Sin(pitch));
        var root=part.transform;
        nextTorque=Vector3.Cross(root.InverseTransformPoint(engine.transform.position),nextForce);
        nextDpsKg=thrust*1000*Dt/DpsExhaust; nextRcsKg=0;
        for(int j=0;j<16;j++) {
            double time=Val(times[j]); if(time<0 || time>Dt+1.0/85333) throw new ArgumentOutOfRangeException("jet duty");
            var nozzle=jets[j].transform;
            Vector3 f=root.InverseTransformDirection(nozzle.up)*(float)(0.445*time/Dt);
            nextForce+=f;
            nextTorque+=Vector3.Cross(root.InverseTransformPoint(nozzle.position),f);
            nextRcsKg+=445*time/JetExhaust;
        }
        pending=true; return true;
    }
    void FixedUpdate() {
        if (!HighLogic.LoadedSceneIsFlight || !FlightGlobals.ready || vessel!=FlightGlobals.ActiveVessel ||
            vessel.packed || part.rb==null || (Status!=null && Status!="Holding" && Status!="Flying" && Status!="Loading")) return;
        try {
            if (!initialized) Init();
            Pace(); Inertia();
            if (!running) { HoldEntry(); Measure(); return; }
            if (vessel.LandedOrSplashed || vessel.parts.Any(p=>p.GroundContact)) { Measure(); Stop("Contact"); return; }
            // Apply the completed AGC command for this 20 ms physics tick.
            Vector3 f=frameAtt*localForce, tau=frameAtt*localTorque;
            if (tick==0) {
                if (!pending) { Stop("AGC missed the physics-tick deadline"); return; }
                if (nextDpsKg>dps.amount || nextRcsKg>rcs.amount) { Stop("Propellant exhausted"); return; }
                dps.amount-=nextDpsKg; rcs.amount-=nextRcsKg; Inertia();
                f=frameAtt*nextForce;
                tau=frameAtt*nextTorque;
                localForce=nextForce; localTorque=nextTorque; pending=false;
            }
            frameForceWorld+=f; frameTorqueWorld+=tau;
            body.AddForce(f,ForceMode.Force); body.AddTorque(tau,ForceMode.Force);
            actualDv+=(Vector3d)f*(Tick/body.mass); tick++;
        } catch(Exception ex) { Stop("Hardware fault: "+ex.Message); Debug.LogException(ex); }
    }
}

namespace kOS.AddOns.ApolloLanding {
    [kOSAddon("EAGLE")]
    [kOS.Safe.Utilities.KOSNomenclature("EagleAddon")]
    public class LandingAddon : kOS.Suffixed.Addon {
        public LandingAddon(SharedObjects shared) : base(shared) {
            AddSuffix("STARTNAME",new Suffix<StringValue>(()=>new StringValue(H.startName)));
            AddSuffix("STATUS",new Suffix<StringValue>(()=>new StringValue(H.Status??"Loading")));
            AddSuffix("ELAPSED",new Suffix<ScalarValue>(()=>ScalarValue.Create(H.Elapsed)));
            AddSuffix("FRAME",new Suffix<ScalarValue>(()=>ScalarValue.Create(H.Frame)));
            AddSuffix("SAMPLE",new Suffix<ListValue>(()=>H.Sample));
            AddSuffix("ARM",new NoArgsSuffix<BooleanValue>(()=>H.Arm()));
            AddSuffix("HALT",new NoArgsVoidSuffix(()=>H.Halt()));
            AddSuffix("SUBMIT",new OneArgsSuffix<BooleanValue,ListValue>(v=>H.Submit(v)));
        }
        ApolloLandingHardware H { get {return shared.Vessel.rootPart.FindModuleImplementing<ApolloLandingHardware>();} }
        public override BooleanValue Available() { return shared.Vessel!=null && H!=null; }
    }
}
