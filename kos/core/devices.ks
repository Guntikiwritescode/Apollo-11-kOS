function segmentEvent {
    parameter words,kind,chan,raw.
    kLogEvent(words,kind,chan,raw).
}
function segmentDownlink {
    parameter words.
    if words["downruptTimeValid"] and words["windowMct"] >= words["downruptTime"] {
        set words["interruptRequests"] to agcOr16(words["interruptRequests"],256).
        set words["downruptTimeValid"] to false.
    }
}
function segmentDisplay {
    parameter words.
    set words["channelRoutineCount"] to mod(words["channelRoutineCount"] + 1, 8192).
    local old is words["dskyChannel163"].
    local ch11 is words["channel11"].
    local lampTest is mod(floor(words["channel13"] / 512), 2) = 1.
    // EL off stays latched through DSKY updates
    local lamps is old - mod(old,512) + mod(floor(old / 2),4) * 2.
    if words["restartLight"] or lampTest { set lamps to lamps + 128. }
    if words["standby"] or lampTest { set lamps to lamps + 256. }
    if mod(floor(ch11 / 8),2) = 1 or words["channel30"] >= 16384 { set lamps to lamps + 8. }
    if not words["standby"] and words["dskyFlash"] = 0 {
        set lamps to lamps + mod(floor(ch11 / 32),2) * 32.
    } else {
        set lamps to lamps + mod(floor(ch11 / 16),2) * 16 + mod(floor(ch11 / 64),2) * 64.
    }
    if words["warningFilter"] > 20000 {
        set lamps to lamps + 1.
        set words["channel33"] to words["channel33"] - mod(floor(words["channel33"] / 8192),2) * 8192.
    }
    if old <> lamps {
        set words["dskyChannel163"] to lamps.
        segmentEvent(words,"channel-output",115,lamps).
    }
}
function segmentStandby {
    parameter words.
    local old is words["dskyChannel163"].
    local lamps is old - agcAnd16(old,768).
    if words["standby"] { set lamps to lamps + 768. }
    set words["dskyChannel163"] to lamps.
    segmentEvent(words,"channel-output",115,lamps).
}
function segmentWarning {
    parameter words, phase.
    if mod(phase,512) = 256 and (words["generatedWarning"] or mod(floor(words["channel13"] / 512),2) = 1) {
        set words["generatedWarning"] to false.
        set words["warningFilter"] to min(140000,words["warningFilter"] + 15000).
    } else {
        set words["warningFilter"] to max(0,words["warningFilter"] - 15).
    }
}
function segmentRadar {
    parameter words, phase.
    if phase = 0 {
        if mod(floor(words["channel13"] / 8),2) = 1 {
            set words["radarGateCounter"] to mod(words["radarGateCounter"] + 1, 16).
        }
    } else if words["radarGateCounter"] = 9 {
        set words["radarGateCounter"] to 0.
        set words["channel13"] to words["channel13"] - mod(floor(words["channel13"] / 8),2) * 8.
        segmentEvent(words,"radar-request",0,0).
        if words["radarSelection"] >= 0 {
            if mod(words["channel13"],8) <> words["radarSelection"] {
                log ("radar selector at " + words["windowMct"]) to "0:/mismatch.txt".
            }
            set words[38] to words["radarWord"].
            set words["radarSelection"] to -1.
        }
        set words["interruptRequests"] to agcOr16(words["interruptRequests"],512).
    }
}
function segmentAlarm {
    parameter words, reasons.
    set words["extraDelay"] to mod(words["extraDelay"] + 2,8).
    set words[2] to words[5].
    set words[5] to 2048.
    set words["inInterrupt"] to false.
    set words["interruptEnabled"] to true.
    set words["parityFail"] to false.
    set words["trapBits"] to 0.
    set words["interruptRequests"] to 0.
    for chan in list(5,6,8,9,10,11,12) { agcCoreWriteIO(words,chan,0,segmentEvent@). }
    set words["channel33"] to agcOr16(words["channel33"],1024).
    agcCoreWriteIO(words,28,0,segmentEvent@).
    agcCoreWriteIO(words,29,0,segmentEvent@).
    set words["downruptTimeValid"] to false.
    set words["indexValue"] to 0.
    set words["extraCode"] to false.
    set words["substituteInstruction"] to false.
    set words["pendingInstruction"] to false.
    set words["pendDelay"] to 0.
    set words["tookBZF"] to false.
    set words["tookBZMF"] to false.
    if not words["standby"] {
        set words["restartLight"] to true.
        set words["generatedWarning"] to true.
    }
    segmentEvent(words,"channel-output",63,words["channel77"]).
}
function segmentNoInput { parameter words. return false. }
function segmentDevices {
    parameter words.
    agcCoreImuDevices(words,segmentEvent@).
    local ch14 is words["channel14"].
    if words[30] <> 0 and mod(floor(ch14 / 1024),2) = 1 {
        segmentEvent(words,"channel-output",122,words[30]).
        set words[30] to 0.
    }
    if words[29] <> 0 and mod(floor(ch14 / 2048),2) = 1 {
        segmentEvent(words,"channel-output",121,words[29]).
        set words[29] to 0.
    }
}
function segmentAccess {
    parameter words, address, slot.
}
function segmentPhysical { parameter words, slot. return words[slot]. }
function segmentEffective { parameter words, address. return words[agcCoreResolve(words,address)]. }
local segmentProviders is lexicon(
    "downlink",segmentDownlink@, "display",segmentDisplay@, "input",segmentNoInput@,
    "cdu",segmentCduService@, "standbyDisplay",segmentStandby@, "warningFilter",segmentWarning@,
    "radarGate",segmentRadar@, "alarm",segmentAlarm@, "devices",segmentDevices@,
    "channelAdapter",segmentEvent@).
