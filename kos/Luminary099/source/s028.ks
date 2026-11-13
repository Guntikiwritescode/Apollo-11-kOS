// IMU_PERFORMANCE_TESTS_4.agc
// bank 37, slots 34112-34114
function agcAotUnit2262 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34112 {
// IMU_PERFORMANCE_TESTS_4.agc:1
//# Copyright:	Public domain.
// IMU_PERFORMANCE_TESTS_4.agc:2
//# Filename:	IMU_PERFORMANCE_TESTS_4.agc
// IMU_PERFORMANCE_TESTS_4.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// IMU_PERFORMANCE_TESTS_4.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// IMU_PERFORMANCE_TESTS_4.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// IMU_PERFORMANCE_TESTS_4.agc:6
//# Assembler:	yaYUL
// IMU_PERFORMANCE_TESTS_4.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// IMU_PERFORMANCE_TESTS_4.agc:8
//# Website:	www.ibiblio.org/apollo.
// IMU_PERFORMANCE_TESTS_4.agc:9
//# Pages:	382-389
// IMU_PERFORMANCE_TESTS_4.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// IMU_PERFORMANCE_TESTS_4.agc:11
//#				Luminary131 file, using page
// IMU_PERFORMANCE_TESTS_4.agc:12
//#				images from Luminary 1A.
// IMU_PERFORMANCE_TESTS_4.agc:13
//#
// IMU_PERFORMANCE_TESTS_4.agc:14
//# This source code has been transcribed or otherwise adapted from
// IMU_PERFORMANCE_TESTS_4.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// IMU_PERFORMANCE_TESTS_4.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// IMU_PERFORMANCE_TESTS_4.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// IMU_PERFORMANCE_TESTS_4.agc:18
//# in storage size and consequent reduction in image quality as well) are
// IMU_PERFORMANCE_TESTS_4.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// IMU_PERFORMANCE_TESTS_4.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// IMU_PERFORMANCE_TESTS_4.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// IMU_PERFORMANCE_TESTS_4.agc:22
//# actually created.
// IMU_PERFORMANCE_TESTS_4.agc:23
//#
// IMU_PERFORMANCE_TESTS_4.agc:24
//# Notations on the hardcopy document read, in part:
// IMU_PERFORMANCE_TESTS_4.agc:25
//#
// IMU_PERFORMANCE_TESTS_4.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// IMU_PERFORMANCE_TESTS_4.agc:27
//#	16:27 JULY 14, 1969
// IMU_PERFORMANCE_TESTS_4.agc:28
//
// IMU_PERFORMANCE_TESTS_4.agc:29
//# Page 382
// IMU_PERFORMANCE_TESTS_4.agc:30
//# PROGRAM --	IMU PERFORMANCE TESTS 4
// IMU_PERFORMANCE_TESTS_4.agc:31
//# DATE --	NOV 15, 1966
// IMU_PERFORMANCE_TESTS_4.agc:32
//# BY --		SCHMIDT KERMAN IL7-146 EXT 1126
// IMU_PERFORMANCE_TESTS_4.agc:33
//# MOD NO-ZERO
// IMU_PERFORMANCE_TESTS_4.agc:34
//#
// IMU_PERFORMANCE_TESTS_4.agc:35
//# FUNCTIONAL DESCRIPTION
// IMU_PERFORMANCE_TESTS_4.agc:36
//#
// IMU_PERFORMANCE_TESTS_4.agc:37
//# THIS SECTION CONSISTS OF THE FILTER FOR THE GYRO DRIFT TESTS.  NO COMPASS
// IMU_PERFORMANCE_TESTS_4.agc:38
//# IS DONE IN LEM.  FOR A DESCRIPTION OF THE FILTER SEE E-1973.  THIS
// IMU_PERFORMANCE_TESTS_4.agc:39
//# SECTION IS ENTERED FROM IMU 2.  IT RETURNS THERE AT END OF TEST.
// IMU_PERFORMANCE_TESTS_4.agc:40
//#
// IMU_PERFORMANCE_TESTS_4.agc:41
//# EARTHR,OGC ZERO,ERTHRVSE
// IMU_PERFORMANCE_TESTS_4.agc:42
//#
// IMU_PERFORMANCE_TESTS_4.agc:43
//# NORMAL EXIT
// IMU_PERFORMANCE_TESTS_4.agc:44
//#
// IMU_PERFORMANCE_TESTS_4.agc:45
//# LENGTHOT GOES TO ZERO -- RETURN TO IMU PERF TESTS 2 CONTROL
// IMU_PERFORMANCE_TESTS_4.agc:46
//#
// IMU_PERFORMANCE_TESTS_4.agc:47
//# ALARMS
// IMU_PERFORMANCE_TESTS_4.agc:48
//#
// IMU_PERFORMANCE_TESTS_4.agc:49
//# 1600	OVERFLOW IN DRIFT TEST
// IMU_PERFORMANCE_TESTS_4.agc:50
//# 1601	BAD IMU MODING IN ANY ROUTINE THAT USES IMUSTALL
// IMU_PERFORMANCE_TESTS_4.agc:51
//#	OUTPUT
// IMU_PERFORMANCE_TESTS_4.agc:52
//#
// IMU_PERFORMANCE_TESTS_4.agc:53
//# FLASHING DISPLAY OF RESULTS -- CONTROLLED IN IMU PERF TESTS 2
// IMU_PERFORMANCE_TESTS_4.agc:54
//#
// IMU_PERFORMANCE_TESTS_4.agc:55
//# DEBRIS
// IMU_PERFORMANCE_TESTS_4.agc:56
//#
// IMU_PERFORMANCE_TESTS_4.agc:57
//# ALL CENTRALS -- ALL OF EBANK XSM
// IMU_PERFORMANCE_TESTS_4.agc:58
//
// IMU_PERFORMANCE_TESTS_4.agc:59
//# Page 383
// IMU_PERFORMANCE_TESTS_4.agc:60
//		BANK	33
// IMU_PERFORMANCE_TESTS_4.agc:61
//		SETLOC	IMU4
// IMU_PERFORMANCE_TESTS_4.agc:62
//		BANK
// IMU_PERFORMANCE_TESTS_4.agc:63
//		COUNT*	$$/P07
// IMU_PERFORMANCE_TESTS_4.agc:64
//
// IMU_PERFORMANCE_TESTS_4.agc:65
//		EBANK=	XSM
// IMU_PERFORMANCE_TESTS_4.agc:66
//
// IMU_PERFORMANCE_TESTS_4.agc:67
//ESTIMS		INHINT
// slot 34112
        if slot <> 34112 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34113 {
// IMU_PERFORMANCE_TESTS_4.agc:68
//		CAE	1SECXT
// slot 34113
            if slot <> 34113 or instruction <> 13178 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 890).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:69
//		TC	TWIDDLE
// slot 34114
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
// IMU_PERFORMANCE_TESTS_4.agc:70
//		EBANK=	XSM
// IMU_PERFORMANCE_TESTS_4.agc:71
//		ADRES	ALLOOP
// slot 34115
    34115, 2748
)).

