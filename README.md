# Apollo 11 Guidance Computer in kOS

This runs the Apollo 11 guidance computer software in Kerbal Space Program with the [kOS](https://github.com/KSP-KOS/KOS) mod.

Comanche055 (command module) and Luminary099 (lunar module) are both compiled from the original source into KerboScript. All the original comments are still in there, Kerbalized. Jeb and Bob fly the lander, Val flies the command module, and the jokes are Kerbal jokes now.

[Video of the landing](video/apollo-11-descent.mp4)

## Kerbalized

- `BURN, BABY, BURN` → `BURN, JEB, BURN`
- `OFF TO SEE THE WIZARD...` → `OFF TO SEE WERNHER VON KERMAN...`
- `NOLI SE TANGERE` → `NOLI KRAKEN EXCITARE`
- `TRASHY LITTLE SUBROUTINES` → `JEBEDIAH KERMAN'S JUNKYARD SUBROUTINES`
- `ASTRONAUT: NOW LOOK WHERE YOU ENDED UP` → `JEB: NOW LOOK WHERE YOU ENDED UP`
- `DONT DO POODOO. DO BAILOUT.` → `DONT DO POODOO. DO BAILOUT. NO F9 UP HERE.`
- Everyone credited is a Kerman now, like `MAINTAINED BY ADLER KERMAN AND EYLES KERMAN`
- Earth, the Moon and the Sun are Kerbin, the Mun and Kerbol. The Lunar Module is the Munar Excursion Module.
- Eagle is a Mk1 Lander Can with a Terrier for descent, a Spark for ascent and 16 Ants for jets
- The Mun is resized to the Moon, with the Moon's gravity and spin and the terrain smoothed out

## Install

You need macOS, KSP 1.12.5, kOS 1.6.0.1, Kopernicus, Mono and a copy of [Virtual AGC](https://github.com/virtualagc/virtualagc). I've only run it on my Mac. Preferably Use a separate copy of KSP pls.

    python3 install.py /path/to/KSP
    ./build.sh /path/to/KSP /path/to/virtualagc

Then pick a save from Resume Saved, go to the Tracking Station and fly Eagle, the boot script then does the rest.

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
