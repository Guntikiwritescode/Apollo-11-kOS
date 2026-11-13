// PORT: Original source unit IMU_PERFORMANCE_TESTS_4.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 34112–34114.
function agcAotUnit2262 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34112 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:2
//# Filename:	IMU_PERFORMANCE_TESTS_4.agc
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:9
//# Pages:	382-389
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:13
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:22
//# actually created.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:23
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:25
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:28
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:29
//# Page 382
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:30
//# PROGRAM --	IMU PERFORMANCE TESTS 4
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:31
//# DATE --	NOV 15, 1966
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:32
//# BY --		GEORGE SCHMIDT IL7-146 EXT 1126
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:33
//# MOD NO-ZERO
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:34
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:35
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:36
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:37
//# THIS SECTION CONSISTS OF THE FILTER FOR THE GYRO DRIFT TESTS.  NO COMPASS
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:38
//# IS DONE IN LEM.  FOR A DESCRIPTION OF THE FILTER SEE E-1973.  THIS
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:39
//# SECTION IS ENTERED FROM IMU 2.  IT RETURNS THERE AT END OF TEST.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:40
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:41
//# EARTHR,OGC ZERO,ERTHRVSE
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:42
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:43
//# NORMAL EXIT
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:44
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:45
//# LENGTHOT GOES TO ZERO -- RETURN TO IMU PERF TESTS 2 CONTROL
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:46
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:47
//# ALARMS
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:48
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:49
//# 1600	OVERFLOW IN DRIFT TEST
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:50
//# 1601	BAD IMU MODING IN ANY ROUTINE THAT USES IMUSTALL
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:51
//#	OUTPUT
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:52
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:53
//# FLASHING DISPLAY OF RESULTS -- CONTROLLED IN IMU PERF TESTS 2
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:54
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:55
//# DEBRIS
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:56
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:57
//# ALL CENTRALS -- ALL OF EBANK XSM
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:58
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:59
//# Page 383
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:60
//		BANK	33
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:61
//		SETLOC	IMU4
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:62
//		BANK
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:63
//		COUNT*	$$/P07
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:64
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:65
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:66
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:67
//ESTIMS		INHINT
// PORT: Fixed ROM slots 34112.
        if slot <> 34112 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34113 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:68
//		CAE	1SECXT
// PORT: Fixed ROM slots 34113.
            if slot <> 34113 or instruction <> 13178 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 890).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:69
//		TC	TWIDDLE
// PORT: Fixed ROM slots 34114.
            if slot <> 34114 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2262] to agcAotUnit2262@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:70
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:71
//		ADRES	ALLOOP
// PORT: Fixed ROM slots 34115.
    34115, 2748
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34116–34125.
function agcAotUnit2263 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34120 {
        if slot <= 34117 {
            if slot <= 34116 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:72
//		CAF	ZERO		# ZERO THE PIPAS
// PORT: Fixed ROM slots 34116.
                if slot <> 34116 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:73
//		TS	PIPAX
// PORT: Fixed ROM slots 34117.
                if slot <> 34117 or instruction <> 22559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34118 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:74
//		TS	PIPAY
// PORT: Fixed ROM slots 34118.
                if slot <> 34118 or instruction <> 22560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34119 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:75
//		TS	PIPAZ
// PORT: Fixed ROM slots 34119.
                    if slot <> 34119 or instruction <> 22561 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22561, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:76
//		RELINT
// PORT: Fixed ROM slots 34120.
                    if slot <> 34120 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34122 {
            if slot <= 34121 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:77
//		CA	77DECML
// PORT: Fixed ROM slots 34121.
                if slot <> 34121 or instruction <> 13885 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1597), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:78
//		TS	ZERONDX
// PORT: Fixed ROM slots 34122.
                if slot <> 34122 or instruction <> 23417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34123 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:79
//		CA	ALXXXZ
// PORT: Fixed ROM slots 34123.
                if slot <> 34123 or instruction <> 13886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1598), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34124 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:80
//		TC	ZEROING
// PORT: Fixed ROM slots 34124.
                    if slot <> 34124 or instruction <> 1271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:81
//		TC	INTPRET
// PORT: Fixed ROM slots 34125.
                    if slot <> 34125 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2263] to agcAotUnit2263@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:82
//		SLOAD
// PORT: Fixed ROM slots 34126.
    34126, 65466,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:83
//			SCHZEROS
// PORT: Fixed ROM slots 34127.
    34127, 31838,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:84
