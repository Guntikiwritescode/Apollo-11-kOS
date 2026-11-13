// kOS addon "AGC": the pinned yaAGC engine (original Luminary099 rope) inside KSP.
// The KerboScript flight loop keeps every wiring step. Only the CPU moves to native code.
using System;
using System.IO;
using UnityEngine;
using kOS.Safe.Encapsulation;

[assembly: KSPAssembly("ApolloNativeAGC", 1, 0)]
[assembly: KSPAssemblyDependency("kOS", 1, 6)]
[assembly: KSPAssemblyDependency("kOS.Safe", 0, 0)]

namespace kOS.AddOns.ApolloNativeAGC {
    [kOSAddon("AGC")]
    [kOS.Safe.Utilities.KOSNomenclature("AgcAddon")]
    public class AgcAddon : kOS.Suffixed.Addon {
        static string Here { get { return Path.GetDirectoryName(typeof(AgcAddon).Assembly.Location); } }
        static string Data(string name) { return Path.GetFullPath(Path.Combine(Here, "..", "PluginData", name)); }

        public AgcAddon(SharedObjects shared) : base(shared) {
            AgcSuffixes.Register((name, suffix) => AddSuffix(name, suffix), start => {
                string record = Path.Combine(KSPUtil.ApplicationRootPath, "Ships", "Script", "apollo-native");
                string state = start == "p65" ? "p65-000106213702.tsv" : start == "orbit" ? "orbit.tsv" : null;
                if (state == null) { Debug.Log("[ApolloNativeAGC] Unknown start " + start); return -1; }
                int rc = AgcNative.Load(Data("libagcksp.dylib"), Data("Luminary099.bin"), Data(state), record);
                Debug.Log("[ApolloNativeAGC] " + AgcNative.Status);
                return rc;
            }, msg => Debug.Log("[ApolloNativeAGC] " + msg));
        }
        public override BooleanValue Available() { return true; }
    }
}
