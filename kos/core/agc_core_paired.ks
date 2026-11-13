// Isolated instruction bodies. Fetch, holds, admission, raw Z increment and
// AllDone are supplied by the shared execution core.

// Native MP always performs FindMemoryWord, including direct register MP.
// Caller supplies its raw contents and accounts for access and rope parity.
function agcCoreMp {
    parameter words, address, operandRaw.
    if address < 3 {
        set operandRaw to agcOverflowCorrected(words[address]).
    }
    local operand is mod(operandRaw, 32768).
    if operandRaw <= 32767 or (operand <> 0 and operand <> 32767) {
        agcSpTrigMp(words, operand).
        return.
    }

    // Switched bank zero may expose a raw register as a memory operand.
    // Native zero checks use the uncorrected container in this branch.
    local accumulator is agcOverflowCorrected(words[0]).
    local negativeZero is (accumulator = 0 and operand = 32767)
        or (accumulator = 32767 and operand = 0).
    local result is choose 65535 if negativeZero else 0.
    set words[0] to result.
    set words[1] to result.
}

// DAS resolves the low destination and reads the preceding physical slot.
// Encoded direct registers use raw width for the appropriate half.
function agcCoreDas {
    parameter words, lowAddress.
    if lowAddress = 0 {
        // The native predecessor read is before erasable bank zero here.
        // No hardware result is established by this development packet.
        return false.
    }

    local lowSlot is 1.
    if lowAddress <> 1 {
        set lowSlot to agcCoreResolve(words, lowAddress).
        if lowSlot = 0 { return false. }
        if lowAddress >= 4 and lowSlot >= 21 and lowSlot < 2048 {
            agcDasErasable(words, lowSlot - 1).
            return true.
        }
    }

    local lowOperand is words[lowSlot].
    local highOperand is words[lowSlot - 1].
    if lowAddress >= 3 { set lowOperand to agcSignExtend(mod(lowOperand, 32768)). }
    if lowAddress >= 4 { set highOperand to agcSignExtend(mod(highOperand, 32768)). }

    local lowSum is agcAddSP16(words[1], lowOperand).
    local highSum is agcAddSP16(words[0], highOperand).
    local lowOverflow is agcOverflowDirection(lowSum).
    if lowOverflow = 1 { set highSum to agcAddSP16(highSum, 1). }
    if lowOverflow = -1 { set highSum to agcAddSP16(highSum, 65534). }
    local correctedLow is agcOverflowCorrected(lowSum).

    if lowAddress = 1 {
        set words[0] to highSum.
        set words[1] to agcSignExtend(correctedLow).
        return true.
    }

    local highOverflow is agcOverflowDirection(highSum).
    set words[0] to choose 65534 if highOverflow = -1 else highOverflow.
    set words[1] to 0.
    if lowAddress < 3 { set words[lowAddress] to agcSignExtend(correctedLow). }
    else { agcCoreAssign(words, lowSlot, correctedLow). }
    if lowAddress < 4 { set words[lowAddress - 1] to highSum. }
    else { agcCoreAssign(words, lowSlot - 1, agcOverflowCorrected(highSum)). }
    return true.
}

function agcCoreSignedSp {
    parameter raw.
    return choose raw - 32767 if raw >= 16384 else raw.
}

