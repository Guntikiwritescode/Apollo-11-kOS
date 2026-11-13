function segmentStepTo {
    parameter words, endCycle.
    until words["windowMct"] >= endCycle {
        local phase is agcCoreComposedMct(words,segmentProviders,segmentEffective@,segmentPhysical@,segmentPhysical@,segmentEvent@).
        if phase = "unresolved-domain" or phase = "unresolved-body" {
            log ("stopped " + words["windowMct"] + " " + phase) to "0:/mismatch.txt".
            return false.
        }
    }
    return true.
}
function segmentCompare {
    parameter words, keys, expected.
    from { local i is 0. } until i = keys:length step { set i to i + 1. } do {
        local value is words[keys[i]].
        if value:istype("Boolean") { set value to choose 1 if value else 0. }
        if value <> expected[i] {
            log (words["windowMct"] + " key " + keys[i] + " expected " + expected[i] + " actual " + value) to "0:/mismatch.txt".
            return false.
        }
    }
    return true.
}
function segmentCompareNested {
    parameter value, expected, fieldName.
    if expected:istype("List") {
        if value:length <> expected:length {
            log (fieldName + " expected length " + expected:length + " actual " + value:length) to "0:/mismatch.txt".
            return false.
        }
        from { local i is 0. } until i = expected:length step { set i to i + 1. } do {
            if not segmentCompareNested(value[i],expected[i],fieldName + "[" + i + "]") { return false. }
        }
    } else if value <> expected {
        log (fieldName + " expected " + expected + " actual " + value) to "0:/mismatch.txt".
        return false.
    }
    return true.
}
function segmentLoad {
    parameter words, first, values.
    local address is first.
    for value in values {
        set words[address] to value.
        set address to address + 1.
    }
}
function segmentCounter {
    parameter words, reg, typ.
    if typ = 0 or typ = 2 {
        agcCorePipaPulse(words,reg,choose 1 if typ = 0 else -1).
    } else if typ = 1 or typ = 3 or typ = 17 or typ = 19 {
        if reg >= 26 and reg <= 28 { segmentCduPush(words,reg,typ). }
        else { set words[reg] to mod(words[reg] + (choose 1 if mod(typ,4) = 1 else -1) + 32768,32768). }
    } else if typ = 5 or typ = 6 {
        set words[reg] to mod(words[reg] * 2 + typ - 5,16384).
    } else if typ = 4 {
        local value is words[reg].
        local pulse is 15.
        if value <> 0 and value <> 32767 {
            if value >= 16384 {
                set words[reg] to agcAddSP16(agcSignExtend(value),1) - 32768.
                set pulse to 14.
            } else {
                set words[reg] to mod(agcAddSP16(value,65534),32768).
                set pulse to 13.
            }
        }
        if reg <> 0 { segmentEvent(words,"channel-output",128 + reg,pulse). }
    }
}

// Preserve the native ring position and retired slots across checkpoint restores.
function segmentCduPush {
    parameter words, slot, code.
    local fifo is words["imuCduFifos"][slot - 26].
    local counts is fifo[0].
    local tag is (choose 2 if code >= 16 else 0) + (choose 1 if mod(code,4) = 3 else 0).
    if fifo[4] = 0 {
        set fifo[1] to words["windowMct"] + (choose 13 if code >= 16 else 213).
        set fifo[2] to 1.
        set fifo[3] to 0.
        set fifo[4] to 1.
        set counts[0] to tag * 1073741824.0 + 1.
    } else {
        local tail is mod(fifo[3] + fifo[4] - 1,128).
        if floor(counts[tail] / 1073741824.0) = tag {
            set counts[tail] to counts[tail] + 1.
        } else if fifo[4] < 128 {
            set counts[mod(tail + 1,128)] to tag * 1073741824.0 + 1.
            set fifo[4] to fifo[4] + 1.
        }
    }
}
function segmentCduService {
    parameter words.
    local axis is words["imuCduChecker"].
    set words["imuCduChecker"] to mod(axis + 1,3).
    local fifo is words["imuCduFifos"][axis].
    if fifo[4] = 0 or words["windowMct"] < fifo[1] { return false. }
    local ptr is fifo[3].
    local raw is fifo[0][ptr].
    local direction is choose 1 if mod(floor(raw / 1073741824.0),2) = 0 else -1.
    set words[26 + axis] to mod(words[26 + axis] + 32768 + direction,32768).
    if mod(raw,1073741824.0) = 1 {
        set fifo[3] to mod(ptr + 1,128).
        set fifo[4] to fifo[4] - 1.
    } else { set fifo[0][ptr] to raw - 1. }
    if fifo[1] = 0 { set fifo[1] to words["windowMct"]. }
    set fifo[1] to fifo[1] + (choose 13 if raw >= 2147483648.0 else 213) + (choose 1 if fifo[2] = 2 else 0).
    set fifo[2] to mod(fifo[2] + 1,3).
    return true.
}
