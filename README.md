# Apollo 11 Guidance Computer in kOS

This runs the Apollo 11 guidance computer software in Kerbal Space Program with the [kOS](https://github.com/KSP-KOS/KOS) mod.

Comanche055 (command module) and Luminary099 (lunar module) are both compiled from the original source into KerboScript. All the original comments are still in there.

[Video of the landing](video/apollo-11-descent.mp4)

## Install

You need macOS, KSP 1.12.5, kOS 1.6.0.1, Kopernicus, Mono and a copy of [Virtual AGC](https://github.com/virtualagc/virtualagc). I've only run it on my Mac. Use a separate copy of KSP because the Mun gets resized to the real Moon.

    python3 install.py /path/to/KSP
    ./build.sh /path/to/KSP /path/to/virtualagc

Then pick a save from Resume Saved, go to the Tracking Station and fly Eagle. The boot script does the rest.

`Apollo 11 orbit native` flies the whole powered descent like in the video. It runs Luminary099 on Virtual AGC through a kOS addon.

`Apollo 11 p65` is the KerboScript version, last part of the landing only. It's really slow. Run `runpath("0:/compile.ks").` in a kOS terminal before you load it.

## Compiler

To rebuild `kos/Comanche055` and `kos/Luminary099`:

    python3 compiler/emit_ks.py out
    python3 compiler/split_luminary.py out/Luminary099

## Credits

- Apollo 11 source: [chrislgarry/Apollo-11](https://github.com/chrislgarry/Apollo-11)
- [Virtual AGC](https://github.com/virtualagc/virtualagc)
- Lander wiring adapted from [jweigend/Apollo11](https://github.com/jweigend/Apollo11)

GPL-2.0
