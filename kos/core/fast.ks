// Install after loading the generated registry and units for the current rope.
// Disabled body keys are 2 * physical slot + (0 basic, 1 extended).
function agcFastEnable {
    parameter words, disabled.
    set words["disabledDirectBodies"] to disabled.
    set words["directUnitCache"] to lexicon().
    set words["selectDirectBody"] to agcFastSelect@.
}

function agcFastSelect {
    parameter words, slot, instruction, extended.
    local key is 2 * slot + (choose 1 if extended else 0).
    if words["disabledDirectBodies"]:haskey(key) { return false. }
    local cache is words["directUnitCache"].
    if not cache:haskey(slot) {
        local route is agcAotFindUnit(slot).
        if route >= 0 and not agcAotRoutes:haskey(route) and words:haskey("loadDirectUnit") {
            words["loadDirectUnit"]:call(route).
        }
        set cache[slot] to choose agcAotRoutes[route] if agcAotRoutes:haskey(route) else false.
    }
    local unit is cache[slot].
    if unit:istype("Boolean") { return false. }
    // Dispatch guards test the raw instruction, entry mode and live operands.
    // Only the physical slot's unit is cached. A guard may change at any MCT.
    if not unit:call(words, slot, instruction, extended, true, 0, 0, 0, 0) { return false. }
    return unit.
}
