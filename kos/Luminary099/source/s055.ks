// P51-P53.agc
// bank 15, slots 15400-15400
function agcAotUnit887 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1
//# Copyright:	Public domain.
// P51-P53.agc:2
//# Filename:	P51-P53.agc
// P51-P53.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P51-P53.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// P51-P53.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P51-P53.agc:6
//# Assembler:	yaYUL
// P51-P53.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// P51-P53.agc:8
//# Website:	www.ibiblio.org/apollo.
// P51-P53.agc:9
//# Pages:	926-983
// P51-P53.agc:10
//# Mod history:	2009-05-31 HG	Transcribed from page images.
// P51-P53.agc:11
//#		2009-06-07 RSB	Corrected a typo.
// P51-P53.agc:12
//#
// P51-P53.agc:13
//# This source code has been transcribed or otherwise adapted from
// P51-P53.agc:14
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P51-P53.agc:15
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// P51-P53.agc:16
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P51-P53.agc:17
//# in storage size and consequent reduction in image quality as well) are
// P51-P53.agc:18
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P51-P53.agc:19
//# find that the images are illegible, contact me at info@sandroid.org
// P51-P53.agc:20
//# about getting access to the (much) higher-quality images which Paul
// P51-P53.agc:21
//# actually created.
// P51-P53.agc:22
//#
// P51-P53.agc:23
//# Notations on the hardcopy document read, in part:
// P51-P53.agc:24
//#
// P51-P53.agc:25
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P51-P53.agc:26
//#	16:27 JULY 14, 1969
// P51-P53.agc:27
//
// P51-P53.agc:28
//# Page 926
// P51-P53.agc:29
//# PROGRAM NAME -- PROG52			DATE -- JAN 9, 1967
// P51-P53.agc:30
//# MOD NO -- 0					LOG SECTION -- P51-P53
// P51-P53.agc:31
//# MODIFICATION BY -- LONSKE			ASSEMBLY -- SUNDANCE REV 46
// P51-P53.agc:32
//#
// P51-P53.agc:33
//# FUNCTIONAL DESCRIPTION --
// P51-P53.agc:34
//#
// P51-P53.agc:35
//#	ALIGNS THE IMU TO ONE OF THREE ORIENTATIONS SELECTED BY THE ASTRONAUT.  THE PRESENT IMU ORIENTATION IS KNOWN
// P51-P53.agc:36
//#	AND IS STORED IN REFSMMAT.  THE THREE POSSIBLE ORIENTATIONS MAY BE:
// P51-P53.agc:37
//#
// P51-P53.agc:38
//#	(A)	PREFERRED ORIENTATION
// P51-P53.agc:39
//#
// P51-P53.agc:40
//#		AN OPTIMUM ORIENTATION FOR A PREVIOUSLY CALCULATED MANEUVER.  THIS ORIENTATION MUST BE CALCULATED AND
// P51-P53.agc:41
//#		STORED BY A PREVIOUSLY SELECTED PROGRAM.
// P51-P53.agc:42
//#
// P51-P53.agc:43
//#	(B)	NOMINAL ORIENTATION
// P51-P53.agc:44
//#
// P51-P53.agc:45
//#		X   = UNIT ( R )
// P51-P53.agc:46
//#		-SM
// P51-P53.agc:47
//#
// P51-P53.agc:48
//#		Y   = UNIT (V X R)
// P51-P53.agc:49
//#		 SM
// P51-P53.agc:50
//#
// P51-P53.agc:51
//#		Z   = UNIT (X   X Y  )
// P51-P53.agc:52
//#		 SM          SM    SM
// P51-P53.agc:53
//#
// P51-P53.agc:54
//#		WHERE:
// P51-P53.agc:55
//#
// P51-P53.agc:56
//#		R = THE GEOCENTRIC RADIUS VECTOR AT TIME T(ALIGN) SELECTED BY THE ASTRONAUT
// P51-P53.agc:57
//#		-
// P51-P53.agc:58
//#
// P51-P53.agc:59
//#		V = THE INERTIAL VELOCITY VECTOR AT TIME T(ALIGN) SELECTED BY THE ASTRONAUT
// P51-P53.agc:60
//#		-
// P51-P53.agc:61
//#
// P51-P53.agc:62
//#	(C)	RERSMMAT ORIENTATION
// P51-P53.agc:63
//#
// P51-P53.agc:64
//#	(D)	LANDING SITE -- THIS IS NOT AVAILABLE IN SUNDANCE
// P51-P53.agc:65
//#
// P51-P53.agc:66
//#	THIS SELECTION CORRECTS THE PRESENT IMU ORIENTATION.  THE PRESENT ORIENTATION DIFFERS FROM THAT TO WHICH IT
// P51-P53.agc:67
//#	WAS LAST ALIGNED ONLY DUE TO GYRO DRIFT (I.E., NEITHER GIMBAL LOCK NOR IMU POWER INTERRUPTION HAS OCCURRED
// P51-P53.agc:68
//#	SINCE THE LAST ALIGNMENT).
// P51-P53.agc:69
//#
// P51-P53.agc:70
//#	AFTER A IMU ORIENTATION HAS BEEN SELECTED ROUTINE S52.2 IS OPERATED TO COMPUTE THE GIMBAL ANGLES USING THE
// P51-P53.agc:71
//#	NEW ORIENTATION AND THE PRESENT VEHICLE ATTITUDE.  CAL52A THEN USES THESE ANGLES, STORED IN THETAD,+1,+2, TO
// P51-P53.agc:72
//#	COARSE ALIGN THE IMU.  THE STARS SELECTION ROUTINE, R56, IS THEN OPERATED.  IF 2 STARS ARE NOT AVAILABLE AN ALARM
// P51-P53.agc:73
//#	IS FLASHED TO NOTIFY THE ASTRONAUT.  AT THIS POINT THE ASTRONAUT WILL MANEUVER THE VEHICLE AND SELECT 2 STARS
// P51-P53.agc:74
//# 	EITHER MANUALLY OR AUTOMATICALLY.  AFTER 2 STARS HAVE BEEN SELECTED THE IMU IS FINE ALIGNED USING ROUTINE R51.  IF
// P51-P53.agc:75
//# 	THE RENDEZVOUS NAVIGATION PROCESS IS OPERATING (INDICATED BY RNDVZFLG) P20 IS DISPLAYED.  OTHERWISE P00 IS
// P51-P53.agc:76
//#	REQUESTED.
// P51-P53.agc:77
//#
// P51-P53.agc:78
//# CALLING SEQUENCE --
// P51-P53.agc:79
//#
// P51-P53.agc:80
//# Page 927
// P51-P53.agc:81
//#	THE PROGRAM IS CALLED BY THE ASTRONAUT BY DSKY ENTRY.
// P51-P53.agc:82
//#
// P51-P53.agc:83
//# SUBROUTINES CALLED --
// P51-P53.agc:84
//#
// P51-P53.agc:85
//#	1. FLAGDOWN		 7. S52.2		13. NEWMODEX
// P51-P53.agc:86
//#	2. R02BOTH		 8. CAL53A		14. PRIOLARM
// P51-P53.agc:87
//#	3. GOPERF4		 9. FLAGUP
// P51-P53.agc:88
//#	4. MATMOVE		10. R56
// P51-P53.agc:89
//#	5. GOFLASH		11. R51
// P51-P53.agc:90
//#	6. S52.3		12. GOPERF3
// P51-P53.agc:91
//#
// P51-P53.agc:92
//# NORMAL EXIT MODES --
// P51-P53.agc:93
//#
// P51-P53.agc:94
//#	EXITS TO ENDOFJOB
// P51-P53.agc:95
//#
// P51-P53.agc:96
//# ALARM OR ABORT EXIT MODES --
// P51-P53.agc:97
//#
// P51-P53.agc:98
//#	NONE
// P51-P53.agc:99
//#
// P51-P53.agc:100
//# OUTPUT --
// P51-P53.agc:101
//#
// P51-P53.agc:102
//#	THE FOLLOWING MAY BE FLASHED ON THE DSKY
// P51-P53.agc:103
//#		1. IMU ORIENTATION CODE
// P51-P53.agc:104
//#		2. ALARM CODE 215 -- PREFERRED IMU ORIENTATION NOT SPECIFIED
// P51-P53.agc:105
//#		3. TIME OF NEXT IGNITION
// P51-P53.agc:106
//#		4. GIMBAL ANGLES
// P51-P53.agc:107
//#		5. ALARM CODE 405 -- TWO STARS NOT AVAILABLE
// P51-P53.agc:108
//#		6. PLEASE PERFORM P00
// P51-P53.agc:109
//#	THE MODE DISPLAY MAY BE CHANGED TO 20
// P51-P53.agc:110
//#
// P51-P53.agc:111
//# ERASABLE INITIALIZATION REQUIRED --
// P51-P53.agc:112
//#
// P51-P53.agc:113
//#	PFRATFLG SHOULD BE SET IF A PREFERRED ORIENTATION HAS BEEN COMPUTED.  IF IT HAS BEEN COMPUTED IT IS STORED IN
// P51-P53.agc:114
//#	XSMD, YSMD, ZSMD.
// P51-P53.agc:115
//#
// P51-P53.agc:116
//#	RNDVZFLG INDICATES WHETHER THE RENDEZVOUS NAVIGATION PROCESS IS OPERATING.
// P51-P53.agc:117
//#
// P51-P53.agc:118
//# DEBRIS --
// P51-P53.agc:119
//#
// P51-P53.agc:120
//#	WORK AREA
// P51-P53.agc:121
//
// P51-P53.agc:122
//		BANK	33
// P51-P53.agc:123
//		SETLOC	P50S
// P51-P53.agc:124
//		BANK
// P51-P53.agc:125
//
// P51-P53.agc:126
//		EBANK=	BESTI
// P51-P53.agc:127
//		COUNT*	$$/P52
// P51-P53.agc:128
//PROG52		TC	BANKCALL
// slot 15400
    if slot <> 15400 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[887] to agcAotUnit887@.

agcAotInstallSourceRope(list(
// P51-P53.agc:129
//		CADR	R02BOTH		# IMU STATUS CHECK
// slot 15401
    15401, 9560
)).

