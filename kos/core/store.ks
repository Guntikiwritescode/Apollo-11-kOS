function agcOverflowDirection {
    parameter accumulator.
    local signPair is floor(accumulator / 16384).
    if signPair = 1 { return 1. }
    if signPair = 2 { return -1. }
    return 0.
}

function agcStoreAccumulator {
    parameter accumulator, erasableSlot.
    local storedWord is agcEditedWord(erasableSlot, agcOverflowCorrected(accumulator)).
    local overflowDirection is agcOverflowDirection(accumulator).
    if overflowDirection = 0 {
        return list(accumulator, storedWord, 0).
    }
    if overflowDirection > 0 {
        return list(1, storedWord, 1).
    }
    return list(65534, storedWord, 1).
}

function agcNormalizeLink {
    parameter word.
    return agcSignExtend(agcOverflowCorrected(word)).
}
