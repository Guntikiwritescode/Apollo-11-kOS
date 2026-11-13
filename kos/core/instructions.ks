// operation: 0 READ .. 6 RXOR
function agcCoreChannelInstruction {
    parameter words, operation, channel, channelAdapter.
    local aliasRegister is channel = 1 or channel = 2.
    local accumulator is words[0].
    if not aliasRegister {
        set accumulator to agcOverflowCorrected(accumulator).
    }

    local value is accumulator.
    if operation <> 1 {
        set value to agcCoreReadIO(words, channel).
        if not aliasRegister { set value to mod(value, 32768). }
        if operation = 2 or operation = 3 {
            set value to agcAnd16(accumulator, value).
        } else if operation = 4 or operation = 5 {
            set value to agcOr16(accumulator, value).
        } else if operation = 6 {
            set value to agcXor16(accumulator, value).
        }
    }

    if operation = 1 or operation = 3 or operation = 5 {
        if aliasRegister {
            set words[channel] to value.
        } else {
            agcCoreWriteIO(words, channel, value, channelAdapter).
        }
    }
    if operation <> 1 {
        if aliasRegister {
            set words[0] to value.
        } else {
            set words[0] to agcSignExtend(value).
        }
    }
}

// reg: 0 XCH, 1 LXCH, 2 QXCH
function agcCoreExchange {
    parameter words, reg, address, readOperand.
    if reg = address {
        return.
    }
    if address = 7 and reg <> 0 {
        set words[reg] to 0.
        return.
    }
    local entryWord is words[reg].
    if address < 3 {
        set words[reg] to words[address].
        set words[address] to entryWord.
        return.
    }

    local slot is agcCoreResolve(words, address).
    local operand is agcSignExtend(mod(readOperand:call(words, slot), 32768)).
    local storedWord is agcOverflowCorrected(entryWord).
    if reg = 1 {
        // LXCH writes before it loads L
        agcCoreAssign(words, slot, storedWord).
        set words[1] to operand.
    } else {
        set words[reg] to operand.
        agcCoreAssign(words, slot, storedWord).
    }
}

// mode: "DCA", "DCS" or "DXCH"
function agcCoreDoubleExchange {
    parameter words, mode, address, readOperand, readAdjacent.
    local complement is mode = "DCS".
    local exchange is mode = "DXCH".
    if address = 1 {
        if complement {
            set words[0] to 65535 - words[0].
            set words[1] to 65535 - words[1].
        }
        set words[1] to agcNormalizeLink(words[1]).
        return true.
    }
    if address = 0 {
        return false.
    }

    local slot is agcCoreResolve(words, address).
    if address > 3 and (slot = 0 or slot = 2048) {
        return false.
    }

    local upper is readOperand:call(words, slot).
    if address < 3 {
        if exchange {
            set words[address] to words[1].
        }
    } else {
        set upper to agcSignExtend(mod(upper, 32768)).
        if exchange {
            agcCoreAssign(words, slot, agcOverflowCorrected(words[1])).
        }
    }
    if complement {
        set upper to 65535 - upper.
    }
    set words[1] to agcNormalizeLink(upper).

    local lower is readAdjacent:call(words, slot - 1).
    if address < 4 {
        if exchange {
            set words[address - 1] to words[0].
        }
    } else {
        set lower to agcSignExtend(mod(lower, 32768)).
        if exchange {
            agcCoreAssign(words, slot - 1, agcOverflowCorrected(words[0])).
        }
    }
    if complement {
        set lower to 65535 - lower.
    }
    set words[0] to lower.

    if not exchange {
        if address >= 16 and address <= 19 {
            agcCoreAssign(words, slot, words[slot]).
        }
        if address >= 17 and address <= 20 {
            agcCoreAssign(words, slot - 1, words[slot - 1]).
        }
    }
    return true.
}
