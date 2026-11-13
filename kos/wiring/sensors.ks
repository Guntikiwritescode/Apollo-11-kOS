// adapted from jweigend/Apollo11 IMU and LandingRadar (GPL-2.0)
function wPlatform {
    parameter landRef, flightRef.
    local x is wUnit(landRef).
    local z is wUnit(wMinus(flightRef,wTimes(x,wDot(flightRef,x)))).
    return list(x,wCross(z,x),z).
}
function wGimbals {
    parameter sm,c.
    return list(arctan2(-wDot(c[2],sm[1]),wDot(c[1],sm[1])),
        arctan2(-wDot(c[0],sm[2]),wDot(c[0],sm[0])),
        arcsin(max(-1,min(1,wDot(c[0],sm[1]))))).
}
function wAttitude {
    parameter sm,c.
    local angles is wGimbals(sm,c).
    return list(wCduWord(angles[0]),wCduWord(angles[1]),wCduWord(angles[2])).
}
function wAntenna {
    parameter pos.
    local alpha is (choose 0.0163371759 if pos = 1 else 0.0161680555) * 360.
    local beta is (choose 0.0665287037 if pos = 1 else 0.0001361111) * 360.
    local ca is cos(alpha). local sa is sin(alpha).
    local cb is cos(beta). local sb is sin(beta).
    return list(list(cb,0,-sb),list(sa*sb,ca,sa*cb),list(ca*sb,-sa,ca*cb)).
}
function wInitSensors {
    parameter dev,sm,pole,radius,c.
    set dev["sm"] to sm. set dev["spin"] to wTimes(pole,0.00000266169947).
    set dev["radius"] to radius. set dev["cdu"] to wAttitude(sm,c).
    set dev["residual"] to wZeros(3). set dev["pipaCounts"] to wZeros(3).
    set dev["pos2Since"] to -1. set dev["antennaPos"] to 1.
    set dev["ant"] to wAntenna(1). set dev["slant"] to -1.
    set dev["velAnt"] to wZeros(3).
    set dev["rangeGood"] to false. set dev["velGood"] to false. set dev["lowScale"] to false.
    local chan is dev["ch"].
    local word is wSetBit(chan[27],32,false).
    for mask in list(64,16,128,256) { set word to wSetBit(word,mask,true). }
    set chan[27] to word.
}
function wImu {
    parameter dev,c,specificForce,dt.
    local desiredValue is wAttitude(dev["sm"],c).
    local cdu is dev["cdu"]. local pulses is dev["pulses"].
    from {local i is 0.} until i = 3 step {set i to i + 1.} do {
        local delta is mod(desiredValue[i]-cdu[i]+32768,32768).
        if delta > 16384 { set delta to delta - 32768. }
        set delta to max(-400,min(400,delta)).
        if delta <> 0 {
            pulses:add(list(26+i,(choose 17 if delta > 0 else 19),abs(delta))).
            set cdu[i] to mod(cdu[i]+delta+32768,32768).
        }
    }
    local residual is dev["residual"]. local counts is dev["pipaCounts"].
    local acc is wApply(dev["sm"],specificForce).
    from {local i is 0.} until i = 3 step {set i to i + 1.} do {
        set residual[i] to residual[i] + acc[i]*dt*100.
        local n is choose floor(residual[i]) if residual[i] >= 0 else ceiling(residual[i]).
        if n <> 0 {
            pulses:add(list(31+i,(choose 0 if n > 0 else 2),abs(n))).
            set residual[i] to residual[i] - n.
            set counts[i] to counts[i] + n.
        }
    }
}
function wRadarUpdate {
    parameter dev,t,positionRef,vGround,c.
    local ch is dev["ch"]. local word is ch[27].
    if wBit(ch[10],4096) {
        if dev["pos2Since"] < 0 { set dev["pos2Since"] to t. }
        else if dev["antennaPos"] = 1 and t-dev["pos2Since"] > 10 {
            set dev["antennaPos"] to 2. set dev["ant"] to wAntenna(2).
            set word to wSetBit(wSetBit(word,32,true),64,false).
        }
    }
    local ant is dev["ant"].
    local beam is wApply(wTranspose(c),wApply(ant,list(-0.9374036082,0,-0.3482448542))).
    local b is wDot(positionRef,beam). local rr is wDot(positionRef,positionRef).
    local cc is rr-dev["radius"]^2. local disc is b*b-cc.
    local slant is -1.
    if disc >= 0 and cc > 0 {
        local root is -b-sqrt(disc).
        if root > 0 { set slant to root. }
    }
    local altFt is wFeet(sqrt(rr)-dev["radius"]).
    set dev["slant"] to slant.
    set dev["rangeGood"] to slant > 0 and wFeet(slant) < 40000 and altFt > 5.
    set dev["velGood"] to altFt > 0 and altFt < 35000.
    set dev["lowScale"] to dev["rangeGood"] and wFeet(slant) < 2500.
    set dev["velAnt"] to wApply(wTranspose(ant),wApply(c,vGround)).
    set word to wSetBit(word,16,not dev["rangeGood"]).
    set word to wSetBit(word,128,not dev["velGood"]).
    set ch[27] to wSetBit(word,256,not dev["lowScale"]).
}
function wRadarRead {
    parameter dev,selection.
    local count is 0.
    if selection = 7 and dev["slant"] > 0 {
        local scale is choose 1.079 if dev["lowScale"] else 5.395.
        set count to wFeet(dev["slant"]) / scale.
    } else if selection >= 4 and selection <= 6 {
        local axis is selection - 4.
        local scales is list(-0.644,1.212,0.8668).
        set count to 12288 + wFeet(dev["velAnt"][axis])/scales[axis].
    }
    return max(0,min(32767,wRoundEven(count))).
}
function wSensors {
    parameter dev,t,positionRef,vOrbit,c,specificForce,dt.
    wImu(dev,c,specificForce,dt).
    wRadarUpdate(dev,t,positionRef,wMinus(vOrbit,wCross(dev["spin"],positionRef)),c).
}

