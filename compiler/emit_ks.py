"""Emit source-associated KerboScript bodies and one lossless ROM per program."""
import argparse
from collections import Counter, defaultdict
from dataclasses import dataclass, field
import gzip
import json
from pathlib import Path
import re

from build_ir import COMPILER, PROGRAMS, PROJECT, emit, sha

CORE = PROJECT / "kos/core"
SINGLE = "CA CS AD ADS SU MSU CCS INCR AUG DIM MASK".split()
CONTROL = "TC TCF EXTEND RELINT INHINT INDEX RESUME TS BZF BZMF".split()
CHANNEL = "READ WRITE RAND WAND ROR WOR RXOR".split()
PAIR_EXCHANGE = "DXCH DCA DCS".split()
REGISTER_EXCHANGE = {"XCH": 0, "LXCH": 1, "QXCH": 2}
BODY_SIGNATURE = (
    "words, slot, instruction, extended, checkOnly, "
    "readPhysical, readAdjacent, readEffective, channelAdapter"
)
BLOCK_MAX_ORDERS = 128
SOURCE_MARKER = "// PORT: SOURCE "
UTILITY_PATHS = [CORE / f"agc_{name}.ks" for name in
                 ("sp", "address", "store", "edit", "logic", "dp", "timers",
                  "single_precision_subroutines", "channel33")]
KERNEL_PATHS = [CORE / name for name in (
    "agc_core_bus_v2.ks", "agc_core_control.ks", "single_word.ks",
    "agc_core_paired.ks", "channel-write.ks", "instructions.ks",
)]


def read_ir(folder, program, name):
    with gzip.open(folder / f"{program}.{name}.jsonl.gz", "rt") as file:
        return [json.loads(line) for line in file]


def source_literal(raw):
    return raw.rstrip("\r\n")


def provider_exports(source):
    return {m[1]: " ".join(m[2].split()) for m in re.finditer(
        r"(?m)^function (\w+)\s*\{\s*parameter\s+([^.]*)\.", source)}


def stage_providers(out, snapshot):
    files = []
    exports = {}
    folder = out / "providers"
    folder.mkdir()
    for path, contents in snapshot:
        name = path.name
        destination = folder / name
        destination.write_bytes(contents)
        files.append({"path": f"providers/{name}", "origin": str(path.relative_to(PROJECT)),
                      "sha256": sha(destination)})
        if path in KERNEL_PATHS:
            for fn, signature in provider_exports(contents.decode()).items():
                assert fn not in exports
                exports[fn] = {"path": f"providers/{name}", "parameters": signature}
    required = {f"agcCore{op}" for op in SINGLE} | {
        "agcCoreControlExecute", "agcCoreInheritedTCTransient", "agcCoreMp", "agcCoreDv",
        "agcCoreDas", "agcCoreChannelInstruction", "agcCoreExchange", "agcCoreDoubleExchange",
    }
    assert required <= exports.keys(), sorted(required - exports.keys())
    (out / "provider-exports.json").write_text(json.dumps({"files": files, "exports": exports}, indent=2, sort_keys=True) + "\n")
    return [f["path"] for f in files], exports


def source_modes(row):
    recipe = row["recipe"]
    if recipe is None:
        return (), "fixed-data-or-unproved-fetch"
    family = recipe["family"]
    if family is None:
        return (), "indexed-raw-numeric-order" if row["kind"] == "numeric-order" else "source-order-unresolved"
    if recipe["indexed_operand_resolution"] == "required-at-lexical-index-seam":
        return (), "indexed-word-needs-exact-dynamic-seam"
    if recipe["encoded_family_matches_source"] is False:
        return (), "source/raw-family-conflict"
    if family in ("INDEX", "RESUME"):
        modes = tuple(mode for mode in ("normal", "extended") if row["decode"][mode]["operation"] == family)
    else:
        modes = (recipe["mode"],) if recipe["mode"] else ()
    if not modes:
        return (), "entry-mode-unproved"
    return modes, None


def guard_for(op, address):
    if op in PAIR_EXCHANGE or op == "DAS":
        if address == 0:
            return None, "paired-zero-predecessor-unresolved"
        if address > 3 and address % (256 if address < 1024 else 1024) == 0:
            return None, "paired-physical-bank-boundary-unresolved"
    if op == "DIM":
        return ("dim-zero-edit",) if 16 <= address <= 19 or address >= 768 else (), None
    if op == "MP" and address == 0:
        return ("overflow-square",), None
    return (), None


