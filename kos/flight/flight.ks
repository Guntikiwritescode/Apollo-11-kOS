// KSP flight loop. The two checkpoint restores include the reference CPU and peripherals.
function kLogEvent {
    parameter words,kind,chan,value.
    local dev is words["wiring"].
    if kind = "radar-request" {
        // The pinned engine requests a word during this precise MCT.
        set words[38] to wRadarRead(dev,mod(words["channel13"],8)).
    } else if kind = "channel-output" and chan < 28 {
        wOutput(dev,words["windowMct"],chan,value).
    }
}
function kInputs {
    parameter words,dev.
    for group in dev["pulses"] {
        from {local i is 0.} until i >= group[2] step {set i to i+1.} do {
            segmentCounter(words,group[0],group[1]).
        }
    }
    set dev["pulses"] to list().
    set words["channel14"] to dev["ch"][12].
    set words["channel30"] to dev["ch"][24].
    set words["channel32"] to dev["ch"][26].
    set words["channel33"] to dev["ch"][27].
    for keyAction in dev["keys"] {
        if keyAction[0]="key" {
            agcCoreExternalWriteIO(words,13,keyAction[1]).
            set words["interruptRequests"] to agcOr16(words["interruptRequests"],32).
        }
    }
    set dev["keys"] to list().
}
function kSample {
    parameter hw,frameT.
    local s is hw:sample.
    local c is list().
    for row in s[2] { c:add(wApply(frameT,row)). }
    return lexicon("r",wApply(frameT,s[0]),"v",wApply(frameT,s[1]),"c",c,
                   "sf",wApply(frameT,s[3]),"prop",s[4],"mass",s[5]).
}
function kAngle { parameter a,b. return arctan2(sqrt(wDot(wCross(a,b),wCross(a,b))),wDot(a,b)). }
function kOct { parameter n.
    local s is "".
    from {local i is 0.} until i=5 step {set i to i+1.} do {
        set s to mod(n,8):tostring+s. set n to floor(n/8).
    }
    return s.
}
function kVectorText {
    parameter a.
    return "({0:F6},{1:F6},{2:F6})":format(a[0],a[1],a[2]).
}
function kAlarms {
    parameter words,dev.
    local codeText is "".
    for addr in dev["failreg"] {
        if words[addr] <> 0 {
            if codeText:length > 0 { set codeText to codeText+" ". }
            set codeText to codeText+kOct(words[addr]).
        }
    }
    return codeText.
}
function kRow {
    parameter words,dev,s,t.
    local getSec is dev["get0"]+t.
    local pole is dev["pole"]. local land is dev["land"].
    local a is (getSec-363049.20)*0.00000266169947*57.29577951308232.
    local site is wMinus(wTimes(land,cos(a)),wTimes(wCross(pole,land),-sin(a))).
    set site to wMinus(site,wTimes(pole,-wDot(pole,land)*(1-cos(a)))).
    local upSite is wUnit(site). local eastAxis is wUnit(wCross(pole,upSite)).
    local enu is list(eastAxis,wCross(upSite,eastAxis),upSite).
    local positionRef is s["r"]. local vertical is wUnit(positionRef).
    local vg is wMinus(s["v"],wCross(dev["spin"],positionRef)).
    local descent is wDot(vg,vertical). local vh is wMinus(vg,wTimes(vertical,descent)).
    local panel is wDisplay(dev,words["windowMct"],words["standby"],words["restartLight"],false).
    local alarms is kAlarms(words,dev).
    local row is list("{0:F1}":format(t),"{0:F2}":format(getSec),"{0:F1}":format(sqrt(wDot(positionRef,positionRef))-dev["radius"]),
        "{0:F2}":format(descent),"{0:F2}":format(sqrt(wDot(vh,vh))),"{0:F0}":format(dev["thrust"]),
        "{0:F1}":format(s["mass"]),"{0:F2}":format(kAngle(s["c"][0],vertical)),panel["prog"],panel["verb"],
        panel["noun"],panel["r1"],panel["r2"],panel["r3"],alarms).
    for group in list(wApply(enu,wMinus(positionRef,site)),wApply(enu,s["c"][0]),wApply(enu,s["c"][2])) {
        local digits is choose "F1" if row:length=15 else "F4".
        for n in group { row:add(("{0:"+digits+"}"):format(n)). }
    }
    row:add(kOct(dev["jetMasks"][1]*256+dev["jetMasks"][0])).
    for g in dev["gimbal"] { row:add("{0:F2}":format(g*57.29577951308232)). }
    row:add((choose "R" if dev["rangeGood"] else "-")+(choose "V" if dev["velGood"] else "-")+dev["antennaPos"]:tostring).
    local lineText is "".
    for item in row {
        if lineText:length > 0 { set lineText to lineText+",". }
        set lineText to lineText+item.
    }
    log lineText to "0:/apollo-landing/landing.csv".
}
function kEvent {
    parameter dev,t,msg.
    local cols is "{0:F2},{1:F2},":format(t,t+dev["get0"]).
    log (cols+msg) to "0:/apollo-landing/landing.events.csv".
}
function kFly {
    parameter words,dev,spec.
    local hw is addons:eagle. local frameT is wTranspose(wRefBasis(dev["pole"],dev["land"])).
    wait until hw:status <> "Loading".
    if hw:status <> "Holding" { print hw:status. return. }
    // Check the actual state while the loader holds the saved epoch. The
    // diagnostic and file I/O do not consume any part of the first flight window.
    local s is kSample(hw,frameT).
    local dp is wMinus(s["r"],spec["r"]). local dv is wMinus(s["v"],spec["v"]).
    local posErr is sqrt(wDot(dp,dp)). local velErr is sqrt(wDot(dv,dv)).
    local attErr is max(kAngle(s["c"][0],spec["c"][0]),kAngle(s["c"][2],spec["c"][2])).
    local check is "Entry error: "+posErr+" m, "+velErr+" m/s, "+attErr+" deg".
    print check. log check to "0:/apollo-landing/selfcheck.txt".
    for keyName in list("r","v") {
        local valText is keyName+" KSP "+kVectorText(s[keyName])+" expected "+kVectorText(spec[keyName]).
        print valText. log valText to "0:/apollo-landing/selfcheck.txt".
    }
    print "Speed KSP {0:F4} expected {1:F4} m/s":format(sqrt(wDot(s["v"],s["v"])),sqrt(wDot(spec["v"],spec["v"]))).
    for idx in list(0,1,2) {
        local axisText is "axis "+idx+" KSP "+kVectorText(s["c"][idx])+" expected "+kVectorText(spec["c"][idx]).
        print axisText. log axisText to "0:/apollo-landing/selfcheck.txt".
    }
    if defined ship {
        local live is false.
        from {local attempt is 0.} until attempt = 8 or not live:istype("Boolean") step {set attempt to attempt+1.} do {
            wait 0.
            set live to wSampleKsp(ship,wRefBasis(dev["pole"],dev["land"])).
        }
        if not live:istype("Boolean") {
            local dr is wMinus(live["r"],spec["r"]). local du is wMinus(live["v"],spec["v"]).
            set posErr to max(posErr,sqrt(wDot(dr,dr))). set velErr to max(velErr,sqrt(wDot(du,du))).
            set attErr to max(attErr,max(kAngle(live["c"][0],spec["c"][0]),kAngle(live["c"][2],spec["c"][2]))).
            local errs is "kOS SHIP and SOLARPRIMEVECTOR errors "+posErr+" m, "+velErr+" m/s, "+attErr+" deg".
            print errs. log errs to "0:/apollo-landing/selfcheck.txt".
        } else {
            log "kOS vector sample crossed a tick boundary on each attempt" to "0:/apollo-landing/selfcheck.txt".
        }
    }
    if posErr > 2 or velErr > 0.1 or attErr > 0.1 {
        print "Start frame differs. See selfcheck.txt.". hw:halt(). return.
    }
    if exists("0:/apollo-landing/flight-end.txt") { deletepath("0:/apollo-landing/flight-end.txt"). }
    local deltaAddr is dev["deltaAddr"]. local tigAddr is dev["tigAddr"].
    local t is spec["t"]. local frac is spec["fraction"].
    local stepT is 0.02. local dtCycles is 0.02*85333.
    if exists("0:/apollo-landing/landing.csv") { deletepath("0:/apollo-landing/landing.csv"). }
    log "t,get,alt_m,hdot_mps,vhor_mps,thrust_n,mass_kg,pitch_deg,prog,verb,noun,r1,r2,r3,alarms,east_m,north_m,up_m,bx_e,bx_n,bx_u,bz_e,bz_n,bz_u,jets,gimbal_pitch_deg,gimbal_roll_deg,lr" to "0:/apollo-landing/landing.csv".
    if exists("0:/apollo-landing/landing.events.csv") {deletepath("0:/apollo-landing/landing.events.csv").}
    log "t,get,event" to "0:/apollo-landing/landing.events.csv".
    kEvent(dev,t,"resumed "+hw:startname+" at AGC cycle "+words["windowMct"]).
    kRow(words,dev,s,t).
    local lastAlarms is kAlarms(words,dev).
    local priorPanel is wDisplay(dev,words["windowMct"],words["standby"],words["restartLight"],false).
    local nextLog is spec["nextLog"]. set s["ut"] to t.
    if not hw:arm() { print hw:status. return. }
    wait until hw:frame = 0 or hw:status <> "Arming".
    local frameID is 0.
    until hw:status <> "Flying" {
        local wasOn is dev["engineOn"].
        set frac to frac+dtCycles. local count is floor(frac). set frac to frac-count.
        if not segmentStepTo(words,words["windowMct"]+count) { hw:halt(). break. }
        // CPU writes can alter the status channel between device boundaries.
        set dev["ch"][12] to words["channel14"].
        set dev["ch"][24] to words["channel30"].
        set dev["ch"][26] to words["channel32"].
        set dev["ch"][27] to words["channel33"].
        wActuators(dev,words["windowMct"],stepT,words[45],s["prop"]).
        if not hw:submit(list(frameID,dev["thrust"],dev["gimbal"][0],dev["gimbal"][1],dev["lastJets"])) { break. }
        wait 0.
        if hw:frame <= frameID and hw:status = "Flying" {
            wait until hw:frame > frameID or hw:status <> "Flying".
        }
        if hw:status <> "Flying" { break. }
        if hw:frame <> frameID + 1 {
            log ("Unexpected physics frame " + hw:frame + " after " + frameID) to "0:/apollo-landing/flight-end.txt".
            hw:halt(). break.
        }
        set frameID to hw:frame. local prior is s. set s to kSample(hw,frameT). set t to t+stepT.
        set s["ut"] to t. set s["sf"] to wSpecificForce(prior,s,4902778000000.0).
        local priorRange is dev["rangeGood"]. local priorVel is dev["velGood"].
        local priorAntenna is dev["antennaPos"].
        if wasOn <> dev["engineOn"] { kEvent(dev,t,choose "DPS ignition" if dev["engineOn"] else "DPS shutdown"). }
        wSensors(dev,t,s["r"],s["v"],s["c"],s["sf"],stepT).
        wAfterStep(dev,t,words["windowMct"],words[deltaAddr],words[deltaAddr+1],words[tigAddr],words[tigAddr+1]).
        if priorRange <> dev["rangeGood"] or priorVel <> dev["velGood"] {
            kEvent(dev,t,"LR range good "+dev["rangeGood"]+" velocity good "+dev["velGood"]).
        }
        if priorAntenna <> dev["antennaPos"] { kEvent(dev,t,"LR antenna position "+dev["antennaPos"]). }
        for arrival in dev["keys"] { kEvent(dev,t,"crew "+arrival[0]+" "+arrival[1]). }
        if t >= nextLog {
            local panel is wDisplay(dev,words["windowMct"],words["standby"],words["restartLight"],false).
            if priorPanel["prog"] <> panel["prog"] { kEvent(dev,t,"PROG "+panel["prog"]). }
            if panel["flashing"] and (not priorPanel["flashing"] or panel["verb"] <> priorPanel["verb"] or panel["noun"] <> priorPanel["noun"]) {
                kEvent(dev,t,"DSKY flashing V"+panel["verb"]+" N"+panel["noun"]).
            }
            local alarmText is kAlarms(words,dev).
            if alarmText <> lastAlarms { kEvent(dev,t,"program alarms "+alarmText). set lastAlarms to alarmText. }
            set priorPanel to panel.
        }
        kInputs(words,dev).
        if t >= nextLog { set nextLog to t+0.5. kRow(words,dev,s,t). }
    }
    if hw:status = "Contact" {
        set dev["thrust"] to 0. kRow(words,dev,kSample(hw,frameT),spec["t"]+hw:elapsed).
    }
    wArm(dev,false).
    print hw:status. log (hw:status+" at cycle "+words["windowMct"]+" t="+t) to "0:/apollo-landing/flight-end.txt".
}
