// wrapper around libagcksp.dylib, no KSP or kOS types so it also runs outside the game
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;

public static class AgcNative
{
    const string LibSystem = "/usr/lib/libSystem.B.dylib";
    [DllImport(LibSystem)] static extern IntPtr dlopen(string path, int mode);
    [DllImport(LibSystem)] static extern IntPtr dlsym(IntPtr handle, string name);
    [DllImport(LibSystem)] static extern IntPtr dlerror();

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate int FnLoad([MarshalAs(UnmanagedType.LPStr)] string rope, [MarshalAs(UnmanagedType.LPStr)] string state);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate int FnII(int a);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate long FnIL(int a);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate long FnL();
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate int FnI();
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate void FnV();
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate void FnIV(int a);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate void FnIIV(int a, int b);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate void FnIIIV(int a, int b, int c);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)] delegate int FnOut([In, Out] long[] cycles, [In, Out] int[] chans, [In, Out] int[] vals, int max);

    static FnLoad load; static FnII run, erasable, getch, reqSel, reqWord; static FnIL reqCycle;
    static FnL cycle; static FnI standby, restart, reqCount; static FnV clear;
    static FnIV key; static FnIIV setch, radar; static FnIIIV pulse; static FnOut outputs;

    public static string Status = "not loaded";
    public static bool Ready;
    public static int[] Watch = new int[0];
    public static long TotalCycles, TotalOutputs, TotalRadar;
    public static double NativeSeconds;
    static readonly Stopwatch wall = new Stopwatch();
    static readonly Stopwatch native = new Stopwatch();
    static readonly long[] outCycle = new long[65536];
    static readonly int[] outCh = new int[65536], outVal = new int[65536];
    static readonly int[] radarTable = new int[8];
    static StreamWriter seed, outs;

    static T Fn<T>(IntPtr lib, string name) where T : class {
        IntPtr p = dlsym(lib, name);
        if (p == IntPtr.Zero) throw new EntryPointNotFoundException(name);
        return Marshal.GetDelegateForFunctionPointer(p, typeof(T)) as T;
    }

    // Load the library, the rope and the saved state. recordDir may be null.
    public static int Load(string dylib, string rope, string state, string recordDir) {
        Ready = false;
        try {
            if (!File.Exists(dylib)) { Status = "missing " + dylib; return 10; }
            if (!File.Exists(rope)) { Status = "missing " + rope; return 11; }
            if (!File.Exists(state)) { Status = "missing " + state; return 12; }
            IntPtr lib = dlopen(dylib, 2 /* RTLD_NOW */);
            if (lib == IntPtr.Zero) { Status = "dlopen failed: " + Marshal.PtrToStringAnsi(dlerror()); return 13; }
            load = Fn<FnLoad>(lib, "agc_ksp_load"); run = Fn<FnII>(lib, "agc_ksp_run");
            erasable = Fn<FnII>(lib, "agc_ksp_erasable"); getch = Fn<FnII>(lib, "agc_ksp_getch");
            cycle = Fn<FnL>(lib, "agc_ksp_cycle"); standby = Fn<FnI>(lib, "agc_ksp_standby");
            restart = Fn<FnI>(lib, "agc_ksp_restart"); clear = Fn<FnV>(lib, "agc_ksp_clear");
            key = Fn<FnIV>(lib, "agc_ksp_key"); setch = Fn<FnIIV>(lib, "agc_ksp_setch");
            radar = Fn<FnIIV>(lib, "agc_ksp_radar"); pulse = Fn<FnIIIV>(lib, "agc_ksp_pulse");
            outputs = Fn<FnOut>(lib, "agc_ksp_outputs"); reqCount = Fn<FnI>(lib, "agc_ksp_req_count");
            reqCycle = Fn<FnIL>(lib, "agc_ksp_req_cycle"); reqSel = Fn<FnII>(lib, "agc_ksp_req_sel");
            reqWord = Fn<FnII>(lib, "agc_ksp_req_word");
            int rc = load(rope, state);
            if (rc != 0) { Status = "state load failed, code " + rc; return rc; }
            CloseRecord();
            if (recordDir != null) {
                Directory.CreateDirectory(recordDir);
                seed = new StreamWriter(Path.Combine(recordDir, "flight.seed"));
                outs = new StreamWriter(Path.Combine(recordDir, "flight-outputs.tsv"));
                seed.WriteLine("# Replay: agc_driver ROPE flight.seed Luminary099 STATE_DIR OUT EVENTS " + Path.GetFileName(state));
                seed.WriteLine("# Start cycle " + cycle());
            }
            TotalCycles = TotalOutputs = TotalRadar = 0; NativeSeconds = 0;
            wall.Reset(); wall.Start();
            Ready = true;
            Status = "loaded at cycle " + cycle();
            return 0;
        } catch (Exception ex) { Status = "load exception: " + ex.Message; return 20; }
    }

    public static double Wall { get { return wall.Elapsed.TotalSeconds; } }
    public static long Cycle { get { return Ready ? cycle() : -1; } }
    public static int Erasable(int slot) { return Ready ? erasable(slot) : -1; }
    public static int GetCh(int ch) { return Ready ? getch(ch) : -1; }
    public static bool Standby { get { return Ready && standby() != 0; } }
    public static bool Restart { get { return Ready && restart() != 0; } }

    public static void SetCh(int ch, int value) {
        if (!Ready) return;
        setch(ch, value);
        if (seed != null) seed.WriteLine("I " + ch + " " + value);
    }
    public static void Pulse(int reg, int kind, int n) {
        if (!Ready) return;
        pulse(reg, kind, n);
        if (seed != null) for (int i = 0; i < n; i++) seed.WriteLine("U " + reg + " " + kind);
    }
    public static void Key(int code) {
        if (!Ready) return;
        key(code);
        if (seed != null) { seed.WriteLine("IO 13 " + code); seed.WriteLine("R 5 1"); }
    }
    public static void Radar(int sel, int word) { if (!Ready) return; radarTable[sel & 7] = word; radar(sel & 7, word); }

    // Run count cycles. Returns the outputs in order. outputs[i] = (cycle, channel, value).
    // Error: returns null and sets Status.
    public static int Run(int count, List<long> got) {
        got.Clear();
        if (!Ready) return -1;
        long start = cycle();
        native.Reset(); native.Start();
        int n = run(count);
        native.Stop();
        NativeSeconds += native.Elapsed.TotalSeconds;
        if (n < 0) { Status = n == -2 ? "output queue overflow" : "engine stopped at cycle " + cycle(); Ready = false; return n; }
        int k = outputs(outCycle, outCh, outVal, outCycle.Length);
        for (int i = 0; i < k; i++) { got.Add(outCycle[i]); got.Add(outCh[i]); got.Add(outVal[i]); }
        if (seed != null) {
            long at = start;
            int rq = reqCount();
            for (int i = 0; i < rq; i++) {
                long before = reqCycle(i) - 1;   // the request happens in the first MCT of the next S
                if (before > at) { seed.WriteLine("S " + (before - at)); at = before; }
                seed.WriteLine("RAD " + reqSel(i) + " " + reqWord(i) + " # " + at);
            }
            long end = cycle();
            if (end > at) seed.WriteLine("S " + (end - at) + " # " + at);
            for (int i = 0; i < k; i++) outs.WriteLine(outCycle[i] + "\t" + outCh[i] + "\t" + outVal[i]);
        }
        TotalRadar += reqCount();
        clear();
        TotalCycles += count; TotalOutputs += k;
        return k;
    }

    public static void CloseRecord() {
        if (seed != null) { seed.Flush(); seed.Close(); seed = null; }
        if (outs != null) { outs.Flush(); outs.Close(); outs = null; }
    }
    public static void Flush() { if (seed != null) seed.Flush(); if (outs != null) outs.Flush(); }
}