def mask_runs(mask):
    runs = []
    bit = 0
    while bit < 15:
        if not mask & (1 << bit):
            bit += 1
            continue
        start = bit
        while bit < 15 and mask & (1 << bit):
            bit += 1
        runs.append((1 << start, 1 << (bit - start)))
    return runs


def fixed_read_actions(op, addr, literal):
    read = f"local fixedOperand is mod(readEffective:call(words, {addr}), 32768)."
    if op == "CA":
        return [read, "set words[0] to agcSignExtend(fixedOperand)."]
    if op == "CS":
        return [read, "set words[0] to agcSignExtend(32767 - fixedOperand)."]
    if op == "AD":
        return ["local entryA is words[0].", read,
                "set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand))."]
    assert op == "MASK"
    actions = ["set words[0] to agcOverflowCorrected(words[0]).", read]
    ordinary = "set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand))."
    if literal is None:
        return actions + [ordinary]
    terms = [f"mod(floor(words[0] / {offset}), {width}) * {offset}" for offset, width in mask_runs(literal)]
    actions.extend([f"if fixedOperand = {literal} {{",
                    "    set words[0] to agcSignExtend(" + (" + ".join(terms) or "0") + ").",
                    "} else {", "    " + ordinary, "}"])
    return actions


def form(mode, descriptor, raw, rows):
    op = descriptor["operation"]
    addr = descriptor["operand"]
    if op == "EDRUPT":
        return None, "special-admission-and-hardware-timing-unresolved"
    if op == "RESUME" and mode == "extended":
        return None, "native-extended-resume-hardware-conflict"
    guard, refusal = guard_for(op, addr)
    if refusal:
        return None, refusal
    proof_notes = []
    if op in ("BZF", "BZMF"):
        proof_notes.append("native-body-only; hardware STD2 timing/side effects open")
    if guard:
        proof_notes.extend(guard)
    if op in CHANNEL:
        proof_notes.append("real channel adapter and original device effects required")

    transient = "true" if op in ("CS", "XCH", "DXCH") else "inheritedTransient"
    actions = []
    if op in CONTROL:
        actions = [f"return agcCoreControlExecute(words, {raw}, words[0], readEffective)."]
    else:
        if op in SINGLE:
            if addr >= 1024:
                assert op in ("CA", "CS", "AD", "MASK")
                literal = rows[2048 + addr]["word"] if addr >= 2048 and op == "MASK" else None
                actions.extend(fixed_read_actions(op, addr, literal))
                proof_notes.append("original fixed bus access order; real parity/presence provider required")
                if literal is not None:
                    proof_notes.append("arithmetic mask inlining guarded by actual raw fixed value")
            else:
                actions.append(f"agcCore{op}(words, {addr}).")
        elif op == "MP" or op == "DV":
            name = "Mp" if op == "MP" else "Dv"
            if op == "DV" and addr in (0, 1, 2, 5):
                actions.append(f"agcCore{name}(words, {addr}, words[{addr}]).")
            else:
                actions.append(f"agcCore{name}(words, {addr}, readEffective:call(words, {addr})).")
        elif op == "DAS":
            actions.append(f"if not agcCoreDas(words, {addr}) {{ return -1. }}")
        elif op in REGISTER_EXCHANGE:
            actions.append(f"agcCoreExchange(words, {REGISTER_EXCHANGE[op]}, {addr}, readPhysical).")
        elif op in PAIR_EXCHANGE:
            actions.append(f'if not agcCoreDoubleExchange(words, "{op}", {addr}, readPhysical, readAdjacent) {{ return -1. }}')
        elif op in CHANNEL:
            actions.append(f"agcCoreChannelInstruction(words, {CHANNEL.index(op)}, {addr}, channelAdapter).")
        else:
            raise AssertionError(op)
        if transient == "inheritedTransient":
            actions.insert(0, "local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).")
        actions.append(f"return list(false, false, {transient}, false, false).")
    return {"mode": mode, "operation": op, "operand": addr, "guard": guard,
            "notes": proof_notes, "actions": actions}, None


@dataclass
class Unit:
    number: int
    source: str
    bank: int
    first: int
    last: int
    direct_slots: list[int] = field(default_factory=list)
    annotations: dict = field(default_factory=lambda: defaultdict(list))
    route_last: int | None = None

    @property
    def name(self):
        return f"agcAotUnit{self.number}"