// bank 15, slots 15402-15411
function agcAotUnit888 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15406 {
        if slot <= 15403 {
            if slot <= 15402 {
// P51-P53.agc:130
//		CAF	PFRATBIT
// slot 15402
                if slot <> 15402 or instruction <> 14824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:131
//		MASK	FLAGWRD2	# IS PFRATFLG SET?
// slot 15403
                if slot <> 15403 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15404 {
// P51-P53.agc:132
//		CCS	A
// slot 15404
                if slot <> 15404 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15405 {
// P51-P53.agc:133
//# Page 928
// P51-P53.agc:134
//		TC	P52A		# YES
// slot 15405
                    if slot <> 15405 or instruction <> 1072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:135
//		CAF	BIT2		# NO
// slot 15406
                    if slot <> 15406 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 15408 {
            if slot <= 15407 {
// P51-P53.agc:136
//		TC	P52A +1
// slot 15407
                if slot <> 15407 or instruction <> 1073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:137
//P52A		CAF	BIT1
// slot 15408
                if slot <> 15408 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 15409 {
// P51-P53.agc:138
//		TS	OPTION2
// slot 15409
                if slot <> 15409 or instruction <> 23141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15410 {
// P51-P53.agc:139
//P52B		CAF	BIT1
// slot 15410
                    if slot <> 15410 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:140
//		TC	BANKCALL	# FLASH OPTION CODE AND ORIENTATION CODE
// slot 15411
                    if slot <> 15411 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[888] to agcAotUnit888@.

agcAotInstallSourceRope(list(
// P51-P53.agc:141
//		CADR	GOPERF4R	# FLASH V04N06
// slot 15412
    15412, 17302
)).

// bank 15, slots 15413-15416
function agcAotUnit889 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15414 {
        if slot <= 15413 {
// P51-P53.agc:142
//		TC	GOTOPOOH
// slot 15413
            if slot <> 15413 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:143
//		TCF	+5		# V33 -- PROCEED
// slot 15414
            if slot <> 15414 or instruction <> 5179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15415 {
// P51-P53.agc:144
//		TC	P52B		# NEW CODE -- NEW ORIENTATION CODE INPUT
// slot 15415
            if slot <> 15415 or instruction <> 1074 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1074, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:145
//		TC	PHASCHNG	# DISPLAY RETURN
// slot 15416
            if slot <> 15416 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[889] to agcAotUnit889@.

agcAotInstallSourceRope(list(
// P51-P53.agc:146
//		OCT	00014
// slot 15417
    15417, 24
)).

// bank 15, slots 15418-15421
function agcAotUnit890 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15419 {
        if slot <= 15418 {
// P51-P53.agc:147
//		TC	ENDOFJOB
// slot 15418
            if slot <> 15418 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:148
//
// P51-P53.agc:149
//		CA	OPTION2
// slot 15419
            if slot <> 15419 or instruction <> 12901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 613).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15420 {
// P51-P53.agc:150
//		MASK	THREE
// slot 15420
            if slot <> 15420 or instruction <> 31909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                if fixedOperand = 3 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:151
//		INDEX	A
// slot 15421
            if slot <> 15421 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[890] to agcAotUnit890@.

agcAotInstallSourceRope(list(
// P51-P53.agc:152
//		TC	+1
// slot 15422
    15422, 2174
)).

// bank 15, slots 15423-15426
function agcAotUnit891 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15424 {
        if slot <= 15423 {
// P51-P53.agc:153
//		TCF	OPT4		# OPTION 4 LANDING SITE
// slot 15423
            if slot <> 15423 or instruction <> 5189 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5189, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:154
//		TCF	P52H		# OPTION 1 PREFERRED
// slot 15424
            if slot <> 15424 or instruction <> 5227 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5227, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15425 {
// P51-P53.agc:155
//		TCF	P52T		# OPTION 2 NOMINAL
// slot 15425
            if slot <> 15425 or instruction <> 5192 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5192, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:156
//P52E		TC	INTPRET		# OPTION 3 REFSMMAT
// slot 15426
            if slot <> 15426 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[891] to agcAotUnit891@.

agcAotInstallSourceRope(list(
// P51-P53.agc:157
//		GOTO
// slot 15427
    15427, 65360,
// P51-P53.agc:158
//			P52F		# GO DO R51
// slot 15428
    15428, 26856
)).

// bank 15, slots 15429-15436
function agcAotUnit892 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15432 {
        if slot <= 15430 {
            if slot <= 15429 {
// P51-P53.agc:159
//
// P51-P53.agc:160
//OPT4		EXTEND
// slot 15429
                if slot <> 15429 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:161
//		DCA	TLAND		# IF OPTION 4 DISPLAY TLAND
// slot 15430
                if slot <> 15430 or instruction <> 13057 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 769, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15431 {
// P51-P53.agc:162
//		TCF	P52T +2
// slot 15431
                if slot <> 15431 or instruction <> 5194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5194, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:163
//
// P51-P53.agc:164
//P52T		EXTEND
// slot 15432
                if slot <> 15432 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15434 {
            if slot <= 15433 {
// P51-P53.agc:165
//		DCA	NEG0
// slot 15433
                if slot <> 15433 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:166
//		DXCH	DSPTEM1
// slot 15434
                if slot <> 15434 or instruction <> 22054 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15435 {
// P51-P53.agc:167
//		CAF	V06N34*
// slot 15435
                if slot <> 15435 or instruction <> 13432 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1144), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:168
//		TC	BANKCALL
// slot 15436
                if slot <> 15436 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[892] to agcAotUnit892@.

agcAotInstallSourceRope(list(
// P51-P53.agc:169
//		CADR	GOFLASH
// slot 15437
    15437, 17020
)).

// bank 15, slots 15438-15452
function agcAotUnit893 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15444 {
        if slot <= 15440 {
            if slot <= 15438 {
// P51-P53.agc:170
//		TC	GOTOPOOH
// slot 15438
                if slot <> 15438 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15439 {
// P51-P53.agc:171
//		TC	+2
// slot 15439
                    if slot <> 15439 or instruction <> 1105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1105, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:172
//		TC	-5
// slot 15440
                    if slot <> 15440 or instruction <> 1099 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1099, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15442 {
                if slot <= 15441 {
// P51-P53.agc:173
//		DXCH	DSPTEM1
// slot 15441
                    if slot <> 15441 or instruction <> 22054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 550, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:174
//		EXTEND
// slot 15442
                    if slot <> 15442 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15443 {
// P51-P53.agc:175
//		BZMF	+2		# IF TIME ZERO OR NEG USE TIME2
// slot 15443
                    if slot <> 15443 or instruction <> 25685 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25685, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:176
//		TCF	+3
// slot 15444
                    if slot <> 15444 or instruction <> 5207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5207, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15448 {
            if slot <= 15446 {
                if slot <= 15445 {
// P51-P53.agc:177
//		EXTEND
// slot 15445
                    if slot <> 15445 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:178
//		DCA	TIME2
// slot 15446
                    if slot <> 15446 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15447 {
// P51-P53.agc:179
//		DXCH	TALIGN
// slot 15447
                    if slot <> 15447 or instruction <> 22525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1021, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:180
//P52V		CA	OPTION2
// slot 15448
                    if slot <> 15448 or instruction <> 12901 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 613).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15450 {
                if slot <= 15449 {
// P51-P53.agc:181
//		MASK	BIT2
// slot 15449
                    if slot <> 15449 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
// P51-P53.agc:182
//		CCS	A
// slot 15450
                    if slot <> 15450 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15451 {
// P51-P53.agc:183
//		TC	P52W
// slot 15451
                    if slot <> 15451 or instruction <> 1119 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1119, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:184
//# Page 929
// P51-P53.agc:185
//		TC	INTPRET		# OPTION 4 -- GET LS ORIENTATION
// slot 15452
                    if slot <> 15452 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[893] to agcAotUnit893@.

agcAotInstallSourceRope(list(
// P51-P53.agc:186
//		GOTO
// slot 15453
    15453, 65360,
// P51-P53.agc:187
//			P52LS
// slot 15454
    15454, 26912
)).

// bank 15, slots 15455-15455
function agcAotUnit894 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:188
//
// P51-P53.agc:189
//# Page 930
// P51-P53.agc:190
//P52W		TC	INTPRET
// slot 15455
    if slot <> 15455 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[894] to agcAotUnit894@.

agcAotInstallSourceRope(list(
// P51-P53.agc:191
//		DLOAD	CALL		# PICK UP ALIGN TIME
// slot 15456
    15456, 38090,
// P51-P53.agc:192
//			TALIGN		# COMPUTED NOMINAL IMU
// slot 15457
    15457, 3066,
// P51-P53.agc:193
//			S52.3		#	ORIENTATION
// slot 15458
    15458, 26448,
// P51-P53.agc:194
//P52D		CALL			# READ VEHICLE ATTITUDE AND
// slot 15459
    15459, 65320,
// P51-P53.agc:195
//			S52.2		#	COMPUTE GIMBAL ANGLES
// slot 15460
    15460, 26398,
// P51-P53.agc:196
//		EXIT
// slot 15461
    15461, 65532
)).

// bank 15, slots 15462-15463
function agcAotUnit895 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15462 {
// P51-P53.agc:197
//		CAF	V06N22
// slot 15462
        if slot <> 15462 or instruction <> 14856 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:198
//		TC	BANKCALL	# DISPLAY GIMBAL ANGLES
// slot 15463
        if slot <> 15463 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[895] to agcAotUnit895@.

agcAotInstallSourceRope(list(
// P51-P53.agc:199
//		CADR	GOFLASH
// slot 15464
    15464, 17020
)).

// bank 15, slots 15465-15467
function agcAotUnit896 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15465 {
// P51-P53.agc:200
//		TC	GOTOPOOH
// slot 15465
        if slot <> 15465 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15466 {
// P51-P53.agc:201
//		TCF	COARSTYP	# V33 -- PROCEED, SEE IF GYRO TORQUE COARSE
// slot 15466
            if slot <> 15466 or instruction <> 5241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5241, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:202
//P52H		TC	INTPRET
// slot 15467
            if slot <> 15467 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[896] to agcAotUnit896@.

agcAotInstallSourceRope(list(
// P51-P53.agc:203
//		GOTO
// slot 15468
    15468, 65360,
// P51-P53.agc:204
//			P52D
// slot 15469
    15469, 26822
)).

// bank 15, slots 15470-15470
function agcAotUnit897 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:205
//REGCOARS	TC	INTPRET
// slot 15470
    if slot <> 15470 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[897] to agcAotUnit897@.

agcAotInstallSourceRope(list(
// P51-P53.agc:206
//		CALL			# DO COARSE ALIGN
// slot 15471
    15471, 65320,
// P51-P53.agc:207
//			CAL53A		#	ROUTINE
// slot 15472
    15472, 26030,
// P51-P53.agc:208
//COARSRET	SET	CLEAR
// slot 15473
    15473, 35864,
// P51-P53.agc:209
//			REFSMFLG
// slot 15474
    15474, 1636,
// P51-P53.agc:210
//			PFRATFLG
// slot 15475
    15475, 1398,
// P51-P53.agc:211
//P52F		CALL
// slot 15476
    15476, 65320,
// P51-P53.agc:212
//			R51
// slot 15477
    15477, 25626,
// P51-P53.agc:213
//P52OUT		EXIT
// slot 15478
    15478, 65532
)).

// bank 15, slots 15479-15479
function agcAotUnit898 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:214
//		TC	GOTOPOOH
// slot 15479
    if slot <> 15479 or instruction <> 3073 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3073, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[898] to agcAotUnit898@.

agcAotInstallSourceRope(list(
// P51-P53.agc:215
//VB05N09		=	V05N09
// P51-P53.agc:216
//V06N34*		VN	634
// slot 15480
    15480, 1604
)).

// bank 15, slots 15481-15482
function agcAotUnit899 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15481 {
// P51-P53.agc:217
//
// P51-P53.agc:218
//# Page 931
// P51-P53.agc:219
//# CHECK FOR GYRO TORQUE COARSE ALIGNMENT
// P51-P53.agc:220
//
// P51-P53.agc:221
//COARSTYP	CAF	OCT13
// slot 15481
        if slot <> 15481 or instruction <> 13455 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1167), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:222
//		TC	BANKCALL	# DISPLAY V 50N25 WITH COARSE ALIGN OPTION
// slot 15482
        if slot <> 15482 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[899] to agcAotUnit899@.

agcAotInstallSourceRope(list(
// P51-P53.agc:223
//		CADR	GOPERF1
// slot 15483
    15483, 17190
)).

// bank 15, slots 15484-15486
function agcAotUnit900 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15484 {
// P51-P53.agc:224
//		TCF	GOTOPOOH	# V34 -- TERMIN&OE
// slot 15484
        if slot <> 15484 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15485 {
// P51-P53.agc:225
//		TCF	REGCOARS	# V33 -- NORMAL COARSE
// slot 15485
            if slot <> 15485 or instruction <> 5230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5230, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:226
//		TC	INTPRET		# V32 -- GYRO TORQUE COARSE
// slot 15486
            if slot <> 15486 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[900] to agcAotUnit900@.

agcAotInstallSourceRope(list(
// P51-P53.agc:227
//		VLOAD	MXV
// slot 15487
    15487, 53754,
// P51-P53.agc:228
//			XSMD		# GET SM(DESIRED) WRT SM(PRESENT)
// slot 15488
    15488, 3854,
// P51-P53.agc:229
//			REFSMMAT
// slot 15489
    15489, 1976,
// P51-P53.agc:230
//		UNIT
// slot 15490
    15490, 65372,
// P51-P53.agc:231
//		STOVL	XDC
// slot 15491
    15491, 23402,
// P51-P53.agc:232
//			YSMD
// slot 15492
    15492, 3866,
// P51-P53.agc:233
//		MXV	UNIT
// slot 15493
    15493, 44706,
// P51-P53.agc:234
//			REFSMMAT
// slot 15494
    15494, 1976,
// P51-P53.agc:235
//		STOVL	YDC
// slot 15495
    15495, 23414,
// P51-P53.agc:236
//			ZSMD
// slot 15496
    15496, 3878,
// P51-P53.agc:237
//		MXV	UNIT
// slot 15497
    15497, 44706,
// P51-P53.agc:238
//			REFSMMAT
// slot 15498
    15498, 1976,
// P51-P53.agc:239
//		STCALL	ZDC
// slot 15499
    15499, 31618,
// P51-P53.agc:240
//			GYCOARS
// slot 15500
    15500, 25832,
// P51-P53.agc:241
//		GOTO
// slot 15501
    15501, 65360,
// P51-P53.agc:242
//			P52OUT
// slot 15502
    15502, 26860,
// P51-P53.agc:243
//OCT13		OCT	13
// slot 15503
    15503, 22,
// P51-P53.agc:244
//
// P51-P53.agc:245
//# Page 932
// P51-P53.agc:246
//# COMPUTE LANDING ORIENTATION FOR OPTION 4
// P51-P53.agc:247
//
// P51-P53.agc:248
//P52LS		SET	CLEAR		# GET LANDING SITE ORIENTATION
// slot 15504
    15504, 35864,
// P51-P53.agc:249
//			LUNAFLAG
// slot 15505
    15505, 1638,
// P51-P53.agc:250
//			ERADFLAG	# TO PICK UP RLS
// slot 15506
    15506, 868,
// P51-P53.agc:251
//		SETPD	VLOAD
// slot 15507
    15507, 64770,
// P51-P53.agc:252
//			0
// slot 15508
    15508, 2,
// P51-P53.agc:253
//			RLS		# PICK UP LANDING SITE VEC IN MF
// slot 15509
    15509, 2086,
// P51-P53.agc:254
//		PDDL	PUSH		# RLS PD 0-5
// slot 15510
    15510, 34474,
// P51-P53.agc:255
//			TALIGN
// slot 15511
    15511, 3066,
// P51-P53.agc:256
//		STCALL	TLAND		# JAM ALIGN TIME IN TLAND FOR OPTION 4
// slot 15512
    15512, 31234,
// P51-P53.agc:257
//			RP-TO-R		# TRANS RLS TO REF
// slot 15513
    15513, 47004,
// P51-P53.agc:258
//		VSR2
// slot 15514
    15514, 65476,
// P51-P53.agc:259
//		STODL	ALPHAV		# INPUT TO LAT-LONG
// slot 15515
    15515, 14388,
// P51-P53.agc:260
//			TALIGN
// slot 15516
    15516, 3066,
// P51-P53.agc:261
//		CALL
// slot 15517
    15517, 65320,
// P51-P53.agc:262
//			N89DISP
// slot 15518
    15518, 25164,
// P51-P53.agc:263
//		VLOAD	UNIT		# COMPUTE LANDING SITE ORIENT (XSMD)
// slot 15519
    15519, 44794,
// P51-P53.agc:264
//			ALPHAV
// slot 15520
    15520, 2100,
// P51-P53.agc:265
//		STCALL	XSMD
// slot 15521
    15521, 32526,
// P51-P53.agc:266
//			LSORIENT
// slot 15522
    15522, 9238,
// P51-P53.agc:267
//		GOTO
// slot 15523
    15523, 65360,
// P51-P53.agc:268
//			P52D		# NOW GO COMPUTE GIMBAL ANGLES.
// slot 15524
    15524, 26822,
// P51-P53.agc:269
//
// P51-P53.agc:270
//# Page 933
// P51-P53.agc:271
//# SUBROUTINE TO CALCULATE AND DISPLAY THE LUNAR LANDING SITE
// P51-P53.agc:272
//
// P51-P53.agc:273
//		SETLOC	P50S1
// P51-P53.agc:274
//		BANK
// P51-P53.agc:275
//		EBANK=	XSM
// P51-P53.agc:276
//
// P51-P53.agc:277
//N89DISP		STQ
// slot 14630
    14630, 65312,
// P51-P53.agc:278
//			QMAJ
// slot 14631
    14631, 3020,
// P51-P53.agc:279
//		STCALL	GDT/2 +4	# TEMP STORE TIME
// slot 14632
    14632, 30022,
// P51-P53.agc:280
//			LAT-LONG
// slot 14633
    14633, 22994,
// P51-P53.agc:281
//		DLOAD	SR1
// slot 14634
    14634, 58058,
// P51-P53.agc:282
//			LONG
// slot 14635
    14635, 1190,
// P51-P53.agc:283
//		STODL	LANDLONG
// slot 14636
    14636, 15250,
// P51-P53.agc:284
//			ALT
// slot 14637
    14637, 1194,
// P51-P53.agc:285
//		STODL	LANDALT
// slot 14638
    14638, 15254,
// P51-P53.agc:286
//			LAT
// slot 14639
    14639, 1186,
// P51-P53.agc:287
//		STODL	LANDLAT
// slot 14640
    14640, 15246,
// P51-P53.agc:288
//		EXIT
// slot 14641
    14641, 65532
)).

// bank 14, slots 14642-14643
function agcAotUnit811 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14642 {
// P51-P53.agc:289
//
// P51-P53.agc:290
//LSDISP		CAF	V06N89*		# DISPLAY LAT,LONG/2,ALT
// slot 14642
        if slot <> 14642 or instruction <> 13637 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1349), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:291
//		TC	BANKCALL
// slot 14643
        if slot <> 14643 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[811] to agcAotUnit811@.

agcAotInstallSourceRope(list(
// P51-P53.agc:292
//		CADR	GOFLASH
// slot 14644
    14644, 17020
)).

// bank 14, slots 14645-14648
function agcAotUnit812 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14646 {
        if slot <= 14645 {
// P51-P53.agc:293
//		TCF	GOTOPOOH	# V34 -- TERMINATE -- EXIT P57
// slot 14645
            if slot <> 14645 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:294
//		TCF	+2		# V33 -- PROCEED -- ACCEPT LS DATA
// slot 14646
            if slot <> 14646 or instruction <> 5432 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5432, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14647 {
// P51-P53.agc:295
//		TCF	LSDISP		# V32 OR E -- LOOK AGAIN AND/OR LOAD NEW LS
// slot 14647
            if slot <> 14647 or instruction <> 5426 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5426, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:296
//
// P51-P53.agc:297
//		TC	INTPRET
// slot 14648
            if slot <> 14648 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[812] to agcAotUnit812@.

agcAotInstallSourceRope(list(
// P51-P53.agc:298
//		DLOAD	SL1
// slot 14649
    14649, 60106,
// P51-P53.agc:299
//			LANDLONG
// slot 14650
    14650, 2962,
// P51-P53.agc:300
//		STODL	LONG
// slot 14651
    14651, 13478,
// P51-P53.agc:301
//			LANDALT
// slot 14652
    14652, 2966,
// P51-P53.agc:302
//		STODL	ALT
// slot 14653
    14653, 13482,
// P51-P53.agc:303
//			LANDLAT
// slot 14654
    14654, 2958,
// P51-P53.agc:304
//		STODL	LAT
// slot 14655
    14655, 13474,
// P51-P53.agc:305
//			GDT/2 +4	# PICK UP TIME
// slot 14656
    14656, 1350,
// P51-P53.agc:306
//		CALL			# GET RLS BACK FROM LAT,LONG,ALT
// slot 14657
    14657, 65320,
// P51-P53.agc:307
//			LALOTORV	# RLS B-29 IN MPAC AND ALPHAV
// slot 14658
    14658, 23076,
// P51-P53.agc:308
//		GOTO
// slot 14659
    14659, 65360,
// P51-P53.agc:309
//			QMAJ
// slot 14660
    14660, 3020,
// P51-P53.agc:310
//V06N89*		VN	689
// slot 14661
    14661, 1714,
// P51-P53.agc:311
//
// P51-P53.agc:312
//# Page 934
// P51-P53.agc:313
//# NAME -- S50 ALIAS LOCSAM
// P51-P53.agc:314
//# BY
// P51-P53.agc:315
//# VINCENT
// P51-P53.agc:316
//#
// P51-P53.agc:317
//# FUNCTION -- COMPUTE INPUTS FOR PICAPAR AND PLANET
// P51-P53.agc:318
//#
// P51-P53.agc:319
//#	DEFINE
// P51-P53.agc:320
//#
// P51-P53.agc:321
//#	U   = UNIT( SUN WRT EARTH )
// P51-P53.agc:322
//#	 ES
// P51-P53.agc:323
//#
// P51-P53.agc:324
//#	U   = UNIT( MOON WRT EARTH )
// P51-P53.agc:325
//#	 EM
// P51-P53.agc:326
//#
// P51-P53.agc:327
//#	R   = POSITION VECTOR OF LEM
// P51-P53.agc:328
//#	 L
// P51-P53.agc:329
//#
// P51-P53.agc:330
//#	R   = MEAN DISTANCE (384402KM) BETWEEN EARTH AND MOON
// P51-P53.agc:331
//#	 EM
// P51-P53.agc:332
//#
// P51-P53.agc:333
//#	P   = RATIO R  /(DISTANCE SUN TO EARTH) > .00257125
// P51-P53.agc:334
//#	             EM
// P51-P53.agc:335
//#
// P51-P53.agc:336
//#	R   = EQUATORIAL RADIUS (6378.166KM) OF EARTH
// P51-P53.agc:337
//#	 E
// P51-P53.agc:338
//#
// P51-P53.agc:339
//#	LOCSAM COMPUTES IN EARTH INFLUENCE
// P51-P53.agc:340
//#
// P51-P53.agc:341
//#	VSUN = U
// P51-P53.agc:342
//#	        ES
// P51-P53.agc:343
//#
// P51-P53.agc:344
//#	VEARTH = -UNIT( R  )
// P51-P53.agc:345
//#	                 L
// P51-P53.agc:346
//#
// P51-P53.agc:347
//#	VMOON = UNIT(R  .U   - R  )
// P51-P53.agc:348
//#	              EM  EM    L
// P51-P53.agc:349
//#
// P51-P53.agc:350
//#	CSUN = COS 90
// P51-P53.agc:351
//#
// P51-P53.agc:352
//#	CEARTH = COS(5 + ARCSIN(R /MAG(R )))
// P51-P53.agc:353
//#	                         E      L
// P51-P53.agc:354
//#
// P51-P53.agc:355
//#	CMOON	= COS 5
// P51-P53.agc:356
//#
// P51-P53.agc:357
//# INPUT -- TIME IN MPAC
// P51-P53.agc:358
//#
// P51-P53.agc:359
//# OUTPUT -- LISTED ABOVE
// P51-P53.agc:360
//#
// P51-P53.agc:361
//# SUBROUTINES -- LSPOS, LEMPREC
// P51-P53.agc:362
//#
// P51-P53.agc:363
//# DEBRIS -- VAC AREA, TSIGHT
// P51-P53.agc:364
//
// P51-P53.agc:365
//# Page 935
// P51-P53.agc:366
//		COUNT*	$$/LOSAM
// P51-P53.agc:367
//
// P51-P53.agc:368
//S50		= 	LOCSAM
// P51-P53.agc:369
//LOCSAM		STQ
// slot 14662
    14662, 65312,
// P51-P53.agc:370
//			QMIN
// slot 14663
    14663, 3018,
// P51-P53.agc:371
//		STCALL	TSIGHT
// slot 14664
    14664, 32484,
// P51-P53.agc:372
//			LSPOS
// slot 14665
    14665, 28520,
// P51-P53.agc:373
//		DLOAD
// slot 14666
    14666, 65482,
// P51-P53.agc:374
//			TSIGHT
// slot 14667
    14667, 3812,
// P51-P53.agc:375
//		STCALL	TDEC1
// slot 14668
    14668, 28738,
// P51-P53.agc:376
//			LEMPREC
// slot 14669
    14669, 23646,
// P51-P53.agc:377
//		SSP	TIX,2
// slot 14670
    14670, 50354,
// P51-P53.agc:378
//			S2
// slot 14671
    14671, 84,
// P51-P53.agc:379
//			0
// slot 14672
    14672, 0,
// P51-P53.agc:380
//			MOONCNTR
// slot 14673
    14673, 25286,
// P51-P53.agc:381
//EARTCNTR	VLOAD	VXSC
// slot 14674
    14674, 61946,
// P51-P53.agc:382
//			VMOON
// slot 14675
    14675, 2982,
// P51-P53.agc:383
//			RSUBEM
// slot 14676
    14676, 24578,
// P51-P53.agc:384
//		VSL1	VSU
// slot 14677
    14677, 43508,
// P51-P53.agc:385
//			RATT
// slot 14678
    14678, 2,
// P51-P53.agc:386
//		UNIT
// slot 14679
    14679, 65372,
// P51-P53.agc:387
//		STOVL	VMOON
// slot 14680
    14680, 23462,
// P51-P53.agc:388
//			RATT
// slot 14681
    14681, 2,
// P51-P53.agc:389
//		UNIT	VCOMP
// slot 14682
    14682, 48732,
// P51-P53.agc:390
//		STODL	VEARTH
// slot 14683
    14683, 15246,
// P51-P53.agc:391
//			RSUBE
// slot 14684
    14684, 24586,
// P51-P53.agc:392
//		CALL
// slot 14685
    14685, 65320,
// P51-P53.agc:393
//			OCCOS
// slot 14686
    14686, 25338,
// P51-P53.agc:394
//		STODL	CEARTH
// slot 14687
    14687, 12318,
// P51-P53.agc:395
//			CSS5
// slot 14688
    14688, 25352,
// P51-P53.agc:396
//		STCALL	CMOON
// slot 14689
    14689, 28710,
// P51-P53.agc:397
//			ENDSAM
// slot 14690
    14690, 25328,
// P51-P53.agc:398
//MOONCNTR	VLOAD	VXSC
// slot 14691
    14691, 61946,
// P51-P53.agc:399
//			VMOON
// slot 14692
    14692, 2982,
// P51-P53.agc:400
//			ROE
// slot 14693
    14693, 24590,
// P51-P53.agc:401
//		BVSU	UNIT
// slot 14694
    14694, 44618,
// P51-P53.agc:402
//			VSUN
// slot 14695
    14695, 2970,
// P51-P53.agc:403
//		STOVL	VSUN
// slot 14696
    14696, 23450,
// P51-P53.agc:404
//			VMOON
// slot 14697
    14697, 2982,
// P51-P53.agc:405
//		VXSC	VAD
// slot 14698
    14698, 44514,
// P51-P53.agc:406
//			RSUBEM
// slot 14699
    14699, 24578,
// P51-P53.agc:407
//			RATT
// slot 14700
    14700, 2,
// P51-P53.agc:408
//		UNIT	VCOMP
// slot 14701
    14701, 48732,
// P51-P53.agc:409
//		STOVL	VEARTH
// slot 14702
    14702, 23438,
// P51-P53.agc:410
//			RATT
// slot 14703
    14703, 2,
// P51-P53.agc:411
//		UNIT	VCOMP
// slot 14704
    14704, 48732,
// P51-P53.agc:412
//		STODL	VMOON
// slot 14705
    14705, 15270,
// P51-P53.agc:413
//			RSUBM
// slot 14706
    14706, 24582,
// P51-P53.agc:414
//		CALL
// slot 14707
    14707, 65320,
// P51-P53.agc:415
//			OCCOS
// slot 14708
    14708, 25338,
// P51-P53.agc:416
//# Page 936
// P51-P53.agc:417
//		STODL	CMOON
// slot 14709
    14709, 12326,
// P51-P53.agc:418
//			CSS5
// slot 14710
    14710, 25352,
// P51-P53.agc:419
//		STORE	CEARTH
// slot 14711
    14711, 30,
// P51-P53.agc:420
//ENDSAM		DLOAD
// slot 14712
    14712, 65482,
// P51-P53.agc:421
//			CSSUN
// slot 14713
    14713, 25356,
// P51-P53.agc:422
//		STORE	CSUN
// slot 14714
    14714, 34,
// P51-P53.agc:423
//		GOTO
// slot 14715
    14715, 65360,
// P51-P53.agc:424
//			QMIN
// slot 14716
    14716, 3018,
// P51-P53.agc:425
//OCCOS		DDV	SR1
// slot 14717
    14717, 57970
)).

agcAotInstallSourceRope(list(
// P51-P53.agc:426
//			36D
// slot 14718
    14718, 74,
// P51-P53.agc:427
//		ASIN	DAD
// slot 14719
    14719, 36284,
// P51-P53.agc:428
//			5DEGREES
// slot 14720
    14720, 25360,
// P51-P53.agc:429
//		COS	SR1
// slot 14721
    14721, 58060,
// P51-P53.agc:430
//		RVQ
// slot 14722
    14722, 65308,
// P51-P53.agc:431
//CEARTH		=	14D
// P51-P53.agc:432
//CSUN		=	16D
// P51-P53.agc:433
//CMOON		=	18D
// P51-P53.agc:434
//CSS5		2DEC	.2490475	# (COS 5)/4
// slot 14723 14724
    14723, 8160, 14724, 12918,
// P51-P53.agc:435
//CSSUN		2DEC	.125		# (COS 60)/4
// slot 14725 14726
    14725, 4096, 14726, 0,
// P51-P53.agc:436
//5DEGREES	2DEC	.013888889	# SCALED IN REVS
// slot 14727 14728
    14727, 454, 14728, 18204
)).

// bank 14, slots 14729-14731
function agcAotUnit813 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14729 {
// P51-P53.agc:437
//
// P51-P53.agc:438
//# Page 937
// P51-P53.agc:439
//# PROGRAM NAME -- R56		DATE: DEC 20 66
// P51-P53.agc:440
//# MOD 1				LOG SECTION: P51-P53
// P51-P53.agc:441
//#				ASSEMBLY:  SUNDISK REV4D
// P51-P53.agc:442
//# BY KEN VINCENT
// P51-P53.agc:443
//#
// P51-P53.agc:444
//# FUNCTION
// P51-P53.agc:445
//#	THIS PROGRAM READS THE IMU-CDUS AND COMPUTES THE VEHICLE ORIENTATION
// P51-P53.agc:446
//#	WITH RESPECT TO INERTIAL SPACE.  IT THEN COMPUTES THE SHAFT AXIS (SAX)
// P51-P53.agc:447
//#	WITH RESPECT TO REFERENCE INTERTIAL.  EACH STAR IN THE CATALOG IS TESTED
// P51-P53.agc:448
//# 	TO DETERMIN IF IT IS OCCULTED BY EITHER EARTH, SUN OR MOON.  IF A
// P51-P53.agc:449
//# 	STAR IS NOT OCCULTED THEN IT IS PAIRED WITH ALL STARS OF LOWER INDEX.
// P51-P53.agc:450
//# 	THE PAIRED STAR IS TESTED FOR OCCULTATION.  PAIRS OF STARS THAT PASS
// P51-P53.agc:451
//#	THE OCCULTATION TESTS ARE TESTED FOR GOOD SEPARATION.  A PAIR OF STARS
// P51-P53.agc:452
//#	HAVE GOOD SEPARATION IF THE ANGLE BETWEEN THEM IS LESS THAN 100 DEGREES
// P51-P53.agc:453
//#	AND MORE THAN 50 DEGREES.  THOSE PAIRS WITH GOOD SEPARATION
// P51-P53.agc:454
//#	ARE THEN TESTED TO SEE IF THEY LIE IN CURRENT FIELD OF VIEW.  (WITHIN
// P51-P53.agc:455
//#	50 DEGREES OF SAX).  THE PAIR WITH MAX SEPARATION IS CHOSEN FROM
// P51-P53.agc:456
//#	THOSE WITH GOOD SEPARATION, AND IN FIELD OF VIEW.
// P51-P53.agc:457
//#
// P51-P53.agc:458
//# CALLING SEQUENCE
// P51-P53.agc:459
//#	L	TC	BANKCALL
// P51-P53.agc:460
//#	L+1	CADR	R56
// P51-P53.agc:461
//#	L+2	ERROR RETURN -- NO STARS IN FIELD OF VIEW
// P51-P53.agc:462
//#	L+3	NORMAL RETURN
// P51-P53.agc:463
//#
// P51-P53.agc:464
//# OUTPUT
// P51-P53.agc:465
//#	BESTI, BESTJ -- SINGLE PREC, INTEGERS, STAR NUMBERS TIMES 6
// P51-P53.agc:466
//#	VFLAG -- FLAG BIT SET IMPLIES NO STARS IN FIELD OF VIEW
// P51-P53.agc:467
//#
// P51-P53.agc:468
//# INITIALIZATION
// P51-P53.agc:469
//#	1)	A CALL TO LOCSAM MUST BE MADE
// P51-P53.agc:470
//#
// P51-P53.agc:471
//# DEBRIS
// P51-P53.agc:472
//#	WORKAREA
// P51-P53.agc:473
//#	X,Y,ZNB
// P51-P53.agc:474
//#	SINCDU, COSCDU
// P51-P53.agc:475
//#	STARAD -- STAR +5
// P51-P53.agc:476
//
// P51-P53.agc:477
//R56		=	PICAPAR
// P51-P53.agc:478
//		COUNT*	$$/R56
// P51-P53.agc:479
//PICAPAR		TC	MAKECADR
// slot 14729
        if slot <> 14729 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14730 {
// P51-P53.agc:480
//		TS	QMIN
// slot 14730
            if slot <> 14730 or instruction <> 23525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23525, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:481
//		TC	INTPRET
// slot 14731
            if slot <> 14731 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[813] to agcAotUnit813@.

agcAotInstallSourceRope(list(
// P51-P53.agc:482
//		CALL
// slot 14732
    14732, 65320,
// P51-P53.agc:483
//			CDUTRIG
// slot 14733
    14733, 40638,
// P51-P53.agc:484
//		CALL
// slot 14734
    14734, 65320,
// P51-P53.agc:485
//			CALCSMSC
// slot 14735
    14735, 16432,
// P51-P53.agc:486
//		SETPD
// slot 14736
    14736, 65282,
// P51-P53.agc:487
//			0
// slot 14737
    14737, 2,
// P51-P53.agc:488
//		SET	DLOAD		# VFLAG = 1
// slot 14738
    14738, 58648,
// P51-P53.agc:489
//			VFLAG
// slot 14739
    14739, 1642,
// P51-P53.agc:490
//# Page 938
// P51-P53.agc:491
//			DPZERO
// slot 14740
    14740, 20494,
// P51-P53.agc:492
//		STOVL	BESTI
// slot 14741
    14741, 23516,
// P51-P53.agc:493
//			XNB
// slot 14742
    14742, 2922,
// P51-P53.agc:494
//		VXSC	PDVL
// slot 14743
    14743, 52706,
// P51-P53.agc:495
//			HALFDP
// slot 14744
    14744, 20490,
// P51-P53.agc:496
//			ZNB
// slot 14745
    14745, 2946,
// P51-P53.agc:497
//		AXT,1	VXSC
// slot 14746
    14746, 61936,
// P51-P53.agc:498
//			228D		# X1 = 37 X 6 + 6
// slot 14747
    14747, 456,
// P51-P53.agc:499
//			HALFDP
// slot 14748
    14748, 20490,
// P51-P53.agc:500
//		VAD
// slot 14749
    14749, 65370,
// P51-P53.agc:501
//		VXM	UNIT
// slot 14750
    14750, 44682,
// P51-P53.agc:502
//			REFSMMAT
// slot 14751
    14751, 1976,
// P51-P53.agc:503
//		STORE	SAX		# SAX = SHAFT AXIS
// slot 14752
    14752, 2994,
// P51-P53.agc:504
//		SSP	SSP		# S1 = S2 = 6
// slot 14753
    14753, 55730,
// P51-P53.agc:505
//			S1
// slot 14754
    14754, 82,
// P51-P53.agc:506
//			6
// slot 14755
    14755, 12,
// P51-P53.agc:507
//			S2
// slot 14756
    14756, 84,
// P51-P53.agc:508
//			6
// slot 14757
    14757, 12,
// P51-P53.agc:509
//PIC1		TIX,1	GOTO		# MAJOR STAR
// slot 14758
    14758, 43136,
// P51-P53.agc:510
//			PIC2
// slot 14759
    14759, 25426,
// P51-P53.agc:511
//			PICEND
// slot 14760
    14760, 25580,
// P51-P53.agc:512
//PIC2		VLOAD*	DOT
// slot 14761
    14761, 41462,
// P51-P53.agc:513
//			CATLOG,1
// slot 14762
    14762, 25038,
// P51-P53.agc:514
//			SAX
// slot 14763
    14763, 2994,
// P51-P53.agc:515
//		DSU	BMN
// slot 14764
    14764, 41002,
// P51-P53.agc:516
//			CSS33
// slot 14765
    14765, 25578,
// P51-P53.agc:517
//			PIC1
// slot 14766
    14766, 25420,
// P51-P53.agc:518
//		LXA,2
// slot 14767
    14767, 65496,
// P51-P53.agc:519
//			X1
// slot 14768
    14768, 76,
// P51-P53.agc:520
//PIC3		TIX,2	GOTO
// slot 14769
    14769, 43144,
// P51-P53.agc:521
//			PIC4
// slot 14770
    14770, 25448,
// P51-P53.agc:522
//			PIC1
// slot 14771
    14771, 25420,
// P51-P53.agc:523
//PIC4		VLOAD*	DOT
// slot 14772
    14772, 41462,
// P51-P53.agc:524
//			CATLOG,2
// slot 14773
    14773, 40496,
// P51-P53.agc:525
//			SAX
// slot 14774
    14774, 2994,
// P51-P53.agc:526
//		DSU	BMN
// slot 14775
    14775, 41002,
// P51-P53.agc:527
//			CSS33
// slot 14776
    14776, 25578,
// P51-P53.agc:528
//			PIC3
// slot 14777
    14777, 25442,
// P51-P53.agc:529
//		VLOAD*	DOT*
// slot 14778
    14778, 40950,
// P51-P53.agc:530
//			CATLOG,1
// slot 14779
    14779, 25038,
// P51-P53.agc:531
//			CATLOG,2
// slot 14780
    14780, 40496,
// P51-P53.agc:532
//		DSU	BPL
// slot 14781
    14781, 42026,
// P51-P53.agc:533
//			CSS40
// slot 14782
    14782, 25574,
// P51-P53.agc:534
//			PIC3
// slot 14783
    14783, 25442,
// P51-P53.agc:535
//		VLOAD*	CALL
// slot 14784
    14784, 38134,
// P51-P53.agc:536
//			CATLOG,1
// slot 14785
    14785, 25038,
// P51-P53.agc:537
//			OCCULT
// slot 14786
    14786, 25536,
// P51-P53.agc:538
//		BON
// slot 14787
    14787, 65304,
// P51-P53.agc:539
//			CULTFLAG
// slot 14788
    14788, 1936,
// P51-P53.agc:540
//			PIC1
// slot 14789
    14789, 25420,
// P51-P53.agc:541
//# Page 939
// P51-P53.agc:542
//		VLOAD*	CALL
// slot 14790
    14790, 38134,
// P51-P53.agc:543
//			CATLOG,2
// slot 14791
    14791, 40496,
// P51-P53.agc:544
//			OCCULT
// slot 14792
    14792, 25536,
// P51-P53.agc:545
//		BON
// slot 14793
    14793, 65304,
// P51-P53.agc:546
//			CULTFLAG
// slot 14794
    14794, 1936,
// P51-P53.agc:547
//			PIC3
// slot 14795
    14795, 25442,
// P51-P53.agc:548
//STRATGY		BONCLR
// slot 14796
    14796, 65304,
// P51-P53.agc:549
//			VFLAG
// slot 14797
    14797, 1802,
// P51-P53.agc:550
//			NEWPAR
// slot 14798
    14798, 25526,
// P51-P53.agc:551
//		XCHX,1	XCHX,2
// slot 14799
    14799, 54432,
// P51-P53.agc:552
//			BESTI
// slot 14800
    14800, 3034,
// P51-P53.agc:553
//			BESTJ
// slot 14801
    14801, 3036,
// P51-P53.agc:554
//STRAT		VLOAD*	DOT*
// slot 14802
    14802, 40950,
// P51-P53.agc:555
//			CATLOG,1
// slot 14803
    14803, 25038,
// P51-P53.agc:556
//			CATLOG,2
// slot 14804
    14804, 40496,
// P51-P53.agc:557
//		PUSH	BOFINV
// slot 14805
    14805, 35852,
// P51-P53.agc:558
//			VFLAG
// slot 14806
    14806, 1738,
// P51-P53.agc:559
//			STRAT -3
// slot 14807
    14807, 25502,
// P51-P53.agc:560
//		DLOAD	DSU
// slot 14808
    14808, 38346,
// P51-P53.agc:561
//		BPL
// slot 14809
    14809, 65352,
// P51-P53.agc:562
//			PIC3
// slot 14810
    14810, 25442,
// P51-P53.agc:563
//NEWPAR		SXA,1	SXA,2
// slot 14811
    14811, 56496,
// P51-P53.agc:564
//			BESTI
// slot 14812
    14812, 3034,
// P51-P53.agc:565
//			BESTJ
// slot 14813
    14813, 3036,
// P51-P53.agc:566
//		GOTO
// slot 14814
    14814, 65360,
// P51-P53.agc:567
//			PIC3
// slot 14815
    14815, 25442,
// P51-P53.agc:568
//OCCULT		MXV	BVSU
// slot 14816
    14816, 42402,
// P51-P53.agc:569
//			CULTRIX
// slot 14817
    14817, 2958,
// P51-P53.agc:570
//			CSS
// slot 14818
    14818, 30,
// P51-P53.agc:571
//		BZE
// slot 14819
    14819, 65368,
// P51-P53.agc:572
//			CULTED
// slot 14820
    14820, 25566,
// P51-P53.agc:573
//		BMN	SIGN
// slot 14821
    14821, 62784,
// P51-P53.agc:574
//			CULTED
// slot 14822
    14822, 25566,
// P51-P53.agc:575
//			MPAC +3
// slot 14823
    14823, 224,
// P51-P53.agc:576
//		BMN	SIGN
// slot 14824
    14824, 62784,
// P51-P53.agc:577
//			CULTED
// slot 14825
    14825, 25566,
// P51-P53.agc:578
//			MPAC +5
// slot 14826
    14826, 228,
// P51-P53.agc:579
//		BMN	CLRGO
// slot 14827
    14827, 35904,
// P51-P53.agc:580
//			CULTED
// slot 14828
    14828, 25566,
// P51-P53.agc:581
//			CULTFLAG
// slot 14829
    14829, 1840,
// P51-P53.agc:582
//			QPRET
// slot 14830
    14830, 84,
// P51-P53.agc:583
//CULTED		SETGO
// slot 14831
    14831, 65304,
// P51-P53.agc:584
//			CULTFLAG
// slot 14832
    14832, 1584,
// P51-P53.agc:585
//			QPRET
// slot 14833
    14833, 84,
// P51-P53.agc:586
//CSS		= 	CEARTH
// P51-P53.agc:587
//CSS40		2DEC	.16070		# COS 50 / 4
// slot 14834 14835
    14834, 5264, 14835, 29780,
// P51-P53.agc:588
//CSS33		2DEC	.16070		# COS 50 / 4
// slot 14836 14837
    14836, 5264, 14837, 29780,
// P51-P53.agc:589
//PICEND		BOFF	EXIT
// slot 14838
    14838, 65048,
// P51-P53.agc:590
//
// P51-P53.agc:591
//# Page 940
// P51-P53.agc:592
//			VFLAG
// slot 14839
    14839, 1994,
// P51-P53.agc:593
//			PICGXT
// slot 14840
    14840, 25588
)).

// bank 14, slots 14841-14841
function agcAotUnit814 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:594
//		TC	PICBXT
// slot 14841
    if slot <> 14841 or instruction <> 1547 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1547, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[814] to agcAotUnit814@.

agcAotInstallSourceRope(list(
// P51-P53.agc:595
//PICGXT		LXA,1	LXA,2
// slot 14842
    14842, 60624,
// P51-P53.agc:596
//			BESTI
// slot 14843
    14843, 3034,
// P51-P53.agc:597
//			BESTJ
// slot 14844
    14844, 3036,
// P51-P53.agc:598
//		VLOAD	DOT*
// slot 14845
    14845, 40954,
// P51-P53.agc:599
//			SAX
// slot 14846
    14846, 2994,
// P51-P53.agc:600
//			CATLOG,1
// slot 14847
    14847, 25038,
// P51-P53.agc:601
//		PDVL	DOT*
// slot 14848
    14848, 40858,
// P51-P53.agc:602
//			SAX
// slot 14849
    14849, 2994,
// P51-P53.agc:603
//			CATLOG,2
// slot 14850
    14850, 40496,
// P51-P53.agc:604
//		DSU
// slot 14851
    14851, 65322,
// P51-P53.agc:605
//		BPL	SXA,1
// slot 14852
    14852, 55368,
// P51-P53.agc:606
//			PICNSWP
// slot 14853
    14853, 25618,
// P51-P53.agc:607
//			BESTJ
// slot 14854
    14854, 3036,
// P51-P53.agc:608
//		SXA,2
// slot 14855
    14855, 65464,
// P51-P53.agc:609
//			BESTI
// slot 14856
    14856, 3034,
// P51-P53.agc:610
//PICNSWP		EXIT
// slot 14857
    14857, 65532
)).

// bank 14, slots 14858-14860
function agcAotUnit815 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14858 {
// P51-P53.agc:611
//		INCR	QMIN
// slot 14858
        if slot <> 14858 or instruction <> 11237 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 997).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14859 {
// P51-P53.agc:612
//PICBXT		CA	QMIN
// slot 14859
            if slot <> 14859 or instruction <> 13285 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 997).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:613
//		TC	SWCALL
// slot 14860
            if slot <> 14860 or instruction <> 2450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2450, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[815] to agcAotUnit815@.

agcAotInstallSourceRope(list(
// P51-P53.agc:614
//VPD		= 	0D
// P51-P53.agc:615
//V0		=	6D
// P51-P53.agc:616
//V1		= 	12D
// P51-P53.agc:617
//V2		=	18D
// P51-P53.agc:618
//V3		=	24D
// P51-P53.agc:619
//DP0		=	30D
// P51-P53.agc:620
//DP1		=	32D
// P51-P53.agc:621
//
// P51-P53.agc:622
//# Page 941
// P51-P53.agc:623
//# NAME -- R51	FINE ALIGN
// P51-P53.agc:624
//# FUNCTION -- TO ALIGN THE STABLE MEMBER TO REFSSMAT
// P51-P53.agc:625
//# CALLING SEQ -- CALL R51
// P51-P53.agc:626
//# INPUT -- REFSMMAT
// P51-P53.agc:627
//# OUTPUT -- GYRO TORQUE PULSES
// P51-P53.agc:628
//# SUBROUTINES -- LOCSAM, PICAPAR, R52, R53, R54, R55
// P51-P53.agc:629
//
// P51-P53.agc:630
//		COUNT*	$$/R51
// P51-P53.agc:631
//R51		STQ
// slot 14861
    14861, 65312,
// P51-P53.agc:632
//			QMAJ
// slot 14862
    14862, 3020,
// P51-P53.agc:633
//R51.1		EXIT
// slot 14863
    14863, 65532
)).

// bank 14, slots 14864-14864
function agcAotUnit816 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:634
//		TC	PHASCHNG
// slot 14864
    if slot <> 14864 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[816] to agcAotUnit816@.

agcAotInstallSourceRope(list(
// P51-P53.agc:635
//		OCT	04024
// slot 14865
    14865, 4136
)).

// bank 14, slots 14866-14867
function agcAotUnit817 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14866 {
// P51-P53.agc:636
//
// P51-P53.agc:637
//R51C		CAF	OCT15
// slot 14866
        if slot <> 14866 or instruction <> 14833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2545), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:638
//		TC	BANKCALL
// slot 14867
        if slot <> 14867 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[817] to agcAotUnit817@.

agcAotInstallSourceRope(list(
// P51-P53.agc:639
//		CADR	GOPERF1
// slot 14868
    14868, 17190
)).

// bank 14, slots 14869-14872
function agcAotUnit818 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14870 {
        if slot <= 14869 {
// P51-P53.agc:640
//		TC	GOTOPOOH
// slot 14869
            if slot <> 14869 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:641
//		TC	+2		# V33E
// slot 14870
            if slot <> 14870 or instruction <> 1560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14871 {
// P51-P53.agc:642
//		TC	R51E		# ENTER
// slot 14871
            if slot <> 14871 or instruction <> 1579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:643
//		TC	INTPRET
// slot 14872
            if slot <> 14872 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[818] to agcAotUnit818@.

agcAotInstallSourceRope(list(
// P51-P53.agc:644
//		RTB	DAD
// slot 14873
    14873, 36152,
// P51-P53.agc:645
//			LOADTIME
// slot 14874
    14874, 18166,
// P51-P53.agc:646
//			TSIGHT1
// slot 14875
    14875, 25830,
// P51-P53.agc:647
//		CALL
// slot 14876
    14876, 65320,
// P51-P53.agc:648
//			LOCSAM
// slot 14877
    14877, 25228,
// P51-P53.agc:649
//		EXIT
// slot 14878
    14878, 65532
)).

// bank 14, slots 14879-14879
function agcAotUnit819 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:650
//		TC	BANKCALL
// slot 14879
    if slot <> 14879 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[819] to agcAotUnit819@.

agcAotInstallSourceRope(list(
// P51-P53.agc:651
//		CADR	R56
// slot 14880
    14880, 25362
)).

// bank 14, slots 14881-14883
function agcAotUnit820 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14881 {
// P51-P53.agc:652
//		TC	R51I
// slot 14881
        if slot <> 14881 or instruction <> 1571 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1571, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14882 {
// P51-P53.agc:653
//R51F		TC	R51E
// slot 14882
            if slot <> 14882 or instruction <> 1579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:654
//R51I		TC	ALARM
// slot 14883
            if slot <> 14883 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[820] to agcAotUnit820@.

agcAotInstallSourceRope(list(
// P51-P53.agc:655
//		OCT	405
// slot 14884
    14884, 522
)).

// bank 14, slots 14885-14886
function agcAotUnit821 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14885 {
// P51-P53.agc:656
//		CAF	VB05N09
// slot 14885
        if slot <> 14885 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:657
//		TC	BANKCALL
// slot 14886
        if slot <> 14886 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[821] to agcAotUnit821@.

agcAotInstallSourceRope(list(
// P51-P53.agc:658
//		CADR	GOFLASH
// slot 14887
    14887, 17020
)).

// bank 14, slots 14888-14893
function agcAotUnit822 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14890 {
        if slot <= 14888 {
// P51-P53.agc:659
//		TC	GOTOPOOH
// slot 14888
            if slot <> 14888 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14889 {
// P51-P53.agc:660
//		TC	R51E
// slot 14889
                if slot <> 14889 or instruction <> 1579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:661
//		TC	R51C
// slot 14890
                if slot <> 14890 or instruction <> 1554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1554, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 14891 {
// P51-P53.agc:662
//R51E		CAF	ZERO
// slot 14891
            if slot <> 14891 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14892 {
// P51-P53.agc:663
//		TS	STARIND
// slot 14892
                if slot <> 14892 or instruction <> 23535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23535, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:664
//R51.2		TC	INTPRET
// slot 14893
                if slot <> 14893 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[822] to agcAotUnit822@.

agcAotInstallSourceRope(list(
// P51-P53.agc:665
//R51.3		EXIT
// slot 14894
    14894, 65532
)).

// bank 14, slots 14895-14895
function agcAotUnit823 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:666
//		TC	PHASCHNG
// slot 14895
    if slot <> 14895 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[823] to agcAotUnit823@.

agcAotInstallSourceRope(list(
// P51-P53.agc:667
//		OCT	04024
// slot 14896
    14896, 4136
)).

// bank 14, slots 14897-14897
function agcAotUnit824 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:668
//
// P51-P53.agc:669
//		TC	INTPRET
// slot 14897
    if slot <> 14897 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[824] to agcAotUnit824@.

agcAotInstallSourceRope(list(
// P51-P53.agc:670
//		CALL
// slot 14898
    14898, 65320,
// P51-P53.agc:671
//			R52		# AOP WILL MAKE CALLS TO SIGHTING
// slot 14899
    14899, 26480,
// P51-P53.agc:672
//		EXIT
// slot 14900
    14900, 65532
)).

// bank 14, slots 14901-14901
function agcAotUnit825 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:673
//		TC	BANKCALL
// slot 14901
    if slot <> 14901 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[825] to agcAotUnit825@.

agcAotInstallSourceRope(list(
// P51-P53.agc:674
//# Page 942
// P51-P53.agc:675
//		CADR	AOTMARK
// slot 14902
    14902, 14336
)).

// bank 14, slots 14903-14903
function agcAotUnit826 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:676
//		TC	BANKCALL
// slot 14903
    if slot <> 14903 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[826] to agcAotUnit826@.

agcAotInstallSourceRope(list(
// P51-P53.agc:677
//		CADR	OPTSTALL
// slot 14904
    14904, 16276
)).

// bank 14, slots 14905-14909
function agcAotUnit827 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14906 {
        if slot <= 14905 {
// P51-P53.agc:678
//		TC	CURTAINS
// slot 14905
            if slot <> 14905 or instruction <> 3017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3017, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:679
//		CCS	STARIND
// slot 14906
            if slot <> 14906 or instruction <> 5103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 1007).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14907 {
// P51-P53.agc:680
//		TCF	+2
// slot 14907
            if slot <> 14907 or instruction <> 5693 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5693, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 14908 {
// P51-P53.agc:681
//		TC	R51.4
// slot 14908
                if slot <> 14908 or instruction <> 1637 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1637, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:682
//		TC	INTPRET
// slot 14909
                if slot <> 14909 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[827] to agcAotUnit827@.

agcAotInstallSourceRope(list(
// P51-P53.agc:683
//		VLOAD
// slot 14910
    14910, 65530,
// P51-P53.agc:684
//			STARAD +6
// slot 14911
    14911, 2970,
// P51-P53.agc:685
//		STORE	STARSAV2
// slot 14912
    14912, 3054,
// P51-P53.agc:686
//		EXIT
// slot 14913
    14913, 65532
)).

// bank 14, slots 14914-14914
function agcAotUnit828 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:687
//		TC	PHASCHNG
// slot 14914
    if slot <> 14914 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[828] to agcAotUnit828@.

agcAotInstallSourceRope(list(
// P51-P53.agc:688
//		OCT	04024
// slot 14915
    14915, 4136
)).

// bank 14, slots 14916-14916
function agcAotUnit829 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:689
//
// P51-P53.agc:690
//		TC	INTPRET
// slot 14916
    if slot <> 14916 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[829] to agcAotUnit829@.

agcAotInstallSourceRope(list(
// P51-P53.agc:691
//		DLOAD	CALL
// slot 14917
    14917, 38090,
// P51-P53.agc:692
//			TSIGHT
// slot 14918
    14918, 3812,
// P51-P53.agc:693
//			PLANET
// slot 14919
    14919, 27252,
// P51-P53.agc:694
//		MXV	UNIT
// slot 14920
    14920, 44706,
// P51-P53.agc:695
//			REFSMMAT
// slot 14921
    14921, 1976,
// P51-P53.agc:696
//		STOVL	STARAD +6
// slot 14922
    14922, 23450,
// P51-P53.agc:697
//			PLANVEC
// slot 14923
    14923, 3800,
// P51-P53.agc:698
//		MXV	UNIT
// slot 14924
    14924, 44706,
// P51-P53.agc:699
//			REFSMMAT
// slot 14925
    14925, 1976,
// P51-P53.agc:700
//		STOVL	STARAD
// slot 14926
    14926, 23438,
// P51-P53.agc:701
//			STARSAV1
// slot 14927
    14927, 3042,
// P51-P53.agc:702
//		STOVL	6D
// slot 14928
    14928, 20494,
// P51-P53.agc:703
//			STARSAV2
// slot 14929
    14929, 3054,
// P51-P53.agc:704
//		STCALL	12D
// slot 14930
    14930, 28698,
// P51-P53.agc:705
//			R54		# STAR DATA TEST
// slot 14931
    14931, 25948,
// P51-P53.agc:706
//		BOFF	CALL
// slot 14932
    14932, 37912,
// P51-P53.agc:707
//			FREEFLAG
// slot 14933
    14933, 472,
// P51-P53.agc:708
//			R51K
// slot 14934
    14934, 25784,
// P51-P53.agc:709
//			AXISGEN
// slot 14935
    14935, 40514,
// P51-P53.agc:710
//		CALL
// slot 14936
    14936, 65320,
// P51-P53.agc:711
//			R55		# GYRO TORQUE
// slot 14937
    14937, 25896,
// P51-P53.agc:712
//		CLEAR
// slot 14938
    14938, 65304,
// P51-P53.agc:713
//			PFRATFLG
// slot 14939
    14939, 1398,
// P51-P53.agc:714
//R51K		EXIT
// slot 14940
    14940, 65532
)).

// bank 14, slots 14941-14942
function agcAotUnit830 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14941 {
// P51-P53.agc:715
//R51P63		CAF	OCT14
// slot 14941
        if slot <> 14941 or instruction <> 15337 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3049), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:716
//		TC	BANKCALL
// slot 14942
        if slot <> 14942 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[830] to agcAotUnit830@.

agcAotInstallSourceRope(list(
// P51-P53.agc:717
//		CADR	GOPERF1
// slot 14943
    14943, 17190
)).

// bank 14, slots 14944-14946
function agcAotUnit831 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14944 {
// P51-P53.agc:718
//		TC	GOTOPOOH
// slot 14944
        if slot <> 14944 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 14945 {
// P51-P53.agc:719
//		TC	R51C
// slot 14945
            if slot <> 14945 or instruction <> 1554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:720
//		TC	INTPRET
// slot 14946
            if slot <> 14946 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[831] to agcAotUnit831@.

agcAotInstallSourceRope(list(
// P51-P53.agc:721
//		GOTO
// slot 14947
    14947, 65360,
// P51-P53.agc:722
//			QMAJ
// slot 14948
    14948, 3020
)).

// bank 14, slots 14949-14949
function agcAotUnit832 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:723
//R51.4		TC	INTPRET
// slot 14949
    if slot <> 14949 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[832] to agcAotUnit832@.

agcAotInstallSourceRope(list(
// P51-P53.agc:724
//		VLOAD
// slot 14950
    14950, 65530,
// P51-P53.agc:725
//# Page 943
// P51-P53.agc:726
//			STARAD +6
// slot 14951
    14951, 2970,
// P51-P53.agc:727
//		STORE	STARSAV1
// slot 14952
    14952, 3042,
// P51-P53.agc:728
//		DLOAD	CALL
// slot 14953
    14953, 38090,
// P51-P53.agc:729
//			TSIGHT
// slot 14954
    14954, 3812,
// P51-P53.agc:730
//			PLANET
// slot 14955
    14955, 27252,
// P51-P53.agc:731
//		STORE	PLANVEC
// slot 14956
    14956, 3800,
// P51-P53.agc:732
//		SSP
// slot 14957
    14957, 65458,
// P51-P53.agc:733
//			STARIND
// slot 14958
    14958, 3040,
// P51-P53.agc:734
//			1
// slot 14959
    14959, 2,
// P51-P53.agc:735
//		GOTO
// slot 14960
    14960, 65360,
// P51-P53.agc:736
//			R51.3
// slot 14961
    14961, 25692,
// P51-P53.agc:737
//TSIGHT1		2DEC	36000		# 6 MIN TO MARKING
// slot 14962 14963
    14962, 4, 14963, 6464,
// P51-P53.agc:738
//
// P51-P53.agc:739
//# Page 944
// P51-P53.agc:740
//# GYRO TORQUE COARSE ALGNMENT
// P51-P53.agc:741
//
// P51-P53.agc:742
//GYCOARS		STQ	CALL
// slot 14964
    14964, 37920,
// P51-P53.agc:743
//			QMAJ
// slot 14965
    14965, 3020,
// P51-P53.agc:744
//			CALCGTA
// slot 14966
    14966, 40270,
// P51-P53.agc:745
//		CLEAR	CLEAR
// slot 14967
    14967, 35864,
// P51-P53.agc:746
//			DRIFTFLG
// slot 14968
    14968, 1376,
// P51-P53.agc:747
//			REFSMFLG
// slot 14969
    14969, 1892,
// P51-P53.agc:748
//		EXIT
// slot 14970
    14970, 65532
)).

// bank 14, slots 14971-14972
function agcAotUnit833 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14971 {
// P51-P53.agc:749
//		CAF	V16N20		# MONITOR GIMBALS
// slot 14971
        if slot <> 14971 or instruction <> 13971 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1683), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:750
//		TC	BANKCALL
// slot 14972
        if slot <> 14972 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[833] to agcAotUnit833@.

agcAotInstallSourceRope(list(
// P51-P53.agc:751
//		CADR	GODSPR
// slot 14973
    14973, 16978
)).

// bank 14, slots 14974-14975
function agcAotUnit834 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14974 {
// P51-P53.agc:752
//		CA	R55CDR
// slot 14974
        if slot <> 14974 or instruction <> 13997 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1709), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:753
//		TC	BANKCALL
// slot 14975
        if slot <> 14975 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[834] to agcAotUnit834@.

agcAotInstallSourceRope(list(
// P51-P53.agc:754
//		CADR	IMUPULSE
// slot 14976
    14976, 15782
)).

// bank 14, slots 14977-14977
function agcAotUnit835 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:755
//		TC	BANKCALL
// slot 14977
    if slot <> 14977 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[835] to agcAotUnit835@.

agcAotInstallSourceRope(list(
// P51-P53.agc:756
//		CADR	IMUSTALL
// slot 14978
    14978, 16284
)).

// bank 14, slots 14979-14980
function agcAotUnit836 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14979 {
// P51-P53.agc:757
//		TC	CURTAINS
// slot 14979
        if slot <> 14979 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:758
//		TC	PHASCHNG
// slot 14980
        if slot <> 14980 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[836] to agcAotUnit836@.

agcAotInstallSourceRope(list(
// P51-P53.agc:759
//		OCT	04024
// slot 14981
    14981, 4136
)).

// bank 14, slots 14982-14982
function agcAotUnit837 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:760
//
// P51-P53.agc:761
//		TC	INTPRET
// slot 14982
    if slot <> 14982 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[837] to agcAotUnit837@.

agcAotInstallSourceRope(list(
// P51-P53.agc:762
//		AXC,1	AXC,2
// slot 14983
    14983, 62688,
// P51-P53.agc:763
//			XSMD
// slot 14984
    14984, 3852,
// P51-P53.agc:764
//			REFSMMAT
// slot 14985
    14985, 1974,
// P51-P53.agc:765
//		CALL			# STORE DESIRED REFSMMAT
// slot 14986
    14986, 65320,
// P51-P53.agc:766
//			MATMOVE
// slot 14987
    14987, 26110,
// P51-P53.agc:767
//		CLEAR	SET
// slot 14988
    14988, 35864,
// P51-P53.agc:768
//			PFRATFLG
// slot 14989
    14989, 1398,
// P51-P53.agc:769
//			REFSMFLG
// slot 14990
    14990, 1636,
// P51-P53.agc:770
//		CALL
// slot 14991
    14991, 65320,
// P51-P53.agc:771
//			NCOARSE		# SET DRIFT AND INITIALIZE 1/PIPADT
// slot 14992
    14992, 26372,
// P51-P53.agc:772
//		GOTO
// slot 14993
    14993, 65360,
// P51-P53.agc:773
//			R51K
// slot 14994
    14994, 25784,
// P51-P53.agc:774
//V16N20		VN	1620
// slot 14995
    14995, 4136,
// P51-P53.agc:775
//
// P51-P53.agc:776
//# Page 945
// P51-P53.agc:777
//# R55	GYRO TORQUE
// P51-P53.agc:778
//# FUNCTION -- COMPUTE AND SEND GYRO PULSES
// P51-P53.agc:779
//# CALLING SEQ -- CALL R55
// P51-P53.agc:780
//# INPUT -- X,Y,ZDC -- REFSMMAT WRT PRESENT STABLE MEMBER
// P51-P53.agc:781
//# OUTPUT -- GYRO PULSES
// P51-P53.agc:782
//# SUBROUTINES -- CALCGTA, GOFLASH, GODSPR, IMUFINE, IMUPULSE, GOPERF1
// P51-P53.agc:783
//
// P51-P53.agc:784
//		COUNT*	$$/R55
// P51-P53.agc:785
//R55		STQ
// slot 14996
    14996, 65312,
// P51-P53.agc:786
//			QMIN
// slot 14997
    14997, 3018,
// P51-P53.agc:787
//		CALL
// slot 14998
    14998, 65320,
// P51-P53.agc:788
//			CALCGTA
// slot 14999
    14999, 40270,
// P51-P53.agc:789
//PULSEM		EXIT
// slot 15000
    15000, 65532
)).

// bank 14, slots 15001-15002
function agcAotUnit838 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15001 {
// P51-P53.agc:790
//R55.1		CAF	V06N93
// slot 15001
        if slot <> 15001 or instruction <> 13996 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1708), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:791
//		TC	BANKCALL
// slot 15002
        if slot <> 15002 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[838] to agcAotUnit838@.

agcAotInstallSourceRope(list(
// P51-P53.agc:792
//		CADR	GOFLASH
// slot 15003
    15003, 17020
)).

// bank 14, slots 15004-15007
function agcAotUnit839 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15005 {
        if slot <= 15004 {
// P51-P53.agc:793
//		TC	GOTOPOOH
// slot 15004
            if slot <> 15004 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:794
//		TC	R55.2
// slot 15005
            if slot <> 15005 or instruction <> 1695 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1695, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15006 {
// P51-P53.agc:795
//		TC	R55RET
// slot 15006
            if slot <> 15006 or instruction <> 1705 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1705, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:796
//R55.2		TC	PHASCHNG
// slot 15007
            if slot <> 15007 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[839] to agcAotUnit839@.

agcAotInstallSourceRope(list(
// P51-P53.agc:797
//		OCT	00214
// slot 15008
    15008, 280
)).

// bank 14, slots 15009-15010
function agcAotUnit840 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15009 {
// P51-P53.agc:798
//		CA	R55CDR
// slot 15009
        if slot <> 15009 or instruction <> 13997 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1709), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:799
//		TC	BANKCALL
// slot 15010
        if slot <> 15010 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[840] to agcAotUnit840@.

agcAotInstallSourceRope(list(
// P51-P53.agc:800
//		CADR	IMUPULSE
// slot 15011
    15011, 15782
)).

// bank 14, slots 15012-15012
function agcAotUnit841 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:801
//		TC	BANKCALL
// slot 15012
    if slot <> 15012 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[841] to agcAotUnit841@.

agcAotInstallSourceRope(list(
// P51-P53.agc:802
//		CADR	IMUSTALL
// slot 15013
    15013, 16284
)).

// bank 14, slots 15014-15015
function agcAotUnit842 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15014 {
// P51-P53.agc:803
//		TC	CURTAINS
// slot 15014
        if slot <> 15014 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:804
//		TC	PHASCHNG
// slot 15015
        if slot <> 15015 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[842] to agcAotUnit842@.

agcAotInstallSourceRope(list(
// P51-P53.agc:805
//		OCT	04024
// slot 15016
    15016, 4136
)).

// bank 14, slots 15017-15017
function agcAotUnit843 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:806
//
// P51-P53.agc:807
//R55RET		TC	INTPRET
// slot 15017
    if slot <> 15017 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[843] to agcAotUnit843@.

agcAotInstallSourceRope(list(
// P51-P53.agc:808
//		GOTO
// slot 15018
    15018, 65360,
// P51-P53.agc:809
//			QMIN
// slot 15019
    15019, 3018,
// P51-P53.agc:810
//V06N93		VN	0693
// slot 15020
    15020, 1722,
// P51-P53.agc:811
//R55CDR		ECADR	OGC
// slot 15021
    15021, 3006,
// P51-P53.agc:812
//R54		=	CHKSDATA
// P51-P53.agc:813
//
// P51-P53.agc:814
//# ROUTINE NAME -- CHKSDATA		DATE -- JAN 9, 1967
// P51-P53.agc:815
//# MOD NO -- 0				LOG SECTION -- P51-P53
// P51-P53.agc:816
//# MODIFICATION BY -- LONSKE		ASSEMBLY --
// P51-P53.agc:817
//#
// P51-P53.agc:818
//# FUNCTIONAL DESCRIPTION -- CHECKS THE VALIDITY OF A PAIR OF STAR SIGHTINGS.  WHEN A PAIR OF STAR SIGHTINGS ARE MADE
// P51-P53.agc:819
//# BY THE ASTRONAUT THIS ROUTINE OPERATES AND CHECKS THE OBSERVED SIGHTINGS AGAINST STORED STAR VECTORS IN THE
// P51-P53.agc:820
//# COMPUTER TO INSURE A PROPER SIGHTING WAS MADE.  THE FOLLOWING COMPUTATIONS ARE PERFORMED --
// P51-P53.agc:821
//#	OS1	=	OBSERVED STAR 1 VECTOR
// P51-P53.agc:822
//#	OS2	=	OBSERVED STAR 2 VECTOR
// P51-P53.agc:823
//#	SS1	=	STORED STAR 1 VECTOR
// P51-P53.agc:824
//#	SS2 	=	STORED STAR 2 VECTOR
// P51-P53.agc:825
//#	 A1	= 	ARCCOS(OS1 - OS2)
// P51-P53.agc:826
//#	 A2	=	ARCCOS(SS1 - SS2)
// P51-P53.agc:827
//#	  A 	=	ABS(2(A1 - A2))
// P51-P53.agc:828
//# Page 946
// P51-P53.agc:829
//# THE ANGULAR DIFFERENCE IS DISPLAYED FOR ASTRONAUT ACCEPTANCE.
// P51-P53.agc:830
//#
// P51-P53.agc:831
//# EXIT MODE --	1. FREEFLAG SET IMPLIES ASTRONAUT WANTS TO PROCEED
// P51-P53.agc:832
//#		2. FREEFLAG RESET IMPLIES ASTRONAUT WANTS TO RECYCLE
// P51-P53.agc:833
//#
// P51-P53.agc:834
//# OUTPUT --	1. VERB 6,NOUN 3 -- DISPLAYS ANGULAR DIFFERENCE BETWEEN 2 SETS OF STARS.
// P51-P53.agc:835
//#		2. STAR VECTORS FROM STAR CATALOG ARE LEFT IN 6D AND 12D.
// P51-P53.agc:836
//#
// P51-P53.agc:837
//# ERASABLE INITIALIZATION REQUIRED --
// P51-P53.agc:838
//#		1. MARK VECTORS ARE STORED IN STARAD AND STARAD +6.
// P51-P53.agc:839
//#		2. CATALOG VECTORS ARE STORED IN 6D AND 12D.
// P51-P53.agc:840
//#
// P51-P53.agc:841
//# DEBRIS --
// P51-P53.agc:842
//
// P51-P53.agc:843
//		COUNT*	$$/R54
// P51-P53.agc:844
//CHKSDATA	STQ	SET
// slot 15022
    15022, 35872,
// P51-P53.agc:845
//			QMIN
// slot 15023
    15023, 3018,
// P51-P53.agc:846
//			FREEFLAG
// slot 15024
    15024, 120,
// P51-P53.agc:847
//CHKSAB		AXC,1			# SET X1 TO STORE EPHEMERIS DATA
// slot 15025
    15025, 65504,
// P51-P53.agc:848
//			STARAD
// slot 15026
    15026, 2956,
// P51-P53.agc:849
//
// P51-P53.agc:850
//CHKSB		VLOAD*	DOT*		# CAL. ANGLE THETA
// slot 15027
    15027, 40950,
// P51-P53.agc:851
//			0,1
// slot 15028
    15028, 2,
// P51-P53.agc:852
//			6,1
// slot 15029
    15029, 14,
// P51-P53.agc:853
//		SL1	ACOS
// slot 15030
    15030, 54996,
// P51-P53.agc:854
//		STORE	THETA
// slot 15031
    15031, 42,
// P51-P53.agc:855
//		BOFF	INVERT		# BRANCH TO CHKSD IF THIS IS 2ND PASS
// slot 15032
    15032, 35864,
// P51-P53.agc:856
//			FREEFLAG
// slot 15033
    15033, 472,
// P51-P53.agc:857
//			CHKSD
// slot 15034
    15034, 25988,
// P51-P53.agc:858
//			FREEFLAG	# CLEAR FREEFLAG
// slot 15035
    15035, 248,
// P51-P53.agc:859
//		AXC,1	DLOAD		# SET X1 TO MARK ANGLES
// slot 15036
    15036, 58848,
// P51-P53.agc:860
//			6D
// slot 15037
    15037, 12,
// P51-P53.agc:861
//			THETA
// slot 15038
    15038, 42,
// P51-P53.agc:862
//		STORE	18D
// slot 15039
    15039, 38,
// P51-P53.agc:863
//		GOTO
// slot 15040
    15040, 65360,
// P51-P53.agc:864
//			CHKSB		# RETURN TO CAL. 2ND ANGLE
// slot 15041
    15041, 25958,
// P51-P53.agc:865
//CHKSD		DLOAD	DSU
// slot 15042
    15042, 38346,
// P51-P53.agc:866
//			THETA
// slot 15043
    15043, 42,
// P51-P53.agc:867
//			18D
// slot 15044
    15044, 38,
// P51-P53.agc:868
//		ABS	RTB		# COMPUTE POS DIFF
// slot 15045
    15045, 40012,
// P51-P53.agc:869
//			SGNAGREE
// slot 15046
    15046, 18196,
// P51-P53.agc:870
//		STORE	NORMTEM1
// slot 15047
    15047, 1100,
// P51-P53.agc:871
//		SET	EXIT
// slot 15048
    15048, 65048,
// P51-P53.agc:872
//			FREEFLAG
// slot 15049
    15049, 120
)).

// bank 14, slots 15050-15051
function agcAotUnit844 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15050 {
// P51-P53.agc:873
//		CAF	VB6N5
// slot 15050
        if slot <> 15050 or instruction <> 14038 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1750), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:874
//		TC	BANKCALL
// slot 15051
        if slot <> 15051 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[844] to agcAotUnit844@.

agcAotInstallSourceRope(list(
// P51-P53.agc:875
//		CADR	GOFLASH
// slot 15052
    15052, 17020
)).

// bank 14, slots 15053-15055
function agcAotUnit845 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15053 {
// P51-P53.agc:876
//		TCF	GOTOPOOH
// slot 15053
        if slot <> 15053 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15054 {
// P51-P53.agc:877
//		TC	CHKSDA		# PROCEED
// slot 15054
            if slot <> 15054 or instruction <> 1747 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1747, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:878
//		TC	INTPRET
// slot 15055
            if slot <> 15055 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[845] to agcAotUnit845@.

agcAotInstallSourceRope(list(
// P51-P53.agc:879
//		CLEAR	GOTO
// slot 15056
    15056, 43032,
// P51-P53.agc:880
//			FREEFLAG
// slot 15057
    15057, 376,
// P51-P53.agc:881
//			QMIN
// slot 15058
    15058, 3018
)).

// bank 14, slots 15059-15059
function agcAotUnit846 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:882
//CHKSDA		TC	INTPRET
// slot 15059
    if slot <> 15059 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[846] to agcAotUnit846@.

agcAotInstallSourceRope(list(
// P51-P53.agc:883
//# Page 947
// P51-P53.agc:884
//		GOTO
// slot 15060
    15060, 65360,
// P51-P53.agc:885
//			QMIN
// slot 15061
    15061, 3018,
// P51-P53.agc:886
//VB6N5		VN	605
// slot 15062
    15062, 1546,
// P51-P53.agc:887
//
// P51-P53.agc:888
//# NAME -- CAL53A
// P51-P53.agc:889
//# FUNCTION -- COMPUTE DESIRED GIMBAL ANGLES AND COARSE ALIGN IF NECESSARY
// P51-P53.agc:890
//# CALLING SEQUENCE -- CALL CAL53A
// P51-P53.agc:891
//# INPUT -- X,Y,ZSMD, CDUX,Y,Z
// P51-P53.agc:892
//#	   DESIRED GIMBAL ANGLES -- THETAD,+1,+2
// P51-P53.agc:893
//# OUTPUT -- THE IMU COORDINATES AT STORED IN REFSMMAT
// P51-P53.agc:894
//# SUBROUTINES -- S52.2, IMUCOARSE, IMUFINE
// P51-P53.agc:895
//
// P51-P53.agc:896
//		COUNT*	$$/R50
// P51-P53.agc:897
//CAL53A		CALL
// slot 15063
    15063, 65320,
// P51-P53.agc:898
//			S52.2		# MAKE ONE FINAL COMP OF GIMBAL ANGLES
// slot 15064
    15064, 26398,
// P51-P53.agc:899
//		RTB	SSP
// slot 15065
    15065, 55608,
// P51-P53.agc:900
//			RDCDUS		# READ CDUS
// slot 15066
    15066, 26134,
// P51-P53.agc:901
//			S1
// slot 15067
    15067, 82,
// P51-P53.agc:902
//			1
// slot 15068
    15068, 2,
// P51-P53.agc:903
//		AXT,1	SETPD
// slot 15069
    15069, 33264,
// P51-P53.agc:904
//			3
// slot 15070
    15070, 6,
// P51-P53.agc:905
//			4
// slot 15071
    15071, 10,
// P51-P53.agc:906
//CALOOP		DLOAD*	SR1
// slot 15072
    15072, 58054,
// P51-P53.agc:907
//			THETAD +3D,1
// slot 15073
    15073, 426,
// P51-P53.agc:908
//		PDDL*	SR1
// slot 15074
    15074, 58022,
// P51-P53.agc:909
//			4,1
// slot 15075
    15075, 10,
// P51-P53.agc:910
//		DSU	ABS
// slot 15076
    15076, 42538,
// P51-P53.agc:911
//		PUSH	DSU
// slot 15077
    15077, 38156,
// P51-P53.agc:912
//			DEGREE1
// slot 15078
    15078, 26132,
// P51-P53.agc:913
//		BMN	DLOAD
// slot 15079
    15079, 58688,
// P51-P53.agc:914
//			CALOOP1
// slot 15080
    15080, 26092,
// P51-P53.agc:915
//		DSU	BPL
// slot 15081
    15081, 42026,
// P51-P53.agc:916
//			DEG359
// slot 15082
    15082, 26134,
// P51-P53.agc:917
//			CALOOP1
// slot 15083
    15083, 26092,
// P51-P53.agc:918
//		EXIT
// slot 15084
    15084, 65532
)).

// bank 14, slots 15085-15085
function agcAotUnit847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:919
//		TC	PHASCHNG
// slot 15085
    if slot <> 15085 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[847] to agcAotUnit847@.

agcAotInstallSourceRope(list(
// P51-P53.agc:920
//		OCT	04024
// slot 15086
    15086, 4136
)).

// bank 14, slots 15087-15087
function agcAotUnit848 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:921
//
// P51-P53.agc:922
//		TC	INTPRET
// slot 15087
    if slot <> 15087 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[848] to agcAotUnit848@.

agcAotInstallSourceRope(list(
// P51-P53.agc:923
//COARFINE	CALL
// slot 15088
    15088, 65320,
// P51-P53.agc:924
//			COARSE
// slot 15089
    15089, 26346,
// P51-P53.agc:925
//		CALL
// slot 15090
    15090, 65320,
// P51-P53.agc:926
//			NCOARSE
// slot 15091
    15091, 26372,
// P51-P53.agc:927
//		GOTO
// slot 15092
    15092, 65360,
// P51-P53.agc:928
//			FINEONLY
// slot 15093
    15093, 26096,
// P51-P53.agc:929
//CALOOP1		TIX,1
// slot 15094
    15094, 65408,
// P51-P53.agc:930
//			CALOOP
// slot 15095
    15095, 26048,
// P51-P53.agc:931
//FINEONLY	AXC,1	AXC,2
// slot 15096
    15096, 62688,
// P51-P53.agc:932
//			XSM
// slot 15097
    15097, 2884,
// P51-P53.agc:933
//			REFSMMAT
// slot 15098
    15098, 1974,
// P51-P53.agc:934
//		CALL
// slot 15099
    15099, 65320,
// P51-P53.agc:935
//			MATMOVE
// slot 15100
    15100, 26110,
// P51-P53.agc:936
//# Page 948
// P51-P53.agc:937
//		GOTO
// slot 15101
    15101, 65360,
// P51-P53.agc:938
//			COARSRET
// slot 15102
    15102, 26850,
// P51-P53.agc:939
//MATMOVE		VLOAD*			# TRANSFER MATRIX
// slot 15103
    15103, 65526,
// P51-P53.agc:940
//			0,1
// slot 15104
    15104, 2,
// P51-P53.agc:941
//		STORE	0,2
// slot 15105
    15105, 8194,
// P51-P53.agc:942
//		VLOAD*
// slot 15106
    15106, 65526,
// P51-P53.agc:943
//			6D,1
// slot 15107
    15107, 14,
// P51-P53.agc:944
//		STORE	6D,2
// slot 15108
    15108, 8206,
// P51-P53.agc:945
//		VLOAD*
// slot 15109
    15109, 65526,
// P51-P53.agc:946
//			12D,1
// slot 15110
    15110, 26,
// P51-P53.agc:947
//		STORE	12D,2
// slot 15111
    15111, 8218,
// P51-P53.agc:948
//		RVQ
// slot 15112
    15112, 65308,
// P51-P53.agc:949
//DEGREE1		DEC	46		# 1 DEG SCALED CDU/2
// slot 15113
    15113, 92,
// P51-P53.agc:950
//DEG359		DEC	16338		# 359 DEG SCALED CDU/2
// slot 15114
    15114, 32676
)).

// bank 14, slots 15115-15117
function agcAotUnit849 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15115 {
// P51-P53.agc:951
//RDCDUS		INHINT			# READ CDUS
// slot 15115
        if slot <> 15115 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15116 {
// P51-P53.agc:952
//		CA	CDUX
// slot 15116
            if slot <> 15116 or instruction <> 12314 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 26).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:953
//		INDEX	FIXLOC
// slot 15117
            if slot <> 15117 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[849] to agcAotUnit849@.

agcAotInstallSourceRope(list(
// P51-P53.agc:954
//		TS	1
// slot 15118
    15118, 45058
)).

// bank 14, slots 15119-15120
function agcAotUnit850 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15119 {
// P51-P53.agc:955
//		CA	CDUY
// slot 15119
        if slot <> 15119 or instruction <> 12315 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 27).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:956
//		INDEX	FIXLOC
// slot 15120
        if slot <> 15120 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[850] to agcAotUnit850@.

agcAotInstallSourceRope(list(
// P51-P53.agc:957
//		TS	2
// slot 15121
    15121, 45060
)).

// bank 14, slots 15122-15123
function agcAotUnit851 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15122 {
// P51-P53.agc:958
//		CA	CDUZ
// slot 15122
        if slot <> 15122 or instruction <> 12316 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 28).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:959
//		INDEX	FIXLOC
// slot 15123
        if slot <> 15123 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[851] to agcAotUnit851@.

agcAotInstallSourceRope(list(
// P51-P53.agc:960
//		TS	3
// slot 15124
    15124, 45062
)).

// bank 14, slots 15125-15127
function agcAotUnit852 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15125 {
// P51-P53.agc:961
//		RELINT
// slot 15125
        if slot <> 15125 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15126 {
// P51-P53.agc:962
//		TC	DANZIG
// slot 15126
            if slot <> 15126 or instruction <> 3121 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3121, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:963
//		COUNT*	$$/INFLT
// P51-P53.agc:964
//
// P51-P53.agc:965
//# Page 949
// P51-P53.agc:966
//# NAME -- P51 -- IMU ORIENTATION DETERMINATION
// P51-P53.agc:967
//# MOD. NO. 1	23 JAN 67				LOG SECTION -- P51-P53
// P51-P53.agc:968
//# MOD BY STURLAUGSON					ASSEMBLY SUNDANCE REV56
// P51-P53.agc:969
//#
// P51-P53.agc:970
//# FUNCTIONAL DESCRIPTION
// P51-P53.agc:971
//#	DETERMINES THE INERTIAL ORIENTATION OF THE IMU.  THE PROGRAM IS SELECTED BY DSKY ENTRY.  THE SIGHTING
// P51-P53.agc:972
//#	(AOTMARK) ROUTINE IS CALLED TO COLLECT AND PROCESS MARKED-STAR DATA.  AOTMARK (R53) RETURNS THE STAR NUMBER AND THE
// P51-P53.agc:973
//# 	STAR LOS VECTOR IN STARAD +6.  TWO STARS ARE THUS SIGHTED.  THE ANGLE BETWEEN THE TWO STARS IS THEN CHECKED AT
// P51-P53.agc:974
//#	CHKSDATA (R54).  REFSMMAT IS THEN COMPUTED AT AXISGEN.
// P51-P53.agc:975
//#
// P51-P53.agc:976
//# CALLING SEQUENCE
// P51-P53.agc:977
//#	THE PROGRAM IS CALLED BY THE ASTRONAUT BY DSKY ENTRY.
// P51-P53.agc:978
//#
// P51-P53.agc:979
//# SUBROUTINES CALLED
// P51-P53.agc:980
//#	GOPERF3
// P51-P53.agc:981
//#	GOPERF1
// P51-P53.agc:982
//#	GODSPR
// P51-P53.agc:983
//#	IMUCOARS
// P51-P53.agc:984
//#	IMUFIN20
// P51-P53.agc:985
//#	AOTMARK (R53)
// P51-P53.agc:986
//#	CHKSDATA (R54)
// P51-P53.agc:987
//#	MKRELEAS
// P51-P53.agc:988
//#	AXISGEN
// P51-P53.agc:989
//#	MATMOVE
// P51-P53.agc:990
//#
// P51-P53.agc:991
//# ALARMS
// P51-P53.agc:992
//#	NONE.
// P51-P53.agc:993
//#
// P51-P53.agc:994
//# ERASABLE INITIALIZATION
// P51-P53.agc:995
//#	IMU ZERO FLAG SHOULD BE SET.
// P51-P53.agc:996
//#
// P51-P53.agc:997
//# OUTPUT
// P51-P53.agc:998
//#	REFSMMAT
// P51-P53.agc:999
//#	REFSMFLG
// P51-P53.agc:1000
//#
// P51-P53.agc:1001
//# DEBRIS
// P51-P53.agc:1002
//#	WORK AREA
// P51-P53.agc:1003
//#	STARAD
// P51-P53.agc:1004
//#	STARIND
// P51-P53.agc:1005
//#	BESTI
// P51-P53.agc:1006
//#	BESTJ
// P51-P53.agc:1007
//
// P51-P53.agc:1008
//		COUNT*	$$/P51
// P51-P53.agc:1009
//# Page 950
// P51-P53.agc:1010
//P51		TC	BANKCALL	# IS ISS ON - IF NOT, IMUCHK WILL SEND
// slot 15127
            if slot <> 15127 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[852] to agcAotUnit852@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1011
//		CADR	IMUCHK		# ALARM CODE 210 AND EXIT VIA GOTOPOOH.
// slot 15128
    15128, 28500
)).

// bank 14, slots 15129-15130
function agcAotUnit853 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15129 {
// P51-P53.agc:1012
//
// P51-P53.agc:1013
//		CAF	OCT15
// slot 15129
        if slot <> 15129 or instruction <> 14833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2545), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1014
//		TC	BANKCALL
// slot 15130
        if slot <> 15130 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[853] to agcAotUnit853@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1015
//		CADR	GOPERF1
// slot 15131
    15131, 17190
)).

// bank 14, slots 15132-15134
function agcAotUnit854 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15132 {
// P51-P53.agc:1016
//		TC	GOTOPOOH	# TERM.
// slot 15132
        if slot <> 15132 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15133 {
// P51-P53.agc:1017
//		TCF	P51B		# V33
// slot 15133
            if slot <> 15133 or instruction <> 5937 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5937, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1018
//		TC	PHASCHNG
// slot 15134
            if slot <> 15134 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[854] to agcAotUnit854@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1019
//		OCT	04024
// slot 15135
    15135, 4136
)).

// bank 14, slots 15136-15141
function agcAotUnit855 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15138 {
        if slot <= 15136 {
// P51-P53.agc:1020
//
// P51-P53.agc:1021
//		CAF	ZERO
// slot 15136
            if slot <> 15136 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15137 {
// P51-P53.agc:1022
//		TS	THETAD		# ZERO THE GIMBALS
// slot 15137
                if slot <> 15137 or instruction <> 22737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1023
//		TS	THETAD +1
// slot 15138
                if slot <> 15138 or instruction <> 22738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22738, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15139 {
// P51-P53.agc:1024
//		TS	THETAD +2
// slot 15139
            if slot <> 15139 or instruction <> 22739 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22739, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15140 {
// P51-P53.agc:1025
//		CAF	V06N22
// slot 15140
                if slot <> 15140 or instruction <> 14856 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1026
//		TC	BANKCALL
// slot 15141
                if slot <> 15141 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[855] to agcAotUnit855@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1027
//		CADR	GODSPRET
// slot 15142
    15142, 16972
)).

// bank 14, slots 15143-15144
function agcAotUnit856 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15143 {
// P51-P53.agc:1028
//		CAF	V41K		# NOW DISPLAY COARSE ALIGN VERB 41
// slot 15143
        if slot <> 15143 or instruction <> 14196 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1908), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1029
//		TC	BANKCALL
// slot 15144
        if slot <> 15144 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[856] to agcAotUnit856@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1030
//		CADR	GODSPRET
// slot 15145
    15145, 16972
)).

// bank 14, slots 15146-15146
function agcAotUnit857 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1031
//		TC	INTPRET
// slot 15146
    if slot <> 15146 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[857] to agcAotUnit857@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1032
//		CALL
// slot 15147
    15147, 65320,
// P51-P53.agc:1033
//			COARSE
// slot 15148
    15148, 26346,
// P51-P53.agc:1034
//		EXIT
// slot 15149
    15149, 65532
)).

// bank 14, slots 15150-15150
function agcAotUnit858 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1035
//		TC	PHASCHNG
// slot 15150
    if slot <> 15150 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[858] to agcAotUnit858@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1036
//		OCT	04024
// slot 15151
    15151, 4136
)).

// bank 14, slots 15152-15153
function agcAotUnit859 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15152 {
// P51-P53.agc:1037
//		TCF	P51 +2
// slot 15152
        if slot <> 15152 or instruction <> 5913 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5913, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1038
//
// P51-P53.agc:1039
//P51B		TC	PHASCHNG
// slot 15153
        if slot <> 15153 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[859] to agcAotUnit859@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1040
//		OCT	00014
// slot 15154
    15154, 24
)).

// bank 14, slots 15155-15155
function agcAotUnit860 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1041
//		TC	INTPRET
// slot 15155
    if slot <> 15155 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[860] to agcAotUnit860@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1042
//		CALL
// slot 15156
    15156, 65320,
// P51-P53.agc:1043
//			NCOARSE
// slot 15157
    15157, 26372,
// P51-P53.agc:1044
//		SSP	SETPD
// slot 15158
    15158, 33202,
// P51-P53.agc:1045
//			STARIND		# INDEX -- STAR 1 OR 2
// slot 15159
    15159, 3040,
// P51-P53.agc:1046
//			0
// slot 15160
    15160, 0,
// P51-P53.agc:1047
//			0
// slot 15161
    15161, 2,
// P51-P53.agc:1048
//P51C		EXIT
// slot 15162
    15162, 65532
)).

// bank 14, slots 15163-15163
function agcAotUnit861 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1049
//		TC	PHASCHNG
// slot 15163
    if slot <> 15163 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[861] to agcAotUnit861@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1050
//		OCT	04024
// slot 15164
    15164, 4136
)).

// bank 14, slots 15165-15165
function agcAotUnit862 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1051
//
// P51-P53.agc:1052
//		TC	BANKCALL
// slot 15165
    if slot <> 15165 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[862] to agcAotUnit862@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1053
//		CADR	AOTMARK		# R53
// slot 15166
    15166, 14336
)).

// bank 14, slots 15167-15167
function agcAotUnit863 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1054
//		TC	BANKCALL
// slot 15167
    if slot <> 15167 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[863] to agcAotUnit863@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1055
//		CADR	AOTSTALL
// slot 15168
    15168, 16276
)).

// bank 14, slots 15169-15172
function agcAotUnit864 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15170 {
        if slot <= 15169 {
// P51-P53.agc:1056
//		TC	CURTAINS
// slot 15169
            if slot <> 15169 or instruction <> 3017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3017, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1057
//		CCS	STARIND
// slot 15170
            if slot <> 15170 or instruction <> 5103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 1007).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15171 {
// P51-P53.agc:1058
//		TCF	P51D +1
// slot 15171
            if slot <> 15171 or instruction <> 5961 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5961, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1059
//		TC	INTPRET
// slot 15172
            if slot <> 15172 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[864] to agcAotUnit864@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1060
//# Page 951
// P51-P53.agc:1061
//		VLOAD
// slot 15173
    15173, 65530,
// P51-P53.agc:1062
//			STARAD +6
// slot 15174
    15174, 2970,
// P51-P53.agc:1063
//		STORE	STARSAV1
// slot 15175
    15175, 3042,
// P51-P53.agc:1064
//P51D		EXIT
// slot 15176
    15176, 65532
)).

// bank 14, slots 15177-15177
function agcAotUnit865 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1065
//		TC	PHASCHNG
// slot 15177
    if slot <> 15177 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[865] to agcAotUnit865@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1066
//		OCT	04024
// slot 15178
    15178, 4136
)).

// bank 14, slots 15179-15181
function agcAotUnit866 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15179 {
// P51-P53.agc:1067
//
// P51-P53.agc:1068
//		CCS	STARIND
// slot 15179
        if slot <> 15179 or instruction <> 5103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 1007).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15180 {
// P51-P53.agc:1069
//		TCF	P51E
// slot 15180
            if slot <> 15180 or instruction <> 5976 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5976, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1070
//		TC	PHASCHNG
// slot 15181
            if slot <> 15181 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[866] to agcAotUnit866@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1071
//		OCT	04024
// slot 15182
    15182, 4136
)).

// bank 14, slots 15183-15183
function agcAotUnit867 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1072
//
// P51-P53.agc:1073
//		TC	INTPRET
// slot 15183
    if slot <> 15183 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[867] to agcAotUnit867@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1074
//		DLOAD	CALL
// slot 15184
    15184, 38090,
// P51-P53.agc:1075
//			TSIGHT
// slot 15185
    15185, 3812,
// P51-P53.agc:1076
//			PLANET
// slot 15186
    15186, 27252,
// P51-P53.agc:1077
//		STORE	PLANVEC
// slot 15187
    15187, 3800,
// P51-P53.agc:1078
//		EXIT
// slot 15188
    15188, 65532
)).

// bank 14, slots 15189-15192
function agcAotUnit868 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15190 {
        if slot <= 15189 {
// P51-P53.agc:1079
//		CAF	BIT1
// slot 15189
            if slot <> 15189 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1080
//		TS	STARIND
// slot 15190
            if slot <> 15190 or instruction <> 23535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15191 {
// P51-P53.agc:1081
//		TCF	P51C +1		# DO SECOND STAR
// slot 15191
            if slot <> 15191 or instruction <> 5947 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5947, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1082
//P51E		TC	PHASCHNG
// slot 15192
            if slot <> 15192 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[868] to agcAotUnit868@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1083
//		OCT	04024
// slot 15193
    15193, 4136
)).

// bank 14, slots 15194-15194
function agcAotUnit869 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1084
//
// P51-P53.agc:1085
//		TC	INTPRET
// slot 15194
    if slot <> 15194 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[869] to agcAotUnit869@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1086
//		DLOAD	CALL
// slot 15195
    15195, 38090,
// P51-P53.agc:1087
//			TSIGHT
// slot 15196
    15196, 3812,
// P51-P53.agc:1088
//			PLANET
// slot 15197
    15197, 27252,
// P51-P53.agc:1089
//		STOVL	12D
// slot 15198
    15198, 20506,
// P51-P53.agc:1090
//			PLANVEC
// slot 15199
    15199, 3800,
// P51-P53.agc:1091
//		STOVL	6D
// slot 15200
    15200, 20494,
// P51-P53.agc:1092
//			STARSAV1
// slot 15201
    15201, 3042,
// P51-P53.agc:1093
//		STOVL	STARAD
// slot 15202
    15202, 23438,
// P51-P53.agc:1094
//			STARSAV2
// slot 15203
    15203, 3054,
// P51-P53.agc:1095
//		STCALL	STARAD +6
// slot 15204
    15204, 31642,
// P51-P53.agc:1096
//			CHKSDATA	# CHECK STAR ANGLES IN STARAD AND
// slot 15205
    15205, 25948,
// P51-P53.agc:1097
//		BON	EXIT
// slot 15206
    15206, 65048,
// P51-P53.agc:1098
//			FREEFLAG
// slot 15207
    15207, 408,
// P51-P53.agc:1099
//			P51G
// slot 15208
    15208, 26324
)).

// bank 14, slots 15209-15209
function agcAotUnit870 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1100
//		TC	P51 +2
// slot 15209
    if slot <> 15209 or instruction <> 1817 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1817, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[870] to agcAotUnit870@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1101
//P51G		CALL
// slot 15210
    15210, 65320,
// P51-P53.agc:1102
//			AXISGEN		# COME BACK WITH REFSMMAT IN XDC
// slot 15211
    15211, 40514,
// P51-P53.agc:1103
//		AXC,1	AXC,2
// slot 15212
    15212, 62688,
// P51-P53.agc:1104
//			XDC
// slot 15213
    15213, 2920,
// P51-P53.agc:1105
//			REFSMMAT
// slot 15214
    15214, 1974,
// P51-P53.agc:1106
//		CALL
// slot 15215
    15215, 65320,
// P51-P53.agc:1107
//			MATMOVE
// slot 15216
    15216, 26110,
// P51-P53.agc:1108
//		SET	EXIT
// slot 15217
    15217, 65048,
// P51-P53.agc:1109
//			REFSMFLG
// slot 15218
    15218, 1636
)).

// bank 14, slots 15219-15219
function agcAotUnit871 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1110
//		TC	GOTOPOOH	# FINIS
// slot 15219
    if slot <> 15219 or instruction <> 3073 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3073, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[871] to agcAotUnit871@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1111
//# Page 952
// P51-P53.agc:1112
//V41K		VN	4100
// slot 15220
    15220, 10496,
// P51-P53.agc:1113
//COARSE		EXIT
// slot 15221
    15221, 65532
)).

// bank 14, slots 15222-15222
function agcAotUnit872 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1114
//		TC	BANKCALL
// slot 15222
    if slot <> 15222 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[872] to agcAotUnit872@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1115
//		CADR	IMUCOARS
// slot 15223
    15223, 15360
)).

// bank 14, slots 15224-15224
function agcAotUnit873 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1116
//		TC	BANKCALL
// slot 15224
    if slot <> 15224 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[873] to agcAotUnit873@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1117
//		CADR	IMUSTALL
// slot 15225
    15225, 16284
)).

// bank 14, slots 15226-15227
function agcAotUnit874 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15226 {
// P51-P53.agc:1118
//		TC	CURTAINS
// slot 15226
        if slot <> 15226 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1119
//		TC	BANKCALL
// slot 15227
        if slot <> 15227 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[874] to agcAotUnit874@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1120
//		CADR	IMUFINE
// slot 15228
    15228, 15632
)).

// bank 14, slots 15229-15229
function agcAotUnit875 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1121
//		TC	BANKCALL
// slot 15229
    if slot <> 15229 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[875] to agcAotUnit875@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1122
//		CADR	IMUSTALL
// slot 15230
    15230, 16284
)).

// bank 14, slots 15231-15232
function agcAotUnit876 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15231 {
// P51-P53.agc:1123
//		TC	CURTAINS
// slot 15231
        if slot <> 15231 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1124
//		TC	INTPRET
// slot 15232
        if slot <> 15232 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[876] to agcAotUnit876@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1125
//		RVQ
// slot 15233
    15233, 65308,
// P51-P53.agc:1126
//NCOARSE		EXIT
// slot 15234
    15234, 65532
)).

// bank 14, slots 15235-15241
function agcAotUnit877 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15237 {
        if slot <= 15235 {
// P51-P53.agc:1127
//		CA	TIME1
// slot 15235
            if slot <> 15235 or instruction <> 12309 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 21).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15236 {
// P51-P53.agc:1128
//		TS	1/PIPADT
// slot 15236
                if slot <> 15236 or instruction <> 23101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1129
//		CS	ZERO
// slot 15237
                if slot <> 15237 or instruction <> 18925 { return choose false if checkOnly else -1. }
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
        if slot <= 15239 {
            if slot <= 15238 {
// P51-P53.agc:1130
//		TS	PIPAX
// slot 15238
                if slot <> 15238 or instruction <> 22559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1131
//		TS	PIPAY
// slot 15239
                if slot <> 15239 or instruction <> 22560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15240 {
// P51-P53.agc:1132
//		TS	PIPAZ
// slot 15240
                if slot <> 15240 or instruction <> 22561 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22561, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1133
//		TC	INTPRET
// slot 15241
                if slot <> 15241 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[877] to agcAotUnit877@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1134
//		VLOAD
// slot 15242
    15242, 65530,
// P51-P53.agc:1135
//			ZEROVEC
// slot 15243
    15243, 20494,
// P51-P53.agc:1136
//		STORE	GCOMP
// slot 15244
    15244, 1652,
// P51-P53.agc:1137
//		SET	RVQ
// slot 15245
    15245, 36376,
// P51-P53.agc:1138
//			DRIFTFLG
// slot 15246
    15246, 1120,
// P51-P53.agc:1139
//
// P51-P53.agc:1140
//# Page 953
// P51-P53.agc:1141
//# NAME -- S52.2
// P51-P53.agc:1142
//# FUNCTION -- COMPUTE GIMBAL ANGLES FOR DESIRED SM AND PRESENT VEHICLE
// P51-P53.agc:1143
//# CALL -- CALL S52.2
// P51-P53.agc:1144
//# INPUT -- X,Y,ZSMD
// P51-P53.agc:1145
//# OUTPUT -- OGC,IGC,MGC,THETAD,+1,+2
// P51-P53.agc:1146
//# SUBROUTINES -- CDUTRIG, CALCSMSC, MATMOVE, CALCGA
// P51-P53.agc:1147
//
// P51-P53.agc:1148
//		COUNT*	$$/S52.1
// P51-P53.agc:1149
//S52.2		STQ	CALL
// slot 15247
    15247, 37920,
// P51-P53.agc:1150
//			QMAJ
// slot 15248
    15248, 3020,
// P51-P53.agc:1151
//			CDUTRIG
// slot 15249
    15249, 40638,
// P51-P53.agc:1152
//		CALL
// slot 15250
    15250, 65320,
// P51-P53.agc:1153
//			CALCSMSC
// slot 15251
    15251, 16432,
// P51-P53.agc:1154
//		AXT,1	SSP
// slot 15252
    15252, 55792,
// P51-P53.agc:1155
//			18D
// slot 15253
    15253, 36,
// P51-P53.agc:1156
//			S1
// slot 15254
    15254, 82,
// P51-P53.agc:1157
//			6D
// slot 15255
    15255, 12,
// P51-P53.agc:1158
//S52.2A		VLOAD*	VXM
// slot 15256
    15256, 50678,
// P51-P53.agc:1159
//			XNB +18D,1
// slot 15257
    15257, 2958,
// P51-P53.agc:1160
//			REFSMMAT
// slot 15258
    15258, 1976,
// P51-P53.agc:1161
//		UNIT
// slot 15259
    15259, 65372,
// P51-P53.agc:1162
//		STORE	XNB +18D,1
// slot 15260
    15260, 7054,
// P51-P53.agc:1163
//		TIX,1
// slot 15261
    15261, 65408,
// P51-P53.agc:1164
//			S52.2A
// slot 15262
    15262, 26416,
// P51-P53.agc:1165
//S52.2.1		AXC,1	AXC,2
// slot 15263
    15263, 62688,
// P51-P53.agc:1166
//			XSMD
// slot 15264
    15264, 3852,
// P51-P53.agc:1167
//			XSM
// slot 15265
    15265, 2884,
// P51-P53.agc:1168
//		CALL
// slot 15266
    15266, 65320,
// P51-P53.agc:1169
//			MATMOVE
// slot 15267
    15267, 26110,
// P51-P53.agc:1170
//		CALL
// slot 15268
    15268, 65320,
// P51-P53.agc:1171
//			CALCGA
// slot 15269
    15269, 40406,
// P51-P53.agc:1172
//		GOTO
// slot 15270
    15270, 65360,
// P51-P53.agc:1173
//			QMAJ
// slot 15271
    15271, 3020,
// P51-P53.agc:1174
//
// P51-P53.agc:1175
//# Page 954
// P51-P53.agc:1176
//# NAME -- S52.3
// P51-P53.agc:1177
//# FUNCTION --	XSMD= UNIT R
// P51-P53.agc:1178
//#		YSMD= UNIT(V X R)
// P51-P53.agc:1179
//#		ZSMD= UNIT(XSMD X YSMD)
// P51-P53.agc:1180
//# CALL --	DLOAD	CALL
// P51-P53.agc:1181
//#			TALIGN
// P51-P53.agc:1182
//#			S52.3
// P51-P53.agc:1183
//# INPUT --	TIME OF ALIGNMENT IN MPAC
// P51-P53.agc:1184
//# OUTPUT --	X,Y,ZSMD
// P51-P53.agc:1185
//# SUBROUTINES -- CSMCONIC
// P51-P53.agc:1186
//
// P51-P53.agc:1187
//		COUNT*	$$/S52.3
// P51-P53.agc:1188
//S52.3		STQ
// slot 15272
    15272, 65312,
// P51-P53.agc:1189
//			QMAJ
// slot 15273
    15273, 3020,
// P51-P53.agc:1190
//		STCALL	TDEC1
// slot 15274
    15274, 28738,
// P51-P53.agc:1191
//			LEMCONIC
// slot 15275
    15275, 23680,
// P51-P53.agc:1192
//		VLOAD	UNIT
// slot 15276
    15276, 44794,
// P51-P53.agc:1193
//			RATT
// slot 15277
    15277, 2,
// P51-P53.agc:1194
//		STOVL	XSMD
// slot 15278
    15278, 24334,
// P51-P53.agc:1195
//			VATT
// slot 15279
    15279, 14,
// P51-P53.agc:1196
//		VXV	UNIT
// slot 15280
    15280, 44602,
// P51-P53.agc:1197
//			RATT
// slot 15281
    15281, 2,
// P51-P53.agc:1198
//		STOVL	YSMD
// slot 15282
    15282, 24346,
// P51-P53.agc:1199
//			XSMD
// slot 15283
    15283, 3854,
// P51-P53.agc:1200
//		VXV	UNIT
// slot 15284
    15284, 44602,
// P51-P53.agc:1201
//			YSMD
// slot 15285
    15285, 3866,
// P51-P53.agc:1202
//		STCALL	ZSMD
// slot 15286
    15286, 32550,
// P51-P53.agc:1203
//			QMAJ
// slot 15287
    15287, 3020,
// P51-P53.agc:1204
//
// P51-P53.agc:1205
//# Page 955
// P51-P53.agc:1206
//# NAME -- R52 (AUTOMATIC OPTICS POSITIONING ROUTINE)
// P51-P53.agc:1207
//#
// P51-P53.agc:1208
//# FUNCTION -- POINT THE AOT APTICS AXIS BY MANEUVERING THE LEM TO A NAVIGATION
// P51-P53.agc:1209
//# STAR SELECTED BY ALIGNMENT PROGRAMS OR DSKY INPUT
// P51-P53.agc:1210
//#
// P51-P53.agc:1211
//# CALLING -- CALL R52
// P51-P53.agc:1212
//#
// P51-P53.agc:1213
//# INPUT -- BESTI AND BESTJ (STAR CODES TIMES 6)
// P51-P53.agc:1214
//#
// P51-P53.agc:1215
//# OUTPUT -- STAR CODE IN BITS 1-6, DETENT CODE IN BITS 7-9
// P51-P53.agc:1216
//# (NO CHECK IS MADE TO INSURE THE DETENT CODE TO BE VALID)
// P51-P53.agc:1217
//# POINTVSM-1/2 UNIT NAV STAR VEC IN SM
// P51-P53.agc:1218
//# SCAXIS-AOT OPTIC AXIS VEC IN NB X-Z PLANE
// P51-P53.agc:1219
//#
// P51-P53.agc:1220
//# SUBROUT -- R60LEM
// P51-P53.agc:1221
//
// P51-P53.agc:1222
//		COUNT*	$$/R52
// P51-P53.agc:1223
//R52		STQ	EXIT
// slot 15288
    15288, 65056,
// P51-P53.agc:1224
//			SAVQR52
// slot 15289
    15289, 3946
)).

// bank 14, slots 15290-15290
function agcAotUnit878 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1225
//		INDEX	STARIND
// slot 15290
    if slot <> 15290 or instruction <> 21487 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21487, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21487, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[878] to agcAotUnit878@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1226
//		CA	BESTI		# PICK UP STARCODE DETERMINED BY R56
// slot 15291
    15291, 26586
)).

// bank 14, slots 15292-15297
function agcAotUnit879 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15294 {
        if slot <= 15292 {
// P51-P53.agc:1227
//		EXTEND
// slot 15292
            if slot <> 15292 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15293 {
// P51-P53.agc:1228
//		MP	1/6TH
// slot 15293
                if slot <> 15293 or instruction <> 30713 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2041, readEffective:call(words, 2041)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1229
//		AD	BIT8		# SET DETENT POSITION 2
// slot 15294
                if slot <> 15294 or instruction <> 27108 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15295 {
// P51-P53.agc:1230
//		TS	STARCODE	# SCALE AND STORE IN STARCODE
// slot 15295
            if slot <> 15295 or instruction <> 23005 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23005, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15296 {
// P51-P53.agc:1231
//
// P51-P53.agc:1232
//R52A		CAF	V01N70
// slot 15296
                if slot <> 15296 or instruction <> 14330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2042), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1233
//		TC	BANKCALL
// slot 15297
                if slot <> 15297 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[879] to agcAotUnit879@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1234
//		CADR	GOFLASH		# DISPLAY STARCODE AND WAIT FOR RESPONSE
// slot 15298
    15298, 17020
)).

// bank 14, slots 15299-15302
function agcAotUnit880 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15300 {
        if slot <= 15299 {
// P51-P53.agc:1235
//		TC	GOTOPOOH	# V34 -- TERMINATE
// slot 15299
            if slot <> 15299 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1236
//		TCF	R52B		# V33 -- PROCEED TO ORIENT LEM
// slot 15300
            if slot <> 15300 or instruction <> 6086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15301 {
// P51-P53.agc:1237
//		TCF	R52A		# ENTER -- SELECT NEW STARCODE -- RECYCLE
// slot 15301
            if slot <> 15301 or instruction <> 6080 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6080, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1238
//
// P51-P53.agc:1239
//R52B		TC	DOWNFLAG
// slot 15302
            if slot <> 15302 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[880] to agcAotUnit880@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1240
//		ADRES	3AXISFLG	# BIT6 OF FLAGWRD5 ZERO TO ALLOW VECPOINT
// slot 15303
    15303, 168
)).

// bank 14, slots 15304-15316
function agcAotUnit881 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15309 {
        if slot <= 15306 {
            if slot <= 15304 {
// P51-P53.agc:1241
//		CA	STARCODE	# GRAB DETENT CODE
// slot 15304
                if slot <> 15304 or instruction <> 12765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 477).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15305 {
// P51-P53.agc:1242
//		MASK	HIGH9
// slot 15305
                    if slot <> 15305 or instruction <> 32740 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                        if fixedOperand = 32704 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 512) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1243
//		EXTEND
// slot 15306
                    if slot <> 15306 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15307 {
// P51-P53.agc:1244
//		MP	BIT9
// slot 15307
                if slot <> 15307 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2531, readEffective:call(words, 2531)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15308 {
// P51-P53.agc:1245
//		TS	L		# TEMP STORE DETENT
// slot 15308
                    if slot <> 15308 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1246
//
// P51-P53.agc:1247
//		EXTEND
// slot 15309
                    if slot <> 15309 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15312 {
            if slot <= 15310 {
// P51-P53.agc:1248
//		BZMF	GETAZEL		# CODE 0, COAS CALIBRATION
// slot 15310
                if slot <> 15310 or instruction <> 26588 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15311 {
// P51-P53.agc:1249
//
// P51-P53.agc:1250
//		AD	NEG7
// slot 15311
                    if slot <> 15311 or instruction <> 27568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2992), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1251
//		EXTEND
// slot 15312
                    if slot <> 15312 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15314 {
                if slot <= 15313 {
// P51-P53.agc:1252
//		BZF	GETAZEL		# CODE 7, COAS SIGHTING
// slot 15313
                    if slot <> 15313 or instruction <> 6108 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6108, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1253
//
// P51-P53.agc:1254
//		EBANK=	XYMARK
// P51-P53.agc:1255
//		CA	EBANK7
// slot 15314
                    if slot <> 15314 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15315 {
// P51-P53.agc:1256
//		TS	EBANK
// slot 15315
                    if slot <> 15315 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1257
//# Page 956
// P51-P53.agc:1258
//		INDEX	L
// slot 15316
                    if slot <> 15316 or instruction <> 20481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[881] to agcAotUnit881@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1259
//		CA	AOTAZ -1	# PICK UP AZ CORRESPONDING TO DETENT
// slot 15317
    15317, 26118
)).

// bank 14, slots 15318-15325
function agcAotUnit882 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15321 {
        if slot <= 15319 {
            if slot <= 15318 {
// P51-P53.agc:1260
//		TS	L
// slot 15318
                if slot <> 15318 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1261
//		EBANK=	XSM
// P51-P53.agc:1262
//		CA	EBANK5		# CHANGE TO EBANK5 BUT DON'T DISTURB L
// slot 15319
                if slot <> 15319 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15320 {
// P51-P53.agc:1263
//		TS	EBANK
// slot 15320
                if slot <> 15320 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1264
//		CA	BIT13		# SET ELV TO 45 DEG
// slot 15321
                if slot <> 15321 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15323 {
            if slot <= 15322 {
// P51-P53.agc:1265
//		XCH	L		# SET C(A)=AZ, C(L)=45 DEG
// slot 15322
                if slot <> 15322 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1266
//		TCF	AZEL		# GO COMP OPTIC AXIS
// slot 15323
                if slot <> 15323 or instruction <> 6116 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6116, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15324 {
// P51-P53.agc:1267
//
// P51-P53.agc:1268
//GETAZEL		CAF	V06N87		# CODE 0 OR 7, GET AZ AND EL KEY IN
// slot 15324
                if slot <> 15324 or instruction <> 14331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2043), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1269
//		TC	BANKCALL
// slot 15325
                if slot <> 15325 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[882] to agcAotUnit882@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1270
//		CADR	GOFLASH
// slot 15326
    15326, 17020
)).

// bank 14, slots 15327-15332
function agcAotUnit883 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15329 {
        if slot <= 15327 {
// P51-P53.agc:1271
//		TC	GOTOPOOH	# V34 -- TERMINATE
// slot 15327
            if slot <> 15327 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15328 {
// P51-P53.agc:1272
//		TCF	+2		# PROCEED -- CALC OPTIC AXIS
// slot 15328
                if slot <> 15328 or instruction <> 6114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6114, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1273
//		TCF	GETAZEL		# ENTER -- RECYCLE
// slot 15329
                if slot <> 15329 or instruction <> 6108 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6108, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15330 {
// P51-P53.agc:1274
//
// P51-P53.agc:1275
//		EXTEND
// slot 15330
            if slot <> 15330 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15331 {
// P51-P53.agc:1276
//		DCA	AZ		# PICK UP AZ AND EL IN SP 2'S COMP
// slot 15331
                if slot <> 15331 or instruction <> 13032 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 744, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1277
//AZEL		INDEX	FIXLOC		# JAM AZ AND EL IN 8 AND 9 OF VAC
// slot 15332
                if slot <> 15332 or instruction <> 20560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[883] to agcAotUnit883@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1278
//		DXCH	8D
// slot 15333
    15333, 43026
)).

// bank 14, slots 15334-15334
function agcAotUnit884 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1279
//		TC	INTPRET
// slot 15334
    if slot <> 15334 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[884] to agcAotUnit884@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1280
//		CALL			# GO COMPUTE OPTIC AXIS AND STORE IN
// slot 15335
    15335, 65320,
// P51-P53.agc:1281
//			OANB		# SCAXIS IN NB COORDS
// slot 15336
    15336, 8892,
// P51-P53.agc:1282
//		RTB	CALL
// slot 15337
    15337, 37944,
// P51-P53.agc:1283
//			LOADTIME
// slot 15338
    15338, 18166,
// P51-P53.agc:1284
//			PLANET
// slot 15339
    15339, 27252,
// P51-P53.agc:1285
//		MXV	UNIT
// slot 15340
    15340, 44706,
// P51-P53.agc:1286
//			REFSMMAT
// slot 15341
    15341, 1976,
// P51-P53.agc:1287
//		STORE	POINTVSM	# STORE FOR VECPOINT
// slot 15342
    15342, 4086,
// P51-P53.agc:1288
//
// P51-P53.agc:1289
//		EXIT
// slot 15343
    15343, 65532
)).

// bank 14, slots 15344-15344
function agcAotUnit885 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1290
//		TC	BANKCALL
// slot 15344
    if slot <> 15344 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[885] to agcAotUnit885@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1291
//		CADR	R60LEM		# GO TORQUE LEM OPTIC AXIS TO STAR LOS
// slot 15345
    15345, 45222
)).

// bank 14, slots 15346-15350
function agcAotUnit886 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15347 {
        if slot <= 15346 {
// P51-P53.agc:1292
//
// P51-P53.agc:1293
//		CAF	HIGH9		# IF COAS CALIBRATION CODE 0.  RECYCLE
// slot 15346
            if slot <> 15346 or instruction <> 16356 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1294
//		MASK	STARCODE
// slot 15347
            if slot <> 15347 or instruction <> 29149 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 477).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15348 {
// P51-P53.agc:1295
//		EXTEND
// slot 15348
            if slot <> 15348 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15349 {
// P51-P53.agc:1296
//		BZF	R52A
// slot 15349
                if slot <> 15349 or instruction <> 6080 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6080, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1297
//
// P51-P53.agc:1298
//		TC	INTPRET		# RETURN FROM KALCMANU
// slot 15350
                if slot <> 15350 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[886] to agcAotUnit886@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1299
//		GOTO
// slot 15351
    15351, 65360,
// P51-P53.agc:1300
//			SAVQR52		# RETURN TO CALLER
// slot 15352
    15352, 3946,
// P51-P53.agc:1301
//
// P51-P53.agc:1302
//1/6TH		DEC	.1666667
// slot 15353
    15353, 5462,
// P51-P53.agc:1303
//V01N70		VN	0170
// slot 15354
    15354, 396,
// P51-P53.agc:1304
//V06N87		VN	687
// slot 15355
    15355, 1710
)).

// bank 15, slots 15525-15530
function agcAotUnit901 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15527 {
        if slot <= 15525 {
// P51-P53.agc:1305
//
// P51-P53.agc:1306
//# Page 957
// P51-P53.agc:1307
//# LUNAR SURFACE STAR ACQUISITION
// P51-P53.agc:1308
//
// P51-P53.agc:1309
//		BANK	15
// P51-P53.agc:1310
//		SETLOC	P50S
// P51-P53.agc:1311
//		BANK
// P51-P53.agc:1312
//		COUNT*	$$/R59
// P51-P53.agc:1313
//
// P51-P53.agc:1314
//R59 		CS	FLAGWRD3
// slot 15525
            if slot <> 15525 or instruction <> 16447 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 63).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15526 {
// P51-P53.agc:1315
//		MASK	REFSMBIT	# IF REFSMMAT FLAG CLEAR BYPASS STAR ACQUIRE
// slot 15526
                if slot <> 15526 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
            } else {
// P51-P53.agc:1316
//		CCS	A
// slot 15527
                if slot <> 15527 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 15528 {
// P51-P53.agc:1317
//		TCF	R59OUT		# NO REFSMMAT GO TO AOTMARK
// slot 15528
            if slot <> 15528 or instruction <> 5421 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5421, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15529 {
// P51-P53.agc:1318
//
// P51-P53.agc:1319
//		CAF	V01N70*		# SELECT STAR CODE FOR ACQUISITION
// slot 15529
                if slot <> 15529 or instruction <> 13619 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1331), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1320
//		TC	BANKCALL
// slot 15530
                if slot <> 15530 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[901] to agcAotUnit901@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1321
//		CADR	GOFLASH
// slot 15531
    15531, 17020
)).

// bank 15, slots 15532-15540
function agcAotUnit902 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15535 {
        if slot <= 15533 {
            if slot <= 15532 {
// P51-P53.agc:1322
//		TC	GOTOPOOH	# V34 -- TERMINATE
// slot 15532
                if slot <> 15532 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1323
//		TCF	R59A		# V33 -- PROCEED
// slot 15533
                if slot <> 15533 or instruction <> 5295 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5295, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15534 {
// P51-P53.agc:1324
//		TCF	R59		# V32 -- RECYCLE
// slot 15534
                if slot <> 15534 or instruction <> 5285 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5285, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1325
//
// P51-P53.agc:1326
//R59A		CS	HIGH9		# GRAB STARCODE FOR INDEX
// slot 15535
                if slot <> 15535 or instruction <> 20452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15537 {
            if slot <= 15536 {
// P51-P53.agc:1327
//		MASK	AOTCODE
// slot 15536
                if slot <> 15536 or instruction <> 29149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 477).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1328
//		EXTEND
// slot 15537
                if slot <> 15537 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15538 {
// P51-P53.agc:1329
//		MP	REVCNT		# JUST 6
// slot 15538
                if slot <> 15538 or instruction <> 31906 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 3234, readEffective:call(words, 3234)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15539 {
// P51-P53.agc:1330
//		XCH	L
// slot 15539
                    if slot <> 15539 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1331
//		INDEX	STARIND
// slot 15540
                    if slot <> 15540 or instruction <> 21487 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21487, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21487, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[902] to agcAotUnit902@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1332
//		TS	BESTI
// slot 15541
    15541, 47066
)).

// bank 15, slots 15542-15542
function agcAotUnit903 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1333
//		INDEX	FIXLOC
// slot 15542
    if slot <> 15542 or instruction <> 20560 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[903] to agcAotUnit903@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1334
//		TS	X1		# CODE X 6 FOR CATLOG STAR INDEX
// slot 15543
    15543, 45132
)).

// bank 15, slots 15544-15550
function agcAotUnit904 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15546 {
        if slot <= 15544 {
// P51-P53.agc:1335
//		EXTEND
// slot 15544
            if slot <> 15544 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15545 {
// P51-P53.agc:1336
//		BZF	R59OUT		# BYPASS ACQUISITION IF NOT CATLOG STAR
// slot 15545
                if slot <> 15545 or instruction <> 5421 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5421, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1337
//		COM
// slot 15546
                if slot <> 15546 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15548 {
            if slot <= 15547 {
// P51-P53.agc:1338
//		AD	DEC227
// slot 15547
                if slot <> 15547 or instruction <> 25969 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1393), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1339
//		EXTEND
// slot 15548
                if slot <> 15548 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15549 {
// P51-P53.agc:1340
//		BZMF	R59OUT
// slot 15549
                if slot <> 15549 or instruction <> 25901 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25901, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1341
//
// P51-P53.agc:1342
//		TC	INTPRET
// slot 15550
                if slot <> 15550 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[904] to agcAotUnit904@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1343
//		VLOAD*	MXV
// slot 15551
    15551, 53750,
// P51-P53.agc:1344
//			CATLOG,1	# GRAB STAR VECTOR
// slot 15552
    15552, 25038,
// P51-P53.agc:1345
//			REFSMMAT	# TRANSFORM TO SM
// slot 15553
    15553, 1976,
// P51-P53.agc:1346
//		UNIT	CALL
// slot 15554
    15554, 37980,
// P51-P53.agc:1347
//			CDU*SMNB
// slot 15555
    15555, 40780,
// P51-P53.agc:1348
//		STORE	STAR		# TEMP STORE STAR VEC(NB)
// slot 15556
    15556, 2994,
// P51-P53.agc:1349
//		EXIT
// slot 15557
    15557, 65532
)).

// bank 15, slots 15558-15562
function agcAotUnit905 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15559 {
        if slot <= 15558 {
// P51-P53.agc:1350
//
// P51-P53.agc:1351
//		CAF	BIT1		# INITIALIZE AZ POSITION COD TO 1 (-60)
// slot 15558
            if slot <> 15558 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1352
//		TS	POSCODE
// slot 15559
            if slot <> 15559 or instruction <> 23202 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23202, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15560 {
// P51-P53.agc:1353
//
// P51-P53.agc:1354
//		EBANK=	XYMARK
// P51-P53.agc:1355
//INCAZ		CA	EBANK7
// slot 15560
            if slot <> 15560 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15561 {
// P51-P53.agc:1356
//		TS	EBANK
// slot 15561
                if slot <> 15561 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1357
//
// P51-P53.agc:1358
//# Page 958
// P51-P53.agc:1359
//		INDEX	POSCODE
// slot 15562
                if slot <> 15562 or instruction <> 21154 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21154, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21154, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[905] to agcAotUnit905@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1360
//		CA	AOTAZ -1	# PICK UP AZ CORRESPONDING TO POSCODE
// slot 15563
    15563, 26118
)).

// bank 15, slots 15564-15570
function agcAotUnit906 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15566 {
        if slot <= 15564 {
// P51-P53.agc:1361
//		TS	L
// slot 15564
            if slot <> 15564 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15565 {
// P51-P53.agc:1362
//
// P51-P53.agc:1363
//		EBANK=	XSM
// P51-P53.agc:1364
//		CA	EBANK5
// slot 15565
                if slot <> 15565 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1365
//		TS	EBANK
// slot 15566
                if slot <> 15566 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15568 {
            if slot <= 15567 {
// P51-P53.agc:1366
//
// P51-P53.agc:1367
//		CA	BIT13		# SET ELV TO 45 DEG
// slot 15567
                if slot <> 15567 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1368
//		XCH	L		# SET C(A)=AZ, C(L)=45 DEG
// slot 15568
                if slot <> 15568 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15569 {
// P51-P53.agc:1369
//		TS	QMIN		# STORE QMIN=AZ FOR LATER
// slot 15569
                if slot <> 15569 or instruction <> 23525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23525, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1370
//		INDEX	FIXLOC
// slot 15570
                if slot <> 15570 or instruction <> 20560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[906] to agcAotUnit906@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1371
//		DXCH	8D		# JAM AZ IN 8D, 45 DEG IN 9D FOR OANB
// slot 15571
    15571, 43026
)).

// bank 15, slots 15572-15572
function agcAotUnit907 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1372
//
// P51-P53.agc:1373
//		TC	INTPRET
// slot 15572
    if slot <> 15572 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[907] to agcAotUnit907@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1374
//		CALL
// slot 15573
    15573, 65320,
// P51-P53.agc:1375
//			OANB		# GO CALC OPTIC AXIS WRT NB
// slot 15574
    15574, 8892,
// P51-P53.agc:1376
//		VLOAD	DOT
// slot 15575
    15575, 41466,
// P51-P53.agc:1377
//			STAR		# DOT STAR WITH OA
// slot 15576
    15576, 2994,
// P51-P53.agc:1378
//			SCAXIS
// slot 15577
    15577, 4074,
// P51-P53.agc:1379
//		SL1	ARCCOS
// slot 15578
    15578, 54996,
// P51-P53.agc:1380
//		STORE	24D		# TEMP STORE ARCCOS(STAR.OPTAXIS)
// slot 15579
    15579, 50,
// P51-P53.agc:1381
//
// P51-P53.agc:1382
//		DSU	BPL
// slot 15580
    15580, 42026,
// P51-P53.agc:1383
//			DEG30		# SEE IF STAR IN AOT FIELD-OF-VIEW
// slot 15581
    15581, 27244,
// P51-P53.agc:1384
//			NXAX		# NOT IN FIELD -- TRY NEXT POSITION
// slot 15582
    15582, 27168,
// P51-P53.agc:1385
//		DLOAD	DSU		# SEE IF STAR AT FIELD CENTER
// slot 15583
    15583, 38346,
// P51-P53.agc:1386
//			24D
// slot 15584
    15584, 50,
// P51-P53.agc:1387
//			DEG.5
// slot 15585
    15585, 27248,
// P51-P53.agc:1388
//		BMN	DLOAD		# CALC SPIRAL AND CURSOR
// slot 15586
    15586, 58688,
// P51-P53.agc:1389
//			ZSPCR		# GO ZERO CURSOR AND SPIRAL
// slot 15587
    15587, 27158,
// P51-P53.agc:1390
//			24D		# GET SPIRAL
// slot 15588
    15588, 50,
// P51-P53.agc:1391
//		DMP	SL4
// slot 15589
    15589, 35338,
// P51-P53.agc:1392
//			3/4		# 12 SCALED AT 16
// slot 15590
    15590, 22504,
// P51-P53.agc:1393
//		STOVL	24D		# 12(ARCCOS(AO.STAR)) SCALED IN REVS
// slot 15591
    15591, 20530,
// P51-P53.agc:1394
//
// P51-P53.agc:1395
//			SCAXIS		# OA
// slot 15592
    15592, 4074,
// P51-P53.agc:1396
//		VXV	UNIT
// slot 15593
    15593, 44602,
// P51-P53.agc:1397
//			XUNIT
// slot 15594
    15594, 20490,
// P51-P53.agc:1398
//		PUSH	VXV		# OA X UNITX 	PD 0-5
// slot 15595
    15595, 40204,
// P51-P53.agc:1399
//			SCAXIS
// slot 15596
    15596, 4074,
// P51-P53.agc:1400
//		VCOMP
// slot 15597
    15597, 65404,
// P51-P53.agc:1401
//		UNIT	PDVL		# UNIT(OA X (OA X UNITX))	PD 6-11
// slot 15598
    15598, 52572,
// P51-P53.agc:1402
//			SCAXIS
// slot 15599
    15599, 4074,
// P51-P53.agc:1403
//		VXV	UNIT
// slot 15600
    15600, 44602,
// P51-P53.agc:1404
//			STAR
// slot 15601
    15601, 2994,
// P51-P53.agc:1405
//		PUSH	DOT		# 1/2(OA X STAR)	PD 12-17
// slot 15602
    15602, 41228,
// P51-P53.agc:1406
//			0		# DOT WITH 1/2(OA X UNITX) FOR YROT
// slot 15603
    15603, 2,
// P51-P53.agc:1407
//		SL1	ARCCOS
// slot 15604
    15604, 54996,
// P51-P53.agc:1408
//		STOVL	26D		# STORE THET SCALED IN REVS
// slot 15605
    15605, 20534,
// P51-P53.agc:1409
//# Page 959
// P51-P53.agc:1410
//		DOT			# UP 12-17, UP 6-11 FOR C2
// slot 15606
    15606, 65346,
// P51-P53.agc:1411
//		BPL	DLOAD		# IF THET NEG -- GET 360-THET
// slot 15607
    15607, 58696,
// P51-P53.agc:1412
//			R59D
// slot 15608
    15608, 27130,
// P51-P53.agc:1413
//			ABOUTONE
// slot 15609
    15609, 26702,
// P51-P53.agc:1414
//		DSU
// slot 15610
    15610, 65322,
// P51-P53.agc:1415
//			26D
// slot 15611
    15611, 54,
// P51-P53.agc:1416
//		STORE	26D		# 360-THET SCALED IN REVS
// slot 15612
    15612, 54,
// P51-P53.agc:1417
//
// P51-P53.agc:1418
//R59D		SLOAD	SR1
// slot 15613
    15613, 58042,
// P51-P53.agc:1419
//			QMIN		# RESCALE AZ(N) TO REVS
// slot 15614
    15614, 3020,
// P51-P53.agc:1420
//		DAD	PUSH		# PUSH YROT + AZ(N) REVS
// slot 15615
    15615, 34330,
// P51-P53.agc:1421
//			26D
// slot 15616
    15616, 54,
// P51-P53.agc:1422
//		RTB
// slot 15617
    15617, 65336,
// P51-P53.agc:1423
//			1STO2S
// slot 15618
    15618, 18200,
// P51-P53.agc:1424
//		STODL	CURSOR		# YROT IN 1/2 REVS
// slot 15619
    15619, 13630,
// P51-P53.agc:1425
//			24D		# LOAD SROT IN REVS
// slot 15620
    15620, 50,
// P51-P53.agc:1426
//		DAD			# 12(SEP) + YROT
// slot 15621
    15621, 65306,
// P51-P53.agc:1427
//		RTB
// slot 15622
    15622, 65336,
// P51-P53.agc:1428
//			1STO2S
// slot 15623
    15623, 18200,
// P51-P53.agc:1429
//		STORE	SPIRAL		# SROT IN 1/2 REVS
// slot 15624
    15624, 1346,
// P51-P53.agc:1430
//		EXIT
// slot 15625
    15625, 65532
)).

// bank 15, slots 15626-15626
function agcAotUnit908 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1431
//		TCF	79DISP		# GO DISPLAY CURSOR-SPIRAL-POS CODE
// slot 15626
    if slot <> 15626 or instruction <> 5407 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5407, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[908] to agcAotUnit908@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1432
//
// P51-P53.agc:1433
//ZSPCR		EXIT
// slot 15627
    15627, 65532
)).

// bank 15, slots 15628-15631
function agcAotUnit909 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15629 {
        if slot <= 15628 {
// P51-P53.agc:1434
//		CAF	ZERO		# STAR ALMOST OPTIC AXIS, ZERO CURSOR
// slot 15628
            if slot <> 15628 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1435
//		TS	CURSOR		# AND SPIRAL ANGLES
// slot 15629
            if slot <> 15629 or instruction <> 23198 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23198, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15630 {
// P51-P53.agc:1436
//		TS	SPIRAL
// slot 15630
            if slot <> 15630 or instruction <> 23200 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23200, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1437
//		TCF	79DISP
// slot 15631
            if slot <> 15631 or instruction <> 5407 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5407, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[909] to agcAotUnit909@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1438
//
// P51-P53.agc:1439
//NXAX		EXIT
// slot 15632
    15632, 65532
)).

// bank 15, slots 15633-15639
function agcAotUnit910 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15635 {
        if slot <= 15633 {
// P51-P53.agc:1440
//		INCR	POSCODE
// slot 15633
            if slot <> 15633 or instruction <> 10914 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 674).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15634 {
// P51-P53.agc:1441
//		CS	POSCODE
// slot 15634
                if slot <> 15634 or instruction <> 17058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 674).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1442
//		AD	SEVEN
// slot 15635
                if slot <> 15635 or instruction <> 27119 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15637 {
            if slot <= 15636 {
// P51-P53.agc:1443
//		EXTEND
// slot 15636
                if slot <> 15636 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1444
//		BZMF	R59ALM		# THIS STAR NOT AT ANY POSITION
// slot 15637
                if slot <> 15637 or instruction <> 25879 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25879, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15638 {
// P51-P53.agc:1445
//		TCF	INCAZ
// slot 15638
                if slot <> 15638 or instruction <> 5320 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5320, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1446
//
// P51-P53.agc:1447
//R59ALM		TC	ALARM		# THIS STAR CAN'T BE LOCATED IN AOT FIELD
// slot 15639
                if slot <> 15639 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[910] to agcAotUnit910@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1448
//		OCT	404
// slot 15640
    15640, 520
)).

// bank 15, slots 15641-15642
function agcAotUnit911 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15641 {
// P51-P53.agc:1449
//		CAF	VB05N09		# DISPLAY ALARM
// slot 15641
        if slot <> 15641 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1450
//		TC	BANKCALL
// slot 15642
        if slot <> 15642 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[911] to agcAotUnit911@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1451
//		CADR	GOFLASH
// slot 15643
    15643, 17020
)).

// bank 15, slots 15644-15648
function agcAotUnit912 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15645 {
        if slot <= 15644 {
// P51-P53.agc:1452
//		TCF	GOTOPOOH	# VB34 -- TERMINATE
// slot 15644
            if slot <> 15644 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1453
//		TCF	R59OUT		# VB33 -- PROCEED, GO WITHOUT ACQUIRE
// slot 15645
            if slot <> 15645 or instruction <> 5421 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5421, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15646 {
// P51-P53.agc:1454
//		TCF	R59		# VB32 -- RECYCLE AND TRY ANOTHER STAR
// slot 15646
            if slot <> 15646 or instruction <> 5285 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5285, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15647 {
// P51-P53.agc:1455
//
// P51-P53.agc:1456
//79DISP		CAF	V06N79		# DISPLAY CURSOR, SPIRAL AND POS CODE
// slot 15647
                if slot <> 15647 or instruction <> 13620 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1332), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1457
//		TC	BANKCALL
// slot 15648
                if slot <> 15648 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[912] to agcAotUnit912@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1458
//		CADR	GOFLASH
// slot 15649
    15649, 17020
)).

// bank 15, slots 15650-15661
function agcAotUnit913 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15655 {
        if slot <= 15652 {
            if slot <= 15650 {
// P51-P53.agc:1459
//		TCF	GOTOPOOH	# V34 -- TERMINATE
// slot 15650
                if slot <> 15650 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15651 {
// P51-P53.agc:1460
//# Page 960
// P51-P53.agc:1461
//		TCF	R59E		# V33 -- PROCEED TO MARK ROUTINE
// slot 15651
                    if slot <> 15651 or instruction <> 5413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5413, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1462
//		TCF	R59		# V32 -- RECYCLE TO TOP OF R59 AGAIN
// slot 15652
                    if slot <> 15652 or instruction <> 5285 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5285, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15653 {
// P51-P53.agc:1463
//
// P51-P53.agc:1464
//R59E		CAF	SEVEN		# GET DETENT CODE CORRESPONDING TO POSCODE
// slot 15653
                if slot <> 15653 or instruction <> 14831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15654 {
// P51-P53.agc:1465
//		MASK	POSCODE
// slot 15654
                    if slot <> 15654 or instruction <> 29346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 674).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1466
//		EXTEND
// slot 15655
                    if slot <> 15655 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15658 {
            if slot <= 15656 {
// P51-P53.agc:1467
//		MP	BIT7		# DETEND CODE NOW IN L
// slot 15656
                if slot <> 15656 or instruction <> 31205 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2533, readEffective:call(words, 2533)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15657 {
// P51-P53.agc:1468
//		CS	HIGH9
// slot 15657
                    if slot <> 15657 or instruction <> 20452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1469
//		MASK	AOTCODE		# ISOLATE STAR NO BIT 1-6
// slot 15658
                    if slot <> 15658 or instruction <> 29149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 477).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15659 {
// P51-P53.agc:1470
//		AD	L
// slot 15659
                if slot <> 15659 or instruction <> 24577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15660 {
// P51-P53.agc:1471
//		TS	AOTCODE		# STORE DETENT 7-9
// slot 15660
                    if slot <> 15660 or instruction <> 23005 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23005, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:1472
//
// P51-P53.agc:1473
//R59OUT		TC	BANKCALL	# GO TO AOTMARK FOR SIGHTING
// slot 15661
                    if slot <> 15661 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[913] to agcAotUnit913@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1474
//		CADR	AOTMARK
// slot 15662
    15662, 14336
)).

// bank 15, slots 15663-15663
function agcAotUnit914 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1475
//		TC	BANKCALL
// slot 15663
    if slot <> 15663 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[914] to agcAotUnit914@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1476
//		CADR	AOTSTALL	# SLEEP TILL SIGHTING DONE
// slot 15664
    15664, 16276
)).

// bank 15, slots 15665-15665
function agcAotUnit915 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1477
//		TC	CURTAINS	# BADEND RETURN FROM AOTMARK
// slot 15665
    if slot <> 15665 or instruction <> 3017 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3017, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[915] to agcAotUnit915@.

// bank 15, slots 15666-15666
function agcAotUnit916 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1478
//		TCF	R59RET		# RETURN TO 1 STAR OR 2STAR
// slot 15666
    if slot <> 15666 or instruction <> 5676 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5676, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[916] to agcAotUnit916@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1479
//
// P51-P53.agc:1480
//V01N70*		VN 	170
// slot 15667
    15667, 396,
// P51-P53.agc:1481
//V06N79		VN	679
// slot 15668
    15668, 1694,
// P51-P53.agc:1482
//DEG30		2DEC	.083333333	# 30 DEGREES
// slot 15669 15670
    15669, 2730, 15670, 10922,
// P51-P53.agc:1483
//DEG.5		2DEC	.00138888	# .5 DEGREES SCALED IN REVS.
// slot 15671 15672
    15671, 44, 15672, 24754,
// P51-P53.agc:1484
//DEG60		OCT	12525		# 60 DEG CDU SCALING
// slot 15673
    15673, 10922,
// P51-P53.agc:1485
//CURSOR		EQUALS	GDT/2
// P51-P53.agc:1486
//SPIRAL		EQUALS	GDT/2 +2
// P51-P53.agc:1487
//POSCODE		EQUALS	GDT/2 +4
// P51-P53.agc:1488
//
// P51-P53.agc:1489
//# Page 961
// P51-P53.agc:1490
//# NAME -- 	PLANET
// P51-P53.agc:1491
//# FUNCTION --	TO PROVIDE THE REFERENCE VECTOR FOR THE SIGHTED CELESTIAL
// P51-P53.agc:1492
//#		BODY.  STARS ARE FETCHED FROM THE CATALOG, SUN, EARTH AND
// P51-P53.agc:1493
//#		MOON ARE COMPUTED BY LOCSAM, PLANET VECTORS ARE ENTERED
// P51-P53.agc:1494
//#		BY DSKY INPUT.
// P51-P53.agc:1495
//# CALL --	CALL
// P51-P53.agc:1496
//#			PLANET
// P51-P53.agc:1497
//# INPUT --	TIME IN MPAC
// P51-P53.agc:1498
//# OUTPUT --	VECTOR IN MPAC
// P51-P53.agc:1499
//# SUBROUTINES -- LOCSAM
// P51-P53.agc:1500
//# DEBRIS --	VAC, STARAD - STARAD +17
// P51-P53.agc:1501
//
// P51-P53.agc:1502
//		SETLOC	P50S
// P51-P53.agc:1503
//		BANK
// P51-P53.agc:1504
//		COUNT*	$$/P51
// P51-P53.agc:1505
//
// P51-P53.agc:1506
//PLANET		STOVL	TSIGHT
// slot 15674
    15674, 24292,
// P51-P53.agc:1507
//			ZEROVEC
// slot 15675
    15675, 20494,
// P51-P53.agc:1508
//		STORE	STARAD
// slot 15676
    15676, 2958,
// P51-P53.agc:1509
//		STQ	EXIT
// slot 15677
    15677, 65056,
// P51-P53.agc:1510
//			GCTR
// slot 15678
    15678, 3004
)).

// bank 15, slots 15679-15684
function agcAotUnit917 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15681 {
        if slot <= 15679 {
// P51-P53.agc:1511
//		CS	HIGH9
// slot 15679
            if slot <> 15679 or instruction <> 20452 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15680 {
// P51-P53.agc:1512
//		MASK	AOTCODE
// slot 15680
                if slot <> 15680 or instruction <> 29149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 477).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1513
//		EXTEND
// slot 15681
                if slot <> 15681 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15682 {
// P51-P53.agc:1514
//		MP	REVCNT
// slot 15682
            if slot <> 15682 or instruction <> 31906 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 3234, readEffective:call(words, 3234)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15683 {
// P51-P53.agc:1515
//		XCH	L
// slot 15683
                if slot <> 15683 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1516
//		INDEX	STARIND
// slot 15684
                if slot <> 15684 or instruction <> 21487 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21487, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21487, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[917] to agcAotUnit917@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1517
//		TS	BESTI
// slot 15685
    15685, 47066
)).

// bank 15, slots 15686-15689
function agcAotUnit918 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15687 {
        if slot <= 15686 {
// P51-P53.agc:1518
//		CCS	A
// slot 15686
            if slot <> 15686 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1519
//		TCF	NOTPLAN
// slot 15687
            if slot <> 15687 or instruction <> 5459 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5459, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15688 {
// P51-P53.agc:1520
//		CAF	VNPLANV
// slot 15688
            if slot <> 15688 or instruction <> 13682 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1394), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1521
//		TC	BANKCALL
// slot 15689
            if slot <> 15689 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[918] to agcAotUnit918@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1522
//		CADR	GOFLASH
// slot 15690
    15690, 17020
)).

// bank 15, slots 15691-15694
function agcAotUnit919 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15692 {
        if slot <= 15691 {
// P51-P53.agc:1523
//		TC	-3
// slot 15691
            if slot <> 15691 or instruction <> 1352 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1352, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1524
//		TC	+2
// slot 15692
            if slot <> 15692 or instruction <> 1358 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1358, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15693 {
// P51-P53.agc:1525
//		TC	-5
// slot 15693
            if slot <> 15693 or instruction <> 1352 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1352, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1526
//		TC	INTPRET
// slot 15694
            if slot <> 15694 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[919] to agcAotUnit919@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1527
//		VLOAD	UNIT
// slot 15695
    15695, 44794,
// P51-P53.agc:1528
//			STARAD
// slot 15696
    15696, 2958,
// P51-P53.agc:1529
//		GOTO
// slot 15697
    15697, 65360,
// P51-P53.agc:1530
//			GCTR
// slot 15698
    15698, 3004
)).

// bank 15, slots 15699-15703
function agcAotUnit920 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15700 {
        if slot <= 15699 {
// P51-P53.agc:1531
//NOTPLAN		CS	A
// slot 15699
            if slot <> 15699 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1532
//		AD	DEC227
// slot 15700
            if slot <> 15700 or instruction <> 25969 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1393), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15701 {
// P51-P53.agc:1533
//		EXTEND
// slot 15701
            if slot <> 15701 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15702 {
// P51-P53.agc:1534
//		BZMF	CALSAM1
// slot 15702
                if slot <> 15702 or instruction <> 25951 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25951, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1535
//		INDEX	STARIND
// slot 15703
                if slot <> 15703 or instruction <> 21487 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21487, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21487, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[920] to agcAotUnit920@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1536
//		CA	BESTI
// slot 15704
    15704, 26586
)).

// bank 15, slots 15705-15705
function agcAotUnit921 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1537
//		INDEX	FIXLOC
// slot 15705
    if slot <> 15705 or instruction <> 20560 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20560, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[921] to agcAotUnit921@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1538
//		TS	X1
// slot 15706
    15706, 45132
)).

// bank 15, slots 15707-15707
function agcAotUnit922 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1539
//		TC	INTPRET
// slot 15707
    if slot <> 15707 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[922] to agcAotUnit922@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1540
//# Page 962
// P51-P53.agc:1541
//		VLOAD*	GOTO
// slot 15708
    15708, 43254,
// P51-P53.agc:1542
//			CATLOG,1
// slot 15709
    15709, 25038,
// P51-P53.agc:1543
//			GCTR
// slot 15710
    15710, 3004
)).

// bank 15, slots 15711-15711
function agcAotUnit923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1544
//CALSAM1		TC	INTPRET
// slot 15711
    if slot <> 15711 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[923] to agcAotUnit923@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1545
//CALSAM		DLOAD	CALL
// slot 15712
    15712, 38090,
// P51-P53.agc:1546
//			TSIGHT
// slot 15713
    15713, 3812,
// P51-P53.agc:1547
//			LOCSAM
// slot 15714
    15714, 25228,
// P51-P53.agc:1548
//		LXC,1	VLOAD
// slot 15715
    15715, 64960,
// P51-P53.agc:1549
//			STARIND
// slot 15716
    15716, 3038,
// P51-P53.agc:1550
//			VEARTH
// slot 15717
    15717, 2958,
// P51-P53.agc:1551
//		STOVL	0D
// slot 15718
    15718, 20482,
// P51-P53.agc:1552
//			VSUN
// slot 15719
    15719, 2970,
// P51-P53.agc:1553
//		STOVL	VEARTH
// slot 15720
    15720, 23438,
// P51-P53.agc:1554
//			0D
// slot 15721
    15721, 2,
// P51-P53.agc:1555
//		STORE	VSUN
// slot 15722
    15722, 2970,
// P51-P53.agc:1556
//		DLOAD*	LXC,1
// slot 15723
    15723, 57542,
// P51-P53.agc:1557
//			BESTI,1
// slot 15724
    15724, 3036,
// P51-P53.agc:1558
//			MPAC
// slot 15725
    15725, 216,
// P51-P53.agc:1559
//		VLOAD*	GOTO
// slot 15726
    15726, 43254,
// P51-P53.agc:1560
//			STARAD -228D,1
// slot 15727
    15727, 2502,
// P51-P53.agc:1561
//			GCTR
// slot 15728
    15728, 3004,
// P51-P53.agc:1562
//DEC227		DEC	227
// slot 15729
    15729, 454,
// P51-P53.agc:1563
//VNPLANV		VN	0688
// slot 15730
    15730, 1712
)).

// bank 15, slots 15731-15737
function agcAotUnit924 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15733 {
        if slot <= 15731 {
// P51-P53.agc:1564
//PIPSRINE	=	PIPASR +3	# EBANK NOT 4 SO DON'T LOAD PIPTIME1
// P51-P53.agc:1565
//
// P51-P53.agc:1566
//# Page 963
// P51-P53.agc:1567
//# GRAVITY VECTOR DETERMINATION ROUTINE
// P51-P53.agc:1568
//# BY KEN VINCENT
// P51-P53.agc:1569
//#
// P51-P53.agc:1570
//# FOR DETAILED DESCRIPTION SEE 504GSOP 5.6.3.2.5.
// P51-P53.agc:1571
//#
// P51-P53.agc:1572
//# THIS PROGRAM FINDS THE DIRECTION OF THE MOON'S GRAVITY
// P51-P53.agc:1573
//# WHILE THE LM IS IN THE MOON'S SURFACE.  IT WILL BE USED
// P51-P53.agc:1574
//# FOR LUNAR SURFACE ALIGNMENT.  THE GRAVITY VECTOR IS
// P51-P53.agc:1575
//# DETERMINED BY READING THE PIPAS WITH THE IMU AT TWO
// P51-P53.agc:1576
//# PARTICULAR ORIENTATIONS.  THE TWO READINGS ARE AVERAGED
// P51-P53.agc:1577
//# AND UNITIZED AND TRANSFORMED TO NB COORDINATES.  THE TWO
// P51-P53.agc:1578
//# ORIENTATIONS WERE CHOSEN TO REDUCE BIAS ERRORS IN THE
// P51-P53.agc:1579
//# READINGS.
// P51-P53.agc:1580
//#
// P51-P53.agc:1581
//# CALL --
// P51-P53.agc:1582
//#	TC	BANKCALL
// P51-P53.agc:1583
//#	CADR	GVDETER
// P51-P53.agc:1584
//#
// P51-P53.agc:1585
//# INPUTS --
// P51-P53.agc:1586
//#	PIPAS, CDUS
// P51-P53.agc:1587
//#
// P51-P53.agc:1588
//# OUTPUTS --
// P51-P53.agc:1589
//#	STARSAV1 = UNIT GRAVITY
// P51-P53.agc:1590
//#	GSAV     = DITTO
// P51-P53.agc:1591
//#	GRAVBIT  = 1
// P51-P53.agc:1592
//#
// P51-P53.agc:1593
//# SUBROUTINES --
// P51-P53.agc:1594
//#	PIPASR, IMUCOARS, IMUFINE, IMUSTALL, 1/PIPA, DELAYJOB, CDUTRIG,
// P51-P53.agc:1595
//#	*NBSM*, *SNMB*, CALCGA, GOFLASH
// P51-P53.agc:1596
//#
// P51-P53.agc:1597
//# DEBRIS --
// P51-P53.agc:1598
//#	VAC, SAC, STARAD, XSM, XNB, THETAD, DELV, COSCDU, SINCDU
// P51-P53.agc:1599
//
// P51-P53.agc:1600
//GVDETER		CAF	42DEG
// slot 15731
            if slot <> 15731 or instruction <> 13818 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1530), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15732 {
// P51-P53.agc:1601
//		TS	THETAD
// slot 15732
                if slot <> 15732 or instruction <> 22737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1602
//		COM
// slot 15733
                if slot <> 15733 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15735 {
            if slot <= 15734 {
// P51-P53.agc:1603
//		TS	THETAD 	+1
// slot 15734
                if slot <> 15734 or instruction <> 22738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22738, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1604
//		CAF	35DEG
// slot 15735
                if slot <> 15735 or instruction <> 13819 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1531), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15736 {
// P51-P53.agc:1605
//		TS	THETAD	+2
// slot 15736
                if slot <> 15736 or instruction <> 22739 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22739, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1606
//		TC	INTPRET
// slot 15737
                if slot <> 15737 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[924] to agcAotUnit924@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1607
//		CLEAR	CALL
// slot 15738
    15738, 37912,
// P51-P53.agc:1608
//			REFSMFLG
// slot 15739
    15739, 1892,
// P51-P53.agc:1609
//			LUNG
// slot 15740
    15740, 27504,
// P51-P53.agc:1610
//
// P51-P53.agc:1611
//# FIND GIMBAL ANGLES WHICH ROTATE SM 180 DEG ABOUT G VEC
// P51-P53.agc:1612
//#
// P51-P53.agc:1613
//# 	DEFINE G COOR SYS
// P51-P53.agc:1614
//#		      _
// P51-P53.agc:1615
//#		    [ X ]   [    UNIT G    ]
// P51-P53.agc:1616
//#		*   [ _ ]   [            _ ]
// P51-P53.agc:1617
//#		M = [ Y ] = [ UNITEZSM * X ]
// P51-P53.agc:1618
//#		    [ _ ]   [       _   _  ]
// P51-P53.agc:1619
//#		    [ Z ]   [ UNIT( X * Y )]
// P51-P53.agc:1620
//#
// P51-P53.agc:1621
//#	THEN ROTATED SM WRT PRESENT IS
// P51-P53.agc:1622
//#
// P51-P53.agc:1623
//# Page 964
// P51-P53.agc:1624
//#		           [ 1   0   0 ]
// P51-P53.agc:1625
//#		 *      *T [           ] *             *      *
// P51-P53.agc:1626
//#		XSM =   M  [ 0  -1   0 ] M  =  2 (X X ) - 1/2 I
// P51-P53.agc:1627
//#     		           [           ]           I J
// P51-P53.agc:1628
//#			   [ 0   0  -1 ]
// P51-P53.agc:1629
//#
// P51-P53.agc:1630
//# 	ALSO NB WRT PRES SM IS
// P51-P53.agc:1631
//#
// P51-P53.agc:1632
//#		 *      *  *
// P51-P53.agc:1633
//#		XNB = NBSM I
// P51-P53.agc:1634
//#
// P51-P53.agc:1635
//#	                         *    *
// P51-P53.agc:1636
//#	GIMBAL ANGLES = CALCGA( XSM, XNB )
// P51-P53.agc:1637
//
// P51-P53.agc:1638
//		SETLOC	P50S
// P51-P53.agc:1639
//		BANK
// P51-P53.agc:1640
//		COUNT*	$$/P57
// P51-P53.agc:1641
//		AXT,1	SSP		# X1=18
// slot 15741
    15741, 55792,
// P51-P53.agc:1642
//			18D		# S1=6
// slot 15742
    15742, 36,
// P51-P53.agc:1643
//			S1		# X2, -2
// slot 15743
    15743, 82,
// P51-P53.agc:1644
//			6D
// slot 15744
    15744, 12,
// P51-P53.agc:1645
//		LXC,2
// slot 15745
    15745, 65480,
// P51-P53.agc:1646
//			S1
// slot 15746
    15746, 80,
// P51-P53.agc:1647
//GRAVEL		VLOAD*	CALL
// slot 15747
    15747, 38134,
// P51-P53.agc:1648
//			XUNIT -6,2
// slot 15748
    15748, 45056,
// P51-P53.agc:1649
//			*NBSM*		# SIN AND COS COMPUTED IN LUNG
// slot 15749
    15749, 40822,
// P51-P53.agc:1650
//		STORE	XNB +18D,1
// slot 15750
    15750, 7054,
// P51-P53.agc:1651
//		VLOAD
// slot 15751
    15751, 65530,
// P51-P53.agc:1652
//			STAR
// slot 15752
    15752, 2994,
// P51-P53.agc:1653
//		LXC,2	VXSC*		# COMPLEMENT -- UNITX ARE BACKWARD --
// slot 15753
    15753, 61384,
// P51-P53.agc:1654
//			X2
// slot 15754
    15754, 78,
// P51-P53.agc:1655
//			STAR +6,2	# OUTER PRODUCT
// slot 15755
    15755, 62528,
// P51-P53.agc:1656
//		VSL2	LXC,2
// slot 15756
    15756, 58580,
// P51-P53.agc:1657
//			X2
// slot 15757
    15757, 78,
// P51-P53.agc:1658
//		VSU*	INCR,2
// slot 15758
    15758, 52302,
// P51-P53.agc:1659
//			XUNIT -6,2
// slot 15759
    15759, 45056,
// P51-P53.agc:1660
//			2D
// slot 15760
    15760, 4,
// P51-P53.agc:1661
//		STORE	XSM +18D,1
// slot 15761
    15761, 7018,
// P51-P53.agc:1662
//		TIX,1	CALL
// slot 15762
    15762, 38016,
// P51-P53.agc:1663
//			GRAVEL
// slot 15763
    15763, 27398,
// P51-P53.agc:1664
//			CALCGA
// slot 15764
    15764, 40406,
// P51-P53.agc:1665
//		VLOAD	VSR1
// slot 15765
    15765, 62202,
// P51-P53.agc:1666
//			GOUT
// slot 15766
    15766, 2970,
// P51-P53.agc:1667
//		STCALL	STARAD +12D
// slot 15767
    15767, 31654,
// P51-P53.agc:1668
//			LUNG
// slot 15768
    15768, 27504,
// P51-P53.agc:1669
//		VLOAD	VSR1
// slot 15769
    15769, 62202,
// P51-P53.agc:1670
//			GOUT
// slot 15770
    15770, 2970,
// P51-P53.agc:1671
//		VAD	UNIT
// slot 15771
    15771, 44634,
// P51-P53.agc:1672
//			STARAD +12D
// slot 15772
    15772, 2982,
// P51-P53.agc:1673
//		STORE	STARSAV1
// slot 15773
    15773, 3042,
// P51-P53.agc:1674
//		DOT
// slot 15774
    15774, 65346,
// P51-P53.agc:1675
//			GSAV
// slot 15775
    15775, 2354,
// P51-P53.agc:1676
//		SL1	ACOS
// slot 15776
    15776, 54996,
// P51-P53.agc:1677
//# Page 965
// P51-P53.agc:1678
//		STORE	DSPTEM1
// slot 15777
    15777, 1100,
// P51-P53.agc:1679
//		EXIT
// slot 15778
    15778, 65532
)).

// bank 15, slots 15779-15779
function agcAotUnit925 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1680
//		TC	DOWNFLAG	# CLAR FREEFLAG IN CASE OF RECYCLE
// slot 15779
    if slot <> 15779 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[925] to agcAotUnit925@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1681
//		ADRES	FREEFLAG
// slot 15780
    15780, 24
)).

// bank 15, slots 15781-15782
function agcAotUnit926 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15781 {
// P51-P53.agc:1682
//
// P51-P53.agc:1683
//		CA	DISGRVER
// slot 15781
        if slot <> 15781 or instruction <> 13817 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1529), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1684
//		TC	BANKCALL
// slot 15782
        if slot <> 15782 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[926] to agcAotUnit926@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1685
//		CADR	GOFLASH
// slot 15783
    15783, 17020
)).

// bank 15, slots 15784-15786
function agcAotUnit927 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15784 {
// P51-P53.agc:1686
//		TC	GOTOPOOH
// slot 15784
        if slot <> 15784 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15785 {
// P51-P53.agc:1687
//		TCF	PROGRAV		# VB33 -- PROCEED
// slot 15785
            if slot <> 15785 or instruction <> 5548 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5548, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1688
//		TC	UPFLAG		# VB32 -- RECYCLE -- STORE GRAV AND DO IT AGAIN
// slot 15786
            if slot <> 15786 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[927] to agcAotUnit927@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1689
//		ADRES	FREEFLAG	# AND SET FREEFLAG TO SHOW RECYCLE
// slot 15787
    15787, 24
)).

// bank 15, slots 15788-15788
function agcAotUnit928 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1690
//
// P51-P53.agc:1691
//PROGRAV		TC	PHASCHNG
// slot 15788
    if slot <> 15788 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[928] to agcAotUnit928@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1692
//		OCT	04024
// slot 15789
    15789, 4136
)).

// bank 15, slots 15790-15790
function agcAotUnit929 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1693
//
// P51-P53.agc:1694
//		TC	INTPRET
// slot 15790
    if slot <> 15790 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[929] to agcAotUnit929@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1695
//		VLOAD
// slot 15791
    15791, 65530,
// P51-P53.agc:1696
//			STARSAV1
// slot 15792
    15792, 3042,
// P51-P53.agc:1697
//		STORE	GSAV
// slot 15793
    15793, 2354,
// P51-P53.agc:1698
//		EXIT
// slot 15794
    15794, 65532
)).

// bank 15, slots 15795-15799
function agcAotUnit930 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15796 {
        if slot <= 15795 {
// P51-P53.agc:1699
//		CAF	FREEFBIT	# IF FREEFLAG SET, RE-COMPUTE GRAVITY
// slot 15795
            if slot <> 15795 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1700
//		MASK	FLAGWRD0
// slot 15796
            if slot <> 15796 or instruction <> 28732 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 60).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15797 {
// P51-P53.agc:1701
//		CCS	A
// slot 15797
            if slot <> 15797 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15798 {
// P51-P53.agc:1702
//		TCF	GVDETER		# SET
// slot 15798
                if slot <> 15798 or instruction <> 5491 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5491, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1703
//		TCF	ATTCHK		# EXIT FROM GVDETER
// slot 15799
                if slot <> 15799 or instruction <> 5995 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5995, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[930] to agcAotUnit930@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1704
//
// P51-P53.agc:1705
//LUNG		STQ	VLOAD
// slot 15800
    15800, 64800,
// P51-P53.agc:1706
//			QMIN
// slot 15801
    15801, 3018,
// P51-P53.agc:1707
//			ZEROVEC
// slot 15802
    15802, 20494,
// P51-P53.agc:1708
//		STORE	GACC
// slot 15803
    15803, 2958,
// P51-P53.agc:1709
//		EXIT
// slot 15804
    15804, 65532
)).

// bank 15, slots 15805-15805
function agcAotUnit931 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1710
//		TC	PHASCHNG
// slot 15805
    if slot <> 15805 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[931] to agcAotUnit931@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1711
//		OCT	04024
// slot 15806
    15806, 4136
)).

// bank 15, slots 15807-15807
function agcAotUnit932 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1712
//
// P51-P53.agc:1713
//		TC	BANKCALL
// slot 15807
    if slot <> 15807 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[932] to agcAotUnit932@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1714
//		CADR	IMUCOARS
// slot 15808
    15808, 15360
)).

// bank 15, slots 15809-15809
function agcAotUnit933 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1715
//		TC	BANKCALL
// slot 15809
    if slot <> 15809 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[933] to agcAotUnit933@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1716
//		CADR	IMUSTALL
// slot 15810
    15810, 16284
)).

// bank 15, slots 15811-15812
function agcAotUnit934 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15811 {
// P51-P53.agc:1717
//		TC	CURTAINS
// slot 15811
        if slot <> 15811 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1718
//		TC	BANKCALL
// slot 15812
        if slot <> 15812 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[934] to agcAotUnit934@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1719
//		CADR	IMUFINE
// slot 15813
    15813, 15632
)).

// bank 15, slots 15814-15814
function agcAotUnit935 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1720
//		TC	BANKCALL
// slot 15814
    if slot <> 15814 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[935] to agcAotUnit935@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1721
//		CADR	IMUSTALL
// slot 15815
    15815, 16284
)).

// bank 15, slots 15816-15821
function agcAotUnit936 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15818 {
        if slot <= 15816 {
// P51-P53.agc:1722
//		TC	CURTAINS
// slot 15816
            if slot <> 15816 or instruction <> 3017 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3017, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15817 {
// P51-P53.agc:1723
//		CA	T/2SEC
// slot 15817
                if slot <> 15817 or instruction <> 13816 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1528), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1724
//		TS	GCTR
// slot 15818
                if slot <> 15818 or instruction <> 23518 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23518, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15819 {
// P51-P53.agc:1725
//		CA	PRIO31
// slot 15819
            if slot <> 15819 or instruction <> 16334 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15820 {
// P51-P53.agc:1726
//		TS	1/PIPADT
// slot 15820
                if slot <> 15820 or instruction <> 23101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1727
//		TC	BANKCALL
// slot 15821
                if slot <> 15821 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[936] to agcAotUnit936@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1728
//# Page 966
// P51-P53.agc:1729
//		CADR	GCOMPZER	# INITIALIZE COMPENSATION
// slot 15822
    15822, 14210
)).

// bank 15, slots 15823-15823
function agcAotUnit937 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1730
//		TC	PHASCHNG
// slot 15823
    if slot <> 15823 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[937] to agcAotUnit937@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1731
//		OCT	04024
// slot 15824
    15824, 4136
)).

// bank 15, slots 15825-15825
function agcAotUnit938 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1732
//
// P51-P53.agc:1733
//		TC	BANKCALL	# DON'T NEED TO INHINT.  THIS USED TO
// slot 15825
    if slot <> 15825 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[938] to agcAotUnit938@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1734
//		CADR	PIPSRINE	# INITIALIZE PIPAS.  DON'T USE DATA
// slot 15826
    15826, 65224
)).

// bank 15, slots 15827-15827
function agcAotUnit939 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1735
//		TC	INTPRET
// slot 15827
    if slot <> 15827 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[939] to agcAotUnit939@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1736
//GREED		EXIT			# = MASK 7776 IN BASIC SO DON'T CARE
// slot 15828
    15828, 65532
)).

// bank 15, slots 15829-15830
function agcAotUnit940 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15829 {
// P51-P53.agc:1737
//		CAF	2SECS
// slot 15829
        if slot <> 15829 or instruction <> 14848 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1738
//		TC	TWIDDLE		# SET UP 2 SEC TASK TO READ PIPAS
// slot 15830
        if slot <> 15830 or instruction <> 2683 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2683, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[940] to agcAotUnit940@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1739
//		ADRES	GRABGRAV
// slot 15831
    15831, 2994
)).

// bank 15, slots 15832-15833
function agcAotUnit941 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15832 {
// P51-P53.agc:1740
//
// P51-P53.agc:1741
//		TC	ENDOFJOB
// slot 15832
        if slot <> 15832 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1742
//
// P51-P53.agc:1743
//GRABGRAV	TC	IBNKCALL
// slot 15833
        if slot <> 15833 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[941] to agcAotUnit941@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1744
//		CADR	PIPSRINE
// slot 15834
    15834, 65224
)).

// bank 15, slots 15835-15836
function agcAotUnit942 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15835 {
// P51-P53.agc:1745
//		CAF	PRIO13		# RE-ESTABLISH MAINLINE JOB
// slot 15835
        if slot <> 15835 or instruction <> 14867 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2579), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1746
//		TC	FINDVAC
// slot 15836
        if slot <> 15836 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[942] to agcAotUnit942@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1747
//		EBANK=	STARAD
// P51-P53.agc:1748
//		2CADR	ADDGRAV
// slot 15837 15838
    15837, 3008, 15838, 26730
)).

// bank 15, slots 15839-15840
function agcAotUnit943 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15839 {
// P51-P53.agc:1749
//
// P51-P53.agc:1750
//		TC	TASKOVER
// slot 15839
        if slot <> 15839 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1751
//
// P51-P53.agc:1752
//ADDGRAV		TC	BANKCALL
// slot 15840
        if slot <> 15840 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[943] to agcAotUnit943@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1753
//		CADR	1/PIPA
// slot 15841
    15841, 13670
)).

// bank 15, slots 15842-15843
function agcAotUnit944 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15842 {
// P51-P53.agc:1754
//		INCR	GCTR
// slot 15842
        if slot <> 15842 or instruction <> 11230 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 990).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1755
//		TC	INTPRET
// slot 15843
        if slot <> 15843 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[944] to agcAotUnit944@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1756
//		VLOAD	VAD
// slot 15844
    15844, 44538,
// P51-P53.agc:1757
//			DELV
// slot 15845
    15845, 426,
// P51-P53.agc:1758
//			GACC
// slot 15846
    15846, 2958,
// P51-P53.agc:1759
//		STORE	GACC		# ACCUMULATE G VECTOR
// slot 15847
    15847, 2958,
// P51-P53.agc:1760
//		SLOAD	BMN
// slot 15848
    15848, 41146,
// P51-P53.agc:1761
//			GCTR
// slot 15849
    15849, 3006,
// P51-P53.agc:1762
//			GREED
// slot 15850
    15850, 27560,
// P51-P53.agc:1763
//		VLOAD	UNIT
// slot 15851
    15851, 44794,
// P51-P53.agc:1764
//			GACC
// slot 15852
    15852, 2958,
// P51-P53.agc:1765
//		STCALL	STAR
// slot 15853
    15853, 31666,
// P51-P53.agc:1766
//			CDUTRIG		# TRANSFORM IN NB COOR AND STORE
// slot 15854
    15854, 40638,
// P51-P53.agc:1767
//		CALL			# 	IN OUTPUT
// slot 15855
    15855, 65320,
// P51-P53.agc:1768
//			*SMNB*
// slot 15856
    15856, 40818,
// P51-P53.agc:1769
//		STORE	GOUT
// slot 15857
    15857, 2970,
// P51-P53.agc:1770
//		EXIT
// slot 15858
    15858, 65532
)).

// bank 15, slots 15859-15859
function agcAotUnit945 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1771
//		TC	PHASCHNG
// slot 15859
    if slot <> 15859 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[945] to agcAotUnit945@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1772
//		OCT	04024
// slot 15860
    15860, 4136
)).

// bank 15, slots 15861-15861
function agcAotUnit946 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1773
//
// P51-P53.agc:1774
//QMINEXIT	TC	INTPRET
// slot 15861
    if slot <> 15861 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[946] to agcAotUnit946@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1775
//		GOTO
// slot 15862
    15862, 65360,
// P51-P53.agc:1776
//			QMIN
// slot 15863
    15863, 3018,
// P51-P53.agc:1777
//T/2SEC		DEC	-20
// slot 15864
    15864, 65494,
// P51-P53.agc:1778
//# Page 967
// P51-P53.agc:1779
//DISGRVER	VN	0604
// slot 15865
    15865, 1544,
// P51-P53.agc:1780
//42DEG		OCT	07357
// slot 15866
    15866, 7646,
// P51-P53.agc:1781
//35DEG		OCT	06211
// slot 15867
    15867, 6418,
// P51-P53.agc:1782
//
// P51-P53.agc:1783
//# Page 968
// P51-P53.agc:1784
//# NAME -- GYROTRIM
// P51-P53.agc:1785
//#
// P51-P53.agc:1786
//# THIS PROGRAM COMPUTES AND SENDS GYRO COMMANDS WHICH CAUSE THE CDUS
// P51-P53.agc:1787
//# TO ATTAIN A PRESCRIBED SET OF ANGLES.  THIS ROUTINE ASSUMES THE
// P51-P53.agc:1788
//# VEHICLES ATTITUDE REMAINS STATIONARY DURING ITS OPERATION.
// P51-P53.agc:1789
//#
// P51-P53.agc:1790
//# CALL		CALL
// P51-P53.agc:1791
//#			GYROTRIM
// P51-P53.agc:1792
//#
// P51-P53.agc:1793
//# INPUT		THETAD,+1,+2 = DESIRED CDU ANGLES
// P51-P53.agc:1794
//#		CDUX,CDUY,CDUZ
// P51-P53.agc:1795
//#
// P51-P53.agc:1796
//# OUTPUT	GYRO TORQUE PULSES
// P51-P53.agc:1797
//#
// P51-P53.agc:1798
//# SUBROUTINES	TRG*NBSM, *NBSM*, CDUTRIG, AXISGEN, CALCGTA, IMUFINE
// P51-P53.agc:1799
//#		IMPULSE, IMUSTALL
// P51-P53.agc:1800
//#		_______  ______  ______     *          *   ___
// P51-P53.agc:1801
//# DEBRIS 	CDUSPOT, SINCDU, COSCDU, STARAD, VAC, XDC, OGC
// P51-P53.agc:1802
//
// P51-P53.agc:1803
//		COUNT*	$$/P57
// P51-P53.agc:1804
//GYROTRIM	STQ	DLOAD
// slot 15868
    15868, 58656,
// P51-P53.agc:1805
//			QMIN
// slot 15869
    15869, 3018,
// P51-P53.agc:1806
//			THETAD
// slot 15870
    15870, 420,
// P51-P53.agc:1807
//		PDDL	PDDL
// slot 15871
    15871, 54698,
// P51-P53.agc:1808
//			THETAD +2
// slot 15872
    15872, 424,
// P51-P53.agc:1809
//			THETAD +1
// slot 15873
    15873, 422,
// P51-P53.agc:1810
//		VDEF
// slot 15874
    15874, 65388,
// P51-P53.agc:1811
//		STOVL	CDUSPOT
// slot 15875
    15875, 21486,
// P51-P53.agc:1812
//			XUNIT
// slot 15876
    15876, 20490,
// P51-P53.agc:1813
//		CALL
// slot 15877
    15877, 65320,
// P51-P53.agc:1814
//			TRG*NBSM
// slot 15878
    15878, 40808,
// P51-P53.agc:1815
//		STOVL	STARAD
// slot 15879
    15879, 23438,
// P51-P53.agc:1816
//			YUNIT
// slot 15880
    15880, 20486,
// P51-P53.agc:1817
//		CALL
// slot 15881
    15881, 65320,
// P51-P53.agc:1818
//			*NBSM*
// slot 15882
    15882, 40822,
// P51-P53.agc:1819
//		STCALL	STARAD +6
// slot 15883
    15883, 31642,
// P51-P53.agc:1820
//			CDUTRIG
// slot 15884
    15884, 40638,
// P51-P53.agc:1821
//		CALL
// slot 15885
    15885, 65320,
// P51-P53.agc:1822
//			CALCSMSC
// slot 15886
    15886, 16432,
// P51-P53.agc:1823
//		VLOAD
// slot 15887
    15887, 65530,
// P51-P53.agc:1824
//			XNB
// slot 15888
    15888, 2922,
// P51-P53.agc:1825
//		STOVL	6D
// slot 15889
    15889, 20494,
// P51-P53.agc:1826
//			YNB
// slot 15890
    15890, 2934,
// P51-P53.agc:1827
//		STCALL	12D
// slot 15891
    15891, 28698,
// P51-P53.agc:1828
//			AXISGEN
// slot 15892
    15892, 40514,
// P51-P53.agc:1829
//		CALL
// slot 15893
    15893, 65320,
// P51-P53.agc:1830
//			CALCGTA
// slot 15894
    15894, 40270,
// P51-P53.agc:1831
//JUSTTRIM	EXIT
// slot 15895
    15895, 65532
)).

// bank 15, slots 15896-15896
function agcAotUnit947 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1832
//		TC	BANKCALL
// slot 15896
    if slot <> 15896 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[947] to agcAotUnit947@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1833
//		CADR	IMUFINE
// slot 15897
    15897, 15632
)).

// bank 15, slots 15898-15898
function agcAotUnit948 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1834
//		TC	BANKCALL
// slot 15898
    if slot <> 15898 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[948] to agcAotUnit948@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1835
//# Page 969
// P51-P53.agc:1836
//		CADR	IMUSTALL
// slot 15899
    15899, 16284
)).

// bank 15, slots 15900-15902
function agcAotUnit949 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15900 {
// P51-P53.agc:1837
//		TC	CURTAINS
// slot 15900
        if slot <> 15900 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 15901 {
// P51-P53.agc:1838
//		CA	GYRCDR
// slot 15901
            if slot <> 15901 or instruction <> 13860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1572), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1839
//		TC	BANKCALL
// slot 15902
            if slot <> 15902 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[949] to agcAotUnit949@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1840
//		CADR	IMUPULSE
// slot 15903
    15903, 15782
)).

// bank 15, slots 15904-15904
function agcAotUnit950 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1841
//		TC	BANKCALL
// slot 15904
    if slot <> 15904 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[950] to agcAotUnit950@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1842
//		CADR	IMUSTALL
// slot 15905
    15905, 16284
)).

// bank 15, slots 15906-15907
function agcAotUnit951 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15906 {
// P51-P53.agc:1843
//		TC	CURTAINS
// slot 15906
        if slot <> 15906 or instruction <> 3017 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3017, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1844
//		TCF	QMINEXIT
// slot 15907
        if slot <> 15907 or instruction <> 5621 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5621, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[951] to agcAotUnit951@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1845
//
// P51-P53.agc:1846
//GYRCDR		ECADR	OGC
// slot 15908
    15908, 3006
)).

// bank 15, slots 15909-15913
function agcAotUnit952 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15910 {
        if slot <= 15909 {
// P51-P53.agc:1847
//
// P51-P53.agc:1848
//# Page 970
// P51-P53.agc:1849
//# PERFORM STAR ACQUISITION AND STAR SIGHTINGS
// P51-P53.agc:1850
//
// P51-P53.agc:1851
//2STARS		CAF	ZERO		# INITIALIZE STARIND
// slot 15909
            if slot <> 15909 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1852
//		TCF	+2		# ZERO FOR 1ST STAR, ONE FOR 2ND STAR
// slot 15910
            if slot <> 15910 or instruction <> 5672 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5672, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15911 {
// P51-P53.agc:1853
//1STAR		CAF	BIT1
// slot 15911
            if slot <> 15911 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15912 {
// P51-P53.agc:1854
//		TS	STARIND
// slot 15912
                if slot <> 15912 or instruction <> 23535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23535, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1855
//
// P51-P53.agc:1856
//		TC	PHASCHNG
// slot 15913
                if slot <> 15913 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[952] to agcAotUnit952@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1857
//		OCT	04024
// slot 15914
    15914, 4136
)).

// bank 15, slots 15915-15919
function agcAotUnit953 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15916 {
        if slot <= 15915 {
// P51-P53.agc:1858
//
// P51-P53.agc:1859
//		TCF	R59		# GO DO STAR ACQUIRE AND AOTMARK
// slot 15915
            if slot <> 15915 or instruction <> 5285 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5285, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1860
//
// P51-P53.agc:1861
//R59RET		CA	STARIND		# BACK FROM SURFACE MARKING
// slot 15916
            if slot <> 15916 or instruction <> 13295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 1007).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15917 {
// P51-P53.agc:1862
//		EXTEND
// slot 15917
            if slot <> 15917 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15918 {
// P51-P53.agc:1863
//		BZF	ASTAR		# 1ST STAR MARKED
// slot 15918
                if slot <> 15918 or instruction <> 5687 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5687, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1864
//
// P51-P53.agc:1865
//		TC	PHASCHNG
// slot 15919
                if slot <> 15919 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[953] to agcAotUnit953@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1866
//		OCT 	04024
// slot 15920
    15920, 4136
)).

// bank 15, slots 15921-15921
function agcAotUnit954 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1867
//
// P51-P53.agc:1868
//		TC	INTPRET
// slot 15921
    if slot <> 15921 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[954] to agcAotUnit954@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1869
//		DLOAD	CALL
// slot 15922
    15922, 38090,
// P51-P53.agc:1870
//			TSIGHT		# TIME OF 2ND MARK
// slot 15923
    15923, 3812,
// P51-P53.agc:1871
//			PLANET
// slot 15924
    15924, 27252,
// P51-P53.agc:1872
//		STCALL	VEC2		# STORE 2ND CATALOG VEC (REF)
// slot 15925
    15925, 31666,
// P51-P53.agc:1873
//			SURFLINE
// slot 15926
    15926, 27778
)).

// bank 15, slots 15927-15927
function agcAotUnit955 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1874
//
// P51-P53.agc:1875
//ASTAR		TC	INTPRET
// slot 15927
    if slot <> 15927 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[955] to agcAotUnit955@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1876
//		VLOAD
// slot 15928
    15928, 65530,
// P51-P53.agc:1877
//			STARAD +6
// slot 15929
    15929, 2970,
// P51-P53.agc:1878
//		STORE	STARSAV1	# 1ST OBSERVED STAR (SM)
// slot 15930
    15930, 3042,
// P51-P53.agc:1879
//		DLOAD	CALL
// slot 15931
    15931, 38090,
// P51-P53.agc:1880
//			TSIGHT		# TIME OF 1ST MARK
// slot 15932
    15932, 3812,
// P51-P53.agc:1881
//			PLANET
// slot 15933
    15933, 27252,
// P51-P53.agc:1882
//		STORE	VEC1		# STORE 1ST CATALOG VEC (REF)
// slot 15934
    15934, 2982,
// P51-P53.agc:1883
//		EXIT
// slot 15935
    15935, 65532
)).

// bank 15, slots 15936-15936
function agcAotUnit956 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1884
//		TCF	1STAR		# GO GET 2ND STAR SIGHTING
// slot 15936
    if slot <> 15936 or instruction <> 5671 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5671, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[956] to agcAotUnit956@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1885
//
// P51-P53.agc:1886
//# Page 971
// P51-P53.agc:1887
//# DO FINE OR COARSE ALIGNMENT OF IMU
// P51-P53.agc:1888
//
// P51-P53.agc:1889
//SURFLINE	SSP	AXT,2
// slot 15937
    15937, 64690,
// P51-P53.agc:1890
//			S2
// slot 15938
    15938, 84,
// P51-P53.agc:1891
//			6
// slot 15939
    15939, 12,
// P51-P53.agc:1892
//			12D
// slot 15940
    15940, 24,
// P51-P53.agc:1893
//WRTDESIR	VLOAD*	MXV
// slot 15941
    15941, 53750,
// P51-P53.agc:1894
//			VEC1 +12D,2	# PICK UP VEC IN REF, TRANS TO DESIRED SH
// slot 15942
    15942, 62528,
// P51-P53.agc:1895
//			XSMD
// slot 15943
    15943, 3854,
// P51-P53.agc:1896
//		UNIT
// slot 15944
    15944, 65372,
// P51-P53.agc:1897
//		STORE	STARAD +12D,2	# VEC IN SM
// slot 15945
    15945, 11174,
// P51-P53.agc:1898
//		VLOAD*
// slot 15946
    15946, 65526,
// P51-P53.agc:1899
//			STARSAV1 +12D,2	# PICK UP VEC IN PRESENT SM
// slot 15947
    15947, 62468,
// P51-P53.agc:1900
//		STORE	18D,2
// slot 15948
    15948, 8230,
// P51-P53.agc:1901
//		TIX,2	BON
// slot 15949
    15949, 35976,
// P51-P53.agc:1902
//			WRTDESIR
// slot 15950
    15950, 27786,
// P51-P53.agc:1903
//			INITALGN	# IF INITIAL PASS (OPTION 0) BYPASS R54
// slot 15951
    15951, 4506,
// P51-P53.agc:1904
//			INITBY
// slot 15952
    15952, 27820,
// P51-P53.agc:1905
//DOALIGN		CALL
// slot 15953
    15953, 65320,
// P51-P53.agc:1906
//			R54		# DO CHKSDATA
// slot 15954
    15954, 25948,
// P51-P53.agc:1907
//		BOFF
// slot 15955
    15955, 65304,
// P51-P53.agc:1908
//			FREEFLAG
// slot 15956
    15956, 472,
// P51-P53.agc:1909
//			P57POST		# ASTRO DOES NOT LIKE DATA TEST RESULTS
// slot 15957
    15957, 27916,
// P51-P53.agc:1910
//INITBY		CALL
// slot 15958
    15958, 65320,
// P51-P53.agc:1911
//			AXISGEN		# GET DESIRED ORIENT WRT PRES. XDC,YDC,ZDC
// slot 15959
    15959, 40514,
// P51-P53.agc:1912
//		CALL
// slot 15960
    15960, 65320,
// P51-P53.agc:1913
//			CALCGTA		# GET GYRO TORQ ANGLES, OGC,IGC,MGC
// slot 15961
    15961, 40270,
// P51-P53.agc:1914
//		EXIT
// slot 15962
    15962, 65532
)).

// bank 15, slots 15963-15968
function agcAotUnit957 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15965 {
        if slot <= 15963 {
// P51-P53.agc:1915
//		CAF	INITABIT	# IF INITIAL PASS BYPASS NOUN 93 DISPLAY
// slot 15963
            if slot <> 15963 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15964 {
// P51-P53.agc:1916
//		MASK	FLAGWRD8
// slot 15964
                if slot <> 15964 or instruction <> 28740 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 68).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1917
//		CCS	A
// slot 15965
                if slot <> 15965 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 15966 {
// P51-P53.agc:1918
//		TCF	5DEGTEST
// slot 15966
            if slot <> 15966 or instruction <> 5733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5733, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15967 {
// P51-P53.agc:1919
//		CAF	DISPGYRO	# DISPLAY GYRO TORQ ANGLES V 06N93
// slot 15967
                if slot <> 15967 or instruction <> 14027 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1920
//		TC	BANKCALL
// slot 15968
                if slot <> 15968 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[957] to agcAotUnit957@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1921
//		CADR	GOFLASH
// slot 15969
    15969, 17020
)).

// bank 15, slots 15970-15973
function agcAotUnit958 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15971 {
        if slot <= 15970 {
// P51-P53.agc:1922
//		TC	GOTOPOOH	# V34 -- TERMINATE
// slot 15970
            if slot <> 15970 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1923
//		TCF	5DEGTEST	# VB33 -- PROCEED TO COARSE OR FINE
// slot 15971
            if slot <> 15971 or instruction <> 5733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5733, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15972 {
// P51-P53.agc:1924
//		TCF	P57POST +1	# VB32 -- RECYCLE, MAYBE RE-ALIGN
// slot 15972
            if slot <> 15972 or instruction <> 5767 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5767, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:1925
//
// P51-P53.agc:1926
//5DEGTEST	TC	INTPRET		# IF ANGLES GREATER THAN 5 DEGS, DO COARSE
// slot 15973
            if slot <> 15973 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[958] to agcAotUnit958@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1927
//		VLOAD	BOV
// slot 15974
    15974, 33018,
// P51-P53.agc:1928
//			OGC
// slot 15975
    15975, 3008,
// P51-P53.agc:1929
//			SURFSUP
// slot 15976
    15976, 27858,
// P51-P53.agc:1930
//SURFSUP		STORE	OGCT
// slot 15977
    15977, 3024,
// P51-P53.agc:1931
//		V/SC	BOV
// slot 15978
    15978, 32962,
// P51-P53.agc:1932
//			5DEGREES
// slot 15979
    15979, 25360,
// P51-P53.agc:1933
//			COATRIM
// slot 15980
    15980, 27992,
// P51-P53.agc:1934
//		SSP	GOTO
// slot 15981
    15981, 43186,
// P51-P53.agc:1935
//			QMIN
// slot 15982
    15982, 3020,
// P51-P53.agc:1936
//			SURFDISP
// slot 15983
    15983, 27874,
// P51-P53.agc:1937
//# Page 972
// P51-P53.agc:1938
//			JUSTTRIM	# ANGLES LESS THAN 5 DEG, DO GYRO TORQ
// slot 15984
    15984, 27694,
// P51-P53.agc:1939
//
// P51-P53.agc:1940
//SURFDISP	EXIT
// slot 15985
    15985, 65532
)).

// bank 15, slots 15986-15986
function agcAotUnit959 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1941
//		TC	PHASCHNG
// slot 15986
    if slot <> 15986 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[959] to agcAotUnit959@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1942
//		OCT	04024
// slot 15987
    15987, 4136
)).

// bank 15, slots 15988-15988
function agcAotUnit960 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1943
//
// P51-P53.agc:1944
//		TC	INTPRET
// slot 15988
    if slot <> 15988 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[960] to agcAotUnit960@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1945
//		AXC,1	AXC,2
// slot 15989
    15989, 62688,
// P51-P53.agc:1946
//			XSMD
// slot 15990
    15990, 3852,
// P51-P53.agc:1947
//			REFSMMAT
// slot 15991
    15991, 1974,
// P51-P53.agc:1948
//		SET	CALL
// slot 15992
    15992, 37912,
// P51-P53.agc:1949
//			REFSMFLG
// slot 15993
    15993, 1636,
// P51-P53.agc:1950
//			MATMOVE
// slot 15994
    15994, 26110,
// P51-P53.agc:1951
//		EXIT
// slot 15995
    15995, 65532
)).

// bank 15, slots 15996-16003
function agcAotUnit961 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15999 {
        if slot <= 15997 {
            if slot <= 15996 {
// P51-P53.agc:1952
//		CCS	OPTION2		# IF OPTION ZERO DO FINISH
// slot 15996
                if slot <> 15996 or instruction <> 4709 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1953
//		TCF	B2F8
// slot 15997
                if slot <> 15997 or instruction <> 5759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5759, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15998 {
// P51-P53.agc:1954
//		TCF	P57POST +1
// slot 15998
                if slot <> 15998 or instruction <> 5767 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5767, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1955
//
// P51-P53.agc:1956
//B2F8		CAF	INITABIT	# IF INITIAL FLAG SET, RE-CYCLE.
// slot 15999
                if slot <> 15999 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 16001 {
            if slot <= 16000 {
// P51-P53.agc:1957
//		MASK	FLAGWRD8
// slot 16000
                if slot <> 16000 or instruction <> 28740 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 68).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1958
//		CCS	A
// slot 16001
                if slot <> 16001 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16002 {
// P51-P53.agc:1959
//		TCF	P57JUMP		# IT'S SET
// slot 16002
                if slot <> 16002 or instruction <> 6001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6001, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1960
//		TC	INTPRET
// slot 16003
                if slot <> 16003 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[961] to agcAotUnit961@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1961
//		CALL
// slot 16004
    16004, 65320,
// P51-P53.agc:1962
//			REFMF		# GO GET ATTITUDE VEC IN MF(YNBSAV,XNBSAV)
// slot 16005
    16005, 28300,
// P51-P53.agc:1963
//P57POST		EXIT
// slot 16006
    16006, 65532
)).

// bank 15, slots 16007-16008
function agcAotUnit962 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16007 {
// P51-P53.agc:1964
//		CAF	OCT14		# DISPLAY V50N25 CHK CODE 14
// slot 16007
        if slot <> 16007 or instruction <> 15337 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3049), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:1965
//		TC	BANKCALL
// slot 16008
        if slot <> 16008 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[962] to agcAotUnit962@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1966
//		CADR	GOPERF1
// slot 16009
    16009, 17190
)).

// bank 15, slots 16010-16017
function agcAotUnit963 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16013 {
        if slot <= 16011 {
            if slot <= 16010 {
// P51-P53.agc:1967
//		TCF	GOTOPOOH	# VB34 -- TERMINATE
// slot 16010
                if slot <> 16010 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1968
//		TCF	P57JUMP		# VB33 -- PROCEED TO RE-ALIGN
// slot 16011
                if slot <> 16011 or instruction <> 6001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6001, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16012 {
// P51-P53.agc:1969
//		CS	BIT2		# TEST TO SEE IF ALIGNED BY OPTION 2
// slot 16012
                if slot <> 16012 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1970
//		AD 	OPTION2
// slot 16013
                if slot <> 16013 or instruction <> 25189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16015 {
            if slot <= 16014 {
// P51-P53.agc:1971
//		EXTEND
// slot 16014
                if slot <> 16014 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1972
//		BZF	+2		# YES -- GO CALCULATE LANDING SITE
// slot 16015
                if slot <> 16015 or instruction <> 5777 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5777, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16016 {
// P51-P53.agc:1973
//		TCF	GOTOPOOH	# NO -- EXIT P57
// slot 16016
                if slot <> 16016 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:1974
//		TC	PHASCHNG	# RESTART PLACE
// slot 16017
                if slot <> 16017 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[963] to agcAotUnit963@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1975
//		OCT	04024
// slot 16018
    16018, 4136
)).

// bank 15, slots 16019-16019
function agcAotUnit964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:1976
//		TC	INTPRET
// slot 16019
    if slot <> 16019 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[964] to agcAotUnit964@.

agcAotInstallSourceRope(list(
// P51-P53.agc:1977
//		VLOAD	CALL		# USE GNB
// slot 16020
    16020, 38138,
// P51-P53.agc:1978
//			GSAV
// slot 16021
    16021, 2354,
// P51-P53.agc:1979
//			CDU*NBSM	# GO TO SM COORDS
// slot 16022
    16022, 40802,
// P51-P53.agc:1980
//		VXM	SET		#	ON MOON SO SET LUNAFLAG
// slot 16023
    16023, 35978,
// P51-P53.agc:1981
//			REFSMMAT	#	G(REF) = (REFSMMAT)T (NBSM)GNB
// slot 16024
    16024, 1976,
// P51-P53.agc:1982
//			LUNAFLAG
// slot 16025
    16025, 1638,
// P51-P53.agc:1983
//		PDVL	ABVAL
// slot 16026
    16026, 42650,
// P51-P53.agc:1984
//			RLS
// slot 16027
    16027, 2086,
// P51-P53.agc:1985
//		VXSC	STADR
// slot 16028
    16028, 38626,
// P51-P53.agc:1986
//		STORE	ALPHAV		# ALPHAV = RLSMAG * G(REF)
// slot 16029
    16029, 63434,
// P51-P53.agc:1987
//		CLEAR	RTB
// slot 16030
    16030, 39960,
// P51-P53.agc:1988
//# Page 973
// P51-P53.agc:1989
//			ERADFLAG
// slot 16031
    16031, 868,
// P51-P53.agc:1990
//			LOADTIME
// slot 16032
    16032, 18166,
// P51-P53.agc:1991
//		CALL
// slot 16033
    16033, 65320,
// P51-P53.agc:1992
//			N89DISP		# SUBROUTINE TO CALC LS AND GIVE RLS BACK
// slot 16034
    16034, 25164,
// P51-P53.agc:1993
//		STORE	RN		# RN=RLS B-29 = LM POSITION
// slot 16035
    16035, 1314,
// P51-P53.agc:1994
//		VSL2	PDDL		# R-TO-RP GETS RLS B-27 AT 0-50 IN PDLIST
// slot 16036
    16036, 54740,
// P51-P53.agc:1995
//			GDT/2 +4	# TIME TEMP STORED IN N89DISP
// slot 16037
    16037, 1350,
// P51-P53.agc:1996
//		PUSH			# TIME AT 6-7 IN PDLIST
// slot 16038
    16038, 65292,
// P51-P53.agc:1997
//		STCALL	PIPTIME		# PIPTIME = LM STATE TIME
// slot 16039
    16039, 30010,
// P51-P53.agc:1998
//			R-TO-RP
// slot 16040
    16040, 42864,
// P51-P53.agc:1999
//		STORE	RLS		# RLS IN MOON-FIXED COORDS
// slot 16041
    16041, 2086,
// P51-P53.agc:2000
//		EXIT
// slot 16042
    16042, 65532
)).

// bank 15, slots 16043-16043
function agcAotUnit965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2001
//		TCF	GOTOPOOH	# EXIT P57
// slot 16043
    if slot <> 16043 or instruction <> 7169 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7169, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[965] to agcAotUnit965@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2002
//
// P51-P53.agc:2003
//# Page 974
// P51-P53.agc:2004
//# COARSE AND FINE ALIGN IMU
// P51-P53.agc:2005
//
// P51-P53.agc:2006
//COATRIM		AXC,1	AXC,2
// slot 16044
    16044, 62688,
// P51-P53.agc:2007
//			XDC
// slot 16045
    16045, 2920,
// P51-P53.agc:2008
//			XSM
// slot 16046
    16046, 2884,
// P51-P53.agc:2009
//		CALL
// slot 16047
    16047, 65320,
// P51-P53.agc:2010
//			MATMOVE
// slot 16048
    16048, 26110,
// P51-P53.agc:2011
//		CALL
// slot 16049
    16049, 65320,
// P51-P53.agc:2012
//			CDUTRIG
// slot 16050
    16050, 40638,
// P51-P53.agc:2013
//		CALL
// slot 16051
    16051, 65320,
// P51-P53.agc:2014
//			CALCSMSC
// slot 16052
    16052, 16432,
// P51-P53.agc:2015
//		CALL
// slot 16053
    16053, 65320,
// P51-P53.agc:2016
//			CALCGA
// slot 16054
    16054, 40406,
// P51-P53.agc:2017
//		BOFF	EXIT
// slot 16055
    16055, 65048,
// P51-P53.agc:2018
//			INITALGN	# IF INITIAL ALIGNMENT DISPLAY FINAL
// slot 16056
    16056, 4570,
// P51-P53.agc:2019
//			CORSIT		# GIMBAL ANGLES IF COARSE ANGLES GREATER
// slot 16057
    16057, 28038
)).

// bank 15, slots 16058-16059
function agcAotUnit966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16058 {
// P51-P53.agc:2020
//		CAF	V06N22		# THAN 5 DEGREES
// slot 16058
        if slot <> 16058 or instruction <> 14856 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:2021
//		TC	BANKCALL
// slot 16059
        if slot <> 16059 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[966] to agcAotUnit966@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2022
//		CADR	GOFLASH
// slot 16060
    16060, 17020
)).

// bank 15, slots 16061-16063
function agcAotUnit967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16061 {
// P51-P53.agc:2023
//		TC	GOTOPOOH
// slot 16061
        if slot <> 16061 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16062 {
// P51-P53.agc:2024
//		TCF	+2
// slot 16062
            if slot <> 16062 or instruction <> 5824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2025
//		TCF	-5
// slot 16063
            if slot <> 16063 or instruction <> 5818 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5818, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[967] to agcAotUnit967@.

// bank 15, slots 16064-16064
function agcAotUnit968 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2026
//		TC	PHASCHNG
// slot 16064
    if slot <> 16064 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[968] to agcAotUnit968@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2027
//		OCT	04024
// slot 16065
    16065, 4136
)).

// bank 15, slots 16066-16066
function agcAotUnit969 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2028
//
// P51-P53.agc:2029
//		TC	INTPRET
// slot 16066
    if slot <> 16066 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[969] to agcAotUnit969@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2030
//CORSIT		CALL
// slot 16067
    16067, 65320,
// P51-P53.agc:2031
//			COARSE
// slot 16068
    16068, 26346,
// P51-P53.agc:2032
//		CALL
// slot 16069
    16069, 65320,
// P51-P53.agc:2033
//			NCOARSE
// slot 16070
    16070, 26372,
// P51-P53.agc:2034
//		CALL
// slot 16071
    16071, 65320,
// P51-P53.agc:2035
//			GYROTRIM
// slot 16072
    16072, 27640,
// P51-P53.agc:2036
//		GOTO
// slot 16073
    16073, 65360,
// P51-P53.agc:2037
//			SURFDISP
// slot 16074
    16074, 27874,
// P51-P53.agc:2038
//DISPGYRO	VN	0693
// slot 16075
    16075, 1722
)).

// bank 15, slots 16076-16076
function agcAotUnit970 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2039
//
// P51-P53.agc:2040
//# Page 975
// P51-P53.agc:2041
//# LUNAR SURFACE IMU ALIGNMENT PROGRAM
// P51-P53.agc:2042
//
// P51-P53.agc:2043
//P57		TC	BANKCALL	# IS ISS ON -- IF NOT, IMUCHK WILL SEND
// slot 16076
    if slot <> 16076 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[970] to agcAotUnit970@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2044
//		CADR	IMUCHK		# ALARM CODE 210 AND EXIT VIA GOTOPOOH
// slot 16077
    16077, 28500
)).

// bank 15, slots 16078-16081
function agcAotUnit971 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16079 {
        if slot <= 16078 {
// P51-P53.agc:2045
//
// P51-P53.agc:2046
//		CAF	THREE		# JAM REFSMMAT OPTION 3 FOR INITIAL DISP.
// slot 16078
            if slot <> 16078 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2047
//		TS	OPTION2
// slot 16079
            if slot <> 16079 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16080 {
// P51-P53.agc:2048
//P57OPT		CAF	BIT1
// slot 16080
            if slot <> 16080 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2049
//		TC	BANKCALL
// slot 16081
            if slot <> 16081 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[971] to agcAotUnit971@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2050
//		CADR	GOPERF4R	# FLASH V04N06 FOR ALIGNMENT CODE
// slot 16082
    16082, 17302
)).

// bank 15, slots 16083-16086
function agcAotUnit972 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16084 {
        if slot <= 16083 {
// P51-P53.agc:2051
//		TC	GOTOPOOH	# V34 TERMINATE
// slot 16083
            if slot <> 16083 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2052
//		TCF	ALIGNOPT	# V33 PROCEED
// slot 16084
            if slot <> 16084 or instruction <> 5849 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5849, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16085 {
// P51-P53.agc:2053
//		TCF	P57OPT		# V32 RECYCLE
// slot 16085
            if slot <> 16085 or instruction <> 5840 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5840, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2054
//
// P51-P53.agc:2055
//		TC	PHASCHNG
// slot 16086
            if slot <> 16086 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[972] to agcAotUnit972@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2056
//		OCT	00014
// slot 16087
    16087, 24
)).

// bank 15, slots 16088-16091
function agcAotUnit973 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16089 {
        if slot <= 16088 {
// P51-P53.agc:2057
//		TC	ENDOFJOB
// slot 16088
            if slot <> 16088 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2058
//
// P51-P53.agc:2059
//ALIGNOPT	CA	OPTION2
// slot 16089
            if slot <> 16089 or instruction <> 12901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 613).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16090 {
// P51-P53.agc:2060
//		MASK	THREE
// slot 16090
            if slot <> 16090 or instruction <> 31909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                if fixedOperand = 3 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2061
//		INDEX	A
// slot 16091
            if slot <> 16091 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[973] to agcAotUnit973@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2062
//		TCF	+1
// slot 16092
    16092, 11706
)).

// bank 15, slots 16093-16096
function agcAotUnit974 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16094 {
        if slot <= 16093 {
// P51-P53.agc:2063
//		TCF	TDISP		# OPTION 4 LS ORIENTATION
// slot 16093
            if slot <> 16093 or instruction <> 5864 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5864, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2064
//		TCF	PACKOPTN	# OPTION 1 PREFERRED
// slot 16094
            if slot <> 16094 or instruction <> 5897 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5897, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16095 {
// P51-P53.agc:2065
//		TCF	P57OPT		# OPTION 2 INVALID IN P57, RECYCLE
// slot 16095
            if slot <> 16095 or instruction <> 5840 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5840, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2066
//		TC	INTPRET		# OPTION 3 REFSMMAT
// slot 16096
            if slot <> 16096 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[974] to agcAotUnit974@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2067
//		AXC,1	AXC,2		# JAM REFSMMAT IN XSMD LOC
// slot 16097
    16097, 62688,
// P51-P53.agc:2068
//			REFSMMAT
// slot 16098
    16098, 1974,
// P51-P53.agc:2069
//			XSMD
// slot 16099
    16099, 3852,
// P51-P53.agc:2070
//		CALL
// slot 16100
    16100, 65320,
// P51-P53.agc:2071
//			MATMOVE
// slot 16101
    16101, 26110,
// P51-P53.agc:2072
//		GOTO
// slot 16102
    16102, 65360,
// P51-P53.agc:2073
//			PACKOPTN -1
// slot 16103
    16103, 28176
)).

// bank 15, slots 16104-16104
function agcAotUnit975 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2074
//
// P51-P53.agc:2075
//TDISP		TC	INTPRET
// slot 16104
    if slot <> 16104 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[975] to agcAotUnit975@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2076
//		DLOAD
// slot 16105
    16105, 65482,
// P51-P53.agc:2077
//			TIG		# LOAD ASCENT TIME FOR DISPLAY
// slot 16106
    16106, 3652,
// P51-P53.agc:2078
//P57A		STORE	DSPTEM1
// slot 16107
    16107, 1100,
// P51-P53.agc:2079
//		EXIT
// slot 16108
    16108, 65532
)).

// bank 15, slots 16109-16110
function agcAotUnit976 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16109 {
// P51-P53.agc:2080
//P57AA		CAF	V06N34*		# DISPLAY TALIGN, TALIGN : DSPTEM1
// slot 16109
        if slot <> 16109 or instruction <> 13432 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1144), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:2081
//		TC	BANKCALL
// slot 16110
        if slot <> 16110 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[976] to agcAotUnit976@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2082
//		CADR	GOFLASH
// slot 16111
    16111, 17020
)).

// bank 15, slots 16112-16115
function agcAotUnit977 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16113 {
        if slot <= 16112 {
// P51-P53.agc:2083
//		TCF	GOTOPOOH	# V34 -- TERMINATE
// slot 16112
            if slot <> 16112 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2084
//		TCF 	+2
// slot 16113
            if slot <> 16113 or instruction <> 5875 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5875, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16114 {
// P51-P53.agc:2085
//		TCF	P57AA		# VB32 -- RECYCLE
// slot 16114
            if slot <> 16114 or instruction <> 5869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2086
//
// P51-P53.agc:2087
//		TC	INTPRET
// slot 16115
            if slot <> 16115 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[977] to agcAotUnit977@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2088
//		RTB	PDDL
// slot 16116
    16116, 54584,
// P51-P53.agc:2089
//			LOADTIME	# PUSH CURRENT TIME AND PICK UP KEY IN
// slot 16117
    16117, 18166,
// P51-P53.agc:2090
//			DSPTEM1
// slot 16118
    16118, 1100,
// P51-P53.agc:2091
//# Page 976
// P51-P53.agc:2092
//		BZE	PDDL
// slot 16119
    16119, 54616,
// P51-P53.agc:2093
//			P57C		# IF KEY IN TIME ZERO - TALIGN=CURRENT TIME
// slot 16120
    16120, 28160,
// P51-P53.agc:2094
//		DSU	BPL		# NOT ZERO SO EXCHANGE PD WITH DSPTEM1
// slot 16121
    16121, 42026,
// P51-P53.agc:2095
//			DSPTEM1
// slot 16122
    16122, 1100,
// P51-P53.agc:2096
//			P57C
// slot 16123
    16123, 28160,
// P51-P53.agc:2097
//		DLOAD	STADR		# IF KEYIN TIME GREATER THAN CURRENT TIME
// slot 16124
    16124, 38602,
// P51-P53.agc:2098
//		STORE	TIG		# STORE IT IN TIG
// slot 16125
    16125, 61882,
// P51-P53.agc:2099
//		STCALL	TALIGN
// slot 16126
    16126, 31738,
// P51-P53.agc:2100
//			P57D
// slot 16127
    16127, 28164,
// P51-P53.agc:2101
//P57C		DLOAD	STADR
// slot 16128
    16128, 38602,
// P51-P53.agc:2102
//		STORE	TALIGN
// slot 16129
    16129, 62468,
// P51-P53.agc:2103
//P57D		STCALL	TDEC1
// slot 16130
    16130, 28738,
// P51-P53.agc:2104
//			LEMPREC		# COMPUTE DESIRED IMU ORIENTATION STORE
// slot 16131
    16131, 23646,
// P51-P53.agc:2105
//		VLOAD	UNIT		# IN X,Y,ZSMD
// slot 16132
    16132, 44794,
// P51-P53.agc:2106
//			RATT
// slot 16133
    16133, 2,
// P51-P53.agc:2107
//		STCALL	XSMD
// slot 16134
    16134, 32526,
// P51-P53.agc:2108
//			LSORIENT
// slot 16135
    16135, 9238,
// P51-P53.agc:2109
//		EXIT
// slot 16136
    16136, 65532
)).

// bank 15, slots 16137-16153
function agcAotUnit978 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16144 {
        if slot <= 16140 {
            if slot <= 16138 {
                if slot <= 16137 {
// P51-P53.agc:2110
//PACKOPTN	CAF	ZERO		# PACK FLAG BITS FOR OPTION DISPLAY
// slot 16137
                    if slot <> 16137 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2111
//		TS	OPTION1 +1	# JAM ZERO IN ALIGNMENT OPTION
// slot 16138
                    if slot <> 16138 or instruction <> 23141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23141, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16139 {
// P51-P53.agc:2112
//		TS	OPTION1 +2	# INITIALIZE FLAG BIT CONFIGURATION
// slot 16139
                    if slot <> 16139 or instruction <> 23142 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23142, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2113
//		CAF	REFSMBIT
// slot 16140
                    if slot <> 16140 or instruction <> 14815 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16142 {
                if slot <= 16141 {
// P51-P53.agc:2114
//		MASK	FLAGWRD3	# REFSMFLG
// slot 16141
                    if slot <> 16141 or instruction <> 28735 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2115
//		CCS	A
// slot 16142
                    if slot <> 16142 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16143 {
// P51-P53.agc:2116
//		CAF	BIT7		# SET
// slot 16143
                    if slot <> 16143 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2117
//		ADS	OPTION1 +2	# CLEAR -- JUST ZERO
// slot 16144
                    if slot <> 16144 or instruction <> 11878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 614).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16148 {
            if slot <= 16146 {
                if slot <= 16145 {
// P51-P53.agc:2118
//		CAF	ATTFLBIT
// slot 16145
                    if slot <> 16145 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2119
//		MASK	FLAGWRD6	# ATTFLG
// slot 16146
                    if slot <> 16146 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16147 {
// P51-P53.agc:2120
//		CCS	A
// slot 16147
                    if slot <> 16147 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2121
//		CAF	BIT4		# SET
// slot 16148
                    if slot <> 16148 or instruction <> 14824 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 16150 {
                if slot <= 16149 {
// P51-P53.agc:2122
//		ADS	OPTION1 +2	# CLEAR -- ZERO IN A
// slot 16149
                    if slot <> 16149 or instruction <> 11878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 614).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2123
//		CAF	BIT4
// slot 16150
                    if slot <> 16150 or instruction <> 14824 { return choose false if checkOnly else -1. }
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
                if slot <= 16151 {
// P51-P53.agc:2124
//		TS	OPTION1		# JAM 00010 IN OPTION1 FOR CHECK LIST
// slot 16151
                    if slot <> 16151 or instruction <> 23140 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23140, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16152 {
// P51-P53.agc:2125
//
// P51-P53.agc:2126
//DSPOPTN		CAF	VB05N06		# DISPLAY OPTION CODE AND FLAG BITS
// slot 16152
                        if slot <> 16152 or instruction <> 14249 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1961), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P51-P53.agc:2127
//		TC	BANKCALL
// slot 16153
                        if slot <> 16153 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[978] to agcAotUnit978@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2128
//		CADR	GOFLASH
// slot 16154
    16154, 17020
)).

// bank 15, slots 16155-16170
function agcAotUnit979 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16162 {
        if slot <= 16158 {
            if slot <= 16156 {
                if slot <= 16155 {
// P51-P53.agc:2129
//		TCF	GOTOPOOH	# VB34 -- TERMINATE
// slot 16155
                    if slot <> 16155 or instruction <> 7169 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7169, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2130
//		TCF	+2		# V33 -- PROCEED
// slot 16156
                    if slot <> 16156 or instruction <> 5918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16157 {
// P51-P53.agc:2131
//		TCF	DSPOPTN		# V32 -- RECYCLE
// slot 16157
                    if slot <> 16157 or instruction <> 5912 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5912, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2132
//
// P51-P53.agc:2133
//		CAF	REFSMBIT
// slot 16158
                    if slot <> 16158 or instruction <> 14815 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16160 {
                if slot <= 16159 {
// P51-P53.agc:2134
//		MASK	FLAGWRD3
// slot 16159
                    if slot <> 16159 or instruction <> 28735 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2135
//		CCS	A
// slot 16160
                    if slot <> 16160 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16161 {
// P51-P53.agc:2136
//		TCF	GETLMATT	# SET, GO COMPUTE LM ATTITUDE
// slot 16161
                    if slot <> 16161 or instruction <> 5985 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5985, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2137
//		CAF	ATTFLBIT	# CLEAR -- CHECK ATTFLAG FOR STORED ATTITUDE.
// slot 16162
                    if slot <> 16162 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 16166 {
            if slot <= 16164 {
                if slot <= 16163 {
// P51-P53.agc:2138
//		MASK	FLAGWRD6
// slot 16163
                    if slot <> 16163 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2139
//		CCS	A
// slot 16164
                    if slot <> 16164 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16165 {
// P51-P53.agc:2140
//		TCF	BYLMATT		# ALLFLG SET, CHK OPTION FOR GRAVITY COMP
// slot 16165
                    if slot <> 16165 or instruction <> 5989 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5989, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2141
//		CAF	BIT2		# SEE IF OPTION 2 OR 3
// slot 16166
                    if slot <> 16166 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 16168 {
                if slot <= 16167 {
// P51-P53.agc:2142
//# Page 977
// P51-P53.agc:2143
//		MASK	OPTION2
// slot 16167
                    if slot <> 16167 or instruction <> 29285 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 613).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2144
//		CCS	A
// slot 16168
                    if slot <> 16168 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16169 {
// P51-P53.agc:2145
//		TCF	BYLMATT		# OPTION 2 OR 3 BUT DON'T HAVE ATTITUDE
// slot 16169
                    if slot <> 16169 or instruction <> 5989 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5989, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P51-P53.agc:2146
//		TC	ALARM		# OPTION INCONSISTENT WITH FLAGS -- ALARM 701
// slot 16170
                    if slot <> 16170 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[979] to agcAotUnit979@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2147
//		OCT	701
// slot 16171
    16171, 898
)).

// bank 15, slots 16172-16173
function agcAotUnit980 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16172 {
// P51-P53.agc:2148
//		CAF	VB05N09		# DISPLAY ALARM FOR ACTION
// slot 16172
        if slot <> 16172 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:2149
//		TC	BANKCALL
// slot 16173
        if slot <> 16173 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[980] to agcAotUnit980@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2150
//		CADR	GOFLASH
// slot 16174
    16174, 17020
)).

// bank 15, slots 16175-16177
function agcAotUnit981 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16175 {
// P51-P53.agc:2151
//		TCF	GOTOPOOH	# VB34 -- TERMINATE
// slot 16175
        if slot <> 16175 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16176 {
// P51-P53.agc:2152
//		TCF	DSPOPTN		# V33 -- PROCEED *********TEMPORARY
// slot 16176
            if slot <> 16176 or instruction <> 5912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5912, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2153
//		TCF	DSPOPTN		# VB32 -- RECYCLE TO OPTION DISPLAY V 05N06
// slot 16177
            if slot <> 16177 or instruction <> 5912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5912, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[981] to agcAotUnit981@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2154
//
// P51-P53.agc:2155
//# Page 978
// P51-P53.agc:2156
//# TRANSFORM VEC1,2 FROM MOON FIXED TO REF AND JAM BACK IN VEC1,2
// P51-P53.agc:2157
//
// P51-P53.agc:2158
//MFREF		STQ	SETPD
// slot 16178
    16178, 33056,
// P51-P53.agc:2159
//			QMAJ
// slot 16179
    16179, 3020,
// P51-P53.agc:2160
//			0
// slot 16180
    16180, 2,
// P51-P53.agc:2161
//		RTB
// slot 16181
    16181, 65336,
// P51-P53.agc:2162
//			LOADTIME
// slot 16182
    16182, 18166,
// P51-P53.agc:2163
//		STOVL	TSIGHT
// slot 16183
    16183, 24292,
// P51-P53.agc:2164
//			VEC1
// slot 16184
    16184, 2982,
// P51-P53.agc:2165
//		PDDL	PUSH
// slot 16185
    16185, 34474,
// P51-P53.agc:2166
//			TSIGHT
// slot 16186
    16186, 3812,
// P51-P53.agc:2167
//		CALL
// slot 16187
    16187, 65320,
// P51-P53.agc:2168
//			RP-TO-R
// slot 16188
    16188, 47004,
// P51-P53.agc:2169
//		STOVL	VEC1
// slot 16189
    16189, 23462,
// P51-P53.agc:2170
//			VEC2
// slot 16190
    16190, 2994,
// P51-P53.agc:2171
//		SETPD	PDDL
// slot 16191
    16191, 54530,
// P51-P53.agc:2172
//			0
// slot 16192
    16192, 2,
// P51-P53.agc:2173
//			TSIGHT
// slot 16193
    16193, 3812,
// P51-P53.agc:2174
//		PUSH	CALL
// slot 16194
    16194, 37900,
// P51-P53.agc:2175
//			RP-TO-R
// slot 16195
    16195, 47004,
// P51-P53.agc:2176
//		STCALL	VEC2
// slot 16196
    16196, 31666,
// P51-P53.agc:2177
//			QMAJ
// slot 16197
    16197, 3020,
// P51-P53.agc:2178
//
// P51-P53.agc:2179
//# Page 979
// P51-P53.agc:2180
//# COMPUTE LM ATTITUDE IN MOON FIXED COORDINATES USING REFSMMAT AND
// P51-P53.agc:2181
//# STORE IN YNBSAV AND ZNBSAV.
// P51-P53.agc:2182
//
// P51-P53.agc:2183
//REFMF		STQ	CALL
// slot 16198
    16198, 37920,
// P51-P53.agc:2184
//			QMAJ
// slot 16199
    16199, 3020,
// P51-P53.agc:2185
//			CDUTRIG		# GET SIN AND COS OF CDUS
// slot 16200
    16200, 40638,
// P51-P53.agc:2186
//		RTB	SETPD
// slot 16201
    16201, 33080,
// P51-P53.agc:2187
//			LOADTIME
// slot 16202
    16202, 18166,
// P51-P53.agc:2188
//			0
// slot 16203
    16203, 2,
// P51-P53.agc:2189
//		STCALL	TSIGHT
// slot 16204
    16204, 32484,
// P51-P53.agc:2190
//			CALCSMSC	# GET YNB IN SM
// slot 16205
    16205, 16432,
// P51-P53.agc:2191
//		VLOAD	VXM
// slot 16206
    16206, 50682,
// P51-P53.agc:2192
//			YNB
// slot 16207
    16207, 2934,
// P51-P53.agc:2193
//			REFSMMAT	# YNB TO REF
// slot 16208
    16208, 1976,
// P51-P53.agc:2194
//		UNIT	PDDL
// slot 16209
    16209, 54620,
// P51-P53.agc:2195
//			TSIGHT
// slot 16210
    16210, 3812,
// P51-P53.agc:2196
//		PUSH	CALL
// slot 16211
    16211, 37900,
// P51-P53.agc:2197
//			R-TO-RP
// slot 16212
    16212, 42864,
// P51-P53.agc:2198
//		STOVL	YNBSAV		# YNB TO MF
// slot 16213
    16213, 22846,
// P51-P53.agc:2199
//			ZNB
// slot 16214
    16214, 2946,
// P51-P53.agc:2200
//		VXM	UNIT
// slot 16215
    16215, 44682,
// P51-P53.agc:2201
//			REFSMMAT	# ZNB TO REF
// slot 16216
    16216, 1976,
// P51-P53.agc:2202
//		PDDL	PUSH
// slot 16217
    16217, 34474,
// P51-P53.agc:2203
//			TSIGHT
// slot 16218
    16218, 3812,
// P51-P53.agc:2204
//		CALL
// slot 16219
    16219, 65320,
// P51-P53.agc:2205
//			R-TO-RP		# ZNB TO MF
// slot 16220
    16220, 42864,
// P51-P53.agc:2206
//		STORE	ZNBSAV
// slot 16221
    16221, 2378,
// P51-P53.agc:2207
//		SETGO
// slot 16222
    16222, 65304,
// P51-P53.agc:2208
//			ATTFLAG
// slot 16223
    16223, 3132,
// P51-P53.agc:2209
//			QMAJ
// slot 16224
    16224, 3020
)).

// bank 15, slots 16225-16225
function agcAotUnit982 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2210
//
// P51-P53.agc:2211
//# Page 980
// P51-P53.agc:2212
//# BRANCH TO ALIGNMENT OPTION
// P51-P53.agc:2213
//
// P51-P53.agc:2214
//GETLMATT	TC	INTPRET
// slot 16225
    if slot <> 16225 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[982] to agcAotUnit982@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2215
//		CALL
// slot 16226
    16226, 65320,
// P51-P53.agc:2216
//			REFMF		# GO TRANSFORM TO MF IN YNBSAV, ZNBSAV
// slot 16227
    16227, 28300,
// P51-P53.agc:2217
//		EXIT
// slot 16228
    16228, 65532
)).

// bank 15, slots 16229-16229
function agcAotUnit983 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2218
//
// P51-P53.agc:2219
//BYLMATT		TC	UPFLAG		# SET INITIAL ALIGN FLAG
// slot 16229
    if slot <> 16229 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[983] to agcAotUnit983@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2220
//		ADRES	INITALGN
// slot 16230
    16230, 266
)).

// bank 15, slots 16231-16235
function agcAotUnit984 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16232 {
        if slot <= 16231 {
// P51-P53.agc:2221
//		CAF	BIT1
// slot 16231
            if slot <> 16231 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2222
//		MASK	OPTION2		# SEE IF OPTION 1 OR 3
// slot 16232
            if slot <> 16232 or instruction <> 29285 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 613).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16233 {
// P51-P53.agc:2223
//		CCS	A
// slot 16233
            if slot <> 16233 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16234 {
// P51-P53.agc:2224
//		TCF	GVDETER		# OPTION 1 OR 2, GET GRAVITY
// slot 16234
                if slot <> 16234 or instruction <> 5491 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5491, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:2225
//
// P51-P53.agc:2226
//ATTCHK		TC	PHASCHNG
// slot 16235
                if slot <> 16235 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[984] to agcAotUnit984@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2227
//		OCT	04024
// slot 16236
    16236, 4136
)).

// bank 15, slots 16237-16241
function agcAotUnit985 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16238 {
        if slot <= 16237 {
// P51-P53.agc:2228
//
// P51-P53.agc:2229
//		CAF	ATTFLBIT	# NOT 1 OR 3, CHECK ATTFLAG
// slot 16237
            if slot <> 16237 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2230
//		MASK	FLAGWRD6
// slot 16238
            if slot <> 16238 or instruction <> 28738 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 66).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16239 {
// P51-P53.agc:2231
//		CCS	A
// slot 16239
            if slot <> 16239 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16240 {
// P51-P53.agc:2232
//		TCF	P57OPT0		# GET ALIGNMENT VECS FOR OPTION 0
// slot 16240
                if slot <> 16240 or instruction <> 6013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:2233
//P57JUMP		TC	PHASCHNG
// slot 16241
                if slot <> 16241 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[985] to agcAotUnit985@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2234
//		OCT	04024
// slot 16242
    16242, 4136
)).

// bank 15, slots 16243-16243
function agcAotUnit986 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2235
//
// P51-P53.agc:2236
//		TC	DOWNFLAG	# ATTFLG CLEAR -- RESET INTALIGN FLAG
// slot 16243
    if slot <> 16243 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[986] to agcAotUnit986@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2237
//		ADRES	INITALGN
// slot 16244
    16244, 266
)).

// bank 15, slots 16245-16247
function agcAotUnit987 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16245 {
// P51-P53.agc:2238
//		CAF	THREE
// slot 16245
        if slot <> 16245 or instruction <> 15525 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3237), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16246 {
// P51-P53.agc:2239
//		MASK	OPTION2		# BRANCH ON OPTION CODE
// slot 16246
            if slot <> 16246 or instruction <> 29285 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 613).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2240
//		INDEX	A
// slot 16247
            if slot <> 16247 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[987] to agcAotUnit987@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2241
//		TCF	+1
// slot 16248
    16248, 12018
)).

// bank 15, slots 16249-16253
function agcAotUnit988 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16250 {
        if slot <= 16249 {
// P51-P53.agc:2242
//		TCF	P57OPT0		# OPTION IS 0
// slot 16249
            if slot <> 16249 or instruction <> 6013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6013, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2243
//		TCF	P57OPT1		# OPTION IS 1
// slot 16250
            if slot <> 16250 or instruction <> 6030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16251 {
// P51-P53.agc:2244
//		TCF	P57OPT2		# OPTION IS 2
// slot 16251
            if slot <> 16251 or instruction <> 6044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16252 {
// P51-P53.agc:2245
//		TCF	P57OPT3		# OPTION IS 3
// slot 16252
                if slot <> 16252 or instruction <> 6045 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6045, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:2246
//
// P51-P53.agc:2247
//# Page 981
// P51-P53.agc:2248
//# OPTION 0, GET TWO ATTITUDE VECS
// P51-P53.agc:2249
//
// P51-P53.agc:2250
//P57OPT0		TC	INTPRET
// slot 16253
                if slot <> 16253 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[988] to agcAotUnit988@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2251
//		VLOAD
// slot 16254
    16254, 65530,
// P51-P53.agc:2252
//			YNBSAV		# Y AND Z ATTITUDE WILL BE PUT IN REF
// slot 16255
    16255, 2366,
// P51-P53.agc:2253
//		STOVL	VEC1
// slot 16256
    16256, 23462,
// P51-P53.agc:2254
//			ZNBSAV
// slot 16257
    16257, 2378,
// P51-P53.agc:2255
//		STCALL	VEC2
// slot 16258
    16258, 31666,
// P51-P53.agc:2256
//			CDUTRIG
// slot 16259
    16259, 40638,
// P51-P53.agc:2257
//		CALL
// slot 16260
    16260, 65320,
// P51-P53.agc:2258
//			CALCSMSC	# COMPUTE SC AXIS WRT PRESENT SM
// slot 16261
    16261, 16432,
// P51-P53.agc:2259
//		VLOAD
// slot 16262
    16262, 65530,
// P51-P53.agc:2260
//			YNB
// slot 16263
    16263, 2934,
// P51-P53.agc:2261
//SAMETYP		STOVL	STARSAV1	# Y SC AXIS WRT PRESENT SM
// slot 16264
    16264, 23522,
// P51-P53.agc:2262
//			ZNB
// slot 16265
    16265, 2946,
// P51-P53.agc:2263
//		STCALL	STARSAV2	# Z SC AXIS WRT PRESENT SM
// slot 16266
    16266, 31726,
// P51-P53.agc:2264
//			MFREF		# TRANSFORM VEC1,2 FROM MF TO REF
// slot 16267
    16267, 28260,
// P51-P53.agc:2265
//		GOTO
// slot 16268
    16268, 65360,
// P51-P53.agc:2266
//			SURFLINE
// slot 16269
    16269, 27778
)).

// bank 15, slots 16270-16270
function agcAotUnit989 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2267
//
// P51-P53.agc:2268
//# OPTION 1, GET LANDING SITE AND Z-ATTITUDE VEC
// P51-P53.agc:2269
//
// P51-P53.agc:2270
//P57OPT1		TC	INTPRET
// slot 16270
    if slot <> 16270 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[989] to agcAotUnit989@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2271
//		VLOAD	UNIT
// slot 16271
    16271, 44794,
// P51-P53.agc:2272
//			RLS		# LANDING SITE VEC
// slot 16272
    16272, 2086,
// P51-P53.agc:2273
//		STOVL	VEC1
// slot 16273
    16273, 23462,
// P51-P53.agc:2274
//			ZNBSAV		# Z ATTITUDE VEC
// slot 16274
    16274, 2378,
// P51-P53.agc:2275
//		STCALL	VEC2
// slot 16275
    16275, 31666,
// P51-P53.agc:2276
//			CDUTRIG
// slot 16276
    16276, 40638,
// P51-P53.agc:2277
//		CALL
// slot 16277
    16277, 65320,
// P51-P53.agc:2278
//			CALCSMSC	# GET ZNB AXIS WRT PRES SM FOR STARSAV2
// slot 16278
    16278, 16432,
// P51-P53.agc:2279
//		VLOAD	CALL
// slot 16279
    16279, 38138,
// P51-P53.agc:2280
//			GSAV		# TRANS GSAV FROM NB TO SM FOR STARSAV1
// slot 16280
    16280, 2354,
// P51-P53.agc:2281
//			CDU*NBSM
// slot 16281
    16281, 40802,
// P51-P53.agc:2282
//		GOTO
// slot 16282
    16282, 65360,
// P51-P53.agc:2283
//			SAMETYP		# NOW DO SAME AS OPTION 0
// slot 16283
    16283, 28432
)).

// bank 15, slots 16284-16285
function agcAotUnit990 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16284 {
// P51-P53.agc:2284
//
// P51-P53.agc:2285
//# Page 982
// P51-P53.agc:2286
//# OPTION 2, GET TWO STAR SIGHTINGS
// P51-P53.agc:2287
//
// P51-P53.agc:2288
//P57OPT2		TCF	2STARS		# DO SIGHTING ON 2 STARS
// slot 16284
        if slot <> 16284 or instruction <> 5669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:2289
//
// P51-P53.agc:2290
//# OPTION 3, GET LANDING SITE VEC AND ONE STAR SIGHTING
// P51-P53.agc:2291
//
// P51-P53.agc:2292
//P57OPT3		TC	INTPRET
// slot 16285
        if slot <> 16285 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[990] to agcAotUnit990@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2293
//		VLOAD	UNIT
// slot 16286
    16286, 44794,
// P51-P53.agc:2294
//			RLS		# LANDING SITE VEC
// slot 16287
    16287, 2086,
// P51-P53.agc:2295
//		STORE	VEC1
// slot 16288
    16288, 2982,
// P51-P53.agc:2296
//		STOVL	VEC2		# DUMMY VEC2 FOR 2ND CATALOG STAR
// slot 16289
    16289, 23474,
// P51-P53.agc:2297
//			GSAV		# GRAVITY VEC NB
// slot 16290
    16290, 2354,
// P51-P53.agc:2298
//		CALL
// slot 16291
    16291, 65320,
// P51-P53.agc:2299
//			CDU*NBSM	# TRANS GSAV FROM NB TO SM FOR STARSAV1
// slot 16292
    16292, 40802,
// P51-P53.agc:2300
//		STCALL	STARSAV1
// slot 16293
    16293, 31714,
// P51-P53.agc:2301
//			MFREF		# STARSAV2 IS STORED AS 2ND OBSERVED STAR
// slot 16294
    16294, 28260,
// P51-P53.agc:2302
//		EXIT
// slot 16295
    16295, 65532
)).

// bank 15, slots 16296-16296
function agcAotUnit991 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2303
//		TCF	1STAR		# 1STAR GET VEC2, STARSAV2 GOES TO SURFLINE.
// slot 16296
    if slot <> 16296 or instruction <> 5671 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5671, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[991] to agcAotUnit991@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2304
//
// P51-P53.agc:2305
//VB05N06		VN	506
// slot 16297
    16297, 1292
)).

// bank 15, slots 16298-16302
function agcAotUnit992 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16299 {
        if slot <= 16298 {
// P51-P53.agc:2306
//
// P51-P53.agc:2307
//# Page 983
// P51-P53.agc:2308
//# CHECK IMODES30 TO VERIFY IMU IS ON
// P51-P53.agc:2309
//
// P51-P53.agc:2310
//IMUCHK		CS	IMODES30
// slot 16298
            if slot <> 16298 or instruction <> 17090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 706).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P51-P53.agc:2311
//		MASK	BIT9
// slot 16299
            if slot <> 16299 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 16300 {
// P51-P53.agc:2312
//		CCS	A		# IS IMU ON
// slot 16300
            if slot <> 16300 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16301 {
// P51-P53.agc:2313
//		TCF	+4		# YES
// slot 16301
                if slot <> 16301 or instruction <> 6065 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6065, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P51-P53.agc:2314
//
// P51-P53.agc:2315
//		TC	ALARM		# NO, SEND ALARM AND EXIT
// slot 16302
                if slot <> 16302 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[992] to agcAotUnit992@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2316
//		OCT	210
// slot 16303
    16303, 272
)).

// bank 15, slots 16304-16305
function agcAotUnit993 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16304 {
// P51-P53.agc:2317
//		TC	GOTOPOOH
// slot 16304
        if slot <> 16304 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P51-P53.agc:2318
//
// P51-P53.agc:2319
//		TC	UPFLAG
// slot 16305
        if slot <> 16305 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[993] to agcAotUnit993@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2320
//		ADRES	IMUSE		# SET IMUSE FLAG
// slot 16306
    16306, 14
)).

// bank 15, slots 16307-16307
function agcAotUnit994 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P51-P53.agc:2321
//
// P51-P53.agc:2322
//		TC	SWRETURN
// slot 16307
    if slot <> 16307 or instruction <> 2457 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2457, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[994] to agcAotUnit994@.

agcAotInstallSourceRope(list(
// P51-P53.agc:2323
//
// P51-P53.agc:2324
//		BANK	04
// P51-P53.agc:2325
//		SETLOC	AOTMARK2
// P51-P53.agc:2326
//		BANK
// P51-P53.agc:2327
//		COUNT*	$$/P57
// P51-P53.agc:2328
//
// P51-P53.agc:2329
//LSORIENT	STQ	VLOAD
// slot 6667
    6667, 64800,
// P51-P53.agc:2330
//			QMAJ
// slot 6668
    6668, 3020,
// P51-P53.agc:2331
//			RRECTCSM
// slot 6669
    6669, 1754,
// P51-P53.agc:2332
//		VXV	VXV
// slot 6670
    6670, 40250,
// P51-P53.agc:2333
//			VRECTCSM
// slot 6671
    6671, 1766,
// P51-P53.agc:2334
//			XSMD
// slot 6672
    6672, 3854,
// P51-P53.agc:2335
//		UNIT
// slot 6673
    6673, 65372,
// P51-P53.agc:2336
//		STORE	ZSMD
// slot 6674
    6674, 3878,
// P51-P53.agc:2337
//		VXV	UNIT
// slot 6675
    6675, 44602,
// P51-P53.agc:2338
//			XSMD
// slot 6676
    6676, 3854,
// P51-P53.agc:2339
//		STCALL	YSMD
// slot 6677
    6677, 32538,
// P51-P53.agc:2340
//			QMAJ
// slot 6678
    6678, 3020
)).

// no code for the lines below
// P51-P53.agc:2341
//
