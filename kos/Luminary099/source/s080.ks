// T4RUPT_PROGRAM.agc
// bank 06, slots 8192-8201
function agcAotUnit467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8196 {
        if slot <= 8193 {
            if slot <= 8192 {
// T4RUPT_PROGRAM.agc:1
//# Copyright:    Public domain.
// T4RUPT_PROGRAM.agc:2
//# Filename:     T4RUPT_PROGRAM.agc
// T4RUPT_PROGRAM.agc:3
//# Purpose:      Part of the source code for Luminary 1A build 099.
// T4RUPT_PROGRAM.agc:4
//#               It is part of the source code for the Munar Excursion Module's (LM)
// T4RUPT_PROGRAM.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// T4RUPT_PROGRAM.agc:6
//# Assembler:    yaYUL
// T4RUPT_PROGRAM.agc:7
//# Contact:      Gutsche Kerman <hgutsche@xplornet.com>.
// T4RUPT_PROGRAM.agc:8
//# Website:      www.ibiblio.org/apollo.
// T4RUPT_PROGRAM.agc:9
//# Pages:        155-189
// T4RUPT_PROGRAM.agc:10
//# Mod history:  2009-05-19 HG   Transcribed from page images.
// T4RUPT_PROGRAM.agc:11
//#		2010-12-31 JL	Fixed page number comment.
// T4RUPT_PROGRAM.agc:12
//#		2011-01-06 JL	Fixed indentation of TNONTEST. Fixed pseudo-label indentation.
// T4RUPT_PROGRAM.agc:13
//#
// T4RUPT_PROGRAM.agc:14
//# This source code has been transcribed or otherwise adapted from
// T4RUPT_PROGRAM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// T4RUPT_PROGRAM.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// T4RUPT_PROGRAM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// T4RUPT_PROGRAM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// T4RUPT_PROGRAM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// T4RUPT_PROGRAM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// T4RUPT_PROGRAM.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// T4RUPT_PROGRAM.agc:22
//# actually created.
// T4RUPT_PROGRAM.agc:23
//#
// T4RUPT_PROGRAM.agc:24
//# Notations on the hardcopy document read, in part:
// T4RUPT_PROGRAM.agc:25
//#
// T4RUPT_PROGRAM.agc:26
//#       Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// T4RUPT_PROGRAM.agc:27
//#       16:27 JULY 14, 1969
// T4RUPT_PROGRAM.agc:28
//# Page 155
// T4RUPT_PROGRAM.agc:29
//		BANK	12
// T4RUPT_PROGRAM.agc:30
//		SETLOC	T4RUP
// T4RUPT_PROGRAM.agc:31
//		BANK
// T4RUPT_PROGRAM.agc:32
//
// T4RUPT_PROGRAM.agc:33
//		EBANK=	M11
// T4RUPT_PROGRAM.agc:34
//		COUNT*	$$/T4RPT
// T4RUPT_PROGRAM.agc:35
//T4RUPT		TS	BANKRUPT
// slot 8192
                if slot <> 8192 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:36
//
// T4RUPT_PROGRAM.agc:37
//		EXTEND
// slot 8193
                if slot <> 8193 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8194 {
// T4RUPT_PROGRAM.agc:38
//		QXCH	QRUPT
// slot 8194
                if slot <> 8194 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8195 {
// T4RUPT_PROGRAM.agc:39
//
// T4RUPT_PROGRAM.agc:40
//		CCS	DSRUPTSW	# GOES 7(-1)0 AROUND AND AROUND
// slot 8195
                    if slot <> 8195 or instruction <> 4811 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 715).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:41
//		TCF	NORMT4 +1
// slot 8196
                    if slot <> 8196 or instruction <> 5128 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5128, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8198 {
            if slot <= 8197 {
// T4RUPT_PROGRAM.agc:42
//		TCF	NORMT4
// slot 8197
                if slot <> 8197 or instruction <> 5127 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5127, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:43
//
// T4RUPT_PROGRAM.agc:44
//		TCF	QUIKDSP
// slot 8198
                if slot <> 8198 or instruction <> 5212 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5212, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8199 {
// T4RUPT_PROGRAM.agc:45
//
// T4RUPT_PROGRAM.agc:46
//NORMT4		CAF	SEVEN
// slot 8199
                if slot <> 8199 or instruction <> 14831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8200 {
// T4RUPT_PROGRAM.agc:47
//		TS	RUPTREG1
// slot 8200
                    if slot <> 8200 or instruction <> 22584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22584, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:48
//		TS	DSRUPTSW
// slot 8201
                    if slot <> 8201 or instruction <> 23243 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23243, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[467] to agcAotUnit467@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:49
//
// T4RUPT_PROGRAM.agc:50
//		BLOCK	02
// T4RUPT_PROGRAM.agc:51
//		SETLOC	FFTAG10
// T4RUPT_PROGRAM.agc:52
//		BANK
// T4RUPT_PROGRAM.agc:53
//
// T4RUPT_PROGRAM.agc:54
//		COUNT*	$$/T4RPT
// T4RUPT_PROGRAM.agc:55
//100MRUPT	=	OCT37766	# (DEC 16374)
// T4RUPT_PROGRAM.agc:56
//		# RELTAB IS A PACKED TABLE. RELAYWORD CODE IN UPPER 4 BITS, RELAY CODE
// T4RUPT_PROGRAM.agc:57
//		# IN LOWER 5 BITS.
// T4RUPT_PROGRAM.agc:58
//
// T4RUPT_PROGRAM.agc:59
//RELTAB		OCT	04025
// slot 4150
    4150, 4138,
// T4RUPT_PROGRAM.agc:60
//		OCT	10003
// slot 4151
    4151, 8198,
// T4RUPT_PROGRAM.agc:61
//		OCT	14031
// slot 4152
    4152, 12338,
// T4RUPT_PROGRAM.agc:62
//		OCT	20033
// slot 4153
    4153, 16438,
// T4RUPT_PROGRAM.agc:63
//		OCT	24017
// slot 4154
    4154, 20510,
// T4RUPT_PROGRAM.agc:64
//		OCT	30036
// slot 4155
    4155, 24636,
// T4RUPT_PROGRAM.agc:65
//		OCT	34034
// slot 4156
    4156, 28728,
// T4RUPT_PROGRAM.agc:66
//		OCT	40023
// slot 4157
    4157, 32806,
// T4RUPT_PROGRAM.agc:67
//		OCT	44035
// slot 4158
    4158, 36922,
// T4RUPT_PROGRAM.agc:68
//		OCT	50037
// slot 4159
    4159, 41022,
// T4RUPT_PROGRAM.agc:69
//		OCT	54000
// slot 4160
    4160, 45056,
// T4RUPT_PROGRAM.agc:70
//RELTAB11	OCT	60000
// slot 4161
    4161, 49152
)).

// bank 06, slots 8202-8218
function agcAotUnit468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8209 {
        if slot <= 8205 {
            if slot <= 8203 {
                if slot <= 8202 {
// T4RUPT_PROGRAM.agc:71
//
// T4RUPT_PROGRAM.agc:72
//# Page 156
// T4RUPT_PROGRAM.agc:73
//		# SWITCHED-BANK PORTION
// T4RUPT_PROGRAM.agc:74
//
// T4RUPT_PROGRAM.agc:75
//		BANK	12
// T4RUPT_PROGRAM.agc:76
//		SETLOC	T4RUP
// T4RUPT_PROGRAM.agc:77
//		BANK
// T4RUPT_PROGRAM.agc:78
//
// T4RUPT_PROGRAM.agc:79
//		COUNT*	$$/T4RPT
// T4RUPT_PROGRAM.agc:80
//CDRVE		CCS	DSPTAB +11D
// slot 8202
                    if slot <> 8202 or instruction <> 4638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 542).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:81
//		TC	DSPOUT
// slot 8203
                    if slot <> 8203 or instruction <> 1075 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1075, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8204 {
// T4RUPT_PROGRAM.agc:82
//		TC	DSPOUT
// slot 8204
                    if slot <> 8204 or instruction <> 1075 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1075, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:83
//
// T4RUPT_PROGRAM.agc:84
//		XCH	DSPTAB +11D
// slot 8205
                    if slot <> 8205 or instruction <> 24094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 542, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8207 {
                if slot <= 8206 {
// T4RUPT_PROGRAM.agc:85
//		MASK	LOW11
// slot 8206
                    if slot <> 8206 or instruction <> 30958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2286), 32768).
                        if fixedOperand = 2047 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2048) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:86
//		TS	DSPTAB +11D
// slot 8207
                    if slot <> 8207 or instruction <> 23070 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23070, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8208 {
// T4RUPT_PROGRAM.agc:87
//		AD	RELTAB11
// slot 8208
                    if slot <> 8208 or instruction <> 26689 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2113), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:88
//		EXTEND
// slot 8209
                    if slot <> 8209 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8213 {
            if slot <= 8211 {
                if slot <= 8210 {
// T4RUPT_PROGRAM.agc:89
//		WRITE	OUT0
// slot 8210
                    if slot <> 8210 or instruction <> 520 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:90
//		TC	HANG20
// slot 8211
                    if slot <> 8211 or instruction <> 1081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1081, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8212 {
// T4RUPT_PROGRAM.agc:91
//
// T4RUPT_PROGRAM.agc:92
//# Page 157
// T4RUPT_PROGRAM.agc:93
//		# DSPOUT PROGRAM, PUTS OUT DISPLAYS
// T4RUPT_PROGRAM.agc:94
//
// T4RUPT_PROGRAM.agc:95
//DSPOUTSB	TS	NOUT
// slot 8212
                    if slot <> 8212 or instruction <> 23054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:96
//		CS	ZERO
// slot 8213
                    if slot <> 8213 or instruction <> 18925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8215 {
                if slot <= 8214 {
// T4RUPT_PROGRAM.agc:97
//		TS	DSRUPTEM	# SET TO -0 FOR 1ST PASS THRU DSPTAB
// slot 8214
                    if slot <> 8214 or instruction <> 22587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:98
//		XCH	DSPCNT
// slot 8215
                    if slot <> 8215 or instruction <> 24062 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 510, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8216 {
// T4RUPT_PROGRAM.agc:99
//		AD	NEG0		# TO PREVENT +0
// slot 8216
                    if slot <> 8216 or instruction <> 27116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2540), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8217 {
// T4RUPT_PROGRAM.agc:100
//		TS	DSPCNT
// slot 8217
                        if slot <> 8217 or instruction <> 23038 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23038, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:101
//DSPSCAN		INDEX	DSPCNT
// slot 8218
                        if slot <> 8218 or instruction <> 20990 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20990, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20990, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[468] to agcAotUnit468@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:102
//		CCS	DSPTAB
// slot 8219
    8219, 9254
)).

// bank 06, slots 8220-8222
function agcAotUnit469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8220 {
// T4RUPT_PROGRAM.agc:103
//		CCS	DSPCNT		# IF DSPTAB ENTRY +, SKIP
// slot 8220
        if slot <> 8220 or instruction <> 4606 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 510).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8221 {
// T4RUPT_PROGRAM.agc:104
//		TCF	DSPSCAN	-2	# IF DSPCNT +, TRY AGAIN
// slot 8221
            if slot <> 8221 or instruction <> 5144 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5144, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:105
//		TCF	DSPLAY		# IF DSPTAB ENTRY -, DISPLAY
// slot 8222
            if slot <> 8222 or instruction <> 5159 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5159, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[469] to agcAotUnit469@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:106
//TABLNTH		OCT	12		# DEC 10, LENGTH OF DSPTAB
// slot 8223
    8223, 20
)).

// bank 06, slots 8224-8224
function agcAotUnit470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// T4RUPT_PROGRAM.agc:107
//		CCS	DSRUPTEM	# IF DSRUPTEM=+0, 2ND PASS THRU DSPTAB
// slot 8224
    if slot <> 8224 or instruction <> 4155 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCCS(words, 59).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[470] to agcAotUnit470@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:108
//120MRUPT	DEC	16372		# (DSPCNT = 0).  +0 INTO NOUT.
// slot 8225
    8225, 32744
)).

// bank 06, slots 8226-8232
function agcAotUnit471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8228 {
        if slot <= 8226 {
// T4RUPT_PROGRAM.agc:109
//		TS	NOUT
// slot 8226
            if slot <> 8226 or instruction <> 23054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8227 {
// T4RUPT_PROGRAM.agc:110
//		TC	Q
// slot 8227
                if slot <> 8227 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:111
//		TS	DSRUPTEM	# IF DSRUPTEM=-0, 1ST PASS THRU DSPTAB
// slot 8228
                if slot <> 8228 or instruction <> 22587 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22587, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8230 {
            if slot <= 8229 {
// T4RUPT_PROGRAM.agc:112
//		CAF	TABLNTH		# (DSPCNT=0).+0 INTO DSRUPTEM. PASS AGAIN
// slot 8229
                if slot <> 8229 or instruction <> 13343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1055), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:113
//		TCF	DSPSCAN -1
// slot 8230
                if slot <> 8230 or instruction <> 5145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5145, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8231 {
// T4RUPT_PROGRAM.agc:114
//
// T4RUPT_PROGRAM.agc:115
//DSPLAY		AD	ONE
// slot 8231
                if slot <> 8231 or instruction <> 27115 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:116
//		INDEX	DSPCNT
// slot 8232
                if slot <> 8232 or instruction <> 20990 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20990, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20990, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[471] to agcAotUnit471@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:117
//		TS	DSPTAB		# REPLACE POSITIVELY
// slot 8233
    8233, 46118
)).

// bank 06, slots 8234-8237
function agcAotUnit472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8235 {
        if slot <= 8234 {
// T4RUPT_PROGRAM.agc:118
//		MASK	LOW11		# REMOVE BITS 12 TO 15
// slot 8234
            if slot <> 8234 or instruction <> 30958 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2286), 32768).
                if fixedOperand = 2047 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2048) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:119
//		TS	DSRUPTEM
// slot 8235
            if slot <> 8235 or instruction <> 22587 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22587, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8236 {
// T4RUPT_PROGRAM.agc:120
//		CAF	HI5
// slot 8236
            if slot <> 8236 or instruction <> 14568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:121
//		INDEX	DSPCNT
// slot 8237
            if slot <> 8237 or instruction <> 20990 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20990, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20990, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[472] to agcAotUnit472@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:122
//		MASK	RELTAB		# PICK UP BITS 12 TO 15 OF RELTAB ENTRY
// slot 8238
    8238, 61548
)).

// bank 06, slots 8239-8267
function agcAotUnit473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8252 {
        if slot <= 8245 {
            if slot <= 8241 {
                if slot <= 8239 {
// T4RUPT_PROGRAM.agc:123
//		AD	DSRUPTEM
// slot 8239
                    if slot <> 8239 or instruction <> 24635 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 59).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8240 {
// T4RUPT_PROGRAM.agc:124
//		EXTEND
// slot 8240
                        if slot <> 8240 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:125
//		WRITE	OUT0
// slot 8241
                        if slot <> 8241 or instruction <> 520 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8243 {
                    if slot <= 8242 {
// T4RUPT_PROGRAM.agc:126
//
// T4RUPT_PROGRAM.agc:127
//		TCF	Q+1
// slot 8242
                        if slot <> 8242 or instruction <> 7647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:128
//
// T4RUPT_PROGRAM.agc:129
//DSPOUT		CCS	FLAGWRD5	# IS DSKY FLAG ON
// slot 8243
                        if slot <> 8243 or instruction <> 4161 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8244 {
// T4RUPT_PROGRAM.agc:130
//		CAF	ZERO		# NO
// slot 8244
                        if slot <> 8244 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:131
//		TCF	NODSPOUT	# NO
// slot 8245
                        if slot <> 8245 or instruction <> 5208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5208, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8248 {
                if slot <= 8246 {
// T4RUPT_PROGRAM.agc:132
//		CCS	NOUT		# YES
// slot 8246
                    if slot <> 8246 or instruction <> 4622 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 526).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8247 {
// T4RUPT_PROGRAM.agc:133
//		TC	DSPOUTSB
// slot 8247
                        if slot <> 8247 or instruction <> 1044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:134
//		TCF	NODSPOUT	# NO DISPLAY REQUESTS
// slot 8248
                        if slot <> 8248 or instruction <> 5208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5208, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8250 {
                    if slot <= 8249 {
// T4RUPT_PROGRAM.agc:135
//
// T4RUPT_PROGRAM.agc:136
//HANG20		CS	14,11,9
// slot 8249
                        if slot <> 8249 or instruction <> 17529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1145), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:137
//		ADS	DSRUPTSW
// slot 8250
                        if slot <> 8250 or instruction <> 11979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 715).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8251 {
// T4RUPT_PROGRAM.agc:138
//
// T4RUPT_PROGRAM.agc:139
//		CAF	20MRUPT
// slot 8251
                        if slot <> 8251 or instruction <> 16345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4057), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:140
//
// T4RUPT_PROGRAM.agc:141
//SETTIME4	TS	TIME4
// slot 8252
                        if slot <> 8252 or instruction <> 22551 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22551, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8259 {
            if slot <= 8255 {
                if slot <= 8253 {
// T4RUPT_PROGRAM.agc:142
//
// T4RUPT_PROGRAM.agc:143
//# Page 158
// T4RUPT_PROGRAM.agc:144
//		# THE STATUS OF THE PROCEED PUSHBUTTON IS MONITORED EVERY 120 MILLISECONDS VIA THE CHANNEL 32 BIT 14 INBIT.
// T4RUPT_PROGRAM.agc:145
//		#  THE STATE OF THIS INBIT IS COMPARED WITH ITS STATE DURING THE PREVIOUS T4RUPT AND IS PROCESSED AS FOLLOWS.
// T4RUPT_PROGRAM.agc:146
//		#	IF PREV ON AND NOW ON	-- BYPASS.
// T4RUPT_PROGRAM.agc:147
//		#	IF PREV ON AND NOW OFF	-- UPDATE IMODES33.
// T4RUPT_PROGRAM.agc:148
//		#	IF PREV OFF AND NOW ON	-- UPDATE IMODES33 AND PROCESS VIA PINBALL.
// T4RUPT_PROGRAM.agc:149
//		#	IF PREV OFF AND NOW OFF	-- BYPASS.
// T4RUPT_PROGRAM.agc:150
//		# THE LOGIC EMPLOYED REQUIRES ONLY 9 MCT (APPROX. 108 MICROSECONDS) OF COMPUTER TIME WHEN NO CHANGES OCCUR.
// T4RUPT_PROGRAM.agc:151
//
// T4RUPT_PROGRAM.agc:152
//PROCEEDE	CA	IMODES33	# MONITOR FOR PROCEED BUTTON
// slot 8253
                    if slot <> 8253 or instruction <> 12995 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8254 {
// T4RUPT_PROGRAM.agc:153
//		EXTEND
// slot 8254
                        if slot <> 8254 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:154
//		RXOR	CHAN32
// slot 8255
                        if slot <> 8255 or instruction <> 3098 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 26, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8257 {
                    if slot <= 8256 {
// T4RUPT_PROGRAM.agc:155
//		MASK	BIT14
// slot 8256
                        if slot <> 8256 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            if fixedOperand = 8192 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:156
//		EXTEND
// slot 8257
                        if slot <> 8257 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8258 {
// T4RUPT_PROGRAM.agc:157
//		BZF	T4JUMP		# NO CHANGE
// slot 8258
                        if slot <> 8258 or instruction <> 5198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5198, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:158
//
// T4RUPT_PROGRAM.agc:159
//		LXCH	IMODES33
// slot 8259
                        if slot <> 8259 or instruction <> 9923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 707, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8263 {
                if slot <= 8261 {
                    if slot <= 8260 {
// T4RUPT_PROGRAM.agc:160
//		EXTEND
// slot 8260
                        if slot <> 8260 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:161
//		RXOR	LCHAN
// slot 8261
                        if slot <> 8261 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8262 {
// T4RUPT_PROGRAM.agc:162
//		TS	IMODES33	# UPDATE IMODES33
// slot 8262
                        if slot <> 8262 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:163
//		MASK	BIT14
// slot 8263
                        if slot <> 8263 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            if fixedOperand = 8192 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8265 {
                    if slot <= 8264 {
// T4RUPT_PROGRAM.agc:164
//		CCS	A
// slot 8264
                        if slot <> 8264 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:165
//		TCF	T4JUMP		# WAS ON -- NOW OFF
// slot 8265
                        if slot <> 8265 or instruction <> 5198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5198, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8266 {
// T4RUPT_PROGRAM.agc:166
//
// T4RUPT_PROGRAM.agc:167
//		CAF	CHRPRIO		# WAS OFF -- NOW ON
// slot 8266
                        if slot <> 8266 or instruction <> 14573 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:168
//		TC	NOVAC
// slot 8267
                        if slot <> 8267 or instruction <> 2618 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2618, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[473] to agcAotUnit473@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:169
//		EBANK=	DSPCOUNT
// T4RUPT_PROGRAM.agc:170
//		2CADR	PROCKEY
// slot 8268 8269
    8268, 3668, 8269, 49282
)).

// bank 06, slots 8270-8270
function agcAotUnit474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// T4RUPT_PROGRAM.agc:171
//
// T4RUPT_PROGRAM.agc:172
//# Page 159
// T4RUPT_PROGRAM.agc:173
//		# JUMP TO APPROPRIATE ONCE-PER SECOND (0.96 SEC ACTUALLY) ACTIVITY
// T4RUPT_PROGRAM.agc:174
//
// T4RUPT_PROGRAM.agc:175
//T4JUMP		INDEX	RUPTREG1
// slot 8270
    if slot <> 8270 or instruction <> 20536 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20536, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[474] to agcAotUnit474@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:176
//		TCF	+1
// slot 8271
    8271, 10400
)).

// bank 06, slots 8272-8305
function agcAotUnit475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8288 {
        if slot <= 8279 {
            if slot <= 8275 {
                if slot <= 8273 {
                    if slot <= 8272 {
// T4RUPT_PROGRAM.agc:177
//
// T4RUPT_PROGRAM.agc:178
//		TC	RCSMONIT
// slot 8272
                        if slot <> 8272 or instruction <> 1646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1646, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:179
//		TCF	RRAUTCHK
// slot 8273
                        if slot <> 8273 or instruction <> 5638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8274 {
// T4RUPT_PROGRAM.agc:180
//		TCF	IMUMON
// slot 8274
                        if slot <> 8274 or instruction <> 5242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:181
//		TCF	DAPT4S
// slot 8275
                        if slot <> 8275 or instruction <> 5722 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5722, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8277 {
                    if slot <= 8276 {
// T4RUPT_PROGRAM.agc:182
//		TC	RCSMONIT
// slot 8276
                        if slot <> 8276 or instruction <> 1646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1646, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:183
//		TCF	RRAUTCHK
// slot 8277
                        if slot <> 8277 or instruction <> 5638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8278 {
// T4RUPT_PROGRAM.agc:184
//		TCF	IMUMON
// slot 8278
                        if slot <> 8278 or instruction <> 5242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:185
//		TCF	DAPT4S
// slot 8279
                        if slot <> 8279 or instruction <> 5722 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5722, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8283 {
                if slot <= 8281 {
                    if slot <= 8280 {
// T4RUPT_PROGRAM.agc:186
//
// T4RUPT_PROGRAM.agc:187
//20MRUPT		=	OCT37776	# (DEC 16382)
// T4RUPT_PROGRAM.agc:188
//
// T4RUPT_PROGRAM.agc:189
//# Page 160
// T4RUPT_PROGRAM.agc:190
//		# ADDITIONAL ROUTINES FOR 20MS. KEYBOARD ACTIVITY
// T4RUPT_PROGRAM.agc:191
//
// T4RUPT_PROGRAM.agc:192
//NODSPOUT	EXTEND
// slot 8280
                        if slot <> 8280 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:193
//		WRITE	OUT0
// slot 8281
                        if slot <> 8281 or instruction <> 520 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8282 {
// T4RUPT_PROGRAM.agc:194
//
// T4RUPT_PROGRAM.agc:195
//		CAF	120MRUPT	#SET FOR NEXT CCRIVE
// slot 8282
                        if slot <> 8282 or instruction <> 13345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1057), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:196
//		TCF	SETTIME4
// slot 8283
                        if slot <> 8283 or instruction <> 5180 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5180, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8285 {
                    if slot <= 8284 {
// T4RUPT_PROGRAM.agc:197
//
// T4RUPT_PROGRAM.agc:198
//QUIKDSP		CAF	BIT14
// slot 8284
                        if slot <> 8284 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:199
//		MASK	DSRUPTSW
// slot 8285
                        if slot <> 8285 or instruction <> 29387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 715).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8286 {
// T4RUPT_PROGRAM.agc:200
//		EXTEND
// slot 8286
                        if slot <> 8286 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8287 {
// T4RUPT_PROGRAM.agc:201
//		BZF	QUIKOFF		# WROTE LAST TIME, NOW TURN OFF RELAYS.
// slot 8287
                            if slot <> 8287 or instruction <> 5237 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5237, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:202
//
// T4RUPT_PROGRAM.agc:203
//		CCS	NOUT
// slot 8288
                            if slot <> 8288 or instruction <> 4622 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 526).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8296 {
            if slot <= 8292 {
                if slot <= 8290 {
                    if slot <= 8289 {
// T4RUPT_PROGRAM.agc:204
//		TC	DSPOUTSB
// slot 8289
                        if slot <> 8289 or instruction <> 1044 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1044, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:205
//		TCF	NODSPY		# NOUT=0 OR BAD RETURN FROM DSPOUTSB
// slot 8290
                        if slot <> 8290 or instruction <> 5226 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5226, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8291 {
// T4RUPT_PROGRAM.agc:206
//		CS	BIT14		# GOOD RETURN (WE DISPLAYED SOMETHING)
// slot 8291
                        if slot <> 8291 or instruction <> 18910 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:207
//QUIKRUPT	ADS	DSRUPTSW
// slot 8292
                        if slot <> 8292 or instruction <> 11979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 715).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8294 {
                    if slot <= 8293 {
// T4RUPT_PROGRAM.agc:208
//
// T4RUPT_PROGRAM.agc:209
//		CAF	20MRUPT
// slot 8293
                        if slot <> 8293 or instruction <> 16345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4057), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:210
//		TS	TIME4
// slot 8294
                        if slot <> 8294 or instruction <> 22551 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22551, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8295 {
// T4RUPT_PROGRAM.agc:211
//
// T4RUPT_PROGRAM.agc:212
//		CAF	BIT9
// slot 8295
                        if slot <> 8295 or instruction <> 14819 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:213
//		ADS	DSRUPTSW
// slot 8296
                        if slot <> 8296 or instruction <> 11979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 715).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8300 {
                if slot <= 8298 {
                    if slot <= 8297 {
// T4RUPT_PROGRAM.agc:214
//
// T4RUPT_PROGRAM.agc:215
//		TC	RESUME
// slot 8297
                        if slot <> 8297 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:216
//
// T4RUPT_PROGRAM.agc:217
//NODSPY		EXTEND
// slot 8298
                        if slot <> 8298 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8299 {
// T4RUPT_PROGRAM.agc:218
//		WRITE	OUT0
// slot 8299
                        if slot <> 8299 or instruction <> 520 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:219
//
// T4RUPT_PROGRAM.agc:220
//SYNCT4		CAF	20MRUPT
// slot 8300
                        if slot <> 8300 or instruction <> 16345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4057), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8302 {
                    if slot <= 8301 {
// T4RUPT_PROGRAM.agc:221
//		ADS	TIME4
// slot 8301
                        if slot <> 8301 or instruction <> 11287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 23).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:222
//
// T4RUPT_PROGRAM.agc:223
//		CAF	BIT9
// slot 8302
                        if slot <> 8302 or instruction <> 14819 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8303 {
// T4RUPT_PROGRAM.agc:224
//		ADS	DSRUPTSW
// slot 8303
                        if slot <> 8303 or instruction <> 11979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 715).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8304 {
// T4RUPT_PROGRAM.agc:225
//
// T4RUPT_PROGRAM.agc:226
//		CCS	DSRUPTSW
// slot 8304
                            if slot <> 8304 or instruction <> 4811 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 715).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:227
//		TC	RESUME
// slot 8305
                            if slot <> 8305 or instruction <> 2744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[475] to agcAotUnit475@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:228
//OCT37737	OCT	37737
// slot 8306
    8306, 32702
)).

// bank 06, slots 8307-8312
function agcAotUnit476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8309 {
        if slot <= 8307 {
// T4RUPT_PROGRAM.agc:229
//		TC	SYNCT4
// slot 8307
            if slot <> 8307 or instruction <> 1132 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1132, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8308 {
// T4RUPT_PROGRAM.agc:230
//		TC	RESUME
// slot 8308
                if slot <> 8308 or instruction <> 2744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2744, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:231
//
// T4RUPT_PROGRAM.agc:232
//QUIKOFF		EXTEND
// slot 8309
                if slot <> 8309 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8310 {
// T4RUPT_PROGRAM.agc:233
//		WRITE	OUT0
// slot 8310
            if slot <> 8310 or instruction <> 520 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 8, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8311 {
// T4RUPT_PROGRAM.agc:234
//		CAF	BIT14		# RESET DSRUPTSW TO SEND DISPLAY NEXT PASS
// slot 8311
                if slot <> 8311 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:235
//		TCF	QUIKRUPT
// slot 8312
                if slot <> 8312 or instruction <> 5220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5220, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[476] to agcAotUnit476@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:236
//
// T4RUPT_PROGRAM.agc:237
//14,11,9		OCT	22400
// slot 8313
    8313, 18944
)).

// bank 06, slots 8314-8329
function agcAotUnit477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8321 {
        if slot <= 8317 {
            if slot <= 8315 {
                if slot <= 8314 {
// T4RUPT_PROGRAM.agc:238
//
// T4RUPT_PROGRAM.agc:239
//# Page 161
// T4RUPT_PROGRAM.agc:240
//# PROGRAM NAME:  IMUMON
// T4RUPT_PROGRAM.agc:241
//
// T4RUPT_PROGRAM.agc:242
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS ENTERED EVERY 480 MS.  IT DETECTS CHANGES OF THE IMU STATUS BITS IN
// T4RUPT_PROGRAM.agc:243
//# CHANNEL 30 AND CALLS THE APPROPRIATE SUBROUTINES.  THE BITS PROCESSED AND THEIR RELEVANT SUROUTINES ARE:
// T4RUPT_PROGRAM.agc:244
//
// T4RUPT_PROGRAM.agc:245
//#	FUNCTION		BIT	SUBROUTINE CALLED
// T4RUPT_PROGRAM.agc:246
//#	--------		---	-----------------
// T4RUPT_PROGRAM.agc:247
//#	TEMP IN LIMITS		 15	TLIM
// T4RUPT_PROGRAM.agc:248
//#	ISS TURN-ON REQUEST	 14	ITURNON
// T4RUPT_PROGRAM.agc:249
//#	IMU FAIL		 13	IMUFAIL (SETISSW)
// T4RUPT_PROGRAM.agc:250
//#	IMU CDU FAIL		 12	ICDUFAIL (SETISSW)
// T4RUPT_PROGRAM.agc:251
//#	IMU CAGE		 11	IMUCAGE
// T4RUPT_PROGRAM.agc:252
//#	IMU OPERATE		  9	IMUOP
// T4RUPT_PROGRAM.agc:253
//
// T4RUPT_PROGRAM.agc:254
//# THE LAST SAMPLED STATE OF THESE BITS IS LEFT IN IMODES30.  ALSO, EACH SUBROUTINE CALLED FINDS THE NEW
// T4RUPT_PROGRAM.agc:255
//# VALUE OF THE BIT IN A, WITH Q SET TO THE PROPER RETURN LOCATION NXTIFAIL.
// T4RUPT_PROGRAM.agc:256
//
// T4RUPT_PROGRAM.agc:257
//# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS.
// T4RUPT_PROGRAM.agc:258
//
// T4RUPT_PROGRAM.agc:259
//# JOBS OR TASKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:260
//
// T4RUPT_PROGRAM.agc:261
//# SUBROUTINES CALLED:  TLIM, TURNON, SETISSW, IMUCAGE, IMUOP.
// T4RUPT_PROGRAM.agc:262
//
// T4RUPT_PROGRAM.agc:263
//# ERASABELE INITIALIZATION:
// T4RUPT_PROGRAM.agc:264
//#	FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C((MODES30) = OCT 37411).
// T4RUPT_PROGRAM.agc:265
//#	RESTART WITH ACTIVE GROUPS:	C(IMODES30) = (B(IMODES30)AND(OCT 00035)) PLUS OCT 37400.
// T4RUPT_PROGRAM.agc:266
//#					THIS LEAVES IMU FAIL BITS INTACT.
// T4RUPT_PROGRAM.agc:267
//
// T4RUPT_PROGRAM.agc:268
//# ALARMS:  NONE.
// T4RUPT_PROGRAM.agc:269
//
// T4RUPT_PROGRAM.agc:270
//# EXIT:  TNONTEST.
// T4RUPT_PROGRAM.agc:271
//
// T4RUPT_PROGRAM.agc:272
//# OUTPUT:  UPDATED IMODES30 WITH CHANGES PROCESSED BY APPROPRIATE SUBROUTINE.
// T4RUPT_PROGRAM.agc:273
//
// T4RUPT_PROGRAM.agc:274
//IMUMON		CA	IMODES30	# SEE IF THERE HAS BEEN A CHANGE IN THE
// slot 8314
                    if slot <> 8314 or instruction <> 12994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:275
//		EXTEND			# RELEVANT BITS OF CHAN 30.
// slot 8315
                    if slot <> 8315 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8316 {
// T4RUPT_PROGRAM.agc:276
//		RXOR	CHAN30
// slot 8316
                    if slot <> 8316 or instruction <> 3096 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 24, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:277
//		MASK	30RDMSK
// slot 8317
                    if slot <> 8317 or instruction <> 30193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1521), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8319 {
                if slot <= 8318 {
// T4RUPT_PROGRAM.agc:278
//		EXTEND
// slot 8318
                    if slot <> 8318 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:279
//		BZF	TNONTEST	# NO CHANGE IN STATUS
// slot 8319
                    if slot <> 8319 or instruction <> 5271 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8320 {
// T4RUPT_PROGRAM.agc:280
//
// T4RUPT_PROGRAM.agc:281
//		TS	RUPTREG1	# SAVE BITS WHICH HAVE CHANGED.
// slot 8320
                    if slot <> 8320 or instruction <> 22584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22584, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:282
//		LXCH	IMODES30	# UPDATE IMODES30.
// slot 8321
                    if slot <> 8321 or instruction <> 9922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 706, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8325 {
            if slot <= 8323 {
                if slot <= 8322 {
// T4RUPT_PROGRAM.agc:283
//		EXTEND
// slot 8322
                    if slot <> 8322 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:284
//		RXOR	LCHAN
// slot 8323
                    if slot <> 8323 or instruction <> 3073 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8324 {
// T4RUPT_PROGRAM.agc:285
//		TS	IMODES30
// slot 8324
                    if slot <> 8324 or instruction <> 23234 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23234, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:286
//
// T4RUPT_PROGRAM.agc:287
//		CS	ONE
// slot 8325
                    if slot <> 8325 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8327 {
                if slot <= 8326 {
// T4RUPT_PROGRAM.agc:288
//		XCH	RUPTREG1
// slot 8326
                    if slot <> 8326 or instruction <> 23608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 56, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:289
//		EXTEND
// slot 8327
                    if slot <> 8327 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8328 {
// T4RUPT_PROGRAM.agc:290
//# Page 162
// T4RUPT_PROGRAM.agc:291
//		BZMF	TLIM		# CHANGE IN IMU TEMP.
// slot 8328
                    if slot <> 8328 or instruction <> 25932 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25932, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:292
//		TCF	NXTIFBIT	# BEGIN BIT SCAN.
// slot 8329
                    if slot <> 8329 or instruction <> 5259 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5259, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[477] to agcAotUnit477@.

// bank 06, slots 8330-8336
function agcAotUnit478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8332 {
        if slot <= 8330 {
// T4RUPT_PROGRAM.agc:293
//
// T4RUPT_PROGRAM.agc:294
// -1		AD	ONE		# (RE-ENTERS HERE FROM NXTIFAIL.)
// slot 8330
            if slot <> 8330 or instruction <> 27115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8331 {
// T4RUPT_PROGRAM.agc:295
//NXTIFBIT	INCR	RUPTREG1	# ADVANCE BIT POSITION NUMBER.
// slot 8331
                if slot <> 8331 or instruction <> 10296 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 56).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:296
// +1		DOUBLE
// slot 8332
                if slot <> 8332 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8334 {
            if slot <= 8333 {
// T4RUPT_PROGRAM.agc:297
//		TS	A		# SKIP IF OVERFLOW.
// slot 8333
                if slot <> 8333 or instruction <> 22528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:298
//		TCF	NXTIFBIT	# LOOK FOR BIT.
// slot 8334
                if slot <> 8334 or instruction <> 5259 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5259, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8335 {
// T4RUPT_PROGRAM.agc:299
//
// T4RUPT_PROGRAM.agc:300
//		XCH	RUPTREG2	# SAVE OVERFLOW-CORRECTED DATA.
// slot 8335
                if slot <> 8335 or instruction <> 23609 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 57, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:301
//		INDEX	RUPTREG1	# SELECT NEW VALUE OF THIS BIT.
// slot 8336
                if slot <> 8336 or instruction <> 20536 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20536, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20536, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[478] to agcAotUnit478@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:302
//		CAF	BIT14
// slot 8337
    8337, 29628
)).

// bank 06, slots 8338-8339
function agcAotUnit479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8338 {
// T4RUPT_PROGRAM.agc:303
//		MASK	IMODES30
// slot 8338
        if slot <> 8338 or instruction <> 29378 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 706).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// T4RUPT_PROGRAM.agc:304
//		INDEX	RUPTREG1
// slot 8339
        if slot <> 8339 or instruction <> 20536 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[479] to agcAotUnit479@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:305
//		TC	IFAILJMP
// slot 8340
    8340, 3034
)).

// bank 06, slots 8341-8364
function agcAotUnit480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8352 {
        if slot <= 8346 {
            if slot <= 8343 {
                if slot <= 8341 {
// T4RUPT_PROGRAM.agc:306
//
// T4RUPT_PROGRAM.agc:307
//NXTIFAIL	CCS	RUPTREG2	# PROCESS ANY ADDITIONAL CHANGES.
// slot 8341
                    if slot <> 8341 or instruction <> 4153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 57).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8342 {
// T4RUPT_PROGRAM.agc:308
//		TCF	NXTIFBIT -1
// slot 8342
                        if slot <> 8342 or instruction <> 5258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:309
//
// T4RUPT_PROGRAM.agc:310
//# Page 163
// T4RUPT_PROGRAM.agc:311
//# PROGRAM NAME:  TNONTEST.
// T4RUPT_PROGRAM.agc:312
//
// T4RUPT_PROGRAM.agc:313
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM HONORS REQUESTS FOR ISS INITIALIZATION.  ISS TURN-ON (CHANNEL 30 BIT 14)
// T4RUPT_PROGRAM.agc:314
//# AND ISS OPERATE (CHANNEL 30 BIT 9) REQUESTS ARE TREATED AS A PAIR AND PROCESSING TAKES PLACE .480 SECONDS
// T4RUPT_PROGRAM.agc:315
//# AFTER EITHER ONE APPEARS.  THIS INITIALIZATION TAKES ON ONE OF THE FOLLOWING THREE FORMS:
// T4RUPT_PROGRAM.agc:316
//
// T4RUPT_PROGRAM.agc:317
//#	1) ISS TURN-ON:  IN THIS SITUATION THE COMPUTER IS OPERATING WHEN THE ISS IS TURNED ON.  NOMINALLY,
// T4RUPT_PROGRAM.agc:318
//#	BOTH ISS TURN-ON AND ISS OPERATE APPEAR.  THE PLATFORM IS CAGED FOR 90 SECONDS AND THE ICDU'S ZEROED
// T4RUPT_PROGRAM.agc:319
//#	SO THAT AT THE END OF THE PROCESS THE GIMBAL LOCK MONITOR WILL FUNCTION PROPERLY.
// T4RUPT_PROGRAM.agc:320
//
// T4RUPT_PROGRAM.agc:321
//#	2) ICDU INITIALIZATION:  IN THIS CASE THE COMPUTER WAS PROBABLY TURNED ON WITH THE ISS IN OPERATE OR
// T4RUPT_PROGRAM.agc:322
//#	A FRESH START WAS DONE WIT THE ISS IN OPERATE.  IN THIS CASE ONLY ISS OPERATE IS ON.  THE ICDU'S ARE
// T4RUPT_PROGRAM.agc:323
//#	ZEROED SO THE GIMBAL LOCK MONITOR WILL FUNCTION.  AN EXCEPTION IS IF THE ISS IS IN GIMBAL LOCK AFTER
// T4RUPT_PROGRAM.agc:324
//#	A RESTART, THE ICDU'S WILL NOT BE ZEROED.
// T4RUPT_PROGRAM.agc:325
//
// T4RUPT_PROGRAM.agc:326
//#	3) RESTART WITH RESTARTABLE PROGRAM USING THE IMU:  IN THIS CASE, NO INITIALIZATION TAKES PLACE SINCE
// T4RUPT_PROGRAM.agc:327
//#	IT IS ASSUMED THT THE USING PROGRAM DID THE INITIALIZATION AND THEREFORE T4RUPT SHOULD NOT INTERFERE.
// T4RUPT_PROGRAM.agc:328
//
// T4RUPT_PROGRAM.agc:329
//# IMODES30 BIT 7 IS SET = 1 BY THE FIRST BIT (CHANNEL 30 BIT 14 OR 9) WHICH ARRIVES.  FOLLOWING THIS, TNONTEST IS
// T4RUPT_PROGRAM.agc:330
//# ENTERED, FINDS BIT 7 = 1 BUT BIT 8 = 0, SO IT SETS BIT 8 = 1 AND EXITS.  THE NEXT TIME IT FINDS BIT 8 = 1 AND
// T4RUPT_PROGRAM.agc:331
//# PROCEEDS, SETTING BITS 8 AND 7 = 0.  AT PROCTNON, IF ISS TURN-ON REQUEST IS PRESENT, THE ISS IS CAGED (ZERO +
// T4RUPT_PROGRAM.agc:332
//# COARSE).  IF ISS OPERATE IS NOT PRESENT PROGRAM ALARM 00213 IS ISSUED.  AT THE END OF A 90 SECOND CAGE, BIT 2
// T4RUPT_PROGRAM.agc:333
//# OF IMODES30 IS TESTED.  IF IT IS = 1, ISS TURN-ON WAS NOT PRESENT FOR THE ENTIRE 90 SECONDS.  IN THAT CASE, IF
// T4RUPT_PROGRAM.agc:334
//# THE ISS TURN-ON REQUEST IS PRESENT TEH 90 SECOD WAIT IS REPEATED.  OTHERWISE NO ACTION OCURS UNLESS A PROGRAM
// T4RUPT_PROGRAM.agc:335
//# WAS WAITING FOR THE INITIALIZATION IN WHIC CASE TH PROGRAM IS GIVEN AN IMUSTALL ERROR RETURN.  IF THE DELAY
// T4RUPT_PROGRAM.agc:336
//# WENT PROPERLY, THE ISS DELAY OUTBIT IS SENT AND THE ICDU'S ZEROED.  A TASK IS INITIATED TO REMOVE THE PIPA FAIL
// T4RUPT_PROGRAM.agc:337
//# INHIBIT BIT IN 10.24 SECONDS.  IF A MISSION PROGRAM WAS WAITING IT IS INFORMED VIA ENDIMU.
// T4RUPT_PROGRAM.agc:338
//
// T4RUPT_PROGRAM.agc:339
//# AT PROCTNON, IF ONLY ISS OPERATE IS PRESENT (OPONLY), THE CDU'S ARE ZEROED UNLESS THE PLATFORM IS IN COARSE
// T4RUPT_PROGRAM.agc:340
//# ALIGN (= GIMBAL LOCK HERE) OR A MISSIN PROGRAM IS USING THE IMU (INUSEFLG = 1).
// T4RUPT_PROGRAM.agc:341
//
// T4RUPT_PROGRAM.agc:342
//# CALLING SEQUENCE:  T4RUPT EVERY 480 MILLISECONDS AFTER IMUMON.
// T4RUPT_PROGRAM.agc:343
//
// T4RUPT_PROGRAM.agc:344
//# JOBS OR TASKS INITIATED:  1) ENDTNON, 90 SECONDS AFER CAGING STARTED.  2) ISSUP, 4 SECONDS AFTER CAGING DONE.
// T4RUPT_PROGRAM.agc:345
//#	3) PFAILOK, 10.24 SECONDS AFTER INITIALIZATION COMPLETED.  4) UNZ2, 320 MILLISECONDS AFTER ZEROING
// T4RUPT_PROGRAM.agc:346
//#	STARTED.
// T4RUPT_PROGRAM.agc:347
//
// T4RUPT_PROGRAM.agc:348
//# SUBROUTINES CALLED: CAGESUB, CAGESUB2, ZEROICDU, ENDIMU, IMUBAD, NOATTOFF, SETISSW, VARDELAY.
// T4RUPT_PROGRAM.agc:349
//
// T4RUPT_PROGRAM.agc:350
//# ERASABLE INITIALIZATION:  SEE IMUMON.
// T4RUPT_PROGRAM.agc:351
//
// T4RUPT_PROGRAM.agc:352
//# ALARMS:  PROGRAM ALARM 00213 IF ISS TURN-ON REQUESTED WITHOUT ISS OPERATE.
// T4RUPT_PROGRAM.agc:353
//
// T4RUPT_PROGRAM.agc:354
//# EXIT:  ENDTNON EXITS TO C33TEST.  TASKS HAVING TO DO WITH INITIALIZATION EXIT AS FOLLOWS:  MISSION PROGRAM
// T4RUPT_PROGRAM.agc:355
//# WAITING AND INITIALIZATION COMPLETE, EXIT TO ENDIMU, MISSION PROGRAM WAITING AND INITIALIZATION FAILED, EXIT TO
// T4RUPT_PROGRAM.agc:356
//# IMUBAD, IMU NOT IN USE, EXIT TO TASKOVER.
// T4RUPT_PROGRAM.agc:357
//
// T4RUPT_PROGRAM.agc:358
//# OUTPUT:  ISS INITIALIZED.
// T4RUPT_PROGRAM.agc:359
//
// T4RUPT_PROGRAM.agc:360
//TNONTEST	CS	IMODES30	# AFTER PROCESSING ALL CHANGES, SEE IF IT
// slot 8343
                        if slot <> 8343 or instruction <> 17090 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 706).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8344 {
// T4RUPT_PROGRAM.agc:361
//# Page 164
// T4RUPT_PROGRAM.agc:362
//		MASK	BIT7		# IS TIME TO ACT ON A TURN-ON SEQUENCE.
// slot 8344
                    if slot <> 8344 or instruction <> 31205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8345 {
// T4RUPT_PROGRAM.agc:363
//		CCS	A
// slot 8345
                        if slot <> 8345 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:364
//		TCF	C33TEST		# NO -- EXAMINE CHANNEL 33.
// slot 8346
                        if slot <> 8346 or instruction <> 5372 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5372, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8349 {
                if slot <= 8347 {
// T4RUPT_PROGRAM.agc:365
//
// T4RUPT_PROGRAM.agc:366
//		CAF	BIT8		# SEE IF FIRST SAMPLE OR SECOND.
// slot 8347
                    if slot <> 8347 or instruction <> 14820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8348 {
// T4RUPT_PROGRAM.agc:367
//		MASK	IMODES30
// slot 8348
                        if slot <> 8348 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:368
//		CCS	A
// slot 8349
                        if slot <> 8349 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8350 {
// T4RUPT_PROGRAM.agc:369
//		TCF	PROCTNON	# REACT AFTER A SECOND SAMPLE.
// slot 8350
                    if slot <> 8350 or instruction <> 5282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8351 {
// T4RUPT_PROGRAM.agc:370
//
// T4RUPT_PROGRAM.agc:371
//		CAF	BIT8		# IF FIRST SAMPLE, SET BIT TO REACT NEXT
// slot 8351
                        if slot <> 8351 or instruction <> 14820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:372
//		ADS	IMODES30	# TIME.
// slot 8352
                        if slot <> 8352 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8358 {
            if slot <= 8355 {
                if slot <= 8353 {
// T4RUPT_PROGRAM.agc:373
//		TCF	C33TEST
// slot 8353
                    if slot <> 8353 or instruction <> 5372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8354 {
// T4RUPT_PROGRAM.agc:374
//
// T4RUPT_PROGRAM.agc:375
//		# PROCESS IMU TURN-ON REQUESTS AFTER WAITING 1 SAMPLE FOR ALL SIGNALS TO ARRIVE.
// T4RUPT_PROGRAM.agc:376
//
// T4RUPT_PROGRAM.agc:377
//PROCTNON	CS	BITS7&8
// slot 8354
                        if slot <> 8354 or instruction <> 17919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:378
//		MASK	IMODES30
// slot 8355
                        if slot <> 8355 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8356 {
// T4RUPT_PROGRAM.agc:379
//		TS	IMODES30
// slot 8356
                    if slot <> 8356 or instruction <> 23234 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23234, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8357 {
// T4RUPT_PROGRAM.agc:380
//		MASK	BIT14		# SEE IF TURN-ON REQUEST.
// slot 8357
                        if slot <> 8357 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            if fixedOperand = 8192 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:381
//		CCS	A
// slot 8358
                        if slot <> 8358 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8361 {
                if slot <= 8359 {
// T4RUPT_PROGRAM.agc:382
//		TCF	OPONLY		# OPERATE ON ONLY.
// slot 8359
                    if slot <> 8359 or instruction <> 5351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5351, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8360 {
// T4RUPT_PROGRAM.agc:383
//
// T4RUPT_PROGRAM.agc:384
//		CS	IMODES30	# IF TURN-ON REQUEST, WE SHOUD HAVE IMU
// slot 8360
                        if slot <> 8360 or instruction <> 17090 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 706).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:385
//		MASK	BIT9		# OPERATE.
// slot 8361
                        if slot <> 8361 or instruction <> 31203 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            if fixedOperand = 256 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8362 {
// T4RUPT_PROGRAM.agc:386
//		CCS	A
// slot 8362
                    if slot <> 8362 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8363 {
// T4RUPT_PROGRAM.agc:387
//		TCF	+3
// slot 8363
                        if slot <> 8363 or instruction <> 5294 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5294, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:388
//
// T4RUPT_PROGRAM.agc:389
//		TC	ALARM		# ALARM IF NOT
// slot 8364
                        if slot <> 8364 or instruction <> 2935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[480] to agcAotUnit480@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:390
//		OCT	213
// slot 8365
    8365, 278
)).

// bank 06, slots 8366-8368
function agcAotUnit481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8366 {
// T4RUPT_PROGRAM.agc:391
//
// T4RUPT_PROGRAM.agc:392
// +3		TC	CAGESUB
// slot 8366
        if slot <> 8366 or instruction <> 1501 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1501, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8367 {
// T4RUPT_PROGRAM.agc:393
//		CAF	90SECS
// slot 8367
            if slot <> 8367 or instruction <> 13829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:394
//		TC	WAITLIST
// slot 8368
            if slot <> 8368 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[481] to agcAotUnit481@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:395
//		EBANK=	M11
// T4RUPT_PROGRAM.agc:396
//		2CADR	ENDTNON
// slot 8369 8370
    8369, 2412, 8370, 12428
)).

// bank 06, slots 8371-8388
function agcAotUnit482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8379 {
        if slot <= 8374 {
            if slot <= 8372 {
                if slot <= 8371 {
// T4RUPT_PROGRAM.agc:397
//
// T4RUPT_PROGRAM.agc:398
//		TCF	C33TEST
// slot 8371
                    if slot <> 8371 or instruction <> 5372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:399
//
// T4RUPT_PROGRAM.agc:400
//RETNON		CAF	90SECS
// slot 8372
                    if slot <> 8372 or instruction <> 13829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8373 {
// T4RUPT_PROGRAM.agc:401
//		TC	VARDELAY
// slot 8373
                    if slot <> 8373 or instruction <> 2708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2708, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:402
//
// T4RUPT_PROGRAM.agc:403
//ENDTNON		CS	BIT2		# RESET TURN-ON REQUEST FAIL BIT.
// slot 8374
                    if slot <> 8374 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8376 {
                if slot <= 8375 {
// T4RUPT_PROGRAM.agc:404
//		MASK	IMODES30
// slot 8375
                    if slot <> 8375 or instruction <> 29378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:405
//		XCH	IMODES30
// slot 8376
                    if slot <> 8376 or instruction <> 24258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 706, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8377 {
// T4RUPT_PROGRAM.agc:406
//		MASK	BIT2		# IF IT WAS OFF, SEND ISS DELAY COMPLETE.
// slot 8377
                    if slot <> 8377 or instruction <> 31210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8378 {
// T4RUPT_PROGRAM.agc:407
//		EXTEND
// slot 8378
                        if slot <> 8378 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:408
//		BZF	ENDTNON2
// slot 8379
                        if slot <> 8379 or instruction <> 5318 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5318, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8383 {
            if slot <= 8381 {
                if slot <= 8380 {
// T4RUPT_PROGRAM.agc:409
//
// T4RUPT_PROGRAM.agc:410
//		CAF	BIT14		# IF IT WAS ON AND TURN-ON REQUEST NOW.
// slot 8380
                    if slot <> 8380 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:411
//# Page 165
// T4RUPT_PROGRAM.agc:412
//		MASK	IMODES30	# PRESENT, RE-ENTER 90 SEC DELAY IN WL.
// slot 8381
                    if slot <> 8381 or instruction <> 29378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8382 {
// T4RUPT_PROGRAM.agc:413
//		EXTEND
// slot 8382
                    if slot <> 8382 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:414
//		BZF	RETNON
// slot 8383
                    if slot <> 8383 or instruction <> 5300 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5300, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8385 {
                if slot <= 8384 {
// T4RUPT_PROGRAM.agc:415
//
// T4RUPT_PROGRAM.agc:416
//		CS	FLAGWRD0	# IF IT IS NOT ON NOW, SEE IF A PROG WAS
// slot 8384
                    if slot <> 8384 or instruction <> 16444 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 60).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:417
//		MASK	IMUSEBIT	# WAITING.
// slot 8385
                    if slot <> 8385 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        if fixedOperand = 128 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8386 {
// T4RUPT_PROGRAM.agc:418
//		CCS	A
// slot 8386
                    if slot <> 8386 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8387 {
// T4RUPT_PROGRAM.agc:419
//		TCF	TASKOVER
// slot 8387
                        if slot <> 8387 or instruction <> 6833 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6833, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:420
//		TC	POSTJUMP
// slot 8388
                        if slot <> 8388 or instruction <> 2461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[482] to agcAotUnit482@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:421
//		CADR	IMUBAD		# UNSUCCESSFUL TURN-ON.
// slot 8389
    8389, 16190
)).

// bank 06, slots 8390-8393
function agcAotUnit483 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8391 {
        if slot <= 8390 {
// T4RUPT_PROGRAM.agc:422
//
// T4RUPT_PROGRAM.agc:423
//ENDTNON2	CAF	BIT15		# SEND ISS DELAY COMPLETE.
// slot 8390
            if slot <> 8390 or instruction <> 14813 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:424
//		EXTEND
// slot 8391
            if slot <> 8391 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8392 {
// T4RUPT_PROGRAM.agc:425
//		WOR	CHAN12
// slot 8392
            if slot <> 8392 or instruction <> 2570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:426
//
// T4RUPT_PROGRAM.agc:427
//		TC 	IBNKCALL	# TURN OFF NO ATT LAMP.
// slot 8393
            if slot <> 8393 or instruction <> 2492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[483] to agcAotUnit483@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:428
//		CADR	NOATTOFF
// slot 8394
    8394, 15724
)).

// bank 06, slots 8395-8419
function agcAotUnit484 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8406 {
        if slot <= 8400 {
            if slot <= 8397 {
                if slot <= 8395 {
// T4RUPT_PROGRAM.agc:429
//
// T4RUPT_PROGRAM.agc:430
//UNZ2		TC	ZEROICDU
// slot 8395
                    if slot <> 8395 or instruction <> 2863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8396 {
// T4RUPT_PROGRAM.agc:431
//
// T4RUPT_PROGRAM.agc:432
//		CS	BITS4&5		# REMOVE ZERO AND COARSE.
// slot 8396
                        if slot <> 8396 or instruction <> 18931 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2547), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:433
//		EXTEND
// slot 8397
                        if slot <> 8397 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8398 {
// T4RUPT_PROGRAM.agc:434
//		WAND	CHAN12
// slot 8398
                    if slot <> 8398 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8399 {
// T4RUPT_PROGRAM.agc:435
//
// T4RUPT_PROGRAM.agc:436
//		CAF	BIT11		# WAIT 10 SECS FOR CTRS TO FIND GIMBALS
// slot 8399
                        if slot <> 8399 or instruction <> 14817 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:437
//		TC	VARDELAY
// slot 8400
                        if slot <> 8400 or instruction <> 2708 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2708, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8403 {
                if slot <= 8401 {
// T4RUPT_PROGRAM.agc:438
//
// T4RUPT_PROGRAM.agc:439
//ISSUP		CS	OCT54		# REMOVE CAGING, IMU FAIL INHIBIT BIT, AND
// slot 8401
                    if slot <> 8401 or instruction <> 17916 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1532), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8402 {
// T4RUPT_PROGRAM.agc:440
//		MASK	IMODES30	# ICDUFAIL INHIBIT FLAGS.
// slot 8402
                        if slot <> 8402 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:441
//		TS	IMODES30
// slot 8403
                        if slot <> 8403 or instruction <> 23234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23234, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8404 {
// T4RUPT_PROGRAM.agc:442
//
// T4RUPT_PROGRAM.agc:443
//		CS	BIT6		# ENABLE DAP
// slot 8404
                    if slot <> 8404 or instruction <> 18918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8405 {
// T4RUPT_PROGRAM.agc:444
//		MASK	IMODES33
// slot 8405
                        if slot <> 8405 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:445
//		TS	IMODES33
// slot 8406
                        if slot <> 8406 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8412 {
            if slot <= 8409 {
                if slot <= 8407 {
// T4RUPT_PROGRAM.agc:446
//
// T4RUPT_PROGRAM.agc:447
//		CS	FLAGWRD2	# TEST DRIFTFLG: IF ON DO NOTHING BECAUSE
// slot 8407
                    if slot <> 8407 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8408 {
// T4RUPT_PROGRAM.agc:448
//		MASK	DRFTBIT		# IMUCOMP SHOUD BE ALL SET UP (RESTART
// slot 8408
                        if slot <> 8408 or instruction <> 31197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            if fixedOperand = 16384 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:449
//		EXTEND			# WITH IMUSE DOWN).  IF OFF, SET DRIFTFLG
// slot 8409
                        if slot <> 8409 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8410 {
// T4RUPT_PROGRAM.agc:450
//		BZF	+4		# AND 1/PIPADT TO GET FREEFALL IMUCOMP
// slot 8410
                    if slot <> 8410 or instruction <> 5342 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5342, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8411 {
// T4RUPT_PROGRAM.agc:451
//		ADS	FLAGWRD2	# GOING (FRESH START OR ISS TURN-ON).
// slot 8411
                        if slot <> 8411 or instruction <> 11326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:452
//		CA	TIME1
// slot 8412
                        if slot <> 8412 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8415 {
                if slot <= 8413 {
// T4RUPT_PROGRAM.agc:453
//		XCH	1/PIPADT	# CANNOT GET HERE IF RESTART WITH IMUSE UP
// slot 8413
                    if slot <> 8413 or instruction <> 24125 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 573, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8414 {
// T4RUPT_PROGRAM.agc:454
//
// T4RUPT_PROGRAM.agc:455
//		TC	SETISSW		# ISS WARNING MIGHT HAVE BEEN INHIBITED.
// slot 8414
                        if slot <> 8414 or instruction <> 1475 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1475, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:456
//
// T4RUPT_PROGRAM.agc:457
//		CS	BIT15		# REMOVE IMU DELAY COMPLETE DISCRETE.
// slot 8415
                        if slot <> 8415 or instruction <> 18909 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8417 {
                    if slot <= 8416 {
// T4RUPT_PROGRAM.agc:458
//		EXTEND
// slot 8416
                        if slot <> 8416 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:459
//		WAND	CHAN12
// slot 8417
                        if slot <> 8417 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8418 {
// T4RUPT_PROGRAM.agc:460
//
// T4RUPT_PROGRAM.agc:461
//		CAF	4SECS		# DON'T ENABLE PROG ALARM ON PIP FAIL FOR
// slot 8418
                        if slot <> 8418 or instruction <> 14851 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:462
//# Page 166
// T4RUPT_PROGRAM.agc:463
//		TC	WAITLIST	# ANOTHER 4 SECS.
// slot 8419
                        if slot <> 8419 or instruction <> 2691 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2691, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[484] to agcAotUnit484@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:464
//		EBANK=	CDUIND
// T4RUPT_PROGRAM.agc:465
//		2CADR	PFAILOK
// slot 8420 8421
    8420, 3416, 8421, 14470
)).

// bank 06, slots 8422-8433
function agcAotUnit485 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8427 {
        if slot <= 8424 {
            if slot <= 8422 {
// T4RUPT_PROGRAM.agc:466
//
// T4RUPT_PROGRAM.agc:467
//		TCF	TASKOVER
// slot 8422
                if slot <> 8422 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8423 {
// T4RUPT_PROGRAM.agc:468
//
// T4RUPT_PROGRAM.agc:469
//OPONLY		CAF	BIT4		# IF OPERATE ON ONLY, AND WE ARE IN COARSE
// slot 8423
                    if slot <> 8423 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:470
//		EXTEND			# ALIGN, DON'T ZERO THE CDUS BECAUSE WE
// slot 8424
                    if slot <> 8424 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8425 {
// T4RUPT_PROGRAM.agc:471
//		RAND	CHAN12		# MIGHT BE IN GIMBAL LOCK.
// slot 8425
                if slot <> 8425 or instruction <> 1034 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8426 {
// T4RUPT_PROGRAM.agc:472
//		CCS	A
// slot 8426
                    if slot <> 8426 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:473
//		TCF	C33TEST
// slot 8427
                    if slot <> 8427 or instruction <> 5372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8430 {
            if slot <= 8428 {
// T4RUPT_PROGRAM.agc:474
//
// T4RUPT_PROGRAM.agc:475
//		CAF	IMUSEBIT	# OTHERWISE, ZERO THE COUNTERS.
// slot 8428
                if slot <> 8428 or instruction <> 14820 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8429 {
// T4RUPT_PROGRAM.agc:476
//		MASK	FLAGWRD0	# UNLESS SOMEONE IS USING TH IMU.
// slot 8429
                    if slot <> 8429 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:477
//		CCS	A
// slot 8430
                    if slot <> 8430 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8431 {
// T4RUPT_PROGRAM.agc:478
//		TCF	C33TEST
// slot 8431
                if slot <> 8431 or instruction <> 5372 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5372, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8432 {
// T4RUPT_PROGRAM.agc:479
//
// T4RUPT_PROGRAM.agc:480
//		TC	CAGESUB2	# SET TURNON FLAGS.
// slot 8432
                    if slot <> 8432 or instruction <> 1510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1510, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:481
//
// T4RUPT_PROGRAM.agc:482
//ISSZERO		TC	IBNKCALL	# TURN OFF NO ATT LAMP.
// slot 8433
                    if slot <> 8433 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[485] to agcAotUnit485@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:483
//		CADR	NOATTOFF	# IMU CAGE OFF ENTRY.
// slot 8434
    8434, 15724
)).

// bank 06, slots 8435-8440
function agcAotUnit486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8437 {
        if slot <= 8435 {
// T4RUPT_PROGRAM.agc:484
//
// T4RUPT_PROGRAM.agc:485
//		CAF	BIT5		# ISS CDU ZERO
// slot 8435
            if slot <> 8435 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8436 {
// T4RUPT_PROGRAM.agc:486
//		EXTEND
// slot 8436
                if slot <> 8436 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:487
//		WOR	CHAN12
// slot 8437
                if slot <> 8437 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8438 {
// T4RUPT_PROGRAM.agc:488
//
// T4RUPT_PROGRAM.agc:489
//		TC	ZEROICDU
// slot 8438
            if slot <> 8438 or instruction <> 2863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2863, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8439 {
// T4RUPT_PROGRAM.agc:490
//		CAF	BIT6		# WAIT 300 MS. FOR AGS TO RECEIVE SIGNAL.
// slot 8439
                if slot <> 8439 or instruction <> 14822 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:491
//		TC	WAITLIST
// slot 8440
                if slot <> 8440 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[486] to agcAotUnit486@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:492
//		EBANK=	M11
// T4RUPT_PROGRAM.agc:493
//		2CADR	UNZ2
// slot 8441 8442
    8441, 2454, 8442, 12428
)).

// bank 06, slots 8443-8469
function agcAotUnit487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8455 {
        if slot <= 8448 {
            if slot <= 8445 {
                if slot <= 8443 {
// T4RUPT_PROGRAM.agc:494
//
// T4RUPT_PROGRAM.agc:495
//		TCF	C33TEST
// slot 8443
                    if slot <> 8443 or instruction <> 5372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8444 {
// T4RUPT_PROGRAM.agc:496
//
// T4RUPT_PROGRAM.agc:497
//# Page 167
// T4RUPT_PROGRAM.agc:498
//# PROGRAM NAME:  C33TEST
// T4RUPT_PROGRAM.agc:499
//#
// T4RUPT_PROGRAM.agc:500
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THREE FLIP-FLOP INBITS OF CHANNEL 33 AND CALLS THE APPROPRIATE
// T4RUPT_PROGRAM.agc:501
//# SUBROUTINE TO PROCESS A CHANGE.  IT IS ANALOGOUS TO IMUMON, WHICH MONITORS CHANNEL 30, EXCEPT THAT IT READS
// T4RUPT_PROGRAM.agc:502
//# CHANNEL 33 WITH A WAND INSTRUCTION BECAUSE A `WRITE' PULSE IS REQUIRED TO RESET THE FLIP-FLOPS.  THE BITS
// T4RUPT_PROGRAM.agc:503
//# PROCESSED AND THE SUBROUTINES CALLED ARE:
// T4RUPT_PROGRAM.agc:504
//#	BIT	FUNCTION		SUBROUTINE
// T4RUPT_PROGRAM.agc:505
//#	---	--------		----------
// T4RUPT_PROGRAM.agc:506
//#	 13	PIPA FAIL		PIPFAIL
// T4RUPT_PROGRAM.agc:507
//#	 12	DOWNLINK TOO FAST	DNTMFAST
// T4RUPT_PROGRAM.agc:508
//#	 11	UPLINK TOO FAST		UPTMFAST
// T4RUPT_PROGRAM.agc:509
//#
// T4RUPT_PROGRAM.agc:510
//# UPON ENTRY TO THE SUBROUTINE, THE NEW BIT STATE IS IN A.
// T4RUPT_PROGRAM.agc:511
//#
// T4RUPT_PROGRAM.agc:512
//# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER TNONTEST.
// T4RUPT_PROGRAM.agc:513
//#
// T4RUPT_PROGRAM.agc:514
//# JOBS OR TASKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:515
//#
// T4RUPT_PROGRAM.agc:516
//# SUBROUTINES CALLED:  PIPFAIL, DNTMFAST AND UPTMFAST ON BIT CHANGES.
// T4RUPT_PROGRAM.agc:517
//#
// T4RUPT_PROGRAM.agc:518
//# ERASABLE INITIALIZATION:  C(IMODES33) = OCT 16000 ON A FRESH START OR RESTART, THEREFORE, THESE ALARMS WILL
// T4RUPT_PROGRAM.agc:519
//# REAPPEAR IF THE CONDITIONS PERSIST.
// T4RUPT_PROGRAM.agc:520
//#
// T4RUPT_PROGRAM.agc:521
//# ALARMS:  NONE.
// T4RUPT_PROGRAM.agc:522
//#
// T4RUPT_PROGRAM.agc:523
//# EXIT:  GLOCKMON.
// T4RUPT_PROGRAM.agc:524
//#
// T4RUPT_PROGRAM.agc:525
//# OUTPUT:  UPDATED BITS 13, 12, AND 11 OF IMODES33 WITH CHANGES PROCESSED.
// T4RUPT_PROGRAM.agc:526
//
// T4RUPT_PROGRAM.agc:527
//C33TEST		CA	IMODES33		# SEE IF RELEVANT CHAN33 BITS HAVE
// slot 8444
                        if slot <> 8444 or instruction <> 12995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:528
//		MASK	33RDMSK
// slot 8445
                        if slot <> 8445 or instruction <> 31254 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                            if fixedOperand = 7168 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 8) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8446 {
// T4RUPT_PROGRAM.agc:529
//		TS	L			# CHANGED.
// slot 8446
                    if slot <> 8446 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8447 {
// T4RUPT_PROGRAM.agc:530
//		CAF	33RDMSK
// slot 8447
                        if slot <> 8447 or instruction <> 14870 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:531
//		EXTEND
// slot 8448
                        if slot <> 8448 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8451 {
                if slot <= 8449 {
// T4RUPT_PROGRAM.agc:532
//		WAND	CHAN33			# RESETS FLIP-FLOP INPUTS
// slot 8449
                    if slot <> 8449 or instruction <> 1563 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8450 {
// T4RUPT_PROGRAM.agc:533
//		EXTEND
// slot 8450
                        if slot <> 8450 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:534
//		RXOR	LCHAN
// slot 8451
                        if slot <> 8451 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8453 {
                    if slot <= 8452 {
// T4RUPT_PROGRAM.agc:535
//		EXTEND
// slot 8452
                        if slot <> 8452 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:536
//		BZF	GLOCKMON		# ON NO CHANGE.
// slot 8453
                        if slot <> 8453 or instruction <> 5404 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5404, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8454 {
// T4RUPT_PROGRAM.agc:537
//
// T4RUPT_PROGRAM.agc:538
//		TS	RUPTREG1		# SAVE BITS WHICH HAVE CHANGED.
// slot 8454
                        if slot <> 8454 or instruction <> 22584 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22584, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:539
//		LXCH	IMODES33
// slot 8455
                        if slot <> 8455 or instruction <> 9923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 707, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8462 {
            if slot <= 8458 {
                if slot <= 8456 {
// T4RUPT_PROGRAM.agc:540
//		EXTEND
// slot 8456
                    if slot <> 8456 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8457 {
// T4RUPT_PROGRAM.agc:541
//		RXOR	LCHAN
// slot 8457
                        if slot <> 8457 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:542
//		TS	IMODES33		# UPDATED IMODES33.
// slot 8458
                        if slot <> 8458 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8460 {
                    if slot <= 8459 {
// T4RUPT_PROGRAM.agc:543
//
// T4RUPT_PROGRAM.agc:544
//		CAF	ZERO
// slot 8459
                        if slot <> 8459 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:545
//		XCH	RUPTREG1
// slot 8460
                        if slot <> 8460 or instruction <> 23608 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 56, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8461 {
// T4RUPT_PROGRAM.agc:546
//		DOUBLE
// slot 8461
                        if slot <> 8461 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:547
//# Page 168
// T4RUPT_PROGRAM.agc:548
//		TCF	NXTIBT +1		# SCAN FOR BIT CHANGES.
// slot 8462
                        if slot <> 8462 or instruction <> 5393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5393, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8465 {
                if slot <= 8463 {
// T4RUPT_PROGRAM.agc:549
//
// T4RUPT_PROGRAM.agc:550
// -1		AD	ONE
// slot 8463
                    if slot <> 8463 or instruction <> 27115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8464 {
// T4RUPT_PROGRAM.agc:551
//NXTIBT		INCR	RUPTREG1
// slot 8464
                        if slot <> 8464 or instruction <> 10296 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:552
// +1		DOUBLE
// slot 8465
                        if slot <> 8465 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8467 {
                    if slot <= 8466 {
// T4RUPT_PROGRAM.agc:553
//		TS	A			# (CODING IDENTICAL TO CHAN 30).
// slot 8466
                        if slot <> 8466 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:554
//		TCF	NXTIBT
// slot 8467
                        if slot <> 8467 or instruction <> 5392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5392, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8468 {
// T4RUPT_PROGRAM.agc:555
//
// T4RUPT_PROGRAM.agc:556
//		XCH	RUPTREG2
// slot 8468
                        if slot <> 8468 or instruction <> 23609 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 57, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:557
//		INDEX	RUPTREG1		# GET NEW VALUE OF BIT WHICH CHANGED.
// slot 8469
                        if slot <> 8469 or instruction <> 20536 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20536, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20536, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[487] to agcAotUnit487@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:558
//		CAF	BIT13
// slot 8470
    8470, 29630
)).

// bank 06, slots 8471-8472
function agcAotUnit488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8471 {
// T4RUPT_PROGRAM.agc:559
//		MASK	IMODES33
// slot 8471
        if slot <> 8471 or instruction <> 29379 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 707).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// T4RUPT_PROGRAM.agc:560
//		INDEX	RUPTREG1
// slot 8472
        if slot <> 8472 or instruction <> 20536 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20536, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[488] to agcAotUnit488@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:561
//		TC	C33JMP
// slot 8473
    8473, 3046
)).

// bank 06, slots 8474-8492
function agcAotUnit489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8482 {
        if slot <= 8477 {
            if slot <= 8475 {
                if slot <= 8474 {
// T4RUPT_PROGRAM.agc:562
//NXTFL33		CCS	RUPTREG2		# PROCESS POSSIBLE ADDITIONAL CHANGES.
// slot 8474
                    if slot <> 8474 or instruction <> 4153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 57).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:563
//		TCF	NXTIBT -1
// slot 8475
                    if slot <> 8475 or instruction <> 5391 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5391, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8476 {
// T4RUPT_PROGRAM.agc:564
//
// T4RUPT_PROGRAM.agc:565
//# Page 169
// T4RUPT_PROGRAM.agc:566
//# PROGRAM NAME:  GLOCKMON
// T4RUPT_PROGRAM.agc:567
//#
// T4RUPT_PROGRAM.agc:568
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MONITORS THE CDUZ COUNTER TO DETERMINE WHETHER THE ISS IS IN GIMBAL LOCK
// T4RUPT_PROGRAM.agc:569
//# AND TAKES ACTION IF IT IS.  THREE REGIONS OF MIDDLE GIMBAL ANGLE (MGA) ARE USED:
// T4RUPT_PROGRAM.agc:570
//#
// T4RUPT_PROGRAM.agc:571
//#	1) ABS(MGA) LESS THAN OR EQUAL TO 70 DEGREES -- NORMAL MODE.
// T4RUPT_PROGRAM.agc:572
//#	2) ABS(MGA) GREATER THAN 70 DEGREES AND LESS THAN OR EQUAL TO 85 DEGREES -- GIMBAL LOCK LAMP TURNED ON.
// T4RUPT_PROGRAM.agc:573
//#	3) ABS(MGA) GREATER THAN 85 DEGREES -- ISS PUT IN COARSE ALIGN AND NO ATT LAMP TURNED ON.
// T4RUPT_PROGRAM.agc:574
//#
// T4RUPT_PROGRAM.agc:575
//# CALLING SEQUENCE:  EVERY 480 MILLISECONDS AFTER C33TEST.
// T4RUPT_PROGRAM.agc:576
//#
// T4RUPT_PROGRAM.agc:577
//# JOBS OR TASKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:578
//#
// T4RUPT_PROGRAM.agc:579
//# SUBROUTINES CALLED:	1) SETCOARS WHEN ABS(MGA) GREATER THEN 85 DEGREES AND ISS NOT IN COARSE ALIGN.
// T4RUPT_PROGRAM.agc:580
//#			2) LAMPTEST BEFORE TURNING OFF GIMBAL LOCK LAMP.
// T4RUPT_PROGRAM.agc:581
//#
// T4RUPT_PROGRAM.agc:582
//# ERASABLE INITIALIZATION:
// T4RUPT_PROGRAM.agc:583
//#		1) FRESH START OR RESTART WITH NO GROUPS ACTIVE:  C(CDUZ) = 0, IMODES30 BIT 6 = 0, IMODES33 BIT 1 =  0.
// T4RUPT_PROGRAM.agc:584
//#		2) RESTART WTIH GROUPS ACTIVE:	SAME AS FRESH START EXCEPT C(CDUZ) NOT CHANGED SO GIMBAL MONITOR
// T4RUPT_PROGRAM.agc:585
//#						PROCEEDS AS BEFORE.
// T4RUPT_PROGRAM.agc:586
//#
// T4RUPT_PROGRAM.agc:587
//# ALARMS:	1) MGA REGION (2) CAUSES GIMBAL LOCK LAMP TO BE LIT.
// T4RUPT_PROGRAM.agc:588
//#		2) MGA REGION (3) CAUSES THE ISS TO BE PUT IN COARSE ALIGN AND THE NO ATT LAMP TO BE LIT IF EITHER NOT
// T4RUPT_PROGRAM.agc:589
//#		   SO ALREADY.
// T4RUPT_PROGRAM.agc:590
//
// T4RUPT_PROGRAM.agc:591
//GLOCKMON	CCS	CDUZ
// slot 8476
                    if slot <> 8476 or instruction <> 4124 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:592
//		TCF	GLOCKCHK		# SEE IF MAGNITUDE OF MGA IS GREATER THAN
// slot 8477
                    if slot <> 8477 or instruction <> 5409 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5409, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8479 {
                if slot <= 8478 {
// T4RUPT_PROGRAM.agc:593
//		TCF	SETGLOCK		# 70 DEGREES.
// slot 8478
                    if slot <> 8478 or instruction <> 5429 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5429, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:594
//		TCF	GLOCKCHK
// slot 8479
                    if slot <> 8479 or instruction <> 5409 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5409, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8480 {
// T4RUPT_PROGRAM.agc:595
//		TCF	SETGLOCK
// slot 8480
                    if slot <> 8480 or instruction <> 5429 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5429, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8481 {
// T4RUPT_PROGRAM.agc:596
//
// T4RUPT_PROGRAM.agc:597
//GLOCKCHK	AD	-70DEGS
// slot 8481
                        if slot <> 8481 or instruction <> 25930 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1354), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:598
//		EXTEND
// slot 8482
                        if slot <> 8482 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8487 {
            if slot <= 8484 {
                if slot <= 8483 {
// T4RUPT_PROGRAM.agc:599
//		BZMF	SETGLOCK -1		# NO LOCK.
// slot 8483
                    if slot <> 8483 or instruction <> 25908 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:600
//
// T4RUPT_PROGRAM.agc:601
//		AD	-15DEGS			# SEE IF ABS(MGA) GREATER THAN 85 DEGREES
// slot 8484
                    if slot <> 8484 or instruction <> 25931 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1355), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8485 {
// T4RUPT_PROGRAM.agc:602
//		EXTEND
// slot 8485
                    if slot <> 8485 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8486 {
// T4RUPT_PROGRAM.agc:603
//		BZMF	NOGIMRUN
// slot 8486
                        if slot <> 8486 or instruction <> 25906 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25906, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:604
//
// T4RUPT_PROGRAM.agc:605
//		CAF	BIT4			# IF SO, SYSTEM SHOULD BE IN COARSE ALIGN
// slot 8487
                        if slot <> 8487 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8489 {
                if slot <= 8488 {
// T4RUPT_PROGRAM.agc:606
//		EXTEND				# TO PREVENT GIMBAL RUNAWAY.
// slot 8488
                    if slot <> 8488 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:607
//		RAND	CHAN12
// slot 8489
                    if slot <> 8489 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8490 {
// T4RUPT_PROGRAM.agc:608
//		CCS	A
// slot 8490
                    if slot <> 8490 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8491 {
// T4RUPT_PROGRAM.agc:609
//		TCF	NOGIMRUN
// slot 8491
                        if slot <> 8491 or instruction <> 5426 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5426, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:610
//
// T4RUPT_PROGRAM.agc:611
//		TC	IBNKCALL
// slot 8492
                        if slot <> 8492 or instruction <> 2492 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2492, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[489] to agcAotUnit489@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:612
//		CADR	SETCOARS
// slot 8493
    8493, 15560
)).

// bank 06, slots 8494-8495
function agcAotUnit490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8494 {
// T4RUPT_PROGRAM.agc:613
//
// T4RUPT_PROGRAM.agc:614
//		CAF	SIX			# ENABLE ISS ERROR COUNTERS IN 60 MS.
// slot 8494
        if slot <> 8494 or instruction <> 15522 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// T4RUPT_PROGRAM.agc:615
//		TC	WAITLIST
// slot 8495
        if slot <> 8495 or instruction <> 2691 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2691, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[490] to agcAotUnit490@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:616
//# Page 170
// T4RUPT_PROGRAM.agc:617
//		EBANK=	CDUIND
// T4RUPT_PROGRAM.agc:618
//		2CADR	CA+ECE
// slot 8496 8497
    8496, 3264, 8497, 14470
)).

// bank 06, slots 8498-8521
function agcAotUnit491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8509 {
        if slot <= 8503 {
            if slot <= 8500 {
                if slot <= 8498 {
// T4RUPT_PROGRAM.agc:619
//
// T4RUPT_PROGRAM.agc:620
//NOGIMRUN	CAF	BIT6			# TURN ON GIMBAL LOCK LAMP.
// slot 8498
                    if slot <> 8498 or instruction <> 14822 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8499 {
// T4RUPT_PROGRAM.agc:621
//		TCF	SETGLOCK
// slot 8499
                        if slot <> 8499 or instruction <> 5429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5429, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:622
//
// T4RUPT_PROGRAM.agc:623
// -1		CAF	ZERO
// slot 8500
                        if slot <> 8500 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8501 {
// T4RUPT_PROGRAM.agc:624
//SETGLOCK	AD	DSPTAB +11D		# SEE IF PRESENT STATE OF GIMBAL LOCK LAMP
// slot 8501
                    if slot <> 8501 or instruction <> 25118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 542).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8502 {
// T4RUPT_PROGRAM.agc:625
//		MASK	BIT6			# AGREES WITH DESIRED STATE BY HALF ADDING
// slot 8502
                        if slot <> 8502 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:626
//		EXTEND				# THE TWO.
// slot 8503
                        if slot <> 8503 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8506 {
                if slot <= 8504 {
// T4RUPT_PROGRAM.agc:627
//		BZF	GLOCKOK			# OK AS IS.
// slot 8504
                    if slot <> 8504 or instruction <> 6840 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6840, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8505 {
// T4RUPT_PROGRAM.agc:628
//
// T4RUPT_PROGRAM.agc:629
//		MASK	DSPTAB +11D		# IF OFF, DON'T TURN ON IF IMU BEING CAGED.
// slot 8505
                        if slot <> 8505 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:630
//		CCS	A
// slot 8506
                        if slot <> 8506 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8507 {
// T4RUPT_PROGRAM.agc:631
//		TCF	GLAMPTST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.
// slot 8507
                    if slot <> 8507 or instruction <> 5447 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5447, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8508 {
// T4RUPT_PROGRAM.agc:632
//
// T4RUPT_PROGRAM.agc:633
//		CAF	BIT6
// slot 8508
                        if slot <> 8508 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:634
//		MASK	IMODES30
// slot 8509
                        if slot <> 8509 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8515 {
            if slot <= 8512 {
                if slot <= 8510 {
// T4RUPT_PROGRAM.agc:635
//		CCS	A
// slot 8510
                    if slot <> 8510 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8511 {
// T4RUPT_PROGRAM.agc:636
//		TCF	GLOCKOK
// slot 8511
                        if slot <> 8511 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:637
//
// T4RUPT_PROGRAM.agc:638
//GLINVERT	CS	DSPTAB +11D		# INVERT GIMBAL LOCK LAMP.
// slot 8512
                        if slot <> 8512 or instruction <> 16926 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 542).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8513 {
// T4RUPT_PROGRAM.agc:639
//		MASK	BIT6
// slot 8513
                    if slot <> 8513 or instruction <> 31206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8514 {
// T4RUPT_PROGRAM.agc:640
//		AD	BIT15			# TO INDICATE CHANGE IN DSPTAB +11D.
// slot 8514
                        if slot <> 8514 or instruction <> 27101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:641
//		XCH	DSPTAB +11D
// slot 8515
                        if slot <> 8515 or instruction <> 24094 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 542, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8518 {
                if slot <= 8516 {
// T4RUPT_PROGRAM.agc:642
//		MASK	OCT37737
// slot 8516
                    if slot <> 8516 or instruction <> 29810 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1138), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8517 {
// T4RUPT_PROGRAM.agc:643
//		ADS	DSPTAB +11D
// slot 8517
                        if slot <> 8517 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:644
//		TCF	GLOCKOK
// slot 8518
                        if slot <> 8518 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8519 {
// T4RUPT_PROGRAM.agc:645
//
// T4RUPT_PROGRAM.agc:646
//GLAMPTST	TC	LAMPTEST		# TURN OFF UNLESS LAMP TEST IN PROGRESS.
// slot 8519
                    if slot <> 8519 or instruction <> 1526 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1526, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8520 {
// T4RUPT_PROGRAM.agc:647
//		TCF	GLOCKOK
// slot 8520
                        if slot <> 8520 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:648
//		TCF	GLINVERT
// slot 8521
                        if slot <> 8521 or instruction <> 5440 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5440, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[491] to agcAotUnit491@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:649
//
// T4RUPT_PROGRAM.agc:650
//-70DEGS		DEC	-.38888			# -70 DEGREES SCALED IN HALF-REVOLUTIONS.
// slot 8522
    8522, 52792,
// T4RUPT_PROGRAM.agc:651
//-15DEGS		DEC	-.08333
// slot 8523
    8523, 62804
)).

// bank 06, slots 8524-8555
function agcAotUnit492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8539 {
        if slot <= 8531 {
            if slot <= 8527 {
                if slot <= 8525 {
                    if slot <= 8524 {
// T4RUPT_PROGRAM.agc:652
//
// T4RUPT_PROGRAM.agc:653
//# Page 171
// T4RUPT_PROGRAM.agc:654
//# PROGRAM NAME:  TLIM.
// T4RUPT_PROGRAM.agc:655
//#
// T4RUPT_PROGRAM.agc:656
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM MAINTAINS THE TEMP LAMP (BIT 4 OF CHANNEL 11) ON THE DSKY TO AGREE WITH
// T4RUPT_PROGRAM.agc:657
//# THE TEMP SIGNAL FROM THE ISS (BIT 15 OF CHANNEL 30).  HOWEVER, THE LIGHT WILL NOT BE TURNED OFF IF A LAMP TEST
// T4RUPT_PROGRAM.agc:658
//# IS IN PROGRESS.
// T4RUPT_PROGRAM.agc:659
//#
// T4RUPT_PROGRAM.agc:660
//# CALLING SEQUENCE:  CALLED BY IMUMON ON A CHANGE OF BIT 15 OF CHANNEL 30.
// T4RUPT_PROGRAM.agc:661
//#
// T4RUPT_PROGRAM.agc:662
//# JOBS OR TASKS INITIATED:  NON.
// T4RUPT_PROGRAM.agc:663
//#
// T4RUPT_PROGRAM.agc:664
//# SUBROUTINES CALLED:  LAMPTEST.
// T4RUPT_PROGRAM.agc:665
//#
// T4RUPT_PROGRAM.agc:666
//# ERASABLE INITIALIZATION:  FRESH START AND RESTART TURN THE TEMP LAMP OFF.
// T4RUPT_PROGRAM.agc:667
//#
// T4RUPT_PROGRAM.agc:668
//# ALARMS:  TEMP LAMP TURNED ON WHEN THE IMU TEMP GOES OUT OF LIMITS.
// T4RUPT_PROGRAM.agc:669
//#
// T4RUPT_PROGRAM.agc:670
//# EXIT:  NXTIFAIL.
// T4RUPT_PROGRAM.agc:671
//#
// T4RUPT_PROGRAM.agc:672
//# OUTPUT:  SERVICE OF TEMP LAMP.		  IN A, EXCEPT FOR TLIM.
// T4RUPT_PROGRAM.agc:673
//
// T4RUPT_PROGRAM.agc:674
//TLIM		MASK	POSMAX			# REMOVE BIT FROM WORD OF CHANGES AND SET
// slot 8524
                        if slot <> 8524 or instruction <> 31195 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            if fixedOperand = 16383 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 16384) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:675
//		TS	RUPTREG2		# DSKY TEMP LAMP ACCORDINGLY.
// slot 8525
                        if slot <> 8525 or instruction <> 22585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22585, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8526 {
// T4RUPT_PROGRAM.agc:676
//
// T4RUPT_PROGRAM.agc:677
//		CCS	IMODES30
// slot 8526
                        if slot <> 8526 or instruction <> 4802 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:678
//		TCF	TEMPOK
// slot 8527
                        if slot <> 8527 or instruction <> 5461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8529 {
                    if slot <= 8528 {
// T4RUPT_PROGRAM.agc:679
//		TCF	TEMPOK
// slot 8528
                        if slot <> 8528 or instruction <> 5461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:680
//
// T4RUPT_PROGRAM.agc:681
//		CAF	BIT4			# TURN ON LAMP.
// slot 8529
                        if slot <> 8529 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8530 {
// T4RUPT_PROGRAM.agc:682
//		EXTEND
// slot 8530
                        if slot <> 8530 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:683
//		WOR	DSALMOUT
// slot 8531
                        if slot <> 8531 or instruction <> 2569 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8535 {
                if slot <= 8533 {
                    if slot <= 8532 {
// T4RUPT_PROGRAM.agc:684
//		TCF	NXTIFAIL
// slot 8532
                        if slot <> 8532 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:685
//
// T4RUPT_PROGRAM.agc:686
//TEMPOK		TC	LAMPTEST		# IF TEMP NOW OK, DON'T TURN OFF LAMP IF
// slot 8533
                        if slot <> 8533 or instruction <> 1526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8534 {
// T4RUPT_PROGRAM.agc:687
//		TCF	NXTIFAIL		# LAMP TEST IN PROGRESS.
// slot 8534
                        if slot <> 8534 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:688
//
// T4RUPT_PROGRAM.agc:689
//		CS	BIT4
// slot 8535
                        if slot <> 8535 or instruction <> 18920 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8537 {
                    if slot <= 8536 {
// T4RUPT_PROGRAM.agc:690
//		EXTEND
// slot 8536
                        if slot <> 8536 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:691
//		WAND	DSALMOUT		# TURN OFF LAMP
// slot 8537
                        if slot <> 8537 or instruction <> 1545 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8538 {
// T4RUPT_PROGRAM.agc:692
//		TCF	NXTIFAIL
// slot 8538
                        if slot <> 8538 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:693
//
// T4RUPT_PROGRAM.agc:694
//# Page 172
// T4RUPT_PROGRAM.agc:695
//# PROGRAM NAME:  ITURNON.
// T4RUPT_PROGRAM.agc:696
//#
// T4RUPT_PROGRAM.agc:697
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM IS CALLED BY IMUMON WHEN A CHANGE OF BIT 14 OF CHANNEL 30 (ISS TURN-ON
// T4RUPT_PROGRAM.agc:698
//# REQUEST) IS DETECTED.  UPON ENTRY, ITURNON CHECKS IF A TURN-ON DELAY SEQUENCE HAS FAILED, AND IF SO, IT EXITS.
// T4RUPT_PROGRAM.agc:699
//# IF NOT, IT CHECKS WHETHER THE TURN-ON REQUEST CHANGE IS TO ON OR OFF.  IF ON, IT SETS BIT7 OF IMODES30 TO 1 SO
// T4RUPT_PROGRAM.agc:700
//# THAT TNONTEST WILL INITIATE THE ISS INITIALIZATION SEQUENCE.  IF OFF, THE TURN-ON DELAY SIGNAL, CHANNEL 12 BIT
// T4RUPT_PROGRAM.agc:701
//# 15, IS CHECKED AND IF IT IS ON, ITURNON EXITS.  IF THE DEALY SIGNAL IS OFF, PROGRAM ALARM 00207 IS ISSUED, BIT 2
// T4RUPT_PROGRAM.agc:702
//# OF IMODES30 IS SET TO 1 AND THE PROGRAM EXITS.
// T4RUPT_PROGRAM.agc:703
//#
// T4RUPT_PROGRAM.agc:704
//# THE SETTING OF BIT 2 OF IMODES30 (ISS DELAY SEQUENCE FAIL) INHIBITS THIS ROUTINE AND IMUOP FROM
// T4RUPT_PROGRAM.agc:705
//# PROCESSING ANY CHANGES.  THIS BIT WILL BE RESET BY THE ENDTNON ROUTINE WHEN THE CURRENT 90 SECOND DELAY PERIOD
// T4RUPT_PROGRAM.agc:706
//# ENDS.
// T4RUPT_PROGRAM.agc:707
//#
// T4RUPT_PROGRAM.agc:708
//# CALLING SEQUENCE:  FROM IMUMON WHEN ISS TURN-ON REQUEST CHANGES STATE.
// T4RUPT_PROGRAM.agc:709
//#
// T4RUPT_PROGRAM.agc:710
//# JOBS OR TASKS INITITIATED:  NONE.
// T4RUPT_PROGRAM.agc:711
//#
// T4RUPT_PROGRAM.agc:712
//# SUBROUTINES CALLED:  ALARM, IF THE ISS TURN-ON REQUEST IS NOT PRESENT FOR 90 SECONDS.
// T4RUPT_PROGRAM.agc:713
//#
// T4RUPT_PROGRAM.agc:714
//# ERASABLE INITIALIZATION:  FRESH START AND RESTART SET BIT 15 OF CHANNEL 12 AND BITS 2 AND 7 OF IMODES30 TO 0,
// T4RUPT_PROGRAM.agc:715
//# AND BIT 14 OF IMODES30 TO 1.
// T4RUPT_PROGRAM.agc:716
//#
// T4RUPT_PROGRAM.agc:717
//# ALARMS: PROGRAM ALARM 00207 IS ISSUED IF THE ISS TURN-ON REQUEST SIGNAL IS NOT PRESENT FOR 90 SECONDS.
// T4RUPT_PROGRAM.agc:718
//#
// T4RUPT_PROGRAM.agc:719
//# EXIT:  NXTIFAIL.
// T4RUPT_PROGRAM.agc:720
//#
// T4RUPT_PROGRAM.agc:721
//# OUTPUT:  BIT 7 OF IMODES30 TO START ISS INITIALIZATION, OR BIT 2 OF IMODES30 AND PROGRAM ALARM 00207 TO INDICATE
// T4RUPT_PROGRAM.agc:722
//# A FAILED TURN-ON SEQUENCE.
// T4RUPT_PROGRAM.agc:723
//
// T4RUPT_PROGRAM.agc:724
//ITURNON		CAF	BIT2		# IF DELAY REQUEST HAS GONE OFF
// slot 8539
                        if slot <> 8539 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8547 {
            if slot <= 8543 {
                if slot <= 8541 {
                    if slot <= 8540 {
// T4RUPT_PROGRAM.agc:725
//		MASK	IMODES30	# PREMATURELY, DO NOT PROCESS ANY CHANGES
// slot 8540
                        if slot <> 8540 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:726
//		CCS	A		# UNTIL THE CURRENT 90 SEC WAIT EXPIRES.
// slot 8541
                        if slot <> 8541 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8542 {
// T4RUPT_PROGRAM.agc:727
//		TCF	NXTIFAIL
// slot 8542
                        if slot <> 8542 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:728
//
// T4RUPT_PROGRAM.agc:729
//		CAF	BIT14		# SEE IF JUST ON OR OFF.
// slot 8543
                        if slot <> 8543 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8545 {
                    if slot <= 8544 {
// T4RUPT_PROGRAM.agc:730
//		MASK 	IMODES30
// slot 8544
                        if slot <> 8544 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:731
//		EXTEND
// slot 8545
                        if slot <> 8545 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8546 {
// T4RUPT_PROGRAM.agc:732
//		BZF	ITURNON2	# IF JUST ON.
// slot 8546
                        if slot <> 8546 or instruction <> 5486 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5486, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:733
//
// T4RUPT_PROGRAM.agc:734
//		CAF	BIT15
// slot 8547
                        if slot <> 8547 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8551 {
                if slot <= 8549 {
                    if slot <= 8548 {
// T4RUPT_PROGRAM.agc:735
//		EXTEND			# SEE IF DELAY PRESENT DISCRETE HAS BEEN
// slot 8548
                        if slot <> 8548 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:736
//		RAND	CHAN12		# SENT.  IF SO, ACTION COMPLETE
// slot 8549
                        if slot <> 8549 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8550 {
// T4RUPT_PROGRAM.agc:737
//		EXTEND
// slot 8550
                        if slot <> 8550 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:738
//		BZF	+2
// slot 8551
                        if slot <> 8551 or instruction <> 5481 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5481, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8553 {
                    if slot <= 8552 {
// T4RUPT_PROGRAM.agc:739
//		TCF	NXTIFAIL
// slot 8552
                        if slot <> 8552 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:740
//
// T4RUPT_PROGRAM.agc:741
//		CAF	BIT2		# IF NOT, SET BIT TO INDICATE REQUEST NOT
// slot 8553
                        if slot <> 8553 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8554 {
// T4RUPT_PROGRAM.agc:742
//		ADS	IMODES30	# PRESENT FOR FULL DURATION.
// slot 8554
                        if slot <> 8554 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:743
//		TC	ALARM
// slot 8555
                        if slot <> 8555 or instruction <> 2935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[492] to agcAotUnit492@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:744
//		OCT	207
// slot 8556
    8556, 270
)).

// bank 06, slots 8557-8563
function agcAotUnit493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8559 {
        if slot <= 8557 {
// T4RUPT_PROGRAM.agc:745
//		TCF	NXTIFAIL
// slot 8557
            if slot <> 8557 or instruction <> 5269 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5269, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8558 {
// T4RUPT_PROGRAM.agc:746
//
// T4RUPT_PROGRAM.agc:747
//# Page 173
// T4RUPT_PROGRAM.agc:748
//ITURNON2	CS	IMODES30	# SET BIT7 TO INDICATE WAIT OF 1 SAMPLE
// slot 8558
                if slot <> 8558 or instruction <> 17090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 706).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:749
//		MASK	BIT7
// slot 8559
                if slot <> 8559 or instruction <> 31205 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    if fixedOperand = 64 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8561 {
            if slot <= 8560 {
// T4RUPT_PROGRAM.agc:750
//		ADS	IMODES30
// slot 8560
                if slot <> 8560 or instruction <> 11970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 706).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:751
//		CAF	RRINIT
// slot 8561
                if slot <> 8561 or instruction <> 13684 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1396), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8562 {
// T4RUPT_PROGRAM.agc:752
//		TS	RADMODES
// slot 8562
                if slot <> 8562 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:753
//		TCF	NXTIFAIL
// slot 8563
                if slot <> 8563 or instruction <> 5269 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5269, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[493] to agcAotUnit493@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:754
//
// T4RUPT_PROGRAM.agc:755
//RRINIT		OCT	00102
// slot 8564
    8564, 132
)).

// bank 06, slots 8565-8583
function agcAotUnit494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8573 {
        if slot <= 8568 {
            if slot <= 8566 {
                if slot <= 8565 {
// T4RUPT_PROGRAM.agc:756
//
// T4RUPT_PROGRAM.agc:757
//# Page 174
// T4RUPT_PROGRAM.agc:758
//# PROGRAM NAME:  IMUCAGE.
// T4RUPT_PROGRAM.agc:759
//#
// T4RUPT_PROGRAM.agc:760
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF THE IMUCAGE INBIT, CHANNEL 30 BITS 11.  IF THE BIT
// T4RUPT_PROGRAM.agc:761
//# CHANGES TO 0 (CAGE BUTTON PRESSED), THE ISS IS CAGED (ICDU ZERO + COARSE ALIGN + NO ATT LAMP) UNTIL THE
// T4RUPT_PROGRAM.agc:762
//# BOB SELECTS ANOTHER PROGRAM TO ALIGN THE ISS.  ANY PULSE TRAINS TO THE ICDU'S AND GYRO'S ARE TERMINATED,
// T4RUPT_PROGRAM.agc:763
//# THE ASSOCIATE OUTCOUNTERS ARE ZEROED AND THE GYRO'S ARE DE-SELECTED.  NO ACTION OCCURS WHEN THE BUTTON IS
// T4RUPT_PROGRAM.agc:764
//# RELEASED (INBIT CHANGES TO 1).
// T4RUPT_PROGRAM.agc:765
//#
// T4RUPT_PROGRAM.agc:766
//# CALLING SEQUENCE:  BY IMUMON WHEN IMU CAGE BIT CHANGES.
// T4RUPT_PROGRAM.agc:767
//#
// T4RUPT_PROGRAM.agc:768
//# JOBS OR TASKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:769
//#
// T4RUPT_PROGRAM.agc:770
//# SUBROUTINES CALLED:  CAGESUB.
// T4RUPT_PROGRAM.agc:771
//#
// T4RUPT_PROGRAM.agc:772
//# ERASABLE INITIALZATION:  FRESH START AND RESTART SET BIT 11 OF IMODES30 TO 1.
// T4RUPT_PROGRAM.agc:773
//#
// T4RUPT_PROGRAM.agc:774
//# ALARMS: NONE.
// T4RUPT_PROGRAM.agc:775
//#
// T4RUPT_PROGRAM.agc:776
//# EXIT:  NXTIFAIL.
// T4RUPT_PROGRAM.agc:777
//#
// T4RUPT_PROGRAM.agc:778
//# OUTPUT:  ISS CAGED, COUNTERS ZEROED, PULSE TRAINS TERMINATED AND NO ATT LAMP LIT.
// T4RUPT_PROGRAM.agc:779
//
// T4RUPT_PROGRAM.agc:780
//IMUCAGE		CCS	A		# NO ACTION OF GOING OFF.
// slot 8565
                    if slot <> 8565 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:781
//		TCF	ISSZERO
// slot 8566
                    if slot <> 8566 or instruction <> 5361 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5361, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8567 {
// T4RUPT_PROGRAM.agc:782
//		CS	OCT77000	# TERMINATE ICDU, RCDU, GYRO PULSE TRAINS
// slot 8567
                    if slot <> 8567 or instruction <> 17922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:783
//		EXTEND
// slot 8568
                    if slot <> 8568 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8570 {
                if slot <= 8569 {
// T4RUPT_PROGRAM.agc:784
//		WAND	CHAN14
// slot 8569
                    if slot <> 8569 or instruction <> 1548 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:785
//
// T4RUPT_PROGRAM.agc:786
//		CS	OCT272		# KNOCK DOWN DISPLAY INERTIAL DATA, IMU
// slot 8570
                    if slot <> 8570 or instruction <> 17918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1534), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8571 {
// T4RUPT_PROGRAM.agc:787
//		EXTEND			# ERROR COUNTER ENABLE, ZERO ICDU, COARSE
// slot 8571
                    if slot <> 8571 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8572 {
// T4RUPT_PROGRAM.agc:788
//		WAND	CHAN12		# ALIGN ENABLE, RR ERROR COUNTER ENABLE.
// slot 8572
                        if slot <> 8572 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:789
//
// T4RUPT_PROGRAM.agc:790
//		CS 	ENGONBIT	# INSURE ENGONFLG IS CLEAR.
// slot 8573
                        if slot <> 8573 or instruction <> 18917 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8578 {
            if slot <= 8575 {
                if slot <= 8574 {
// T4RUPT_PROGRAM.agc:791
//		MASK	FLAGWRD5
// slot 8574
                    if slot <> 8574 or instruction <> 28737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:792
//		TS	FLAGWRD5
// slot 8575
                    if slot <> 8575 or instruction <> 22593 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22593, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8576 {
// T4RUPT_PROGRAM.agc:793
//		CS	PRIO30		# TURN ENGINE OFF.
// slot 8576
                    if slot <> 8576 or instruction <> 18669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8577 {
// T4RUPT_PROGRAM.agc:794
//		EXTEND
// slot 8577
                        if slot <> 8577 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:795
//		RAND	DSALMOUT
// slot 8578
                        if slot <> 8578 or instruction <> 1033 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8580 {
                if slot <= 8579 {
// T4RUPT_PROGRAM.agc:796
//		AD	BIT14
// slot 8579
                    if slot <> 8579 or instruction <> 27102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:797
//		EXTEND
// slot 8580
                    if slot <> 8580 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8581 {
// T4RUPT_PROGRAM.agc:798
//		WRITE	DSALMOUT	# FORCE BIT14=1, BIT13=0.
// slot 8581
                    if slot <> 8581 or instruction <> 521 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8582 {
// T4RUPT_PROGRAM.agc:799
//
// T4RUPT_PROGRAM.agc:800
//		TC	CAGESUB1
// slot 8582
                        if slot <> 8582 or instruction <> 1507 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1507, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:801
//
// T4RUPT_PROGRAM.agc:802
//		TC	IBNKCALL	# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
// slot 8583
                        if slot <> 8583 or instruction <> 2492 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2492, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[494] to agcAotUnit494@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:803
//		CADR	RNDREFDR
// slot 8584
    8584, 15610
)).

// bank 06, slots 8585-8599
function agcAotUnit495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8591 {
        if slot <= 8587 {
            if slot <= 8585 {
// T4RUPT_PROGRAM.agc:804
//
// T4RUPT_PROGRAM.agc:805
//		CS	ZERO
// slot 8585
                if slot <> 8585 or instruction <> 18925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8586 {
// T4RUPT_PROGRAM.agc:806
//		TS	CDUXCMD
// slot 8586
                    if slot <> 8586 or instruction <> 22568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22568, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:807
//		TS	CDUYCMD
// slot 8587
                    if slot <> 8587 or instruction <> 22569 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22569, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8589 {
                if slot <= 8588 {
// T4RUPT_PROGRAM.agc:808
//# Page 175
// T4RUPT_PROGRAM.agc:809
//		TS	CDUZCMD
// slot 8588
                    if slot <> 8588 or instruction <> 22570 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22570, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:810
//		TS	GYROCMD
// slot 8589
                    if slot <> 8589 or instruction <> 22567 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22567, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8590 {
// T4RUPT_PROGRAM.agc:811
//
// T4RUPT_PROGRAM.agc:812
//		CS	OCT740		# HAVING WAITED AT LEAST 27 MCT FROM
// slot 8590
                    if slot <> 8590 or instruction <> 17921 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1537), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:813
//		EXTEND			# GYRO PULSE TRAIN TERMINATION, WE CAN
// slot 8591
                    if slot <> 8591 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8595 {
            if slot <= 8593 {
                if slot <= 8592 {
// T4RUPT_PROGRAM.agc:814
//		WAND	CHAN14		# DE-SELECT THE GYROS.
// slot 8592
                    if slot <> 8592 or instruction <> 1548 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:815
//		TCF	NXTIFAIL
// slot 8593
                    if slot <> 8593 or instruction <> 5269 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5269, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8594 {
// T4RUPT_PROGRAM.agc:816
//
// T4RUPT_PROGRAM.agc:817
//# Page 176
// T4RUPT_PROGRAM.agc:818
//# PROGRAM NAME:  IMUOP.
// T4RUPT_PROGRAM.agc:819
//#
// T4RUPT_PROGRAM.agc:820
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES IN THE ISS OPERATE DISCRETE, BIT 9 OF CHANNEL 30.
// T4RUPT_PROGRAM.agc:821
//# IF THE INBIT CHANGES TO 0, INDICATING ISS ON, IMUOP GENERALLY SETS BIT 7 OF IMODES30 TO 1 TO REQUEST ISS
// T4RUPT_PROGRAM.agc:822
//# INITIALIZATION VIA TNONTEST.  AN EXCEPTION IS DURING A FAILED ISS DELAY DURING WHICH BIT 2 OF IMODES30 IS SET
// T4RUPT_PROGRAM.agc:823
//# TO 1 AND NO FURTHER INITIALIZATION IS REQUIRED.  WHEN THE INBIT CHANGES TO 1, INDICATING ISS OFF, IMUSEFLG IS
// T4RUPT_PROGRAM.agc:824
//# TESTED TO SEE IF ANY PROGRAM WAS USING THE ISS.  IF SO, PROGRAM ALARM 00214 IS ISSUED.
// T4RUPT_PROGRAM.agc:825
//#
// T4RUPT_PROGRAM.agc:826
//# CALLING SEQUENCE:  BY IMUMON WHEN BIT 9 OF CHANNEL 30 CHANGES.
// T4RUPT_PROGRAM.agc:827
//#
// T4RUPT_PROGRAM.agc:828
//# JOBS OR TAKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:829
//#
// T4RUPT_PROGRAM.agc:830
//# SUBROUTINES CALLED:  ALARM, IF ISS IS TURNED OFF WHILE IN USE.
// T4RUPT_PROGRAM.agc:831
//#
// T4RUPT_PROGRAM.agc:832
//# ERASABLE INITIALIZATION:  ON FRESH START AND RESTART, BIT 9 OF IMODES30 IS SET TO 1 EXCEPT WHEN THE GIMBAL LOCK
// T4RUPT_PROGRAM.agc:833
//# LAMP IS ON, IN WHICH CASE IT IS SET TO 0.  THIS PREVENTS ICDU ZERO BY TNONTEST WITH THE ISS IN GIMBAL LOCK.
// T4RUPT_PROGRAM.agc:834
//#
// T4RUPT_PROGRAM.agc:835
//# ALARMS:  PROGRAM ALARM 00214 IF THE ISS IS TURNED OFF WHILE IN USE.
// T4RUPT_PROGRAM.agc:836
//#
// T4RUPT_PROGRAM.agc:837
//# EXIT:  NXTIFAIL.
// T4RUPT_PROGRAM.agc:838
//#
// T4RUPT_PROGRAM.agc:839
//# OUTPUT:  ISS INITIALIZATION REQUEST (IMODES30 BIT 7) OR PROGRAM ALARM 00214.
// T4RUPT_PROGRAM.agc:840
//
// T4RUPT_PROGRAM.agc:841
//IMUOP		EXTEND
// slot 8594
                    if slot <> 8594 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:842
//		BZF	IMUOP2
// slot 8595
                    if slot <> 8595 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8597 {
                if slot <= 8596 {
// T4RUPT_PROGRAM.agc:843
//
// T4RUPT_PROGRAM.agc:844
//		CS	IMODES33		# DISABLE DAP
// slot 8596
                    if slot <> 8596 or instruction <> 17091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 707).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:845
//		MASK	BIT6
// slot 8597
                    if slot <> 8597 or instruction <> 31206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8598 {
// T4RUPT_PROGRAM.agc:846
//		ADS	IMODES33
// slot 8598
                    if slot <> 8598 or instruction <> 11971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:847
//
// T4RUPT_PROGRAM.agc:848
//		TC	IBNKCALL		# KNOCK DOWN TRACK, REFSMMAT, DRIFT FLAGS
// slot 8599
                    if slot <> 8599 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[495] to agcAotUnit495@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:849
//		CADR	RNDREFDR
// slot 8600
    8600, 15610
)).

// bank 06, slots 8601-8608
function agcAotUnit496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8604 {
        if slot <= 8602 {
            if slot <= 8601 {
// T4RUPT_PROGRAM.agc:850
//
// T4RUPT_PROGRAM.agc:851
//		CS	BITS7&8			# KNOCK DOWN RENDEZVOUS, IMUUSE FLAGS
// slot 8601
                if slot <> 8601 or instruction <> 17919 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1535), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:852
//		MASK	FLAGWRD0
// slot 8602
                if slot <> 8602 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8603 {
// T4RUPT_PROGRAM.agc:853
//		XCH	FLAGWRD0		# IF GOING OFF, ALARM IF PROG USING IMU.
// slot 8603
                if slot <> 8603 or instruction <> 23612 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 60, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:854
//		COM
// slot 8604
                if slot <> 8604 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8606 {
            if slot <= 8605 {
// T4RUPT_PROGRAM.agc:855
//		MASK	IMUSEFLG
// slot 8605
                if slot <> 8605 or instruction <> 31204 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    if fixedOperand = 128 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:856
//		CCS	A
// slot 8606
                if slot <> 8606 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8607 {
// T4RUPT_PROGRAM.agc:857
//		TCF	NXTIFAIL
// slot 8607
                if slot <> 8607 or instruction <> 5269 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5269, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:858
//
// T4RUPT_PROGRAM.agc:859
//		TC	ALARM
// slot 8608
                if slot <> 8608 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[496] to agcAotUnit496@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:860
//		OCT	214
// slot 8609
    8609, 280
)).

// bank 06, slots 8610-8630
function agcAotUnit497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8619 {
        if slot <= 8614 {
            if slot <= 8611 {
                if slot <= 8610 {
// T4RUPT_PROGRAM.agc:861
//		TCF	NXTIFAIL
// slot 8610
                    if slot <> 8610 or instruction <> 5269 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5269, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:862
//
// T4RUPT_PROGRAM.agc:863
//IMUOP2		CAF	BIT2			# SEE IF FAILED ISS TURN-ON SEQ IN PROG.
// slot 8611
                    if slot <> 8611 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8612 {
// T4RUPT_PROGRAM.agc:864
//		MASK	IMODES30
// slot 8612
                    if slot <> 8612 or instruction <> 29378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8613 {
// T4RUPT_PROGRAM.agc:865
//		CCS	A
// slot 8613
                        if slot <> 8613 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:866
//		TCF	NXTIFAIL		# IF SO, DON'T PROCESS UNTIL PRESENT 90
// slot 8614
                        if slot <> 8614 or instruction <> 5269 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5269, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8616 {
                if slot <= 8615 {
// T4RUPT_PROGRAM.agc:867
//		TCF	ITURNON2		# SECONDS EXPIRES.
// slot 8615
                    if slot <> 8615 or instruction <> 5486 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5486, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:868
//
// T4RUPT_PROGRAM.agc:869
//# Page 177
// T4RUPT_PROGRAM.agc:870
//# PROGRAM NAME:  PIPFAIL
// T4RUPT_PROGRAM.agc:871
//#
// T4RUPT_PROGRAM.agc:872
//# FUNCITONAL DESCRIPTION:  THIS PROGRAM PROCESSES CHANGES OF BIT 13 OF CHANNEL 33, PIPA FAIL.  IT SETS BIT 10 OF
// T4RUPT_PROGRAM.agc:873
//# IMODES30 TO AGREE.  IT CALLS SETISSW IN CASE A PIPA FAIL NECESSITATES AN ISS WARNING.  IF NOT, I.E., IMODES30
// T4RUPT_PROGRAM.agc:874
//# BIT 1 = 1, AND A PIPA FAIL IS PRESENT AND THE ISS NOT BEING INITIALIZED, PROGRAM ALARM 0212 IS ISSUED.
// T4RUPT_PROGRAM.agc:875
//#
// T4RUPT_PROGRAM.agc:876
//# CALLING SEQUENCE:  BY C33TEST ON CHANGES OF CHANNEL 33 BIT 13.
// T4RUPT_PROGRAM.agc:877
//#
// T4RUPT_PROGRAM.agc:878
//# JOBS OR TASKS INITIATED:  NONE.
// T4RUPT_PROGRAM.agc:879
//#
// T4RUPT_PROGRAM.agc:880
//# SUBROUTINES CALLED:  1) SETISSW, AND 2) ALARM (SEE FUNCITONAL DESCRIPTION).
// T4RUPT_PROGRAM.agc:881
//#
// T4RUPT_PROGRAM.agc:882
//# ERASABLE INITIALZIZATION:  SEE IMUMON FOR INITIALIZATION OF IMODES30.  THE RELEVANT BITS ARE 5, 7, 8, 9, AND 10.
// T4RUPT_PROGRAM.agc:883
//#
// T4RUPT_PROGRAM.agc:884
//# ALARMS:  PROGRAM ALARM 00212 IF PIPA FAIL IS PRESENT BUT NEITHER ISS WARNING IS TO BE ISSUED NOR THE ISS IS
// T4RUPT_PROGRAM.agc:885
//# BEING INITIALIZED.
// T4RUPT_PROGRAM.agc:886
//#
// T4RUPT_PROGRAM.agc:887
//# EXIT:  NXTFL33.
// T4RUPT_PROGRAM.agc:888
//#
// T4RUPT_PROGRAM.agc:889
//# OUTPUT:  PROGRAM ALARM 00212 AND ISS WARNING MAINTENANCE.
// T4RUPT_PROGRAM.agc:890
//
// T4RUPT_PROGRAM.agc:891
//PIPFAIL		CCS	A			# SET BIT10 IN IMODES30 SO ALL ISS WARNING
// slot 8616
                    if slot <> 8616 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8617 {
// T4RUPT_PROGRAM.agc:892
//		CAF	BIT10			# INFO IS IN ONE REGISTER.
// slot 8617
                    if slot <> 8617 or instruction <> 14818 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8618 {
// T4RUPT_PROGRAM.agc:893
//		XCH	IMODES30
// slot 8618
                        if slot <> 8618 or instruction <> 24258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 706, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:894
//		MASK	-BIT10
// slot 8619
                        if slot <> 8619 or instruction <> 30212 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1540), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8624 {
            if slot <= 8621 {
                if slot <= 8620 {
// T4RUPT_PROGRAM.agc:895
//		ADS	IMODES30
// slot 8620
                    if slot <> 8620 or instruction <> 11970 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 706).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:896
//
// T4RUPT_PROGRAM.agc:897
//		TC	SETISSW
// slot 8621
                    if slot <> 8621 or instruction <> 1475 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1475, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8622 {
// T4RUPT_PROGRAM.agc:898
//
// T4RUPT_PROGRAM.agc:899
//		CS	IMODES30		# IF PIP FAIL DOESN'T LIGHT ISS WARNING, DO
// slot 8622
                    if slot <> 8622 or instruction <> 17090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 706).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8623 {
// T4RUPT_PROGRAM.agc:900
//		MASK	BIT1			# A PROGRAM ALARM IF IMU OPERATING BUT NOT
// slot 8623
                        if slot <> 8623 or instruction <> 31211 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            if fixedOperand = 1 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:901
//		CCS	A			# CAGED OR BEING TURNED ON.
// slot 8624
                        if slot <> 8624 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8627 {
                if slot <= 8625 {
// T4RUPT_PROGRAM.agc:902
//		TCF	NXTFL33
// slot 8625
                    if slot <> 8625 or instruction <> 5402 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5402, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8626 {
// T4RUPT_PROGRAM.agc:903
//
// T4RUPT_PROGRAM.agc:904
//		CA	IMODES30
// slot 8626
                        if slot <> 8626 or instruction <> 12994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:905
//		MASK	OCT1720
// slot 8627
                        if slot <> 8627 or instruction <> 30208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1536), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8628 {
// T4RUPT_PROGRAM.agc:906
//		CCS	A
// slot 8628
                    if slot <> 8628 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8629 {
// T4RUPT_PROGRAM.agc:907
//		TCF	NXTFL33			# ABOVE CONDITION NOT MET.
// slot 8629
                        if slot <> 8629 or instruction <> 5402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5402, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:908
//
// T4RUPT_PROGRAM.agc:909
//		TC	ALARM
// slot 8630
                        if slot <> 8630 or instruction <> 2935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[497] to agcAotUnit497@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:910
//		OCT	212
// slot 8631
    8631, 276
)).

// bank 06, slots 8632-8635
function agcAotUnit498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8633 {
        if slot <= 8632 {
// T4RUPT_PROGRAM.agc:911
//		TCF	NXTFL33
// slot 8632
            if slot <> 8632 or instruction <> 5402 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5402, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:912
//
// T4RUPT_PROGRAM.agc:913
//# Page 178
// T4RUPT_PROGRAM.agc:914
//# PROGRAM NAMES:  DNTMFAST, UPTMFAST
// T4RUPT_PROGRAM.agc:915
//#
// T4RUPT_PROGRAM.agc:916
//# FUNCTIONAL DESCRIPTION:  THESE PROGRAMS PROCESS CHANGES OF BITS 12 AND 11 OF CHANNEL 33.  IF A BIT CHANGES TO A
// T4RUPT_PROGRAM.agc:917
//# 0, A PROGRAM ALARM IS ISSUED.  THE LAARMS ARE:
// T4RUPT_PROGRAM.agc:918
//#
// T4RUPT_PROGRAM.agc:919
//#	BIT	ALARM	CAUSE
// T4RUPT_PROGRAM.agc:920
//#	---	-----	-----
// T4RUPT_PROGRAM.agc:921
//#	 12	01105	DOWNLINK TOO FAST
// T4RUPT_PROGRAM.agc:922
//#	 11	01106	UPLINK TOO FAST
// T4RUPT_PROGRAM.agc:923
//#
// T4RUPT_PROGRAM.agc:924
//# CALLING SEQUENCE:  BY C33TEST ON A BIT CHANGE.
// T4RUPT_PROGRAM.agc:925
//#
// T4RUPT_PROGRAM.agc:926
//# SUBROUTINES CALLED:  ALARM, IF A BIT CHANGES TO A 0.
// T4RUPT_PROGRAM.agc:927
//#
// T4RUPT_PROGRAM.agc:928
//# ERASABLE INITIALIZATION:  FRESH START OR RESTART, BITS 12 AND 11 OF IMODES33 ARE SET TO 1.
// T4RUPT_PROGRAM.agc:929
//#
// T4RUPT_PROGRAM.agc:930
//# ALARMS:  SET FUNCTGIONAL DESCRIPTION.
// T4RUPT_PROGRAM.agc:931
//#
// T4RUPT_PROGRAM.agc:932
//# EXIT:  NXTFL33.
// T4RUPT_PROGRAM.agc:933
//#
// T4RUPT_PROGRAM.agc:934
//# OUTPUT:  PROGRAM ALARM ON A BIT CHANGE TO 0.
// T4RUPT_PROGRAM.agc:935
//
// T4RUPT_PROGRAM.agc:936
//DNTMFAST	CCS	A			# DO PROG ALARM IF TM TOO FAST.
// slot 8633
            if slot <> 8633 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8634 {
// T4RUPT_PROGRAM.agc:937
//		TCF	NXTFL33
// slot 8634
            if slot <> 8634 or instruction <> 5402 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5402, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:938
//
// T4RUPT_PROGRAM.agc:939
//		TC	ALARM
// slot 8635
            if slot <> 8635 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[498] to agcAotUnit498@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:940
//		OCT	1105
// slot 8636
    8636, 1162
)).

// bank 06, slots 8637-8640
function agcAotUnit499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8638 {
        if slot <= 8637 {
// T4RUPT_PROGRAM.agc:941
//		TCF	NXTFL33
// slot 8637
            if slot <> 8637 or instruction <> 5402 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5402, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:942
//
// T4RUPT_PROGRAM.agc:943
//UPTMFAST	CCS	A			# SAME AS DNLINK TOO FAST WITH DIFFERENT
// slot 8638
            if slot <> 8638 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8639 {
// T4RUPT_PROGRAM.agc:944
//		TCF	NXTFL33			# ALARM CODE.
// slot 8639
            if slot <> 8639 or instruction <> 5402 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5402, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:945
//
// T4RUPT_PROGRAM.agc:946
//		TC	ALARM
// slot 8640
            if slot <> 8640 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[499] to agcAotUnit499@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:947
//		OCT	1106
// slot 8641
    8641, 1164
)).

// bank 06, slots 8642-8688
function agcAotUnit500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8664 {
        if slot <= 8652 {
            if slot <= 8646 {
                if slot <= 8643 {
                    if slot <= 8642 {
// T4RUPT_PROGRAM.agc:948
//		TCF	NXTFL33
// slot 8642
                        if slot <> 8642 or instruction <> 5402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5402, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:949
//# Page 179
// T4RUPT_PROGRAM.agc:950
//# PROGRAM NAME:  SETISSW
// T4RUPT_PROGRAM.agc:951
//#
// T4RUPT_PROGRAM.agc:952
//# FUNCTIONAL DESCRIPTION:  THIS PROGRAM TURNS THE ISS WARNING LAMP ON AND OFF (CHANNEL 11 BIT 1 = 1 FOR ON,
// T4RUPT_PROGRAM.agc:953
//# 0 FOR OFF) DEPENDING ON THE STATUS OF IMODES30 BITS 13 (IMU FAIL) AND 4 (INHIBIT IMU FAIL), 12 (ICDU FAIL) AND
// T4RUPT_PROGRAM.agc:954
//# 3 (INHIBIT ICDU FAIL), AND 10 (PIPA FAIL) AND 1 (INHIBIT PIPA FAIL).  THE LAMP IS LEFT ON IF A LAMP TEST IS IN
// T4RUPT_PROGRAM.agc:955
//# PROGRESS.
// T4RUPT_PROGRAM.agc:956
//#
// T4RUPT_PROGRAM.agc:957
//# CALLING SEQUENCE:  CALLED BY IMUMON ON CHANGES TO IMU FAIL AND ICDU FAIL.  CALLED BY IFAILOK AND PFAILOK UPON
// T4RUPT_PROGRAM.agc:958
//# REMOVAL OF THE FAIL INHIBITS.  CALLED BY PIPFAIL WHEN THE PIPA FAIL DISCRETE CHANGES.  IT IS CALLED BY PIPUSE
// T4RUPT_PROGRAM.agc:959
//# SINCE THE PIPA FAIL PROGRAM ALARM MAY NECESSITATE AN ISS WARNING, AND LIKEWISE BY PIPFREE WHEN THE ALARM DEPARTS
// T4RUPT_PROGRAM.agc:960
//# AND IT IS CALLED BY IMUZERO3 AND ISSUP AFTER THE FAIL INHIBITS HAVE BEEN REMOVED.
// T4RUPT_PROGRAM.agc:961
//#
// T4RUPT_PROGRAM.agc:962
//# JOBS OR TASKS INITIAZTED:  NONE.
// T4RUPT_PROGRAM.agc:963
//#
// T4RUPT_PROGRAM.agc:964
//# SUBROUTINES CALLED:  NONE.
// T4RUPT_PROGRAM.agc:965
//#
// T4RUPT_PROGRAM.agc:966
//# ERASABLE INITIALIZATION:
// T4RUPT_PROGRAM.agc:967
//#
// T4RUPT_PROGRAM.agc:968
//#	1) IMODES30 -- SEE IMUMON.
// T4RUPT_PROGRAM.agc:969
//#	2) IMODES33 BIT 1 = 0 (LAMP TEST NOT IN PROGRESS).
// T4RUPT_PROGRAM.agc:970
//#
// T4RUPT_PROGRAM.agc:971
//# ALARMS:  ISS WARNING.
// T4RUPT_PROGRAM.agc:972
//#
// T4RUPT_PROGRAM.agc:973
//# THE FOLLOWING PROGRAM ALARMS WILL SHOW WHICH FAILURE CAUSED THE ISS WARN
// T4RUPT_PROGRAM.agc:974
//#	PROGRAM ALARM 00777	PIPA FAIL
// T4RUPT_PROGRAM.agc:975
//#	PROGRAM ALARM 03777	ICDU FAIL
// T4RUPT_PROGRAM.agc:976
//#	PROGRAM	ALARM 04777	ICDU, PIPA FAILS
// T4RUPT_PROGRAM.agc:977
//#	PROGRAM ALARM 07777	IMU FAIL
// T4RUPT_PROGRAM.agc:978
//#	PROGRAM ALARM 10777	IMU, PIPA FAILS
// T4RUPT_PROGRAM.agc:979
//#	PROGRAM ALARM 13777	IMU, ICDU FAILS
// T4RUPT_PROGRAM.agc:980
//#	PROGRAM ALARM 14777	IMU, ICDU, PIPA FAILS
// T4RUPT_PROGRAM.agc:981
//#
// T4RUPT_PROGRAM.agc:982
//# EXIT: VIA Q.
// T4RUPT_PROGRAM.agc:983
//#
// T4RUPT_PROGRAM.agc:984
//# OUTPUT: ISS WARNING LAMP SET PROPERLY.
// T4RUPT_PROGRAM.agc:985
//
// T4RUPT_PROGRAM.agc:986
//SETISSW		CAF	OCT15			# SET ISS WARNING USING THE FAIL BITS IN
// slot 8643
                        if slot <> 8643 or instruction <> 14833 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2545), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 8644 {
// T4RUPT_PROGRAM.agc:987
//		MASK	IMODES30		# BITS 13, 12, AND 10 OF IMODES30 AND THE
// slot 8644
                        if slot <> 8644 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8645 {
// T4RUPT_PROGRAM.agc:988
//		EXTEND				# FAILURE INHIBIT BITS IN POSITIONS
// slot 8645
                            if slot <> 8645 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:989
//		MP	BIT10			# 4, 3, AND 1.
// slot 8646
                            if slot <> 8646 or instruction <> 31202 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8649 {
                    if slot <= 8647 {
// T4RUPT_PROGRAM.agc:990
//		CA	IMODES30
// slot 8647
                        if slot <> 8647 or instruction <> 12994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8648 {
// T4RUPT_PROGRAM.agc:991
//		EXTEND
// slot 8648
                            if slot <> 8648 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:992
//		ROR	LCHAN			# 0 INDICATES FAILURE
// slot 8649
                            if slot <> 8649 or instruction <> 2049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8650 {
// T4RUPT_PROGRAM.agc:993
//		COM
// slot 8650
                        if slot <> 8650 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8651 {
// T4RUPT_PROGRAM.agc:994
//		MASK	OCT15000
// slot 8651
                            if slot <> 8651 or instruction <> 31253 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                                if fixedOperand = 6656 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512 + mod(floor(words[0] / 2048), 4) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:995
//		CCS	A
// slot 8652
                            if slot <> 8652 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8658 {
                if slot <= 8655 {
                    if slot <= 8653 {
// T4RUPT_PROGRAM.agc:996
//		TCF	ISSWON			# FAILURE.
// slot 8653
                        if slot <> 8653 or instruction <> 5590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8654 {
// T4RUPT_PROGRAM.agc:997
//
// T4RUPT_PROGRAM.agc:998
//ISSWOFF		CAF	BIT1			# DON'T TURN OFF ISS WARNING IF LAMP TEST
// slot 8654
                            if slot <> 8654 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:999
//		MASK	IMODES33		# IN PROGRESS.
// slot 8655
                            if slot <> 8655 or instruction <> 29379 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 707).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8656 {
// T4RUPT_PROGRAM.agc:1000
//# Page 180
// T4RUPT_PROGRAM.agc:1001
//		CCS	A
// slot 8656
                        if slot <> 8656 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8657 {
// T4RUPT_PROGRAM.agc:1002
//		TC	Q
// slot 8657
                            if slot <> 8657 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1003
//
// T4RUPT_PROGRAM.agc:1004
//		CS	BIT1
// slot 8658
                            if slot <> 8658 or instruction <> 18923 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8661 {
                    if slot <= 8659 {
// T4RUPT_PROGRAM.agc:1005
//		EXTEND
// slot 8659
                        if slot <> 8659 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8660 {
// T4RUPT_PROGRAM.agc:1006
//		WAND	DSALMOUT
// slot 8660
                            if slot <> 8660 or instruction <> 1545 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1007
//		TC	Q
// slot 8661
                            if slot <> 8661 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8662 {
// T4RUPT_PROGRAM.agc:1008
//
// T4RUPT_PROGRAM.agc:1009
//ISSWON		EXTEND
// slot 8662
                        if slot <> 8662 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8663 {
// T4RUPT_PROGRAM.agc:1010
//		QXCH	ITEMP6
// slot 8663
                            if slot <> 8663 or instruction <> 9270 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 54, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1011
//		TC	VARALARM		# TELL EVERYONE WHAT CAUSED THE ISS WARNING
// slot 8664
                            if slot <> 8664 or instruction <> 3044 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3044, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 8676 {
            if slot <= 8670 {
                if slot <= 8667 {
                    if slot <= 8665 {
// T4RUPT_PROGRAM.agc:1012
//		CAF	BIT1
// slot 8665
                        if slot <> 8665 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8666 {
// T4RUPT_PROGRAM.agc:1013
//		EXTEND
// slot 8666
                            if slot <> 8666 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1014
//		WOR	DSALMOUT
// slot 8667
                            if slot <> 8667 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8668 {
// T4RUPT_PROGRAM.agc:1015
//		TC	ITEMP6
// slot 8668
                        if slot <> 8668 or instruction <> 54 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 54, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8669 {
// T4RUPT_PROGRAM.agc:1016
//
// T4RUPT_PROGRAM.agc:1017
//CAGESUB		CS	BITS6&15		# SET OUTBITS AND INTERNAL FLAGS FOR
// slot 8669
                            if slot <> 8669 or instruction <> 17923 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1539), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1018
//		EXTEND				# SYSTEM TURN-ON OR CAGE.  DISABLE THE
// slot 8670
                            if slot <> 8670 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8673 {
                    if slot <= 8671 {
// T4RUPT_PROGRAM.agc:1019
//		WAND	CHAN12			# ERROR COUNTER AND REMOVE THE IMU DELAY COMP.
// slot 8671
                        if slot <> 8671 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8672 {
// T4RUPT_PROGRAM.agc:1020
//		CAF	BITS4&5			# SEND ZERO AND COARSE.
// slot 8672
                            if slot <> 8672 or instruction <> 14835 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2547), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1021
//		EXTEND
// slot 8673
                            if slot <> 8673 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8674 {
// T4RUPT_PROGRAM.agc:1022
//		WOR	CHAN12
// slot 8674
                        if slot <> 8674 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8675 {
// T4RUPT_PROGRAM.agc:1023
//
// T4RUPT_PROGRAM.agc:1024
//CAGESUB1	CS	DSPTAB +11D		# TURN ON NO ATT LAMP
// slot 8675
                            if slot <> 8675 or instruction <> 16926 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 542).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1025
//		MASK	OC40010
// slot 8676
                            if slot <> 8676 or instruction <> 30203 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1531), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 8682 {
                if slot <= 8679 {
                    if slot <= 8677 {
// T4RUPT_PROGRAM.agc:1026
//		ADS	DSPTAB +11D
// slot 8677
                        if slot <> 8677 or instruction <> 11806 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8678 {
// T4RUPT_PROGRAM.agc:1027
//
// T4RUPT_PROGRAM.agc:1028
//CAGESUB2	CS	IMODES30		# SET FLAGS TO INDICATE CAGING OR TURN-ON
// slot 8678
                            if slot <> 8678 or instruction <> 17090 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 706).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1029
//		MASK	OCT75			# AND INHIBIT ALL ISS WARNING INFO
// slot 8679
                            if slot <> 8679 or instruction <> 30205 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1533), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8680 {
// T4RUPT_PROGRAM.agc:1030
//		ADS	IMODES30
// slot 8680
                        if slot <> 8680 or instruction <> 11970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8681 {
// T4RUPT_PROGRAM.agc:1031
//
// T4RUPT_PROGRAM.agc:1032
//		CS	IMODES33		# DISABLE DAP AUTO AND HOLD MODES
// slot 8681
                            if slot <> 8681 or instruction <> 17091 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 707).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1033
//		MASK	BIT6
// slot 8682
                            if slot <> 8682 or instruction <> 31206 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                if fixedOperand = 32 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 8685 {
                    if slot <= 8683 {
// T4RUPT_PROGRAM.agc:1034
//		ADS	IMODES33
// slot 8683
                        if slot <> 8683 or instruction <> 11971 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8684 {
// T4RUPT_PROGRAM.agc:1035
//
// T4RUPT_PROGRAM.agc:1036
//		TC	Q
// slot 8684
                            if slot <> 8684 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1037
//
// T4RUPT_PROGRAM.agc:1038
//IMUFAIL		EQUALS	SETISSW
// T4RUPT_PROGRAM.agc:1039
//ICDUFAIL	EQUALS	SETISSW
// T4RUPT_PROGRAM.agc:1040
//
// T4RUPT_PROGRAM.agc:1041
//# Page 181
// T4RUPT_PROGRAM.agc:1042
//# JUMP TABLES AND CONSTANTS.
// T4RUPT_PROGRAM.agc:1043
//
// T4RUPT_PROGRAM.agc:1044
//IFAILJMP	TCF	ITURNON			# CHANNEL 30 DISPATCH.
// slot 8685
                            if slot <> 8685 or instruction <> 5467 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5467, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 8686 {
// T4RUPT_PROGRAM.agc:1045
//		TCF	IMUFAIL
// slot 8686
                        if slot <> 8686 or instruction <> 5571 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5571, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 8687 {
// T4RUPT_PROGRAM.agc:1046
//		TCF	ICDUFAIL
// slot 8687
                            if slot <> 8687 or instruction <> 5571 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5571, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// T4RUPT_PROGRAM.agc:1047
//		TCF	IMUCAGE
// slot 8688
                            if slot <> 8688 or instruction <> 5493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5493, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[500] to agcAotUnit500@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1048
//30RDMSK		OCT	76400			# (BIT 10 NOT SAMPLED HERE).
// slot 8689
    8689, 64000
)).

// bank 06, slots 8690-8698
function agcAotUnit501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8693 {
        if slot <= 8691 {
            if slot <= 8690 {
// T4RUPT_PROGRAM.agc:1049
//		TCF	IMUOP
// slot 8690
                if slot <> 8690 or instruction <> 5522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5522, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1050
//
// T4RUPT_PROGRAM.agc:1051
//C33JMP		TCF	PIPFAIL			# CHANNEL 33 DISPATCH.
// slot 8691
                if slot <> 8691 or instruction <> 5544 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5544, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8692 {
// T4RUPT_PROGRAM.agc:1052
//		TCF	DNTMFAST
// slot 8692
                if slot <> 8692 or instruction <> 5561 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5561, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1053
//		TCF	UPTMFAST
// slot 8693
                if slot <> 8693 or instruction <> 5566 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5566, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8695 {
            if slot <= 8694 {
// T4RUPT_PROGRAM.agc:1054
//
// T4RUPT_PROGRAM.agc:1055
//# SUBROUTINE TO SKIP IF LAMP TEST NOT IN PROGRESS.
// T4RUPT_PROGRAM.agc:1056
//LAMPTEST	CS	IMODES33		# BIT 1 OF IMODES33 = 1 IF LAMP TEST IN
// slot 8694
                if slot <> 8694 or instruction <> 17091 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 707).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1057
//		MASK	BIT1			# PROGRESS.
// slot 8695
                if slot <> 8695 or instruction <> 31211 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8696 {
// T4RUPT_PROGRAM.agc:1058
//		CCS	A
// slot 8696
                if slot <> 8696 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8697 {
// T4RUPT_PROGRAM.agc:1059
//		INCR	Q
// slot 8697
                    if slot <> 8697 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1060
//		TC	Q
// slot 8698
                    if slot <> 8698 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[501] to agcAotUnit501@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1061
//
// T4RUPT_PROGRAM.agc:1062
//33RDMSK		EQUALS	PRIO16
// T4RUPT_PROGRAM.agc:1063
//OC40010		OCT	40010
// slot 8699
    8699, 32784,
// T4RUPT_PROGRAM.agc:1064
//OCT54		OCT	54
// slot 8700
    8700, 88,
// T4RUPT_PROGRAM.agc:1065
//OCT75		OCT	75
// slot 8701
    8701, 122,
// T4RUPT_PROGRAM.agc:1066
//OCT272		OCT	00272
// slot 8702
    8702, 372,
// T4RUPT_PROGRAM.agc:1067
//BITS7&8		OCT	300
// slot 8703
    8703, 384,
// T4RUPT_PROGRAM.agc:1068
//OCT1720		OCT	1720
// slot 8704
    8704, 1952,
// T4RUPT_PROGRAM.agc:1069
//OCT740		OCT	00740
// slot 8705
    8705, 960,
// T4RUPT_PROGRAM.agc:1070
//OCT15000	EQUALS	PRIO15
// T4RUPT_PROGRAM.agc:1071
//OCT77000	OCT	77000
// slot 8706
    8706, 64512,
// T4RUPT_PROGRAM.agc:1072
//BITS6&15	OCT	40040
// slot 8707
    8707, 32832,
// T4RUPT_PROGRAM.agc:1073
//-BIT10		OCT	-1000
// slot 8708
    8708, 64510,
// T4RUPT_PROGRAM.agc:1074
//
// T4RUPT_PROGRAM.agc:1075
//90SECS		DEC	9000
// slot 8709
    8709, 18000
)).

// bank 06, slots 8710-8727
function agcAotUnit502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8718 {
        if slot <= 8713 {
            if slot <= 8711 {
                if slot <= 8710 {
// T4RUPT_PROGRAM.agc:1076
//120MS		=	OCT14			# (DEC12)
// T4RUPT_PROGRAM.agc:1077
//GLOCKOK		EQUALS	RESUME
// T4RUPT_PROGRAM.agc:1078
//
// T4RUPT_PROGRAM.agc:1079
//# Page 182
// T4RUPT_PROGRAM.agc:1080
//# PROGRAM NAME:  RRAUTCHK
// T4RUPT_PROGRAM.agc:1081
//#
// T4RUPT_PROGRAM.agc:1082
//# FUNCITONAL DESCRIPTION:
// T4RUPT_PROGRAM.agc:1083
//# RRAUTCHK IS THE RENDEZFOUS RADAR INBIT MONITOR.  INITIALLY THE RR
// T4RUPT_PROGRAM.agc:1084
//# POWER ON AUTO (CHAN 33 BIT 2) INBIT IS CHECKED.  IF NO CHANGE, THE
// T4RUPT_PROGRAM.agc:1085
//# PROGRAM EXITS TO RRCDUCHK.  IF A CHANGE, RADMOES IS UPDATED
// T4RUPT_PROGRAM.agc:1086
//# AND A CHECK MADE IF RR POWER HAS JUST COME ON.  IF JUST OFF, A CHECK
// T4RUPT_PROGRAM.agc:1087
//# IS MADE TO SEE IF A PROGRAM WAS USING THE RR (STATE BIT 7).  IF NO,
// T4RUPT_PROGRAM.agc:1088
//# THE PROGRAM EXITS TO RRCDUCHK.  IF YES, PROGRAM ALARM 00514
// T4RUPT_PROGRAM.agc:1089
//# IS REQUESTED BEFORE EXITING TO RRCDUCHK.  IF RR POWER HAS JUST COME
// T4RUPT_PROGRAM.agc:1090
//# ON, A CHECK IS MADE TO SEE IF A PROGRAM WAS USING THE RR (STATE BIT 7)
// T4RUPT_PROGRAM.agc:1091
//# SEQUENCE.  IF NO, RADMODES IS UPDATED TO INDICATE RR CDU ZERO AND
// T4RUPT_PROGRAM.agc:1092
//# RR TURN-ON SEQUENCE (BITS 13, 1).  A 10 MILLISECOND WAITLIST CALL
// T4RUPT_PROGRAM.agc:1093
//# IS THEN SET FOR RRTURNON BEFORE THE PROGRAM EXITS TO NORRGMON.
// T4RUPT_PROGRAM.agc:1094
//#
// T4RUPT_PROGRAM.agc:1095
//# CALLING SEQUENCE:
// T4RUPT_PROGRAM.agc:1096
//# T4RUPT EVERY 480 MILLISECONDS
// T4RUPT_PROGRAM.agc:1097
//#
// T4RUPT_PROGRAM.agc:1098
//# ERASABLE INITIALIZATION REQUIRED:
// T4RUPT_PROGRAM.agc:1099
//# RADMODES, STATE.
// T4RUPT_PROGRAM.agc:1100
//#
// T4RUPT_PROGRAM.agc:1101
//# SUBROUTINES CALLED:
// T4RUPT_PROGRAM.agc:1102
//# WAITLIST.
// T4RUPT_PROGRAM.agc:1103
//#
// T4RUPT_PROGRAM.agc:1104
//# JOBS OR TASKS INITIATED:
// T4RUPT_PROGRAM.agc:1105
//# RRTURNON
// T4RUPT_PROGRAM.agc:1106
//#
// T4RUPT_PROGRAM.agc:1107
//# ALARMS:  PROGRAM ALARM 00514 -- RADAR GOES OUT OF AUTO MODE WHILE BEING
// T4RUPT_PROGRAM.agc:1108
//# USED
// T4RUPT_PROGRAM.agc:1109
//#
// T4RUPT_PROGRAM.agc:1110
//# EXIT:  RRCDUCHK, NORRGMON
// T4RUPT_PROGRAM.agc:1111
//
// T4RUPT_PROGRAM.agc:1112
//RRAUTCHK	CA	RADMODES			# SEE IF CHANGE IN RR AUTO MODE BIT.
// slot 8710
                    if slot <> 8710 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1113
//		EXTEND
// slot 8711
                    if slot <> 8711 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8712 {
// T4RUPT_PROGRAM.agc:1114
//		RXOR	CHAN33
// slot 8712
                    if slot <> 8712 or instruction <> 3099 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1115
//		MASK	AUTOMBIT
// slot 8713
                    if slot <> 8713 or instruction <> 31210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8715 {
                if slot <= 8714 {
// T4RUPT_PROGRAM.agc:1116
//		EXTEND
// slot 8714
                    if slot <> 8714 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1117
//		BZF	RRCDUCHK
// slot 8715
                    if slot <> 8715 or instruction <> 5663 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5663, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8716 {
// T4RUPT_PROGRAM.agc:1118
//
// T4RUPT_PROGRAM.agc:1119
//		LXCH	RADMODES			# UPDATE RADMODES.
// slot 8716
                    if slot <> 8716 or instruction <> 9288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 72, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8717 {
// T4RUPT_PROGRAM.agc:1120
//		EXTEND
// slot 8717
                        if slot <> 8717 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1121
//		RXOR	LCHAN
// slot 8718
                        if slot <> 8718 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8722 {
            if slot <= 8720 {
                if slot <= 8719 {
// T4RUPT_PROGRAM.agc:1122
//		MASK	OCT05776			# CLR CONT. DES., REMODE, REPOS, CDUZERO,
// slot 8719
                    if slot <> 8719 or instruction <> 30235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1563), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1123
//		TS	RADMODES			# AND TURNON BITS.
// slot 8720
                    if slot <> 8720 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8721 {
// T4RUPT_PROGRAM.agc:1124
//		MASK	BIT2				# SEE IF JUST ON.
// slot 8721
                    if slot <> 8721 or instruction <> 31210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1125
//		CCS	A
// slot 8722
                    if slot <> 8722 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8724 {
                if slot <= 8723 {
// T4RUPT_PROGRAM.agc:1126
//		TCF	RRCDUCHK -3			# OFF.  GO DISABLE RR CDU ERROR COUNTERS.
// slot 8723
                    if slot <> 8723 or instruction <> 5660 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5660, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1127
//		CA	OCT10001			# SET RRCDUZRO AND TURNON BITS.
// slot 8724
                    if slot <> 8724 or instruction <> 16307 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4019), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8725 {
// T4RUPT_PROGRAM.agc:1128
//		ADS	RADMODES
// slot 8725
                    if slot <> 8725 or instruction <> 11336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8726 {
// T4RUPT_PROGRAM.agc:1129
//
// T4RUPT_PROGRAM.agc:1130
//# Page 183
// T4RUPT_PROGRAM.agc:1131
//		CAF	ONE
// slot 8726
                        if slot <> 8726 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1132
//		TC	WAITLIST
// slot 8727
                        if slot <> 8727 or instruction <> 2691 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2691, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[502] to agcAotUnit502@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1133
//		EBANK=	LOSCOUNT
// T4RUPT_PROGRAM.agc:1134
//		2CADR	RRTURNON
// slot 8728 8729
    8728, 2148, 8729, 43150
)).

// bank 06, slots 8730-8730
function agcAotUnit503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// T4RUPT_PROGRAM.agc:1135
//
// T4RUPT_PROGRAM.agc:1136
//		TCF	NORRGMON
// slot 8730
    if slot <> 8730 or instruction <> 5722 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5722, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[503] to agcAotUnit503@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1137
//
// T4RUPT_PROGRAM.agc:1138
//OCT05776	OCT	5776
// slot 8731
    8731, 6140
)).

// bank 06, slots 8732-8755
function agcAotUnit504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8743 {
        if slot <= 8737 {
            if slot <= 8734 {
                if slot <= 8732 {
// T4RUPT_PROGRAM.agc:1139
//
// T4RUPT_PROGRAM.agc:1140
//# Page 184
// T4RUPT_PROGRAM.agc:1141
//# PROGRAM NAME:	RRCDUCHK
// T4RUPT_PROGRAM.agc:1142
//#
// T4RUPT_PROGRAM.agc:1143
//# FUNCTIONAL DESCRIPTION:
// T4RUPT_PROGRAM.agc:1144
//# RRCDUCHK CHECKS FOR RR CDU FAIL (CHAN 30 BIT 7).  INITIALLY THE
// T4RUPT_PROGRAM.agc:1145
//# RR CDU FAIL BIT IS SAMPLED (CHAN 30 BIT 7).  IF NO CHANGE, THE
// T4RUPT_PROGRAM.agc:1146
//# PROGRAM EXITS TO RRGIMON.  IF A CHANGE, THE RR AUTO MODE
// T4RUPT_PROGRAM.agc:1147
//# (RADMODES BIT 2) BIT IS CHECKED.  IF NOT IN RR AUTO MODE, THE
// T4RUPT_PROGRAM.agc:1148
//# PROGRAM EXITS TO NORRGMO0N.  IF IN AUTO MODE, RADMODES BIT 7
// T4RUPT_PROGRAM.agc:1149
//# (RR CDU OK) IS UPDATED AND IF P-20 IS OPERATING PROGRAM ALARM 00515 IS
// T4RUPT_PROGRAM.agc:1150
//# REQUESTED.  CONTROL IS TRANSFERRED TO SETTRKF TO UPDATE
// T4RUPT_PROGRAM.agc:1151
//# THE TRACKER FAIL LAMP (DSPTAB+11D BIT 8).  CONTROL RETURNS TO
// T4RUPT_PROGRAM.agc:1152
//# RRGIMON.
// T4RUPT_PROGRAM.agc:1153
//#
// T4RUPT_PROGRAM.agc:1154
//# CALLING SEQUENCE:
// T4RUPT_PROGRAM.agc:1155
//# EVERY 480 MILLISECONDS FROM RRAUTCHK (VIA T4RUPT) UNLESS A
// T4RUPT_PROGRAM.agc:1156
//# TURN-ON SEQUENCE HAS JUST BE INITIATED.
// T4RUPT_PROGRAM.agc:1157
//#
// T4RUPT_PROGRAM.agc:1158
//# ERASABLE INITIALIZATION REQUIRED:
// T4RUPT_PROGRAM.agc:1159
//# RADMODES
// T4RUPT_PROGRAM.agc:1160
//#
// T4RUPT_PROGRAM.agc:1161
//# SUBROUTINES CALLED:
// T4RUPT_PROGRAM.agc:1162
//# SETTRKF
// T4RUPT_PROGRAM.agc:1163
//#
// T4RUPT_PROGRAM.agc:1164
//# JOBS OR TASKS INITIATED:
// T4RUPT_PROGRAM.agc:1165
//# NONE
// T4RUPT_PROGRAM.agc:1166
//#
// T4RUPT_PROGRAM.agc:1167
//# ALARMS:
// T4RUPT_PROGRAM.agc:1168
//# TRACKER FAIL
// T4RUPT_PROGRAM.agc:1169
//# PROGRAM ALARM 00515 -- RRCDU FAIL DURING P-20
// T4RUPT_PROGRAM.agc:1170
//#
// T4RUPT_PROGRAM.agc:1171
//# EXIT:
// T4RUPT_PROGRAM.agc:1172
//# RRGIMON, NORRGMON
// T4RUPT_PROGRAM.agc:1173
//
// T4RUPT_PROGRAM.agc:1174
// -3		CS	BIT2
// slot 8732
                    if slot <> 8732 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8733 {
// T4RUPT_PROGRAM.agc:1175
//		EXTEND
// slot 8733
                        if slot <> 8733 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1176
//		WAND	CHAN12			# AT TURNON, DISABLE CDU ERROR COUNTERS.
// slot 8734
                        if slot <> 8734 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8735 {
// T4RUPT_PROGRAM.agc:1177
//
// T4RUPT_PROGRAM.agc:1178
//RRCDUCHK	CA	RADMODES		# LAST SAMPLED BIT IN RADMODES.
// slot 8735
                    if slot <> 8735 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8736 {
// T4RUPT_PROGRAM.agc:1179
//		EXTEND
// slot 8736
                        if slot <> 8736 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1180
//		RXOR	CHAN30
// slot 8737
                        if slot <> 8737 or instruction <> 3096 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 24, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8740 {
                if slot <= 8738 {
// T4RUPT_PROGRAM.agc:1181
//		MASK	RCDUFBIT
// slot 8738
                    if slot <> 8738 or instruction <> 31205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8739 {
// T4RUPT_PROGRAM.agc:1182
//		EXTEND
// slot 8739
                        if slot <> 8739 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1183
//		BZF	RRGIMON
// slot 8740
                        if slot <> 8740 or instruction <> 5689 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5689, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8741 {
// T4RUPT_PROGRAM.agc:1184
//
// T4RUPT_PROGRAM.agc:1185
//		CAF	AUTOMBIT		# IF RR NOT IN AUTO MODE, DON'T CHANGE BIT
// slot 8741
                    if slot <> 8741 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8742 {
// T4RUPT_PROGRAM.agc:1186
//		MASK	RADMODES		# 7 OF RADMODES.  IF THIS WERE NOT DONE,
// slot 8742
                        if slot <> 8742 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1187
//		CCS	A			# THE TRACKER FAIL MIGHT COME ON WHEN
// slot 8743
                        if slot <> 8743 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8749 {
            if slot <= 8746 {
                if slot <= 8744 {
// T4RUPT_PROGRAM.agc:1188
//		TCF	NORRGMON		# JUST READING LR DATA.
// slot 8744
                    if slot <> 8744 or instruction <> 5722 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5722, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8745 {
// T4RUPT_PROGRAM.agc:1189
//
// T4RUPT_PROGRAM.agc:1190
//		CAF	RCDUFBIT		# SET BIT 7 OF RADMODES FOR SETTRKF.
// slot 8745
                        if slot <> 8745 or instruction <> 14821 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1191
//# Page 185
// T4RUPT_PROGRAM.agc:1192
//		LXCH	RADMODES		# UPDATE RADMODES.
// slot 8746
                        if slot <> 8746 or instruction <> 9288 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 72, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8747 {
// T4RUPT_PROGRAM.agc:1193
//		EXTEND
// slot 8747
                    if slot <> 8747 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8748 {
// T4RUPT_PROGRAM.agc:1194
//		RXOR	L
// slot 8748
                        if slot <> 8748 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1195
//		TS	RADMODES
// slot 8749
                        if slot <> 8749 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8752 {
                if slot <= 8750 {
// T4RUPT_PROGRAM.agc:1196
//
// T4RUPT_PROGRAM.agc:1197
//		CA	RADMODES		# DID RR CDU FAIL
// slot 8750
                    if slot <> 8750 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8751 {
// T4RUPT_PROGRAM.agc:1198
//		MASK	RCDUFBIT
// slot 8751
                        if slot <> 8751 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1199
//		CCS	A
// slot 8752
                        if slot <> 8752 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8753 {
// T4RUPT_PROGRAM.agc:1200
//		TCF	TRKFLCDU		# NO
// slot 8753
                    if slot <> 8753 or instruction <> 5688 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5688, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8754 {
// T4RUPT_PROGRAM.agc:1201
//		CS	FLAGWRD0		# RNDVFLG P20 OR P22 OPERATING
// slot 8754
                        if slot <> 8754 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1202
//		MASK	RNDVZBIT
// slot 8755
                        if slot <> 8755 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[504] to agcAotUnit504@.

// bank 06, slots 8756-8758
function agcAotUnit505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8756 {
// T4RUPT_PROGRAM.agc:1203
//		CCS	A
// slot 8756
        if slot <> 8756 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8757 {
// T4RUPT_PROGRAM.agc:1204
//		TCF	TRKFLCDU		# NO
// slot 8757
            if slot <> 8757 or instruction <> 5688 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5688, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// T4RUPT_PROGRAM.agc:1205
//		TC	ALARM			# YES
// slot 8758
            if slot <> 8758 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[505] to agcAotUnit505@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1206
//		OCT	00515
// slot 8759
    8759, 666
)).

// bank 06, slots 8760-8777
function agcAotUnit506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8768 {
        if slot <= 8763 {
            if slot <= 8761 {
                if slot <= 8760 {
// T4RUPT_PROGRAM.agc:1207
//TRKFLCDU	TC	SETTRKF			# UPDATE TRAKER FAIL LAMP ON DSKY.
// slot 8760
                    if slot <> 8760 or instruction <> 2420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2420, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1208
//
// T4RUPT_PROGRAM.agc:1209
//# Page 186
// T4RUPT_PROGRAM.agc:1210
//# PROGRAM NAME:  RRGIMON
// T4RUPT_PROGRAM.agc:1211
//#
// T4RUPT_PROGRAM.agc:1212
//# FUNCTIONAL DESCRIPTION:
// T4RUPT_PROGRAM.agc:1213
//# RRGIMON IS THE RR GIMBAL LIMIT MONITOR.  INITIALLY THE FOLLOWING IS
// T4RUPT_PROGRAM.agc:1214
//# CHECKED:  REMOD, RR CDU'S BEING ZEROED, REPOSITION, AND RR
// T4RUPT_PROGRAM.agc:1215
//# NOT IN AUTO MODE (RADMODES BITS 14, 13, 11, 2).  IF ANY OF THESE
// T4RUPT_PROGRAM.agc:1216
//# EXIST THE PROGRAM EXITS TO GPMATRIX.  IF NONE ARE PRESENT RRLIMCHK
// T4RUPT_PROGRAM.agc:1217
//# IS CALLED TO SEE IF THE PRESENT RR CDU ANGLES (OPTY, OPTX) ARE WITHIN
// T4RUPT_PROGRAM.agc:1218
//# THE LIMITS OF THE CURRENT MODE.  IF WITHIN LIMITS, THE PROGRAM EXITS
// T4RUPT_PROGRAM.agc:1219
//# TO NORRGMON.  IF NOT WITHIN LIMITS, THE REPOSITION FLAG (RADMODES
// T4RUPT_PROGRAM.agc:1220
//# BIT 11) IS SET, THE RR AUTO TRACKER AND RR ERROR COUNTER
// T4RUPT_PROGRAM.agc:1221
//# (CHAN 12 BITS 14, 2) ARE DISABLED, AND A 20 MILLISECOND WAITLIST
// T4RUPT_PROGRAM.agc:1222
//# CALL IS SET FOR DORREPOS AFTER WHICH THE PROGRAM EXITS TO NORRGMON.
// T4RUPT_PROGRAM.agc:1223
//#
// T4RUPT_PROGRAM.agc:1224
//# CALLING SEQUENCE:
// T4RUPT_PROGRAM.agc:1225
//# EVERY 480 MILLISECONDS FROM RRCDUCHK (VIA T4RUPT) UNLESS TURN-ON
// T4RUPT_PROGRAM.agc:1226
//# HAS JUST BEEN INITIATED VIA RRAUTCHK OR IF THERE HAS BEEN A CHANGE IN
// T4RUPT_PROGRAM.agc:1227
//# THE RR CDU FAIL BIT (CHAN 30 BIT 7) AND THE RR IS NOT IN THE AUTO MODE
// T4RUPT_PROGRAM.agc:1228
//# (RADMODES BIT 2).
// T4RUPT_PROGRAM.agc:1229
//#
// T4RUPT_PROGRAM.agc:1230
//# ERASABLE INITIALZATION:  RADMODES
// T4RUPT_PROGRAM.agc:1231
//#
// T4RUPT_PROGRAM.agc:1232
//# SUBROUTINES CALLED:
// T4RUPT_PROGRAM.agc:1233
//# RRLIMCHK, WAITLIST
// T4RUPT_PROGRAM.agc:1234
//#
// T4RUPT_PROGRAM.agc:1235
//# JOBS OR TASKS INITIATED:
// T4RUPT_PROGRAM.agc:1236
//# DORREPOS
// T4RUPT_PROGRAM.agc:1237
//#
// T4RUPT_PROGRAM.agc:1238
//# ALARMS:
// T4RUPT_PROGRAM.agc:1239
//# NONE
// T4RUPT_PROGRAM.agc:1240
//#
// T4RUPT_PROGRAM.agc:1241
//# EXIT:
// T4RUPT_PROGRAM.agc:1242
//# NORRGMON
// T4RUPT_PROGRAM.agc:1243
//
// T4RUPT_PROGRAM.agc:1244
//RRGIMON		CAE	FLAGWRD5			# IS NO ANGLE MONITOR FLAG SET
// slot 8761
                    if slot <> 8761 or instruction <> 12353 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8762 {
// T4RUPT_PROGRAM.agc:1245
//		MASK	NORRMBIT
// slot 8762
                    if slot <> 8762 or instruction <> 31208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        if fixedOperand = 8 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1246
//		CCS	A
// slot 8763
                    if slot <> 8763 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8765 {
                if slot <= 8764 {
// T4RUPT_PROGRAM.agc:1247
//		TCF	NORRGMON			# YES -- SKIP LIMIT CHECK
// slot 8764
                    if slot <> 8764 or instruction <> 5722 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5722, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1248
//		CS	FLAGWRD7			# IS SERVICER RUNNING?
// slot 8765
                    if slot <> 8765 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8766 {
// T4RUPT_PROGRAM.agc:1249
//		MASK	AVEGFBIT
// slot 8766
                    if slot <> 8766 or instruction <> 31207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        if fixedOperand = 16 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8767 {
// T4RUPT_PROGRAM.agc:1250
//		CCS	A
// slot 8767
                        if slot <> 8767 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1251
//		TCF	+5				# NO. DO R25
// slot 8768
                        if slot <> 8768 or instruction <> 5701 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5701, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8772 {
            if slot <= 8770 {
                if slot <= 8769 {
// T4RUPT_PROGRAM.agc:1252
//		CA	FLAGWRD6			# YES. IS MUNFLAG SET?
// slot 8769
                    if slot <> 8769 or instruction <> 12354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1253
//		MASK	MUNFLBIT
// slot 8770
                    if slot <> 8770 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        if fixedOperand = 128 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8771 {
// T4RUPT_PROGRAM.agc:1254
//		CCS	A
// slot 8771
                    if slot <> 8771 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1255
//		TCF	NORRGMON			# YES. DON'T DO R25
// slot 8772
                    if slot <> 8772 or instruction <> 5722 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5722, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8774 {
                if slot <= 8773 {
// T4RUPT_PROGRAM.agc:1256
// +5		CAF	OCT32002			# INHIBIT BY REMODE, ZEROING, MONITOR.
// slot 8773
                    if slot <> 8773 or instruction <> 13911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1623), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1257
//		MASK	RADMODES			# OR RR NOT IN AUTO.
// slot 8774
                    if slot <> 8774 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8775 {
// T4RUPT_PROGRAM.agc:1258
//		CCS	A
// slot 8775
                    if slot <> 8775 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8776 {
// T4RUPT_PROGRAM.agc:1259
//		TCF	NORRGMON
// slot 8776
                        if slot <> 8776 or instruction <> 5722 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5722, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1260
//# Page 187
// T4RUPT_PROGRAM.agc:1261
//		TC	RRLIMCHK			# SET IF ANGLES IN LIMITS.
// slot 8777
                        if slot <> 8777 or instruction <> 2387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[506] to agcAotUnit506@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1262
//		ADRES	CDUT
// slot 8778
    8778, 58
)).

// bank 06, slots 8779-8787
function agcAotUnit507 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8782 {
        if slot <= 8780 {
            if slot <= 8779 {
// T4RUPT_PROGRAM.agc:1263
//
// T4RUPT_PROGRAM.agc:1264
//		TCF	MONREPOS
// slot 8779
                if slot <> 8779 or instruction <> 5709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5709, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1265
//
// T4RUPT_PROGRAM.agc:1266
//		TCF	NORRGMON			# (ADDITIONAL CODING MAY GO HERE).
// slot 8780
                if slot <> 8780 or instruction <> 5722 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5722, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8781 {
// T4RUPT_PROGRAM.agc:1267
//
// T4RUPT_PROGRAM.agc:1268
//MONREPOS	CAF	REPOSBIT			# SET FLAG TO SHOW REPOSITION IN PROGRESS.
// slot 8781
                if slot <> 8781 or instruction <> 14817 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1269
//		ADS	RADMODES
// slot 8782
                if slot <> 8782 or instruction <> 11336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8784 {
            if slot <= 8783 {
// T4RUPT_PROGRAM.agc:1270
//
// T4RUPT_PROGRAM.agc:1271
//		CS	OCT20002			# DISABLE TRACKER AND ERROR COUNTER.
// slot 8783
                if slot <> 8783 or instruction <> 18008 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1624), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// T4RUPT_PROGRAM.agc:1272
//		EXTEND
// slot 8784
                if slot <> 8784 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8785 {
// T4RUPT_PROGRAM.agc:1273
//		WAND	CHAN12
// slot 8785
                if slot <> 8785 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8786 {
// T4RUPT_PROGRAM.agc:1274
//
// T4RUPT_PROGRAM.agc:1275
//		CAF	TWO
// slot 8786
                    if slot <> 8786 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1276
//		TC	WAITLIST
// slot 8787
                    if slot <> 8787 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[507] to agcAotUnit507@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1277
//		EBANK=	LOSCOUNT
// T4RUPT_PROGRAM.agc:1278
//		2CADR	DORREPOS
// slot 8788 8789
    8788, 2222, 8789, 43150
)).

// bank 06, slots 8790-8790
function agcAotUnit508 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// T4RUPT_PROGRAM.agc:1279
//
// T4RUPT_PROGRAM.agc:1280
//		TCF	NORRGMON
// slot 8790
    if slot <> 8790 or instruction <> 5722 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5722, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[508] to agcAotUnit508@.

agcAotInstallSourceRope(list(
// T4RUPT_PROGRAM.agc:1281
//
// T4RUPT_PROGRAM.agc:1282
//OCT32002	OCT	32002
// slot 8791
    8791, 26628,
// T4RUPT_PROGRAM.agc:1283
//OCT20002	OCT	20002
// slot 8792
    8792, 16388,
// T4RUPT_PROGRAM.agc:1284
//OCT02100	OCT	02100				# P20, P22 MASK BITS.
// slot 8793
    8793, 2176
)).

// bank 06, slots 8794-8813
function agcAotUnit509 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8803 {
        if slot <= 8798 {
            if slot <= 8795 {
                if slot <= 8794 {
// T4RUPT_PROGRAM.agc:1285
//
// T4RUPT_PROGRAM.agc:1286
//# Page 188
// T4RUPT_PROGRAM.agc:1287
//# PROGRAM NAME:  GPMATRIX (DAPT4S) MCD. NO. 2 DATE: OCTOBER 27, 1966
// T4RUPT_PROGRAM.agc:1288
//#
// T4RUPT_PROGRAM.agc:1289
//# AUTHOR:  ADDLELSTON KERMAN (ADAMS ASSOCIATES)
// T4RUPT_PROGRAM.agc:1290
//#
// T4RUPT_PROGRAM.agc:1291
//# MODIFIED:  7FEB. 1968 BY WEISSMAN KERMAN TO DELETE COMPUTATION OF MR12 AND MR13, WHICH ARE NO LONGER REQUIRED.
// T4RUPT_PROGRAM.agc:1292
//#
// T4RUPT_PROGRAM.agc:1293
//# THIS PROGRAM CALCULATES ALL THE SINGLE-PRECISION MATRIX ELEMENTS WHICH ARE USED BY LEM DAP TO TRANSFORM VECTORS
// T4RUPT_PROGRAM.agc:1294
//# FROM GIMBAL TO PILOT (BODY) AXES AND BACK AGAIN.  THESE ELEMENTS ARE USED EXCLUSIVELY BY BASIC LANGUAGE ROUTINES
// T4RUPT_PROGRAM.agc:1295
//# AND THEREFORE ARE NOT ARRAYED FOR USE BY INTERPRETIVE PROGRAMS.
// T4RUPT_PROGRAM.agc:1296
//#
// T4RUPT_PROGRAM.agc:1297
//# CALLING SEQUENCE:  GPMATRIX IS TRANSFERRED TO FROM DAPT4S AND IS THUS EXECUTED 4 TIMES A SECOND BY T4RUPT.
// T4RUPT_PROGRAM.agc:1298
//# DAPT4S IS LISTED IN T4JUMP TABLE TWICE EXPLICITLY AND ALSO OCCURS AFTER RRAUTCHK (WHICH IS ALSO LISTED TWICE).
// T4RUPT_PROGRAM.agc:1299
//#
// T4RUPT_PROGRAM.agc:1300
//# SUBROUTINES CALLED: SPSIN, SPCOS.
// T4RUPT_PROGRAM.agc:1301
//#
// T4RUPT_PROGRAM.agc:1302
//# NORMAL EXIT MODE:  TCF RESUME
// T4RUPT_PROGRAM.agc:1303
//#
// T4RUPT_PROGRAM.agc:1304
//# ALARM AND ABORT MODES:  NONE.
// T4RUPT_PROGRAM.agc:1305
//#
// T4RUPT_PROGRAM.agc:1306
//# INPUT: CDUX, CDUY, CDUZ.
// T4RUPT_PROGRAM.agc:1307
//#
// T4RUPT_PROGRAM.agc:1308
//# OUTPUT:  M11, M21, M32, M22, M32.
// T4RUPT_PROGRAM.agc:1309
//#
// T4RUPT_PROGRAM.agc:1310
//# AOG = CDUX, AIG = CDUY, AMG = CDUZ: MNEMONIC IS : OIM = XYZ
// T4RUPT_PROGRAM.agc:1311
//#
// T4RUPT_PROGRAM.agc:1312
//#		*	*	SING(MG)		0			1	*
// T4RUPT_PROGRAM.agc:1313
//#		M   =	*	COS(MG)COS(OG)		SIN(OG)			0	*
// T4RUPT_PROGRAM.agc:1314
//#		 GP	*	-COS(MG)SIN(OG)		COS(OG)			0	*
// T4RUPT_PROGRAM.agc:1315
//#
// T4RUPT_PROGRAM.agc:1316
//#		*	*	0			COS(OG)/COS(MG)		-SIN(OG)/COS(MG)	*
// T4RUPT_PROGRAM.agc:1317
//#		M   =	*	0			SIN(OG)			COS(OG)			*
// T4RUPT_PROGRAM.agc:1318
//#		 PG	*	1			-SIN(MG)COS(OG)/COS(MG)	SIN(MG)SIN(OG)/COS(MG)	*
// T4RUPT_PROGRAM.agc:1319
//
// T4RUPT_PROGRAM.agc:1320
//		EBANK=	M11
// T4RUPT_PROGRAM.agc:1321
//DAPT4S		EQUALS	GPMATRIX
// T4RUPT_PROGRAM.agc:1322
//
// T4RUPT_PROGRAM.agc:1323
//# T4RUPT DAP LOGIC:
// T4RUPT_PROGRAM.agc:1324
//
// T4RUPT_PROGRAM.agc:1325
//GPMATRIX	CAE	CDUZ			# SINGLE ENTRY POINT
// slot 8794
                    if slot <> 8794 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1326
//		TC	SPSIN			# SIN(CDUZ) = SIN(MG)
// slot 8795
                    if slot <> 8795 or instruction <> 2587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8796 {
// T4RUPT_PROGRAM.agc:1327
//		TS	M11			# SCALED AT 1
// slot 8796
                    if slot <> 8796 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8797 {
// T4RUPT_PROGRAM.agc:1328
//
// T4RUPT_PROGRAM.agc:1329
//		CAE	CDUZ
// slot 8797
                        if slot <> 8797 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 28).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1330
//		TC	SPCOS			# COS(CDUZ) = COS(MG)
// slot 8798
                        if slot <> 8798 or instruction <> 2586 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2586, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8800 {
                if slot <= 8799 {
// T4RUPT_PROGRAM.agc:1331
//		TS	COSMG			# SCALED AT 1 (ONLY A FACTOR)
// slot 8799
                    if slot <> 8799 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1332
//
// T4RUPT_PROGRAM.agc:1333
//		CAE	CDUX
// slot 8800
                    if slot <> 8800 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8801 {
// T4RUPT_PROGRAM.agc:1334
//		TC	SPSIN			# SIN(CDUX) = SIN(OG)
// slot 8801
                    if slot <> 8801 or instruction <> 2587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8802 {
// T4RUPT_PROGRAM.agc:1335
//		TS	M22			# SCALED AT 1 (ALSO IS MR22)
// slot 8802
                        if slot <> 8802 or instruction <> 23311 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23311, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1336
//
// T4RUPT_PROGRAM.agc:1337
//		CS	M22
// slot 8803
                        if slot <> 8803 or instruction <> 17167 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 783).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8808 {
            if slot <= 8805 {
                if slot <= 8804 {
// T4RUPT_PROGRAM.agc:1338
//# Page 189
// T4RUPT_PROGRAM.agc:1339
//		EXTEND
// slot 8804
                    if slot <> 8804 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1340
//		MP	COSMG			# -SIN(OG)COS(MG)
// slot 8805
                    if slot <> 8805 or instruction <> 28721 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 49, readEffective:call(words, 49)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8806 {
// T4RUPT_PROGRAM.agc:1341
//		TS	M31			# SCALED AT 1
// slot 8806
                    if slot <> 8806 or instruction <> 23310 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23310, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8807 {
// T4RUPT_PROGRAM.agc:1342
//
// T4RUPT_PROGRAM.agc:1343
//		CAE	CDUX
// slot 8807
                        if slot <> 8807 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1344
//		TC	SPCOS			# COS(CDUX) = COS(OG)
// slot 8808
                        if slot <> 8808 or instruction <> 2586 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2586, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8810 {
                if slot <= 8809 {
// T4RUPT_PROGRAM.agc:1345
//		TS	M32			# SCALED AT 1 (ALSO IS MR23)
// slot 8809
                    if slot <> 8809 or instruction <> 23312 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23312, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T4RUPT_PROGRAM.agc:1346
//
// T4RUPT_PROGRAM.agc:1347
//		EXTEND
// slot 8810
                    if slot <> 8810 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8811 {
// T4RUPT_PROGRAM.agc:1348
//		MP	COSMG			# COS(OG)COS(MG)
// slot 8811
                    if slot <> 8811 or instruction <> 28721 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 49, readEffective:call(words, 49)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8812 {
// T4RUPT_PROGRAM.agc:1349
//		TS	M21			# SCALED AT 1
// slot 8812
                        if slot <> 8812 or instruction <> 23309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23309, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T4RUPT_PROGRAM.agc:1350
//
// T4RUPT_PROGRAM.agc:1351
//		TC	RESUME
// slot 8813
                        if slot <> 8813 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[509] to agcAotUnit509@.

// no code for the lines below
// T4RUPT_PROGRAM.agc:1352
//
// T4RUPT_PROGRAM.agc:1353
//NORRGMON	EQUALS	DAPT4S
// T4RUPT_PROGRAM.agc:1354
//ENDDAPT4	EQUALS	RESUME