//		STOVL	GCOMPSW -1
// PORT: Fixed ROM slots 34128.
    34128, 22142,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:85
//			INTVAL 	+2
// PORT: Fixed ROM slots 34129.
    34129, 31856,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:86
//		STOVL	ALX1S
// PORT: Fixed ROM slots 34130.
    34130, 23114,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:87
//			SCHZEROS
// PORT: Fixed ROM slots 34131.
    34131, 31838,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:88
//		STORE	DELVX
// PORT: Fixed ROM slots 34132.
    34132, 426,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:89
//		STORE	GCOMP
// PORT: Fixed ROM slots 34133.
    34133, 1652,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:90
//		SLOAD
// PORT: Fixed ROM slots 34134.
    34134, 65466,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:91
//			TORQNDX
// PORT: Fixed ROM slots 34135.
    34135, 2626,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:92
//		DCOMP	BMN
// PORT: Fixed ROM slots 34136.
    34136, 41084,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:93
//			VERTSKIP
// PORT: Fixed ROM slots 34137.
    34137, 64184,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:94
//		CALL
// PORT: Fixed ROM slots 34138.
    34138, 65320,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:95
//			ERTHRVSE
// PORT: Fixed ROM slots 34139.
    34139, 64002,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:96
//VERTSKIP	EXIT
// PORT: Fixed ROM slots 34140.
    34140, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34141–34159.
