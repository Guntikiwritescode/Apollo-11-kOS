/* Quiet observer for the pinned yaAGC. All numbers in files are decimal. */
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "agc_engine.h"

static agc_t cpu;
int DebugMode;
static int is_lm, timed, timed_addr, timed_type, radar_ready, radar_selection, radar_word;
static FILE *outputs, *fresh_events, *positions;
static const char *states;
static uint64_t line_no, seed_offset, steps_left, output_count, event_count;
static void (*out_cb)(int, int);
static int (*radar_cb)(int);
#ifdef PRISTINE
static int load_aux(const char *k, uint64_t v) { (void)k; (void)v; return 0; }
static void load_fifo(int a,int b,int c,int d,uint64_t e) { (void)a;(void)b;(void)c;(void)d;(void)e; }
static void load_count(int a,int b,uint32_t c) { (void)a;(void)b;(void)c; }
#else
extern void dump_aux(FILE *);
extern int load_aux(const char *, uint64_t);
extern void load_fifo(int, int, int, int, uint64_t);
extern void load_count(int, int, uint32_t);
#endif

static void fail(const char *why) {
    fprintf(stderr, "cycle %" PRIu64 " seed line %" PRIu64 ": %s\n", (uint64_t)cpu.CycleCounter, line_no, why);
    exit(2);
}
void ChannelOutput(agc_t *s, int ch, int value) {
    if (ch == 7) s->InputChannel[7] = s->OutputChannel7 = value & 0160;
    if (is_lm && ch == 013 && (value & 0600) == 0600)
        s->Erasable[0][042] = s->Erasable[0][043] = s->Erasable[0][044] = 0;
    output_count++; event_count++;
    if (outputs) fprintf(outputs, "%" PRIu64 "\t%d\t%d\n", (uint64_t)s->CycleCounter, ch, value);
    if (fresh_events)
        fprintf(fresh_events, "%" PRIu64 "\t%s\t%d\t%d\n", (uint64_t)s->CycleCounter,
                ch == 7 ? "channel-bank" : "channel-output", ch, ch == 7 ? value & 0160 : value);
    if (out_cb) out_cb(ch, value);
}
int ChannelInput(agc_t *s) {
    if (!timed) return 0;
    timed = 0;
    UnprogrammedIncrement(s, timed_addr, timed_type);
    return 1;
}
void ChannelRoutine(agc_t *s) { (void)s; }
void RequestRadarData(agc_t *s) {
    int sel = s->InputChannel[013] & 7;
    event_count++;
    if (fresh_events) fprintf(fresh_events, "%" PRIu64 "\tradar-request\t0\t0\n", (uint64_t)s->CycleCounter);
    if (radar_cb) s->Erasable[0][RegRNRAD] = radar_cb(sel);
    else if (radar_ready) {
        if (sel != radar_selection) fail("radar request selected a different word");
        s->Erasable[0][RegRNRAD] = radar_word;
        radar_ready = 0;
    }
}
void ShiftToDeda(agc_t *s, int v) {
    event_count++;
    if (fresh_events) fprintf(fresh_events, "%" PRIu64 "\tdeda-shift\t%d\t0\n", (uint64_t)s->CycleCounter, v);
}
void BacktraceAdd(agc_t *s, int cause) { (void)s; (void)cause; }

