function agcSignExtend {
    parameter word.
    if word >= 16384 {
        return word + 32768.
    }
    return word.
}

function agcOverflowCorrected {
    parameter accumulator.
    local magnitudeBits is mod(accumulator, 16384).
    if accumulator >= 32768 {
        return magnitudeBits + 16384.
    }
    return magnitudeBits.
}

function agcAddSP16 {
    parameter leftWord, rightWord.
    local sumWord is leftWord + rightWord.
    if sumWord >= 65536 {
        return sumWord - 65535.
    }
    return sumWord.
}
