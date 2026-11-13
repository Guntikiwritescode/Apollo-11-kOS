// Isolated basic control candidate. Native behavior is the diagnostic baseline.
// Fetch provider supplies the raw word after the effective Z bus access,
// including when SubstituteInstruction is set.
function agcCoreControlWord {
    parameter words, fetchedWord.
    if words["substituteInstruction"] {
        return mod(words[15], 32768).
    }
    local baseWord is agcSignExtend(mod(fetchedWord, 32768)).
    local indexWord is agcSignExtend(mod(words["indexValue"], 32768)).
    return agcOverflowCorrected(agcAddSP16(indexWord, baseWord)).
}

// Instruction-scope contribution, after ready/admission checks.
// Apply this to every executing opcode, even those outside this file.
function agcCoreInheritedTCTransient {
    parameter words, instruction.
    return words["tookBZF"] and (words["extraCode"] or instruction <> 6).
}

// Native ordinary IRQ admission and EDRUPT. The optional mask is the
// diagnostic enable mask with the global enable in bit zero.
function agcCoreControlAdmit {
    parameter words, instruction, debuggerMask is 2047.
    local edrupt is words["extraCode"] and floor(instruction / 512) = 7.
    if not edrupt {
        if mod(debuggerMask, 2) = 0 or words["inInterrupt"] or not words["interruptEnabled"]
            or words["extraCode"] or words["pendingInstruction"]
            or agcOverflowDirection(words[0]) <> 0
            or instruction = 3 or instruction = 4 or instruction = 6 {
            return -1.
        }
    }

    local request is 1.
    local requestBit is 2.
    local pending is words["interruptRequests"].
    until request > 10 or (mod(floor(pending / requestBit), 2) = 1
        and mod(floor(debuggerMask / requestBit), 2) = 1) {
        set request to request + 1.
        set requestBit to requestBit * 2.
    }

    if request > 10 {
        if not edrupt { return -1. }
        set request to 0.
        set words["nextZ"] to 0.
    } else {
        set words["interruptRequests"] to pending - requestBit.
        set words["lastInterrupt"] to request.
        set words["nextZ"] to 2048 + 4 * request.
    }
    set words[13] to mod(words[5], 4096) + 1.
    set words[15] to instruction.
    set words["extraCode"] to false.
    set words["indexValue"] to 0.
    set words["substituteInstruction"] to false.
    set words["inInterrupt"] to true.
    set words["extraDelay"] to mod(words["extraDelay"] + 1, 8).
    return request.
}

// Common native ready instruction entry, after interrupt and timing decisions.
// This entry does not clear the live extracode or the branch-history latches.
function agcCoreControlBegin {
    parameter words.
    set words["pendingInstruction"] to false.
    set words["indexValue"] to 0.
    set words["substituteInstruction"] to false.
    local rawZ is words[5].
    set words["nextZ"] to rawZ + 1 - (choose 65536 if rawZ >= 32768 else 0).
    set words[5] to words["nextZ"] - 65536 * floor(words["nextZ"] / 65536).
}

// Ready instruction bodies for TC/TCF, INDEX/RESUME, TS and BZF/BZMF.
// Return exactly the five local agcCoreFinish inputs in order. A scalar
// -1 denotes dispatch to another owner and carries no execution effects.
function agcCoreControlExecute {
    parameter words, instruction, accumulator, readWord.
    local extended is words["extraCode"].
    local opcode is floor(instruction / 1024).
    local address is mod(instruction, 4096).
    local transient is agcCoreInheritedTCTransient(words, instruction).

    if not extended and opcode < 4 {
        if address = 3 or address = 4 {
            set words["interruptEnabled"] to address = 3.
            return list(false, false, transient or words["tookBZMF"], false, false).
        }
        if address = 6 {
            set words["extraCode"] to true.
            return list(true, false, transient, false, false).
        }
        if address <> 2 {
            local nextZ is words["nextZ"].
            set words[2] to nextZ - 65536 * floor(nextZ / 65536).
        }
        set words["nextZ"] to address.
        return list(false, true, transient, false, false).
    }

    if not extended and opcode >= 5 and opcode <= 7 {
        set words["nextZ"] to address.
        return list(false, true, transient, false, false).
    }

    if (not extended and opcode = 20) or (extended and opcode >= 20 and opcode <= 23) {
        local operand is choose address if extended else mod(address, 1024).
        if operand = (choose 30 if extended else 15) {
            local savedZ is words[13].
            set words["nextZ"] to savedZ - 1 - (choose 65536 if savedZ >= 32768 else 0).
            set words["inInterrupt"] to false.
            set words["substituteInstruction"] to true.
            return list(false, false, transient, false, false).
        }
        if operand < 3 {
            set words["indexValue"] to agcOverflowCorrected(words[operand]).
        } else {
            set words["indexValue"] to readWord:call(words, operand).
        }
        return list(extended, false, transient, false, false).
    }

    if not extended and opcode = 22 {
        local operand is mod(address, 1024).
        local overflow is agcOverflowDirection(accumulator).
        if operand = 5 {
            set words["nextZ"] to mod(accumulator, 32768).
        } else if operand <> 0 {
            local slot is agcCoreResolve(words, operand).
            if operand < 3 { set words[operand] to accumulator. }
            else { agcCoreAssign(words, slot, agcOverflowCorrected(accumulator)). }
        }
        if overflow <> 0 {
            if operand <> 0 {
                set words[0] to choose 1 if overflow > 0 else 65534.
            }
            if operand <> 5 { set words["nextZ"] to words["nextZ"] + 1. }
        }
        return list(false, false, true, false, false).
    }

    if extended and ((opcode >= 5 and opcode <= 7) or (opcode >= 25 and opcode <= 27)) {
        local bzf is opcode <= 7.
        local taken is accumulator = 0 or (choose (accumulator = 65535) if bzf else (accumulator >= 32768)).
        if taken { set words["nextZ"] to address. }
        return list(false, false, transient, taken and bzf, taken and not bzf).
    }
    return -1.
}
