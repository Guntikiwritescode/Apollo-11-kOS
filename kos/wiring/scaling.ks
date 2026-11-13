// SPDX-License-Identifier: GPL-2.0-only. Derived from Apollo11 agc/sim/scaling.py.
function wBit { parameter n, mask. return mod(floor(n / mask), 2) = 1. }
function wSetBit {
    parameter n, mask, enabled.
    if enabled = wBit(n,mask) { return n. }
    return choose n + mask if enabled else n - mask.
}
function wRoundEven {
    parameter x.
    local base is floor(x).
    local frac is x - base.
    if frac > 0.5 or (frac = 0.5 and mod(base,2) <> 0) { return base + 1. }
    return base.
}
function wEncode {
    parameter value, scale, places.
    local mag is wRoundEven(abs(value) * 2 ^ (14 * places - scale)).
    if mag >= 2 ^ (14 * places) { return false. }
    local outWords is list().
    from { local i is places - 1. } until i < 0 step { set i to i - 1. } do {
        local partWord is mod(floor(mag / (2 ^ (14*i))),16384).
        if value < 0 { set partWord to 32767 - partWord. }
        outWords:add(partWord).
    }
    return outWords.
}
function wSpValue {
    parameter word, scale.
    local mag is mod(mod(word,32768)+32768,32768).
    if mag >= 16384 { set mag to mag - 32767. }
    return mag * (2 ^ (scale - 14)).
}
function wDpValue {
    parameter hi, lo, scale.
    return wSpValue(hi,scale) + wSpValue(lo,scale - 14).
}
function wTpValue {
    parameter hi, mid, lo, scale.
    return wDpValue(hi,mid,scale) + wSpValue(lo,scale - 28).
}
function wCduWord {
    parameter degrees.
    return mod(mod(wRoundEven(degrees / 360 * 32768),32768) + 32768,32768).
}
function wCduDegrees {
    parameter word.
    local n is mod(mod(word,32768)+32768,32768).
    if n >= 16384 { set n to n - 32768. }
    return n / 32768 * 360.
}
function wAngleToCdu {
    parameter radians.
    return mod(mod(wRoundEven(radians/(2*3.141592653589793)*32768),32768)+32768,32768).
}
function wCduToAngle { parameter word. return wCduDegrees(word)/360*(2*3.141592653589793). }
function wFeet { parameter metres. return metres / 0.3048. }
function wMetres { parameter feet. return feet * 0.3048. }
function wDot { parameter a,b. return a[0]*b[0] + a[1]*b[1] + a[2]*b[2]. }
function wTimes { parameter a,k. return list(a[0]*k,a[1]*k,a[2]*k). }
function wMinus { parameter a,b. return list(a[0]-b[0],a[1]-b[1],a[2]-b[2]). }
function wCross {
    parameter a,b.
    return list(a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]).
}
function wUnit { parameter a. return wTimes(a,1/sqrt(wDot(a,a))). }
function wApply { parameter rows,a. return list(wDot(rows[0],a),wDot(rows[1],a),wDot(rows[2],a)). }
function wTranspose {
    parameter rows.
    local x is rows[0]. local y is rows[1]. local z is rows[2].
    return list(list(x[0],y[0],z[0]),list(x[1],y[1],z[1]),list(x[2],y[2],z[2])).
}
function wZeros {
    parameter n.
    local vals is list().
    until vals:length >= n { vals:add(0). }
    return vals.
}
