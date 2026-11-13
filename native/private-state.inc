#include <string.h>
#include <inttypes.h>
#define AUX_SCALARS(F) F(CduChecker) F(GyroCount) F(OldChannel14) F(GyroTimer) \
    F(ImuCduCount) F(ImuChannel14) F(CountCDUX) F(CountCDUY) F(CountCDUZ)
void dump_aux(FILE *fp) {
#define SHOW(field) fprintf(fp, "X\t%s\t%" PRIu64 "\n", #field, (uint64_t)field);
    AUX_SCALARS(SHOW)
#undef SHOW
    for (int i = 0; i < NUM_CDU_FIFOS; i++) {
        CduFifo_t *q = &CduFifos[i];
        fprintf(fp, "FIFO\t%d\t%d\t%d\t%d\t%" PRIu64 "\n", i, q->Ptr, q->Size, q->IntervalType, q->NextUpdate);
        for (int j = 0; j < MAX_CDU_FIFO_ENTRIES; j++)
            if (q->Counts[j]) fprintf(fp, "COUNT\t%d\t%d\t%u\n", i, j, (uint32_t)q->Counts[j]);
    }
}
int load_aux(const char *name, uint64_t value) {
#define LOAD(field) if (!strcmp(name, #field)) { field = value; return 1; }
    AUX_SCALARS(LOAD)
#undef LOAD
    return 0;
}
void load_fifo(int i, int ptr, int size, int interval, uint64_t next) {
    CduFifo_t *q = &CduFifos[i];
    q->Ptr = ptr; q->Size = size; q->IntervalType = interval; q->NextUpdate = next;
}
void load_count(int i, int j, uint32_t value) { CduFifos[i].Counts[j] = value; }
