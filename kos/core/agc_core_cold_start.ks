// Development generic executor initialization, from agc_engine_init.c with
// static-zero agc_t storage, no core dump, and Sunburst-37 initialization off.
// Fixed rope installation and external fixture configuration are separate.
function agcCoreColdStart {
    parameter words, keys.
    for key in keys { set words[key] to 0. }
    for key in list("downruptTimeValid", "extraCode", "generatedWarning",
        "inInterrupt", "interruptEnabled", "nightWatchmanTripped", "noRupt",
        "noTC", "parityFail", "pendingInstruction", "restartLight", "ruptLock",
        "sbyPressed", "sbyStillPressed", "standby", "substituteInstruction",
        "tcTrap", "tookBZF", "tookBZMF") { set words[key] to false. }
    set words[5] to 2048. // RegZ = 04000.
    set words["channel30"] to 16383. // InputChannel[030] = 037777.
    set words["channel31"] to 32767.
    set words["channel32"] to 32767.
    set words["channel33"] to 32767.
    set words["interruptEnabled"] to true.
    set words["downruptTimeValid"] to true.
    set words["outputChannel10"] to list(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0).
}
