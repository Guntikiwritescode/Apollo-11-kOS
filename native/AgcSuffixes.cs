// Suffixes of the AGC addon. Shared by the KSP addon and the offline kOS host.
using System;
using System.Collections.Generic;
using kOS.Safe.Encapsulation;
using kOS.Safe.Encapsulation.Suffixes;

public static class AgcSuffixes {
    static readonly List<long> got = new List<long>();
    static int I(Structure s) { return ((ScalarValue)s).GetIntValue(); }
    public static void Register(Action<string, ISuffix> add, Func<string, int> load, Action<string> log) {
        add("LOAD", new OneArgsSuffix<ScalarValue, StringValue>(name => ScalarValue.Create(load(name.ToString()))));
        add("STATUS", new Suffix<StringValue>(() => new StringValue(AgcNative.Status)));
        add("CYCLE", new Suffix<ScalarValue>(() => ScalarValue.Create((double)AgcNative.Cycle)));
        add("STANDBY", new Suffix<BooleanValue>(() => new BooleanValue(AgcNative.Standby)));
        add("RESTART", new Suffix<BooleanValue>(() => new BooleanValue(AgcNative.Restart)));
        add("WALL", new Suffix<ScalarValue>(() => ScalarValue.Create(AgcNative.Wall)));
        add("NATIVESECONDS", new Suffix<ScalarValue>(() => ScalarValue.Create(AgcNative.NativeSeconds)));
        add("TOTALS", new Suffix<StringValue>(() => new StringValue(
            "cycles " + AgcNative.TotalCycles + " outputs " + AgcNative.TotalOutputs + " radar " + AgcNative.TotalRadar)));
        add("ERASABLE", new OneArgsSuffix<ScalarValue, ScalarValue>(s => ScalarValue.Create(AgcNative.Erasable(s.GetIntValue()))));
        add("GETCH", new OneArgsSuffix<ScalarValue, ScalarValue>(c => ScalarValue.Create(AgcNative.GetCh(c.GetIntValue()))));
        add("SETCH", new TwoArgsSuffix<ScalarValue, ScalarValue>((c, v) => AgcNative.SetCh(c.GetIntValue(), v.GetIntValue())));
        add("PULSE", new ThreeArgsSuffix<ScalarValue, ScalarValue, ScalarValue>((r, t, n) => AgcNative.Pulse(r.GetIntValue(), t.GetIntValue(), n.GetIntValue())));
        add("KEY", new OneArgsSuffix<ScalarValue>(k => AgcNative.Key(k.GetIntValue())));
        // RADAR(list of 8 words): the word the radar returns for each selection 0..7.
        add("RADAR", new OneArgsSuffix<ListValue>(l => { for (int i = 0; i < 8 && i < l.Count; i++) AgcNative.Radar(i, I(l[i])); }));
        // WATCH(list of erasable slots): returned by every RUN, after the fixed fields.
        add("WATCH", new OneArgsSuffix<ListValue>(l => {
            var w = new int[l.Count]; for (int i = 0; i < w.Length; i++) w[i] = I(l[i]); AgcNative.Watch = w; }));
        // RUN(n): run n machine cycles. Returns
        //   cycle, ch14, ch30, ch32, ch33, standby, restart, the WATCH words, a count, then
        //   (channel, value, cycle) for each output that the kOS port delivered to wOutput:
        //   channel-output events below channel 28 (channel 7 is the bank latch, not an output).
        add("RUN", new OneArgsSuffix<ListValue, ScalarValue>(n => {
            var r = new ListValue();
            int k = AgcNative.Run(n.GetIntValue(), got);
            if (k < 0) { log(AgcNative.Status); return r; }
            r.Add(ScalarValue.Create((double)AgcNative.Cycle));
            foreach (int ch in new[] {12, 24, 26, 27}) r.Add(ScalarValue.Create(AgcNative.GetCh(ch)));
            r.Add(ScalarValue.Create(AgcNative.Standby ? 1 : 0));
            r.Add(ScalarValue.Create(AgcNative.Restart ? 1 : 0));
            foreach (int slot in AgcNative.Watch) r.Add(ScalarValue.Create(AgcNative.Erasable(slot)));
            int countAt = r.Count; r.Add(ScalarValue.Create(0)); int delivered = 0;
            for (int i = 0; i < k; i++) {
                int ch = (int)got[3 * i + 1];
                if (ch >= 28 || ch == 7) continue;
                r.Add(ScalarValue.Create(ch)); r.Add(ScalarValue.Create((int)got[3 * i + 2]));
                r.Add(ScalarValue.Create((double)got[3 * i])); delivered++;
            }
            r[countAt] = ScalarValue.Create(delivered);
            return r;
        }));
        add("FLUSH", new NoArgsVoidSuffix(() => AgcNative.Flush()));
        add("CLOSE", new NoArgsVoidSuffix(() => AgcNative.CloseRecord()));
    }
}
