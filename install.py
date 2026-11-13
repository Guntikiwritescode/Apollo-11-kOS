"""Copy the flight files into a KSP install.  Usage: python3 install.py /path/to/KSP"""
import shutil
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
KSP = Path(sys.argv[1])
SCRIPT = KSP / "Ships/Script"
KOS = HERE / "kos"
CORE = ("agc_sp agc_logic agc_address agc_edit agc_store agc_timers agc_channel33 agc_dp "
        "agc_single_precision_subroutines agc_core_bus_v2 agc_core_control single_word "
        "agc_core_paired channel-write instructions agc_core_timed agc_core_dispatch "
        "agc_core_imu providers segment agc_core_cold_start segment_keys").split()


def copy(source, target):
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(source, target)


def write(target, text):
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(text)


# Luminary099, the wiring and the boot files.
program = KOS / "Luminary099"
units = ["registry"] + [f"{folder}/{path.stem}" for folder in ("rope", "source")
                        for path in sorted((program / folder).glob("*.ks"))]
for unit in units:
    copy(program / f"{unit}.ks", SCRIPT / f"{unit}.ks")
for path in (KOS / "wiring").glob("*.ks"):
    copy(path, SCRIPT / "wiring" / path.name)
flight = KOS / "flight"
for path in (flight / "boot").glob("*.ks"):
    copy(path, SCRIPT / "boot" / path.name)

# The converted program is compiled once inside kOS: runpath("0:/compile.ks").
write(SCRIPT / "compile.ks", "".join(f'compile "0:/{unit}.ks" to "0:/{unit}.ksm".\n' for unit in units))

# KerboScript computer. Its parts share file-level names, so they load as one file.
landing = SCRIPT / "apollo-landing"
core = "\n".join((KOS / "core" / f"{name}.ks").read_text() for name in CORE)
write(landing / "runtime.ks", "\n".join([core, "", (flight / "rope.ks").read_text(),
                                         (flight / "flight.ks").read_text(), "",
                                         (flight / "resume.ks").read_text()]))
rope = (HERE / "native/Luminary099.bin").read_bytes()
rope = rope[4096:8192] + rope[:4096] + rope[8192:]
write(landing / "rope.txt", ",".join(str(int.from_bytes(rope[i:i + 2], "big") >> 1) for i in range(0, len(rope), 2)))
write(landing / "load.ks", "\n".join(
    ["set config:clobberbuiltins to true.", 'runpath("0:/wiring/loader.ks").',
     *(f'runpath("0:/{unit}.ksm").' for unit in units), (KOS / "core/fast.ks").read_text(),
     'runpath("0:/apollo-landing/p65.ks").', 'runpath("0:/apollo-landing/runtime.ks").']) + "\n")
copy(flight / "p65.ks", landing / "p65.ks")

# Native computer.
native = SCRIPT / "apollo-native"
copy(flight / "load-native.ks", native / "load.ks")
copy(flight / "runtime-native.ks", native / "runtime-native.ks")
copy(flight / "orbit.ks", native / "orbit.ks")
for name in ("Luminary099.bin", "orbit.tsv", "p65-000106213702.tsv"):
    copy(HERE / "native" / name, KSP / "GameData/ApolloNativeAGC/PluginData" / name)

# Mun, lander parts and saves.
for name in ("Mun.cfg", "Vehicle.cfg"):
    copy(HERE / "ksp" / name, KSP / "GameData/ApolloLanding" / name)
for save in (HERE / "ksp/saves").iterdir():
    for name in ("entry.sfs", "persistent.sfs"):
        copy(save / "entry.sfs", KSP / "saves" / save.name / name)
