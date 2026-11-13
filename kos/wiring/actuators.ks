// adapted from jweigend/Apollo11 agc/sim/lm.py (GPL-2.0)
function wInitActuators {
    parameter dev,cycle.
    set dev["jetNames"] to list("B4U","A4D","A3U","B3D","B2U","A2D","A1U","B1D",
        "B3A","B4F","A1F","A2A","B2L","A3R","A4R","B1L").
    set dev["jetMasks"] to list(0,0). set dev["jetCycle"] to cycle.
    set dev["jetSeconds"] to wZeros(16).
    set dev["armed"] to false. set dev["engineOn"] to false.
    set dev["ignitions"] to 0. set dev["throttleN"] to 0.
    set dev["thrust"] to 0. set dev["targetThrust"] to 0.
    set dev["gimbal"] to list(0,0).
}
function wArm {
    parameter dev,armed.
    set dev["armed"] to armed.
    set dev["ch"][24] to wSetBit(dev["ch"][24],4,not armed).
    if not armed { set dev["engineOn"] to false. }
}
function wAccountJets {
    parameter dev,cycle.
    local elapsed is (cycle - dev["jetCycle"]) / 85333.
    set dev["jetCycle"] to cycle.
    local times is dev["jetSeconds"]. local masks is dev["jetMasks"].
    from {local bank is 0.} until bank >= 2 step {set bank to bank+1.} do {
        local bits is masks[bank].
        local slot is bank*8.
        until bits = 0 {
            if mod(bits,2) = 1 { set times[slot] to times[slot] + elapsed. }
            set bits to floor(bits/2). set slot to slot+1.
        }
    }
}
// call on every channel write, repeats too
function wOutput {
    parameter dev,cycle,ch,word.
    set dev["ch"][ch] to word.
    if ch = 5 or ch = 6 {
        wAccountJets(dev,cycle).
        set dev["jetMasks"][ch-5] to mod(word,256).
    } else if ch = 8 {
        set dev["rows"][mod(floor(word/2048),16)] to word.
    } else if ch = 9 {
        if wBit(word,4096) and dev["armed"] and not dev["engineOn"] {
            set dev["engineOn"] to true. set dev["ignitions"] to dev["ignitions"] + 1.
        }
        if wBit(word,8192) { set dev["engineOn"] to false. }
    }
}
function wThrottle {
    parameter dev,dt,word.
    local ch is dev["ch"].
    if not wBit(ch[12],8) { return word. }
    local budget is floor(3200*dt) + 1.
    local n is 0.
    local cmd is dev["throttleN"].
    local span is (9870-980)*4.4482216.
    until n = budget {
        if word = 0 or word = 32767 {
            set ch[12] to wSetBit(ch[12],8,false).
            break.
        }
        if word >= 16384 {
            set cmd to max(0,cmd - 1/0.0797959872).
            set word to word+1.
        } else {
            set cmd to min(span,cmd + 1/0.0797959872).
            set word to word-1.
            if word = 0 { set word to 32767. }
        }
        set n to n+1.
    }
    if n > 0 { dev["pulses"]:add(list(45,4,n)). }
    set dev["throttleN"] to cmd.
    return word.
}
function wActuators {
    parameter dev,cycle,dt,thrustWord,propellantKg.
    set dev["pulses"] to list().
    wAccountJets(dev,cycle).
    set dev["lastJets"] to dev["jetSeconds"].
    set dev["jetSeconds"] to wZeros(16).
    set dev["thrustWord"] to wThrottle(dev,dt,thrustWord).
    local ch12 is dev["ch"][10].
    local rad is 0.017453292519943295.
    local drive is 0.2*rad*dt. local g is dev["gimbal"].
    from {local axis is 0.} until axis = 2 step {set axis to axis+1.} do {
        local mask is choose 256 if axis = 0 else 1024.
        if wBit(ch12,mask*2) { set g[axis] to g[axis]-drive. }
        if wBit(ch12,mask) { set g[axis] to g[axis]+drive. }
        set g[axis] to max(-6*rad,min(6*rad,g[axis])).
    }
    local desiredValue is 0.
    if dev["engineOn"] and propellantKg > 0 {
        set desiredValue to 980*4.4482216 + dev["throttleN"].
        if desiredValue > 6300*4.4482216 { set desiredValue to 9870*4.4482216. }
    }
    set dev["targetThrust"] to desiredValue.
    if desiredValue = 0 { set dev["thrust"] to 0. }
    else { set dev["thrust"] to dev["thrust"] + (desiredValue-dev["thrust"])*min(1,dt/0.2). }
}
