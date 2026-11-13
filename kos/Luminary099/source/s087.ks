// PORT: Original source unit TRIM_GIMBAL_CONTROL_SYSTEM.agc.
// PORT: Physical bank 21. Shared continuation entries, slots 20031–20047.
function agcAotUnit1231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20038 {
        if slot <= 20034 {
            if slot <= 20032 {
                if slot <= 20031 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:2
//# Filename:	TRIM_GIMBAL_CNTROL_SYSTEM.agc
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:9
//# Pages:	1472-1485
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:13
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:22
//# actually created.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:23
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:25
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:28
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:29
//# Page 1472
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:30
//		BANK	21
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:31
//		EBANK=	QDIFF
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:32
//		SETLOC	DAPS4
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:33
//		BANK
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:34
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:35
//		COUNT*	$$/DAPGT
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:36
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:37
//# CONTROL REACHES THIS POINT UNDER EITHER OF THE FOLLOWING TWO CONDITIONS ONCE THE DESCENT ENGINE AND THE DIGITAL
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:38
//# AUTOPILOT ARE BOTH ON:
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:39
//#	A) THE TRIM GIMBAL CONTROL LAW WAS ON DURING THE PREVIOUS Q,R-AXIS TIME5 INTERRUPT (OR THE DAPIDLER
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:40
//#	   INITIALIZATION WAS SET FOR TRIM GIMBAL CONTROL AND THIS IS THE FIRST PASS), OR
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:41
//#	B) THE Q,R-AXES RCS AUTOPILOT DETERMINED THAT THE VEHICLE WAS ENTERING (OR HAD JUST ENTERED) A COAST
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:42
//#	   ZONE WITH A SMALL OFFSET ANGULAR ACCELERATION.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:43
//# GTS IS THE ENTRY TO THE GIMBAL TRIM SYSTEM FOR CONTROLLING ATTITUDE ERRORS AND RATES AS WELL AS ACCELERATIONS.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:44
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:45
//GTS		CAF	NEGONE		# MAKE THE NEXT PASS THROUGH THE DAP BE
// PORT: Fixed ROM slots 20031.
                    if slot <> 20031 or instruction <> 16359 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:46
//		TS	COTROLER	#   THROUGH RCS CONTROL,
// PORT: Fixed ROM slots 20032.
                    if slot <> 20032 or instruction <> 23449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20033 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:47
//		CAF	FOUR		#   AND ENSURE THAT IT IS NOT A SKIP.
// PORT: Fixed ROM slots 20033.
                    if slot <> 20033 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:48
//		TS	SKIPU
// PORT: Fixed ROM slots 20034.
                    if slot <> 20034 or instruction <> 23389 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23389, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20036 {
                if slot <= 20035 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:49
//		TS	SKIPV
// PORT: Fixed ROM slots 20035.
                    if slot <> 20035 or instruction <> 23390 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23390, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:50
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:51
//		CAF	TWO
// PORT: Fixed ROM slots 20036.
                    if slot <> 20036 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                if slot <= 20037 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:52
//		TS	INGTS		# SET INDICATOR OF GTS CONTROL POSITIVE.
// PORT: Fixed ROM slots 20037.
                    if slot <> 20037 or instruction <> 23451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23451, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:53
//		TS	QGIMTIMR	# SET TIMERS TO 200 MSEC TO AVOID BOTH
// PORT: Fixed ROM slots 20038.
                    if slot <> 20038 or instruction <> 23450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23450, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20042 {
            if slot <= 20040 {
                if slot <= 20039 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:54
//		TS	RGIMTIMR	# RUNAWAY AND INTERFERENCE BY NULLING.
// PORT: Fixed ROM slots 20039.
                    if slot <> 20039 or instruction <> 23452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23452, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:55
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:56
//# THE DRIVE SETTING ALGORITHM
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:57
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:58
//# DEL = SGN(OMEGA + ALPHA*ABS(ALPHA)/(2*K))
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:59
//#					      2               1/2                  2       3/2
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:60
//# NEGUSUM = ERROR*K + ALPHA*(DEL*OMEGA + ALPHA /(3*K)) + DEL*K   (DEL*OMEGA + ALPHA /(2*K))
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:61
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:62
//# DRIVE = -SGN(NEGUSUM)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:63
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:64
//		CA	SR		# SAVE THE SR.  SHIFT IT LEFT TO CORRECT
// PORT: Fixed ROM slots 20040.
                    if slot <> 20040 or instruction <> 12305 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 17).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20041 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:65
//		AD	A		# FOR THE RIGHT SHIFT DUE TO EDITING.
// PORT: Fixed ROM slots 20041.
                    if slot <> 20041 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:66
//		TS	SAVESR
// PORT: Fixed ROM slots 20042.
                    if slot <> 20042 or instruction <> 23365 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23365, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20044 {
                if slot <= 20043 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:67
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:68
//GTSGO+ON	CAF	TWO		# SET INDEXER FOR R-AXIS CALCULATIONS.
// PORT: Fixed ROM slots 20043.
                    if slot <> 20043 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:69
//		TCF	GOQTRIMG +1
// PORT: Fixed ROM slots 20044.
                    if slot <> 20044 or instruction <> 5710 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5710, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20045 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:70
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:71
//GOQTRIMG	CAF	ZERO		# SET INDEXER FOR Q-AXIS CALCULATIONS
// PORT: Fixed ROM slots 20045.
                    if slot <> 20045 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20046 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:72
//		TS	QRCNTR
// PORT: Fixed ROM slots 20046.
                        if slot <> 20046 or instruction <> 23528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:73
//# Page 1473
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:74
//# RSB 2009 -----------------------------------------------------------------------
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:75
//# Everything between this line and the similar line below was simply filled-in
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:76
//# as-is from Luminary 131, and then verified to assemble to the proper binary
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:77
//# values.  This area is blank on the Luminary 099 print-out, as if the printer
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:78
//# ribbon had run out.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:79
//		INDEX	QRCNTR		# AOS SCALED AT PI/2
// PORT: Fixed ROM slots 20047.
                        if slot <> 20047 or instruction <> 21480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21480, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21480, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1231] to agcAotUnit1231@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:80
//		CA	AOSQ
// PORT: Fixed ROM slots 20048.
    20048, 26302
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20049–20053.
function agcAotUnit1232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20050 {
        if slot <= 20049 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:81
//		EXTEND
// PORT: Fixed ROM slots 20049.
            if slot <> 20049 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:82
//		MP	BIT2		# RESCALE AOS TO PI/4
// PORT: Fixed ROM slots 20050.
            if slot <> 20050 or instruction <> 31210 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2538, readEffective:call(words, 2538)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20051 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:83
//		EXTEND
// PORT: Fixed ROM slots 20051.
            if slot <> 20051 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20052 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:84
//		BZF	GTSQAXIS -3	# USE FULL SCALE FOR LARGER AOS ESTIMATES.
// PORT: Fixed ROM slots 20052.
                if slot <> 20052 or instruction <> 5720 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5720, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:85
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:86
//		INDEX	A
// PORT: Fixed ROM slots 20053.
                if slot <> 20053 or instruction <> 20480 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20480, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20480, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1232] to agcAotUnit1232@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:87
//		CS	LIMITS		# LIMITS +1 CONTAINS NEGMAX.
// PORT: Fixed ROM slots 20054.
    20054, 37816
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20055–20057.
function agcAotUnit1233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20055 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:88
//		XCH	L		# LIMITS -1 CONTAINS POSMAX.
// PORT: Fixed ROM slots 20055.
        if slot <> 20055 or instruction <> 23553 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 1, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20056 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:89
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:90
//		CCS	QRCNTR		# PICK UP RATE FOR THIS AXIS.  RATE CELLS
// PORT: Fixed ROM slots 20056.
            if slot <> 20056 or instruction <> 5096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 1000).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:91
//		INDEX	A		# USE ADJACENT, NOT SEPARATED.  AT PI/4
// PORT: Fixed ROM slots 20057.
            if slot <> 20057 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1233] to agcAotUnit1233@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:92
//		CA	EDOTQ
// PORT: Fixed ROM slots 20058.
    20058, 26172
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20059–20060.
function agcAotUnit1234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20059 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:93
//GTSQAXIS	DXCH	WCENTRAL
// PORT: Fixed ROM slots 20059.
        if slot <> 20059 or instruction <> 22500 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 996, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:94
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:95
//		INDEX	QRCNTR		# COLLECT K FOR THIS AXIS
// PORT: Fixed ROM slots 20060.
        if slot <> 20060 or instruction <> 21480 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21480, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21480, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1234] to agcAotUnit1234@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:96
//		CA	KQ
// PORT: Fixed ROM slots 20061.
    20061, 26248
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20062–20065.
function agcAotUnit1235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20063 {
        if slot <= 20062 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:97
//		TS	KCENTRAL
// PORT: Fixed ROM slots 20062.
            if slot <> 20062 or instruction <> 23521 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23521, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:98
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:99
//		EXTEND			# CONTROL AUTHORITY ZERO.  AVOID DRIVING
// PORT: Fixed ROM slots 20063.
            if slot <> 20063 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20064 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:100
//		BZF	POSDRIVE +1	# ENGINE BELL TO THE STOPS.
// PORT: Fixed ROM slots 20064.
            if slot <> 20064 or instruction <> 6014 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6014, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:101
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:102
//		INDEX	QRCNTR		# QDIFF, RDIFF ARE STORED IN D.P.
// PORT: Fixed ROM slots 20065.
            if slot <> 20065 or instruction <> 21480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1235] to agcAotUnit1235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:103
//		CAE	QDIFF
// PORT: Fixed ROM slots 20066.
    20066, 26192
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20067–20130.
function agcAotUnit1236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20098 {
        if slot <= 20082 {
            if slot <= 20074 {
                if slot <= 20070 {
                    if slot <= 20068 {
                        if slot <= 20067 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:104
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:105
//ALGORTHM	EXTEND			# Q(R)DIFF IS THETA (ERROR) SCALED AT PI.
// PORT: Fixed ROM slots 20067.
                            if slot <> 20067 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:106
//		MP	KCENTRAL	# FORM K*ERROR AT PI(2)/2(8), IN D.P.
// PORT: Fixed ROM slots 20068.
                            if slot <> 20068 or instruction <> 29665 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 993, readEffective:call(words, 993)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20069 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:107
//		LXCH	K2THETA
// PORT: Fixed ROM slots 20069.
                            if slot <> 20069 or instruction <> 10207 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 991, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:108
//		EXTEND
// PORT: Fixed ROM slots 20070.
                            if slot <> 20070 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20072 {
                        if slot <= 20071 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:109
//		MP	BIT5		# RESCALE TO 4*PI(2)
// PORT: Fixed ROM slots 20071.
                            if slot <> 20071 or instruction <> 31207 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2535, readEffective:call(words, 2535)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:110
//		DXCH	K2THETA
// PORT: Fixed ROM slots 20072.
                            if slot <> 20072 or instruction <> 22496 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 992, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20073 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:111
//		EXTEND
// PORT: Fixed ROM slots 20073.
                            if slot <> 20073 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:112
//		MP	BIT5		# FIRST TERM OF NEGUSUM IN K2THETA.
// PORT: Fixed ROM slots 20074.
                            if slot <> 20074 or instruction <> 31207 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2535, readEffective:call(words, 2535)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 20078 {
                    if slot <= 20076 {
                        if slot <= 20075 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:113
//		ADS	K2THETA +1	# NO CARRY NEEDED	D.P. AT 4*PI(2)
// PORT: Fixed ROM slots 20075.
                            if slot <> 20075 or instruction <> 12256 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 992).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:114
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:115
//		CS	ACENTRAL	# FORM ALPHA(2)/(2*K) AT 16*PI, IN D.P.,
// PORT: Fixed ROM slots 20076.
                            if slot <> 20076 or instruction <> 17380 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 996).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20077 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:116
//		EXTEND			# LIMITING QUOTIENT TO AVOID OVERFLOW.
// PORT: Fixed ROM slots 20077.
                            if slot <> 20077 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:117
//		MP	BIT14		# -ALPHA/2 IN A, SCALED AT PI/4
// PORT: Fixed ROM slots 20078.
                            if slot <> 20078 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20080 {
                        if slot <= 20079 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:118
//		EXTEND
// PORT: Fixed ROM slots 20079.
                            if slot <> 20079 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:119
//		MP	ACENTRAL	# -ALPHA(2)/2 IN A,L, SCALED AT PI(2)/16)
// PORT: Fixed ROM slots 20080.
                            if slot <> 20080 or instruction <> 29668 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 996, readEffective:call(words, 996)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20081 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:120
//		AD	KCENTRAL
// PORT: Fixed ROM slots 20081.
                            if slot <> 20081 or instruction <> 25569 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 993).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:121
//		EXTEND
// PORT: Fixed ROM slots 20082.
                            if slot <> 20082 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 20090 {
                if slot <= 20086 {
                    if slot <= 20084 {
                        if slot <= 20083 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:122
//		BZMF	HUGEQUOT	# K-ALPHA(2)/2 SHOULD BE PNZ FO DIVISION
// PORT: Fixed ROM slots 20083.
                            if slot <> 20083 or instruction <> 26240 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26240, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:123
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:124
//		EXTEND
// PORT: Fixed ROM slots 20084.
                            if slot <> 20084 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20085 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:125
//		DCS	A		# ALPHA(2)/2 - K
// PORT: Fixed ROM slots 20085.
                            if slot <> 20085 or instruction <> 16385 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 1, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:126
//		AD	KCENTRAL
// PORT: Fixed ROM slots 20086.
                            if slot <> 20086 or instruction <> 25569 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 993).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20088 {
                        if slot <= 20087 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:127
//# RSB 2009 -----------------------------------------------------------------------
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:128
//		EXTEND
// PORT: Fixed ROM slots 20087.
                            if slot <> 20087 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:129
//		DV	KCENTRAL	# HIGH ORDER OF QUOTIENT.
// PORT: Fixed ROM slots 20088.
                            if slot <> 20088 or instruction <> 5089 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 993, readEffective:call(words, 993)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20089 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:130
//		XCH	A2CNTRAL
// PORT: Fixed ROM slots 20089.
                            if slot <> 20089 or instruction <> 24550 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 998, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:131
//		CA	L		# SHIFT UP THE REMAINDER.
// PORT: Fixed ROM slots 20090.
                            if slot <> 20090 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 20094 {
                    if slot <= 20092 {
                        if slot <= 20091 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:132
//		LXCH	7		# ZERO LOW-ORDER DIVIDEND.
// PORT: Fixed ROM slots 20091.
                            if slot <> 20091 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:133
//		EXTEND
// PORT: Fixed ROM slots 20092.
                            if slot <> 20092 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20093 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:134
//# Page 1474
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:135
//		DV	KCENTRAL
// PORT: Fixed ROM slots 20093.
                            if slot <> 20093 or instruction <> 5089 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 993, readEffective:call(words, 993)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:136
//		XCH	A2CNTRAL +1	# QUOTIENT STORED AT 16*PI , D.P.
// PORT: Fixed ROM slots 20094.
                            if slot <> 20094 or instruction <> 24551 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 999, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20096 {
                        if slot <= 20095 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:137
//		TCF	HAVEQUOT
// PORT: Fixed ROM slots 20095.
                            if slot <> 20095 or instruction <> 5763 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5763, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:138
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:139
//HUGEQUOT	CA	POSMAX
// PORT: Fixed ROM slots 20096.
                            if slot <> 20096 or instruction <> 14811 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20097 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:140
//		TS	L
// PORT: Fixed ROM slots 20097.
                            if slot <> 20097 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:141
//		DXCH	A2CNTRAL	# LIMITED QUOTIENT STORED AT 16*PI, D.P.
// PORT: Fixed ROM slots 20098.
                            if slot <> 20098 or instruction <> 22503 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 999, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 20114 {
            if slot <= 20106 {
                if slot <= 20102 {
                    if slot <= 20100 {
                        if slot <= 20099 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:142
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:143
//HAVEQUOT	CA	WCENTRAL
// PORT: Fixed ROM slots 20099.
                            if slot <> 20099 or instruction <> 13283 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 995).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:144
//		EXTEND
// PORT: Fixed ROM slots 20100.
                            if slot <> 20100 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20101 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:145
//		MP	BIT9		# RESCALE OMEGA AT 16*PI IN D.P.
// PORT: Fixed ROM slots 20101.
                            if slot <> 20101 or instruction <> 31203 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:146
//		DXCH	K2CNTRAL	# LOWER WORD OVERLAYS OMEGA IN WCENTRAL
// PORT: Fixed ROM slots 20102.
                            if slot <> 20102 or instruction <> 22499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 995, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20104 {
                        if slot <= 20103 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:147
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:148
//		EXTEND
// PORT: Fixed ROM slots 20103.
                            if slot <> 20103 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:149
//		DCA	K2CNTRAL
// PORT: Fixed ROM slots 20104.
                            if slot <> 20104 or instruction <> 13283 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 995, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20105 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:150
//		DXCH	FUNCTION
// PORT: Fixed ROM slots 20105.
                            if slot <> 20105 or instruction <> 22506 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1002, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:151
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:152
//		CA	ACENTRAL	# GET ALPHA*ABS(ALPHA)/(2*K)
// PORT: Fixed ROM slots 20106.
                            if slot <> 20106 or instruction <> 13284 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 996).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 20110 {
                    if slot <= 20108 {
                        if slot <= 20107 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:153
//		EXTEND
// PORT: Fixed ROM slots 20107.
                            if slot <> 20107 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:154
//		BZMF	+4
// PORT: Fixed ROM slots 20108.
                            if slot <> 20108 or instruction <> 26256 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26256, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20109 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:155
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:156
//		EXTEND
// PORT: Fixed ROM slots 20109.
                            if slot <> 20109 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:157
//		DCA	A2CNTRAL
// PORT: Fixed ROM slots 20110.
                            if slot <> 20110 or instruction <> 13287 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 999, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20112 {
                        if slot <= 20111 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:158
//		TCF	+3
// PORT: Fixed ROM slots 20111.
                            if slot <> 20111 or instruction <> 5778 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5778, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:159
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:160
//		EXTEND
// PORT: Fixed ROM slots 20112.
                            if slot <> 20112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20113 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:161
//		DCS	A2CNTRAL
// PORT: Fixed ROM slots 20113.
                            if slot <> 20113 or instruction <> 17383 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 999, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:162
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:163
//		DAS	FUNCTION	# OMEGA + ALPHA*ABS(ALPHA)/(2*K) AT 16*PI
// PORT: Fixed ROM slots 20114.
                            if slot <> 20114 or instruction <> 9194 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1002) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 20122 {
                if slot <= 20118 {
                    if slot <= 20116 {
                        if slot <= 20115 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:164
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:165
//		CCS	FUNCTION	# DEL = +1 FOR FUNCT1 GREATER THAN ZERO.
// PORT: Fixed ROM slots 20115.
                            if slot <> 20115 or instruction <> 5097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1001).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:166
//		TCF	POSFNCT1	# OTHERWISE DEL = -1
// PORT: Fixed ROM slots 20116.
                            if slot <> 20116 or instruction <> 5784 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5784, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20117 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:167
//		TCF	+2
// PORT: Fixed ROM slots 20117.
                            if slot <> 20117 or instruction <> 5783 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5783, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:168
//		TCF	NEGFNCT1
// PORT: Fixed ROM slots 20118.
                            if slot <> 20118 or instruction <> 5786 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5786, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20120 {
                        if slot <= 20119 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:169
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:170
//		CCS	FUNCTION +1	# USE LOW ORDER WORD SINCE HIGH IS ZERO
// PORT: Fixed ROM slots 20119.
                            if slot <> 20119 or instruction <> 5098 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1002).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:171
//POSFNCT1	CAF	BIT1
// PORT: Fixed ROM slots 20120.
                            if slot <> 20120 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20121 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:172
//		TCF	+2
// PORT: Fixed ROM slots 20121.
                            if slot <> 20121 or instruction <> 5787 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5787, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:173
//NEGFNCT1	CS	BIT1
// PORT: Fixed ROM slots 20122.
                            if slot <> 20122 or instruction <> 18923 { return choose false if checkOnly else -1. }
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
                if slot <= 20126 {
                    if slot <= 20124 {
                        if slot <= 20123 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:174
//		TS	DEL
// PORT: Fixed ROM slots 20123.
                            if slot <> 20123 or instruction <> 23525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23525, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:175
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:176
//		CCS	DEL		# REPLACE OMEGA BY DEL*OMEGA
// PORT: Fixed ROM slots 20124.
                            if slot <> 20124 or instruction <> 5093 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 997).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20125 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:177
//		TCF	FUNCT2		# POSITIVE DEL VALUE.  PROCEED.
// PORT: Fixed ROM slots 20125.
                            if slot <> 20125 or instruction <> 5799 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5799, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:178
//		TCF	DEFUNCT
// PORT: Fixed ROM slots 20126.
                            if slot <> 20126 or instruction <> 5792 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5792, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 20128 {
                        if slot <= 20127 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:179
//		TCF	NEGFNCT2
// PORT: Fixed ROM slots 20127.
                            if slot <> 20127 or instruction <> 5796 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5796, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:180
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:181
//DEFUNCT		TS	K2CNTRAL
// PORT: Fixed ROM slots 20128.
                            if slot <> 20128 or instruction <> 23522 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23522, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20129 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:182
//		TS	K2CNTRAL +1
// PORT: Fixed ROM slots 20129.
                            if slot <> 20129 or instruction <> 23523 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23523, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:183
//		TCF	FUNCT2
// PORT: Fixed ROM slots 20130.
                            if slot <> 20130 or instruction <> 5799 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5799, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1236] to agcAotUnit1236@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:184
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:185
//# Page 1475
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:186
//NEG1/3		DEC	-.33333
// PORT: Fixed ROM slots 20131.
    20131, 54612
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20132–20164.
function agcAotUnit1237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20147 {
        if slot <= 20139 {
            if slot <= 20135 {
                if slot <= 20133 {
                    if slot <= 20132 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:187
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:188
//NEGFNCT2	EXTEND
// PORT: Fixed ROM slots 20132.
                        if slot <> 20132 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:189
//		DCS	K2CNTRAL
// PORT: Fixed ROM slots 20133.
                        if slot <> 20133 or instruction <> 17379 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 995, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20134 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:190
//		DXCH	K2CNTRAL
// PORT: Fixed ROM slots 20134.
                        if slot <> 20134 or instruction <> 22499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 995, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:191
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:192
//FUNCT2		EXTEND
// PORT: Fixed ROM slots 20135.
                        if slot <> 20135 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20137 {
                    if slot <= 20136 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:193
//		DCA	A2CNTRAL
// PORT: Fixed ROM slots 20136.
                        if slot <> 20136 or instruction <> 13287 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 999, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:194
//		DAS	K2CNTRAL	# DEL*OMEGA + ALPHA(2)/(2*K) AT 16*PI,D.P.
// PORT: Fixed ROM slots 20137.
                        if slot <> 20137 or instruction <> 9187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 995) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20138 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:195
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:196
//FUNCT3		CA	A2CNTRAL
// PORT: Fixed ROM slots 20138.
                        if slot <> 20138 or instruction <> 13286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 998).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:197
//		EXTEND
// PORT: Fixed ROM slots 20139.
                        if slot <> 20139 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20143 {
                if slot <= 20141 {
                    if slot <= 20140 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:198
//		MP	NEG1/3
// PORT: Fixed ROM slots 20140.
                        if slot <> 20140 or instruction <> 30371 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1699, readEffective:call(words, 1699)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:199
//		DXCH	A2CNTRAL
// PORT: Fixed ROM slots 20141.
                        if slot <> 20141 or instruction <> 22503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 999, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20142 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:200
//		CA	L
// PORT: Fixed ROM slots 20142.
                        if slot <> 20142 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:201
//		EXTEND
// PORT: Fixed ROM slots 20143.
                        if slot <> 20143 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20145 {
                    if slot <= 20144 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:202
//		MP	NEG1/3
// PORT: Fixed ROM slots 20144.
                        if slot <> 20144 or instruction <> 30371 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1699, readEffective:call(words, 1699)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:203
//		ADS	A2CNTRAL +1
// PORT: Fixed ROM slots 20145.
                        if slot <> 20145 or instruction <> 12263 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 999).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20146 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:204
//		TS	L
// PORT: Fixed ROM slots 20146.
                        if slot <> 20146 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:205
//		TCF	+2		# A2CNTRAL NOW CONTAINS  -ALPHA(2)/(6*K),
// PORT: Fixed ROM slots 20147.
                        if slot <> 20147 or instruction <> 5813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5813, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20155 {
            if slot <= 20151 {
                if slot <= 20149 {
                    if slot <= 20148 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:206
//		ADS	A2CNTRAL	# SCALED AT 16*PI, IN D.P.
// PORT: Fixed ROM slots 20148.
                        if slot <> 20148 or instruction <> 12262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 998).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:207
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:208
//		EXTEND
// PORT: Fixed ROM slots 20149.
                        if slot <> 20149 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20150 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:209
//		DCA	K2CNTRAL	# DEL*OMEGA + ALPHA(2)/(3*K) IN A2CNTRAL,
// PORT: Fixed ROM slots 20150.
                        if slot <> 20150 or instruction <> 13283 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 995, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:210
//		DAS	A2CNTRAL	# SCALED AT 16*PI, D.P.
// PORT: Fixed ROM slots 20151.
                        if slot <> 20151 or instruction <> 9191 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 999) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20153 {
                    if slot <= 20152 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:211
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:212
//		CA	A2CNTRAL
// PORT: Fixed ROM slots 20152.
                        if slot <> 20152 or instruction <> 13286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 998).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:213
//		EXTEND
// PORT: Fixed ROM slots 20153.
                        if slot <> 20153 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20154 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:214
//		MP	ACENTRAL
// PORT: Fixed ROM slots 20154.
                        if slot <> 20154 or instruction <> 29668 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 996, readEffective:call(words, 996)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:215
//		DAS	K2THETA
// PORT: Fixed ROM slots 20155.
                        if slot <> 20155 or instruction <> 9184 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 992) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20159 {
                if slot <= 20157 {
                    if slot <= 20156 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:216
//		CA	A2CNTRAL +1
// PORT: Fixed ROM slots 20156.
                        if slot <> 20156 or instruction <> 13287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 999).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:217
//		EXTEND
// PORT: Fixed ROM slots 20157.
                        if slot <> 20157 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20158 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:218
//		MP	ACENTRAL	# ACENTRAL MAY NOW BE OVERLAID.
// PORT: Fixed ROM slots 20158.
                        if slot <> 20158 or instruction <> 29668 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 996, readEffective:call(words, 996)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:219
//		ADS	K2THETA +1
// PORT: Fixed ROM slots 20159.
                        if slot <> 20159 or instruction <> 12256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20161 {
                    if slot <= 20160 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:220
//		TS	L
// PORT: Fixed ROM slots 20160.
                        if slot <> 20160 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:221
//		TCF	+2		# TWO TERMS OF NEGUSUM ACCUMULATED, SO FAR
// PORT: Fixed ROM slots 20161.
                        if slot <> 20161 or instruction <> 5827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5827, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20162 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:222
//		ADS	K2THETA		# SCALED AT 4*PI(2), IN D.P.
// PORT: Fixed ROM slots 20162.
                        if slot <> 20162 or instruction <> 12255 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 991).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 20163 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:223
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:224
//GETROOT		CA	K2CNTRAL	# K*(DEL*OMEGA + ALPHA(2)/(2*K)) IS THE
// PORT: Fixed ROM slots 20163.
                            if slot <> 20163 or instruction <> 13282 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:225
//		EXTEND			# TERM FOR WHICH A SQUARE ROOT IS NEEDED.
// PORT: Fixed ROM slots 20164.
                            if slot <> 20164 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1237] to agcAotUnit1237@.

// PORT: Physical bank 21. Shared continuation entries, slots 20165–20182.
function agcAotUnit1238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20173 {
        if slot <= 20168 {
            if slot <= 20166 {
                if slot <= 20165 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:226
//		MP	KCENTRAL	# K AT PI/2(8)
// PORT: Fixed ROM slots 20165.
                    if slot <> 20165 or instruction <> 29665 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 993, readEffective:call(words, 993)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:227
//		DXCH	FUNCTION
// PORT: Fixed ROM slots 20166.
                    if slot <> 20166 or instruction <> 22506 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1002, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20167 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:228
//		CA	K2CNTRAL +1
// PORT: Fixed ROM slots 20167.
                    if slot <> 20167 or instruction <> 13283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 995).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:229
//		EXTEND
// PORT: Fixed ROM slots 20168.
                    if slot <> 20168 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20170 {
                if slot <= 20169 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:230
//		MP	KCENTRAL
// PORT: Fixed ROM slots 20169.
                    if slot <> 20169 or instruction <> 29665 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 993, readEffective:call(words, 993)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:231
//		ADS	FUNCTION +1
// PORT: Fixed ROM slots 20170.
                    if slot <> 20170 or instruction <> 12266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1002).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20171 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:232
//		TS	L
// PORT: Fixed ROM slots 20171.
                    if slot <> 20171 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20172 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:233
//		TCF	+2
// PORT: Fixed ROM slots 20172.
                        if slot <> 20172 or instruction <> 5838 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5838, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:234
//		ADS	FUNCTION	# DESIRED TERM IN FUNCTION, AT PI(2)/16
// PORT: Fixed ROM slots 20173.
                        if slot <> 20173 or instruction <> 12265 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 1001).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20177 {
            if slot <= 20175 {
                if slot <= 20174 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:235
//# Page 1476
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:236
//		CCS	DEL
// PORT: Fixed ROM slots 20174.
                    if slot <> 20174 or instruction <> 5093 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 997).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:237
//		TCF	RSTOFGTS
// PORT: Fixed ROM slots 20175.
                    if slot <> 20175 or instruction <> 5972 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5972, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20176 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:238
//		TCF	NEGUSUM
// PORT: Fixed ROM slots 20176.
                    if slot <> 20176 or instruction <> 6006 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6006, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:239
//		TCF	NEGATE
// PORT: Fixed ROM slots 20177.
                    if slot <> 20177 or instruction <> 5843 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5843, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20179 {
                if slot <= 20178 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:240
//		TCF	NEGUSUM
// PORT: Fixed ROM slots 20178.
                    if slot <> 20178 or instruction <> 6006 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6006, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:241
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:242
//NEGATE		EXTEND
// PORT: Fixed ROM slots 20179.
                    if slot <> 20179 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20180 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:243
//		DCS	K2CNTRAL
// PORT: Fixed ROM slots 20180.
                    if slot <> 20180 or instruction <> 17379 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 995, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20181 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:244
//		DXCH	K2CNTRAL
// PORT: Fixed ROM slots 20181.
                        if slot <> 20181 or instruction <> 22499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 995, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:245
//		TCF	RSTOFGTS
// PORT: Fixed ROM slots 20182.
                        if slot <> 20182 or instruction <> 5972 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5972, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1238] to agcAotUnit1238@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:246
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:247
//		BANK	16
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:248
//		EBANK=	NEGUQ
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:249
//		SETLOC	DAPS1
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:250
//		BANK
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:251
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:252
//# THE WRCHN12 SUBROUTINE SETS BITS 9,10,11,12 OF CHANNEL 12 ON THE BASIS OF THE CONTENTS OF NEGUQ,NEGUR WHICH ARE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:253
//# THE NEGATIVES OF THE DESIRED ACCELERATION CHANGES.  ACDT+C12 SETS Q(R)ACCDOT TO REFLECT THE NEW DRIVES.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:254
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:255
//# WARNING:  ACDT+C12 AND WRCHN12 MUST BE CALLED WITH INTERRUPT INHIBITED.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:256
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:257
//BGIM		OCTAL	07400
// PORT: Fixed ROM slots 17373.
    17373, 7680
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17374–17401.
function agcAotUnit1036 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17387 {
        if slot <= 17380 {
            if slot <= 17376 {
                if slot <= 17374 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:258
//CHNL12		EQUALS	ITEMP6
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:259
//ACDT+C12	CS	NEGUQ
// PORT: Fixed ROM slots 17374.
                    if slot <> 17374 or instruction <> 17217 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 833).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17375 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:260
//		EXTEND			# GIMBAL DRIVE REQUESTS.
// PORT: Fixed ROM slots 17375.
                        if slot <> 17375 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:261
//		MP	ACCDOTQ
// PORT: Fixed ROM slots 17376.
                        if slot <> 17376 or instruction <> 29511 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 839, readEffective:call(words, 839)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17378 {
                    if slot <= 17377 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:262
//		LXCH	QACCDOT
// PORT: Fixed ROM slots 17377.
                        if slot <> 17377 or instruction <> 10056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 840, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:263
//		CS	NEGUR
// PORT: Fixed ROM slots 17378.
                        if slot <> 17378 or instruction <> 17219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 835).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17379 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:264
//		EXTEND
// PORT: Fixed ROM slots 17379.
                        if slot <> 17379 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:265
//		MP	ACCDOTR
// PORT: Fixed ROM slots 17380.
                        if slot <> 17380 or instruction <> 29513 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 841, readEffective:call(words, 841)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17383 {
                if slot <= 17381 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:266
//		LXCH	RACCDOT
// PORT: Fixed ROM slots 17381.
                    if slot <> 17381 or instruction <> 10058 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 842, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17382 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:267
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:268
//		CCS	NEGUQ
// PORT: Fixed ROM slots 17382.
                        if slot <> 17382 or instruction <> 4929 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:269
//		CAF	BIT10
// PORT: Fixed ROM slots 17383.
                        if slot <> 17383 or instruction <> 14818 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17385 {
                    if slot <= 17384 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:270
//		TCF	+2
// PORT: Fixed ROM slots 17384.
                        if slot <> 17384 or instruction <> 6122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6122, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:271
//		CAF	BIT9
// PORT: Fixed ROM slots 17385.
                        if slot <> 17385 or instruction <> 14819 { return choose false if checkOnly else -1. }
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
                    if slot <= 17386 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:272
//		TS	CHNL12
// PORT: Fixed ROM slots 17386.
                        if slot <> 17386 or instruction <> 22582 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22582, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:273
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:274
//		CCS	NEGUR
// PORT: Fixed ROM slots 17387.
                        if slot <> 17387 or instruction <> 4931 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 835).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17394 {
            if slot <= 17390 {
                if slot <= 17388 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:275
//		CAF	BIT12
// PORT: Fixed ROM slots 17388.
                    if slot <> 17388 or instruction <> 14816 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17389 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:276
//		TCF	+2
// PORT: Fixed ROM slots 17389.
                        if slot <> 17389 or instruction <> 6127 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6127, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:277
//		CAF	BIT11
// PORT: Fixed ROM slots 17390.
                        if slot <> 17390 or instruction <> 14817 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17392 {
                    if slot <= 17391 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:278
//		ADS	CHNL12		# (STORED RESULT NOT USED AT PRESENT)
// PORT: Fixed ROM slots 17391.
                        if slot <> 17391 or instruction <> 11318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 54).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:279
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:280
//		CS	BGIM
// PORT: Fixed ROM slots 17392.
                        if slot <> 17392 or instruction <> 18397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2013), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17393 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:281
//		EXTEND
// PORT: Fixed ROM slots 17393.
                        if slot <> 17393 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:282
//		RAND	CHAN12
// PORT: Fixed ROM slots 17394.
                        if slot <> 17394 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17397 {
                if slot <= 17395 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:283
//		AD	CHNL12
// PORT: Fixed ROM slots 17395.
                    if slot <> 17395 or instruction <> 24630 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 54).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17396 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:284
//		EXTEND
// PORT: Fixed ROM slots 17396.
                        if slot <> 17396 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:285
//		WRITE	CHAN12
// PORT: Fixed ROM slots 17397.
                        if slot <> 17397 or instruction <> 522 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17399 {
                    if slot <= 17398 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:286
//# Page 1477
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:287
//		CS	CALLGMBL	# TURN OFF REQUEST FOR ACDT+C12 EXECUTION.
// PORT: Fixed ROM slots 17398.
                        if slot <> 17398 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:288
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 17399.
                        if slot <> 17399 or instruction <> 29371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17400 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:289
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 17400.
                        if slot <> 17400 or instruction <> 23227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:290
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:291
//		TC	Q		# RETURN TO CALLER.
// PORT: Fixed ROM slots 17401.
                        if slot <> 17401 or instruction <> 2 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1036] to agcAotUnit1036@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:292
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:293
//		BANK	21
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:294
//		EBANK=	QDIFF
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:295
//		SETLOC	DAPS4
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:296
//		BANK
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:297
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:298
//# Page 1478
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:299
//# SUBROUTINE TIMEGMBL:	MOD 0, OCTOBER 1967, CRAIG WORK
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:300
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:301
//# TIMEGMBL COMPUTES THE DRIVE TIME NEEDED FOR THE TRIM GIMBAL TO POSITION THE DESCENT ENGINE NOZZLE SO AS TO NULL
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:302
//# THE OFFSET ANGULAR ACCELERATION ABOUT THE Q (OR R) AXIS.  INSTEAD OF USING AOSQ(R), TIMEGMBL USES .4*AOSQ(R),
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:303
//# SCALED AT PI/8.                         FOR EACH AXIS, THE DRIVE TIME IS COMPUTED AS ABS(ALPHA/ACCDOT).  A ZERO
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:304
//# ALPHA OR ACCDOT OR A ZERO QUOTIENT TURNS OFF THE GIMBAL DRIVE IMMEDIATELY.  OTHERWISE, THE GIMBAL IS TURNED ON
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:305
//# DRIVING IN THE CORRECT DIRECTION. THE Q(R)GIMTIMR IS SET TO TERMINATE THE DRIVE AND Q(R)ACCDOT
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:306
//# IS STORED TO REFLECT THE NEW ACCELERATION DERIVATIVE.  NEGUQ(R) WILL CONTAIN +1,+0,-1 FOR A Q(R)ACCDOT VALUE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:307
//# WHICH IS NEGATIVE, ZERO, OR POSITIVE.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:308
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:309
//# INPUTS:  AOSQ,AOSR, SCALED AT P1/2, AND ACCDOTQ, ACCDOTR AT PI/2(7).    PI/2(7).
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:310
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:311
//# OUTPUTS:   NEW GIMBAL DRIVE BITS IN CHANNEL 12,NEGUQ,NEGUR,QACCDOT AND RACCDOT, THE LAST SCALED AT PI/2(7).
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:312
//#	     Q(R)GIMTIMR WILL BE SET TO TIME AND TERMINATE GIMBAL DRIVE(S)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:313
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:314
//# DEBRIS:  A,L,Q, ITEMPS 2,3,6, RUPTREG2 AND ACDT+C12 DEBRIS.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:315
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:316
//# EXITS:  VIA TC Q.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:317
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:318
//# ALARMS, ABORTS, :  NONE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:319
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:320
//# SUBROUTINES:  ACDT+C12, IBNKCALL
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:321
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:322
//# WARNING:  THIS SUBROUTINE WRITES INTO CHANNEL 12 AND USES THE ITEMPS.  THEREFORE IT MAY ONLY BE CALLED WITH
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:323
//# INTERRUPT INHIBITED.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:324
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:325
//# ERASABLE STORAGE CONFIGURATION (NEEDED BY THE INDEXING METHODS):
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:326
//# NEGUQ		ERASE	+2			# NEGATIVE OF Q-AXIS GIMBAL DRIVE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:327
//# (SPWORD)	EQUALS	NEGUQ +1		# ANY S.P. ERASABLE NUMBER, NOW THRSTCMD
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:328
//# NEGUR		EQUALS	NEGUQ +2		# NEGATIVE OF R-AXIS GIMBAL DRIVE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:329
//# ACCDOTQ	ERASE	+2			# Q-JERK TERM SCALED AT PI/2(7) RAD/SEC(3)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:330
//# (SPWORD)	EQUALS	ACCDOTQ +1		# ANY S.P. ERASABLE NUMBER NOW QACCDOT
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:331
//# ACCDOTR	EQUALS	ACCDOTQ +2		# R-JERK TERM SCALED AT PI/2(7) RAD/SEC(3)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:332
//#						# ACCDOTQ,ACCDOTR ARE MAGNITUDES.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:333
//# AOSQ		ERASE   +4			# Q-AXIS ACC., D.P. AT PI/2 R/SEC(2)
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:334
//# AOSR		EQUALS  AOSQ +2			# R-AXIS ACCELERATION SCALED AT PI/2 R/S2
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:335
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:336
//QRNDXER		EQUALS	ITEMP6
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:337
//OCT23146	OCTAL	23146			# DECIMAL .6
// PORT: Fixed ROM slots 20183.
    20183, 19660
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20184–20192.
function agcAotUnit1239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20187 {
        if slot <= 20185 {
            if slot <= 20184 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:338
//NZACCDOT	EQUALS	ITEMP3
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:339
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:340
//TIMEGMBL	CAF	ONE			# INITIALZE ALLOWGTS.
// PORT: Fixed ROM slots 20184.
                if slot <> 20184 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:341
//		TS	ALLOWGTS
// PORT: Fixed ROM slots 20185.
                if slot <> 20185 or instruction <> 23362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20186 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:342
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:343
//		CAF	TWO			# SET UP LOOP FOR R AXIS.
// PORT: Fixed ROM slots 20186.
                if slot <> 20186 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:344
//		LXCH	Q			# SAVE RETURN ADDRESS.
// PORT: Fixed ROM slots 20187.
                if slot <> 20187 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20189 {
            if slot <= 20188 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:345
//		LXCH	RUPTREG2
// PORT: Fixed ROM slots 20188.
                if slot <> 20188 or instruction <> 9273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 57, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:346
//# Page 1479
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:347
//		TCF	+2
// PORT: Fixed ROM slots 20189.
                if slot <> 20189 or instruction <> 5855 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5855, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20190 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:348
//TIMQGMBL	CAF	ZERO			# NOW DO THE Q-AXIS
// PORT: Fixed ROM slots 20190.
                if slot <> 20190 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20191 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:349
//		TS	QRNDXER
// PORT: Fixed ROM slots 20191.
                    if slot <> 20191 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:350
//		INDEX	QRNDXER
// PORT: Fixed ROM slots 20192.
                    if slot <> 20192 or instruction <> 20534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1239] to agcAotUnit1239@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:351
//		CA	ACCDOTQ			# ACCDOT IS PRESUMED TO BE AT PI/2(7).
// PORT: Fixed ROM slots 20193.
    20193, 26254
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20194–20197.
function agcAotUnit1240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20195 {
        if slot <= 20194 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:352
//		EXTEND
// PORT: Fixed ROM slots 20194.
            if slot <> 20194 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:353
//		BZMF	TGOFFNOW		# IS ACCDOT LESS THAN OR EQUAL TO 0?
// PORT: Fixed ROM slots 20195.
            if slot <> 20195 or instruction <> 26379 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26379, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20196 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:354
//		TS	NZACCDOT		# NO.  STORE NON-ZERO, POSITIVE ACCDOT.
// PORT: Fixed ROM slots 20196.
            if slot <> 20196 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:355
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:356
//ALPHATRY	INDEX	QRNDXER
// PORT: Fixed ROM slots 20197.
            if slot <> 20197 or instruction <> 20534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1240] to agcAotUnit1240@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:357
//		CS	AOSQ
// PORT: Fixed ROM slots 20198.
    20198, 34494
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20199–20208.
function agcAotUnit1241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20203 {
        if slot <= 20200 {
            if slot <= 20199 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:358
//		EXTEND
// PORT: Fixed ROM slots 20199.
                if slot <> 20199 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:359
//		BZF	TGOFFNOW		# IS ALPHA ZERO?
// PORT: Fixed ROM slots 20200.
                if slot <> 20200 or instruction <> 5899 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5899, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20201 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:360
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:361
//		TS	Q			# SAVE A COPY OF  -AOS.
// PORT: Fixed ROM slots 20201.
                if slot <> 20201 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20202 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:362
//		EXTEND				# NO.  RESCALE FOR TIMEGMBL USE.
// PORT: Fixed ROM slots 20202.
                    if slot <> 20202 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:363
//		MP	OCT23146		# OCTAL 23146 IS DECIMAL .6
// PORT: Fixed ROM slots 20203.
                    if slot <> 20203 or instruction <> 30423 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1751, readEffective:call(words, 1751)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20205 {
            if slot <= 20204 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:364
//		AD	Q			# -1.6*AOS AT PI/2 = -.4*AOS AT PI/8.
// PORT: Fixed ROM slots 20204.
                if slot <> 20204 or instruction <> 24578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:365
//		TS	L			# WAS THERE OVERFLOW?
// PORT: Fixed ROM slots 20205.
                if slot <> 20205 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20206 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:366
//		TCF	SETNEGU			# NO.  COMPUTE DRIVE TIME.
// PORT: Fixed ROM slots 20206.
                if slot <> 20206 or instruction <> 5875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5875, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20207 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:367
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:368
//		CS	A			# RECOVER  -SGN(AOS) IN THE A REGISTER.
// PORT: Fixed ROM slots 20207.
                    if slot <> 20207 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:369
//		INDEX	QRNDXER			# YES.  START DRIVE WITHOUT WAITLIST.
// PORT: Fixed ROM slots 20208.
                    if slot <> 20208 or instruction <> 20534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1241] to agcAotUnit1241@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:370
//		XCH	NEGUQ
// PORT: Fixed ROM slots 20209.
    20209, 48770
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20210–20219.
function agcAotUnit1242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20214 {
        if slot <= 20211 {
            if slot <= 20210 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:371
//		TCF	NOTALLOW		# KNOCK DOWN THE ALLOWGTS FLAG.
// PORT: Fixed ROM slots 20210.
                if slot <> 20210 or instruction <> 5903 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5903, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:372
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:373
//SETNEGU		EXTEND
// PORT: Fixed ROM slots 20211.
                if slot <> 20211 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20212 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:374
//		BZMF	POSALPH
// PORT: Fixed ROM slots 20212.
                if slot <> 20212 or instruction <> 26361 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26361, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20213 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:375
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:376
//		COM
// PORT: Fixed ROM slots 20213.
                    if slot <> 20213 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:377
//		TS	ITEMP2			# STORE  -ABS(.4*AOS) SCALED AT PI/8.
// PORT: Fixed ROM slots 20214.
                    if slot <> 20214 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20216 {
            if slot <= 20215 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:378
//		CS	BIT1
// PORT: Fixed ROM slots 20215.
                if slot <> 20215 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:379
//		TCF	POSALPH +2
// PORT: Fixed ROM slots 20216.
                if slot <> 20216 or instruction <> 5883 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5883, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20217 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:380
//POSALPH		TS	ITEMP2			# STORE  -ABS(.4*AOS) SCALED AT PI/8.
// PORT: Fixed ROM slots 20217.
                if slot <> 20217 or instruction <> 22578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20218 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:381
//		CA	BIT1
// PORT: Fixed ROM slots 20218.
                    if slot <> 20218 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:382
//	+2	INDEX	QRNDXER			# SGN(AOS) INTO NEGU
// PORT: Fixed ROM slots 20219.
                    if slot <> 20219 or instruction <> 20534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1242] to agcAotUnit1242@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:383
//		TS	NEGUQ			# STORE SGN(ALPHA) AS NEGU
// PORT: Fixed ROM slots 20220.
    20220, 46722
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20221–20236.
function agcAotUnit1243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20228 {
        if slot <= 20224 {
            if slot <= 20222 {
                if slot <= 20221 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:384
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:385
//		CA	NZACCDOT
// PORT: Fixed ROM slots 20221.
                    if slot <> 20221 or instruction <> 12339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 51).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:386
//		EXTEND
// PORT: Fixed ROM slots 20222.
                    if slot <> 20222 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20223 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:387
//		MP	BIT12			# 2*ACCDOT, SCALED AT PI/8.
// PORT: Fixed ROM slots 20223.
                    if slot <> 20223 or instruction <> 31200 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2528, readEffective:call(words, 2528)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:388
//		AD	ITEMP2			# -ABS(ALPHS) + 2*ACCDOT, AT PI/8.
// PORT: Fixed ROM slots 20224.
                    if slot <> 20224 or instruction <> 24626 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20226 {
                if slot <= 20225 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:389
//		EXTEND
// PORT: Fixed ROM slots 20225.
                    if slot <> 20225 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:390
//		BZMF	NOTALLOW		# IS DRIVE TIME MORE THAN TWO SECONDS?
// PORT: Fixed ROM slots 20226.
                    if slot <> 20226 or instruction <> 26383 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26383, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20227 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:391
//		CS	ITEMP2			# NO.  COMPUTE DRIVE TIME.
// PORT: Fixed ROM slots 20227.
                    if slot <> 20227 or instruction <> 16434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 50).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:392
//		EXTEND				# ABS(ALPHA) AT PI/8.
// PORT: Fixed ROM slots 20228.
                    if slot <> 20228 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20232 {
            if slot <= 20230 {
                if slot <= 20229 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:393
//		MP	OCT00240		# DECIMAL 10/1024
// PORT: Fixed ROM slots 20229.
                    if slot <> 20229 or instruction <> 30496 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1824, readEffective:call(words, 1824)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:394
//		EXTEND				# QUOTIENT IS DRIVE TIME AT WAITLIST.
// PORT: Fixed ROM slots 20230.
                    if slot <> 20230 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20231 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:395
//		DV	NZACCDOT		# ABS(ALPHA)/ACCDOT AT 2(14)/100
// PORT: Fixed ROM slots 20231.
                    if slot <> 20231 or instruction <> 4147 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 51, readEffective:call(words, 51)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:396
//# Page 1480
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:397
//		EXTEND
// PORT: Fixed ROM slots 20232.
                    if slot <> 20232 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20234 {
                if slot <= 20233 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:398
//		BZF	TGOFFNOW		# DRIVE TIME MUST BE GREATER THAN ZERO.
// PORT: Fixed ROM slots 20233.
                    if slot <> 20233 or instruction <> 5899 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5899, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:399
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:400
//		TCF	DRIVEON
// PORT: Fixed ROM slots 20234.
                    if slot <> 20234 or instruction <> 5909 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5909, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20235 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:401
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:402
//TGOFFNOW	CAF	ZERO			# TURN OFF GIMBAL NOW.
// PORT: Fixed ROM slots 20235.
                    if slot <> 20235 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:403
//		INDEX	QRNDXER
// PORT: Fixed ROM slots 20236.
                    if slot <> 20236 or instruction <> 20534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1243] to agcAotUnit1243@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:404
//		TS	NEGUQ
// PORT: Fixed ROM slots 20237.
    20237, 46722
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20238–20240.
function agcAotUnit1244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20238 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:405
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:406
//		TCF	DONEYET
// PORT: Fixed ROM slots 20238.
        if slot <> 20238 or instruction <> 5911 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5911, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20239 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:407
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:408
//NOTALLOW	CAF	OCT31
// PORT: Fixed ROM slots 20239.
            if slot <> 20239 or instruction <> 15368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3080), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:409
//		INDEX	QRNDXER
// PORT: Fixed ROM slots 20240.
            if slot <> 20240 or instruction <> 20534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1244] to agcAotUnit1244@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:410
//		TS	QGIMTIMR
// PORT: Fixed ROM slots 20241.
    20241, 46900
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20242–20245.
function agcAotUnit1245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20243 {
        if slot <= 20242 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:411
//		CAF	ZERO			# DRIVE TIME IS MORE THAN 2 SECONDS, SO
// PORT: Fixed ROM slots 20242.
            if slot <> 20242 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:412
//		TS	ALLOWGTS		# DO NOT PERMIT FURTHER GTS ATTITUDE-RATE
// PORT: Fixed ROM slots 20243.
            if slot <> 20243 or instruction <> 23362 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23362, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20244 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:413
//						# CONTROL UNTIL AOSTASK APPROVES.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:414
//		TCF	DONEYET			# NO WAITLIST CALL IS MADE.
// PORT: Fixed ROM slots 20244.
            if slot <> 20244 or instruction <> 5911 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5911, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:415
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:416
//DRIVEON		INDEX	QRNDXER
// PORT: Fixed ROM slots 20245.
            if slot <> 20245 or instruction <> 20534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20534, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1245] to agcAotUnit1245@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:417
//		TS	QGIMTIMR		# CHOOSE Q OR R AXIS.
// PORT: Fixed ROM slots 20246.
    20246, 46900
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20247–20251.
function agcAotUnit1246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20248 {
        if slot <= 20247 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:418
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:419
//DONEYET		CCS	QRNDXER
// PORT: Fixed ROM slots 20247.
            if slot <> 20247 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:420
//		TCF	TIMQGMBL
// PORT: Fixed ROM slots 20248.
            if slot <> 20248 or instruction <> 5854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5854, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20249 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:421
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:422
//		DXCH	RUPTREG3		# PROTECT IBNKCALL ERASABLES.  ACDT+C12
// PORT: Fixed ROM slots 20249.
            if slot <> 20249 or instruction <> 21563 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20250 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:423
//		DXCH	ITEMP2			# LEAVES ITEMPS2,3 ALONE.
// PORT: Fixed ROM slots 20250.
                if slot <> 20250 or instruction <> 21555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 51, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:424
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:425
//		TC	IBNKCALL		# TURN OFF CHANNEL BITS, SET Q(R)ACCDOTS.
// PORT: Fixed ROM slots 20251.
                if slot <> 20251 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1246] to agcAotUnit1246@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:426
//		CADR	ACDT+C12
// PORT: Fixed ROM slots 20252.
    20252, 30652
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20253–20255.
function agcAotUnit1247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20253 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:427
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:428
//		DXCH	ITEMP2			# RESTORE ERASABLES FOR IBNKCALL.
// PORT: Fixed ROM slots 20253.
        if slot <> 20253 or instruction <> 21555 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 51, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20254 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:429
//		DXCH	RUPTREG3
// PORT: Fixed ROM slots 20254.
            if slot <> 20254 or instruction <> 21563 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:430
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:431
//		TC	RUPTREG2		# RETURN TO CALLER.
// PORT: Fixed ROM slots 20255.
            if slot <> 20255 or instruction <> 57 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 57, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1247] to agcAotUnit1247@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:432
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:433
//OCT00240	OCTAL	00240			# DECIMAL 10/1024
// PORT: Fixed ROM slots 20256.
    20256, 320
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20257–20284.
function agcAotUnit1248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20270 {
        if slot <= 20263 {
            if slot <= 20259 {
                if slot <= 20257 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:434
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:435
//# Page 1481
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:436
//# THE FOLLOWING SECTION IS A CONTINUATION OF THE TRIM GIMBAL CONTROL FROM THE LAST GTS ENTRY. THE QUANTITY NEGUSUM
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:437
//# IS COMPUTED FOR EACH AXIS (Q,R), .707*DEL*FUNCTION(3/2) + K2THETA = NEGUSUM.  NEW DRIVES ARE ENTERED TO CH 12.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:438
//#
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:439
//# THE SUBROUTINE GTSQRT ACCEPTS A DOUBLE PRECISION VALUE IN FUNCTION, FUNCTION +1 AND RETURNS A SINGLE-PRECISION
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:440
//# SQUARE ROOT OF THE FOURTEEN MOST SIGNIFICANT BITS OF THE ARGUMENT.  ALSO, THE CELL SHFTFLAG CONTAINS A BINARY
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:441
//# EXPONENT S, SUCH THAT THE SQUARE ROOT (RETURNED IN THE A REGISTER) MUST BE SHIFTED RIGHT (MULTIPLIED BY 2 TO THE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:442
//# POWER (-S)) IN ORDER TO BE THE TRUE SQUARE ROOT OF THE FOURTEEN MOST SIGNIFICANT BITS OF FUNCTION, FUNCTION +1.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:443
//# SQUARE ROOT ERROR IS NOT MORE THAN 2 IN THE 14TH SIGNIFICANT BIT.  CELLS CLOBBERED ARE A,L,SHFTFLAG,ININDEX,
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:444
//# HALFARG,SCRATCH,SR,FUNCTION, FUNCTION +1.  GTSQRT IS CALLED BY TC GTSQRT AND RETURNS VIA TC Q OR TC FUNCTION +1.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:445
//# ZERO OR NEGATIVE ARGUMENTS YIELD ZERO FOR SQUARE ROOTS.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:446
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:447
//GTSQRT		CCS	FUNCTION
// PORT: Fixed ROM slots 20257.
                    if slot <> 20257 or instruction <> 5097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20258 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:448
//		TCF	GOODARG		# FUNCTION IS POSITIVE.  TAKE SQUARE ROOT.
// PORT: Fixed ROM slots 20258.
                        if slot <> 20258 or instruction <> 5936 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5936, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:449
//		TCF	+2		# HIGH ORDER WORD IS ZERO.  TRY THE LOWER.
// PORT: Fixed ROM slots 20259.
                        if slot <> 20259 or instruction <> 5925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5925, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20261 {
                    if slot <= 20260 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:450
//		TCF	ZEROOT		# NEGATIVE.  USE ZERO FOR 1/2 POWER.
// PORT: Fixed ROM slots 20260.
                        if slot <> 20260 or instruction <> 5929 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5929, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:451
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:452
//		CA	FUNCTION +1
// PORT: Fixed ROM slots 20261.
                        if slot <> 20261 or instruction <> 13290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20262 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:453
//		EXTEND
// PORT: Fixed ROM slots 20262.
                        if slot <> 20262 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:454
//		BZMF	ZEROOT
// PORT: Fixed ROM slots 20263.
                        if slot <> 20263 or instruction <> 26409 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26409, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20266 {
                if slot <= 20264 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:455
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:456
//		TCF	ZEROHIGH	# PROCEED.
// PORT: Fixed ROM slots 20264.
                    if slot <> 20264 or instruction <> 5932 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5932, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20265 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:457
//ZEROOT		CA	ZERO
// PORT: Fixed ROM slots 20265.
                        if slot <> 20265 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:458
//		TS	SHFTFLAG
// PORT: Fixed ROM slots 20266.
                        if slot <> 20266 or instruction <> 23521 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23521, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20268 {
                    if slot <= 20267 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:459
//		TC	Q
// PORT: Fixed ROM slots 20267.
                        if slot <> 20267 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:460
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:461
//ZEROHIGH	XCH	FUNCTION	# 14 MOST SIGNIFICANT BITS ARE IN THE
// PORT: Fixed ROM slots 20268.
                        if slot <> 20268 or instruction <> 24553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1001, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20269 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:462
//		XCH	FUNCTION +1	# LOWER WORD.  EXCHANGE THEM.
// PORT: Fixed ROM slots 20269.
                        if slot <> 20269 or instruction <> 24554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1002, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:463
//		CA	SEVEN
// PORT: Fixed ROM slots 20270.
                        if slot <> 20270 or instruction <> 14831 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20277 {
            if slot <= 20273 {
                if slot <= 20271 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:464
//		TCF	GOODARG +1
// PORT: Fixed ROM slots 20271.
                    if slot <> 20271 or instruction <> 5937 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5937, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20272 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:465
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:466
//GOODARG		CA	ZERO
// PORT: Fixed ROM slots 20272.
                        if slot <> 20272 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:467
//		TS	SHFTFLAG
// PORT: Fixed ROM slots 20273.
                        if slot <> 20273 or instruction <> 23521 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23521, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20275 {
                    if slot <= 20274 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:468
//		CA	TWELVE		# INITIALIZE THE SCALING LOOP.
// PORT: Fixed ROM slots 20274.
                        if slot <> 20274 or instruction <> 15337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3049), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:469
//		TS	ININDEX
// PORT: Fixed ROM slots 20275.
                        if slot <> 20275 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20276 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:470
//		TCF	SCALLOOP
// PORT: Fixed ROM slots 20276.
                        if slot <> 20276 or instruction <> 5947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5947, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:471
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:472
//SCALSTRT	CA	FUNCTION
// PORT: Fixed ROM slots 20277.
                        if slot <> 20277 or instruction <> 13289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1001).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20280 {
                if slot <= 20278 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:473
//		TCF	SCALDONE
// PORT: Fixed ROM slots 20278.
                    if slot <> 20278 or instruction <> 5959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5959, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20279 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:474
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:475
//MULBUSH		CA	NEG2		# IF ARG IS NOT LESS THAN 1/4, INDEX IS
// PORT: Fixed ROM slots 20279.
                        if slot <> 20279 or instruction <> 16358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:476
//		ADS	ININDEX		# ZERO, INDICATING NO SHIFT NEEDED.
// PORT: Fixed ROM slots 20280.
                        if slot <> 20280 or instruction <> 12260 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 996).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20282 {
                    if slot <= 20281 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:477
//		EXTEND			# BRANCH IF ARG IS NOT LESS THAN 1/4.
// PORT: Fixed ROM slots 20281.
                        if slot <> 20281 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:478
//		BZMF	SCALSTRT	# OTHERWISE COMPARE ARG WITH A REFERENCE
// PORT: Fixed ROM slots 20282.
                        if slot <> 20282 or instruction <> 26421 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26421, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20283 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:479
//					# WHICH IS 4 TIMES LARGER THAN THE LAST.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:480
//SCALLOOP	CS	FUNCTION
// PORT: Fixed ROM slots 20283.
                        if slot <> 20283 or instruction <> 17385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1001).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:481
//		INDEX	ININDEX
// PORT: Fixed ROM slots 20284.
                        if slot <> 20284 or instruction <> 21476 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1248] to agcAotUnit1248@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:482
//		AD	BIT15		# REFERENCE MAGNITUDE LESS OR EQUAL TO 1/4
// PORT: Fixed ROM slots 20285.
    20285, 54202
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20286–20288.
function agcAotUnit1249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20286 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:483
//		EXTEND
// PORT: Fixed ROM slots 20286.
        if slot <> 20286 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 20287 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:484
//		BZMF	MULBUSH		# IF ARG IS NOT LESS THAN REFERENCE, GO
// PORT: Fixed ROM slots 20287.
            if slot <> 20287 or instruction <> 26423 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26423, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:485
//					# AROUND THE MULBERRY BUSH ONCE MORE.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:486
//# Page 1482
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:487
//		INDEX	ININDEX
// PORT: Fixed ROM slots 20288.
            if slot <> 20288 or instruction <> 21476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1249] to agcAotUnit1249@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:488
//		CA	BIT15		# THIS IS THE SCALE MAGNITUDE
// PORT: Fixed ROM slots 20289.
    20289, 29626
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20290–20304.
function agcAotUnit1250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20296 {
        if slot <= 20292 {
            if slot <= 20290 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:489
//		XCH	HALFARG		# 2**(-ININDEX) IS THE SHIFT DIVISOR.
// PORT: Fixed ROM slots 20290.
                if slot <> 20290 or instruction <> 24551 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 999, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20291 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:490
//		EXTEND			# RESCALE ARGUMENT.
// PORT: Fixed ROM slots 20291.
                    if slot <> 20291 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:491
//		DCA	FUNCTION
// PORT: Fixed ROM slots 20292.
                    if slot <> 20292 or instruction <> 13290 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1002, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20294 {
                if slot <= 20293 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:492
//		EXTEND
// PORT: Fixed ROM slots 20293.
                    if slot <> 20293 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:493
//		DV	HALFARG
// PORT: Fixed ROM slots 20294.
                    if slot <> 20294 or instruction <> 5095 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 999, readEffective:call(words, 999)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20295 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:494
//					# ININDEX AND SHFTFLAG PRESERVE INFO FOR
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:495
//					# RESCALING AFTER ROOT PROCESS.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:496
//SCALDONE	EXTEND
// PORT: Fixed ROM slots 20295.
                    if slot <> 20295 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:497
//		QXCH	FUNCTION +1	# SAVE Q FOR RETURN
// PORT: Fixed ROM slots 20296.
                    if slot <> 20296 or instruction <> 10218 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 1002, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20300 {
            if slot <= 20298 {
                if slot <= 20297 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:498
//		EXTEND
// PORT: Fixed ROM slots 20297.
                    if slot <> 20297 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:499
//		MP	BIT14
// PORT: Fixed ROM slots 20298.
                    if slot <> 20298 or instruction <> 31198 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20299 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:500
//		TS	HALFARG
// PORT: Fixed ROM slots 20299.
                    if slot <> 20299 or instruction <> 23527 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:501
//		MASK	BIT13
// PORT: Fixed ROM slots 20300.
                    if slot <> 20300 or instruction <> 31199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        if fixedOperand = 4096 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20302 {
                if slot <= 20301 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:502
//		CCS	A
// PORT: Fixed ROM slots 20301.
                    if slot <> 20301 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:503
//		CA	OCT11276
// PORT: Fixed ROM slots 20302.
                    if slot <> 20302 or instruction <> 14236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1948), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20303 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:504
//		AD	ROOTHALF	# INITIAL GUESS IS ROOT 1/2 OR POSMAX
// PORT: Fixed ROM slots 20303.
                    if slot <> 20303 or instruction <> 26522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1946), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:505
//		TC	ROOTCYCL
// PORT: Fixed ROM slots 20304.
                    if slot <> 20304 or instruction <> 1950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1250] to agcAotUnit1250@.

// PORT: Physical bank 21. Shared continuation entries, slots 20305–20325.
function agcAotUnit1251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20314 {
        if slot <= 20309 {
            if slot <= 20306 {
                if slot <= 20305 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:506
//		TC	ROOTCYCL
// PORT: Fixed ROM slots 20305.
                    if slot <> 20305 or instruction <> 1950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:507
//		TC	ROOTCYCL
// PORT: Fixed ROM slots 20306.
                    if slot <> 20306 or instruction <> 1950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20307 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:508
//		TC	FUNCTION +1
// PORT: Fixed ROM slots 20307.
                    if slot <> 20307 or instruction <> 1002 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1002, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20308 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:509
//# ****************************************************************************************************************
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:510
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:511
//RSTOFGTS	TC	GTSQRT
// PORT: Fixed ROM slots 20308.
                        if slot <> 20308 or instruction <> 1825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1825, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:512
//PRODUCT		XCH	K2CNTRAL
// PORT: Fixed ROM slots 20309.
                        if slot <> 20309 or instruction <> 24546 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 994, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20311 {
                if slot <= 20310 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:513
//		EXTEND
// PORT: Fixed ROM slots 20310.
                    if slot <> 20310 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:514
//		MP	K2CNTRAL
// PORT: Fixed ROM slots 20311.
                    if slot <> 20311 or instruction <> 29666 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 994, readEffective:call(words, 994)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20312 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:515
//		DXCH	K2CNTRAL
// PORT: Fixed ROM slots 20312.
                    if slot <> 20312 or instruction <> 22499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 995, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20313 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:516
//		EXTEND			#	      THE PRODUCT OF
// PORT: Fixed ROM slots 20313.
                        if slot <> 20313 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:517
//		MP	L		#  1/2                   2       1/2
// PORT: Fixed ROM slots 20314.
                        if slot <> 20314 or instruction <> 28673 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1, readEffective:call(words, 1)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20319 {
            if slot <= 20316 {
                if slot <= 20315 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:518
//		ADS	K2CNTRAL +1	# K   *(DEL*OMEGA + ALPHA /(2*K))
// PORT: Fixed ROM slots 20315.
                    if slot <> 20315 or instruction <> 12259 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 995).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:519
//		TS	L		#		  AND
// PORT: Fixed ROM slots 20316.
                    if slot <> 20316 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 20317 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:520
//		TCF	+2		#                        2
// PORT: Fixed ROM slots 20317.
                    if slot <> 20317 or instruction <> 5983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20318 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:521
//		ADS	K2CNTRAL	#  DEL*(DEL*OMEGA + ALPHA /(2*K)) NOW IN
// PORT: Fixed ROM slots 20318.
                        if slot <> 20318 or instruction <> 12258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 994).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:522
//					# K2CNTRAL
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:523
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:524
//DOSHIFT		CA	ININDEX
// PORT: Fixed ROM slots 20319.
                        if slot <> 20319 or instruction <> 13284 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 996).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20322 {
                if slot <= 20320 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:525
//		EXTEND			# MULTIPLY IN THE FACTOR 2(-S), RETURNED
// PORT: Fixed ROM slots 20320.
                    if slot <> 20320 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20321 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:526
//		MP	BIT14		# BY THE GTSQRT SUBROUTINE
// PORT: Fixed ROM slots 20321.
                        if slot <> 20321 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:527
//		ADS	SHFTFLAG
// PORT: Fixed ROM slots 20322.
                        if slot <> 20322 or instruction <> 12257 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 993).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20323 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:528
//		EXTEND
// PORT: Fixed ROM slots 20323.
                    if slot <> 20323 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20324 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:529
//		BZF	ADDITIN
// PORT: Fixed ROM slots 20324.
                        if slot <> 20324 or instruction <> 6003 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6003, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:530
//		INDEX	SHFTFLAG
// PORT: Fixed ROM slots 20325.
                        if slot <> 20325 or instruction <> 21473 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21473, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21473, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1251] to agcAotUnit1251@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:531
//		CA	BIT15
// PORT: Fixed ROM slots 20326.
    20326, 29626
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20327–20351.
function agcAotUnit1252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20338 {
        if slot <= 20332 {
            if slot <= 20329 {
                if slot <= 20327 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:532
//# Page 1483
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:533
//		XCH	K2CNTRAL
// PORT: Fixed ROM slots 20327.
                    if slot <> 20327 or instruction <> 24546 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 994, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20328 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:534
//		EXTEND
// PORT: Fixed ROM slots 20328.
                        if slot <> 20328 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:535
//		MP	K2CNTRAL
// PORT: Fixed ROM slots 20329.
                        if slot <> 20329 or instruction <> 29666 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 994, readEffective:call(words, 994)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20330 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:536
//		DAS	K2THETA
// PORT: Fixed ROM slots 20330.
                    if slot <> 20330 or instruction <> 9184 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 992) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20331 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:537
//		XCH	K2CNTRAL
// PORT: Fixed ROM slots 20331.
                        if slot <> 20331 or instruction <> 24546 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 994, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:538
//		EXTEND
// PORT: Fixed ROM slots 20332.
                        if slot <> 20332 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20335 {
                if slot <= 20333 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:539
//		MP	K2CNTRAL +1
// PORT: Fixed ROM slots 20333.
                    if slot <> 20333 or instruction <> 29667 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 995, readEffective:call(words, 995)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20334 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:540
//		ADS	K2THETA  +1
// PORT: Fixed ROM slots 20334.
                        if slot <> 20334 or instruction <> 12256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:541
//		TS	L
// PORT: Fixed ROM slots 20335.
                        if slot <> 20335 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20336 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:542
//		TCF	 +2
// PORT: Fixed ROM slots 20336.
                    if slot <> 20336 or instruction <> 6002 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6002, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20337 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:543
//		ADS	K2THETA
// PORT: Fixed ROM slots 20337.
                        if slot <> 20337 or instruction <> 12255 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 991).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:544
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:545
//		TCF	NEGUSUM
// PORT: Fixed ROM slots 20338.
                        if slot <> 20338 or instruction <> 6006 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6006, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 20344 {
            if slot <= 20341 {
                if slot <= 20339 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:546
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:547
//ADDITIN		EXTEND
// PORT: Fixed ROM slots 20339.
                    if slot <> 20339 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20340 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:548
//		DCA	K2CNTRAL
// PORT: Fixed ROM slots 20340.
                        if slot <> 20340 or instruction <> 13283 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 995, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:549
//		DAS	K2THETA		# NOW ADD IN THE K2THETA TERM.
// PORT: Fixed ROM slots 20341.
                        if slot <> 20341 or instruction <> 9184 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 992) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20342 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:550
//NEGUSUM		CCS	K2THETA		# TEST SIGN OF HIGH ORDER PART.
// PORT: Fixed ROM slots 20342.
                    if slot <> 20342 or instruction <> 5087 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 991).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20343 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:551
//		TCF	NEGDRIVE
// PORT: Fixed ROM slots 20343.
                        if slot <> 20343 or instruction <> 6011 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6011, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:552
//		TCF	 +2
// PORT: Fixed ROM slots 20344.
                        if slot <> 20344 or instruction <> 6010 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6010, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20347 {
                if slot <= 20345 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:553
//		TCF	POSDRIVE
// PORT: Fixed ROM slots 20345.
                    if slot <> 20345 or instruction <> 6013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20346 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:554
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:555
//		CCS	K2THETA  +1	# SIGN TEST FOR LOW ORDER PART.
// PORT: Fixed ROM slots 20346.
                        if slot <> 20346 or instruction <> 5088 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:556
//NEGDRIVE	CA	BIT1
// PORT: Fixed ROM slots 20347.
                        if slot <> 20347 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20349 {
                    if slot <= 20348 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:557
//		TCF	+2		# STOP GIMBAL DRIVE FOR A ZERO NEGUSUM.
// PORT: Fixed ROM slots 20348.
                        if slot <> 20348 or instruction <> 6014 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6014, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:558
//POSDRIVE	CS	BIT1
// PORT: Fixed ROM slots 20349.
                        if slot <> 20349 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20350 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:559
//		TS	L		# SAVE FOR DRIVE REVERSAL TEST.
// PORT: Fixed ROM slots 20350.
                        if slot <> 20350 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:560
//		INDEX	QRCNTR
// PORT: Fixed ROM slots 20351.
                        if slot <> 20351 or instruction <> 21480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21480, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21480, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1252] to agcAotUnit1252@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:561
//		XCH	NEGUQ
// PORT: Fixed ROM slots 20352.
    20352, 48770
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20353–20360.
function agcAotUnit1253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20356 {
        if slot <= 20354 {
            if slot <= 20353 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:562
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:563
//		EXTEND
// PORT: Fixed ROM slots 20353.
                if slot <> 20353 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:564
//		MP	L		# MULTIPLY OLD NEGU AND NEW NEGU.
// PORT: Fixed ROM slots 20354.
                if slot <> 20354 or instruction <> 28673 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1, readEffective:call(words, 1)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20355 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:565
//		CCS	L
// PORT: Fixed ROM slots 20355.
                if slot <> 20355 or instruction <> 4097 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:566
//		TCF	LOUPE		# NON-ZERO GIMBAL DRIVE BEING CONTINUED.
// PORT: Fixed ROM slots 20356.
                if slot <> 20356 or instruction <> 6033 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6033, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20358 {
            if slot <= 20357 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:567
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:568
//		TCF	ZEROLOUP	# NO REVERSAL PROBLEM HERE.
// PORT: Fixed ROM slots 20357.
                if slot <> 20357 or instruction <> 6030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:569
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:570
//		TCF	REVERSAL	# NON-ZERO GIMBAL DRIVE BEING REVERSED.
// PORT: Fixed ROM slots 20358.
                if slot <> 20358 or instruction <> 6024 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6024, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20359 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:571
//		TCF	ZEROLOUP	# NO REVERSAL PROBLEM HERE.
// PORT: Fixed ROM slots 20359.
                if slot <> 20359 or instruction <> 6030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:572
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:573
//REVERSAL	INDEX	QRCNTR		# A ZERO-DRIVE PAUSE IS NEEDED HERE.  ZERO
// PORT: Fixed ROM slots 20360.
                if slot <> 20360 or instruction <> 21480 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21480, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21480, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1253] to agcAotUnit1253@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:574
//		TS	QACCDOT		# IS IN A REGISTER FROM CCS ON (-1).
// PORT: Fixed ROM slots 20361.
    20361, 46736
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20362–20362.
function agcAotUnit1254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:575
//		INDEX	QRCNTR
// PORT: Fixed ROM slots 20362.
    if slot <> 20362 or instruction <> 21480 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21480, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21480, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1254] to agcAotUnit1254@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:576
//		CS	GMBLBITA
// PORT: Fixed ROM slots 20363.
    20363, 36662
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20364–20375.
function agcAotUnit1255 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20369 {
        if slot <= 20366 {
            if slot <= 20364 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:577
//		EXTEND
// PORT: Fixed ROM slots 20364.
                if slot <> 20364 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20365 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:578
//		WAND	CHAN12
// PORT: Fixed ROM slots 20365.
                    if slot <> 20365 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:579
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:580
//ZEROLOUP	CS	RCSFLAGS	# SET UP REQUEST FOR ACDT+C12 CALL.
// PORT: Fixed ROM slots 20366.
                    if slot <> 20366 or instruction <> 17083 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 699).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20367 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:581
//		MASK	CALLGMBL
// PORT: Fixed ROM slots 20367.
                if slot <> 20367 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
                if slot <= 20368 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:582
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 20368.
                    if slot <> 20368 or instruction <> 11963 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 699).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:583
//# Page 1484
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:584
//LOUPE		CCS	QRCNTR		# HAVE BOTH AXES BEEN PROCESSED?
// PORT: Fixed ROM slots 20369.
                    if slot <> 20369 or instruction <> 5096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1000).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 20372 {
            if slot <= 20370 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:585
//		TCF	GOQTRIMG	# NO.  DO Q AXIS NEXT.
// PORT: Fixed ROM slots 20370.
                if slot <> 20370 or instruction <> 5709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5709, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20371 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:586
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:587
//		CA	SAVESR		# RESTORE THE SR
// PORT: Fixed ROM slots 20371.
                    if slot <> 20371 or instruction <> 13125 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 837).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:588
//		TS	SR
// PORT: Fixed ROM slots 20372.
                    if slot <> 20372 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 20373 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:589
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:590
//GOCLOSE		EXTEND			# TERMINATE THE JASK.
// PORT: Fixed ROM slots 20373.
                if slot <> 20373 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 20374 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:591
//		DCA	CLOSEADR
// PORT: Fixed ROM slots 20374.
                    if slot <> 20374 or instruction <> 14233 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1945, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:592
//		DTCB
// PORT: Fixed ROM slots 20375.
                    if slot <> 20375 or instruction <> 21510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1255] to agcAotUnit1255@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:593
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:594
//		EBANK=	AOSQ
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:595
//CLOSEADR	2CADR	CLOSEOUT	# TERMINATE THE JASK.
// PORT: Fixed ROM slots 20376 20377.
    20376, 3388, 20377, 30860,
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:596
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:597
//TWELVE		EQUALS	OCT14
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:598
//ROOTHALF	OCTAL	26501		# SQUARE ROOT OF 1/2
// PORT: Fixed ROM slots 20378.
    20378, 23170,
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:599
//GMBLBITA	OCTAL	01400		# INDEXED WRT GMBLBITB   DO NOT MOVE******
// PORT: Fixed ROM slots 20379.
    20379, 1536,
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:600
//OCT11276	OCTAL	11276		# POSMAX - ROOTHALF
// PORT: Fixed ROM slots 20380.
    20380, 9596,
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:601
//GMBLBITB	OCTAL	06000		# INDEXED WRT GMBLBITA   DO NOT MOVE******
// PORT: Fixed ROM slots 20381.
    20381, 6144
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20382–20389.
function agcAotUnit1256 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20385 {
        if slot <= 20383 {
            if slot <= 20382 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:602
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:603
//# SUBROUTINE ROOTCYCL:	BY CRAIG WORK,3 APRIL 68
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:604
//# ROOTCYCL IS A SUBROUTINE WHICH EXECUTES ONE NEWTON SQUARE ROOT ALGORITHM ITERATION.  THE INITIAL GUESS AT THE
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:605
//# SQUARE ROOT IS PRESUMED TO BE IN THE A REGISTER AND ONE-HALF THE SQUARE IS TAKEN FROM HALFARG.  THE NEW APPROXI-
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:606
//# MATION TO THE SQUARE ROOT IS RETURNED IN THE A REGISTER.  DEBRIS:   A,L,SR,SCRATCH.  ROOTCYCL IS CALLED FROM
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:607
//# LOCATION (LOC) BY A TC ROOTCYCL, AND RETURNS (TC Q) TO LOC +1.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:608
//# WARNING:  IF THE INITIAL GUESS IS NOT GREATER THAN THE SQUARE, DIVIDE OR ADD OVERFLOW IS A REAL POSSIBILITY.
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:609
//
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:610
//ROOTCYCL	TS	SCRATCH		# STORE X
// PORT: Fixed ROM slots 20382.
                if slot <> 20382 or instruction <> 23526 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23526, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:611
//		TS	SR		# X/2 NOW IN SR
// PORT: Fixed ROM slots 20383.
                if slot <> 20383 or instruction <> 22545 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22545, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20384 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:612
//		CA	HALFARG		# ARG/2 IN THE A REG
// PORT: Fixed ROM slots 20384.
                if slot <> 20384 or instruction <> 13287 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 999).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:613
//		ZL			# PREPARE FOR DIVISION
// PORT: Fixed ROM slots 20385.
                if slot <> 20385 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20387 {
            if slot <= 20386 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:614
//		EXTEND
// PORT: Fixed ROM slots 20386.
                if slot <> 20386 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:615
//		DV	SCRATCH		# (ARG/X)/2
// PORT: Fixed ROM slots 20387.
                if slot <> 20387 or instruction <> 5094 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreDv(words, 998, readEffective:call(words, 998)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20388 {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:616
//		AD	SR		# (X + ARG/X)/2 IN THE A REG
// PORT: Fixed ROM slots 20388.
                if slot <> 20388 or instruction <> 24593 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 17).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TRIM_GIMBAL_CONTROL_SYSTEM.agc:617
//		TC	Q
// PORT: Fixed ROM slots 20389.
                if slot <> 20389 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1256] to agcAotUnit1256@.

