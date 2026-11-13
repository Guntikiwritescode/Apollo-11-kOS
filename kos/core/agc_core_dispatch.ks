// PORT: Isolated exact-body dispatch seam for dynamically formed orders.
// All inputs are decoded raw words after fetch and admission. Timing belongs
// to the timed core. This is not a whole-hardware qualification claim.
function agcCoreDispatchBody {
    parameter words, instruction, accumulator, readEffective, readPhysical,
        readAdjacent, channelAdapter.
    local extended is words["extraCode"].
    local quarter is floor(instruction / 1024).
    local address12 is mod(instruction, 4096).
    local address10 is mod(instruction, 1024).
    local transient is agcCoreInheritedTCTransient(words, instruction).

    if (not extended and (quarter < 4 or (quarter >= 5 and quarter <= 7)
        or quarter = 20 or quarter = 22))
        or (extended and ((quarter >= 5 and quarter <= 7)
        or (quarter >= 20 and quarter <= 23)
        or (quarter >= 25 and quarter <= 27))) {
        return agcCoreControlExecute(words, instruction, accumulator, readEffective).
    }

    if extended {
        if quarter < 4 {
            local channelOperation is floor(instruction / 512).
            // EDRUPT must have been handled by admission before this boundary.
            if channelOperation = 7 { return -1. }
            agcCoreChannelInstruction(words, channelOperation, mod(instruction, 512), channelAdapter).
        } else if quarter = 4 {
            local operand is 0.
            if address10 < 3 or address10 = 5 {
                set operand to words[address10].
            } else {
                set operand to readEffective:call(words, address10).
            }
            agcCoreDv(words, address10, operand).
        } else if quarter = 8 {
            agcCoreMSU(words, address10).
        } else if quarter = 9 {
            agcCoreExchange(words, 2, address10, readPhysical).
        } else if quarter = 10 {
            agcCoreAUG(words, address10).
        } else if quarter = 11 {
            agcCoreDIM(words, address10).
        } else if quarter >= 12 and quarter <= 19 {
            local pairMode is choose "DCA" if quarter < 16 else "DCS".
            if not agcCoreDoubleExchange(words, pairMode, address12, readPhysical, readAdjacent) {
                return -1.
            }
        } else if quarter = 24 {
            agcCoreSU(words, address10).
        } else if quarter >= 28 {
            local operand is readEffective:call(words, address12).
            agcCoreMp(words, address12, operand).
        } else { return -1. }
    } else {
        if quarter = 4 {
            agcCoreCCS(words, address10).
        } else if quarter = 8 {
            if not agcCoreDas(words, address10) { return -1. }
        } else if quarter = 9 {
            agcCoreExchange(words, 1, address10, readPhysical).
        } else if quarter = 10 {
            agcCoreINCR(words, address10).
        } else if quarter = 11 {
            agcCoreADS(words, address10).
        } else if quarter >= 12 and quarter <= 15 {
            agcCoreCA(words, address12).
        } else if quarter >= 16 and quarter <= 19 {
            agcCoreCS(words, address12).
            set transient to true.
        } else if quarter = 21 {
            if not agcCoreDoubleExchange(words, "DXCH", address10, readPhysical, readAdjacent) {
                return -1.
            }
            set transient to true.
        } else if quarter = 23 {
            agcCoreExchange(words, 0, address10, readPhysical).
            set transient to true.
        } else if quarter >= 24 and quarter <= 27 {
            agcCoreAD(words, address12).
        } else if quarter >= 28 {
            agcCoreMASK(words, address12).
        } else { return -1. }
    }
    return list(false, false, transient, false, false).
}

// PORT: Pure preflight for the unresolved paired-predecessor domains.
// This does not discharge the caller's complete presence/parity obligation.
function agcCoreCanDispatchBody {
    parameter words, instruction, extended.
    local quarter is floor(instruction / 1024).
    local pair is (not extended and (quarter = 8 or quarter = 21))
        or (extended and quarter >= 12 and quarter <= 19).
    if not pair { return true. }
    local address is choose mod(instruction, 4096) if extended else mod(instruction, 1024).
    if address = 0 { return false. }
    if address = 1 { return true. }
    local slot is agcAddressSlot(address, words[3], words[4], words["channel7"]).
    if slot = 0 { return false. }
    if address > 3 and slot = 2048 { return false. }
    return true.
}

// PORT: One native-compatible MCT for declared provider and operand domains.
// Return labels preserve stopped and held boundaries for the development harness.
function agcCoreComposedMct {
    parameter words, providers, readEffective, readPhysical, readAdjacent,
        channelAdapter, debuggerMask is 2047.
    local disposition is agcCoreTimedMct(words, providers).
    if disposition <> "cpu" { return disposition. }
    local accumulator is words[0].
    local oldEB is words[3].
    local oldFB is words[4].
    local oldBB is words[6].
    local fetchPC is mod(words[5], 4096).
    local fetchedWord is readEffective:call(words, fetchPC).
    local instruction is agcCoreControlWord(words, fetchedWord).
    local gate is agcCoreTimedCpuGate(words, instruction, oldEB, oldFB, oldBB, debuggerMask).
    if gate = -2 { return "new-pending". }
    if gate >= 0 { return "interrupt". }
    if not agcCoreCanDispatchBody(words, instruction, words["extraCode"]) {
        return "unresolved-domain".
    }
    // Choose before Begin consumes INDEX and BRUPT. The physical-slot lookup
    // is pure: the fetch above is the only fetch bus transaction in this MCT.
    local unit is false.
    local slot is -1.
    if words:haskey("selectDirectBody") and fetchPC >= 1024
        and words["indexValue"] = 0 and not words["substituteInstruction"] {
        set slot to agcAddressSlot(fetchPC, oldEB, oldFB, words["channel7"]).
        set unit to words["selectDirectBody"]:call(words, slot, instruction, words["extraCode"]).
    }
    agcCoreControlBegin(words).
    local flags is 0.
    if unit:istype("Boolean") {
        set flags to agcCoreDispatchBody(words, instruction, accumulator,
            readEffective, readPhysical, readAdjacent, channelAdapter).
    } else {
        set flags to unit:call(words, slot, instruction, words["extraCode"], false,
            readPhysical, readAdjacent, readEffective, channelAdapter).
    }
    // The pure preflight must exclude all body refusal domains. A refusal
    // is retained as a stopped development boundary, never normal completion.
    if not flags:istype("List") { return "unresolved-body". }
    agcCoreFinish(words, oldEB, oldFB, oldBB,
        flags[0], flags[1], flags[2], flags[3], flags[4]).
    return "commit".
}
