function agcDasErasable {
    parameter words, highSlot.
    local lowSum is agcAddSP16(words[1], agcSignExtend(words[highSlot + 1])).
    local highSum is agcAddSP16(words[0], agcSignExtend(words[highSlot])).
    local lowOverflow is agcOverflowDirection(lowSum).
    if lowOverflow > 0 {
        set highSum to agcAddSP16(highSum, 1).
    } else if lowOverflow < 0 {
        set highSum to agcAddSP16(highSum, 65534).
    }
    local highOverflow is agcOverflowDirection(highSum).
    set words[0] to choose 1 if highOverflow > 0 else 0.
    if highOverflow < 0 { set words[0] to 65534. }
    set words[1] to 0.
    set words[highSlot] to agcOverflowCorrected(highSum).
    set words[highSlot + 1] to agcOverflowCorrected(lowSum).
}
