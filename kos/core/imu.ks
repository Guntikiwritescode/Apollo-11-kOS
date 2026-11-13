function agcCorePipaPulse {
    parameter words, slot, direction.
    if direction = 1 {
        set words[slot] to agcTimerPinc(words[slot]).
    } else if words[slot] = 16384 {
        set words[slot] to 32767.
    } else if words[slot] = 0 {
        set words[slot] to 32766.
    } else {
        set words[slot] to words[slot] - 1.
    }
}

function agcCoreImuCduPush {
    parameter words, slot, code.
    local fifo is words["imuCduFifos"][slot - 26].
    local entries is fifo[0].
    if entries:length = 0 {
        local interval is 213.
        if code >= 16 { set interval to 13. }
        set fifo[1] to words["windowMct"] + interval.
        set fifo[2] to 1.
        entries:add(list(code, 1)).
        return.
    }
    local tail is entries[entries:length - 1].
    if tail[0] = code {
        set tail[1] to tail[1] + 1.
    } else if entries:length < 128 {
        entries:add(list(code, 1)).
    }
}

function agcCoreImuCdu {
    parameter words.
    local axis is words["imuCduChecker"].
    set words["imuCduChecker"] to mod(axis + 1, 3).
    local fifo is words["imuCduFifos"][axis].
    local entries is fifo[0].
    if entries:length = 0 or words["windowMct"] < fifo[1] { return false. }

    local entry is entries[0].
    local code is entry[0].
    local stepSize is 1.
    if mod(code, 4) = 3 { set stepSize to -1. }
    local slot is 26 + axis.
    set words[slot] to mod(words[slot] + stepSize + 32768, 32768).
    set entry[1] to entry[1] - 1.
    if entry[1] = 0 { entries:remove(0). }
    local interval is 213.
    if code >= 16 { set interval to 13. }
    if fifo[2] = 2 { set interval to interval + 1. }
    set fifo[1] to fifo[1] + interval.
    set fifo[2] to mod(fifo[2] + 1, 3).
    return true.
}

function agcCoreImuDevices {
    parameter words, channelAdapter.
    local ch14 is words["channel14"].
    if mod(floor(ch14 / 512), 2) = 1 and words[39] <> 0 {
        until words["imuGyroCount"] = 0 {
            local burst is min(words["imuGyroCount"], 2047).
            channelAdapter:call(words, "channel-output", 127, words["imuGyroBits"] + burst).
            set words["imuGyroCount"] to words["imuGyroCount"] - burst.
        }
        set words["imuGyroCount"] to words[39].
        set words[39] to 0.
        set words["imuGyroBits"] to mod(floor(ch14 / 32), 16) * 2048.
        set words["imuGyroTimer"] to 127994.
    }
    set words["imuGyroTimer"] to words["imuGyroTimer"] + 6.
    if words["imuGyroTimer"] >= 128000 {
        set words["imuGyroTimer"] to words["imuGyroTimer"] - 128000.
        if words["imuGyroCount"] > 0 {
            local burst is min(words["imuGyroCount"], 1024).
            channelAdapter:call(words, "channel-output", 127, words["imuGyroBits"] + burst).
            set words["imuGyroCount"] to words["imuGyroCount"] - burst.
        }
    }

    if ch14 < 4096 { return. }
    local pending is words["imuCoarseCounts"].
    if pending[0] = 0 and pending[1] = 0 and pending[2] = 0 {
        set words["imuCoarseNext"] to words["windowMct"].
    }
    if words["windowMct"] < words["imuCoarseNext"] { return. }
    set words["imuCoarseNext"] to words["imuCoarseNext"] + 6400.
    local mask is 16384.
    from { local axis is 0. } until axis = 3 step { set axis to axis + 1. } do {
        if mod(floor(ch14 / mask), 2) = 1 {
            local command is words[40 + axis].
            set words[40 + axis] to 0.
            if command >= 16384 { set command to command - 32767. }
            set pending[axis] to pending[axis] + command.
        }
        local burst is min(abs(pending[axis]), 24).
        if pending[axis] < 0 {
            channelAdapter:call(words, "channel-output", 124 + axis, 16384 + burst).
            set pending[axis] to pending[axis] + burst.
        } else if burst > 0 {
            channelAdapter:call(words, "channel-output", 124 + axis, burst).
            set pending[axis] to pending[axis] - burst.
        }
        set mask to mask / 2.
    }
}
