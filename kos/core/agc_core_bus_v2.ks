// Isolated v2. Invoke the required provider at original FindMemoryWord.
// Load this replacement instead of v1. Other helpers retain their v1 code.
function agcCoreResolve {
    parameter words, effectiveAddress.
    local address is effectiveAddress - 4096 * floor(effectiveAddress / 4096).
    set words["nightWatchman"] to agcWatchmanAfterAccess(address, words["nightWatchman"]).
    local slot is agcAddressSlot(address, words[3], words[4], words["channel7"]).
    words["accessProvider"]:call(words, address, slot).
    return slot.
}

// Original Assign takes a resolved physical key and a native integer.
function agcCoreAssign {
    parameter words, physicalSlot, value.
    if physicalSlot < 0 or physicalSlot >= 2048 { return. }
    if physicalSlot < 3 {
        set words[physicalSlot] to value - 65536 * floor(value / 65536).
        return.
    }
    if physicalSlot = 5 { set words["nextZ"] to value. }
    if physicalSlot = 7 {
        set words[7] to 0.
        return.
    }
    local rawWord is value - 32768 * floor(value / 32768).
    if physicalSlot >= 16 and physicalSlot <= 19 {
        set rawWord to agcEditedWord(physicalSlot, rawWord).
    }
    set words[physicalSlot] to rawWord.
}

// Original AllDone. Inputs preserve the pre-fetch EB/FB/BB snapshot.
function agcCoreFinish {
    parameter words, oldEB, oldFB, oldBB, keepExtraCode, executedTC,
        tcTransient, justTookBZF, justTookBZMF.
    if words["pendingInstruction"] { return. }

    set words[7] to 0.
    set words["channel7"] to agcChannel7Latch(words["channel7"]).
    set words["channel7Input"] to words["channel7"].
    local zWidth is choose 65536 if words["substituteInstruction"] else 4096.
    local nextZ is words["nextZ"].
    set words[5] to nextZ - zWidth * floor(nextZ / zWidth).
    if not keepExtraCode { set words["extraCode"] to false. }

    if words[6] <> oldBB {
        set words[4] to mod(floor(words[6] / 1024), 32) * 1024.
        set words[3] to mod(words[6], 8) * 256.
    } else if words[3] <> oldEB or words[4] <> oldFB {
        set words[6] to mod(floor(words[4] / 1024), 32) * 1024
            + mod(floor(words[3] / 256), 8).
    }
    set words[3] to mod(floor(words[3] / 256), 8) * 256.
    set words[4] to mod(floor(words[4] / 1024), 32) * 1024.
    set words[6] to mod(floor(words[6] / 1024), 32) * 1024 + mod(words[6], 8).
    set words[1] to agcNormalizeLink(words[1]).

    if words["inInterrupt"] { set words["noRupt"] to false. }
    else { set words["ruptLock"] to false. }
    if executedTC or tcTransient { set words["noTC"] to false. }
    if not executedTC { set words["tcTrap"] to false. }
    set words["tookBZF"] to justTookBZF.
    set words["tookBZMF"] to justTookBZMF.
}

// Inclusive first oscillator deadline; readiness can defer service.
function agcCoreNextDividerMct {
    parameter words.
    return words["windowMct"] + max(1, ceiling((80 - words["scalerResidual"]) / 3)).
}

// Advance only the digital clocks of a caller-proven quiet span.
// The caller separately preserves instruction and device-provider effects.
function agcCoreAdvanceQuiet {
    parameter words, mcts, nextEventMct.
    if mcts <= 0 or words["standby"] or words["pendingInstruction"]
        or words["extraDelay"] <> 0 { return false. }
    local endMct is words["windowMct"] + mcts.
    local scalerResidual is words["scalerResidual"] + 3 * mcts.
    local dskyTimer is words["dskyTimer"] + 3 * mcts.
    if endMct >= nextEventMct or scalerResidual >= 80 or dskyTimer >= 81920 {
        return false.
    }
    set words["windowMct"] to endMct.
    set words["scalerResidual"] to scalerResidual.
    set words["dskyTimer"] to dskyTimer.
    return true.
}

