# Apollo 11 Guidance Computer in kOS

Abhinav Guntaka · November 2026

[Video](video/apollo-11-descent.mp4)

The Apollo 11 flight software running on a kOS processor in Kerbal Space Program. A compiler converts both programs, Comanche055 for the command module and Luminary099 for the lunar module, into KerboScript. Every line of the original source is kept as a comment next to the code or memory words made from it. A computer core written in KerboScript runs them.

The KerboScript computer was checked on the kOS virtual machine against Virtual AGC, a C emulator of the original computer. Luminary099 gives the same outputs through a full simulated landing, from power-on to touchdown. Comanche055 gives the same outputs through power-on and a keyboard session.

In KSP the KerboScript computer flew the last 43 seconds of the landing, which took about two hours to run. The video is the full powered descent, flown with the same wiring scripts and the original Luminary099 binary on Virtual AGC, called from kOS through an addon. Both flights use a smooth Mun resized to the real Moon, a lander moved by a plugin that applies the engine and jet forces the computer commands, and a saved start state.

## Install

macOS, KSP 1.12.5 with kOS 1.6.0.1 and Kopernicus. The build needs Mono and [Virtual AGC](https://github.com/virtualagc/virtualagc) at commit `3351d115`.

```sh
python3 install.py /path/to/KSP
./build.sh /path/to/KSP /path/to/virtualagc
```

The save **Apollo 11 orbit native** is the flight in the video. **Apollo 11 p65** uses the KerboScript computer. Compile the converted program for it once in a kOS terminal with `runpath("0:/compile.ks").`

## Compiler

```sh
python3 compiler/emit_ks.py out
python3 compiler/split_luminary.py out/Luminary099
```

This writes the KerboScript in [kos/Comanche055/](kos/Comanche055/) and [kos/Luminary099/](kos/Luminary099/) from [compiler/ir/](compiler/ir/). `build_ir.py` rebuilds the IR from the Apollo 11 source and its yaYUL assembly.

## Repository structure

| Path | Contents |
|---|---|
| [kos/core/](kos/core/) | Computer core: instructions, timers, interrupts and I/O |
| [kos/Comanche055/](kos/Comanche055/), [kos/Luminary099/](kos/Luminary099/) | Converted programs |
| [kos/wiring/](kos/wiring/) | IMU, landing radar, engine, jets, DSKY and crew |
| [kos/flight/](kos/flight/) | Flight loops, start states and boot files |
| [compiler/](compiler/) | Apollo source to KerboScript |
| [native/](native/) | Virtual AGC bridge in C and its kOS addon |
| [ksp/](ksp/) | Lander plugin, Mun and lander configs, saves |

## License

[GNU GPL version 2](LICENSE). The wiring is translated from [jweigend/Apollo11](https://github.com/jweigend/Apollo11) and the native bridge builds on Virtual AGC. The Apollo 11 source is in the public domain.
