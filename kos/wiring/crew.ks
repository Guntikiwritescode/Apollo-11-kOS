// adapted from jweigend/Apollo11 LandingSimulation and Crew (GPL-2.0)
function wInitCrew {
    parameter dev,dt,get0.
    set dev["dt"] to dt. set dev["get0"] to get0. set dev["tig"] to 0.
    set dev["seq"] to "". set dev["waitSteps"] to 0.
    set dev["nextCrew"] to 0. set dev["releaseAt"] to 0.
    set dev["lastVN"] to "". set dev["vnSince"] to 0.
    set dev["r60Done"] to false. set dev["engineEnabled"] to false.
    set dev["lrPermitted"] to false. set dev["goodSince"] to -1.
}
function wTypeFlight {
    parameter dev,sequenceText.
    set dev["seq"] to sequenceText:substring(1,sequenceText:length-1).
    set dev["waitSteps"] to max(1,wRoundEven(0.25/dev["dt"])).
    wPress(dev,sequenceText:substring(0,1)).
}
function wCrewTick {
    parameter dev,t,cycle,deltaH.
    local panel is wDisplay(dev,cycle,false,false,false).
    if not dev["rangeGood"] { set dev["goodSince"] to -1. }
    else if not dev["lrPermitted"] {
        if dev["goodSince"] < 0 {set dev["goodSince"] to t.}
        if t-dev["goodSince"] >= 6 and (panel["prog"] = "63" or panel["prog"] = "64")
            and not panel["flashing"] and abs(deltaH) <= 1600 {
            wTypeFlight(dev,"V57E").
            set dev["lrPermitted"] to true.
        }
    }
    local flashKey is choose "1" if panel["flashing"] else "0".
    local vn is panel["verb"] + panel["noun"].
    if vn+flashKey <> dev["lastVN"] {
        set dev["lastVN"] to vn+flashKey. set dev["vnSince"] to t.
    }
    local dwell is t-dev["vnSince"].
    if not panel["flashing"] or dwell < 1.5 { return. }
    local key is "PRO".
    if vn = "5018" {
        if dev["r60Done"] { set key to "ENTR". }
        set dev["r60Done"] to true.
    } else if vn = "9962" {
        if not dev["armed"] { wArm(dev,true). }
        set dev["engineEnabled"] to true.
    } else if vn = "5025" {
        if panel["r1"]:trim = "00014" { set key to "ENTR". }
    } else if vn <> "0661" and vn <> "0663" and vn <> "0664" and vn <> "0660" {
        if panel["verb"] = "37" or dwell <= 20 { return. }
    }
    wPress(dev,key).
    if key = "PRO" { set dev["releaseAt"] to t+0.4. }
    set dev["vnSince"] to t+10.
}
function wAfterStep {
    parameter dev,t,cycle,deltaHi,deltaLo,tigHi,tigLo.
    if dev["releaseAt"] > 0 and t >= dev["releaseAt"] {
        wRelease(dev). set dev["releaseAt"] to 0.
    }
    if dev["waitSteps"] > 0 {
        set dev["waitSteps"] to dev["waitSteps"]-1.
        if dev["waitSteps"] = 0 and dev["seq"]:length > 0 { wTypeFlight(dev,dev["seq"]). }
        return.
    }
    if t < dev["nextCrew"] { return. }
    set dev["nextCrew"] to t+0.5.
    wCrewTick(dev,t,cycle,wDpValue(deltaHi,deltaLo,24)).
    local getNow is dev["get0"]+t.
    if dev["tig"] = 0 {
        local tig is wDpValue(tigHi,tigLo,28)/100.
        if tig-getNow > 0 and tig-getNow < 2000 {set dev["tig"] to tig.}
    }
    if dev["tig"] > 0 and not dev["armed"] and getNow >= dev["tig"]-60 {
        wArm(dev,true). set dev["gimbal"] to list(0,0).
    }
}

// before flight only the clock runs. advance sends dev["keys"] and steps the given cycles
function wSetupType {
    parameter dev,keys,advance.
    from {local i is 0.} until i = keys:length step {set i to i+1.} do {
        wPress(dev,keys:substring(i,1)).
        advance:call(floor(0.25*85333)).
    }
}
function wWaitDisplay {
    parameter dev,verb,noun,advance,timeout is 30.
    local spent is 0.
    until spent >= timeout*85333 {
        advance:call(8533). set spent to spent+8533.
        local panel is wDisplay(dev,0,false,false,false).
        if panel["flashing"] and panel["verb"] = verb and panel["noun"] = noun {return true.}
    }
    return false.
}
function wSetupProceed {
    parameter dev,advance.
    wPress(dev,"PRO"). advance:call(floor(0.5*85333)). wRelease(dev).
}
function wLoadDapData {
    parameter dev,massLb,advance.
    wSetupType(dev,"V48E",advance).
    if not wWaitDisplay(dev,"01","46",advance) {return false.}
    wSetupType(dev,"V21E22112E",advance).
    wWaitDisplay(dev,"01","46",advance). wSetupProceed(dev,advance).
    if not wWaitDisplay(dev,"06","47",advance) {return false.}
    local massText is "00000"+wRoundEven(massLb):tostring.
    wSetupType(dev,"V21E+"+massText:substring(massText:length-5,5)+"E",advance).
    wWaitDisplay(dev,"06","47",advance). wSetupProceed(dev,advance).
    if wWaitDisplay(dev,"06","48",advance,10) {wSetupProceed(dev,advance).}
    advance:call(170666). return true.
}
