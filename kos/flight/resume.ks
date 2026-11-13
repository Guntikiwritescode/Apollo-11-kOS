function kResumeFlight {
local words is lexicon(). local dev is lexicon(). local spec is lexicon().
if addons:eagle:startname = "p65" { kStartP65(words,dev,spec). }
else { print "Unknown flight start.". return. }
segmentRope(words).
set words["lunarModule"] to true. set words["rhcWords"] to list(0,0,0).
set words["accessProvider"] to segmentAccess@. set words["radarSelection"] to -1.
set words["wiring"] to dev.
agcFastEnable(words,lexicon()).
kFly(words,dev,spec).
}
kResumeFlight().