class FileText:
    def __init__(self):
        self.lines = []

    def add(self, line="", level=0):
        self.lines.append("    " * level + line)
        return len(self.lines)

    def write(self, path):
        path.write_text("\n".join(self.lines) + "\n")


def emit_source_lines(text, rows, level, generated, provenance):
    for row in rows:
        location = text.add(SOURCE_MARKER + f'{row["source"]}:{row["line"]}')
        text.add("//" + source_literal(row["text"]))
        assert (row["source"], row["line"]) not in provenance
        provenance[row["source"], row["line"]] = {
            "source": row["source"], "line": row["line"], "generated": generated,
            "marker_line": location, "text_line": location + 1, "fixed_slots": row["fixed_slots"],
            "original_line_ending": row["text"][len(source_literal(row["text"])):],
        }
        if row["fixed_slots"]:
            text.add("// PORT: Fixed ROM slots " + " ".join(map(str, row["fixed_slots"])) + ".")


def branch_tree(text, items, level, pivot, leaf):
    if len(items) == 1:
        leaf(items[0], level)
        return
    middle = len(items) // 2
    text.add(f"if slot <= {pivot(items[middle - 1])} {{", level)
    branch_tree(text, items[:middle], level + 1, pivot, leaf)
    text.add("} else {", level)
    branch_tree(text, items[middle:], level + 1, pivot, leaf)
    text.add("}", level)


def emit_unit(text, unit, plans, rows, generated, provenance):
    assert unit.direct_slots
    text.add(f"// PORT: Physical bank {unit.bank:02o}. Shared continuation entries, slots {unit.first}–{unit.last}.")
    text.add(f"function {unit.name} {{")
    text.add(f"parameter {BODY_SIGNATURE}.", 1)

    def leaf(slot, depth):
        row = rows[slot]
        plan = plans[slot]
        emit_source_lines(text, unit.annotations[slot], depth, generated, provenance)
        text.add(f"if slot <> {slot} or instruction <> {row['word']} {{ return choose false if checkOnly else -1. }}", depth)
        plan["generated_entry"] = {"path": generated, "function": unit.name, "line": len(text.lines)}
        for case in plan["direct_modes"]:
            if case["mode"] == "extended":
                text.add("if extended {", depth)
            else:
                text.add("if not extended {", depth)
            for guard in case["guard"]:
                if guard == "overflow-square":
                    text.add('if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }', depth + 1)
                elif guard == "dim-zero-edit":
                    addr = case["operand"]
                    text.add(f'local operandSlot is agcAddressSlot({addr}, words[3], words[4], words["channel7"]).', depth + 1)
                    text.add("if operandSlot >= 16 and operandSlot <= 19 and", depth + 1)
                    text.add("(words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }", depth + 2)
                else:
                    raise AssertionError(guard)
            text.add("if checkOnly { return true. }", depth + 1)
            for action in case["actions"]:
                text.add(action, depth + 1)
            text.add("}", depth)
        text.add("return choose false if checkOnly else -1.", depth)

    branch_tree(text, unit.direct_slots, 1, lambda slot: slot, leaf)
    text.add("}")
    text.add(f"set agcAotRoutes[{unit.number}] to {unit.name}@.")
    text.add()


def make_plans(rows):
    plans = {}
    for row in rows.values():
        slot = row["slot"]
        modes, refusal = source_modes(row)
        cases, refusals = [], []
        if refusal:
            refusals.append(refusal)
        for mode in modes:
            case, unavailable = form(mode, row["decode"][mode], row["word"], rows)
            if case:
                cases.append(case)
            if unavailable:
                refusals.append(f"{mode}:{unavailable}")
        if cases:
            status = "direct-body-candidate"
        elif row["recipe"] is None:
            status = "data-or-unproved-fetch"
        elif any("unresolved" in reason or "hardware-conflict" in reason for reason in refusals):
            status = "unresolved-source-order"
        else:
            status = "dynamic-seam-required"
        plans[slot] = {
            "slot": slot, "bank": row["bank"], "offset": row["offset"], "word": row["word"],
            "physical_word": row["physical_word"], "status": status,
            "source": row.get("source"), "source_line": row.get("line"), "kind": row["kind"],
            "effective_addresses": row["execution_addresses"], "direct_modes": cases,
            "open": refusals,
            "dynamic_adapter_required": ["mismatched entry mode/raw word", "substituted or indexed entry"] if cases else refusals,
            "execution_claim": "none; body emission is not behavior qualification",
            "body_role": "native-body-only; no admission/timing/commit" if cases else None,
            "hardware_and_device_notes": sorted({note for case in cases for note in case["notes"]}),
        }
    return plans