// bank 37, slots 34116-34125
function agcAotUnit2263 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34120 {
        if slot <= 34117 {
            if slot <= 34116 {
// IMU_PERFORMANCE_TESTS_4.agc:72
//		CAF	ZERO		# ZERO THE PIPAS
// slot 34116
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
// IMU_PERFORMANCE_TESTS_4.agc:73
//		TS	PIPAX
// slot 34117
                if slot <> 34117 or instruction <> 22559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34118 {
// IMU_PERFORMANCE_TESTS_4.agc:74
//		TS	PIPAY
// slot 34118
                if slot <> 34118 or instruction <> 22560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34119 {
// IMU_PERFORMANCE_TESTS_4.agc:75
//		TS	PIPAZ
// slot 34119
                    if slot <> 34119 or instruction <> 22561 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22561, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:76
//		RELINT
// slot 34120
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
// IMU_PERFORMANCE_TESTS_4.agc:77
//		CA	77DECML
// slot 34121
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
// IMU_PERFORMANCE_TESTS_4.agc:78
//		TS	ZERONDX
// slot 34122
                if slot <> 34122 or instruction <> 23417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34123 {
// IMU_PERFORMANCE_TESTS_4.agc:79
//		CA	ALXXXZ
// slot 34123
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
// IMU_PERFORMANCE_TESTS_4.agc:80
//		TC	ZEROING
// slot 34124
                    if slot <> 34124 or instruction <> 1271 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1271, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:81
//		TC	INTPRET
// slot 34125
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
// IMU_PERFORMANCE_TESTS_4.agc:82
//		SLOAD
// slot 34126
    34126, 65466,
// IMU_PERFORMANCE_TESTS_4.agc:83
//			SCHZEROS
// slot 34127
    34127, 31838,
// IMU_PERFORMANCE_TESTS_4.agc:84
//		STOVL	GCOMPSW -1
// slot 34128
    34128, 22142,
// IMU_PERFORMANCE_TESTS_4.agc:85
//			INTVAL 	+2
// slot 34129
    34129, 31856,
// IMU_PERFORMANCE_TESTS_4.agc:86
//		STOVL	ALX1S
// slot 34130
    34130, 23114,
// IMU_PERFORMANCE_TESTS_4.agc:87
//			SCHZEROS
// slot 34131
    34131, 31838,
// IMU_PERFORMANCE_TESTS_4.agc:88
//		STORE	DELVX
// slot 34132
    34132, 426,
// IMU_PERFORMANCE_TESTS_4.agc:89
//		STORE	GCOMP
// slot 34133
    34133, 1652,
// IMU_PERFORMANCE_TESTS_4.agc:90
//		SLOAD
// slot 34134
    34134, 65466,
// IMU_PERFORMANCE_TESTS_4.agc:91
//			TORQNDX
// slot 34135
    34135, 2626,
// IMU_PERFORMANCE_TESTS_4.agc:92
//		DCOMP	BMN
// slot 34136
    34136, 41084,
// IMU_PERFORMANCE_TESTS_4.agc:93
//			VERTSKIP
// slot 34137
    34137, 64184,
// IMU_PERFORMANCE_TESTS_4.agc:94
//		CALL
// slot 34138
    34138, 65320,
// IMU_PERFORMANCE_TESTS_4.agc:95
//			ERTHRVSE
// slot 34139
    34139, 64002,
// IMU_PERFORMANCE_TESTS_4.agc:96
//VERTSKIP	EXIT
// slot 34140
    34140, 65532
)).

// bank 37, slots 34141-34159
function agcAotUnit2264 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34149 {
        if slot <= 34144 {
            if slot <= 34142 {
                if slot <= 34141 {
// IMU_PERFORMANCE_TESTS_4.agc:97
//		TC	SLEEPIE +1
// slot 34141
                    if slot <> 34141 or instruction <> 1565 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1565, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:98
//
// IMU_PERFORMANCE_TESTS_4.agc:99
//# Page 384
// IMU_PERFORMANCE_TESTS_4.agc:100
//ALLOOP		CA	OVFLOWCK
// slot 34142
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
// IMU_PERFORMANCE_TESTS_4.agc:101
//		EXTEND
// slot 34143
                    if slot <> 34143 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:102
//		BZF	+2
// slot 34144
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
// IMU_PERFORMANCE_TESTS_4.agc:103
//		TC	TASKOVER
// slot 34145
                    if slot <> 34145 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:104
//		CCS	ALTIM
// slot 34146
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
// IMU_PERFORMANCE_TESTS_4.agc:105
//		CA	A		# SHOULD NEVER HIT THIS LOCATION
// slot 34147
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
// IMU_PERFORMANCE_TESTS_4.agc:106
//		TS	ALTIMS
// slot 34148
                        if slot <> 34148 or instruction <> 23385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23385, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_PERFORMANCE_TESTS_4.agc:107
//		CS	A
// slot 34149
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
// IMU_PERFORMANCE_TESTS_4.agc:108
//		TS	ALTIM
// slot 34150
                    if slot <> 34150 or instruction <> 23384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:109
//		CS	ONE
// slot 34151
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
// IMU_PERFORMANCE_TESTS_4.agc:110
//		AD	GEOCOMPS
// slot 34152
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
// IMU_PERFORMANCE_TESTS_4.agc:111
//		EXTEND
// slot 34153
                        if slot <> 34153 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_PERFORMANCE_TESTS_4.agc:112
//		BZF	+4
// slot 34154
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
// IMU_PERFORMANCE_TESTS_4.agc:113
//		CA	LENGTHOT
// slot 34155
                    if slot <> 34155 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:114
//		EXTEND
// slot 34156
                    if slot <> 34156 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 34157 {
// IMU_PERFORMANCE_TESTS_4.agc:115
//		BZMF	+5
// slot 34157
                    if slot <> 34157 or instruction <> 25970 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25970, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 34158 {
// IMU_PERFORMANCE_TESTS_4.agc:116
//		CAE	1SECXT
// slot 34158
                        if slot <> 34158 or instruction <> 13178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 890).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// IMU_PERFORMANCE_TESTS_4.agc:117
//		TC	TWIDDLE
// slot 34159
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
// IMU_PERFORMANCE_TESTS_4.agc:118
//		EBANK=	XSM
// IMU_PERFORMANCE_TESTS_4.agc:119
//		ADRES	ALLOOP
// slot 34160
    34160, 2748
)).

// bank 37, slots 34161-34171
function agcAotUnit2265 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34165 {
        if slot <= 34162 {
            if slot <= 34161 {
// IMU_PERFORMANCE_TESTS_4.agc:120
//		CAF	ZERO
// slot 34161
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
// IMU_PERFORMANCE_TESTS_4.agc:121
//		XCH	PIPAX
// slot 34162
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
// IMU_PERFORMANCE_TESTS_4.agc:122
//		TS	DELVX
// slot 34163
                if slot <> 34163 or instruction <> 22740 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22740, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34164 {
// IMU_PERFORMANCE_TESTS_4.agc:123
//		CAF	ZERO
// slot 34164
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
// IMU_PERFORMANCE_TESTS_4.agc:124
//		XCH	PIPAY
// slot 34165
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
// IMU_PERFORMANCE_TESTS_4.agc:125
//		TS	DELVY
// slot 34166
                if slot <> 34166 or instruction <> 22742 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22742, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34167 {
// IMU_PERFORMANCE_TESTS_4.agc:126
//		CAF	ZERO
// slot 34167
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
// IMU_PERFORMANCE_TESTS_4.agc:127
//		XCH	PIPAZ
// slot 34168
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
// IMU_PERFORMANCE_TESTS_4.agc:128
//		TS	DELVZ
// slot 34169
                if slot <> 34169 or instruction <> 22744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22744, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34170 {
// IMU_PERFORMANCE_TESTS_4.agc:129
//SPECSTS		CAF	PRIO20
// slot 34170
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
// IMU_PERFORMANCE_TESTS_4.agc:130
//		TC	FINDVAC
// slot 34171
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
// IMU_PERFORMANCE_TESTS_4.agc:131
//		EBANK=	XSM
// IMU_PERFORMANCE_TESTS_4.agc:132
//		2CADR	ALFLT		# START THE JOB
// slot 34172 34173
    34172, 2814, 34173, 63594
)).

// bank 37, slots 34174-34178
function agcAotUnit2266 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34175 {
        if slot <= 34174 {
// IMU_PERFORMANCE_TESTS_4.agc:133
//
// IMU_PERFORMANCE_TESTS_4.agc:134
//		TC	TASKOVER
// slot 34174
            if slot <> 34174 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:135
//
// IMU_PERFORMANCE_TESTS_4.agc:136
//# Page 385
// IMU_PERFORMANCE_TESTS_4.agc:137
//ALFLT		CCS	GEOCOMPS
// slot 34175
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
// IMU_PERFORMANCE_TESTS_4.agc:138
//		TC	+2
// slot 34176
            if slot <> 34176 or instruction <> 1410 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1410, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34177 {
// IMU_PERFORMANCE_TESTS_4.agc:139
//		TC	NORMLOP
// slot 34177
                if slot <> 34177 or instruction <> 1412 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1412, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_PERFORMANCE_TESTS_4.agc:140
//		TC	BANKCALL
// slot 34178
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
// IMU_PERFORMANCE_TESTS_4.agc:141
//		CADR	1/PIPA
// slot 34179
    34179, 13670
)).

// bank 37, slots 34180-34180
function agcAotUnit2267 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_PERFORMANCE_TESTS_4.agc:142
//NORMLOP		TC	INTPRET
// slot 34180
    if slot <> 34180 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2267] to agcAotUnit2267@.

agcAotInstallSourceRope(list(
// IMU_PERFORMANCE_TESTS_4.agc:143
//		DLOAD
// slot 34181
    34181, 65482,
// IMU_PERFORMANCE_TESTS_4.agc:144
//			INTVAL
// slot 34182
    34182, 31852,
// IMU_PERFORMANCE_TESTS_4.agc:145
//		STOVL	S1
// slot 34183
    34183, 20562,
// IMU_PERFORMANCE_TESTS_4.agc:146
//			DELVX
// slot 34184
    34184, 426,
// IMU_PERFORMANCE_TESTS_4.agc:147
//		VXM	VSL1
// slot 34185
    34185, 64138,
// IMU_PERFORMANCE_TESTS_4.agc:148
//			XSM
// slot 34186
    34186, 2886,
// IMU_PERFORMANCE_TESTS_4.agc:149
//		DLOAD	DCOMP
// slot 34187
    34187, 48842,
// IMU_PERFORMANCE_TESTS_4.agc:150
//			MPAC +3
// slot 34188
    34188, 224,
// IMU_PERFORMANCE_TESTS_4.agc:151
//		STODL	DPIPAY
// slot 34189
    34189, 15014,
// IMU_PERFORMANCE_TESTS_4.agc:152
//			MPAC +5
// slot 34190
    34190, 228,
// IMU_PERFORMANCE_TESTS_4.agc:153
//		STORE	DPIPAZ
// slot 34191
    34191, 2734,
// IMU_PERFORMANCE_TESTS_4.agc:154
//
// IMU_PERFORMANCE_TESTS_4.agc:155
//		SETPD	AXT,1
// slot 34192
    34192, 63490,
// IMU_PERFORMANCE_TESTS_4.agc:156
//			0
// slot 34193
    34193, 2,
// IMU_PERFORMANCE_TESTS_4.agc:157
//			8D
// slot 34194
    34194, 16,
// IMU_PERFORMANCE_TESTS_4.agc:158
//		SLOAD	DCOMP
// slot 34195
    34195, 48826,
// IMU_PERFORMANCE_TESTS_4.agc:159
//			GEOCOMPS
// slot 34196
    34196, 2790,
// IMU_PERFORMANCE_TESTS_4.agc:160
//		BMN
// slot 34197
    34197, 65344,
// IMU_PERFORMANCE_TESTS_4.agc:161
//			PERFERAS
// slot 34198
    34198, 64500,
// IMU_PERFORMANCE_TESTS_4.agc:162
//ALCGKK		SLOAD	BMN
// slot 34199
    34199, 41146,
// IMU_PERFORMANCE_TESTS_4.agc:163
//			ALTIMS
// slot 34200
    34200, 2740,
// IMU_PERFORMANCE_TESTS_4.agc:164
//			ALFLT3
// slot 34201
    34201, 64328,
// IMU_PERFORMANCE_TESTS_4.agc:165
//ALKCG		AXT,2	LXA,1		# LOADS SLOPES AND TIME CONSTANTS AT RQST
// slot 34202
    34202, 59640,
// IMU_PERFORMANCE_TESTS_4.agc:166
//			12D
// slot 34203
    34203, 24,
// IMU_PERFORMANCE_TESTS_4.agc:167
//			ALX1S
// slot 34204
    34204, 2632,
// IMU_PERFORMANCE_TESTS_4.agc:168
//ALKCG2		DLOAD*	INCR,1
// slot 34205
    34205, 51398,
// IMU_PERFORMANCE_TESTS_4.agc:169
//			ALFDK 	+144D,1
// slot 34206
    34206, 2374,
// IMU_PERFORMANCE_TESTS_4.agc:170
//		DEC	-2
// slot 34207
    34207, 65530,
// IMU_PERFORMANCE_TESTS_4.agc:171
//		STORE	ALDK 	+10D,2
// slot 34208
    34208, 10954,
// IMU_PERFORMANCE_TESTS_4.agc:172
//		TIX,2	SXA,1
// slot 34209
    34209, 55432,
// IMU_PERFORMANCE_TESTS_4.agc:173
//			ALKCG2
// slot 34210
    34210, 64314,
// IMU_PERFORMANCE_TESTS_4.agc:174
//			ALX1S
// slot 34211
    34211, 2632,
// IMU_PERFORMANCE_TESTS_4.agc:175
//
// IMU_PERFORMANCE_TESTS_4.agc:176
//ALFLT3		AXT,1
// slot 34212
    34212, 65520,
// IMU_PERFORMANCE_TESTS_4.agc:177
//			8D
// slot 34213
    34213, 16,
// IMU_PERFORMANCE_TESTS_4.agc:178
//DELMLP		DLOAD*	DMP
// slot 34214
    34214, 34246,
// IMU_PERFORMANCE_TESTS_4.agc:179
//			DPIPAY 	+8D,1
// slot 34215
    34215, 2742,
// IMU_PERFORMANCE_TESTS_4.agc:180
//			PIPASC
// slot 34216
    34216, 31872,
// IMU_PERFORMANCE_TESTS_4.agc:181
//		SLR	BDSU*
// slot 34217
    34217, 36706,
// IMU_PERFORMANCE_TESTS_4.agc:182
//			9D
// slot 34218
    34218, 17684,
// IMU_PERFORMANCE_TESTS_4.agc:183
//			INTY	+8D,1
// slot 34219
    34219, 2690,
// IMU_PERFORMANCE_TESTS_4.agc:184
//		STORE	INTY 	+8D,1
// slot 34220
    34220, 6786,
// IMU_PERFORMANCE_TESTS_4.agc:185
//		PDDL	DMP*
// slot 34221
    34221, 33706,
// IMU_PERFORMANCE_TESTS_4.agc:186
//			VELSC
// slot 34222
    34222, 31876,
// IMU_PERFORMANCE_TESTS_4.agc:187
//# Page 386
// IMU_PERFORMANCE_TESTS_4.agc:188
//			VLAUN 	+8D,1
// slot 34223
    34223, 2722,
// IMU_PERFORMANCE_TESTS_4.agc:189
//		SL2R
// slot 34224
    34224, 65460,
// IMU_PERFORMANCE_TESTS_4.agc:190
//		DSU	STADR
// slot 34225
    34225, 38442,
// IMU_PERFORMANCE_TESTS_4.agc:191
//		STORE	DELM 	+8D,1
// slot 34226
    34226, 58652,
// IMU_PERFORMANCE_TESTS_4.agc:192
//		STORE	DELM 	+10D,1
// slot 34227
    34227, 6886,
// IMU_PERFORMANCE_TESTS_4.agc:193
//		TIX,1	AXT,2
// slot 34228
    34228, 64640,
// IMU_PERFORMANCE_TESTS_4.agc:194
//			DELMLP
// slot 34229
    34229, 64332,
// IMU_PERFORMANCE_TESTS_4.agc:195
//			4
// slot 34230
    34230, 8,
// IMU_PERFORMANCE_TESTS_4.agc:196
//ALILP		DLOAD*	DMPR*
// slot 34231
    34231, 48070,
// IMU_PERFORMANCE_TESTS_4.agc:197
//			ALK 	+4,2
// slot 34232
    34232, 62888,
// IMU_PERFORMANCE_TESTS_4.agc:198
//			ALDK 	+4,2
// slot 34233
    34233, 62784,
// IMU_PERFORMANCE_TESTS_4.agc:199
//		STORE	ALK 	+4,2
// slot 34234
    34234, 10838,
// IMU_PERFORMANCE_TESTS_4.agc:200
//		TIX,2	AXT,2
// slot 34235
    34235, 64648,
// IMU_PERFORMANCE_TESTS_4.agc:201
//			ALILP
// slot 34236
    34236, 64366,
// IMU_PERFORMANCE_TESTS_4.agc:202
//			8D
// slot 34237
    34237, 16,
// IMU_PERFORMANCE_TESTS_4.agc:203
//ALKLP		LXC,1	SXA,1
// slot 34238
    34238, 55488,
// IMU_PERFORMANCE_TESTS_4.agc:204
//			CMPX1
// slot 34239
    34239, 2634,
// IMU_PERFORMANCE_TESTS_4.agc:205
//			CMPX1
// slot 34240
    34240, 2634,
// IMU_PERFORMANCE_TESTS_4.agc:206
//		DLOAD*	DMPR*
// slot 34241
    34241, 48070,
// IMU_PERFORMANCE_TESTS_4.agc:207
//			ALK 	+1,1
// slot 34242
    34242, 2640,
// IMU_PERFORMANCE_TESTS_4.agc:208
//			DELM 	+8D,2
// slot 34243
    34243, 62748,
// IMU_PERFORMANCE_TESTS_4.agc:209
//		DAD*
// slot 34244
    34244, 65302,
// IMU_PERFORMANCE_TESTS_4.agc:210
//			INTY 	+8D,2
// slot 34245
    34245, 62844,
// IMU_PERFORMANCE_TESTS_4.agc:211
//		STORE	INTY 	+8D,2
// slot 34246
    34246, 10882,
// IMU_PERFORMANCE_TESTS_4.agc:212
//		DLOAD*	DAD*
// slot 34247
    34247, 35782,
// IMU_PERFORMANCE_TESTS_4.agc:213
//			ALK 	+12D,2
// slot 34248
    34248, 62872,
// IMU_PERFORMANCE_TESTS_4.agc:214
//			ALDK 	+12D,2
// slot 34249
    34249, 62768,
// IMU_PERFORMANCE_TESTS_4.agc:215
//		STORE	ALK 	+12D,2
// slot 34250
    34250, 10854,
// IMU_PERFORMANCE_TESTS_4.agc:216
//		DMPR*	DAD*
// slot 34251
    34251, 35702,
// IMU_PERFORMANCE_TESTS_4.agc:217
//			DELM 	+8D,2
// slot 34252
    34252, 62748,
// IMU_PERFORMANCE_TESTS_4.agc:218
//			INTY 	+16D,2
// slot 34253
    34253, 62828,
// IMU_PERFORMANCE_TESTS_4.agc:219
//		STORE	INTY 	+16D,2
// slot 34254
    34254, 10898,
// IMU_PERFORMANCE_TESTS_4.agc:220
//		DLOAD*	DMP*
// slot 34255
    34255, 33734,
// IMU_PERFORMANCE_TESTS_4.agc:221
//			ALSK 	+1,1
// slot 34256
    34256, 31882,
// IMU_PERFORMANCE_TESTS_4.agc:222
//			DELM 	+8D,2
// slot 34257
    34257, 62748,
// IMU_PERFORMANCE_TESTS_4.agc:223
//		SL1R	DAD*
// slot 34258
    34258, 35828,
// IMU_PERFORMANCE_TESTS_4.agc:224
//			VLAUN 	+8D,2
// slot 34259
    34259, 62812,
// IMU_PERFORMANCE_TESTS_4.agc:225
//		STORE	VLAUN 	+8D,2
// slot 34260
    34260, 10914,
// IMU_PERFORMANCE_TESTS_4.agc:226
//		TIX,2	AXT,1
// slot 34261
    34261, 63624,
// IMU_PERFORMANCE_TESTS_4.agc:227
//			ALKLP
// slot 34262
    34262, 64380,
// IMU_PERFORMANCE_TESTS_4.agc:228
//			8D
// slot 34263
    34263, 16,
// IMU_PERFORMANCE_TESTS_4.agc:229
//
// IMU_PERFORMANCE_TESTS_4.agc:230
//LOOSE		DLOAD*	PDDL*
// slot 34264
    34264, 54214,
// IMU_PERFORMANCE_TESTS_4.agc:231
//			ACCWD 	+8D,1
// slot 34265
    34265, 2726,
// IMU_PERFORMANCE_TESTS_4.agc:232
//			VLAUN 	+8D,1
// slot 34266
    34266, 2722,
// IMU_PERFORMANCE_TESTS_4.agc:233
//		PDDL*	VDEF
// slot 34267
    34267, 46758,
// IMU_PERFORMANCE_TESTS_4.agc:234
//			POSNV 	+8D,1
// slot 34268
    34268, 2738,
// IMU_PERFORMANCE_TESTS_4.agc:235
//		MXV	VSL1
// slot 34269
    34269, 64162,
// IMU_PERFORMANCE_TESTS_4.agc:236
//			TRANSM1
// slot 34270
    34270, 2050,
// IMU_PERFORMANCE_TESTS_4.agc:237
//# Page 387
// IMU_PERFORMANCE_TESTS_4.agc:238
//		DLOAD
// slot 34271
    34271, 65482,
// IMU_PERFORMANCE_TESTS_4.agc:239
//			MPAC
// slot 34272
    34272, 218,
// IMU_PERFORMANCE_TESTS_4.agc:240
//		STORE	POSNV	 +8D,1
// slot 34273
    34273, 6834,
// IMU_PERFORMANCE_TESTS_4.agc:241
//		DLOAD
// slot 34274
    34274, 65482,
// IMU_PERFORMANCE_TESTS_4.agc:242
//			MPAC	 +3
// slot 34275
    34275, 224,
// IMU_PERFORMANCE_TESTS_4.agc:243
//		STORE	VLAUN 	+8D,1
// slot 34276
    34276, 6818,
// IMU_PERFORMANCE_TESTS_4.agc:244
//		DLOAD
// slot 34277
    34277, 65482,
// IMU_PERFORMANCE_TESTS_4.agc:245
//			MPAC	+5
// slot 34278
    34278, 228,
// IMU_PERFORMANCE_TESTS_4.agc:246
//		STORE	ACCWD 	+8D,1
// slot 34279
    34279, 6822,
// IMU_PERFORMANCE_TESTS_4.agc:247
//		TIX,1
// slot 34280
    34280, 65408,
// IMU_PERFORMANCE_TESTS_4.agc:248
//			LOOSE
// slot 34281
    34281, 64432,
// IMU_PERFORMANCE_TESTS_4.agc:249
//
// IMU_PERFORMANCE_TESTS_4.agc:250
//		AXT,2	AXT,1		# EVALUATE SINES AND COSINES
// slot 34282
    34282, 63736,
// IMU_PERFORMANCE_TESTS_4.agc:251
//			6
// slot 34283
    34283, 12,
// IMU_PERFORMANCE_TESTS_4.agc:252
//			2
// slot 34284
    34284, 4,
// IMU_PERFORMANCE_TESTS_4.agc:253
//BOOP		DLOAD*	DMPR
// slot 34285
    34285, 48582,
// IMU_PERFORMANCE_TESTS_4.agc:254
//			ANGX 	+2,1
// slot 34286
    34286, 2694,
// IMU_PERFORMANCE_TESTS_4.agc:255
//			GEORGEJ
// slot 34287
    34287, 31888,
// IMU_PERFORMANCE_TESTS_4.agc:256
//		SR2R
// slot 34288
    34288, 65444,
// IMU_PERFORMANCE_TESTS_4.agc:257
//		PUSH	SIN
// slot 34289
    34289, 60940,
// IMU_PERFORMANCE_TESTS_4.agc:258
//		SL3R	XAD,1
// slot 34290
    34290, 47220,
// IMU_PERFORMANCE_TESTS_4.agc:259
//			X1
// slot 34291
    34291, 76,
// IMU_PERFORMANCE_TESTS_4.agc:260
//		STORE	16D,2
// slot 34292
    34292, 8226,
// IMU_PERFORMANCE_TESTS_4.agc:261
//		DLOAD
// slot 34293
    34293, 65482,
// IMU_PERFORMANCE_TESTS_4.agc:262
//		COS
// slot 34294
    34294, 65484,
// IMU_PERFORMANCE_TESTS_4.agc:263
//		STORE	22D,2		# COSINES
// slot 34295
    34295, 8238,
// IMU_PERFORMANCE_TESTS_4.agc:264
//		TIX,2
// slot 34296
    34296, 65416,
// IMU_PERFORMANCE_TESTS_4.agc:265
//			BOOP
// slot 34297
    34297, 64474,
// IMU_PERFORMANCE_TESTS_4.agc:266
//
// IMU_PERFORMANCE_TESTS_4.agc:267
//PERFERAS	EXIT
// slot 34298
    34298, 65532
)).

// bank 37, slots 34299-34309
function agcAotUnit2268 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34303 {
        if slot <= 34300 {
            if slot <= 34299 {
// IMU_PERFORMANCE_TESTS_4.agc:268
//		CA	EBANK7
// slot 34299
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
// IMU_PERFORMANCE_TESTS_4.agc:269
//		TS	EBANK
// slot 34300
                if slot <> 34300 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34301 {
// IMU_PERFORMANCE_TESTS_4.agc:270
//		EBANK=	ATIGINC
// IMU_PERFORMANCE_TESTS_4.agc:271
//		TC	ATIGINC		# GOTO ERASABLE TO CALCULATE ONLY TO RETN
// slot 34301
                if slot <> 34301 or instruction <> 768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34302 {
// IMU_PERFORMANCE_TESTS_4.agc:272
//
// IMU_PERFORMANCE_TESTS_4.agc:273
//# 			     CAUTION
// IMU_PERFORMANCE_TESTS_4.agc:274
//#
// IMU_PERFORMANCE_TESTS_4.agc:275
//# THE ERASABLE PROGRAM THAT DOES THE CALCULATIONS MUST BE LOADED
// IMU_PERFORMANCE_TESTS_4.agc:276
//# BEFORE ANY ATTEMPT IS MAKE TO RUN THE IMU PERFORMANCE TEST
// IMU_PERFORMANCE_TESTS_4.agc:277
//
// IMU_PERFORMANCE_TESTS_4.agc:278
//		EBANK=	AZIMUTH
// IMU_PERFORMANCE_TESTS_4.agc:279
//		CCS	LENGTHOT
// slot 34302
                    if slot <> 34302 or instruction <> 4874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:280
//		TC	SLEEPIE
// slot 34303
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
// IMU_PERFORMANCE_TESTS_4.agc:281
//		CCS	TORQNDX
// slot 34304
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
// IMU_PERFORMANCE_TESTS_4.agc:282
//		TCF	+2
// slot 34305
                    if slot <> 34305 or instruction <> 5635 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5635, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:283
//		TC	SETUPER1
// slot 34306
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
// IMU_PERFORMANCE_TESTS_4.agc:284
//		CA	CDUX
// slot 34307
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
// IMU_PERFORMANCE_TESTS_4.agc:285
//		TS	LOSVEC	 +1	# FOR TROUBLESHOOTING VD POSNS 2$4
// slot 34308
                    if slot <> 34308 or instruction <> 23308 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23308, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:286
//
// IMU_PERFORMANCE_TESTS_4.agc:287
//# Page 388
// IMU_PERFORMANCE_TESTS_4.agc:288
//SETUPER1	TC	INTPRET
// slot 34309
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
// IMU_PERFORMANCE_TESTS_4.agc:289
//		DLOAD	PDDL		# ANGLES FROM DRIFT TEST ONLY
// slot 34310
    34310, 54730,
// IMU_PERFORMANCE_TESTS_4.agc:290
//			ANGZ
// slot 34311
    34311, 2678,
// IMU_PERFORMANCE_TESTS_4.agc:291
//			ANGY
// slot 34312
    34312, 2686,
// IMU_PERFORMANCE_TESTS_4.agc:292
//		PDDL	VDEF
// slot 34313
    34313, 46762,
// IMU_PERFORMANCE_TESTS_4.agc:293
//			ANGX
// slot 34314
    34314, 2690,
// IMU_PERFORMANCE_TESTS_4.agc:294
//		VCOMP	VXSC
// slot 34315
    34315, 61820,
// IMU_PERFORMANCE_TESTS_4.agc:295
//			GEORGEJ
// slot 34316
    34316, 31888,
// IMU_PERFORMANCE_TESTS_4.agc:296
//		MXV	VSR1
// slot 34317
    34317, 62114,
// IMU_PERFORMANCE_TESTS_4.agc:297
//			XSM
// slot 34318
    34318, 2886,
// IMU_PERFORMANCE_TESTS_4.agc:298
//		STORE	OGC
// slot 34319
    34319, 3008,
// IMU_PERFORMANCE_TESTS_4.agc:299
//		EXIT
// slot 34320
    34320, 65532
)).

// bank 37, slots 34321-34322
function agcAotUnit2269 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34321 {
// IMU_PERFORMANCE_TESTS_4.agc:300
//
// IMU_PERFORMANCE_TESTS_4.agc:301
//		CA	OGCPL
// slot 34321
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
// IMU_PERFORMANCE_TESTS_4.agc:302
//		TC	BANKCALL
// slot 34322
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
// IMU_PERFORMANCE_TESTS_4.agc:303
//		CADR	IMUPULSE
// slot 34323
    34323, 15782
)).

// bank 37, slots 34324-34327
function agcAotUnit2270 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34325 {
        if slot <= 34324 {
// IMU_PERFORMANCE_TESTS_4.agc:304
//		TC	IMUSLLLG
// slot 34324
            if slot <> 34324 or instruction <> 1229 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1229, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:305
//GEOSTRT4	CCS	TORQNDX		# ONLY POSITIVE IF IN VERTICAL DRIFT TEST
// slot 34325
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
// IMU_PERFORMANCE_TESTS_4.agc:306
//		TC	VALMIS
// slot 34326
            if slot <> 34326 or instruction <> 1203 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1203, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:307
//		TC	INTPRET
// slot 34327
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
// IMU_PERFORMANCE_TESTS_4.agc:308
//		CALL
// slot 34328
    34328, 65320,
// IMU_PERFORMANCE_TESTS_4.agc:309
//			ERTHRVSE
// slot 34329
    34329, 64002,
// IMU_PERFORMANCE_TESTS_4.agc:310
//		EXIT
// slot 34330
    34330, 65532
)).

// bank 37, slots 34331-34340
function agcAotUnit2271 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34335 {
        if slot <= 34332 {
            if slot <= 34331 {
// IMU_PERFORMANCE_TESTS_4.agc:311
//		TC	TORQUE
// slot 34331
                if slot <> 34331 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// IMU_PERFORMANCE_TESTS_4.agc:312
//
// IMU_PERFORMANCE_TESTS_4.agc:313
//SLEEPIE		TS	LENGTHOT	# TEST NOT OVER-DECREMENT LENGTHOT
// slot 34332
                if slot <> 34332 or instruction <> 23306 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34333 {
// IMU_PERFORMANCE_TESTS_4.agc:314
//		CCS	TORQNDX		# ARE WE DOING VERTDRIFT
// slot 34333
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
// IMU_PERFORMANCE_TESTS_4.agc:315
//		TC	EARTHR*
// slot 34334
                    if slot <> 34334 or instruction <> 1319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1319, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:316
//		TC	ENDOFJOB
// slot 34335
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
// IMU_PERFORMANCE_TESTS_4.agc:317
//
// IMU_PERFORMANCE_TESTS_4.agc:318
//SOMEERRR	CA	EBANK5
// slot 34336
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
// IMU_PERFORMANCE_TESTS_4.agc:319
//		TS	EBANK
// slot 34337
                if slot <> 34337 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34338 {
// IMU_PERFORMANCE_TESTS_4.agc:320
//		CA	ONE
// slot 34338
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
// IMU_PERFORMANCE_TESTS_4.agc:321
//		TS	OVFLOWCK	# STOP ALLOOP FROM CALLING ITSELF
// slot 34339
                    if slot <> 34339 or instruction <> 23422 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// IMU_PERFORMANCE_TESTS_4.agc:322
//		TC	ALARM
// slot 34340
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
// IMU_PERFORMANCE_TESTS_4.agc:323
//		OCT	1600
// slot 34341
    34341, 1792
)).

// bank 37, slots 34342-34345
function agcAotUnit2272 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34343 {
        if slot <= 34342 {
// IMU_PERFORMANCE_TESTS_4.agc:324
//		TC	ENDTEST1
// slot 34342
            if slot <> 34342 or instruction <> 1208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:325
//SOMERR2		CAF	OCT1601
// slot 34343
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
// IMU_PERFORMANCE_TESTS_4.agc:326
//		TC	VARALARM
// slot 34344
            if slot <> 34344 or instruction <> 3044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// IMU_PERFORMANCE_TESTS_4.agc:327
//		TC	DOWNFLAG
// slot 34345
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
// IMU_PERFORMANCE_TESTS_4.agc:328
//		ADRES	IMUSE
// slot 34346
    34346, 14
)).

// bank 37, slots 34347-34347
function agcAotUnit2273 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// IMU_PERFORMANCE_TESTS_4.agc:329
//		TC	ENDOFJOB
// slot 34347
    if slot <> 34347 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2273] to agcAotUnit2273@.

agcAotInstallSourceRope(list(
// IMU_PERFORMANCE_TESTS_4.agc:330
//
// IMU_PERFORMANCE_TESTS_4.agc:331
//OCT1601		OCT	01601
// slot 34348
    34348, 1794,
// IMU_PERFORMANCE_TESTS_4.agc:332
//DEC585		OCT	06200		# 3200 B+14 ORDER IS IMPORTANT
// slot 34349
    34349, 6400,
// IMU_PERFORMANCE_TESTS_4.agc:333
//SCHZEROS	2DEC	.00000000
// slot 34350 34351
    34350, 0, 34351, 0,
// IMU_PERFORMANCE_TESTS_4.agc:334
//# Page 389
// IMU_PERFORMANCE_TESTS_4.agc:335
//		2DEC	.00000000
// slot 34352 34353
    34352, 0, 34353, 0,
// IMU_PERFORMANCE_TESTS_4.agc:336
//
// IMU_PERFORMANCE_TESTS_4.agc:337
//		OCT	00000
// slot 34354
    34354, 0,
// IMU_PERFORMANCE_TESTS_4.agc:338
//ONEDPP		OCT	00000		# ORDER IS IMPORTANT
// slot 34355
    34355, 0,
// IMU_PERFORMANCE_TESTS_4.agc:339
//		OCT	00001
// slot 34356
    34356, 2,
// IMU_PERFORMANCE_TESTS_4.agc:340
//
// IMU_PERFORMANCE_TESTS_4.agc:341
//INTVAL		OCT	4
// slot 34357
    34357, 8,
// IMU_PERFORMANCE_TESTS_4.agc:342
//		OCT	2
// slot 34358
    34358, 4,
// IMU_PERFORMANCE_TESTS_4.agc:343
//		DEC	144
// slot 34359
    34359, 288,
// IMU_PERFORMANCE_TESTS_4.agc:344
//		DEC	-1
// slot 34360
    34360, 65532,
// IMU_PERFORMANCE_TESTS_4.agc:345
//SOUPLY		2DEC	.93505870	# INITIAL GAINS FOR PIP OUTPUTS
// slot 34361 34362
    34361, 30640, 34362, 58,
// IMU_PERFORMANCE_TESTS_4.agc:346
//
// IMU_PERFORMANCE_TESTS_4.agc:347
//		2DEC	.26266423	# INITIAL GAINS/4 FOR ERECTION ANGLES
// slot 34363 34364
    34363, 8606, 34364, 16080,
// IMU_PERFORMANCE_TESTS_4.agc:348
//
// IMU_PERFORMANCE_TESTS_4.agc:349
//77DECML		DEC	77
// slot 34365
    34365, 154,
// IMU_PERFORMANCE_TESTS_4.agc:350
//ALXXXZ		GENADR	ALX1S 	-1
// slot 34366
    34366, 1606,
// IMU_PERFORMANCE_TESTS_4.agc:351
//PIPASC		2DEC	.13055869
// slot 34367 34368
    34367, 4278, 34368, 2410,
// IMU_PERFORMANCE_TESTS_4.agc:352
//
// IMU_PERFORMANCE_TESTS_4.agc:353
//VELSC		2DEC	-.52223476	# 512/980.402
// slot 34369 34370
    34369, 48422, 34370, 55890,
// IMU_PERFORMANCE_TESTS_4.agc:354
//
// IMU_PERFORMANCE_TESTS_4.agc:355
//ALSK		2DEC	.17329931	# SSWAY VEL GAIN X 980.402/4096
// slot 34371 34372
    34371, 5678, 34372, 11006,
// IMU_PERFORMANCE_TESTS_4.agc:356
//
// IMU_PERFORMANCE_TESTS_4.agc:357
//		2DEC	-.00835370	# SSWAY ACCEL GAIN X 980.402/4096
// slot 34373 34374
    34373, 65262, 34374, 37124,
// IMU_PERFORMANCE_TESTS_4.agc:358
//
// IMU_PERFORMANCE_TESTS_4.agc:359
//GEORGEJ		2DEC	.63661977
// slot 34375 34376
    34375, 20860, 34376, 12396,
// IMU_PERFORMANCE_TESTS_4.agc:360
//
// IMU_PERFORMANCE_TESTS_4.agc:361
//GEORGEK		2DEC	.59737013
// slot 34377 34378
    34377, 19574, 34378, 10230
)).

// no code for the lines below
// IMU_PERFORMANCE_TESTS_4.agc:362
//
