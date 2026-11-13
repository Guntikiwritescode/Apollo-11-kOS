function agcTimerPinc {
    parameter word.
    if word = 16383 { return 0. }
    if word = 32767 { return 1. }
    return word + 1.
}

function agcServiceTimers {
    parameter phase, time1Word, time2Word, time3Word, time4Word, time5Word, time6Word, channel13.
    local request is 0.
    local delayCycles is 0.
    if phase = 16 {
        set delayCycles to 2.
        if time1Word = 16383 {
            set time2Word to agcTimerPinc(time2Word).
            set delayCycles to 3.
        }
        set time1Word to agcTimerPinc(time1Word).
        if time3Word = 16383 { set request to 3. }
        set time3Word to agcTimerPinc(time3Word).
    } else if phase = 0 {
        if time5Word = 16383 { set request to 2. }
        set time5Word to agcTimerPinc(time5Word).
        set delayCycles to 1.
    } else if phase = 8 {
        if time4Word = 16383 { set request to 4. }
        set time4Word to agcTimerPinc(time4Word).
        set delayCycles to 1.
    } else if mod(phase, 2) = 1 and channel13 >= 16384 {
        set delayCycles to 1.
        if time6Word = 0 or time6Word = 32767 {
            set request to 1.
            set channel13 to channel13 - 16384.
        } else {
            local deltaWord is 65534.
            if time6Word >= 16384 { set deltaWord to 1. }
            set time6Word to mod(agcAddSP16(agcSignExtend(time6Word), deltaWord), 32768).
        }
    }
    return list(time1Word, time2Word, time3Word, time4Word, time5Word, time6Word, request, channel13, delayCycles).
}