function agcAotUnit2264 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34149 {
        if slot <= 34144 {
            if slot <= 34142 {
                if slot <= 34141 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:97
//		TC	SLEEPIE +1
// PORT: Fixed ROM slots 34141.
                    if slot <> 34141 or instruction <> 1565 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1565, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:98
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:99
//# Page 384
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:100
//ALLOOP		CA	OVFLOWCK
// PORT: Fixed ROM slots 34142.
                    if slot <> 34142 or instruction <> 13182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 894).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34143 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:101
//		EXTEND
// PORT: Fixed ROM slots 34143.
                    if slot <> 34143 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:102
//		BZF	+2
// PORT: Fixed ROM slots 34144.
                    if slot <> 34144 or instruction <> 5474 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5474, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34146 {
                if slot <= 34145 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:103
//		TC	TASKOVER
// PORT: Fixed ROM slots 34145.
                    if slot <> 34145 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:104
//		CCS	ALTIM
// PORT: Fixed ROM slots 34146.
                    if slot <> 34146 or instruction <> 4952 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 856).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34147 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:105
//		CA	A		# SHOULD NEVER HIT THIS LOCATION
// PORT: Fixed ROM slots 34147.
                    if slot <> 34147 or instruction <> 12288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34148 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:106
//		TS	ALTIMS
// PORT: Fixed ROM slots 34148.
                        if slot <> 34148 or instruction <> 23385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23385, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:107
//		CS	A
// PORT: Fixed ROM slots 34149.
                        if slot <> 34149 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 34154 {
            if slot <= 34151 {
                if slot <= 34150 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:108
//		TS	ALTIM
// PORT: Fixed ROM slots 34150.
                    if slot <> 34150 or instruction <> 23384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:109
//		CS	ONE
// PORT: Fixed ROM slots 34151.
                    if slot <> 34151 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34152 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:110
//		AD	GEOCOMPS
// PORT: Fixed ROM slots 34152.
                    if slot <> 34152 or instruction <> 25458 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 882).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34153 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:111
//		EXTEND
// PORT: Fixed ROM slots 34153.
                        if slot <> 34153 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:112
//		BZF	+4
// PORT: Fixed ROM slots 34154.
                        if slot <> 34154 or instruction <> 5486 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5486, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 34156 {
                if slot <= 34155 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:113
//		CA	LENGTHOT
// PORT: Fixed ROM slots 34155.
                    if slot <> 34155 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:114
//		EXTEND
// PORT: Fixed ROM slots 34156.
                    if slot <> 34156 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34157 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:115
//		BZMF	+5
// PORT: Fixed ROM slots 34157.
                    if slot <> 34157 or instruction <> 25970 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25970, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34158 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:116
//		CAE	1SECXT
// PORT: Fixed ROM slots 34158.
                        if slot <> 34158 or instruction <> 13178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 890).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:117
//		TC	TWIDDLE
// PORT: Fixed ROM slots 34159.
                        if slot <> 34159 or instruction <> 2683 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2683, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2264] to agcAotUnit2264@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:118
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:119
//		ADRES	ALLOOP
// PORT: Fixed ROM slots 34160.
    34160, 2748
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34161–34171.
function agcAotUnit2265 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34165 {
        if slot <= 34162 {
            if slot <= 34161 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:120
//		CAF	ZERO
// PORT: Fixed ROM slots 34161.
                if slot <> 34161 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:121
//		XCH	PIPAX
// PORT: Fixed ROM slots 34162.
                if slot <> 34162 or instruction <> 23583 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 31, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34163 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:122
//		TS	DELVX
// PORT: Fixed ROM slots 34163.
                if slot <> 34163 or instruction <> 22740 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22740, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34164 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:123
//		CAF	ZERO
// PORT: Fixed ROM slots 34164.
                    if slot <> 34164 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:124
//		XCH	PIPAY
// PORT: Fixed ROM slots 34165.
                    if slot <> 34165 or instruction <> 23584 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 32, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34168 {
            if slot <= 34166 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:125
//		TS	DELVY
// PORT: Fixed ROM slots 34166.
                if slot <> 34166 or instruction <> 22742 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22742, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34167 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:126
//		CAF	ZERO
// PORT: Fixed ROM slots 34167.
                    if slot <> 34167 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:127
//		XCH	PIPAZ
// PORT: Fixed ROM slots 34168.
                    if slot <> 34168 or instruction <> 23585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 33, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34169 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:128
//		TS	DELVZ
// PORT: Fixed ROM slots 34169.
                if slot <> 34169 or instruction <> 22744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22744, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34170 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:129
//SPECSTS		CAF	PRIO20
// PORT: Fixed ROM slots 34170.
                    if slot <> 34170 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:130
//		TC	FINDVAC
// PORT: Fixed ROM slots 34171.
                    if slot <> 34171 or instruction <> 2629 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2629, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2265] to agcAotUnit2265@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:131
//		EBANK=	XSM
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:132
//		2CADR	ALFLT		# START THE JOB
// PORT: Fixed ROM slots 34172 34173.
    34172, 2814, 34173, 63594
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34174–34178.
function agcAotUnit2266 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34175 {
        if slot <= 34174 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:133
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:134
//		TC	TASKOVER
// PORT: Fixed ROM slots 34174.
            if slot <> 34174 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:135
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:136
//# Page 385
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:137
//ALFLT		CCS	GEOCOMPS
// PORT: Fixed ROM slots 34175.
            if slot <> 34175 or instruction <> 4978 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 882).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34176 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:138
//		TC	+2
// PORT: Fixed ROM slots 34176.
            if slot <> 34176 or instruction <> 1410 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1410, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34177 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:139
//		TC	NORMLOP
// PORT: Fixed ROM slots 34177.
                if slot <> 34177 or instruction <> 1412 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1412, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:140
//		TC	BANKCALL
// PORT: Fixed ROM slots 34178.
                if slot <> 34178 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2266] to agcAotUnit2266@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:141
//		CADR	1/PIPA
// PORT: Fixed ROM slots 34179.
    34179, 13670
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34180–34180.
function agcAotUnit2267 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:142
//NORMLOP		TC	INTPRET
// PORT: Fixed ROM slots 34180.
    if slot <> 34180 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2267] to agcAotUnit2267@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:143
//		DLOAD
// PORT: Fixed ROM slots 34181.
    34181, 65482,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:144
//			INTVAL
// PORT: Fixed ROM slots 34182.
    34182, 31852,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:145
//		STOVL	S1
// PORT: Fixed ROM slots 34183.
    34183, 20562,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:146
//			DELVX
// PORT: Fixed ROM slots 34184.
    34184, 426,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:147
//		VXM	VSL1
// PORT: Fixed ROM slots 34185.
    34185, 64138,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:148
//			XSM
// PORT: Fixed ROM slots 34186.
    34186, 2886,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:149
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 34187.
    34187, 48842,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:150
//			MPAC +3
// PORT: Fixed ROM slots 34188.
    34188, 224,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:151
//		STODL	DPIPAY
// PORT: Fixed ROM slots 34189.
    34189, 15014,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:152
//			MPAC +5
// PORT: Fixed ROM slots 34190.
    34190, 228,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:153
//		STORE	DPIPAZ
// PORT: Fixed ROM slots 34191.
    34191, 2734,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:154
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:155
//		SETPD	AXT,1
// PORT: Fixed ROM slots 34192.
    34192, 63490,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:156
//			0
// PORT: Fixed ROM slots 34193.
    34193, 2,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:157
//			8D
// PORT: Fixed ROM slots 34194.
    34194, 16,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:158
//		SLOAD	DCOMP
// PORT: Fixed ROM slots 34195.
    34195, 48826,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:159
//			GEOCOMPS
// PORT: Fixed ROM slots 34196.
    34196, 2790,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:160
//		BMN
// PORT: Fixed ROM slots 34197.
    34197, 65344,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:161
//			PERFERAS
// PORT: Fixed ROM slots 34198.
    34198, 64500,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:162
//ALCGKK		SLOAD	BMN
// PORT: Fixed ROM slots 34199.
    34199, 41146,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:163
//			ALTIMS
// PORT: Fixed ROM slots 34200.
    34200, 2740,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:164
//			ALFLT3
// PORT: Fixed ROM slots 34201.
    34201, 64328,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:165
//ALKCG		AXT,2	LXA,1		# LOADS SLOPES AND TIME CONSTANTS AT RQST
// PORT: Fixed ROM slots 34202.
    34202, 59640,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:166
//			12D
// PORT: Fixed ROM slots 34203.
    34203, 24,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:167
//			ALX1S
// PORT: Fixed ROM slots 34204.
    34204, 2632,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:168
//ALKCG2		DLOAD*	INCR,1
// PORT: Fixed ROM slots 34205.
    34205, 51398,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:169
//			ALFDK 	+144D,1
// PORT: Fixed ROM slots 34206.
    34206, 2374,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:170
//		DEC	-2
// PORT: Fixed ROM slots 34207.
    34207, 65530,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:171
//		STORE	ALDK 	+10D,2
// PORT: Fixed ROM slots 34208.
    34208, 10954,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:172
//		TIX,2	SXA,1
// PORT: Fixed ROM slots 34209.
    34209, 55432,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:173
//			ALKCG2
// PORT: Fixed ROM slots 34210.
    34210, 64314,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:174
//			ALX1S
// PORT: Fixed ROM slots 34211.
    34211, 2632,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:175
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:176
//ALFLT3		AXT,1
// PORT: Fixed ROM slots 34212.
    34212, 65520,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:177
//			8D
// PORT: Fixed ROM slots 34213.
    34213, 16,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:178
//DELMLP		DLOAD*	DMP
// PORT: Fixed ROM slots 34214.
    34214, 34246,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:179
//			DPIPAY 	+8D,1
// PORT: Fixed ROM slots 34215.
    34215, 2742,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:180
//			PIPASC
// PORT: Fixed ROM slots 34216.
    34216, 31872,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:181
//		SLR	BDSU*
// PORT: Fixed ROM slots 34217.
    34217, 36706,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:182
//			9D
// PORT: Fixed ROM slots 34218.
    34218, 17684,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:183
//			INTY	+8D,1
// PORT: Fixed ROM slots 34219.
    34219, 2690,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:184
//		STORE	INTY 	+8D,1
// PORT: Fixed ROM slots 34220.
    34220, 6786,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:185
//		PDDL	DMP*
// PORT: Fixed ROM slots 34221.
    34221, 33706,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:186
//			VELSC
// PORT: Fixed ROM slots 34222.
    34222, 31876,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:187
//# Page 386
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:188
//			VLAUN 	+8D,1
// PORT: Fixed ROM slots 34223.
    34223, 2722,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:189
//		SL2R
// PORT: Fixed ROM slots 34224.
    34224, 65460,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:190
//		DSU	STADR
// PORT: Fixed ROM slots 34225.
    34225, 38442,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:191
//		STORE	DELM 	+8D,1
// PORT: Fixed ROM slots 34226.
    34226, 58652,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:192
//		STORE	DELM 	+10D,1
// PORT: Fixed ROM slots 34227.
    34227, 6886,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:193
//		TIX,1	AXT,2
// PORT: Fixed ROM slots 34228.
    34228, 64640,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:194
//			DELMLP
// PORT: Fixed ROM slots 34229.
    34229, 64332,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:195
//			4
// PORT: Fixed ROM slots 34230.
    34230, 8,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:196
//ALILP		DLOAD*	DMPR*
// PORT: Fixed ROM slots 34231.
    34231, 48070,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:197
//			ALK 	+4,2
// PORT: Fixed ROM slots 34232.
    34232, 62888,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:198
//			ALDK 	+4,2
// PORT: Fixed ROM slots 34233.
    34233, 62784,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:199
//		STORE	ALK 	+4,2
// PORT: Fixed ROM slots 34234.
    34234, 10838,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:200
//		TIX,2	AXT,2
// PORT: Fixed ROM slots 34235.
    34235, 64648,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:201
//			ALILP
// PORT: Fixed ROM slots 34236.
    34236, 64366,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:202
//			8D
// PORT: Fixed ROM slots 34237.
    34237, 16,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:203
//ALKLP		LXC,1	SXA,1
// PORT: Fixed ROM slots 34238.
    34238, 55488,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:204
//			CMPX1
// PORT: Fixed ROM slots 34239.
    34239, 2634,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:205
//			CMPX1
// PORT: Fixed ROM slots 34240.
    34240, 2634,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:206
//		DLOAD*	DMPR*
// PORT: Fixed ROM slots 34241.
    34241, 48070,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:207
//			ALK 	+1,1
// PORT: Fixed ROM slots 34242.
    34242, 2640,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:208
//			DELM 	+8D,2
// PORT: Fixed ROM slots 34243.
    34243, 62748,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:209
//		DAD*
// PORT: Fixed ROM slots 34244.
    34244, 65302,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:210
//			INTY 	+8D,2
// PORT: Fixed ROM slots 34245.
    34245, 62844,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:211
//		STORE	INTY 	+8D,2
// PORT: Fixed ROM slots 34246.
    34246, 10882,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:212
//		DLOAD*	DAD*
// PORT: Fixed ROM slots 34247.
    34247, 35782,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:213
//			ALK 	+12D,2
// PORT: Fixed ROM slots 34248.
    34248, 62872,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:214
//			ALDK 	+12D,2
// PORT: Fixed ROM slots 34249.
    34249, 62768,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:215
//		STORE	ALK 	+12D,2
// PORT: Fixed ROM slots 34250.
    34250, 10854,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:216
//		DMPR*	DAD*
// PORT: Fixed ROM slots 34251.
    34251, 35702,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:217
//			DELM 	+8D,2
// PORT: Fixed ROM slots 34252.
    34252, 62748,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:218
//			INTY 	+16D,2
// PORT: Fixed ROM slots 34253.
    34253, 62828,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:219
//		STORE	INTY 	+16D,2
// PORT: Fixed ROM slots 34254.
    34254, 10898,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:220
//		DLOAD*	DMP*
// PORT: Fixed ROM slots 34255.
    34255, 33734,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:221
//			ALSK 	+1,1
// PORT: Fixed ROM slots 34256.
    34256, 31882,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:222
//			DELM 	+8D,2
// PORT: Fixed ROM slots 34257.
    34257, 62748,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:223
//		SL1R	DAD*
// PORT: Fixed ROM slots 34258.
    34258, 35828,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:224
//			VLAUN 	+8D,2
// PORT: Fixed ROM slots 34259.
    34259, 62812,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:225
//		STORE	VLAUN 	+8D,2
// PORT: Fixed ROM slots 34260.
    34260, 10914,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:226
//		TIX,2	AXT,1
// PORT: Fixed ROM slots 34261.
    34261, 63624,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:227
//			ALKLP
// PORT: Fixed ROM slots 34262.
    34262, 64380,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:228
//			8D
// PORT: Fixed ROM slots 34263.
    34263, 16,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:229
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:230
//LOOSE		DLOAD*	PDDL*
// PORT: Fixed ROM slots 34264.
    34264, 54214,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:231
//			ACCWD 	+8D,1
// PORT: Fixed ROM slots 34265.
    34265, 2726,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:232
//			VLAUN 	+8D,1
// PORT: Fixed ROM slots 34266.
    34266, 2722,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:233
//		PDDL*	VDEF
// PORT: Fixed ROM slots 34267.
    34267, 46758,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:234
//			POSNV 	+8D,1
// PORT: Fixed ROM slots 34268.
    34268, 2738,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:235
//		MXV	VSL1
// PORT: Fixed ROM slots 34269.
    34269, 64162,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:236
//			TRANSM1
// PORT: Fixed ROM slots 34270.
    34270, 2050,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:237
//# Page 387
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:238
//		DLOAD
// PORT: Fixed ROM slots 34271.
    34271, 65482,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:239
//			MPAC
// PORT: Fixed ROM slots 34272.
    34272, 218,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:240
//		STORE	POSNV	 +8D,1
// PORT: Fixed ROM slots 34273.
    34273, 6834,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:241
//		DLOAD
// PORT: Fixed ROM slots 34274.
    34274, 65482,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:242
//			MPAC	 +3
// PORT: Fixed ROM slots 34275.
    34275, 224,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:243
//		STORE	VLAUN 	+8D,1
// PORT: Fixed ROM slots 34276.
    34276, 6818,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:244
//		DLOAD
// PORT: Fixed ROM slots 34277.
    34277, 65482,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:245
//			MPAC	+5
// PORT: Fixed ROM slots 34278.
    34278, 228,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:246
//		STORE	ACCWD 	+8D,1
// PORT: Fixed ROM slots 34279.
    34279, 6822,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:247
//		TIX,1
// PORT: Fixed ROM slots 34280.
    34280, 65408,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:248
//			LOOSE
// PORT: Fixed ROM slots 34281.
    34281, 64432,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:249
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:250
//		AXT,2	AXT,1		# EVALUATE SINES AND COSINES
// PORT: Fixed ROM slots 34282.
    34282, 63736,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:251
//			6
// PORT: Fixed ROM slots 34283.
    34283, 12,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:252
//			2
// PORT: Fixed ROM slots 34284.
    34284, 4,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:253
//BOOP		DLOAD*	DMPR
// PORT: Fixed ROM slots 34285.
    34285, 48582,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:254
//			ANGX 	+2,1
// PORT: Fixed ROM slots 34286.
    34286, 2694,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:255
//			GEORGEJ
// PORT: Fixed ROM slots 34287.
    34287, 31888,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:256
//		SR2R
// PORT: Fixed ROM slots 34288.
    34288, 65444,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:257
//		PUSH	SIN
// PORT: Fixed ROM slots 34289.
    34289, 60940,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:258
//		SL3R	XAD,1
// PORT: Fixed ROM slots 34290.
    34290, 47220,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:259
//			X1
// PORT: Fixed ROM slots 34291.
    34291, 76,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:260
//		STORE	16D,2
// PORT: Fixed ROM slots 34292.
    34292, 8226,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:261
//		DLOAD
// PORT: Fixed ROM slots 34293.
    34293, 65482,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:262
//		COS
// PORT: Fixed ROM slots 34294.
    34294, 65484,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:263
//		STORE	22D,2		# COSINES
// PORT: Fixed ROM slots 34295.
    34295, 8238,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:264
//		TIX,2
// PORT: Fixed ROM slots 34296.
    34296, 65416,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:265
//			BOOP
// PORT: Fixed ROM slots 34297.
    34297, 64474,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:266
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:267
//PERFERAS	EXIT
// PORT: Fixed ROM slots 34298.
    34298, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34299–34309.
function agcAotUnit2268 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34303 {
        if slot <= 34300 {
            if slot <= 34299 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:268
//		CA	EBANK7
// PORT: Fixed ROM slots 34299.
                if slot <> 34299 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:269
//		TS	EBANK
// PORT: Fixed ROM slots 34300.
                if slot <> 34300 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34301 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:270
//		EBANK=	ATIGINC
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:271
//		TC	ATIGINC		# GOTO ERASABLE TO CALCULATE ONLY TO RETN
// PORT: Fixed ROM slots 34301.
                if slot <> 34301 or instruction <> 768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34302 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:272
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:273
//# 			     CAUTION
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:274
//#
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:275
//# THE ERASABLE PROGRAM THAT DOES THE CALCULATIONS MUST BE LOADED
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:276
//# BEFORE ANY ATTEMPT IS MAKE TO RUN THE IMU PERFORMANCE TEST
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:277
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:278
//		EBANK=	AZIMUTH
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:279
//		CCS	LENGTHOT
// PORT: Fixed ROM slots 34302.
                    if slot <> 34302 or instruction <> 4874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:280
//		TC	SLEEPIE
// PORT: Fixed ROM slots 34303.
                    if slot <> 34303 or instruction <> 1564 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1564, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34306 {
            if slot <= 34304 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:281
//		CCS	TORQNDX
// PORT: Fixed ROM slots 34304.
                if slot <> 34304 or instruction <> 4896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 800).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34305 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:282
//		TCF	+2
// PORT: Fixed ROM slots 34305.
                    if slot <> 34305 or instruction <> 5635 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5635, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:283
//		TC	SETUPER1
// PORT: Fixed ROM slots 34306.
                    if slot <> 34306 or instruction <> 1541 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1541, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 34307 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:284
//		CA	CDUX
// PORT: Fixed ROM slots 34307.
                if slot <> 34307 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34308 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:285
//		TS	LOSVEC	 +1	# FOR TROUBLESHOOTING VD POSNS 2$4
// PORT: Fixed ROM slots 34308.
                    if slot <> 34308 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:286
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:287
//# Page 388
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:288
//SETUPER1	TC	INTPRET
// PORT: Fixed ROM slots 34309.
                    if slot <> 34309 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2268] to agcAotUnit2268@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:289
//		DLOAD	PDDL		# ANGLES FROM DRIFT TEST ONLY
// PORT: Fixed ROM slots 34310.
    34310, 54730,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:290
//			ANGZ
// PORT: Fixed ROM slots 34311.
    34311, 2678,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:291
//			ANGY
// PORT: Fixed ROM slots 34312.
    34312, 2686,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:292
//		PDDL	VDEF
// PORT: Fixed ROM slots 34313.
    34313, 46762,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:293
//			ANGX
// PORT: Fixed ROM slots 34314.
    34314, 2690,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:294
//		VCOMP	VXSC
// PORT: Fixed ROM slots 34315.
    34315, 61820,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:295
//			GEORGEJ
// PORT: Fixed ROM slots 34316.
    34316, 31888,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:296
//		MXV	VSR1
// PORT: Fixed ROM slots 34317.
    34317, 62114,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:297
//			XSM
// PORT: Fixed ROM slots 34318.
    34318, 2886,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:298
//		STORE	OGC
// PORT: Fixed ROM slots 34319.
    34319, 3008,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:299
//		EXIT
// PORT: Fixed ROM slots 34320.
    34320, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34321–34322.
function agcAotUnit2269 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34321 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:300
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:301
//		CA	OGCPL
// PORT: Fixed ROM slots 34321.
        if slot <> 34321 or instruction <> 13629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1341), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:302
//		TC	BANKCALL
// PORT: Fixed ROM slots 34322.
        if slot <> 34322 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2269] to agcAotUnit2269@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:303
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 34323.
    34323, 15782
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34324–34327.
function agcAotUnit2270 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34325 {
        if slot <= 34324 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:304
//		TC	IMUSLLLG
// PORT: Fixed ROM slots 34324.
            if slot <> 34324 or instruction <> 1229 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1229, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:305
//GEOSTRT4	CCS	TORQNDX		# ONLY POSITIVE IF IN VERTICAL DRIFT TEST
// PORT: Fixed ROM slots 34325.
            if slot <> 34325 or instruction <> 4896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 800).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34326 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:306
//		TC	VALMIS
// PORT: Fixed ROM slots 34326.
            if slot <> 34326 or instruction <> 1203 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1203, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:307
//		TC	INTPRET
// PORT: Fixed ROM slots 34327.
            if slot <> 34327 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2270] to agcAotUnit2270@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:308