static void snapshot(void) {
    char path[PATH_MAX], tmp[PATH_MAX];
    uint64_t cycle = cpu.CycleCounter;
    if (snprintf(path, sizeof path, "%s/%012" PRIu64 ".tsv", states, cycle) >= (int)sizeof path ||
        snprintf(tmp, sizeof tmp, "%s.tmp", path) >= (int)sizeof tmp) fail("state path too long");
    FILE *out = fopen(tmp, "w");
    if (!out) fail("cannot create state file");
    fprintf(out, "SNAP\t%s\t%" PRIu64 "\t%" PRIu64 "\n", cycle ? "STEP" : "INIT", line_no, cycle);
#define FIELD(n, max) fprintf(out, "FIELD\t%s\t%" PRIu64 "\n", #n, (uint64_t)cpu.n & (uint64_t)(max));
#include "fields.inc"
#undef FIELD
    for (int b = 0; b < 8; b++)
        for (int i = 0; i < 256; i++)
            fprintf(out, "E\t%d\t%d\t%u\n", b, i, (uint16_t)cpu.Erasable[b][i]);
    for (int i = 0; i < NUM_CHANNELS; i++) fprintf(out, "I\t%d\t%u\n", i, (uint16_t)cpu.InputChannel[i]);
    for (int i = 0; i <= NUM_INTERRUPT_TYPES; i++) fprintf(out, "R\t%d\t%d\n", i, cpu.InterruptRequests[i]);
    for (int i = 0; i < 16; i++) fprintf(out, "OUT\t%d\t%u\n", i, (uint16_t)cpu.OutputChannel10[i]);
#ifndef PRISTINE
    dump_aux(out);
#endif
    fprintf(positions, "%" PRIu64 "\t%" PRIu64 "\t%" PRIu64 "\t%" PRIu64 "\t%" PRIu64 "\n",
            cycle, seed_offset, steps_left, output_count, event_count);
    if (fclose(out) || rename(tmp, path)) fail("failed publishing state");
}
int flight_init(const char *rope, int lm) {
    is_lm = lm;
    CmOrLm = !lm;
    return agc_engine_init(&cpu, rope, NULL, 0);
}
void flight_callbacks(void (*out)(int, int), int (*radar)(int)) { out_cb = out; radar_cb = radar; }
uint64_t flight_cycles(void) { return cpu.CycleCounter; }
uint16_t *flight_erasable(void) { return (uint16_t *)&cpu.Erasable[0][0]; }
uint16_t *flight_channels(void) { return (uint16_t *)cpu.InputChannel; }
int flight_standby(void) { return cpu.Standby; }
int flight_restart(void) { return cpu.RestartLight; }
void flight_key(int k) { WriteIO(&cpu, 015, k); cpu.InterruptRequests[5] = 1; }
void flight_pulse(int address, int kind) { UnprogrammedIncrement(&cpu, address, kind); }
void flight_run(uint64_t count) {
    while (count--) {
        steps_left = count;
        agc_engine(&cpu);
        if (radar_ready) fail("radar word not requested at recorded cycle");
        if (states && cpu.CycleCounter % 100000 == 0) snapshot();
    }
}
static uint64_t num(const char *word, uint64_t maximum) {
    if (!word || !isdigit((unsigned char)*word)) fail("expected unsigned integer");
    char *end;
    errno = 0;
    uint64_t v = strtoull(word, &end, (strncmp(word, "0x", 2) && strncmp(word, "0X", 2)) ? 10 : 16);
    if (errno || *end || v > maximum) fail("invalid integer");
    return v;
}
static void scalar(const char *name, const char *word) {
#define FIELD(n, max) if (!strcmp(#n, name)) { cpu.n = num(word, max); return; }
#include "fields.inc"
#undef FIELD
    fail("unknown field");
}
static void apply(char **w, unsigned length, int restoring) {
#define OP(name, n) (!strcmp(w[0], name) && length == n)
    if (OP("S",2)) {
        uint64_t n = num(w[1], 1000000);
        if (!n) fail("step count must be positive");
        flight_run(n);
    } else if (OP("SET",3) || OP("FIELD",3)) scalar(w[1], w[2]);
    else if (OP("E",4)) cpu.Erasable[num(w[1],7)][num(w[2],255)] = num(w[3],65535);
    else if (OP("I",3)) cpu.InputChannel[num(w[1],NUM_CHANNELS-1)] = num(w[2],65535);
    else if (OP("R",3)) {
        int i = num(w[1], NUM_INTERRUPT_TYPES);
        cpu.InterruptRequests[i] = num(w[2], i ? 1 : NUM_INTERRUPT_TYPES);
    } else if (OP("O",3) || OP("OUT",3)) cpu.OutputChannel10[num(w[1],15)] = num(w[2],65535);
    else if (OP("IO",3)) WriteIO(&cpu, num(w[1],NUM_CHANNELS-1), num(w[2],077777));
    else if (OP("U",3) || OP("T",3)) {
        int a = num(w[1],0177), kind = num(w[2],0177);
        if (kind > 6 && kind != 021 && kind != 023) fail("unknown pulse type");
        if (!strcmp(w[0],"T")) {
            timed = 1; timed_addr = a; timed_type = kind; flight_run(1);
            if (timed) fail("unaccepted timed input");
        } else flight_pulse(a, kind);
    } else if (OP("W",4)) {
        if (cpu.CheckParity) fail("W with parity checking");
        cpu.Fixed[num(w[1],39)][num(w[2],1023)] = num(w[3],077777);
    } else if (OP("RAD",3)) {
        if (radar_ready) fail("overlapping radar inputs");
        radar_selection = num(w[1],7); radar_word = num(w[2],077777); radar_ready = 1;
    } else if (OP("SAVE",1) && !restoring) snapshot();
    else if (restoring && OP("X",3)) {
        if (!load_aux(w[1],num(w[2],UINT64_MAX))) fail("unknown private scalar");
    } else if (restoring && OP("FIFO",6))
        load_fifo(num(w[1],2),num(w[2],127),num(w[3],128),num(w[4],2),num(w[5],UINT64_MAX));
    else if (restoring && OP("COUNT",4)) load_count(num(w[1],2),num(w[2],127),num(w[3],UINT32_MAX));
    else if (restoring && OP("POS",5)) {
        output_count = num(w[3],UINT64_MAX);
        event_count = num(w[4],UINT64_MAX);
    }
    else if (!(restoring && OP("SNAP",4))) fail("bad seed command");
}
static void read_script(const char *path, int restoring) {
    FILE *f = fopen(path, "r");
    if (!f) fail("cannot open input");
    char *line = NULL;
    size_t size = 0;
    ssize_t bytes;
    while ((bytes = getline(&line, &size, f)) >= 0) {
        line_no++;
        if (!restoring) seed_offset += (uint64_t)bytes;
        char *comment = strchr(line,'#');
        if (comment) *comment = 0;
        char *words[6], *ctx, *w = strtok_r(line, " \t\r\n", &ctx);
        unsigned n = 0;
        while (w) {
            if (n == 6) fail("too many tokens");
            words[n++] = w;
            w = strtok_r(NULL, " \t\r\n", &ctx);
        }
        if (n) apply(words,n,restoring);
    }
    if (ferror(f)) fail("input read failed");
    free(line); fclose(f);
}
int main(int argc, char **argv) {
    if (argc > 1 && !strcmp(argv[1],"--quiet")) { argc--; argv++; }
#ifdef PRISTINE
    if (argc == 8) fail("pristine archive cannot restore private device state");
#endif
    if ((argc != 7 && argc != 8) || (strcmp(argv[3],"Comanche055") && strcmp(argv[3],"Luminary099"))) {
        fputs("usage: oracle [--quiet] ROPE SEED PROGRAM STATE_DIR OUTPUTS EVENTS [START_STATE]\n", stderr);
        return 2;
    }
    if (flight_init(argv[1], !strcmp(argv[3],"Luminary099"))) fail("rope initialization failed");
    states = argv[4];
    outputs = fopen(argv[5],"w"); fresh_events = fopen(argv[6],"w");
    if (!outputs || !fresh_events) fail("cannot create outputs");
    char idx[PATH_MAX];
    if (snprintf(idx, sizeof idx, "%s/positions.idx", states) >= (int)sizeof idx) fail("path too long");
    positions = fopen(idx, "w");
    if (!positions) fail("cannot create checkpoint positions");
    if (argc == 8) read_script(argv[7],1);
    line_no = 0;
    snapshot(); read_script(argv[2],0);
    if (radar_ready) fail("unused radar input");
    if (cpu.CycleCounter % 100000) snapshot();
    if (fclose(outputs) || fclose(fresh_events) || fclose(positions)) fail("output write failed");
    printf("completed %" PRIu64 " cycles\n", (uint64_t)cpu.CycleCounter);
    return 0;
}