def build_units(fragments, plans):
    units = []
    for fragment in fragments:
        direct_slots = [slot for slot in range(fragment["first_slot"], fragment["last_slot"] + 1) if plans[slot]["direct_modes"]]
        for offset in range(0, len(direct_slots), BLOCK_MAX_ORDERS):
            direct = direct_slots[offset:offset + BLOCK_MAX_ORDERS]
            units.append(Unit(len(units), fragment["source"], fragment["bank"], direct[0], direct[-1], direct))
    return units


def layout_sources(sources, rows, units):
    """Partition v3 units only where source order or literal data requires it."""
    by_file = defaultdict(list)
    old_slot = {}
    for unit in units:
        for index, slot in enumerate(unit.direct_slots):
            old_slot[slot] = (unit.number, index)
    for row in sources:
        by_file[row["source"]].append(row)

    layouts = {}
    partitions = []
    relocated = set()
    for name, lines in by_file.items():
        sequence = []
        pending = []
        for line in lines:
            pending.append(line)
            direct = sorted(slot for slot in line["fixed_slots"] if slot in old_slot)
            if direct:
                for position, slot in enumerate(direct):
                    last = sequence[-1] if sequence else None
                    if (last and last[0] == "body"
                            and old_slot[last[1].last][0] == old_slot[slot][0]
                            and old_slot[last[1].last][1] + 1 == old_slot[slot][1]):
                        unit = last[1]
                        unit.direct_slots.append(slot)
                        unit.last = slot
                    else:
                        unit = Unit(-1, name, rows[slot]["bank"], slot, slot, [slot])
                        sequence.append(("body", unit))
                        partitions.append(unit)
                    if position == 0:
                        unit.annotations[slot].extend(pending)
                        pending = []
            elif line["fixed_slots"]:
                # A ROM-only source row owns the actual load-time literal.
                if not sequence or sequence[-1][0] != "data" or len(sequence[-1][1]) >= BLOCK_MAX_ORDERS:
                    sequence.append(("data", []))
                sequence[-1][1].extend(pending)
                relocated.update(line["fixed_slots"])
                pending = []
        if pending:
            sequence.append(("source-only", pending))
        layouts[name] = sequence

    # The emitted functions follow source order, but the registry must retain
    # disjoint sorted physical intervals, including the original missing slots.
    partitions.sort(key=lambda unit: unit.first)
    assert all(a.last < b.first for a, b in zip(partitions, partitions[1:]))
    for number, unit in enumerate(partitions):
        unit.number = number
        following = partitions[number + 1] if number + 1 < len(partitions) else None
        # Preserve v3 routing coverage for holes between consecutive ready
        # entries. Such slots still return the original no-body fallback.
        same_old_unit = following and old_slot[unit.last][0] == old_slot[following.first][0]
        unit.route_last = following.first - 1 if same_old_unit else unit.last
    assert sorted(slot for unit in partitions for slot in unit.direct_slots) == sorted(old_slot)
    return layouts, partitions, relocated


def emit_data(text, group, rows, generated, provenance):
    text.add("agcAotInstallSourceRope(list(")
    remaining = sum(len(row["fixed_slots"]) for row in group)
    for row in group:
        emit_source_lines(text, [row], 0, generated, provenance)
        if row["fixed_slots"]:
            pairs = []
            for slot in row["fixed_slots"]:
                pairs.extend((str(slot), str(rows[slot]["physical_word"])))
            remaining -= len(row["fixed_slots"])
            line = text.add(", ".join(pairs) + ("," if remaining else ""), 1)
            provenance[row["source"], row["line"]]["literal_line"] = line
    text.add(")).")
    text.add()


def emit_source(out, sources, rows, plans, layouts):
    provenance = {}
    generated = []
    for number, (name, sequence) in enumerate(layouts.items()):
        filename = f"source/s{number:03d}.ks"
        output = FileText()
        output.add(f"// PORT: Original source unit {name}.")
        for kind, node in sequence:
            if kind == "body":
                emit_unit(output, node, plans, rows, filename, provenance)
            elif kind == "data":
                emit_data(output, node, rows, filename, provenance)
            else:
                output.add("// PORT: Source-only text without a subsequent generated declaration.")
                emit_source_lines(output, node, 0, filename, provenance)
        output.write(out / filename)
        generated.append(filename)
    assert len(provenance) == len(sources)
    return generated, [provenance[(r["source"], r["line"])] for r in sources]


