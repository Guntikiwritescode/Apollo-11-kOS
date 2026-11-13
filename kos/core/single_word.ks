// PORT: Ready-cycle bodies. The dispatcher owns fetch, timing and AllDone.
// Fixed operands use the verified rope slots of the shared bus.

function agcCoreCA {
    parameter words, address.
    if address = 0 { return. }
    if address < 3 {
        set words[0] to words[address].
        return.
    }
    local slot is agcCoreResolve(words, address).
    local source is words[slot].
    set words[0] to agcSignExtend(mod(source, 32768)).
    // Re-read the physical operand after setting A. EB=0 can alias A.
    set source to words[slot].
    agcCoreAssign(words, slot, source - 65536 * floor(source / 32768)).
}

// The dispatcher sets tcTransient for every CS.
function agcCoreCS {
    parameter words, address.
    if address < 3 {
        set words[0] to 65535 - words[address].
        return.
    }
    local slot is agcCoreResolve(words, address).
    local source is words[slot].
    set words[0] to agcSignExtend(32767 - mod(source, 32768)).
    // Re-read the physical operand after setting A. EB=0 can alias A.
    set source to words[slot].
    agcCoreAssign(words, slot, source - 65536 * floor(source / 32768)).
}

function agcCoreAD {
    parameter words, address.
    local accumulator is words[0].
    if address < 3 {
        set words[0] to agcAddSP16(accumulator, words[address]).
        return.
    }
    local slot is agcCoreResolve(words, address).
    local source is words[slot].
    local result is agcAddSP16(accumulator, agcSignExtend(mod(source, 32768))).
    agcCoreAssign(words, slot, source - 65536 * floor(source / 32768)).
    set words[0] to result.
}

function agcCoreADS {
    parameter words, address.
    local slot is agcCoreResolve(words, address).
    local operand is words[slot].
    if address >= 3 { set operand to agcSignExtend(mod(operand, 32768)). }
    local result is agcAddSP16(words[0], operand).
    set words[0] to result.
    if address = 0 { return. }
    if address < 3 {
        set words[address] to result.
    } else {
        agcCoreAssign(words, slot, agcOverflowCorrected(result)).
    }
}

function agcCoreSU {
    parameter words, address.
    if address = 0 {
        set words[0] to 65535.
        return.
    }
    local accumulator is words[0].
    if address < 3 {
        set words[0] to agcAddSP16(accumulator, 65535 - words[address]).
        return.
    }
    local slot is agcCoreResolve(words, address).
    local source is words[slot].
    local result is agcAddSP16(accumulator, agcSignExtend(32767 - mod(source, 32768))).
    agcCoreAssign(words, slot, source - 65536 * floor(source / 32768)).
    set words[0] to result.
}

function agcCoreMSU {
    parameter words, address.
    local slot is agcCoreResolve(words, address).
    local source is words[slot].
    local difference is words[0] + 65536 - source.
    if address >= 3 {
        set difference to agcOverflowCorrected(words[0]) + 32768 - mod(source, 32768).
    }
    local negative is mod(floor(difference / 16384), 2) = 1.
    if negative { set difference to difference - 1. }
    if address = 2 {
        // The upper bit is forced on negative, otherwise retain the wide difference.
        set words[0] to mod(difference, 65536).
        if negative { set words[0] to mod(difference, 32768) + 32768. }
    } else {
        set words[0] to agcSignExtend(mod(difference, 32768)).
    }
    if address >= 16 and address <= 19 {
        agcCoreAssign(words, slot, source - 65536 * floor(source / 32768)).
    }
}

function agcCoreCCS {
    parameter words, address.
    local slot is address.
    if address >= 3 { set slot to agcCoreResolve(words, address). }
    local source is words[slot].
    local operand is mod(source, 32768).
    local overflow is 0.
    if address < 3 {
        set overflow to agcOverflowDirection(source).
        set operand to agcOverflowCorrected(source).
    } else {
        set source to agcSignExtend(operand).
    }
    set words[0] to max(0, min(source, 65535 - source) - 1).
    if address >= 3 { agcCoreAssign(words, slot, operand). }

    if overflow < 0 {
        set words["nextZ"] to words["nextZ"] + 2.
    } else if overflow = 0 {
        if operand = 0 { set words["nextZ"] to words["nextZ"] + 1. }
        else if operand = 32767 { set words["nextZ"] to words["nextZ"] + 3. }
        else if operand >= 16384 { set words["nextZ"] to words["nextZ"] + 2. }
    }
}

function agcCoreINCR {
    parameter words, address.
    agcCoreUnaryCount(words, address, "INCR").
}

function agcCoreAUG {
    parameter words, address.
    agcCoreUnaryCount(words, address, "AUG").
}

function agcCoreDIM {
    parameter words, address.
    agcCoreUnaryCount(words, address, "DIM").
}

function agcCoreUnaryCount {
    parameter words, address, operation.
    local slot is agcCoreResolve(words, address).
    local operand is words[slot].
    if address >= 3 { set operand to agcSignExtend(mod(operand, 32768)). }
    local increment is 1.
    if operation = "DIM" {
        if operand = 0 or operand = 65535 { return. }
        if operand < 32768 { set increment to 65534. }
    } else if operation = "AUG" and operand >= 32768 {
        set increment to 65534.
    }
    local result is agcAddSP16(increment, operand).
    if address < 3 {
        set words[address] to result.
        return.
    }
    agcCoreAssign(words, slot, agcOverflowCorrected(result)).
    if operation <> "DIM" and agcOverflowDirection(result) <> 0 {
        if address = 21 {
            set words[20] to agcTimerPinc(words[20]).
        } else if address = 24 {
            set words["interruptRequests"] to agcOr16(words["interruptRequests"], 4).
        } else if address = 22 {
            set words["interruptRequests"] to agcOr16(words["interruptRequests"], 8).
        } else if address = 23 {
            set words["interruptRequests"] to agcOr16(words["interruptRequests"], 16).
        }
    }
}

function agcCoreMASK {
    parameter words, address.
    if address < 3 {
        set words[0] to agcAnd16(words[0], words[address]).
        return.
    }
    set words[0] to agcOverflowCorrected(words[0]).
    local slot is agcCoreResolve(words, address).
    set words[0] to agcSignExtend(agcAnd16(words[0], mod(words[slot], 32768))).
}
