# builds compiler/ir from the Apollo 11 source and what yaYUL makes of it
# needs these in compiler/inputs/:
#   Apollo-11-master.zip          github.com/chrislgarry/Apollo-11
#   virtualagc/                   github.com/virtualagc/virtualagc at 3351d115
#   Comanche055/, Luminary099/    MAIN.agc.bin, MAIN.agc.symtab and listing.txt from yaYUL
import argparse
from collections import Counter, defaultdict
import gzip
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import zipfile
from tempfile import TemporaryDirectory

COMPILER = Path(__file__).resolve().parent
PROJECT = COMPILER.parent
INPUTS = COMPILER / "inputs"
PROGRAMS = ("Comanche055", "Luminary099")
EXPECTED = {"Comanche055": (85, 65348, 36504), "Luminary099": (90, 64838, 36539)}
ROOT_VECTORS = {0o4000: "restart", **{0o4000+4*n: f"interrupt-{n}" for n in range(1, 11)}}
EXTENDED_NAMES = set("READ WRITE RAND WAND ROR WOR RXOR EDRUPT DV BZF MSU QXCH AUG DIM DCA DCS DCOM SU BZMF MP SQUARE ZQ".split())
BASIC_NAMES = set("TC TCR TCF RETURN CCS DAS DDOUBL LXCH ZL INCR ADS CA CAE CAF CS COM DXCH DTCB DTCF TS OVSK TCAA XCH AD DOUBLE MASK EXTEND INHINT RELINT XLQ XXALQ NOOP".split())
AMBIGUOUS_MODE_NAMES = {"INDEX", "NDX", "RESUME"}
SOURCE_ALIASES = {
    "COM": "CS", "DCOM": "DCS", "DTCB": "DXCH", "DTCF": "DXCH",
    "RETURN": "TC", "TCR": "TC", "XLQ": "TC", "XXALQ": "TC",
    "ZL": "LXCH", "ZQ": "QXCH", "OVSK": "TS", "TCAA": "TS", "NOOP": "TCF",
    "DOUBLE": "AD", "DDOUBL": "DAS", "SQUARE": "MP", "CAF": "CA", "CAE": "CA", "NDX": "INDEX",
}
ADDRESS_FIELDS = "invalid constant address sreg erasable fixed unbanked banked eb fb super overflow value syllable".split()
BREAK_AFTER = set("TC TCF CCS EXTEND RELINT INHINT INDEX RESUME EDRUPT BZF BZMF TS XCH DXCH".split())
ARTIFACTS = ("source", "fixed", "symbols", "asm-lines", "units")


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def jsonl(path):
    with path.open() as file:
        return [json.loads(line) for line in file]


