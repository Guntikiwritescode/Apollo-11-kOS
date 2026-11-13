// PORT: Accumulator overflow direction from the two raw sign positions.
function agcOverflowDirection {
    parameter accumulator.
    local signPair is floor(accumulator / 16384).
    if signPair = 1 { return 1. }
    if signPair = 2 { return -1. }
    return 0.
}

// PORT: TS to ordinary erasable or an editing register.
// Return A, stored word and number of instructions skipped.
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

// PORT: Normalize L at the reference's instruction boundary. Q retains raw A.
function agcNormalizeLink {
    parameter word.
    return agcSignExtend(agcOverflowCorrected(word)).
}
