// KSP SHIP-RAW to the Apollo REF frame (GPL-2.0)
// the save puts LAND(TLAND) on orbital +X
function wEquator {
    parameter northAxis,prime.
    return wUnit(wMinus(prime,wTimes(northAxis,wDot(northAxis,prime)))).
}
function wRefBasis {
    parameter poleRef,landRef.
    local northAxis is wUnit(poleRef).
    local prime is wEquator(northAxis,landRef).
    return list(prime,wCross(northAxis,prime),northAxis).
}
function wRawBasis {
    parameter rawNorth,solarPrime.
    local northAxis is wUnit(rawNorth).
    local prime is wEquator(northAxis,solarPrime).
    // east = prime x north
    return list(prime,wCross(prime,northAxis),northAxis).
}
function wMapRaw {
    parameter basisRaw,basisRefT,rawVec.
    return wApply(basisRefT,wApply(basisRaw,rawVec)).
}
function wComponents { parameter vec. return list(vec:x,vec:y,vec:z). }
// BodyTarget.Position is already relative to the ship's centre of mass
// VesselTarget.Position can also include a packed-orbit velocity offset
function wOwnPositionRaw { parameter bodyRelativeToShip. return wTimes(bodyRelativeToShip,-1). }
function wSampleKsp {
    parameter vesselRef,refRows.
    if vesselRef <> ship { return false. }
    local startUt is time:seconds.
    local bodyRef is vesselRef:body.
    local bodyPos is bodyRef:position.
    local rel is wOwnPositionRaw(wComponents(bodyPos)).
    local northVec is bodyRef:geopositionlatlng(90,0):position - bodyPos.
    local rawRows is wRawBasis(wComponents(northVec),wComponents(solarprimevector)).
    local refT is wTranspose(refRows).
    local attitude is vesselRef:facing.
    local c is list(wMapRaw(rawRows,refT,wComponents(attitude:forevector)),
        wMapRaw(rawRows,refT,wComponents(attitude:starvector)),
        wMapRaw(rawRows,refT,wComponents(-attitude:topvector))).
    local result is lexicon("ut",startUt,"r",wMapRaw(rawRows,refT,rel),
        "v",wMapRaw(rawRows,refT,wComponents(vesselRef:velocity:orbit)),
        "vGround",wMapRaw(rawRows,refT,wComponents(vesselRef:velocity:surface)),"c",c).
    if time:seconds <> startUt { return false. }
    return result.
}
// velocity difference minus gravity at the middle of the interval (m/s^2)
function wSpecificForce {
    parameter previous,current,mu.
    local dt is current["ut"]-previous["ut"].
    if dt <= 0 { return false. }
    local mid is wMinus(current["r"],wTimes(wMinus(current["r"],previous["r"]),0.5)).
    local inertiaAcc is wTimes(wMinus(current["v"],previous["v"]),1/dt).
    return wMinus(inertiaAcc,wTimes(mid,-mu/(wDot(mid,mid)^1.5))).
}
