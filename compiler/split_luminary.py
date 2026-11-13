# kOS line numbers wrap past 32767, so the biggest Luminary099 file gets split in two
# usage: split_luminary.py OUTPUT_DIRECTORY/Luminary099
from pathlib import Path
import sys

source = Path(sys.argv[1]) / "source/s050.ks"
lines = source.read_text().splitlines(keepends=True)
assert len(lines) == 34864
cut = 17404
assert lines[cut - 1] == ")).\n"
source.with_name("s050b.ks").write_text("".join(lines[cut:]))
source.write_text("".join(lines[:cut]))