// Original input channels, with the existing octal-named lexicon keys.
local coreChannelKeys is list(
    "channel0", "channel1", "channel2", "scaler2", "scalerPhase", "channel5", "channel6", "channel7Input",
    "channel10", "channel11", "channel12", "channel13", "channel14", "channel15", "channel16", "channel17",
    "channel20", "channel21", "channel22", "channel23", "channel24", "channel25", "channel26", "channel27",
    "channel30", "channel31", "channel32", "channel33", "channel34", "channel35", "channel36", "channel37",
    "channel40", "channel41", "channel42", "channel43", "channel44", "channel45", "channel46", "channel47",
    "channel50", "channel51", "channel52", "channel53", "channel54", "channel55", "channel56", "channel57",
    "channel60", "channel61", "channel62", "channel63", "channel64", "channel65", "channel66", "channel67",
    "channel70", "channel71", "channel72", "channel73", "channel74", "channel75", "channel76", "channel77",
    "channel100", "channel101", "channel102", "channel103", "channel104", "channel105", "channel106", "channel107",
    "channel110", "channel111", "channel112", "channel113", "channel114", "channel115", "channel116", "channel117",
    "channel120", "channel121", "channel122", "channel123", "channel124", "channel125", "channel126", "channel127",
    "channel130", "channel131", "channel132", "channel133", "channel134", "channel135", "channel136", "channel137",
    "channel140", "channel141", "channel142", "channel143", "channel144", "channel145", "channel146", "channel147",
    "channel150", "channel151", "channel152", "channel153", "channel154", "channel155", "channel156", "channel157",
    "channel160", "channel161", "channel162", "channel163", "channel164", "channel165", "channel166", "channel167",
    "channel170", "channel171", "channel172", "channel173", "channel174", "channel175", "channel176", "channel177",
    "channel200", "channel201", "channel202", "channel203", "channel204", "channel205", "channel206", "channel207",
    "channel210", "channel211", "channel212", "channel213", "channel214", "channel215", "channel216", "channel217",
    "channel220", "channel221", "channel222", "channel223", "channel224", "channel225", "channel226", "channel227",
    "channel230", "channel231", "channel232", "channel233", "channel234", "channel235", "channel236", "channel237",
    "channel240", "channel241", "channel242", "channel243", "channel244", "channel245", "channel246", "channel247",
    "channel250", "channel251", "channel252", "channel253", "channel254", "channel255", "channel256", "channel257",
    "channel260", "channel261", "channel262", "channel263", "channel264", "channel265", "channel266", "channel267",
    "channel270", "channel271", "channel272", "channel273", "channel274", "channel275", "channel276", "channel277",
    "channel300", "channel301", "channel302", "channel303", "channel304", "channel305", "channel306", "channel307",
    "channel310", "channel311", "channel312", "channel313", "channel314", "channel315", "channel316", "channel317",
    "channel320", "channel321", "channel322", "channel323", "channel324", "channel325", "channel326", "channel327",
    "channel330", "channel331", "channel332", "channel333", "channel334", "channel335", "channel336", "channel337",
    "channel340", "channel341", "channel342", "channel343", "channel344", "channel345", "channel346", "channel347",
    "channel350", "channel351", "channel352", "channel353", "channel354", "channel355", "channel356", "channel357",
    "channel360", "channel361", "channel362", "channel363", "channel364", "channel365", "channel366", "channel367",
    "channel370", "channel371", "channel372", "channel373", "channel374", "channel375", "channel376", "channel377",
    "channel400", "channel401", "channel402", "channel403", "channel404", "channel405", "channel406", "channel407",
    "channel410", "channel411", "channel412", "channel413", "channel414", "channel415", "channel416", "channel417",
    "channel420", "channel421", "channel422", "channel423", "channel424", "channel425", "channel426", "channel427",
    "channel430", "channel431", "channel432", "channel433", "channel434", "channel435", "channel436", "channel437",
    "channel440", "channel441", "channel442", "channel443", "channel444", "channel445", "channel446", "channel447",
    "channel450", "channel451", "channel452", "channel453", "channel454", "channel455", "channel456", "channel457",
    "channel460", "channel461", "channel462", "channel463", "channel464", "channel465", "channel466", "channel467",
    "channel470", "channel471", "channel472", "channel473", "channel474", "channel475", "channel476", "channel477",
    "channel500", "channel501", "channel502", "channel503", "channel504", "channel505", "channel506", "channel507",
    "channel510", "channel511", "channel512", "channel513", "channel514", "channel515", "channel516", "channel517",
    "channel520", "channel521", "channel522", "channel523", "channel524", "channel525", "channel526", "channel527",
    "channel530", "channel531", "channel532", "channel533", "channel534", "channel535", "channel536", "channel537",
    "channel540", "channel541", "channel542", "channel543", "channel544", "channel545", "channel546", "channel547",
    "channel550", "channel551", "channel552", "channel553", "channel554", "channel555", "channel556", "channel557",
    "channel560", "channel561", "channel562", "channel563", "channel564", "channel565", "channel566", "channel567",
    "channel570", "channel571", "channel572", "channel573", "channel574", "channel575", "channel576", "channel577",
    "channel600", "channel601", "channel602", "channel603", "channel604", "channel605", "channel606", "channel607",
    "channel610", "channel611", "channel612", "channel613", "channel614", "channel615", "channel616", "channel617",
    "channel620", "channel621", "channel622", "channel623", "channel624", "channel625", "channel626", "channel627",
    "channel630", "channel631", "channel632", "channel633", "channel634", "channel635", "channel636", "channel637",
    "channel640", "channel641", "channel642", "channel643", "channel644", "channel645", "channel646", "channel647",
    "channel650", "channel651", "channel652", "channel653", "channel654", "channel655", "channel656", "channel657",
    "channel660", "channel661", "channel662", "channel663", "channel664", "channel665", "channel666", "channel667",
    "channel670", "channel671", "channel672", "channel673", "channel674", "channel675", "channel676", "channel677",
    "channel700", "channel701", "channel702", "channel703", "channel704", "channel705", "channel706", "channel707",
    "channel710", "channel711", "channel712", "channel713", "channel714", "channel715", "channel716", "channel717",
    "channel720", "channel721", "channel722", "channel723", "channel724", "channel725", "channel726", "channel727",
    "channel730", "channel731", "channel732", "channel733", "channel734", "channel735", "channel736", "channel737",
    "channel740", "channel741", "channel742", "channel743", "channel744", "channel745", "channel746", "channel747",
    "channel750", "channel751", "channel752", "channel753", "channel754", "channel755", "channel756", "channel757",
    "channel760", "channel761", "channel762", "channel763", "channel764", "channel765", "channel766", "channel767",
    "channel770", "channel771", "channel772", "channel773", "channel774", "channel775", "channel776", "channel777").

