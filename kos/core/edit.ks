function agcEditedWord {
    parameter erasableSlot, word.
    if erasableSlot = 16 {
        return floor(word / 2) + mod(word, 2) * 16384.
    }
    if erasableSlot = 17 {
        return floor(word / 2) + floor(word / 16384) * 16384.
    }
    if erasableSlot = 18 {
        return mod(word * 2, 32768) + floor(word / 16384).
    }
    if erasableSlot = 19 {
        return mod(floor(word / 128), 128).
    }
    return word.
}
