#!/bin/zsh
# Build the native computer library and the two KSP plugins into a KSP install (macOS).
# Usage: ./build.sh /path/to/KSP /path/to/virtualagc
set -e
HERE=${0:A:h}
KSP=${1:A}
ENGINE=${2:A}/yaAGC
OBJ=$HERE/native/obj
AGC=$KSP/GameData/ApolloNativeAGC
MANAGED=$KSP/KSP.app/Contents/Resources/Data/Managed
KOS=$KSP/GameData/kOS/Plugins
mkdir -p $OBJ $AGC/Plugins $AGC/PluginData $KSP/GameData/zzzApolloLanding/Plugins

# KSP runs as Intel under Rosetta, so the library is x86_64.
python3 $HERE/native/make_observable.py $ENGINE $OBJ/observable.c
for m in agc_engine_init agc_utilities rfopen Backtrace SocketAPI DecodeDigitalDownlink; do
  clang -arch x86_64 -O2 -std=gnu11 -pthread -DNVER='"pinned"' -I $ENGINE -c $ENGINE/$m.c -o $OBJ/$m.o
done
ar rcs $OBJ/libyaAGC.a $OBJ/*.o
clang -arch x86_64 -O2 -std=gnu11 -I $ENGINE -I $HERE/native -dynamiclib $HERE/native/agcksp.c \
    $OBJ/observable.c $OBJ/libyaAGC.a -lm -o $AGC/PluginData/libagcksp.dylib
codesign -s - -f $AGC/PluginData/libagcksp.dylib

REFS=(-r:$MANAGED/Assembly-CSharp.dll -r:$MANAGED/UnityEngine.dll -r:$MANAGED/UnityEngine.CoreModule.dll
      -r:$KOS/kOS.dll -r:$KOS/kOS.Safe.dll)
mcs -target:library -optimize+ $REFS -out:$AGC/Plugins/ApolloNativeAGC.dll $HERE/native/Agc*.cs
mcs -target:library -optimize+ $REFS -r:$MANAGED/UnityEngine.PhysicsModule.dll -r:$MANAGED/UnityEngine.UI.dll \
    -out:$KSP/GameData/zzzApolloLanding/Plugins/ApolloLanding.dll $HERE/ksp/ApolloLandingHardware.cs
