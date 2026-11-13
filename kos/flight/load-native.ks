// Native-engine flight. The wiring and the P65 start come from the files that flew
// the kOS port. The CPU is the AGC addon (pinned yaAGC with the Luminary099 rope).
set config:clobberbuiltins to true.
runpath("0:/wiring/loader.ks").
runpath("0:/apollo-landing/p65.ks").
runpath("0:/apollo-native/orbit.ks").
runpath("0:/apollo-native/runtime-native.ks").