REGISTRY = r'''
global agcAotRoutes is lexicon().
global agcAotRomBanks is lexicon().

// PORT: Load-time assembly of source-owned physical ROM literals.
function agcAotInstallSourceRope {
    parameter pairs.
    from { local i is 0. } until i >= pairs:length step { set i to i + 2. } do {
        local slot is pairs[i] - 2048.
        local offset is mod(slot, 1024).
        local cells is agcAotRomBanks[floor(slot / 1024)][floor(offset / 64)].
        set cells[mod(offset, 64)] to pairs[i + 1].
    }
}

function agcAotRopeBank {
    parameter bank.
    if not agcAotRomBanks:haskey(bank) { return -1. }
    return agcAotRomBanks[bank].
}

function agcAotInvoke {
    parameter words, slot, instruction, extended, checkOnly,
        readPhysical, readAdjacent, readEffective, channelAdapter.
    local route is agcAotFindUnit(slot).
    if route < 0 or not agcAotRoutes:haskey(route) { return choose false if checkOnly else -1. }
    local action is agcAotRoutes[route].
    return action:call(words, slot, instruction, extended, checkOnly,
        readPhysical, readAdjacent, readEffective, channelAdapter).
}

function agcAotCanExecute {
    parameter words, slot, instruction, extended.
    if words["indexValue"] <> 0 or words["substituteInstruction"] { return false. }
    return agcAotInvoke(words, slot, instruction, extended, true, 0, 0, 0, 0).
}

function agcAotExecute {
    parameter words, slot, instruction, extended, readPhysical, readAdjacent, readEffective, channelAdapter.
    return agcAotInvoke(words, slot, instruction, extended, false,
        readPhysical, readAdjacent, readEffective, channelAdapter).
}
'''


def emit_registry(out, units):
    text = FileText()
    text.add(REGISTRY.strip())
    text.add()
    text.add("function agcAotFindUnit {")
    text.add("parameter slot.", 1)

    def leaf(unit, level):
        text.add(f"if slot < {unit.first} or slot > {unit.route_last} {{ return -1. }}", level)
        text.add(f"return {unit.number}.", level)

    branch_tree(text, units, 1, lambda unit: unit.route_last, leaf)
    text.add("}")
    text.write(out / "registry.ks")


def emit_rom(out, rows, relocated):
    files = []
    for first_bank in range(0, 36, 6):
        filename = f"rope/b{first_bank:02d}.ks"
        text = FileText()
        text.add("// PORT: Pinned physical rope words including parity, with source-owned literals installed by the source leaves.")
        for bank in range(first_bank, first_bank + 6):
            text.add(f"set agcAotRomBanks[{bank}] to list(")
            base = 2048 + 1024 * bank
            for row in range(16):
                slots = range(base + 64 * row, base + 64 * (row + 1))
                words = [str(-1 if slot in relocated else rows[slot]["physical_word"]) for slot in slots]
                text.add("list(" + ", ".join(words) + ")" + ("," if row < 15 else ""), 1)
            text.add(").")
        text.write(out / filename)
        files.append(filename)
    return files


def emit_blocks(out, rows, plans, units, fragments):
    # All possible continuation edges are retained once. Exact timed fusion is a
    # later pass over these entries, never a copied prefix for each entry.
    block_recipes = []
    for unit in units:
        for slot in unit.direct_slots:
            row = rows[slot]
            block_recipes.append({
                "slot": slot, "unit": unit.number, "source": row["source"], "line": row["line"],
                "modes": [item["mode"] for item in plans[slot]["direct_modes"]],
                "successors_by_effective_pc": row["lexical_successors"],
                "entry_policy": "single ready body; caller owns timing and shared commit",
                "fusion_claim": "none; prove mode, alias and event composition before fusing",
            })
    emit(out, "block-recipes", block_recipes)
    split_slots = {slot for fragment in fragments for slot in fragment["split_slots"]}
    chains = []
    for unit in units:
        active = []
        for slot in unit.direct_slots:
            if active and (slot != active[-1] + 1 or slot in split_slots or
                           not linear_fallthrough(rows[active[-1]], plans[active[-1]])):
                chains.append((unit, active))
                active = []
            active.append(slot)
        if active:
            chains.append((unit, active))
    assert sum(len(slots) for _, slots in chains) == len(block_recipes)
    emit(out, "block-chains", ({
        "unit": unit.number, "root_slot": slots[0], "owned_slots": slots,
        "source": unit.source,
        "linear_links": [{"from": previous, "to": following} for previous, following in zip(slots, slots[1:])],
        "split_before_original_alternate_entry": True,
        "domain": "fallthrough recipe only; exact epoch proof and providers required before fusion",
    } for unit, slots in chains))
    return len(chains), sum(len(slots) > 1 for _, slots in chains)