//		CALL
// PORT: Fixed ROM slots 34328.
    34328, 65320,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:309
//			ERTHRVSE
// PORT: Fixed ROM slots 34329.
    34329, 64002,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:310
//		EXIT
// PORT: Fixed ROM slots 34330.
    34330, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34331–34340.
function agcAotUnit2271 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34335 {
        if slot <= 34332 {
            if slot <= 34331 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:311
//		TC	TORQUE
// PORT: Fixed ROM slots 34331.
                if slot <> 34331 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:312
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:313
//SLEEPIE		TS	LENGTHOT	# TEST NOT OVER-DECREMENT LENGTHOT
// PORT: Fixed ROM slots 34332.
                if slot <> 34332 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34333 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:314
//		CCS	TORQNDX		# ARE WE DOING VERTDRIFT
// PORT: Fixed ROM slots 34333.
                if slot <> 34333 or instruction <> 4896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 800).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34334 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:315
//		TC	EARTHR*
// PORT: Fixed ROM slots 34334.
                    if slot <> 34334 or instruction <> 1319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1319, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:316
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 34335.
                    if slot <> 34335 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34337 {
            if slot <= 34336 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:317
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:318
//SOMEERRR	CA	EBANK5
// PORT: Fixed ROM slots 34336.
                if slot <> 34336 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:319
//		TS	EBANK
// PORT: Fixed ROM slots 34337.
                if slot <> 34337 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34338 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:320
//		CA	ONE
// PORT: Fixed ROM slots 34338.
                if slot <> 34338 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34339 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:321
//		TS	OVFLOWCK	# STOP ALLOOP FROM CALLING ITSELF
// PORT: Fixed ROM slots 34339.
                    if slot <> 34339 or instruction <> 23422 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:322
//		TC	ALARM
// PORT: Fixed ROM slots 34340.
                    if slot <> 34340 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2271] to agcAotUnit2271@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:323
//		OCT	1600
// PORT: Fixed ROM slots 34341.
    34341, 1792
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34342–34345.
function agcAotUnit2272 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34343 {
        if slot <= 34342 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:324
//		TC	ENDTEST1
// PORT: Fixed ROM slots 34342.
            if slot <> 34342 or instruction <> 1208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:325
//SOMERR2		CAF	OCT1601
// PORT: Fixed ROM slots 34343.
            if slot <> 34343 or instruction <> 13868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1580), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34344 {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:326
//		TC	VARALARM
// PORT: Fixed ROM slots 34344.
            if slot <> 34344 or instruction <> 3044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:327
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 34345.
            if slot <> 34345 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2272] to agcAotUnit2272@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:328
//		ADRES	IMUSE
// PORT: Fixed ROM slots 34346.
    34346, 14
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34347–34347.
function agcAotUnit2273 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:329
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 34347.
    if slot <> 34347 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2273] to agcAotUnit2273@.