def emit(out, name, records):
    # no timestamp or name in the gzip header so every run gives the same bytes
    with (out / (name + ".jsonl.gz")).open("wb") as stream:
        with gzip.GzipFile(filename="", mode="wb", fileobj=stream, mtime=0) as zipped:
            for row in records:
                zipped.write((json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n").encode())


def physical_slot(address):
    effective = address["sreg"]
    if address["invalid"] or not address["address"] or address["constant"]:
        return None
    if address["fixed"]:
        bank = address["fb"] + 8 * address["super"] if address["banked"] else 2 if effective < 0o6000 else 3
        return 2048 + bank * 1024 + effective % 1024
    if address["erasable"]:
        return address["eb"] * 256 + effective % 256 if address["banked"] else effective
    return None


def read_symbol_table(reader, symtab):
    raw = subprocess.check_output([reader, symtab], text=True)
    header, *lines = raw.splitlines()
    marker, n_symbols, n_lines = header.split("\t")
    assert marker == "header"
    symbols, asm_lines = [], []
    for row in lines:
        fields = row.split("\t")
        if fields[0] == "symbol":
            _, name, kind, source, line, *values = fields
            record = {"name": name, "symbol_type": int(kind)}
            target = symbols
        else:
            _, source, line, *values = fields
            record = {}
            target = asm_lines
        assert len(values) == len(ADDRESS_FIELDS)
        address = dict(zip(ADDRESS_FIELDS, map(int, values), strict=True))
        slot = physical_slot(address)
        target.append({**record, "source": source, "line": int(line), "address": address, "slot": slot})
    assert (len(symbols), len(asm_lines)) == (int(n_symbols), int(n_lines))
    return symbols, asm_lines


def timing_tables(engine):
    tables = []
    for name in ("InstructionTiming", "ExtracodeTiming"):
        table = engine.split(name + "[32]")[1].split("{", 1)[1].split("}", 1)[0]
        values = [1 + int(word) for word in re.findall(r"\d+", re.sub(r"//[^\n]*", "", table))]
        assert len(values) == 32
        tables.append(values)
    return tables


def decode_fields(opcode, word, mode):
    if opcode in ("READ", "WRITE", "RAND", "WAND", "ROR", "WOR", "RXOR", "EDRUPT"):
        width = 9
    elif opcode in ("CCS", "DAS", "LXCH", "INCR", "ADS", "DXCH", "TS", "XCH", "DV", "MSU", "QXCH", "AUG", "DIM", "SU") or opcode in ("INDEX", "RESUME") and mode == "normal":
        width = 10
    else:
        width = 12
    operand = word % (1 << width)
    dynamic = []
    if opcode == "INDEX":
        dynamic.append("indexed-word-at-next-fetch")
    if opcode == "EXTEND":
        dynamic.append("extracode-latch-at-next-fetch")
    if opcode == "RESUME":
        dynamic.append("saved-brupt-substitution")
    if opcode == "TC" and operand < 1024:
        dynamic.append("register-or-erasable-fetch")
    if opcode in ("BZF", "BZMF", "EDRUPT", "RELINT", "INHINT"):
        dynamic.append("branch-transient-or-irq-timing")
    if opcode in ("TS", "XCH", "LXCH", "QXCH") and operand == 5 or opcode in ("DXCH", "DAS") and operand in (5, 6):
        dynamic.append("possible-z-alias-write")
    if opcode in ("DCA", "DCS", "DXCH", "DAS"):
        dynamic.append("ordered-paired-addressing")
    if opcode in ("READ", "WRITE", "RAND", "WAND", "ROR", "WOR", "RXOR"):
        dynamic.append("channel-alias-or-external-event")
    return {"operation": opcode, "operand_width": width, "operand": operand,
            "dynamic_requirements": dynamic}


def kind_mode(row):
    kind = row["kind"]
    if kind not in ("basic", "basic-alias", "numeric-order"):
        return None
    op = row["source_operator"]
    if op in EXTENDED_NAMES:
        return "extended"
    if op in BASIC_NAMES:
        return "normal"
    assert op in AMBIGUOUS_MODE_NAMES or kind == "numeric-order", (op, row)
    if op in AMBIGUOUS_MODE_NAMES and row.get("lexical_predecessor_order") == "EXTEND":
        return "extended"
    return None


def static_successors(mode, row, address):
    if mode is None:
        return []
    d = row["decode"][mode]
    op, operand = d["operation"], d["operand"]
    fallthrough = (address + 1) % 4096
    if op in ("TC", "TCF"):
        return [("transfer", operand)]
    if op == "CCS":
        return [(f"skip-{n}", (fallthrough+n) % 4096) for n in range(4)]
    if op in ("BZF", "BZMF"):
        return [("fallthrough", fallthrough), ("taken", operand)]
    if op in ("RESUME", "EDRUPT") or "possible-z-alias-write" in d["dynamic_requirements"]:
        return []
    if op == "TS":
        return [("fallthrough", fallthrough), ("overflow-skip", (fallthrough+1) % 4096)]
    return [("fallthrough", fallthrough)]


def unit_plan(words, symbols, potential_entries):
    units = []
    active = None
    for row in words:
        name = row.get("source") or "<unlisted-rope>"
        bank, slot = row["bank"], row["slot"]
        if active is None or (name, bank) != (active["source"], active["bank"]):
            active = {"source": name, "bank": bank, "first_slot": slot, "last_slot": slot, "split_slots": [slot]}
            units.append(active)
        else:
            active["last_slot"] = slot
            if slot in potential_entries or symbols.get(slot):
                active["split_slots"].append(slot)
    assert sum(u["last_slot"]-u["first_slot"]+1 for u in units) == 36864
    return units


def build_program(out, intermediate, reader, program, tables):
    words = jsonl(intermediate / f"{program}.fixed.jsonl")
    sources = jsonl(intermediate / f"{program}.source.jsonl")
    lines = {(r["source"], r["line"]): r for r in sources}
    original_files = defaultdict(list)
    for source in sources:
        original_files[source["source"]].append(source["text"])
    assert (len(original_files), len(sources), sum("source" in r for r in words)) == EXPECTED[program]
    with zipfile.ZipFile(INPUTS / "Apollo-11-master.zip") as archive:
        original_names = {n.rsplit("/", 1)[1]: n for n in archive.namelist() if re.search(fr"/{program}/[^/]+\.agc$", n)}
        assert original_files.keys() == original_names.keys()
        for name, source_lines in original_files.items():
            assert "".join(source_lines).encode() == archive.read(original_names[name]), name

    by_slot = {r["slot"]: r for r in words}
    assert len(by_slot) == 36864
    rope_path = INPUTS / program / "MAIN.agc.bin"
    physical_words = [None] * 36864
    for row in words:
        bank = row["bank"]
        block = {0: 2, 1: 3, 2: 0, 3: 1}.get(bank, bank)
        physical_words[1024 * block + row["offset"]] = row["physical_word"].to_bytes(2, "big")
    assert b"".join(physical_words) == rope_path.read_bytes()
    asm_symtab = rope_path.with_suffix(".symtab")
    symbols, asm_lines = read_symbol_table(reader, asm_symtab)
    aliases = defaultdict(list)
    for symbol in symbols:
        slot = symbol["slot"]
        if slot is not None:
            aliases[slot].append(symbol["name"])
    assembler_disagreement = []
    for item in asm_lines:
        listing = by_slot.get(item["slot"], {})
        listed = (listing.get("source"), listing.get("line"))
        assembled = (item["source"], item["line"])
        item["listing_match"] = listed == assembled
        if not item["listing_match"]:
            assembler_disagreement.append({"slot": item["slot"], "listing": listed, "assembler": assembled})

    counts = Counter()
    counts_by_family = Counter()
    dynamic_counts = Counter()
    entries = set()
    for row in words:
        word = row["word"]
        mode_decodes = {}
        for i, mode in enumerate(("normal", "extended")):
            assert tables[i][word >> 10] == row[mode + "_base_mct"]
            mode_decodes[mode] = decode_fields(row[mode], word, mode)
            mode_decodes[mode]["base_mct"] = tables[i][word >> 10]
        row["decode"] = mode_decodes
        mode = kind_mode(row)
        row["source_mode_hint"] = mode
        source_op = row.get("source_operator")
        row["source_family_hint"] = SOURCE_ALIASES.get(source_op, source_op) if row["kind"] in ("basic", "basic-alias") else None
        lexical_index = row.get("lexical_predecessor_order") in ("INDEX", "NDX")
        family_conflict = mode is not None and row["source_family_hint"] != mode_decodes[mode]["operation"]
        if family_conflict and row["source_family_hint"] == "TC" and word in (3, 4, 6):
            # TC 3, 4 and 6 are really RELINT, INHINT and EXTEND
            row["source_family_hint"] = mode_decodes[mode]["operation"]
            family_conflict = False
        if family_conflict:
            counts["source-word-family-mismatch"] += 1
        if lexical_index:
            counts["lexical-index-followers"] += 1
        row["recipe"] = {
            "mode": mode,
            "family": row["source_family_hint"],
            "indexed": lexical_index,
            "encoded_family_matches_source": None if mode is None else not family_conflict,
        } if row["kind"] in ("basic", "basic-alias", "numeric-order") else None
        row["symbol_aliases"] = aliases.get(row["slot"], [])
        row["execution_addresses"] = [1024 + row["offset"]]
        if row["bank"] in (2, 3):
            row["execution_addresses"].append(row["bank"] * 1024 + row["offset"])
        if "source" in row:
            key = row["source"], row["line"]
            assert row["slot"] in lines[key]["fixed_slots"]
            row["source_text"] = lines[key]["text"]
        if mode is not None:
            counts_by_family[(mode, row["source_family_hint"])] += 1
            if not family_conflict and not lexical_index:
                dynamic_counts.update(mode_decodes[mode]["dynamic_requirements"])
        if source_op in ("INDEX", "NDX"):
            dynamic_counts["source-index-orders"] += 1
        if source_op == "RESUME":
            dynamic_counts["source-resume-orders"] += 1
        if source_op in ("STCALL", "STODL", "STOVL", "STODL*", "STOVL*", "STORE"):
            dynamic_counts["source-packed-stores"] += 1
        row["lexical_successors"] = {}
        for address in row["execution_addresses"]:
            transitions = [] if lexical_index or family_conflict else static_successors(mode, row, address)
            if transitions:
                row["lexical_successors"][str(address)] = transitions
            for reason, target in transitions:
                if reason == "fallthrough" and mode_decodes[mode]["operation"] not in BREAK_AFTER:
                    continue
                if 1024 <= target < 2048 and address < 2048:
                    entries.add(2048 + row["bank"] * 1024 + target % 1024)
                if target >= 2048:
                    entries.add(target + 2048)
        effective = row["bank"] * 1024 + row["offset"]
        if row["bank"] in (2, 3) and effective in ROOT_VECTORS:
            row["root_class"] = ROOT_VECTORS[effective]
            assert row["kind"] in ("basic", "basic-alias")
            entries.add(row["slot"])
            counts["hardware-roots"] += 1
        counts[row["kind"]] += 1
        counts["source-mode-" + (mode or "unknown")] += 1
    assert counts["hardware-roots"] == 11
    for source in sources:
        for slot in source["fixed_slots"]:
            assert by_slot[slot]["source"] == source["source"] and by_slot[slot]["line"] == source["line"]
    units = unit_plan(words, aliases, entries)
    for name, records in zip(ARTIFACTS, (sources, words, symbols, asm_lines, units), strict=True):
        emit(out, f"{program}.{name}", records)
    summary = {
        "program": program, "source_files": len(original_files), "source_lines": len(sources),
        "counts": counts, "nominal_source_families": {f"{m}:{op}": n for (m, op), n in counts_by_family.items()},
        "dynamic_requirements": dynamic_counts, "symbols": len(symbols), "assembler_lines": len(asm_lines),
        "assembler_line_disagreements": assembler_disagreement,
        "owning_unit_fragments": len(units), "split_points": sum(len(u["split_slots"]) for u in units),
        "rope_sha256": sha(rope_path), "symtab_sha256": sha(asm_symtab),
        "listing_sha256": sha(INPUTS / program / "listing.txt"),
        "source_archive_sha256": sha(INPUTS / "Apollo-11-master.zip"),
    }
    (out / f"{program}.summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(program, len(original_files), len(sources), len(words), "symbols", len(symbols),
          "assembler lines", len(asm_lines), "line mismatches", len(assembler_disagreement), "unit fragments", len(units))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("output", type=Path, help="new directory")
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(exist_ok=False)
    engine = INPUTS / "virtualagc/yaAGC/agc_engine.c"
    tables = timing_tables(engine.read_text())
    with TemporaryDirectory(prefix="apollo-source-ir-") as scratch_name:
        scratch = Path(scratch_name)
        subprocess.run([sys.executable, COMPILER / "sources.py", scratch / "manifest"], check=True)
        subprocess.run(["cc", "-std=c11", "-I", INPUTS / "virtualagc/yaYUL", COMPILER / "read_symtab.c", "-o", scratch / "read_symtab"], check=True)
        for program in PROGRAMS:
            build_program(out, scratch / "manifest", scratch / "read_symtab", program, tables)


if __name__ == "__main__":
    main()