// kOS trig is in degrees
function wDcmFromGimbals {
    parameter outer,inner,middle.
    local co is cos(outer). local so is sin(outer).
    local ci is cos(inner). local si is sin(inner).
    local cm is cos(middle). local sn is sin(middle).
    return list(list(cm*ci,sn,-cm*si),list(-co*sn*ci+so*si,co*cm,co*sn*si+so*ci),
        list(so*sn*ci+co*si,-so*cm,-so*sn*si+co*ci)).
}
function wWriteDp {
    parameter memory,addr,value,scale.
    local words is wEncode(value,scale,2).
    if not words:istype("List") { return false. }
    set memory[addr] to words[0]. set memory[addr+1] to words[1].
    return true.
}
function wReadDp {
    parameter memory,addr,scale.
    return wDpValue(memory[addr],memory[addr+1],scale).
}
function wReadVector {
    parameter memory,addr,scale.
    return list(wReadDp(memory,addr,scale),wReadDp(memory,addr+2,scale),wReadDp(memory,addr+4,scale)).
}
function wStoreVectors {
    parameter memory,addr,vectors,scale.
    local encoded is list().
    for row in vectors {
        for comp in row {
            local pair is wEncode(comp,scale,2).
            if not pair:istype("List") { return false. }
            encoded:add(pair[0]). encoded:add(pair[1]).
        }
    }
    for word in encoded { set memory[addr] to word. set addr to addr+1. }
    return true.
}
function wWriteVector {
    parameter memory,addr,values,scale.
    return wStoreVectors(memory,addr,list(values),scale).
}
function wWriteRefsmmat {
    parameter memory,addr,sm.
    return wStoreVectors(memory,addr,sm,1).
}
