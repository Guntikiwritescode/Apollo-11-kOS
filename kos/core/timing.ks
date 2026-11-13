local coreBasicTiming is list(
    0,0,0,0, 1,0,0,0, 2,1,1,1, 1,1,1,1,
    1,1,1,1, 1,2,1,1, 1,1,1,1, 1,1,1,1).
local coreExtraTiming is list(
    1,1,1,1, 5,0,0,0, 1,1,1,1, 2,2,2,2,
    2,2,2,2, 1,1,1,1, 1,0,0,0, 2,2,2,2).

function agcCoreTimedCpuGate {
    parameter words, instruction, oldEB, oldFB, oldBB, debuggerMask.
    local irq is agcCoreControlAdmit(words, instruction, debuggerMask).
    if irq >= 0 {
        agcCoreFinish(words, oldEB, oldFB, oldBB, false, false, false, false, false).
        return irq.
    }
    if not words["pendingInstruction"] {
        local opcode is floor(instruction / 1024).
        local delayCycles is choose coreExtraTiming[opcode] if words["extraCode"] else coreBasicTiming[opcode].
        if delayCycles > 0 {
            set words["pendingInstruction"] to true.
            set words["pendDelay"] to delayCycles - 1.
            return -2.
        }
    }
    return -1.
}

// TIME6 timeout writes channel 13
function agcCoreTimedTimerPhase {
    parameter words, phase, channelAdapter.
    local previousCh13 is words["channel13"].
    if phase <> 0 and phase <> 8 and phase <> 16
        and (mod(phase, 2) = 0 or previousCh13 < 16384) { return. }
    local result is agcServiceTimers(phase, words[21], words[20], words[22], words[23],
        words[24], words[25], previousCh13).
    set words["extraDelay"] to mod(words["extraDelay"] + result[8], 8).
    set words[21] to result[0].
    set words[20] to result[1].
    set words[22] to result[2].
    set words[23] to result[3].
    set words[24] to result[4].
    set words[25] to result[5].
    if result[6] <> 0 {
        set words["interruptRequests"] to agcOr16(words["interruptRequests"], 2 ^ result[6]).
    }
    if result[7] <> previousCh13 {
        agcCoreWriteIO(words, 11, result[7], channelAdapter).
    }
}

function agcCoreTimedHandTraps {
    parameter words.
    local armed is words["trapBits"].
    local clearMask is 0.
    if mod(armed, 2) = 1 and mod(words["channel31"], 64) <> 63 {
        set clearMask to 1.
    }
    if mod(floor(armed / 2), 2) = 1 and mod(floor(words["channel31"] / 64), 64) <> 63 {
        set clearMask to clearMask + 2.
    }
    if armed >= 4 and mod(words["channel32"], 1024) <> 1023 {
        set clearMask to clearMask + 4.
    }
    if clearMask > 0 {
        set words["trapBits"] to armed - clearMask.
        set words["interruptRequests"] to agcOr16(words["interruptRequests"], 1024).
    }
}

function agcCoreTimedDivider {
    parameter words, providers.
    set words["scalerResidual"] to words["scalerResidual"] - 80.
    local fullPhase is words["scalerPhase"] + 1.
    if fullPhase = 16384 {
        set fullPhase to 0.
        set words["scaler2"] to mod(words["scaler2"] + 1, 16384).
    }
    set words["scalerPhase"] to fullPhase.
    local phase is mod(fullPhase, 32).
    local reasons is 0.
    local longPhase is mod(fullPhase, 4096).

    if longPhase = 2048 {
        if not words["standby"] { set words["nightWatchman"] to 1. }
        if words["sbyPressed"] and (words["standby"] or mod(floor(words["channel13"] / 1024), 2) = 1) {
            if not words["standby"] {
                set words["standby"] to true.
                set words["sbyStillPressed"] to true.
                set reasons to 1.
                providers["standbyDisplay"]:call(words).
            } else if not words["sbyStillPressed"] {
                set words["standby"] to false.
                providers["standbyDisplay"]:call(words).
            }
        }
    } else if longPhase = 0 {
        if mod(floor(words["channel32"] / 8192), 2) = 0 { set words["sbyPressed"] to true. }
        if not words["standby"] and words["nightWatchman"] <> 0 {
            set reasons to 2.
            set words["channel77"] to agcOr16(words["channel77"], 16).
            set words["nightWatchmanTripped"] to true.
        } else {
            set words["nightWatchmanTripped"] to false.
        }
    } else if mod(phase, 8) = 0 {
        providers["warningFilter"]:call(words, fullPhase).
    }

    if not words["standby"] {
        local ruptPhase is mod(fullPhase, 512).
        if ruptPhase = 256 {
            set words["ruptLock"] to true.
            set words["noRupt"] to true.
        } else if ruptPhase = 192 and (words["ruptLock"] or words["noRupt"]) {
            set reasons to reasons + 4.
            set words["channel77"] to agcOr16(words["channel77"], 8).
        }
        if phase = 16 {
            set words["tcTrap"] to true.
            set words["noTC"] to true.
        } else if phase = 0 and (words["tcTrap"] or words["noTC"]) {
            set reasons to reasons + 8.
            set words["channel77"] to agcOr16(words["channel77"], 4).
        }

        agcCoreTimedTimerPhase(words, phase, providers["channelAdapter"]).
        if phase = 0 { providers["radarGate"]:call(words, phase). }
        if words["trapBits"] > 0 { agcCoreTimedHandTraps(words). }
        if phase = 30 { providers["radarGate"]:call(words, phase). }
    }

    if words["parityFail"] { set reasons to reasons + 16. }
    if reasons <> 0 { providers["alarm"]:call(words, reasons). }
    if words["extraDelay"] > 0 {
        set words["extraDelay"] to words["extraDelay"] - 1.
        return true.
    }
    return false.
}

function agcCoreTimedMct {
    parameter words, providers.
    providers["downlink"]:call(words).
    if words["windowMct"] = 0 { set words["restartLight"] to true. }
    set words["windowMct"] to words["windowMct"] + 1.
    set words["scalerResidual"] to words["scalerResidual"] + 3.
    set words["dskyTimer"] to words["dskyTimer"] + 3.
    until words["dskyTimer"] < 81920 {
        set words["dskyTimer"] to words["dskyTimer"] - 81920.
        set words["dskyFlash"] to mod(words["dskyFlash"] + 1, 4).
    }
    providers["display"]:call(words).
    if providers["input"]:call(words) { return "external-counter". }
    if words["extraDelay"] > 0 {
        set words["extraDelay"] to words["extraDelay"] - 1.
        return "extra-hold".
    }
    if words["pendingInstruction"] and words["pendDelay"] > 0 {
        set words["pendDelay"] to words["pendDelay"] - 1.
        return "pending-hold".
    }
    if providers["cdu"]:call(words) { return "cdu". }
    if mod(floor(words["channel32"] / 8192), 2) = 1 {
        set words["sbyPressed"] to false.
        set words["sbyStillPressed"] to false.
    }
    until words["scalerResidual"] < 80 {
        if agcCoreTimedDivider(words, providers) { return "scaler". }
    }
    if words["standby"] { return "standby". }
    providers["devices"]:call(words).
    return "cpu".
}
