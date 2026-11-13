# usage: emit_ks.py OUTPUT_DIRECTORY
import argparse
from collections import defaultdict
from dataclasses import dataclass, field
import gzip
import json
from pathlib import Path
import re

from build_ir import COMPILER, PROGRAMS, PROJECT

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
CORE_FILES = ("bus", "control", "single", "paired", "channel", "instructions")


def read_ir(folder, program, name):
    with gzip.open(folder / f"{program}.{name}.jsonl.gz", "rt") as file:
        return [json.loads(line) for line in file]


def source_literal(raw):
    return raw.rstrip("\r\n")


def check_core():
    # the generated code calls these functions from kos/core
    found = set()
    for name in CORE_FILES:
        found.update(re.findall(r"(?m)^function (\w+)", (CORE / f"{name}.ks").read_text()))
    needed = {f"agcCore{op}" for op in SINGLE} | {
        "agcCoreControlExecute", "agcCoreInheritedTCTransient", "agcCoreMp", "agcCoreDv",
        "agcCoreDas", "agcCoreChannelInstruction", "agcCoreExchange", "agcCoreDoubleExchange",
    }
    assert needed <= found, sorted(needed - found)


def source_modes(row):
    recipe = row["recipe"]
    if recipe is None or recipe["family"] is None or recipe["indexed"]:
        return ()
    if recipe["encoded_family_matches_source"] is False:
        return ()
    family = recipe["family"]
    if family in ("INDEX", "RESUME"):
        return tuple(mode for mode in ("normal", "extended") if row["decode"][mode]["operation"] == family)
    return (recipe["mode"],) if recipe["mode"] else ()


def guard_for(op, address):
    # run-time checks the code needs, None if the word stays data
    if op in PAIR_EXCHANGE or op == "DAS":
        if address == 0:
            return None
        if address > 3 and address % (256 if address < 1024 else 1024) == 0:
            return None
    if op == "DIM":
        return ("dim-zero-edit",) if 16 <= address <= 19 or address >= 768 else ()
    if op == "MP" and address == 0:
        return ("overflow-square",)
    return ()


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
    if op == "EDRUPT" or op == "RESUME" and mode == "extended":
        return None
    guard = guard_for(op, addr)
    if guard is None:
        return None

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
    return {"mode": mode, "operation": op, "operand": addr, "guard": guard, "actions": actions}


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


def emit_source_lines(text, rows):
    for row in rows:
        text.add(f'// {row["source"]}:{row["line"]}')
        text.add("//" + source_literal(row["text"]))
        if row["fixed_slots"]:
            text.add("// slot " + " ".join(map(str, row["fixed_slots"])))


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


def emit_unit(text, unit, plans, rows):
    assert unit.direct_slots
    text.add(f"// bank {unit.bank:02o}, slots {unit.first}-{unit.last}")
    text.add(f"function {unit.name} {{")
    text.add(f"parameter {BODY_SIGNATURE}.", 1)

    def leaf(slot, depth):
        row = rows[slot]
        emit_source_lines(text, unit.annotations[slot])
        text.add(f"if slot <> {slot} or instruction <> {row['word']} {{ return choose false if checkOnly else -1. }}", depth)
        for case in plans[slot]:
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
        cases = [form(mode, row["decode"][mode], row["word"], rows) for mode in source_modes(row)]
        plans[slot] = [case for case in cases if case]
    return plans


def build_units(fragments, plans):
    units = []
    for fragment in fragments:
        direct_slots = [slot for slot in range(fragment["first_slot"], fragment["last_slot"] + 1) if plans[slot]]
        for offset in range(0, len(direct_slots), BLOCK_MAX_ORDERS):
            direct = direct_slots[offset:offset + BLOCK_MAX_ORDERS]
            units.append(Unit(len(units), fragment["source"], fragment["bank"], direct[0], direct[-1], direct))
    return units


def layout_sources(sources, rows, units):
    # code and rope words go in source order, data between two instructions splits a function
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
                # lines with no code carry their rope words
                if not sequence or sequence[-1][0] != "data" or len(sequence[-1][1]) >= BLOCK_MAX_ORDERS:
                    sequence.append(("data", []))
                sequence[-1][1].extend(pending)
                relocated.update(line["fixed_slots"])
                pending = []
        if pending:
            sequence.append(("source-only", pending))
        layouts[name] = sequence

    # functions are written in source order, the registry looks them up by slot
    partitions.sort(key=lambda unit: unit.first)
    assert all(a.last < b.first for a, b in zip(partitions, partitions[1:]))
    for number, unit in enumerate(partitions):
        unit.number = number
        following = partitions[number + 1] if number + 1 < len(partitions) else None
        # a gap inside one block still routes to the function before it
        same_old_unit = following and old_slot[unit.last][0] == old_slot[following.first][0]
        unit.route_last = following.first - 1 if same_old_unit else unit.last
    assert sorted(slot for unit in partitions for slot in unit.direct_slots) == sorted(old_slot)
    return layouts, partitions, relocated


def emit_data(text, group, rows):
    text.add("agcAotInstallSourceRope(list(")
    remaining = sum(len(row["fixed_slots"]) for row in group)
    for row in group:
        emit_source_lines(text, [row])
        if row["fixed_slots"]:
            pairs = []
            for slot in row["fixed_slots"]:
                pairs.extend((str(slot), str(rows[slot]["physical_word"])))
            remaining -= len(row["fixed_slots"])
            text.add(", ".join(pairs) + ("," if remaining else ""), 1)
    text.add(")).")
    text.add()


def emit_source(out, rows, plans, layouts):
    generated = []
    for number, (name, sequence) in enumerate(layouts.items()):
        filename = f"source/s{number:03d}.ks"
        output = FileText()
        output.add(f"// {name}")
        for kind, node in sequence:
            if kind == "body":
                emit_unit(output, node, plans, rows)
            elif kind == "data":
                emit_data(output, node, rows)
            else:
                output.add("// no code for the lines below")
                emit_source_lines(output, node)
        output.write(out / filename)
        generated.append(filename)
    return generated


REGISTRY = r'''
global agcAotRoutes is lexicon().
global agcAotRomBanks is lexicon().

// Fill in the rope words that are written next to their source lines.
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
        text.add("// Rope words with parity. The source files fill in each -1.")
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


def generate(ir, out, program):
    out.mkdir()
    (out / "source").mkdir()
    (out / "rope").mkdir()
    rows = {row["slot"]: row for row in read_ir(ir, program, "fixed")}
    plans = make_plans(rows)
    layouts, units, relocated = layout_sources(read_ir(ir, program, "source"), rows,
                                               build_units(read_ir(ir, program, "units"), plans))
    files = emit_source(out, rows, plans, layouts)
    emit_registry(out, units)
    emit_rom(out, rows, relocated)
    print(program, len(files), "source files,", len(units), "functions")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("output", type=Path)
    parser.add_argument("--ir", type=Path, default=COMPILER / "ir")
    args = parser.parse_args()
    check_core()
    args.output.mkdir(exist_ok=False)
    for program in PROGRAMS:
        generate(args.ir, args.output / program, program)


if __name__ == "__main__":
    main()