function agcCoreReadIO {
    parameter words, channel.
    if channel = 1 or channel = 2 { return words[channel]. }
    return words[coreChannelKeys[channel]].
}

// Compute odd parity using the raw sensed data and the independently
// supplied bit for its installed rope word.
local coreNibbleParity is list(0,1,1,0,1,0,0,1,1,0,0,1,0,1,1,0).

function agcCoreStoredParityMatches {
    parameter rawWord, parityBit.
    local low is coreNibbleParity[mod(rawWord, 16)].
    local midLow is coreNibbleParity[mod(floor(rawWord / 16), 16)].
    local midHigh is coreNibbleParity[mod(floor(rawWord / 256), 16)].
    local high is coreNibbleParity[floor(rawWord / 4096)].
    return mod(low + midLow + midHigh + high + parityBit, 2) = 1.
}

// Geometry distinguishes uninstalled banks from a missing input in the
// immutable verified installed image. There is no parity-disable default.
function agcCoreFixedAccess {
    parameter words, address, slot.
    if slot < 2048 { return. }
    if slot >= 38912 {
        set words[slot] to 0.
        set words["parityFail"] to true.
        words["parityFaultProvider"]:call(words, address, slot, "absent-rope").
        return.
    }

    local rawWord is words[slot].
    local parityBit is words["fixedParity"][slot].
    if not agcCoreStoredParityMatches(rawWord, parityBit) {
        set words["parityFail"] to true.
        words["parityFaultProvider"]:call(words, address, slot, "fixed-parity").
    }
}