// Exceptional DV executes the original 14 restoring decisions on raw words.
// The caller has already applied direct A/L/Z divisor transformations.
function agcCoreDvExceptional {
    parameter words, divisor.
    local high is words[0].
    local low is words[1].
    local negativeDividend is high >= 32768.
    if not negativeDividend { set high to 65535 - high. }
    if high = 65535 { set negativeDividend to low >= 32768. }
    if negativeDividend { set low to 65535 - low. }
    set low to agcAddSP16(low, 16384).
    if agcOverflowDirection(low) <> 1 { set high to agcAddSP16(high, 1). }

    local remainder is high.
    local negativeDivisor is divisor >= 32768.
    if negativeDivisor { set divisor to 65535 - divisor. }
    local quotientSign is choose 32768 if low >= 32768 else 0.
    local quotient is quotientSign + 2 * mod(low, 16384) + quotientSign / 32768.
    from { local digit is 0. } until digit = 14 step { set digit to digit + 1. } do {
        set quotient to mod(quotient * 2, 65536).
        local remainderSign is choose 32768 if remainder >= 32768 else 0.
        set remainder to remainderSign + 2 * mod(remainder, 16384).
        if quotient < 32768 { set remainder to remainder + remainderSign / 32768. }
        local trial is agcAddSP16(remainder, divisor).
        if trial >= 32768 {
            set quotient to quotient + 1.
            set remainder to trial.
        }
    }
    set quotient to quotientSign + mod(quotient, 32768).
    set words[0] to choose 65535 - quotient if negativeDividend <> negativeDivisor else quotient.
    set words[1] to choose remainder if negativeDividend else 65535 - remainder.
}

// Caller supplies memory raw bits only for addresses other than A, L, Q and Z,
// after performing the shared read. No editing writeback occurs.
function agcCoreDv {
    parameter words, address, operandRaw.
    local high is words[0].
    local low is words[1].
    local highWord is agcOverflowCorrected(high).
    local lowWord is mod(low, 32768).
    local highValue is agcCoreSignedSp(highWord).
    local lowValue is agcCoreSignedSp(lowWord).
    local dividend is highValue * 16384 + lowValue.
    // SpToDecent tests the entire signed L container against SP ±0.
    // In the mixed-sign case, a zero alias outside those two patterns
    // takes the borrow path, leaving an all-zero low magnitude digit.
    if highValue <> 0 and lowValue = 0 and low <> 0 and low <> 32767
        and (highWord >= 16384) <> (lowWord >= 16384) {
        set dividend to dividend + (choose 16384 if highValue < 0 else -16384).
    }
    local absDividend is abs(dividend).
    local absHigh is floor(absDividend / 16384).
    local absLow is mod(absDividend, 16384).
    local negativeAliasDividend is choose low >= 32768 if absHigh = 0 else high >= 32768.
    local divisor is agcSignExtend(mod(operandRaw, 32768)).
    if address = 0 {
        set divisor to choose high if high >= 32768 else 65535 - high.
    } else if address = 1 {
        local aliasLow is choose 65535 - low if negativeAliasDividend else low.
        set divisor to agcSignExtend(agcOverflowCorrected(agcAddSP16(aliasLow, 16384))).
    } else if address = 2 {
        set divisor to words[2].
    } else if address = 5 {
        set divisor to mod(words[5], 32768) + 32768.
        if not negativeAliasDividend { set divisor to words[5]. }
    }

    local divisorWord is agcOverflowCorrected(divisor).
    local divisorValue is agcCoreSignedSp(divisorWord).
    local absDivisor is abs(divisorValue).
    if absHigh > absDivisor or (absHigh = absDivisor and absLow <> 0)
        or agcOverflowDirection(divisor) <> 0 {
        agcCoreDvExceptional(words, divisor).
        return.
    }

    if absDividend = 0 {
        local magnitude is choose 16383 if absDivisor = 0 else 0.
        local negativeQuotient is (lowWord >= 16384) <> (divisorWord >= 16384).
        set words[0] to choose 65535 - magnitude if negativeQuotient else magnitude.
        return.
    }

    if absHigh = absDivisor {
        set words[0] to choose 16383 if (dividend < 0) = (divisorValue < 0) else 49152.
        set words[1] to choose 65535 - absHigh if dividend < 0 else absHigh.
        return.
    }

    local quotient is floor(absDividend / absDivisor).
    local remainder is absDividend - quotient * absDivisor.
    if quotient <> 0 and (dividend < 0) <> (divisorValue < 0) {
        set quotient to 65535 - quotient.
    }
    set words[0] to quotient.
    set words[1] to choose 65535 - remainder if dividend < 0 else remainder.
}
