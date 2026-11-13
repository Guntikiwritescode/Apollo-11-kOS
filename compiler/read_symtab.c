/* Offline reader for the pinned little-endian yaYUL symbol-table ABI. */
#include "yaYUL.h"
#include <stdio.h>
#include <stdlib.h>

static void address(Address_t a)
{
    printf("%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%d\t%d",
        a.Invalid, a.Constant, a.Address, a.SReg, a.Erasable, a.Fixed,
        a.Unbanked, a.Banked, a.EB, a.FB, a.Super, a.Overflow, a.Value, a.Syllable);
}

int main(int argc, char **argv)
{
    if (argc != 2) return EXIT_FAILURE;
    FILE *in = fopen(argv[1], "rb");
    if (!in) return EXIT_FAILURE;
    SymbolFile_t header;
    if (fread(&header, sizeof header, 1, in) != 1 ||
        header.NumberSymbols < 1 || header.NumberSymbols > 100000 ||
        header.NumberLines < 1 || header.NumberLines > 100000)
        return EXIT_FAILURE;
    printf("header\t%d\t%d\n", header.NumberSymbols, header.NumberLines);
    for (int i = 0; i < header.NumberSymbols; i++) {
        Symbol_t s;
        if (fread(&s, sizeof s, 1, in) != 1) return EXIT_FAILURE;
        printf("symbol\t%.*s\t%d\t%.*s\t%u\t", MAX_LABEL_LENGTH + 1, s.Name,
            s.Type, MAX_FILE_LENGTH + 1, s.FileName, s.LineNumber);
        address(s.Value);
        putchar('\n');
    }
    for (int i = 0; i < header.NumberLines; i++) {
        SymbolLine_t l;
        if (fread(&l, sizeof l, 1, in) != 1) return EXIT_FAILURE;
        printf("line\t%.*s\t%u\t", MAX_FILE_LENGTH, l.FileName, l.LineNumber);
        address(l.CodeAddress);
        putchar('\n');
    }
    if (fgetc(in) != EOF || ferror(in)) return EXIT_FAILURE;
    return fclose(in) == 0 ? EXIT_SUCCESS : EXIT_FAILURE;
}
