"""Read the words of a yaYUL listing and check them against the rope."""
from collections import Counter
from pathlib import Path
import re
import sys

INPUTS = Path(__file__).resolve().parent / "inputs"
ROW = re.compile(r"^\d+,(\d+):\s+((?:[0-7]{2},)?[0-7]{4})(?=\s|$)")
WORD = re.compile(r"[0-7]{5}")
INCLUDE = re.compile(r"^\d+,\d+: \$(\S+\.agc)")

PROGRAMS = ("Comanche055", "Luminary099")


def checked_words(program):
    listing = INPUTS / program / "listing.txt"
    rope = (INPUTS / program / "MAIN.agc.bin").read_bytes()
    source = "MAIN.agc"
    for row in listing.read_text().splitlines():
        if include := INCLUDE.match(row):
            source = include[1]
        elif row.startswith("(End of include-file"):
            source = "MAIN.agc"
        elif match := ROW.match(row):
            line, location = match.groups()
            first, second = row[33:38], row[39:44]
            if not WORD.fullmatch(first):
                continue
            if second.strip() and not WORD.fullmatch(second):
                raise ValueError((program, source, line, location, second))
            parts = location.split(",")
            address = int(parts[-1], 8)
            if len(parts) == 1 and address < 0o4000:
                continue
            bank = int(parts[0], 8) if len(parts) == 2 else 2 if address < 0o6000 else 3
            block = {0: 2, 1: 3, 2: 0, 3: 1}.get(bank, bank)
            for offset, word in enumerate(filter(WORD.fullmatch, (first, second))):
                index = 2 * (1024 * block + address % 1024 + offset)
                if index >= len(rope) or int.from_bytes(rope[index:index+2], "big") >> 1 != int(word, 8):
                    raise ValueError((program, source, line, location, word))
                yield source, int(line), bank, address + offset, int(word, 8), row[65:74].strip(), offset


if __name__ == "__main__":
    for program in PROGRAMS:
        counts = Counter(op or "<bare>" for _, _, _, _, _, op, _ in checked_words(program))
        print(program, {"verified": counts.total()})
        if sys.argv[1:] == ["--operations"]:
            for op, count in counts.most_common():
                print(program, op, count, sep="\t")