def linear_fallthrough(row, plan):
    cases = plan["direct_modes"]
    if len(cases) != 1 or cases[0]["mode"] != "normal" or cases[0]["guard"]:
        return False
    operation = cases[0]["operation"]
    operand = cases[0]["operand"]
    if operation not in ("CA", "CS", "AD", "MASK", "XCH", "LXCH"):
        return False
    if operand in (3, 4, 5, 6, 55) or 768 <= operand < 2048:
        return False
    return all(edges == [["fallthrough", (int(pc)+1) % 4096]]
               for pc, edges in row["lexical_successors"].items()) and bool(row["lexical_successors"])


def emit_loader(out, files):
    (out / "load.ks").write_text("\n".join(f'runpath("0:/{file}").' for file in files) + "\n")
    probe = FileText()
    probe.add('runpath("0:/load.ks").')
    probe.add('local rawWords is lexicon("indexValue",0,"substituteInstruction",false).')
    probe.add('local image is agcAotRopeBank(2).')
    probe.add('local original is floor(image[0][4] / 2).')
    probe.add('log "rom " + original to "0:/load-result.txt".')
    probe.add('log "direct " + agcAotCanExecute(rawWords, 4100, original, false) to "0:/load-result.txt".')
    probe.add('log "wrong-mode " + agcAotCanExecute(rawWords, 4100, original, true) to "0:/load-result.txt".')
    probe.add('log "wrong-word " + agcAotCanExecute(rawWords, 4100, original + 1, false) to "0:/load-result.txt".')
    probe.add('log "data " + agcAotCanExecute(rawWords, 0, 0, false) to "0:/load-result.txt".')
    probe.add('log "END" to "0:/load-result.txt".')
    probe.write(out / "load-probe.ks")


def generate(ir, out, program, snapshot):
    out.mkdir()
    (out / "source").mkdir()
    (out / "rope").mkdir()
    rows = {row["slot"]: row for row in read_ir(ir, program, "fixed")}
    source_rows = read_ir(ir, program, "source")
    fragments = read_ir(ir, program, "units")
    plans = make_plans(rows)
    layouts, units, relocated = layout_sources(source_rows, rows, build_units(fragments, plans))
    providers, exports = stage_providers(out, snapshot)
    files, provenance = emit_source(out, source_rows, rows, plans, layouts)
    emit_registry(out, units)
    rom_files = emit_rom(out, rows, relocated)
    emit_loader(out, providers + ["registry.ks"] + rom_files + files)
    chains, fused_candidates = emit_blocks(out, rows, plans, units, fragments)
    emit(out, "emission", plans.values())
    emit(out, "provenance", provenance)
    summary = {
        "program": program, "source_files": len(files), "original_lines": len(provenance),
        "fixed_words": len(plans), "unit_functions": len(units), "relocated_rom_words": len(relocated),
        "statuses": Counter(plan["status"] for plan in plans.values()),
        "modes_emitted": sum(len(plan["direct_modes"]) for plan in plans.values()),
        "disjoint_chain_recipes": chains, "multi_order_chain_candidates": fused_candidates,
        "script_files": sum(1 for _ in out.rglob("*.ks")),
        "script_bytes": sum(file.stat().st_size for file in out.rglob("*.ks")),
        "provider_exports": len(exports),
    }
    (out / "summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps(summary, sort_keys=True))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path)
    parser.add_argument("--ir", type=Path, default=COMPILER / "ir")
    parser.add_argument("--program", choices=PROGRAMS)
    parser.add_argument("--providers-from", type=Path, help="providers directory of an earlier output")
    args = parser.parse_args()
    snapshot = [(path, ((args.providers_from / path.name) if args.providers_from else path).read_bytes())
                for path in UTILITY_PATHS + KERNEL_PATHS]
    args.output.mkdir(exist_ok=False)
    for program in (args.program,) if args.program else PROGRAMS:
        generate(args.ir, args.output / program, program, snapshot)


if __name__ == "__main__":
    main()
