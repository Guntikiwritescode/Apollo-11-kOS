"""Write the Virtual AGC engine with its private device state exposed.
Usage: make_observable.py /path/to/virtualagc/yaAGC OUTPUT.c"""
import sys
from hashlib import sha256
from pathlib import Path
HERE = Path(__file__).resolve().parent
ENGINE, OUTPUT = Path(sys.argv[1]), Path(sys.argv[2])
for name, digest in {
    "agc_engine.c": "9c59728cdd968503caaaafe50a18ab3ed841f6176da3299c137f3a6a158fcbef",
    "agc_engine.h": "8faf37332826692acbfba6fa211d94439b0868800545e9cda6941454086450c2",
}.items():
    assert sha256((ENGINE / name).read_bytes()).hexdigest() == digest, name
assert sha256((HERE / "Luminary099.bin").read_bytes()).hexdigest() == \
    "1f5326e038de5b741b2f27b01ec949dbd688cf1906994e997402587c8628f40e"
source = (ENGINE / "agc_engine.c").read_text()
old = "  static int CountCDUX = 0, CountCDUY = 0, CountCDUZ = 0;"
assert source.count(old) == 1
source = source.replace(old, "").replace("static int\nBurstOutput", old + "\nstatic int\nBurstOutput")
OUTPUT.write_text(source + '\n#include "private-state.inc"\n')
