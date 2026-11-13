function agcCoreExternalWriteIO {
    parameter words, channel, value.
    local raw is mod(value, 32768).
    local key is "channel" + (floor(channel / 64) * 100
        + mod(floor(channel / 8), 8) * 10 + mod(channel, 8)):tostring.
    if channel = 1 or channel = 2 {
        set words[channel] to raw.
    } else if channel = 3 {
        set key to "scaler2".
    } else if channel = 4 {
        set key to "scalerPhase".
    } else if channel = 7 {
        set key to "channel7Input".
    } else if channel = 8 {
        set words["outputChannel10"][floor(raw / 2048)] to raw.
    } else if (channel = 13 or channel = 14) and raw = 18 {
        set words["restartLight"] to false.
    } else if channel = 27 {
        set raw to words["channel33"] - mod(words["channel33"], 1024) + mod(raw, 1024).
    }
    set words[key] to raw.
}

function agcCoreWriteIO {
    parameter words, channel, raw15, channelAdapter.
    channelAdapter:call(words, "channel-bus", channel, raw15).
    local value is raw15.
    if channel = 11 {
        set words["trapBits"] to agcOr16(words["trapBits"], mod(floor(value / 2048), 8)).
        set value to mod(value, 2048) + floor(value / 16384) * 16384.
    } else if channel = 27 {
        set value to agcResetChannel33(words["channel33"], words["warningFilter"]).
        set words["channel33"] to value.
    } else if channel = 63 {
        set value to choose 16 if words["nightWatchmanTripped"] else 0.
    } else if channel = 9 and mod(floor(value / 512), 2) = 1 {
        set words["restartLight"] to false.
    }

    agcCoreExternalWriteIO(words, channel, value).
    if channel = 7 {
        set words["channel7"] to agcChannel7Latch(value).
        set words["channel7Input"] to words["channel7"].
        channelAdapter:call(words, "channel-bank", channel, words["channel7"]).
    } else {
        if channel = 11 and mod(floor(value / 128), 4) = 3 and words["lunarModule"] {
            local rhcWords is words["rhcWords"].
            set words[34] to rhcWords[0].
            set words[35] to rhcWords[1].
            set words[36] to rhcWords[2].
        }
        channelAdapter:call(words, "channel-output", channel, value).
    }

    if channel = 28 {
        set words["downlink"] to agcOr16(words["downlink"], 1).
    } else if channel = 29 {
        set words["downlink"] to agcOr16(words["downlink"], 2).
    }
    if words["downlink"] = 3 {
        set words["downruptTimeValid"] to true.
        set words["downruptTime"] to words["windowMct"] + 1706.
        set words["downlink"] to 0.
    }
}
