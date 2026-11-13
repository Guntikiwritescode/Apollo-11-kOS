/* KSP binding for the pinned yaAGC engine.
 * This file adds an in-game front end to oracle.c without changing it.
 * oracle.c is included unchanged. Two of its names are redirected:
 *   exit() -> ksp_exit(), so a bad input never closes KSP;
 *   main() -> oracle_main(), so the library has no program entry point.
 * Channel outputs are queued in C. Radar words come from a table that the
 * flight script refreshes before every physics step. No call goes from C
 * back into C#.
 */
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <setjmp.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static jmp_buf ksp_jump;
static int ksp_armed;
static int ksp_error;
__attribute__((noreturn)) static void ksp_exit(int code) {
    ksp_error = code ? code : 1;
    if (ksp_armed) longjmp(ksp_jump, 1);
    abort();
}
#define exit(code) ksp_exit(code)
#define main oracle_main
#include "oracle.c"
#undef main
#undef exit

#define KSP_MAX_OUT 65536
static int64_t ksp_out_cycle[KSP_MAX_OUT];
static int ksp_out_ch[KSP_MAX_OUT], ksp_out_val[KSP_MAX_OUT];
static int ksp_out_n, ksp_out_lost;
static int ksp_radar[8];
static uint64_t ksp_radar_requests;

static void ksp_out(int ch, int value) {
    if (ksp_out_n < KSP_MAX_OUT) {
        ksp_out_cycle[ksp_out_n] = (int64_t)cpu.CycleCounter;
        ksp_out_ch[ksp_out_n] = ch;
        ksp_out_val[ksp_out_n] = value;
        ksp_out_n++;
    } else ksp_out_lost++;
}
/* Each radar request in the current queue window, for the flight record. */
#define KSP_MAX_REQ 64
static int64_t ksp_req_cycle[KSP_MAX_REQ];
static int ksp_req_sel[KSP_MAX_REQ], ksp_req_word[KSP_MAX_REQ], ksp_req_n;
static int ksp_radar_word(int sel) {
    int word = ksp_radar[sel & 7];
    ksp_radar_requests++;
    if (ksp_req_n < KSP_MAX_REQ) {
        ksp_req_cycle[ksp_req_n] = (int64_t)cpu.CycleCounter;
        ksp_req_sel[ksp_req_n] = sel; ksp_req_word[ksp_req_n] = word; ksp_req_n++;
    }
    return word;
}

/* Load the rope, then restore a saved state file (oracle.c read_script). */
int agc_ksp_load(const char *rope, const char *state) {
    ksp_error = 0;
    ksp_armed = 1;
    if (setjmp(ksp_jump)) { ksp_armed = 0; return ksp_error ? ksp_error : 1; }
    memset(&cpu, 0, sizeof cpu);
    if (flight_init(rope, 1)) { ksp_armed = 0; return 3; }
    read_script(state, 1);
    flight_callbacks(ksp_out, ksp_radar_word);
    ksp_out_n = 0; ksp_out_lost = 0; ksp_req_n = 0;
    ksp_armed = 0;
    return 0;
}
/* Run count machine cycles. Returns the number of queued outputs, or -1. */
/* Outputs made by pulses or key writes between runs stay in the queue, in order.
 * The caller reads the queue after each run and then calls agc_ksp_clear(). */
int agc_ksp_run(int count) {
    if (count <= 0) return ksp_out_lost ? -2 : ksp_out_n;
    ksp_armed = 1;
    if (setjmp(ksp_jump)) { ksp_armed = 0; return -1; }
    flight_run((uint64_t)count);
    ksp_armed = 0;
    return ksp_out_lost ? -2 : ksp_out_n;
}
void agc_ksp_clear(void) { ksp_out_n = 0; ksp_out_lost = 0; ksp_req_n = 0; }
int agc_ksp_req_count(void) { return ksp_req_n; }
int64_t agc_ksp_req_cycle(int i) { return ksp_req_cycle[i]; }
int agc_ksp_req_sel(int i) { return ksp_req_sel[i]; }
int agc_ksp_req_word(int i) { return ksp_req_word[i]; }
int64_t agc_ksp_out_cycle(int i) { return ksp_out_cycle[i]; }
int agc_ksp_out_ch(int i) { return ksp_out_ch[i]; }
int agc_ksp_out_val(int i) { return ksp_out_val[i]; }
/* Copy the queue into caller arrays in one call. */
int agc_ksp_outputs(int64_t *cycles, int *chans, int *vals, int max) {
    int n = ksp_out_n < max ? ksp_out_n : max;
    memcpy(cycles, ksp_out_cycle, sizeof(int64_t) * (size_t)n);
    memcpy(chans, ksp_out_ch, sizeof(int) * (size_t)n);
    memcpy(vals, ksp_out_val, sizeof(int) * (size_t)n);
    return n;
}
int64_t agc_ksp_cycle(void) { return (int64_t)cpu.CycleCounter; }
int agc_ksp_erasable(int slot) { return (slot >= 0 && slot < 2048) ? flight_erasable()[slot] : -1; }
int agc_ksp_getch(int ch) { return (ch >= 0 && ch < NUM_CHANNELS) ? (uint16_t)cpu.InputChannel[ch] : -1; }
/* Direct input-channel store, as the seed command I and the kOS words[...] set. */
void agc_ksp_setch(int ch, int value) { if (ch >= 0 && ch < NUM_CHANNELS) cpu.InputChannel[ch] = value; }
void agc_ksp_pulse(int reg, int kind, int n) { while (n-- > 0) flight_pulse(reg, kind); }
void agc_ksp_key(int code) { flight_key(code); }
void agc_ksp_radar(int sel, int word) { ksp_radar[sel & 7] = word; }
int agc_ksp_standby(void) { return flight_standby(); }
int agc_ksp_restart(void) { return flight_restart(); }
uint64_t agc_ksp_radar_requests(void) { return ksp_radar_requests; }
/* Test only: the remaining seed commands. */
void agc_ksp_writeio(int ch, int value) { WriteIO(&cpu, ch, value); }
void agc_ksp_irq(int i, int v) { if (i >= 0 && i <= NUM_INTERRUPT_TYPES) cpu.InterruptRequests[i] = v; }