agcAotInstallSourceRope(list(
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:330
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:331
//OCT1601		OCT	01601
// PORT: Fixed ROM slots 34348.
    34348, 1794,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:332
//DEC585		OCT	06200		# 3200 B+14 ORDER IS IMPORTANT
// PORT: Fixed ROM slots 34349.
    34349, 6400,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:333
//SCHZEROS	2DEC	.00000000
// PORT: Fixed ROM slots 34350 34351.
    34350, 0, 34351, 0,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:334
//# Page 389
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:335
//		2DEC	.00000000
// PORT: Fixed ROM slots 34352 34353.
    34352, 0, 34353, 0,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:336
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:337
//		OCT	00000
// PORT: Fixed ROM slots 34354.
    34354, 0,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:338
//ONEDPP		OCT	00000		# ORDER IS IMPORTANT
// PORT: Fixed ROM slots 34355.
    34355, 0,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:339
//		OCT	00001
// PORT: Fixed ROM slots 34356.
    34356, 2,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:340
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:341
//INTVAL		OCT	4
// PORT: Fixed ROM slots 34357.
    34357, 8,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:342
//		OCT	2
// PORT: Fixed ROM slots 34358.
    34358, 4,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:343
//		DEC	144
// PORT: Fixed ROM slots 34359.
    34359, 288,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:344
//		DEC	-1
// PORT: Fixed ROM slots 34360.
    34360, 65532,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:345
//SOUPLY		2DEC	.93505870	# INITIAL GAINS FOR PIP OUTPUTS
// PORT: Fixed ROM slots 34361 34362.
    34361, 30640, 34362, 58,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:346
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:347
//		2DEC	.26266423	# INITIAL GAINS/4 FOR ERECTION ANGLES
// PORT: Fixed ROM slots 34363 34364.
    34363, 8606, 34364, 16080,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:348
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:349
//77DECML		DEC	77
// PORT: Fixed ROM slots 34365.
    34365, 154,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:350
//ALXXXZ		GENADR	ALX1S 	-1
// PORT: Fixed ROM slots 34366.
    34366, 1606,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:351
//PIPASC		2DEC	.13055869
// PORT: Fixed ROM slots 34367 34368.
    34367, 4278, 34368, 2410,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:352
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:353
//VELSC		2DEC	-.52223476	# 512/980.402
// PORT: Fixed ROM slots 34369 34370.
    34369, 48422, 34370, 55890,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:354
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:355
//ALSK		2DEC	.17329931	# SSWAY VEL GAIN X 980.402/4096
// PORT: Fixed ROM slots 34371 34372.
    34371, 5678, 34372, 11006,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:356
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:357
//		2DEC	-.00835370	# SSWAY ACCEL GAIN X 980.402/4096
// PORT: Fixed ROM slots 34373 34374.
    34373, 65262, 34374, 37124,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:358
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:359
//GEORGEJ		2DEC	.63661977
// PORT: Fixed ROM slots 34375 34376.
    34375, 20860, 34376, 12396,
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:360
//
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:361
//GEORGEK		2DEC	.59737013
// PORT: Fixed ROM slots 34377 34378.
    34377, 19574, 34378, 10230
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE IMU_PERFORMANCE_TESTS_4.agc:362
//
