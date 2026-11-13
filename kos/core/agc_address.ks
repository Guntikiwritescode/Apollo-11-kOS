// PORT: Preserve Block II effective-address aliases using a single slot key.
// Erasable banks occupy the first 2048 slots. Fixed banks follow.

function agcAddressSlot {
    parameter effectiveAddress, ebankWord, fbankWord, channel7Word.
    if effectiveAddress < 768 {
        return effectiveAddress.
    }
    if effectiveAddress < 1024 {
        local erasableBank is mod(floor(ebankWord / 256), 8).
        return erasableBank * 256 + mod(effectiveAddress, 256).
    }

    local fixedBank is 2.
    if effectiveAddress < 2048 {
        set fixedBank to mod(floor(fbankWord / 1024), 32).
        local extension is mod(floor(channel7Word / 16), 8).
        // Preserve the decoded address even when no rope is installed there.
        if fixedBank >= 24 and extension >= 4 {
            set fixedBank to fixedBank + (extension - 3) * 8.
        }
    } else if effectiveAddress >= 3072 {
        set fixedBank to 3.
    }
    return 2048 + fixedBank * 1024 + mod(effectiveAddress, 1024).
}

// PORT: Single-store mirroring. The incoming bank registers are consistent.
function agcBankRegistersAfterStore {
    parameter registerSlot, word, ebankWord, fbankWord.
    if registerSlot = 3 {
        set ebankWord to mod(floor(word / 256), 8) * 256.
    } else if registerSlot = 4 {
        set fbankWord to floor(word / 1024) * 1024.
    } else {
        // The remaining supported destination is BBANK (06).
        set ebankWord to mod(word, 8) * 256.
        set fbankWord to floor(word / 1024) * 1024.
    }
    return list(ebankWord, fbankWord, fbankWord + floor(ebankWord / 256)).
}

// PORT: The superbank output latch is also the channel 7 readback word.
function agcChannel7Latch {
    parameter word.
    return mod(floor(word / 16), 8) * 16.
}

// PORT: The reference clears Night Watchman on a 0067 memory access.
// Call with the effective address before converting it to a physical slot.
function agcWatchmanAfterAccess {
    parameter effectiveAddress, armed.
    if effectiveAddress = 55 {
        return 0.
    }
    return armed.
}
