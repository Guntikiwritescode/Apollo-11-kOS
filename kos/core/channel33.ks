function agcWarningInput33 {
    parameter inputWord, warningFilter.
    if warningFilter > 20000 and mod(floor(inputWord / 8192), 2) = 1 {
        return inputWord - 8192.
    }
    return inputWord.
}

function agcResetChannel33 {
    parameter inputWord, warningFilter.
    return agcWarningInput33(mod(inputWord, 1024) + 31744, warningFilter).
}
