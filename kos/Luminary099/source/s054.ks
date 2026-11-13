// P40-P47.agc
// bank 36, slots 33383-33383
function agcAotUnit2164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1
//# Copyright:	Public domain.
// P40-P47.agc:2
//# Filename:	P40-P47.agc
// P40-P47.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P40-P47.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// P40-P47.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P40-P47.agc:6
//# Assembler:	yaYUL
// P40-P47.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// P40-P47.agc:8
//# Website:	www.ibiblio.org/apollo.
// P40-P47.agc:9
//# Pages:	752-784
// P40-P47.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// P40-P47.agc:11
//#				Luminary131 file, using page
// P40-P47.agc:12
//#				images from Luminary 1A.
// P40-P47.agc:13
//#		2011-01-06 JL	Fixed interpretive indentation.
// P40-P47.agc:14
//#
// P40-P47.agc:15
//# This source code has been transcribed or otherwise adapted from
// P40-P47.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P40-P47.agc:17
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// P40-P47.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P40-P47.agc:19
//# in storage size and consequent reduction in image quality as well) are
// P40-P47.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P40-P47.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// P40-P47.agc:22
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// P40-P47.agc:23
//# actually created.
// P40-P47.agc:24
//#
// P40-P47.agc:25
//# Notations on the hardcopy document read, in part:
// P40-P47.agc:26
//#
// P40-P47.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P40-P47.agc:28
//#	16:27 JULY 14, 1969
// P40-P47.agc:29
//
// P40-P47.agc:30
//# Page 752
// P40-P47.agc:31
//# PROGRAM DESCRIPTION: P40BOTH		DECEMBER 22, 1966
// P40-P47.agc:32
//# MOD 03 BY ADLER KERMAN			MARCH 3, 1967
// P40-P47.agc:33
//# CALLED VIA JOB FROM V37E
// P40-P47.agc:34
//#
// P40-P47.agc:35
//# FUNCTIONAL DESCRIPTION
// P40-P47.agc:36
//#
// P40-P47.agc:37
//#	1)	TO COMPUTE A PREFERRED IMU ORIENTATION AND A PREFERRED VEHICLE ATTITUDE FOR A LM DPS
// P40-P47.agc:38
//#		THRUSTING MANEUVER.
// P40-P47.agc:39
//# 	(There is no item #2 in the original program listing --- RSB 2009.)
// P40-P47.agc:40
//#	3)	TO DO THE VEHICLE MANEUVER TO THE THRUSTING ATTITUDE.
// P40-P47.agc:41
//#	4)	TO CONTROL THE PGNCS DURING COUNTDOWN, IGNITION, THRUSTING, AND THRUST TERMINATION OF A
// P40-P47.agc:42
//#		PGNCS CONTROLLED DPS MANEUVER.
// P40-P47.agc:43
//#	5)	IN POSTBURN --- ZERO RENDEZVOUS COUNTER, MAINTAIN VG CALCULATIONS FOR POSSIBLE RCS MANEUVER,
// P40-P47.agc:44
//#		SET MAXIMUM DEADBAND IN DAP, RESET STEERLAW CSTEER TO ZERO.
// P40-P47.agc:45
//#
// P40-P47.agc:46
//#	NOTE:	P42, WHICH IS IN THIS LOG SECTION, DOES THE SAME FOR AN APS BURN, AND P41 DOES 1-3 FOR
// P40-P47.agc:47
//#		RCS PLUS DISPLAYS PARAMETERS FOR MANUAL CONTROL.
// P40-P47.agc:48
//#
// P40-P47.agc:49
//# SUBROUTINES USED
// P40-P47.agc:50
//#
// P40-P47.agc:51
//#	R02		IMU STATUS CHECK
// P40-P47.agc:52
//#	S40.1		COMPUTATION OF THRUST DIRECTION
// P40-P47.agc:53
//#	S40.13		LENGTH OF BURN
// P40-P47.agc:54
//#	S40.2,3		PREFERRED IMU ORIENTATION
// P40-P47.agc:55
//#	S40.8		X PRODUCT STEERING
// P40-P47.agc:56
//#	S40.9		LAMBERT VTOGAIN
// P40-P47.agc:57
//#	R60LEM		ATTITUDE MANEUVER
// P40-P47.agc:58
//#	LEMPREC		EXTRAPOLATE STATE VECTOR
// P40-P47.agc:59
//#	PREREAD		AVERAGE G, SERVICER
// P40-P47.agc:60
//#	ALLCOAST	DAP COASTING INITIALIZATION
// P40-P47.agc:61
//#	CLOKTASK	ERGO CLOCKJOB -- COUNT DOWN
// P40-P47.agc:62
//#	PHASCHANG, INTPRET, FLAGUP, FLAGDOWN, WAITLIST, LONGCALL, GOFLASH, GOFLASHR, GOPERF1, ALARM,
// P40-P47.agc:63
//#	PRIOLARM, GOTOPOOH, ENDOFJOB, BANKCALL, SETMAXDB, SETMINDB, CHECKMM, FLATOUT, OUTFLAT,
// P40-P47.agc:64
//#	KILLTASK, SGNAGREE, TPAGREE, ETC.
// P40-P47.agc:65
//#
// P40-P47.agc:66
//# RESTARTS VIA GROUP 4
// P40-P47.agc:67
//#
// P40-P47.agc:68
//# DISPLAYS
// P40-P47.agc:69
//#
// P40-P47.agc:70
//#	V50N25	203 A/P TO PGNCS, AUTO-THROTTLE MODE, AUTO ATTITUDE CONTROL
// P40-P47.agc:71
//#	V06N40	TTI, VG, DELTAVM (DISPLAYED ONCE/SECOND BY CLOKTASK)
// P40-P47.agc:72
//#	V50N99	PLEASE PERFORM ENGINE ON ENABLE
// P40-P47.agc:73
//#	V06N40	TG (TIME TO GO TO CUTOFF), VG, DELTAVM -- ONCE/SECOND
// P40-P47.agc:74
//#	V16N40	FINAL VALUES OF TG, VG, DELTAVM
// P40-P47.agc:75
//#	V16N85	COMP OF VG (BODY AXES) FOR POSS. RCS MANUAL MANEUVER
// P40-P47.agc:76
//#	V05N09	POSSIBLE ALARMS
// P40-P47.agc:77
//#	V50N07	PLEASE SELECT P00
// P40-P47.agc:78
//#
// P40-P47.agc:79
//# Page 753
// P40-P47.agc:80
//#	VIA R30
// P40-P47.agc:81
//#
// P40-P47.agc:82
//#	V06N44	HAPO, PERI, TFF
// P40-P47.agc:83
//#	V06N35	TIME TO PERIGEE, HMS
// P40-P47.agc:84
//#
// P40-P47.agc:85
//# ALARM OR ABORT EXIT MODES
// P40-P47.agc:86
//#
// P40-P47.agc:87
//#	PROGRAM ALARM, FLASHING DISPLAY OF ALARM CODE 1706 IF P40 SELECTED WITH DESCENT UNIT STAGED.
// P40-P47.agc:88
//#	V34E (TERMINATE) IS THE ONLY RESPONSE ACCEPTED.  TC GOTOPOOH.
// P40-P47.agc:89
//#
// P40-P47.agc:90
//#	PROGRAM ALARM, FLASH CODE 1703:  TIG LESS THAN 45 SECS AWAY.  V34E= GOTOPOOH OR V33E= SLIP
// P40-P47.agc:91
//#	TIG BY 45 SECS.
// P40-P47.agc:92
//#
// P40-P47.agc:93
//# ERASABLE INITIALIZATION
// P40-P47.agc:94
//#
// P40-P47.agc:95
//# DEBRIS
// P40-P47.agc:96
//#
// P40-P47.agc:97
//# OUTPUT
// P40-P47.agc:98
//#
// P40-P47.agc:99
//#	SEE SUBROUTINES E.G.:  S40.1, S40.2,3, S40.13, S40.8, S40.9, TRIMGIMB
// P40-P47.agc:100
//#	XDELVFLG = 1 FOR EXT DELV COMPUTATION
// P40-P47.agc:101
//#	         = 0 FOR AIMPT (LAMBERT COMP
// P40-P47.agc:102
//
// P40-P47.agc:103
//		COUNT*	$$/P40
// P40-P47.agc:104
//		EBANK=	WHICH
// P40-P47.agc:105
//
// P40-P47.agc:106
//		BANK	36
// P40-P47.agc:107
//		SETLOC	P40S
// P40-P47.agc:108
//		BANK
// P40-P47.agc:109
//
// P40-P47.agc:110
//P40LM		TC	PHASCHNG
// slot 33383
    if slot <> 33383 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2164] to agcAotUnit2164@.

agcAotInstallSourceRope(list(
// P40-P47.agc:111
//		OCT	04024
// slot 33384
    33384, 4136
)).

// bank 36, slots 33385-33391
function agcAotUnit2165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33387 {
        if slot <= 33385 {
// P40-P47.agc:112
//
// P40-P47.agc:113
//		CAF	P40ADRES	# INITIALIZATION FOR BURNBABY
// slot 33385
            if slot <> 33385 or instruction <> 13915 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1627), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33386 {
// P40-P47.agc:114
//		TS	WHICH
// slot 33386
                if slot <> 33386 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:115
//
// P40-P47.agc:116
//		CA	FLGWRD10
// slot 33387
                if slot <> 33387 or instruction <> 12358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 70).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33389 {
            if slot <= 33388 {
// P40-P47.agc:117
//		MASK	APSFLBIT
// slot 33388
                if slot <> 33388 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// P40-P47.agc:118
//		CCS	A
// slot 33389
                if slot <> 33389 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33390 {
// P40-P47.agc:119
//		TCF	P40ALM
// slot 33390
                if slot <> 33390 or instruction <> 5713 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5713, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:120
//		TC	BANKCALL	# GO DO IMU STATUS CHECK ROUTINE.
// slot 33391
                if slot <> 33391 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2165] to agcAotUnit2165@.

agcAotInstallSourceRope(list(
// P40-P47.agc:121
//		CADR	R02BOTH
// slot 33392
    33392, 9560
)).

// bank 36, slots 33393-33401
function agcAotUnit2166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33396 {
        if slot <= 33394 {
            if slot <= 33393 {
// P40-P47.agc:122
//
// P40-P47.agc:123
//		CS	DAPBOOLS	# INITIALIZE DVMON
// slot 33393
                if slot <> 33393 or instruction <> 16457 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 73).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:124
//		MASK	CSMDOCKD
// slot 33394
                if slot <> 33394 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 33395 {
// P40-P47.agc:125
//		CCS	A
// slot 33395
                if slot <> 33395 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:126
//		CAF	THRESH1
// slot 33396
                if slot <> 33396 or instruction <> 13328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1040), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33398 {
            if slot <= 33397 {
// P40-P47.agc:127
//		AD	THRESH3
// slot 33397
                if slot <> 33397 or instruction <> 25617 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1041), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:128
//		TS	DVTHRUSH
// slot 33398
                if slot <> 33398 or instruction <> 23209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33399 {
// P40-P47.agc:129
//		CAF	FOUR
// slot 33399
                if slot <> 33399 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33400 {
// P40-P47.agc:130
//		TS	DVCNTR
// slot 33400
                    if slot <> 33400 or instruction <> 23373 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23373, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:131
//# Page 754
// P40-P47.agc:132
//		TC	INTPRET		# LOAD CONSTANTS FOR DPS BURN
// slot 33401
                    if slot <> 33401 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2166] to agcAotUnit2166@.

agcAotInstallSourceRope(list(
// P40-P47.agc:133
//		VLOAD	CLEAR		# LOAD F, MDOT, TDECAY
// slot 33402
    33402, 36090,
// P40-P47.agc:134
//			FDPS
// slot 33403
    33403, 28674,
// P40-P47.agc:135
//			NOTHROTL
// slot 33404
    33404, 2918,
// P40-P47.agc:136
//		STORE	F
// slot 33405
    33405, 4026,
// P40-P47.agc:137
//		SLOAD
// slot 33406
    33406, 65466,
// P40-P47.agc:138
//			DPSVEX
// slot 33407
    33407, 22532,
// P40-P47.agc:139
//P40IN		DCOMP	SR1
// slot 33408
    33408, 57980,
// P40-P47.agc:140
//		STCALL	VEX		# LOAD EXHAUST VELOCITY FOR TGO COMP.
// slot 33409
    33409, 32710,
// P40-P47.agc:141
//			S40.1		# COMPUTES UT AND VGTIG
// slot 33410
    33410, 47436,
// P40-P47.agc:142
//		CALL
// slot 33411
    33411, 65320,
// P40-P47.agc:143
//			S40.2,3		# COMPUTES PREFERRED IMU ORIENTATION
// slot 33412
    33412, 47638,
// P40-P47.agc:144
//		EXIT
// slot 33413
    33413, 65532
)).

// bank 36, slots 33414-33415
function agcAotUnit2167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33414 {
// P40-P47.agc:145
//
// P40-P47.agc:146
//		INHINT
// slot 33414
        if slot <> 33414 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:147
//		TC	IBNKCALL
// slot 33415
        if slot <> 33415 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2167] to agcAotUnit2167@.

agcAotInstallSourceRope(list(
// P40-P47.agc:148
//		CADR	PFLITEDB	# ZERO ATTITUDE ERRORS, SET DB TO ONE DEG.
// slot 33416
    33416, 32964
)).

// bank 36, slots 33417-33422
function agcAotUnit2168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33419 {
        if slot <= 33417 {
// P40-P47.agc:149
//
// P40-P47.agc:150
//		TC	P40SXT4
// slot 33417
            if slot <> 33417 or instruction <> 1675 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1675, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33418 {
// P40-P47.agc:151
//
// P40-P47.agc:152
//#	********************************
// P40-P47.agc:153
//
// P40-P47.agc:154
//		TCF	BURNBABY
// slot 33418
                if slot <> 33418 or instruction <> 5206 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5206, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:155
//
// P40-P47.agc:156
//#	********************************
// P40-P47.agc:157
//
// P40-P47.agc:158
//P40SXT4		EXTEND
// slot 33419
                if slot <> 33419 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33420 {
// P40-P47.agc:159
//		QXCH	P40/RET
// slot 33420
            if slot <> 33420 or instruction <> 9826 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 610, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33421 {
// P40-P47.agc:160
//P41MANU		RELINT
// slot 33421
                if slot <> 33421 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:161
//
// P40-P47.agc:162
//		TC	DOWNFLAG	# CLEAR 3AXISFLG -- R60 USE VECPOINT.
// slot 33422
                if slot <> 33422 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2168] to agcAotUnit2168@.

agcAotInstallSourceRope(list(
// P40-P47.agc:163
//		ADRES	3AXISFLG
// slot 33423
    33423, 168
)).

// bank 36, slots 33424-33424
function agcAotUnit2169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:164
//
// P40-P47.agc:165
//		TC	BANKCALL
// slot 33424
    if slot <> 33424 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2169] to agcAotUnit2169@.

agcAotInstallSourceRope(list(
// P40-P47.agc:166
//		CADR	R60LEM		# DO ATTITUDE MANEUVER ROUTINE
// slot 33425
    33425, 45222
)).

// bank 36, slots 33426-33433
function agcAotUnit2170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33429 {
        if slot <= 33427 {
            if slot <= 33426 {
// P40-P47.agc:167
//		TC	P40/RET
// slot 33426
                if slot <> 33426 or instruction <> 610 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 610, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:168
//
// P40-P47.agc:169
//		EBANK=	TRKMKCNT
// P40-P47.agc:170
//POSTBURN	CA	Z
// slot 33427
                if slot <> 33427 or instruction <> 12293 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 5).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33428 {
// P40-P47.agc:171
//		TS	DISPDEX
// slot 33428
                if slot <> 33428 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:172
//		EXTEND
// slot 33429
                if slot <> 33429 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33431 {
            if slot <= 33430 {
// P40-P47.agc:173
//		DCA	ACADN85
// slot 33430
                if slot <> 33430 or instruction <> 13358 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1070, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:174
//		DXCH	AVEGEXIT
// slot 33431
                if slot <> 33431 or instruction <> 22187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33432 {
// P40-P47.agc:175
//		CAF	V16N40
// slot 33432
                if slot <> 33432 or instruction <> 14320 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2032), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:176
//		TC	BANKCALL
// slot 33433
                if slot <> 33433 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2170] to agcAotUnit2170@.

agcAotInstallSourceRope(list(
// P40-P47.agc:177
//		CADR	GOFLASHR
// slot 33434
    33434, 17210
)).

// bank 36, slots 33435-33438
function agcAotUnit2171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33436 {
        if slot <= 33435 {
// P40-P47.agc:178
//		TC	TERM40
// slot 33435
            if slot <> 33435 or instruction <> 1710 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1710, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:179
//		TCF	TIGNOW
// slot 33436
            if slot <> 33436 or instruction <> 5793 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5793, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33437 {
// P40-P47.agc:180
//		TC	POSTBURN
// slot 33437
            if slot <> 33437 or instruction <> 1683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:181
//# Page 755
// P40-P47.agc:182
//P40PHS1		TC	PHASCHNG
// slot 33438
            if slot <> 33438 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2171] to agcAotUnit2171@.

agcAotInstallSourceRope(list(
// P40-P47.agc:183
//		OCT	00014
// slot 33439
    33439, 24
)).

// bank 36, slots 33440-33442
function agcAotUnit2172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33440 {
// P40-P47.agc:184
//		TCF	ENDOFJOB
// slot 33440
        if slot <> 33440 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33441 {
// P40-P47.agc:185
//
// P40-P47.agc:186
//TIGNOW		INHINT
// slot 33441
            if slot <> 33441 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:187
//		TC	IBNKCALL
// slot 33442
            if slot <> 33442 or instruction <> 2492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2172] to agcAotUnit2172@.

agcAotInstallSourceRope(list(
// P40-P47.agc:188
//		CADR	ZATTEROR
// slot 33443
    33443, 32982
)).

// bank 36, slots 33444-33444
function agcAotUnit2173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:189
//		TC	IBNKCALL
// slot 33444
    if slot <> 33444 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2173] to agcAotUnit2173@.

agcAotInstallSourceRope(list(
// P40-P47.agc:190
//		CADR	SETMINDB
// slot 33445
    33445, 32960
)).

// bank 36, slots 33446-33448
function agcAotUnit2174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33446 {
// P40-P47.agc:191
//		RELINT
// slot 33446
        if slot <> 33446 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33447 {
// P40-P47.agc:192
//		CAF	V16N85B
// slot 33447
            if slot <> 33447 or instruction <> 14321 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2033), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:193
//		TC	BANKCALL
// slot 33448
            if slot <> 33448 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2174] to agcAotUnit2174@.

agcAotInstallSourceRope(list(
// P40-P47.agc:194
//		CADR	REFLASHR
// slot 33449
    33449, 16996
)).

// bank 36, slots 33450-33462
function agcAotUnit2175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33455 {
        if slot <= 33452 {
            if slot <= 33450 {
// P40-P47.agc:195
//		TC	TERM40
// slot 33450
                if slot <> 33450 or instruction <> 1710 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1710, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33451 {
// P40-P47.agc:196
//		TCF	TERM40
// slot 33451
                    if slot <> 33451 or instruction <> 5806 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5806, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:197
//		TC	-5
// slot 33452
                    if slot <> 33452 or instruction <> 1703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33453 {
// P40-P47.agc:198
//
// P40-P47.agc:199
//		TCF	P40PHS1
// slot 33453
                if slot <> 33453 or instruction <> 5790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33454 {
// P40-P47.agc:200
//
// P40-P47.agc:201
//TERM40		EXTEND
// slot 33454
                    if slot <> 33454 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:202
//		DCA	SERVCADR
// slot 33455
                    if slot <> 33455 or instruction <> 13382 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1094, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33458 {
            if slot <= 33456 {
// P40-P47.agc:203
//		DXCH	AVEGEXIT
// slot 33456
                if slot <> 33456 or instruction <> 22187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33457 {
// P40-P47.agc:204
//		CAF	ZERO
// slot 33457
                    if slot <> 33457 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:205
//		TS	TRKMKCNT	# ZERO RENDZVS CNTERS
// slot 33458
                    if slot <> 33458 or instruction <> 23346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23346, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33460 {
                if slot <= 33459 {
// P40-P47.agc:206
//		CA	Z
// slot 33459
                    if slot <> 33459 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:207
//		TS	DISPDEX
// slot 33460
                    if slot <> 33460 or instruction <> 23155 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23155, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33461 {
// P40-P47.agc:208
//		INHINT
// slot 33461
                    if slot <> 33461 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:209
//		TC	IBNKCALL
// slot 33462
                    if slot <> 33462 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2175] to agcAotUnit2175@.

agcAotInstallSourceRope(list(
// P40-P47.agc:210
//		CADR	RESTORDB
// slot 33463
    33463, 32934
)).

// bank 36, slots 33464-33468
function agcAotUnit2176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33465 {
        if slot <= 33464 {
// P40-P47.agc:211
//		RELINT
// slot 33464
            if slot <> 33464 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:212
//		TC	GOTOPOOH
// slot 33465
            if slot <> 33465 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33466 {
// P40-P47.agc:213
//
// P40-P47.agc:214
//		EBANK=	WHICH
// P40-P47.agc:215
//		COUNT*	$$/P41
// P40-P47.agc:216
//P41LM		CAF	P41ADRES	# INITIALIZATION FOR BURNBABY
// slot 33466
            if slot <> 33466 or instruction <> 13916 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1628), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33467 {
// P40-P47.agc:217
//		TS	WHICH
// slot 33467
                if slot <> 33467 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:218
//
// P40-P47.agc:219
//		TC	BANKCALL
// slot 33468
                if slot <> 33468 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2176] to agcAotUnit2176@.

agcAotInstallSourceRope(list(
// P40-P47.agc:220
//		CADR	R02BOTH
// slot 33469
    33469, 9560
)).

// bank 36, slots 33470-33470
function agcAotUnit2177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:221
//
// P40-P47.agc:222
//		TC	INTPRET		# BOTH LM
// slot 33470
    if slot <> 33470 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2177] to agcAotUnit2177@.

agcAotInstallSourceRope(list(
// P40-P47.agc:223
//		BON	DLOAD		# IF NJETSFLAG IS SET, LOAD Z JET F
// slot 33471
    33471, 58648,
// P40-P47.agc:224
//			NJETSFLG
// slot 33472
    33472, 896,
// P40-P47.agc:225
//			P41FJET1
// slot 33473
    33473, 62858,
// P40-P47.agc:226
//			FRCS4		# IF NJETSFLG IS CLEAR, LOAD 4 JET F
// slot 33474
    33474, 28698,
// P40-P47.agc:227
//
// P40-P47.agc:228
//P41FJET		STCALL	F
// slot 33475
    33475, 32698,
// P40-P47.agc:229
//			P41IN
// slot 33476
    33476, 62864,
// P40-P47.agc:230
//P41FJET1	DLOAD
// slot 33477
    33477, 65482,
// P40-P47.agc:231
//# Page 756
// P40-P47.agc:232
//			FRCS2
// slot 33478
    33478, 28702,
// P40-P47.agc:233
//		STORE	F
// slot 33479
    33479, 4026,
// P40-P47.agc:234
//
// P40-P47.agc:235
//P41IN		CALL
// slot 33480
    33480, 65320,
// P40-P47.agc:236
//			S40.1		# BOTH
// slot 33481
    33481, 47436,
// P40-P47.agc:237
//P41NORM		CALL
// slot 33482
    33482, 65320,
// P40-P47.agc:238
//			S40.2,3		# CALCULATE PREFERRED IMU ORIENTATION AND
// slot 33483
    33483, 47638,
// P40-P47.agc:239
//		EXIT			# SET PFRATFLG.
// slot 33484
    33484, 65532
)).

// bank 36, slots 33485-33486
function agcAotUnit2178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33485 {
// P40-P47.agc:240
//
// P40-P47.agc:241
//		INHINT
// slot 33485
        if slot <> 33485 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:242
//		TC	IBNKCALL
// slot 33486
        if slot <> 33486 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2178] to agcAotUnit2178@.

agcAotInstallSourceRope(list(
// P40-P47.agc:243
//		CADR	ZATTEROR	# ZERO ATTITUDE ERRORS
// slot 33487
    33487, 32982
)).

// bank 36, slots 33488-33488
function agcAotUnit2179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:244
//		TC	IBNKCALL
// slot 33488
    if slot <> 33488 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2179] to agcAotUnit2179@.

agcAotInstallSourceRope(list(
// P40-P47.agc:245
//		CADR	SETMINDB	# SET 0.3 DEGREE DEADBAND
// slot 33489
    33489, 32960
)).

// bank 36, slots 33490-33491
function agcAotUnit2180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33490 {
// P40-P47.agc:246
//		TC	P40SXT4
// slot 33490
        if slot <> 33490 or instruction <> 1675 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1675, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:247
//
// P40-P47.agc:248
//		TC	INTPRET
// slot 33491
        if slot <> 33491 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2180] to agcAotUnit2180@.

agcAotInstallSourceRope(list(
// P40-P47.agc:249
//		VLOAD	CALL		# TRANSFORM VELOCITY-TO-BE-GAINED AT TIG
// slot 33492
    33492, 38138,
// P40-P47.agc:250
//			VGTIG		# FROM REFERENCE COORDINATES TO LM BODY-
// slot 33493
    33493, 3970,
// P40-P47.agc:251
//			S41.1		# AXIS COORDINATES FOR V16N85 DISPLAY.
// slot 33494
    33494, 48494,
// P40-P47.agc:252
//		STORE	VGBODY		# (SCALED AT 2 (+7) METERS/CENTISECOND)
// slot 33495
    33495, 3716,
// P40-P47.agc:253
//		EXIT
// slot 33496
    33496, 65532
)).

// bank 36, slots 33497-33498
function agcAotUnit2181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33497 {
// P40-P47.agc:254
//
// P40-P47.agc:255
//		CAF	V16N85B
// slot 33497
        if slot <> 33497 or instruction <> 14321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2033), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:256
//		TC	BANKCALL
// slot 33498
        if slot <> 33498 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2181] to agcAotUnit2181@.

agcAotInstallSourceRope(list(
// P40-P47.agc:257
//		CADR	GODSPRET
// slot 33499
    33499, 16972
)).

// bank 36, slots 33500-33502
function agcAotUnit2182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33500 {
// P40-P47.agc:258
//
// P40-P47.agc:259
//		CAF	PRIO5
// slot 33500
        if slot <> 33500 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33501 {
// P40-P47.agc:260
//		TS	DISPDEX		# FOR SAFETY ONLY
// slot 33501
            if slot <> 33501 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:261
//		TC	FINDVAC
// slot 33502
            if slot <> 33502 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2182] to agcAotUnit2182@.

agcAotInstallSourceRope(list(
// P40-P47.agc:262
//		EBANK=	VGPREV
// P40-P47.agc:263
//		2CADR	DYNMDISP
// slot 33503 33504
    33503, 3554, 33504, 61550
)).

// bank 36, slots 33505-33505
function agcAotUnit2183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:264
//
// P40-P47.agc:265
//		TC	2PHSCHNG
// slot 33505
    if slot <> 33505 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2183] to agcAotUnit2183@.

agcAotInstallSourceRope(list(
// P40-P47.agc:266
//		OCT	00076		# GROUP 6 RESTARTS AT REDO6.7
// slot 33506
    33506, 124,
// P40-P47.agc:267
//		OCT	04024		# GROUP 4 RESTARTS HERE
// slot 33507
    33507, 4136
)).

// bank 36, slots 33508-33510
function agcAotUnit2184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33508 {
// P40-P47.agc:268
//
// P40-P47.agc:269
//#	********************************
// P40-P47.agc:270
//
// P40-P47.agc:271
//		TCF	B*RNB*B*
// slot 33508
        if slot <> 33508 or instruction <> 5213 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5213, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33509 {
// P40-P47.agc:272
//
// P40-P47.agc:273
//#	********************************
// P40-P47.agc:274
//
// P40-P47.agc:275
//BLNKWAIT	CAF	1SEC
// slot 33509
            if slot <> 33509 or instruction <> 14847 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:276
//		TC	BANKCALL
// slot 33510
            if slot <> 33510 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2184] to agcAotUnit2184@.

agcAotInstallSourceRope(list(
// P40-P47.agc:277
//		CADR	DELAYJOB
// slot 33511
    33511, 1978
)).

// bank 36, slots 33512-33517
function agcAotUnit2185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33514 {
        if slot <= 33512 {
// P40-P47.agc:278
//
// P40-P47.agc:279
//REDO6.7		CA	DISPDEX		# ON A RESTART, DO NOT PUT UP DISPLAY IF
// slot 33512
            if slot <> 33512 or instruction <> 12915 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 627).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33513 {
// P40-P47.agc:280
//		AD	TWO		# BLANKING (BETWEEN TIG-35 AND TIG-30)
// slot 33513
                if slot <> 33513 or instruction <> 27114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:281
//
// P40-P47.agc:282
//#	********************************
// P40-P47.agc:283
//# Page 757
// P40-P47.agc:284
//
// P40-P47.agc:285
//		EXTEND
// slot 33514
                if slot <> 33514 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33515 {
// P40-P47.agc:286
//		BZF	BLNKWAIT
// slot 33515
            if slot <> 33515 or instruction <> 5861 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5861, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33516 {
// P40-P47.agc:287
//
// P40-P47.agc:288
//		CAF	V16N85B
// slot 33516
                if slot <> 33516 or instruction <> 14321 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2033), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:289
//		TC	BANKCALL
// slot 33517
                if slot <> 33517 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2185] to agcAotUnit2185@.

agcAotInstallSourceRope(list(
// P40-P47.agc:290
//		CADR	GODSPRET
// slot 33518
    33518, 16972
)).

// bank 36, slots 33519-33524
function agcAotUnit2186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33521 {
        if slot <= 33519 {
// P40-P47.agc:291
//
// P40-P47.agc:292
//		CAF	PRIO5
// slot 33519
            if slot <> 33519 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33520 {
// P40-P47.agc:293
//		TC	PRIOCHNG
// slot 33520
                if slot <> 33520 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:294
//
// P40-P47.agc:295
//DYNMDISP	CA	DISPDEX		# A NON-POSITIVE DISPDEX INDICATES PAST
// slot 33521
                if slot <> 33521 or instruction <> 12915 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 627).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33522 {
// P40-P47.agc:296
//		EXTEND			# TIG-35, SO SERVICER WILL BE DOING THE
// slot 33522
            if slot <> 33522 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33523 {
// P40-P47.agc:297
//		BZMF	ENDOFJOB	# UPDATING OF NOUN 85.  STOP DYNMDISP.
// slot 33523
                if slot <> 33523 or instruction <> 27245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 27245, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:298
//		TC	INTPRET
// slot 33524
                if slot <> 33524 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2186] to agcAotUnit2186@.

agcAotInstallSourceRope(list(
// P40-P47.agc:299
//		VLOAD	CALL
// slot 33525
    33525, 38138,
// P40-P47.agc:300
//			VGPREV
// slot 33526
    33526, 3970,
// P40-P47.agc:301
//			S41.1
// slot 33527
    33527, 48494,
// P40-P47.agc:302
//		STORE	VGBODY
// slot 33528
    33528, 3716,
// P40-P47.agc:303
//		EXIT
// slot 33529
    33529, 65532
)).

// bank 36, slots 33530-33531
function agcAotUnit2187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33530 {
// P40-P47.agc:304
//		CAF	1SEC
// slot 33530
        if slot <> 33530 or instruction <> 14847 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:305
//		TC	BANKCALL
// slot 33531
        if slot <> 33531 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2187] to agcAotUnit2187@.

agcAotInstallSourceRope(list(
// P40-P47.agc:306
//		CADR	DELAYJOB
// slot 33532
    33532, 1978
)).

// bank 36, slots 33533-33534
function agcAotUnit2188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33533 {
// P40-P47.agc:307
//		TCF	DYNMDISP
// slot 33533
        if slot <> 33533 or instruction <> 5873 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5873, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:308
//
// P40-P47.agc:309
//CALCN85		TC	INTPRET
// slot 33534
        if slot <> 33534 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2188] to agcAotUnit2188@.

agcAotInstallSourceRope(list(
// P40-P47.agc:310
//		CALL
// slot 33535
    33535, 65320,
// P40-P47.agc:311
//			UPDATEVG
// slot 33536
    33536, 63250,
// P40-P47.agc:312
//		VLOAD	CALL
// slot 33537
    33537, 38138,
// P40-P47.agc:313
//			VGPREV
// slot 33538
    33538, 3970,
// P40-P47.agc:314
//			S41.1
// slot 33539
    33539, 48494,
// P40-P47.agc:315
//		STORE	VGBODY
// slot 33540
    33540, 3716,
// P40-P47.agc:316
//		EXIT
// slot 33541
    33541, 65532
)).

// bank 36, slots 33542-33542
function agcAotUnit2189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:317
//		TC	POSTJUMP
// slot 33542
    if slot <> 33542 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2189] to agcAotUnit2189@.

agcAotInstallSourceRope(list(
// P40-P47.agc:318
//		CADR	SERVEXIT
// slot 33543
    33543, 55280
)).

// bank 36, slots 33544-33544
function agcAotUnit2190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:319
//
// P40-P47.agc:320
//		COUNT*	$$/P42
// P40-P47.agc:321
//		EBANK=	WHICH
// P40-P47.agc:322
//
// P40-P47.agc:323
//P42LM		TC	PHASCHNG
// slot 33544
    if slot <> 33544 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2190] to agcAotUnit2190@.

agcAotInstallSourceRope(list(
// P40-P47.agc:324
//		OCT	04024
// slot 33545
    33545, 4136
)).

// bank 36, slots 33546-33552
function agcAotUnit2191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33548 {
        if slot <= 33546 {
// P40-P47.agc:325
//
// P40-P47.agc:326
//		CAF	P42ADRES	# INITIALIZATION FOR BURNBABY.
// slot 33546
            if slot <> 33546 or instruction <> 13917 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1629), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33547 {
// P40-P47.agc:327
//		TS	WHICH
// slot 33547
                if slot <> 33547 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:328
//
// P40-P47.agc:329
//		CS	FLGWRD10
// slot 33548
                if slot <> 33548 or instruction <> 16454 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 70).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33550 {
            if slot <= 33549 {
// P40-P47.agc:330
//		MASK	APSFLBIT
// slot 33549
                if slot <> 33549 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// P40-P47.agc:331
//		CCS	A
// slot 33550
                if slot <> 33550 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33551 {
// P40-P47.agc:332
//		TC	P40ALM
// slot 33551
                if slot <> 33551 or instruction <> 1617 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1617, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:333
//P42STAGE	TC	BANKCALL
// slot 33552
                if slot <> 33552 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2191] to agcAotUnit2191@.

agcAotInstallSourceRope(list(
// P40-P47.agc:334
//# Page 758
// P40-P47.agc:335
//		CADR	R02BOTH
// slot 33553
    33553, 9560
)).

// bank 36, slots 33554-33558
function agcAotUnit2192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33555 {
        if slot <= 33554 {
// P40-P47.agc:336
//		CAF	THRESH2		# INITIALIZE DVMON
// slot 33554
            if slot <> 33554 or instruction <> 15360 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3072), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:337
//		TS	DVTHRUSH
// slot 33555
            if slot <> 33555 or instruction <> 23209 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23209, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33556 {
// P40-P47.agc:338
//		CAF	FOUR
// slot 33556
            if slot <> 33556 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33557 {
// P40-P47.agc:339
//		TS	DVCNTR
// slot 33557
                if slot <> 33557 or instruction <> 23373 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23373, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:340
//
// P40-P47.agc:341
//		TC	INTPRET
// slot 33558
                if slot <> 33558 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2192] to agcAotUnit2192@.

agcAotInstallSourceRope(list(
// P40-P47.agc:342
//		SET	VLOAD		# LOAD FAPS, MDOTAPS, AND ATDECAY INTO
// slot 33559
    33559, 64792,
// P40-P47.agc:343
//			AVFLAG		# F, MDOT, AND TDECAY BY VECTOR LOAD.
// slot 33560
    33560, 1140,
// P40-P47.agc:344
//			FAPS
// slot 33561
    33561, 28686,
// P40-P47.agc:345
//		STORE	F
// slot 33562
    33562, 4026,
// P40-P47.agc:346
//		SLOAD	GOTO
// slot 33563
    33563, 43194,
// P40-P47.agc:347
//			APSVEX
// slot 33564
    33564, 22530,
// P40-P47.agc:348
//			P40IN
// slot 33565
    33565, 62720
)).

// bank 36, slots 33566-33566
function agcAotUnit2193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:349
//
// P40-P47.agc:350
//		EBANK=	WHICH
// P40-P47.agc:351
//
// P40-P47.agc:352
//		COUNT*	$$/P47
// P40-P47.agc:353
//P47LM		TC	BANKCALL
// slot 33566
    if slot <> 33566 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2193] to agcAotUnit2193@.

agcAotInstallSourceRope(list(
// P40-P47.agc:354
//		CADR	R02BOTH
// slot 33567
    33567, 9560
)).

// bank 36, slots 33568-33568
function agcAotUnit2194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:355
//		TC	INTPRET
// slot 33568
    if slot <> 33568 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2194] to agcAotUnit2194@.

agcAotInstallSourceRope(list(
// P40-P47.agc:356
//		CALRB
// slot 33569
    33569, 65320,
// P40-P47.agc:357
//			MIDTOAV2
// slot 33570
    33570, 24278
)).

// bank 36, slots 33571-33572
function agcAotUnit2195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33571 {
// P40-P47.agc:358
//
// P40-P47.agc:359
//		CA	MPAC +1
// slot 33571
        if slot <> 33571 or instruction <> 12397 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 109).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:360
//		TC	TWIDDLE
// slot 33572
        if slot <> 33572 or instruction <> 2683 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2683, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2195] to agcAotUnit2195@.

agcAotInstallSourceRope(list(
// P40-P47.agc:361
//		ADRES	STARTP47
// slot 33573
    33573, 3662
)).

// bank 36, slots 33574-33575
function agcAotUnit2196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33574 {
// P40-P47.agc:362
//
// P40-P47.agc:363
//		TCF	ENDOFJOB
// slot 33574
        if slot <> 33574 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:364
//
// P40-P47.agc:365
//STARTP47	TC	PHASCHNG
// slot 33575
        if slot <> 33575 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2196] to agcAotUnit2196@.

agcAotInstallSourceRope(list(
// P40-P47.agc:366
//		OCT	05014
// slot 33576
    33576, 5144,
// P40-P47.agc:367
//		OCT	77777
// slot 33577
    33577, 65534
)).

// bank 36, slots 33578-33582
function agcAotUnit2197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33579 {
        if slot <= 33578 {
// P40-P47.agc:368
//
// P40-P47.agc:369
//		EXTEND
// slot 33578
            if slot <> 33578 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:370
//		DCA	ACADN83
// slot 33579
            if slot <> 33579 or instruction <> 14324 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2036, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33580 {
// P40-P47.agc:371
//		DXCH	AVEGEXIT
// slot 33580
            if slot <> 33580 or instruction <> 22187 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33581 {
// P40-P47.agc:372
//		CAF	PRIO20
// slot 33581
                if slot <> 33581 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:373
//		TC	FINDVAC
// slot 33582
                if slot <> 33582 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2197] to agcAotUnit2197@.

agcAotInstallSourceRope(list(
// P40-P47.agc:374
//		EBANK=	DELVIMU
// P40-P47.agc:375
//		2CADR	P47BODY
// slot 33583 33584
    33583, 3734, 33584, 61550
)).

// bank 36, slots 33585-33586
function agcAotUnit2198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33585 {
// P40-P47.agc:376
//
// P40-P47.agc:377
//		TCF	REDO4.2		# CHECKS PHASE 5 AND GOES TO PREREAD
// slot 33585
        if slot <> 33585 or instruction <> 5346 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5346, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:378
//					# SEE TIG-30 IN BURNBABY
// P40-P47.agc:379
//
// P40-P47.agc:380
//CALCN83		TC	INTPRET
// slot 33586
        if slot <> 33586 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2198] to agcAotUnit2198@.

agcAotInstallSourceRope(list(
// P40-P47.agc:381
//		VLOAD	VAD
// slot 33587
    33587, 44538,
// P40-P47.agc:382
//			DELVCTL
// slot 33588
    33588, 3716,
// P40-P47.agc:383
//			DELVREF
// slot 33589
    33589, 3758,
// P40-P47.agc:384
//		STORE	DELVSIN		# TEMP STORAGE FOR RESTARTS
// slot 33590
    33590, 3932,
// P40-P47.agc:385
//# Page 759
// P40-P47.agc:386
//		CALL
// slot 33591
    33591, 65320,
// P40-P47.agc:387
//			S41.1
// slot 33592
    33592, 48494,
// P40-P47.agc:388
//		STORE	DELVIMU
// slot 33593
    33593, 3878,
// P40-P47.agc:389
//		EXIT
// slot 33594
    33594, 65532
)).

// bank 36, slots 33595-33595
function agcAotUnit2199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:390
//		TC	PHASCHNG
// slot 33595
    if slot <> 33595 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2199] to agcAotUnit2199@.

agcAotInstallSourceRope(list(
// P40-P47.agc:391
//		OCT	10035		# REREADAC AND HERE
// slot 33596
    33596, 8250
)).

// bank 36, slots 33597-33597
function agcAotUnit2200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:392
//
// P40-P47.agc:393
//		TC	INTPRET
// slot 33597
    if slot <> 33597 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2200] to agcAotUnit2200@.

agcAotInstallSourceRope(list(
// P40-P47.agc:394
//		VLOAD
// slot 33598
    33598, 65530,
// P40-P47.agc:395
//			DELVSIN
// slot 33599
    33599, 3932,
// P40-P47.agc:396
//		STORE	DELVCTL
// slot 33600
    33600, 3716,
// P40-P47.agc:397
//		EXIT
// slot 33601
    33601, 65532
)).

// bank 36, slots 33602-33602
function agcAotUnit2201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:398
//
// P40-P47.agc:399
//		TC	POSTJUMP
// slot 33602
    if slot <> 33602 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2201] to agcAotUnit2201@.

agcAotInstallSourceRope(list(
// P40-P47.agc:400
//		CADR	SERVEXIT
// slot 33603
    33603, 55280
)).

// bank 36, slots 33604-33605
function agcAotUnit2202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33604 {
// P40-P47.agc:401
//
// P40-P47.agc:402
//P47BOD		CAF	V1683
// slot 33604
        if slot <> 33604 or instruction <> 14322 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2034), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:403
//		TC	BANKCALL
// slot 33605
        if slot <> 33605 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2202] to agcAotUnit2202@.

agcAotInstallSourceRope(list(
// P40-P47.agc:404
//		CADR	GOFLASHR
// slot 33606
    33606, 17210
)).

// bank 36, slots 33607-33608
function agcAotUnit2203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33607 {
// P40-P47.agc:405
//		TC	GOTOPOOH
// slot 33607
        if slot <> 33607 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:406
//		TC	GOTOPOOH
// slot 33608
        if slot <> 33608 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2203] to agcAotUnit2203@.

// bank 36, slots 33609-33611
function agcAotUnit2204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33609 {
// P40-P47.agc:407
//
// P40-P47.agc:408
//		TCF	P47BODY
// slot 33609
        if slot <> 33609 or instruction <> 5963 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5963, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33610 {
// P40-P47.agc:409
//
// P40-P47.agc:410
//		TCF	P40PHS1
// slot 33610
            if slot <> 33610 or instruction <> 5790 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5790, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:411
//
// P40-P47.agc:412
//P47BODY		TC	INTPRET
// slot 33611
            if slot <> 33611 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2204] to agcAotUnit2204@.

agcAotInstallSourceRope(list(
// P40-P47.agc:413
//		VLOAD
// slot 33612
    33612, 65530,
// P40-P47.agc:414
//			HI6ZEROS
// slot 33613
    33613, 6820,
// P40-P47.agc:415
//		STORE	DELVIMU
// slot 33614
    33614, 3878,
// P40-P47.agc:416
//		STORE	DELVCTL
// slot 33615
    33615, 3716,
// P40-P47.agc:417
//		EXIT
// slot 33616
    33616, 65532
)).

// bank 36, slots 33617-33620
function agcAotUnit2205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33618 {
        if slot <= 33617 {
// P40-P47.agc:418
//		TC	P47BOD
// slot 33617
            if slot <> 33617 or instruction <> 1860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1860, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:419
//
// P40-P47.agc:420
//		COUNT*	$$/P40
// P40-P47.agc:421
//IMPLBURN	CA	TGO 	+1
// slot 33618
            if slot <> 33618 or instruction <> 13135 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 847).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33619 {
// P40-P47.agc:422
//		TC	GETDT
// slot 33619
            if slot <> 33619 or instruction <> 2013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2013, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:423
//		TC	TWIDDLE
// slot 33620
            if slot <> 33620 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2205] to agcAotUnit2205@.

agcAotInstallSourceRope(list(
// P40-P47.agc:424
//		ADRES	ENGOFTSK
// slot 33621
    33621, 3780
)).

// bank 36, slots 33622-33622
function agcAotUnit2206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:425
//		TC	DOWNFLAG	# TURN OFF IGNFLAG
// slot 33622
    if slot <> 33622 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2206] to agcAotUnit2206@.

agcAotInstallSourceRope(list(
// P40-P47.agc:426
//		ADRES	IGNFLAG
// slot 33623
    33623, 214
)).

// bank 36, slots 33624-33624
function agcAotUnit2207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:427
//		TC	DOWNFLAG	# TURN OFF ASTNFLG
// slot 33624
    if slot <> 33624 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2207] to agcAotUnit2207@.

agcAotInstallSourceRope(list(
// P40-P47.agc:428
//		ADRES	ASTNFLAG
// slot 33625
    33625, 216
)).

// bank 36, slots 33626-33626
function agcAotUnit2208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:429
//		TC	DOWNFLAG	# TURN OFF IMPULSW
// slot 33626
    if slot <> 33626 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2208] to agcAotUnit2208@.

agcAotInstallSourceRope(list(
// P40-P47.agc:430
//		ADRES	IMPULSW
// slot 33627
    33627, 72
)).

// bank 36, slots 33628-33628
function agcAotUnit2209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:431
//		TC	PHASCHNG	# RESTART PROTECT ENGOFTSK (ENGINOFF)
// slot 33628
    if slot <> 33628 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2209] to agcAotUnit2209@.

agcAotInstallSourceRope(list(
// P40-P47.agc:432
//		OCT	40114
// slot 33629
    33629, 32920
)).

// bank 36, slots 33630-33630
function agcAotUnit2210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:433
//
// P40-P47.agc:434
//		TC	FIXDELAY	# WAIT HALF A SECOND
// slot 33630
    if slot <> 33630 or instruction <> 2705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2210] to agcAotUnit2210@.

agcAotInstallSourceRope(list(
// P40-P47.agc:435
//		DEC	50
// slot 33631
    33631, 100
)).

// bank 36, slots 33632-33634
function agcAotUnit2211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33632 {
// P40-P47.agc:436
//# Page 760
// P40-P47.agc:437
//		TC	NOULLAGE	# TURN OFF ULLAGE
// slot 33632
        if slot <> 33632 or instruction <> 1451 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1451, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33633 {
// P40-P47.agc:438
//
// P40-P47.agc:439
//		TC	TASKOVER
// slot 33633
            if slot <> 33633 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:440
//
// P40-P47.agc:441
//ENGOFTSK	TC	IBNKCALL	# THIS CODING ALLOWS ENGINOFF ET AL TO BE
// slot 33634
            if slot <> 33634 or instruction <> 2492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2211] to agcAotUnit2211@.

agcAotInstallSourceRope(list(
// P40-P47.agc:442
//		CADR	ENGINOFF	# USED BOTH BY WAITLIST AND BY TC IBNKCALL
// slot 33635
    33635, 63178
)).

// bank 36, slots 33636-33638
function agcAotUnit2212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33636 {
// P40-P47.agc:443
//		TC	TASKOVER
// slot 33636
        if slot <> 33636 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33637 {
// P40-P47.agc:444
//
// P40-P47.agc:445
//ENGINOFF	CAF	PRIO12		# MUST BE LOWER PRIO THAN CLOCKJOB
// slot 33637
            if slot <> 33637 or instruction <> 14756 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2468), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:446
//		TC	FINDVAC
// slot 33638
            if slot <> 33638 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2212] to agcAotUnit2212@.

agcAotInstallSourceRope(list(
// P40-P47.agc:447
//		EBANK=	TRKMKCNT
// P40-P47.agc:448
//		2CADR	POSTBURN
// slot 33639 33640
    33639, 3366, 33640, 61550
)).

// bank 36, slots 33641-33642
function agcAotUnit2213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33641 {
// P40-P47.agc:449
//
// P40-P47.agc:450
//ENGINOF2	CAF	BIT1
// slot 33641
        if slot <> 33641 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P40-P47.agc:451
//		TC	WAITLIST
// slot 33642
        if slot <> 33642 or instruction <> 2691 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2691, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2213] to agcAotUnit2213@.

agcAotInstallSourceRope(list(
// P40-P47.agc:452
//		EBANK=	OMEGAQ
// P40-P47.agc:453
//		2CADR	COASTSET
// slot 33643 33644
    33643, 3852, 33644, 61548
)).

// bank 36, slots 33645-33670
function agcAotUnit2214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33657 {
        if slot <= 33650 {
            if slot <= 33647 {
                if slot <= 33645 {
// P40-P47.agc:454
//
// P40-P47.agc:455
//ENGINOF1	CS	FLAGWRD7	# SET THE IDLE BIT.
// slot 33645
                    if slot <> 33645 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33646 {
// P40-P47.agc:456
//		MASK	IDLEFBIT
// slot 33646
                        if slot <> 33646 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
// P40-P47.agc:457
//		ADS	FLAGWRD7
// slot 33647
                        if slot <> 33647 or instruction <> 11331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33648 {
// P40-P47.agc:458
//
// P40-P47.agc:459
//		TC	NOULLAGE
// slot 33648
                    if slot <> 33648 or instruction <> 1451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1451, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33649 {
// P40-P47.agc:460
//
// P40-P47.agc:461
//ENGINOF4	EXTEND
// slot 33649
                        if slot <> 33649 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:462
//		DCA	TIME2
// slot 33650
                        if slot <> 33650 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33653 {
                if slot <= 33651 {
// P40-P47.agc:463
//		DXCH	TEVENT
// slot 33651
                    if slot <> 33651 or instruction <> 22245 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 741, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33652 {
// P40-P47.agc:464
//
// P40-P47.agc:465
//ENGINOF3	CS	ENGONBIT	# INSURE ENGONFLG IS CLEAR.
// slot 33652
                        if slot <> 33652 or instruction <> 18917 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:466
//		MASK	FLAGWRD5
// slot 33653
                        if slot <> 33653 or instruction <> 28737 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33655 {
                    if slot <= 33654 {
// P40-P47.agc:467
//		TS	FLAGWRD5
// slot 33654
                        if slot <> 33654 or instruction <> 22593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22593, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:468
//		CS	PRIO30		# ENGINOF3 IS USED AS A PRE-ENGINE ARM
// slot 33655
                        if slot <> 33655 or instruction <> 18669 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33656 {
// P40-P47.agc:469
//		EXTEND			# SUBROUTINE.
// slot 33656
                        if slot <> 33656 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:470
//		RAND	DSALMOUT
// slot 33657
                        if slot <> 33657 or instruction <> 1033 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 33663 {
            if slot <= 33660 {
                if slot <= 33658 {
// P40-P47.agc:471
//		AD	PRIO20		# TURN OFF THE ENGINE -- DPS OR APS
// slot 33658
                    if slot <> 33658 or instruction <> 27102 { return choose false if checkOnly else -1. }
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
                    if slot <= 33659 {
// P40-P47.agc:472
//		EXTEND
// slot 33659
                        if slot <> 33659 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:473
//		WRITE	DSALMOUT
// slot 33660
                        if slot <> 33660 or instruction <> 521 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33661 {
// P40-P47.agc:474
//
// P40-P47.agc:475
//		CS	DAPBOOLS	# TURN OFF TRIM GIMBAL
// slot 33661
                    if slot <> 33661 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33662 {
// P40-P47.agc:476
//		MASK	USEQRJTS
// slot 33662
                        if slot <> 33662 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
// P40-P47.agc:477
//		ADS	DAPBOOLS
// slot 33663
                        if slot <> 33663 or instruction <> 11337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33666 {
                if slot <= 33664 {
// P40-P47.agc:478
//
// P40-P47.agc:479
//		CS	HIRTHROT	# ZERO AUTO-THROTTLE WHENEVER THE ENGINE
// slot 33664
                    if slot <> 33664 or instruction <> 18911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33665 {
// P40-P47.agc:480
//		TS	THRUST		# IS TURNED OFF.
// slot 33665
                        if slot <> 33665 or instruction <> 22573 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22573, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:481
//		CAF	BIT4		# THE HARDWARE DOES SO ONLY WHEN THE
// slot 33666
                        if slot <> 33666 or instruction <> 14824 { return choose false if checkOnly else -1. }
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
                if slot <= 33668 {
                    if slot <= 33667 {
// P40-P47.agc:482
//		EXTEND			# ENGINE IS DISARMED.
// slot 33667
                        if slot <> 33667 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:483
//		WOR	CHAN14
// slot 33668
                        if slot <> 33668 or instruction <> 2572 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33669 {
// P40-P47.agc:484
//
// P40-P47.agc:485
//		TC	ISWRETRN
// slot 33669
                        if slot <> 33669 or instruction <> 2503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P40-P47.agc:486
//# Page 761
// P40-P47.agc:487
//COASTSET	TC	IBNKCALL	# DO DAP COASTING INITIALIZATION
// slot 33670
                        if slot <> 33670 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2214] to agcAotUnit2214@.

agcAotInstallSourceRope(list(
// P40-P47.agc:488
//		CADR	ALLCOAST
// slot 33671
    33671, 33032
)).

// bank 36, slots 33672-33672
function agcAotUnit2215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:489
//		TC	TASKOVER
// slot 33672
    if slot <> 33672 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2215] to agcAotUnit2215@.

agcAotInstallSourceRope(list(
// P40-P47.agc:490
//
// P40-P47.agc:491
//		EBANK=	OMEGAQ
// P40-P47.agc:492
//UPDATEVG	STQ	CALL
// slot 33673
    33673, 37920,
// P40-P47.agc:493
//			QTEMP1
// slot 33674
    33674, 3946,
// P40-P47.agc:494
//			S40.8		# X-PRODUCT STEERING
// slot 33675
    33675, 47694,
// P40-P47.agc:495
//		BON	BON
// slot 33676
    33676, 35864,
// P40-P47.agc:496
//			XDELVFLG
// slot 33677
    33677, 1422,
// P40-P47.agc:497
//			QTEMP1
// slot 33678
    33678, 3946,
// P40-P47.agc:498
//			NORMSW
// slot 33679
    33679, 3978,
// P40-P47.agc:499
//			180SETUP
// slot 33680
    33680, 63286,
// P40-P47.agc:500
//		DLOAD	DSU
// slot 33681
    33681, 38346,
// P40-P47.agc:501
//			PIPTIME
// slot 33682
    33682, 1338,
// P40-P47.agc:502
//			TIGSAVE
// slot 33683
    33683, 4070,
// P40-P47.agc:503
//		DSU	BMN
// slot 33684
    33684, 41002,
// P40-P47.agc:504
//			TNEWA
// slot 33685
    33685, 3636,
// P40-P47.agc:505
//			GETRANS
// slot 33686
    33686, 63324,
// P40-P47.agc:506
//		DLOAD	DAD
// slot 33687
    33687, 36298,
// P40-P47.agc:507
//			TIGSAVE
// slot 33688
    33688, 4070,
// P40-P47.agc:508
//			TNEWA
// slot 33689
    33689, 3636,
// P40-P47.agc:509
//		STORE	TIGSAVEP
// slot 33690
    33690, 4074,
// P40-P47.agc:510
//180SETUP	EXIT
// slot 33691
    33691, 65532
)).

// bank 36, slots 33692-33696
function agcAotUnit2216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33693 {
        if slot <= 33692 {
// P40-P47.agc:511
//		CCS	PHASE2
// slot 33692
            if slot <> 33692 or instruction <> 4589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 493).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P40-P47.agc:512
//		TCF	NO.9
// slot 33693
            if slot <> 33693 or instruction <> 6067 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6067, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33694 {
// P40-P47.agc:513
//		CAF	PRIO10
// slot 33694
            if slot <> 33694 or instruction <> 14815 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33695 {
// P40-P47.agc:514
//		INHINT
// slot 33695
                if slot <> 33695 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:515
//		TC	FINDVAC
// slot 33696
                if slot <> 33696 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2216] to agcAotUnit2216@.

agcAotInstallSourceRope(list(
// P40-P47.agc:516
//		EBANK=	VG
// P40-P47.agc:517
//		2CADR	S40.9		# LAMBERT VTOGAIN
// slot 33697 33698
    33697, 2958, 33698, 47214
)).

// bank 36, slots 33699-33699
function agcAotUnit2217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:518
//
// P40-P47.agc:519
//		TC	2PHSCHNG
// slot 33699
    if slot <> 33699 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2217] to agcAotUnit2217@.

agcAotInstallSourceRope(list(
// P40-P47.agc:520
//		OCT	00172		# 2.17SPOT FOR S40.9
// slot 33700
    33700, 244,
// P40-P47.agc:521
//		OCT	10035		# HERE AND REREADAC AFTER RESTART
// slot 33701
    33701, 8250
)).

// bank 36, slots 33702-33702
function agcAotUnit2218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:522
//
// P40-P47.agc:523
//ENDSTEER	TC	INTPRET
// slot 33702
    if slot <> 33702 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2218] to agcAotUnit2218@.

agcAotInstallSourceRope(list(
// P40-P47.agc:524
//		DLOAD
// slot 33703
    33703, 65482,
// P40-P47.agc:525
//			TIGSAVEP
// slot 33704
    33704, 4074,
// P40-P47.agc:526
//		STOVL	TIGSAVE
// slot 33705
    33705, 24550,
// P40-P47.agc:527
//			RN
// slot 33706
    33706, 1314,
// P40-P47.agc:528
//		STOVL	RINIT
// slot 33707
    33707, 22950,
// P40-P47.agc:529
//			VN
// slot 33708
    33708, 1326,
// P40-P47.agc:530
//		STORE	VINIT
// slot 33709
    33709, 2482,
// P40-P47.agc:531
//GETRANS		DLOAD	DSU
// slot 33710
    33710, 38346,
// P40-P47.agc:532
//			TPASS4
// slot 33711
    33711, 3890,
// P40-P47.agc:533
//			PIPTIME
// slot 33712
    33712, 1338,
// P40-P47.agc:534
//		STCALL	DELLT4
// slot 33713
    33713, 32340,
// P40-P47.agc:535
//			QTEMP1
// slot 33714
    33714, 3946
)).

// bank 36, slots 33715-33715
function agcAotUnit2219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:536
//
// P40-P47.agc:537
//# Page 762
// P40-P47.agc:538
//NO.9		TC	INTPRET
// slot 33715
    if slot <> 33715 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2219] to agcAotUnit2219@.

agcAotInstallSourceRope(list(
// P40-P47.agc:539
//		GOTO
// slot 33716
    33716, 65360,
// P40-P47.agc:540
//			QTEMP1
// slot 33717
    33717, 3946
)).

// bank 36, slots 33718-33718
function agcAotUnit2220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:541
//STEERING	TC	INTPRET
// slot 33718
    if slot <> 33718 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2220] to agcAotUnit2220@.

agcAotInstallSourceRope(list(
// P40-P47.agc:542
//
// P40-P47.agc:543
//		CALL
// slot 33719
    33719, 65320,
// P40-P47.agc:544
//			UPDATEVG
// slot 33720
    33720, 63250,
// P40-P47.agc:545
//		EXIT
// slot 33721
    33721, 65532
)).

// bank 36, slots 33722-33733
function agcAotUnit2221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33727 {
        if slot <= 33724 {
            if slot <= 33722 {
// P40-P47.agc:546
//
// P40-P47.agc:547
//		EBANK=	DVCNTR
// P40-P47.agc:548
//NSTEER		INHINT
// slot 33722
                if slot <> 33722 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33723 {
// P40-P47.agc:549
//		CA	EBANK7
// slot 33723
                    if slot <> 33723 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:550
//		TS	EBANK
// slot 33724
                    if slot <> 33724 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33725 {
// P40-P47.agc:551
//		CS	FLAGWRD2	# CHECK IMPULSE SWITCH.  IT IS SET EITHER
// slot 33725
                if slot <> 33725 or instruction <> 16446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 62).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33726 {
// P40-P47.agc:552
//		MASK	IMPULBIT	# BY S40.13 IF TBURN<6 SECS OR BY S40.8 IF
// slot 33726
                    if slot <> 33726 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
                } else {
// P40-P47.agc:553
//		CCS	A		# STEERING IS ALMOST DONE.
// slot 33727
                    if slot <> 33727 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 33730 {
            if slot <= 33728 {
// P40-P47.agc:554
//
// P40-P47.agc:555
//		TCF	+5		# IMPULSW = 0	EXIT
// slot 33728
                if slot <> 33728 or instruction <> 6085 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6085, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33729 {
// P40-P47.agc:556
//		CS	FLAGWRD7	# IMPULSW = 1	WHY?  CHECK IDLEFLAG
// slot 33729
                    if slot <> 33729 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:557
//		MASK	IDLEFBIT	#	(IDLEFLAG = 0 --> DVMON ON)
// slot 33730
                    if slot <> 33730 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
            if slot <= 33731 {
// P40-P47.agc:558
//		CCS	A
// slot 33731
                if slot <> 33731 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33732 {
// P40-P47.agc:559
//		TCF	+3		# DVMON ON --> THRUSTING --> IMPULSW VIA S40.8
// slot 33732
                    if slot <> 33732 or instruction <> 6087 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6087, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:560
//		TC	POSTJUMP	# DVMON OFF --> IMPULSW ON VIA S40.13 --> EXIT
// slot 33733
                    if slot <> 33733 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2221] to agcAotUnit2221@.

agcAotInstallSourceRope(list(
// P40-P47.agc:561
//		CADR	SERVEXIT
// slot 33734
    33734, 55280
)).

// bank 36, slots 33735-33735
function agcAotUnit2222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:562
//
// P40-P47.agc:563
//		TC	IBNKCALL
// slot 33735
    if slot <> 33735 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2222] to agcAotUnit2222@.

agcAotInstallSourceRope(list(
// P40-P47.agc:564
//		CADR	STOPRATE
// slot 33736
    33736, 33002
)).

// bank 36, slots 33737-33737
function agcAotUnit2223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:565
//
// P40-P47.agc:566
//		TC	DOWNFLAG	# TURN OFF IMPULSW
// slot 33737
    if slot <> 33737 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2223] to agcAotUnit2223@.

agcAotInstallSourceRope(list(
// P40-P47.agc:567
//		ADRES	IMPULSW
// slot 33738
    33738, 72
)).

// bank 36, slots 33739-33739
function agcAotUnit2224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:568
//
// P40-P47.agc:569
//		TC	UPFLAG
// slot 33739
    if slot <> 33739 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2224] to agcAotUnit2224@.

agcAotInstallSourceRope(list(
// P40-P47.agc:570
//		ADRES	IDLEFLAG	# TURN OFF DVMON
// slot 33740
    33740, 226
)).

// bank 36, slots 33741-33751
function agcAotUnit2225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33745 {
        if slot <= 33742 {
            if slot <= 33741 {
// P40-P47.agc:571
//
// P40-P47.agc:572
//		INHINT
// slot 33741
                if slot <> 33741 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:573
//		EXTEND
// slot 33742
                if slot <> 33742 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33743 {
// P40-P47.agc:574
//		DCA	TIG
// slot 33743
                if slot <> 33743 or instruction <> 13090 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 802, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33744 {
// P40-P47.agc:575
//		DXCH	MPAC
// slot 33744
                    if slot <> 33744 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:576
//		EXTEND
// slot 33745
                    if slot <> 33745 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33748 {
            if slot <= 33746 {
// P40-P47.agc:577
//		DCS	TIME2
// slot 33746
                if slot <> 33746 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33747 {
// P40-P47.agc:578
//		DAS	MPAC
// slot 33747
                    if slot <> 33747 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:579
//		TC	TPAGREE
// slot 33748
                    if slot <> 33748 or instruction <> 3759 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3759, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33749 {
// P40-P47.agc:580
//		CAE	MPAC 	+1
// slot 33749
                if slot <> 33749 or instruction <> 12397 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 109).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33750 {
// P40-P47.agc:581
//		TC	GETDT
// slot 33750
                    if slot <> 33750 or instruction <> 2013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:582
//		TC	TWIDDLE
// slot 33751
                    if slot <> 33751 or instruction <> 2683 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2225] to agcAotUnit2225@.

agcAotInstallSourceRope(list(
// P40-P47.agc:583
//		ADRES	ENGOFTSK
// slot 33752
    33752, 3780
)).

// bank 36, slots 33753-33753
function agcAotUnit2226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:584
//		TC	2PHSCHNG
// slot 33753
    if slot <> 33753 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2226] to agcAotUnit2226@.

agcAotInstallSourceRope(list(
// P40-P47.agc:585
//		OCT	40114		# ENGOFTSK (ENGINOFF)
// slot 33754
    33754, 32920,
// P40-P47.agc:586
//		OCT	00035		# SERVICER -- REREADAC
// slot 33755
    33755, 58
)).

// bank 36, slots 33756-33766
function agcAotUnit2227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33760 {
        if slot <= 33757 {
            if slot <= 33756 {
// P40-P47.agc:587
//# Page 763
// P40-P47.agc:588
//		TCF	ENDOFJOB
// slot 33756
                if slot <> 33756 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:589
//
// P40-P47.agc:590
//GETDT		CCS	A
// slot 33757
                if slot <> 33757 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33758 {
// P40-P47.agc:591
//		TCF	+3
// slot 33758
                if slot <> 33758 or instruction <> 6113 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6113, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33759 {
// P40-P47.agc:592
//		TCF	+2
// slot 33759
                    if slot <> 33759 or instruction <> 6113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6113, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:593
//		CAF	ZERO
// slot 33760
                    if slot <> 33760 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 33763 {
            if slot <= 33761 {
// P40-P47.agc:594
//		AD	ONE
// slot 33761
                if slot <> 33761 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                if slot <= 33762 {
// P40-P47.agc:595
//		XCH	L
// slot 33762
                    if slot <> 33762 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:596
//		CAF	ZERO
// slot 33763
                    if slot <> 33763 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 33764 {
// P40-P47.agc:597
//		DXCH	TGO
// slot 33764
                if slot <> 33764 or instruction <> 22351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 847, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33765 {
// P40-P47.agc:598
//		CA	TGO 	+1
// slot 33765
                    if slot <> 33765 or instruction <> 13135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 847).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:599
//		TC	Q
// slot 33766
                    if slot <> 33766 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2227] to agcAotUnit2227@.

agcAotInstallSourceRope(list(
// P40-P47.agc:600
//
// P40-P47.agc:601
//# **************************************
// P40-P47.agc:602
//
// P40-P47.agc:603
//SEC15DP		OCT	00000		# DON'T SEPARATE
// slot 33767
    33767, 0,
// P40-P47.agc:604
//SEC15		DEC	1500		# DON'T SEPARATE
// slot 33768
    33768, 3000,
// P40-P47.agc:605
//SEC30DP		2DEC	3000
// slot 33769 33770
    33769, 0, 33770, 6000,
// P40-P47.agc:606
//
// P40-P47.agc:607
//SEC45DP		OCT	00000		# DON'T MOVE FROM JUST BEFORE SEC45
// slot 33771
    33771, 0,
// P40-P47.agc:608
//SEC45		DEC	4500
// slot 33772
    33772, 9000,
// P40-P47.agc:609
//5SECDP		OCT	00000		# DON'T MOVE FROM JUST BEFORE 5SEC
// slot 33773
    33773, 0,
// P40-P47.agc:610
//5SEC		DEC	500
// slot 33774
    33774, 1000,
// P40-P47.agc:611
//26SECS		DEC	2600
// slot 33775
    33775, 5200,
// P40-P47.agc:612
//V16N40		VN	1640
// slot 33776
    33776, 4176,
// P40-P47.agc:613
//V16N85B		VN	1685
// slot 33777
    33777, 4266,
// P40-P47.agc:614
//V1683		VN	1683
// slot 33778
    33778, 4262,
// P40-P47.agc:615
//SEC01		=	1SEC
// P40-P47.agc:616
//ACADN85		=	P41TABLE +2
// P40-P47.agc:617
//
// P40-P47.agc:618
//		EBANK=	DELVIMU
// P40-P47.agc:619
//ACADN83		2CADR	CALCN83
// slot 33779 33780
    33779, 3684, 33780, 61550,
// P40-P47.agc:620
//
// P40-P47.agc:621
//# ******************************************
// P40-P47.agc:622
//# Page 764
// P40-P47.agc:623
//# PROGRAM DESCRIPTION: S40.1		DATE: 15 NOV 66
// P40-P47.agc:624
//# MOD N02				LOG SECTION P40-P47
// P40-P47.agc:625
//# MOD BY ZELDIN KERMAN AND ADAPTED BY TALAYCO KERMAN
// P40-P47.agc:626
//#
// P40-P47.agc:627
//# FUNCTIONAL DESCRIPTION
// P40-P47.agc:628
//#	COMPUTE INITIAL THRUST DIRECTION(UT) AND INITIAL VALUE OF VG
// P40-P47.agc:629
//#	VECTOR(VGTIG).
// P40-P47.agc:630
//#
// P40-P47.agc:631
//# CALLING SEQUENCE
// P40-P47.agc:632
//#	L	CALL
// P40-P47.agc:633
//#	L+1		S40.1
// P40-P47.agc:634
//#
// P40-P47.agc:635
//# NORMAL EXIT MODE
// P40-P47.agc:636
//#	AT L+2 OF CALLING SEQUENCE (GOTO L+2) NORMAL RETURN OR
// P40-P47.agc:637
//#	ERROR RETURN IF NOSOFLAG =1
// P40-P47.agc:638
//#
// P40-P47.agc:639
//# SUBROUTINES CALLED
// P40-P47.agc:640
//#	LEMPREC
// P40-P47.agc:641
//#	INITVEL
// P40-P47.agc:642
//#	CALCGRAV
// P40-P47.agc:643
//#	MIDGIM
// P40-P47.agc:644
//#
// P40-P47.agc:645
//# ALARM OR ABORT EXIT MODES
// P40-P47.agc:646
//#	L+2 OF CALLING SEQUENCE, UNSOLVABLE CONIC IF NOSOFLAG=1
// P40-P47.agc:647
//#
// P40-P47.agc:648
//# ERASABLE INITIALIZATION REQUIRED
// P40-P47.agc:649
//#	WEIGHT/G	ANTICIPATED VEHICLE MASS	DP B16 KGM
// P40-P47.agc:650
//#	XDELVFLG	1=DELTA-V MANEUVER, 0=AIMPT STEER
// P40-P47.agc:651
//#	F		THRUST FOR ENGINE USED
// P40-P47.agc:652
//#   IF DELTA-V MANEUVER:
// P40-P47.agc:653
//#	DELVSIN		SPECIFIED DELTA-V REQUIRED IN
// P40-P47.agc:654
//#			INERTIAL COORDS. OF ACTIVE VEHICLE
// P40-P47.agc:655
//#			AT TIME OF IGNITION		VECTOR B7 M/CS
// P40-P47.agc:656
//#	DELVSAB		MAG. OF DELVSIN			DP B7 M/CS
// P40-P47.agc:657
//#	RTIG		POSITION AT TIME OF IGNITION	VECTOR B29 M
// P40-P47.agc:658
//#	VTIG		VELOCITY AT TIME OF IGNITION	VECTOR B7 M/CS.
// P40-P47.agc:659
//#   IF AIMPT STEER:
// P40-P47.agc:660
//#	TIG		TIME OF IGNITION		DP B28 CS
// P40-P47.agc:661
//#	RTARG		POSITION TARGET TIME		VECTOR B29 M
// P40-P47.agc:662
//#	CSTEER		C FOR STEER LAW			DP B2
// P40-P47.agc:663
//#	DLTARG		TARGET TIME-IGNITION TIME	DP B28 CS
// P40-P47.agc:664
//#
// P40-P47.agc:665
//# OUTPUT
// P40-P47.agc:666
//#	UT		DESIRED THRUST DIRECTION	VECT. B2 M/(CS.CS)
// P40-P47.agc:667
//#	VGTIG		INITIAL VALUE OF VELOCITY
// P40-P47.agc:668
//#			TO BE GAINED (INERT. COORD.)	VECTOR B7 M/CS
// P40-P47.agc:669
//#	DELVLVC		VGTIG IN LOC. VERT. COORDS.	B7 M/CS
// P40-P47.agc:670
//#	BDT		V REQUIRED AT TIG -V REQUIRED AT (TIG-2SEC)
// P40-P47.agc:671
//#	   -GDT		FOR S40.13			VECT B7 M/CS
// P40-P47.agc:672
//#	RTIG		CALC IN S40.1B (AIMPT) FOR S40.2,3	VECTOR B27M
// P40-P47.agc:673
//#			POSITION AT TIME OF IGNITION
// P40-P47.agc:674
//#
// P40-P47.agc:675
//# DEBRIS	QTEMP1
// P40-P47.agc:676
//#		MPAC, QPRET
// P40-P47.agc:677
//#		PUSHLIST
// P40-P47.agc:678
//
// P40-P47.agc:679
//		BANK	14
// P40-P47.agc:680
//		SETLOC	P40S1
// P40-P47.agc:681
//		BANK
// P40-P47.agc:682
//# Page 765
// P40-P47.agc:683
//		COUNT*	$$/S40.1
// P40-P47.agc:684
//S40.1		STQ	DLOAD
// slot 25766
    25766, 58656,
// P40-P47.agc:685
//			QTEMP
// slot 25767
    25767, 3892,
// P40-P47.agc:686
//			TIG
// slot 25768
    25768, 3652,
// P40-P47.agc:687
//		STORE	TIGSAVE
// slot 25769
    25769, 4070,
// P40-P47.agc:688
//DELVTEST	BOFF
// slot 25770
    25770, 65304,
// P40-P47.agc:689
//			XDELVFLG
// slot 25771
    25771, 1486,
// P40-P47.agc:690
//			S40.1B
// slot 25772
    25772, 47548,
// P40-P47.agc:691
//CALCTHET	SETPD	VLOAD
// slot 25773
    25773, 64770,
// P40-P47.agc:692
//			0
// slot 25774
    25774, 2,
// P40-P47.agc:693
//			VTIG
// slot 25775
    25775, 3920,
// P40-P47.agc:694
//		STORE	VINIT
// slot 25776
    25776, 2482,
// P40-P47.agc:695
//		VXV	UNIT
// slot 25777
    25777, 44602,
// P40-P47.agc:696
//			RTIG
// slot 25778
    25778, 3908,
// P40-P47.agc:697
//		STOVL	UT		# UP IN UT
// slot 25779
    25779, 24438,
// P40-P47.agc:698
//			RTIG
// slot 25780
    25780, 3908,
// P40-P47.agc:699
//		STORE	RINIT
// slot 25781
    25781, 2470,
// P40-P47.agc:700
//		VSQ	PDDL
// slot 25782
    25782, 54588,
// P40-P47.agc:701
//			36D
// slot 25783
    25783, 74,
// P40-P47.agc:702
//		DMP	DDV
// slot 25784
    25784, 47370,
// P40-P47.agc:703
//			THETACON
// slot 25785
    25785, 14868,
// P40-P47.agc:704
//		DMP	DMP
// slot 25786
    25786, 34058,
// P40-P47.agc:705
//			DELVSAB
// slot 25787
    25787, 3944,
// P40-P47.agc:706
//			WEIGHT/G
// slot 25788
    25788, 1354,
// P40-P47.agc:707
//		DDV
// slot 25789
    25789, 65394,
// P40-P47.agc:708
//			F
// slot 25790
    25790, 4026,
// P40-P47.agc:709
//		STOVL	14D
// slot 25791
    25791, 20510,
// P40-P47.agc:710
//			DELVSIN
// slot 25792
    25792, 3932,
// P40-P47.agc:711
//
// P40-P47.agc:712
//		DOT	VXSC
// slot 25793
    25793, 61762,
// P40-P47.agc:713
//			UT
// slot 25794
    25794, 3958,
// P40-P47.agc:714
//			UT
// slot 25795
    25795, 3958,
// P40-P47.agc:715
//		VSL2	PUSH		# (DELTAV.UP)UP SCALED AT 2(+7) P.D.L. 0
// slot 25796
    25796, 34516,
// P40-P47.agc:716
//		BVSU	PDDL		# DELTA VP SCALED AT 2(+7) P.D.L. 6
// slot 25797
    25797, 54602,
// P40-P47.agc:717
//			DELVSIN
// slot 25798
    25798, 3932,
// P40-P47.agc:718
//			14D
// slot 25799
    25799, 30,
// P40-P47.agc:719
//		SIN	PDVL
// slot 25800
    25800, 52700,
// P40-P47.agc:720
//			6D
// slot 25801
    25801, 14,
// P40-P47.agc:721
//		VXV	UNIT
// slot 25802
    25802, 44602,
// P40-P47.agc:722
//			UT
// slot 25803
    25803, 3958,
// P40-P47.agc:723
//		VXSC	STADR
// slot 25804
    25804, 38626,
// P40-P47.agc:724
//		STOVL	VGTIG		# UNIT(VP X UP)SIN(THETAT/2) IN VGTIG.
// slot 25805
    25805, 41084,
// P40-P47.agc:725
//		UNIT	PDDL		# UNIT(DELTA VP) IN P.D.L. 6
// slot 25806
    25806, 54620,
// P40-P47.agc:726
//			14D
// slot 25807
    25807, 30,
// P40-P47.agc:727
//		COS	VXSC
// slot 25808
    25808, 61900
)).

agcAotInstallSourceRope(list(
// P40-P47.agc:728
//		VAD	VXSC
// slot 25809
    25809, 61786,
// P40-P47.agc:729
//			VGTIG
// slot 25810
    25810, 3970,
// P40-P47.agc:730
//			36D
// slot 25811
    25811, 74,
// P40-P47.agc:731
//		VSL2 	VAD
// slot 25812
    25812, 44500,
// P40-P47.agc:732
//		STADR
// slot 25813
    25813, 65324,
// P40-P47.agc:733
//# Page 766
// P40-P47.agc:734
//		STORE	VGTIG		# VG IGNITION SCALED AT 2(+7) M/CS
// slot 25814
    25814, 61564,
// P40-P47.agc:735
//
// P40-P47.agc:736
//		UNIT
// slot 25815
    25815, 65372,
// P40-P47.agc:737
//		STOVL	UT		# THRUST DIRECTION SCALED AT 2(+1)
// slot 25816
    25816, 24438,
// P40-P47.agc:738
//			VGTIG
// slot 25817
    25817, 3970,
// P40-P47.agc:739
//		PUSH	CALL
// slot 25818
    25818, 37900,
// P40-P47.agc:740
//			GET.LVC		# VGTIG IN LV COOR AT 2(+7) M/CS IN DELVLVC
// slot 25819
    25819, 14262,
// P40-P47.agc:741
//		GOTO
// slot 25820
    25820, 65360,
// P40-P47.agc:742
//			QTEMP
// slot 25821
    25821, 3892,
// P40-P47.agc:743
//S40.1B		DLOAD
// slot 25822
    25822, 65482,
// P40-P47.agc:744
//			TIG
// slot 25823
    25823, 3652,
// P40-P47.agc:745
//		STORE	TDEC1
// slot 25824
    25824, 66,
// P40-P47.agc:746
//		BDSU
// slot 25825
    25825, 65314,
// P40-P47.agc:747
//			TPASS4
// slot 25826
    25826, 3890,
// P40-P47.agc:748
//		STCALL	DELLT4		# INTERCEPT TIME -- TIG.
// slot 25827
    25827, 32340,
// P40-P47.agc:749
//			LEMPREC
// slot 25828
    25828, 23646,
// P40-P47.agc:750
//		VLOAD	SETPD		# LOAD STATE VECTOR AT TIG FOR INITVEL.
// slot 25829
    25829, 33274,
// P40-P47.agc:751
//			RATT
// slot 25830
    25830, 2,
// P40-P47.agc:752
//			0
// slot 25831
    25831, 2,
// P40-P47.agc:753
//		STORE	RTIG
// slot 25832
    25832, 3908,
// P40-P47.agc:754
//		STORE	RINIT
// slot 25833
    25833, 2470,
// P40-P47.agc:755
//		UNIT
// slot 25834
    25834, 65372,
// P40-P47.agc:756
//		STOVL	UNIT/R/
// slot 25835
    25835, 24254,
// P40-P47.agc:757
//			VATT
// slot 25836
    25836, 14,
// P40-P47.agc:758
//		STORE	VTIG
// slot 25837
    25837, 3920,
// P40-P47.agc:759
//		STORE	VINIT
// slot 25838
    25838, 2482,
// P40-P47.agc:760
//		DLOAD	PDDL		# NUMIT = 0
// slot 25839
    25839, 54730,
// P40-P47.agc:761
//			ZEROVECS
// slot 25840
    25840, 6820,
// P40-P47.agc:762
//			EPS1
// slot 25841
    25841, 14860,
// P40-P47.agc:763
//		BOFF	DAD
// slot 25842
    25842, 36120,
// P40-P47.agc:764
//			NORMSW
// slot 25843
    25843, 4042,
// P40-P47.agc:765
//			SMALLEPS
// slot 25844
    25844, 47596,
// P40-P47.agc:766
//			EPS2		# EPSILON4 = 10 DEGREES OR 45 DEGREES.
// slot 25845
    25845, 14864,
// P40-P47.agc:767
//SMALLEPS	PUSH	SXA,1
// slot 25846
    25846, 55308,
// P40-P47.agc:768
//			RTX1
// slot 25847
    25847, 3068,
// P40-P47.agc:769
//		SXA,2	CALL
// slot 25848
    25848, 38072,
// P40-P47.agc:770
//			RTX2
// slot 25849
    25849, 3070,
// P40-P47.agc:771
//			INITVEL
// slot 25850
    25850, 18432,
// P40-P47.agc:772
//		VLOAD	PUSH
// slot 25851
    25851, 34554,
// P40-P47.agc:773
//			DELVEET3	# VGTIG = VR - VN.
// slot 25852
    25852, 2540,
// P40-P47.agc:774
//		STORE	VGTIG
// slot 25853
    25853, 3970,
// P40-P47.agc:775
//		UNIT			# UT = UNIT (VGTIG)
// slot 25854
    25854, 65372,
// P40-P47.agc:776
//		STODL	UT
// slot 25855
    25855, 16246,
// P40-P47.agc:777
//			36D
// slot 25856
    25856, 74,
// P40-P47.agc:778
//		STCALL	VGDISP		# CONVERT VGTIG (IN PUSHLIST) TO LOCAL
// slot 25857
    25857, 32616,
// P40-P47.agc:779
//			GET.LVC		# VERTICAL COORDINATES.
// slot 25858
    25858, 14262,
// P40-P47.agc:780
//		GOTO
// slot 25859
    25859, 65360,
// P40-P47.agc:781
//			QTEMP
// slot 25860
    25860, 3892,
// P40-P47.agc:782
//
// P40-P47.agc:783
//EPS1		2DEC*	2.777777778 E-2*	# 10 DEGREES AT 1 REVOLUTION
// slot 25861 25862
    25861, 910, 25862, 3640,
// P40-P47.agc:784
//
// P40-P47.agc:785
//# Page 767
// P40-P47.agc:786
//EPS2		2DEC*	9.722222222 E-2*	# 35 DEGREES AT 1 REVOLUTION.
// slot 25863 25864
    25863, 3184, 25864, 29128,
// P40-P47.agc:787
//
// P40-P47.agc:788
//THETACON	2DEC	.31830989 B-8
// slot 25865 25866
    25865, 40, 25866, 12184,
// P40-P47.agc:789
//
// P40-P47.agc:790
//# Page 768
// P40-P47.agc:791
//# SUBROUTINE NAME:  S40.2,3		MOD. NO. 3, DATE APRIL 4, 1967
// P40-P47.agc:792
//# MODIFICATION BY:  ADDELSTON KERMAN (ADAMS ASSOCIATES)
// P40-P47.agc:793
//# MOD. NO. 4:  JULY 18, 1967: ADLER KERMAN (MIT/IL)
// P40-P47.agc:794
//# MOD. NO. 5:  OCTOBER 18, 1967:  ADLER KERMAN (MIT/IL)
// P40-P47.agc:795
//# ORIGINALLY BY:  ZELDIN KERMAN (MIT INSTRUMENTATION LAB) AND TALAYCO KERMAN (SYSTEM DELVELOPMENT CORP)
// P40-P47.agc:796
//#
// P40-P47.agc:797
//# S40.2,3 COMPUTES "POINTVSM" WHICH IS THE HALF-UNIT DESIRED THRUST VECTOR IN STABLE-MEMBER COORDINATES FROM "UT"
// P40-P47.agc:798
//# WHICH IS THE SAME VECTOR IN REFERENCE COORDINATES.  IT DETERMINES THE CORRECT VALUES FOR "SCAXIS" USING THE +X
// P40-P47.agc:799
//# AXIS FOR DPS, APS, AND RCS BURNS.  THE "WINGS-LEVEL HEADS-UP" LM ORIENTATION IS THEN COMPUTED IN REFERENCE
// P40-P47.agc:800
//# COORDINATES.  THESE VECTORS ALSO DEFINE THE "PREFERRED IMU ORIENTATION".  UPON COMPLETION OF THIS CALCULATION,
// P40-P47.agc:801
//# THE "PREFERRED ATTITUDE COMPUTED" FLAG IS SET (PFRATFLG).
// P40-P47.agc:802
//#
// P40-P47.agc:803
//# CALLING SEQUENCE:
// P40-P47.agc:804
//#	L	CALL			# INTERPRETIVE CALL.
// P40-P47.agc:805
//#	L +1		S40.2,3
// P40-P47.agc:806
//#	L +2	(RETURN)		# GIMBAL ANGLE VECTOR IN MPAC.
// P40-P47.agc:807
//#
// P40-P47.agc:808
//# SUBROUTINES CALLED:  NONE.
// P40-P47.agc:809
//#
// P40-P47.agc:810
//# NORMAL RETURN:  L +2 (SEE CALLING SEQUENCE ABOVE).
// P40-P47.agc:811
//#
// P40-P47.agc:812
//# ALARM/ABORT MODES:  NONE.
// P40-P47.agc:813
//#
// P40-P47.agc:814
//# INPUT:
// P40-P47.agc:815
//#	1.	REFSMMAT	MATRIX FROM REFERENCE TO STABLE-MEMBER COORDINATES SCALED AT 2.
// P40-P47.agc:816
//#	2.	UT		HALF-UNIT DESIRED THRUST DIRECTION.
// P40-P47.agc:817
//#	3.	RTIG		POSITION AT TIG IN REFERENCE COORDINATES.
// P40-P47.agc:818
//#
// P40-P47.agc:819
//# OUTPUT:
// P40-P47.agc:820
//#	1.	`XSCREF'	WINGS-LEVEL HEADS-UP LM ORIENTATION
// P40-P47.agc:821
//#		`YSCREF'	IN REFERENCE COORDINATES
// P40-P47.agc:822
//#		`ZSCREF'	(PREFERRED IMU ORIENTATION).
// P40-P47.agc:823
//#	2.	POINTVSM	DESIRED THRUST DIRECTION IN STABLE-MEMBER COORDINATES.
// P40-P47.agc:824
//#	3.	SCAXIS		HALF-UNIT OF AXIS TO ALIGN IN STABLE-MEMBER COORDINATES.
// P40-P47.agc:825
//#	4.	PFRATFLG	INTERPRETIVE FLAG.  ON: PREFERRED ORIENTATION COMPUTED; OFF: NOT COMPUTED.
// P40-P47.agc:826
//#
// P40-P47.agc:827
//# DEBRIS:  NONE
// P40-P47.agc:828
//# Page 769
// P40-P47.agc:829
//
// P40-P47.agc:830
//		COUNT*	$$/S40.2
// P40-P47.agc:831
//S40.2,3		VLOAD			# UT:  DESIRED THRUST DIRECTION (HALF-UNIT)
// slot 25867
    25867, 65530,
// P40-P47.agc:832
//			UT		# (PUT INTO TOP OF PUSH-DOWN-LIST.)
// slot 25868
    25868, 3958,
// P40-P47.agc:833
//		MXV	VSL1		# TRANSFORM THRUST DIRECTION TO STABLE-
// slot 25869
    25869, 64162,
// P40-P47.agc:834
//			REFSMMAT	# MEMBER FROM REFERENCE COORDS (RESCALE).
// slot 25870
    25870, 1976,
// P40-P47.agc:835
//		STOVL	POINTVSM	# SAVE FOR "VECPOINT" ROUTINE (LEMMANU).
// slot 25871
    25871, 24566,
// P40-P47.agc:836
//			UNITX		# SCAXIS SET TO +X, FOR P40 AND P42 AND
// slot 25872
    25872, 6816,
// P40-P47.agc:837
//		STOVL	SCAXIS		# FOR P41 IF RCS NOT -X,+Y,-Y,+Z,-Z.
// slot 25873
    25873, 24554,
// P40-P47.agc:838
//
// P40-P47.agc:839
//			UT		# ASSUME +X BURN ALWAYS, EVEN FOR RCS.
// slot 25874
    25874, 3958,
// P40-P47.agc:840
//PLUSX		STORE	XSCREF		# XSCREF = UT (DESIRED THRUST DIRECTION)
// slot 25875
    25875, 3854,
// P40-P47.agc:841
//		VXV	UNIT		# RTIG = POSITION AT TIME-OF-IGNITION.
// slot 25876
    25876, 44602,
// P40-P47.agc:842
//			RTIG		# YSCREF = UNIT(UT X RTIG)
// slot 25877
    25877, 3908,
// P40-P47.agc:843
//		PDDL	BHIZ
// slot 25878
    25878, 39082,
// P40-P47.agc:844
//			36D		# TEST MAGNITUDE OF UT X RTIG
// slot 25879
    25879, 74,
// P40-P47.agc:845
//			FIXY		# IF SMALL, USE UT X VTIG AS YSC
// slot 25880
    25880, 47682,
// P40-P47.agc:846
//STORY		VLOAD	STADR
// slot 25881
    25881, 38650,
// P40-P47.agc:847
//		STORE	YSCREF
// slot 25882
    25882, 61668,
// P40-P47.agc:848
//		VXV	VSL1		# COMPUTE (YSCREF X XCREF), BUT FOR A
// slot 25883
    25883, 64058,
// P40-P47.agc:849
//			XSCREF		# RIGHT HANDED SYSTEM, NEED (X CROSS Y).
// slot 25884
    25884, 3854,
// P40-P47.agc:850
//		VCOMP			# ZSCREF = - (YSCREF X XSCREF)
// slot 25885
    25885, 65404,
// P40-P47.agc:851
//		STORE	ZSCREF		#        = + (XSCREF X YSCREF)
// slot 25886
    25886, 3878,
// P40-P47.agc:852
//
// P40-P47.agc:853
//		SET	RVQ
// slot 25887
    25887, 36376,
// P40-P47.agc:854
//			PFRATFLG
// slot 25888
    25888, 1142,
// P40-P47.agc:855
//FIXY		VLOAD	VXV		# IN THIS CASE,
// slot 25889
    25889, 40442
)).

agcAotInstallSourceRope(list(
// P40-P47.agc:856
//			XSCREF		# YSCREF = UNIT(XSCREF X VTIG)
// slot 25890
    25890, 3854,
// P40-P47.agc:857
//			VTIG
// slot 25891
    25891, 3920,
// P40-P47.agc:858
//		UNIT	PUSH
// slot 25892
    25892, 34396,
// P40-P47.agc:859
//		GOTO
// slot 25893
    25893, 65360,
// P40-P47.agc:860
//			STORY
// slot 25894
    25894, 47666,
// P40-P47.agc:861
//# Page 770
// P40-P47.agc:862
//# SUBROUTINE S40.8
// P40-P47.agc:863
//# MODIFIED APRIL 3, 1968 BY ADLER KERMAN, MIT/IL
// P40-P47.agc:864
//#
// P40-P47.agc:865
//# DESCRIPTION
// P40-P47.agc:866
//#	S40.8 UPDATES THE VELOCITY-TO-BE-GAINED VECTOR, VG, (AND FOR LAMBERT TARGETTED BURNS ALSO EXTRAPOLATES VG
// P40-P47.agc:867
//#	USING THE BDT VECTOR) COMPUTES THE TIME FOR ISSUING THE ENGINE OFF COMMAND, TGO, AND CALLS THE ROUTINE
// P40-P47.agc:868
//#	"FINDCDUW", WHICH GENERATES STEERING COMMANDS FOR THE DAP.
// P40-P47.agc:869
//#
// P40-P47.agc:870
//# CALLING SEQUENCE
// P40-P47.agc:871
//#	L-1	CALL
// P40-P47.agc:872
//#	L		S40.8
// P40-P47.agc:873
//#	L+1			INTERPRETIVE RETURN
// P40-P47.agc:874
//#
// P40-P47.agc:875
//# ALARM
// P40-P47.agc:876
//#	IF VG . DELVREF IS NEGATIVE (VG AND DELVREF OVER 90 DEGREES APART), BYPASS TGO AND STEERING COMPUTATIONS
// P40-P47.agc:877
//#	AND SET ALARM 1407.  RETURN TO CALLER NORMALLY.
// P40-P47.agc:878
//#
// P40-P47.agc:879
//# INPUT AND INITIALIZATION
// P40-P47.agc:880
//#	VGPREV		REFERENCE	2(7) M/CS
// P40-P47.agc:881
//#	DELVREF		REFERENCE	2(7) M/CS
// P40-P47.agc:882
//#	BDT		REFERENCE	2(7) M/CS
// P40-P47.agc:883
//#	TDECAY		TAIL-OFF TIME	2(28) CS
// P40-P47.agc:884
//#	XDELVFLG	1 = EXTERNAL DELTA-V; 0 = LAMBERT (AIMPOINT)
// P40-P47.agc:885
//#	STEERSW		1 = DO STEERING AND TGO COMPUTATIONS; 0 = VG UPDATE ONLY
// P40-P47.agc:886
//#	FIRSTFLG	1 = GONE TO LAMBERT AT LEAST ONCE; 0 = HAVEN'T GONE TO LAMBERT YET.
// P40-P47.agc:887
//#
// P40-P47.agc:888
//# NOTE:  VGTIG EQUALS VGPREV
// P40-P47.agc:889
//#
// P40-P47.agc:890
//# OUTPUT
// P40-P47.agc:891
//#	STEERSW		SEE INPUT
// P40-P47.agc:892
//#	INPULSW		1 = ENGINE OFF IN TGO CENTISECONDS; 0 = CONTINUE BURN
// P40-P47.agc:893
//#	TGO		TIME TO CUT-OFF 2(28) CS
// P40-P47.agc:894
//# 	SEE FINDCDUW FOR STEERING OUTPUTS.
// P40-P47.agc:895
//#
// P40-P47.agc:896
//# SUBROUTINE CALLED
// P40-P47.agc:897
//#	FINDCDUW
// P40-P47.agc:898
//#
// P40-P47.agc:899
//# DEBRIS
// P40-P47.agc:900
//#	MPACS, PUSHLIST
// P40-P47.agc:901
//
// P40-P47.agc:902
//		COUNT*	$$/S40.8
// P40-P47.agc:903
//# Page 771
// P40-P47.agc:904
//S40.8		BOF			# GENERATE VR IF NOT EXTERNAL DELTA-V BURN
// slot 25895
    25895, 65304,
// P40-P47.agc:905
//			XDELVFLG
// slot 25896
    25896, 1486,
// P40-P47.agc:906
//			RASTEER1
// slot 25897
    25897, 48050,
// P40-P47.agc:907
//		VLOAD	VSU
// slot 25898
    25898, 43514,
// P40-P47.agc:908
//			VGPREV
// slot 25899
    25899, 3970,
// P40-P47.agc:909
//			DELVREF
// slot 25900
    25900, 3758,
// P40-P47.agc:910
//VGAIN*		STORE	VG		# VELOCITY TO BE GAINED SCALED AT (7) M/CS
// slot 25901
    25901, 3982,
// P40-P47.agc:911
//		MXV	VSL1
// slot 25902
    25902, 64162,
// P40-P47.agc:912
//			REFSMMAT
// slot 25903
    25903, 1976,
// P40-P47.agc:913
//		STORE	UNFC/2
// slot 25904
    25904, 3416,
// P40-P47.agc:914
//BDTOK		VLOAD	ABVAL
// slot 25905
    25905, 42746,
// P40-P47.agc:915
//			VG
// slot 25906
    25906, 3982,
// P40-P47.agc:916
//		STORE	VGDISP
// slot 25907
    25907, 3944,
// P40-P47.agc:917
//TGDCALC		SETPD	VLOAD
// slot 25908
    25908, 64770,
// P40-P47.agc:918
//			0
// slot 25909
    25909, 2,
// P40-P47.agc:919
//			VG
// slot 25910
    25910, 3982,
// P40-P47.agc:920
//		STOVL	VGPREV
// slot 25911
    25911, 24450,
// P40-P47.agc:921
//			DELVREF
// slot 25912
    25912, 3758,
// P40-P47.agc:922
//		BOFF	VCOMP
// slot 25913
    25913, 48664,
// P40-P47.agc:923
//			STEERSW
// slot 25914
    25914, 1480,
// P40-P47.agc:924
//			QPRET
// slot 25915
    25915, 84,
// P40-P47.agc:925
//		UNIT
// slot 25916
    25916, 65372,
// P40-P47.agc:926
//		DOT	PUSH
// slot 25917
    25917, 34370,
// P40-P47.agc:927
//			VG
// slot 25918
    25918, 3982,
// P40-P47.agc:928
//		BPL	DDV
// slot 25919
    25919, 47432,
// P40-P47.agc:929
//			ALARMIT		# DELV IS MORE THAN 90 DEGREES FROM VG.
// slot 25920
    25920, 47788,
// P40-P47.agc:930
//			VEX
// slot 25921
    25921, 4038,
// P40-P47.agc:931
//		DAD	DMP
// slot 25922
    25922, 34074,
// P40-P47.agc:932
//			DPHALF
// slot 25923
    25923, 6816,
// P40-P47.agc:933
//		SR	DDV
// slot 25924
    25924, 47458,
// P40-P47.agc:934
//			10D
// slot 25925
    25925, 17174,
// P40-P47.agc:935
//			36D
// slot 25926
    25926, 74,
// P40-P47.agc:936
//		DMP	DAD
// slot 25927
    25927, 36106,
// P40-P47.agc:937
//			-FOURDT
// slot 25928
    25928, 15034,
// P40-P47.agc:938
//			TDECAY
// slot 25929
    25929, 4034,
// P40-P47.agc:939
//		STORE	TGO
// slot 25930
    25930, 3742,
// P40-P47.agc:940
//		DAD
// slot 25931
    25931, 65306,
// P40-P47.agc:941
//			PIPTIME
// slot 25932
    25932, 1338,
// P40-P47.agc:942
//		STODL	TIG
// slot 25933
    25933, 15940,
// P40-P47.agc:943
//			TGO
// slot 25934
    25934, 3742,
// P40-P47.agc:944
//		DSU	BPL
// slot 25935
    25935, 42026,
// P40-P47.agc:945
//			FOURSECS	# 400 CS
// slot 25936
    25936, 15038,
// P40-P47.agc:946
//			FINDCDUW -2
// slot 25937
    25937, 50322,
// P40-P47.agc:947
//		SET	CLRGO
// slot 25938
    25938, 35864,
// P40-P47.agc:948
//			IMPULSW
// slot 25939
    25939, 1132,
// P40-P47.agc:949
//			STEERSW
// slot 25940
    25940, 1320,
// P40-P47.agc:950
//			QPRET
// slot 25941
    25941, 84,
// P40-P47.agc:951
//
// P40-P47.agc:952
//ALARMIT		EXIT
// slot 25942
    25942, 65532
)).

// bank 27, slots 25943-25943
function agcAotUnit1664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:953
//
// P40-P47.agc:954
//# Page 772
// P40-P47.agc:955
//		TC	ALARM
// slot 25943
    if slot <> 25943 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1664] to agcAotUnit1664@.

agcAotInstallSourceRope(list(
// P40-P47.agc:956
//		OCT	01407
// slot 25944
    25944, 1550
)).

// bank 27, slots 25945-25945
function agcAotUnit1665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:957
//		TC	INTPRET
// slot 25945
    if slot <> 25945 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1665] to agcAotUnit1665@.

agcAotInstallSourceRope(list(
// P40-P47.agc:958
//		GOTO			# SKIP TGO COMPUTATION BUT CALL FINDCDUW.
// slot 25946
    25946, 65360,
// P40-P47.agc:959
//			FINDCDUW -2	# FINDCDUW WILL EXIT TO UPDATEVG +3.
// slot 25947
    25947, 50322,
// P40-P47.agc:960
//
// P40-P47.agc:961
//-FOURDT		2DEC	-800 B-18	# -4 (200 CS.) B(-18)
// slot 25948 25949
    25948, 65434, 25949, 65534,
// P40-P47.agc:962
//FOURSECS	2DEC	400		# 400 CS SCALED AT 2(+28) CS
// slot 25950 25951
    25950, 0, 25951, 800
)).

// bank 27, slots 25952-25952
function agcAotUnit1666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:963
//2VEXHUST	=	VEX
// P40-P47.agc:964
//
// P40-P47.agc:965
//# Page 773
// P40-P47.agc:966
//# NAME:  		S40.13 -- TIMEBURN
// P40-P47.agc:967
//#
// P40-P47.agc:968
//# FUNCTION		(1) DETERMINE WHETHER A GIVEN COMBINATION OF VELOCITY TO
// P40-P47.agc:969
//#			BE GAINED AND ENGINE CHOICE RESULT IN A BURN TIME
// P40-P47.agc:970
//#			SUFFICIENT TO ALLOW STEERING AT THE VEHICLE DURING THE
// P40-P47.agc:971
//#			BURN
// P40-P47.agc:972
//#			(2) THE MAGNITUDE OF THE RESULTING BURN TIME -- IF IT
// P40-P47.agc:973
//#			IS SHORT -- AND THE ASSOCIATED TIME OF THE ENGINE OFF
// P40-P47.agc:974
//#			SIGNAL
// P40-P47.agc:975
//#
// P40-P47.agc:976
//# CALLING SEQUENCE	VIA FINDVAC AS A NEW JOB
// P40-P47.agc:977
//#
// P40-P47.agc:978
//# INPUT			VGTIG -- VELOCITY TO BE GAINED VECTOR (METERS/CS) AT +7
// P40-P47.agc:979
//#			WEIGHT/G -- MASS OF VEHICLE IN KGM AT +16
// P40-P47.agc:980
//#			F -- APS ENGINE THRUST IN M.NEWTONS AT +7
// P40-P47.agc:981
//#				AND ALSO FOR RCS ENGINE
// P40-P47.agc:982
//#			MDOT -- RATE OF DECREASE OF VEHICLE MASS DURING ENGINE
// P40-P47.agc:983
//#				BURN IN KILOGRAMS/CS AT +3.  THIS SCALING MAY
// P40-P47.agc:984
//#				REQUIRE MODIFICATION FOR ACAPELLO BURNS.
// P40-P47.agc:985
//#			ENG1FLAG -- SWITCH TO DECIDE WHETHER APS OR DPS ENGINE IS USED
// P40-P47.agc:986
//#				=0	DPS
// P40-P47.agc:987
//#				=1	APS
// P40-P47.agc:988
//#
// P40-P47.agc:989
//# OUTPUT		IMPULSW		ZERO FOR STEERING
// P40-P47.agc:990
//#					ONE FOR ATTITUDE HOLD
// P40-P47.agc:991
//#			NOTHROTL	ZERO FOR THROTTLING
// P40-P47.agc:992
//#					ONE TO INHIBIT THROTTLING
// P40-P47.agc:993
//#			TGO		TIME TO BURN IN CS
// P40-P47.agc:994
//#
// P40-P47.agc:995
//#			THE QUANTITY M.NEWTON = 10000 NEWTONS WILL BE USED TO EXPRESS
// P40-P47.agc:996
//#			FORCE.
// P40-P47.agc:997
//
// P40-P47.agc:998
//		EBANK=	TGO
// P40-P47.agc:999
//		COUNT*	$$/40.13
// P40-P47.agc:1000
//S40.13		TC	INTPRET
// slot 25952
    if slot <> 25952 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1666] to agcAotUnit1666@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1001
//		SETPD	CLEAR
// slot 25953
    25953, 35842,
// P40-P47.agc:1002
//			00D
// slot 25954
    25954, 2,
// P40-P47.agc:1003
//			IMPULSW		# ASSUME NO STEERING UNTIL FOUND OTHERWISE
// slot 25955
    25955, 1388,
// P40-P47.agc:1004
//		VLOAD	ABVAL
// slot 25956
    25956, 42746,
// P40-P47.agc:1005
//			VGTIG		# VELOCITY TO BE GAINED AT +7
// slot 25957
    25957, 3970,
// P40-P47.agc:1006
//		PDDL	DMP		# 00D = MAG OF VGTIG AT +7
// slot 25958
    25958, 34218,
// P40-P47.agc:1007
//			4SEC(17)	# CORRECT VG FOR 4 SECS OF 2 JET ULLAGE
// slot 25959
    25959, 17442,
// P40-P47.agc:1008
//			FRCS2
// slot 25960
    25960, 28702,
// P40-P47.agc:1009
//		DDV	SL1		# SCALE
// slot 25961
    25961, 60018,
// P40-P47.agc:1010
//			WEIGHT/G
// slot 25962
    25962, 1354,
// P40-P47.agc:1011
//		BDSU	PUSH
// slot 25963
    25963, 34338,
// P40-P47.agc:1012
//		BOFF	SET
// slot 25964
    25964, 35864,
// P40-P47.agc:1013
//			APSFLAG
// slot 25965
    25965, 5572,
// P40-P47.agc:1014
//			S40.13D		# FOR DPS ENGINE
// slot 25966
    25966, 47916,
// P40-P47.agc:1015
//			NOTHROTL
// slot 25967
    25967, 2662,
// P40-P47.agc:1016
//		DLOAD	DDV		# 00D = MAG OF VGTIG CORRECTED
// slot 25968
    25968, 47562,
// P40-P47.agc:1017
//			K1VAL		# M.NEWTONS-CS AT +24
// slot 25969
    25969, 14338,
// P40-P47.agc:1018
//			WEIGHT/G
// slot 25970
    25970, 1354,
// P40-P47.agc:1019
//		BDSU	BMN
// slot 25971
    25971, 40994,
// P40-P47.agc:1020
//# Page 774
// P40-P47.agc:1021
//			00D
// slot 25972
    25972, 2,
// P40-P47.agc:1022
//			S40.131		# TGO LESS THAN 100 CS
// slot 25973
    25973, 47888,
// P40-P47.agc:1023
//		PDDL	DMP		# 02D = TEMP1 AT +7
// slot 25974
    25974, 34218,
// P40-P47.agc:1024
//			MDOT
// slot 25975
    25975, 4030,
// P40-P47.agc:1025
//
// P40-P47.agc:1026
//# MDOT REPRESENTS THE RATE OF DECREASE OF VEHICLE MASS DURING ENGINE
// P40-P47.agc:1027
//# BURN IN KILOGRAMS/CS.  WHEN ACAPELLO IS USED, THE SCALING MAY
// P40-P47.agc:1028
//# REQUIRE ADJUSTMENT.
// P40-P47.agc:1029
//
// P40-P47.agc:1030
//			3.5SEC		# 350 CS AT +14
// slot 25976
    25976, 15232,
// P40-P47.agc:1031
//		BDSU	PDDL
// slot 25977
    25977, 54562,
// P40-P47.agc:1032
//			WEIGHT/G
// slot 25978
    25978, 1354,
// P40-P47.agc:1033
//			F
// slot 25979
    25979, 4026,
// P40-P47.agc:1034
//		DMP	SR2		# SCALE
// slot 25980
    25980, 49674,
// P40-P47.agc:1035
//			5SECS
// slot 25981
    25981, 15236,
// P40-P47.agc:1036
//		DDV	PUSH		# 04D = TEMP2
// slot 25982
    25982, 34418,
// P40-P47.agc:1037
//		BDSU	BPL
// slot 25983
    25983, 42018,
// P40-P47.agc:1038
//			02D
// slot 25984
    25984, 6,
// P40-P47.agc:1039
//			S40.13D
// slot 25985
    25985, 47916,
// P40-P47.agc:1040
//		DLOAD	BDDV
// slot 25986
    25986, 46538,
// P40-P47.agc:1041
//		DMP	DAD
// slot 25987
    25987, 36106,
// P40-P47.agc:1042
//			5SECS
// slot 25988
    25988, 15236,
// P40-P47.agc:1043
//			1SEC2D		# 100 CS AT +14
// slot 25989
    25989, 15228,
// P40-P47.agc:1044
//		GOTO
// slot 25990
    25990, 65360,
// P40-P47.agc:1045
//			S40.132
// slot 25991
    25991, 47900,
// P40-P47.agc:1046
//S40.131		DLOAD	DMP
// slot 25992
    25992, 34250,
// P40-P47.agc:1047
//			WEIGHT/G
// slot 25993
    25993, 1354,
// P40-P47.agc:1048
//		SR1	PUSH
// slot 25994
    25994, 34500,
// P40-P47.agc:1049
//		DAD	DDV
// slot 25995
    25995, 47386,
// P40-P47.agc:1050
//			K2VAL		# M.NEWTON CS AT +24
// slot 25996
    25996, 14342,
// P40-P47.agc:1051
//			K3VAL		# M.NEWTON CS AT +10
// slot 25997
    25997, 14346,
// P40-P47.agc:1052
//S40.132		SET	EXIT
// slot 25998
    25998, 65048,
// P40-P47.agc:1053
//			IMPULSW
// slot 25999
    25999, 1132
)).

// bank 27, slots 26000-26005
function agcAotUnit1667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26002 {
        if slot <= 26000 {
// P40-P47.agc:1054
//S40.132*	TC	TPAGREE
// slot 26000
            if slot <> 26000 or instruction <> 3759 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3759, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26001 {
// P40-P47.agc:1055
//		CA	MPAC
// slot 26001
                if slot <> 26001 or instruction <> 12396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1056
//		XCH	L
// slot 26002
                if slot <> 26002 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26003 {
// P40-P47.agc:1057
//		CA	ZERO
// slot 26003
            if slot <> 26003 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26004 {
// P40-P47.agc:1058
//		DXCH	TGO
// slot 26004
                if slot <> 26004 or instruction <> 22351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 847, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1059
//		TCF	S40.134
// slot 26005
                if slot <> 26005 or instruction <> 5544 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5544, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1667] to agcAotUnit1667@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1060
//
// P40-P47.agc:1061
//S40.13D		DLOAD	DMP		# FOR DPS ENGINE
// slot 26006
    26006, 34250,
// P40-P47.agc:1062
//			00D
// slot 26007
    26007, 2,
// P40-P47.agc:1063
//			WEIGHT/G
// slot 26008
    26008, 1354,
// P40-P47.agc:1064
//		PUSH	BON
// slot 26009
    26009, 35852,
// P40-P47.agc:1065
//			APSFLAG
// slot 26010
    26010, 5508,
// P40-P47.agc:1066
//			APSTGO
// slot 26011
    26011, 47986,
// P40-P47.agc:1067
//		DDV	CLEAR
// slot 26012
    26012, 35954,
// P40-P47.agc:1068
//			S40.136
// slot 26013
    26013, 14350,
// P40-P47.agc:1069
//			NOTHROTL
// slot 26014
    26014, 2918,
// P40-P47.agc:1070
//		BOV	PUSH
// slot 26015
    26015, 34304,
// P40-P47.agc:1071
//# Page 775
// P40-P47.agc:1072
//			S40.130V
// slot 26016
    26016, 47958,
// P40-P47.agc:1073
//S40.127		DSU	BPL
// slot 26017
    26017, 42026,
// P40-P47.agc:1074
//			6SEC		# 600.0 CS AT +14
// slot 26018
    26018, 15240,
// P40-P47.agc:1075
//			S40.138
// slot 26019
    26019, 47970,
// P40-P47.agc:1076
//		DAD	GOTO
// slot 26020
    26020, 43034,
// P40-P47.agc:1077
//			6SEC
// slot 26021
    26021, 15240,
// P40-P47.agc:1078
//			S40.132
// slot 26022
    26022, 47900,
// P40-P47.agc:1079
//S40.133		EXIT
// slot 26023
    26023, 65532
)).

// bank 27, slots 26024-26024
function agcAotUnit1668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1080
//S40.134		TC	PHASCHNG
// slot 26024
    if slot <> 26024 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1668] to agcAotUnit1668@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1081
//		OCT	00003
// slot 26025
    26025, 6
)).

// bank 27, slots 26026-26026
function agcAotUnit1669 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1082
//		TC	ENDOFJOB
// slot 26026
    if slot <> 26026 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1669] to agcAotUnit1669@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1083
//S40.130V	DLOAD	SR4		# RECOMPUTED TGO IN TIMER UNITS
// slot 26027
    26027, 33482,
// P40-P47.agc:1084
//		DDV
// slot 26028
    26028, 65394,
// P40-P47.agc:1085
//			S40.136_	# S40.136 SHIFTED LEFT 10
// slot 26029
    26029, 14354,
// P40-P47.agc:1086
//		STORE	TGO
// slot 26030
    26030, 3742,
// P40-P47.agc:1087
//		EXIT
// slot 26031
    26031, 65532
)).

// bank 27, slots 26032-26032
function agcAotUnit1670 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1088
//		TCF	S40.134		# REJOIN COMMON CODING FOR RESTART PROTECT
// slot 26032
    if slot <> 26032 or instruction <> 5544 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5544, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1670] to agcAotUnit1670@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1089
//
// P40-P47.agc:1090
//S40.138		DSU	BPL
// slot 26033
    26033, 42026,
// P40-P47.agc:1091
//			89SECS
// slot 26034
    26034, 15244,
// P40-P47.agc:1092
//			STORETGO
// slot 26035
    26035, 47980,
// P40-P47.agc:1093
//		SET
// slot 26036
    26036, 65304,
// P40-P47.agc:1094
//			NOTHROTL
// slot 26037
    26037, 2662,
// P40-P47.agc:1095
//STORETGO	DLOAD			# LOAD TGO AT 2(14)
// slot 26038
    26038, 65482,
// P40-P47.agc:1096
//		EXIT
// slot 26039
    26039, 65532
)).

// bank 27, slots 26040-26040
function agcAotUnit1671 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1097
//		TCF	S40.132*
// slot 26040
    if slot <> 26040 or instruction <> 5520 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5520, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1671] to agcAotUnit1671@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1098
//
// P40-P47.agc:1099
//APSTGO		DDV	SL2
// slot 26041
    26041, 51826,
// P40-P47.agc:1100
//			FAPS
// slot 26042
    26042, 28686,
// P40-P47.agc:1101
//		GOTO
// slot 26043
    26043, 65360,
// P40-P47.agc:1102
//			STORETGO +1
// slot 26044
    26044, 47982,
// P40-P47.agc:1103
//1SEC2D		2DEC	100.0 B-14	# 100.0 CS AT +14
// slot 26045 26046
    26045, 200, 26046, 0,
// P40-P47.agc:1104
//
// P40-P47.agc:1105
//3.5SEC		2DEC	350.0 B-13	# 350 CS AT +13
// slot 26047 26048
    26047, 1400, 26048, 0,
// P40-P47.agc:1106
//
// P40-P47.agc:1107
//5SECS		2DEC	500.0 B-14	# 500.0 CS AT +14
// slot 26049 26050
    26049, 1000, 26050, 0,
// P40-P47.agc:1108
//
// P40-P47.agc:1109
//6SEC		2DEC	600.0 B-14	# 600.0 CS AT +14
// slot 26051 26052
    26051, 1200, 26052, 0,
// P40-P47.agc:1110
//
// P40-P47.agc:1111
//89SECS		2DEC	8900.0 B-14
// slot 26053 26054
    26053, 17800, 26054, 0
)).

// bank 27, slots 26055-26055
function agcAotUnit1672 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1112
//
// P40-P47.agc:1113
//# FUNCTION		(1) GENERATES REQUIRED VELOCITY AND VELOCITY-TO-BE-GAINED
// P40-P47.agc:1114
//#			VECTORS FOR USE DURING AIMPOINT MANEUVERS EVERY TWO
// P40-P47.agc:1115
//#			COMPUTATION CYCLES (4 SECONDS).
// P40-P47.agc:1116
//#			(2) UPDATES THE B VECTOR WHICH IS USED IN THE FINAL
// P40-P47.agc:1117
//#			CALCULATION OF EXTRAPOLATING THE VELOCITY-TO-BE-GAINED
// P40-P47.agc:1118
//#			THROUGH ONE 2-SECOND INTERVAL INTO THE FUTURE.
// P40-P47.agc:1119
//#
// P40-P47.agc:1120
//# CALLING SEQUENCE	VIA FINDVAC AS NEW JOB.
// P40-P47.agc:1121
//#
// P40-P47.agc:1122
//# INPUT			RN	ACTIVE VEHICLE RADIUS VECTOR IN METERS AT +29
// P40-P47.agc:1123
//#			VN	ACTIVE VEHICLE VELOCITY VECTOR IN METERS/CS AT +7
// P40-P47.agc:1124
//# Page 776
// P40-P47.agc:1125
//#			VPREV	LAST COMPUTED VELOCITY REQUIRED VECTOR IN
// P40-P47.agc:1126
//#				METERS/CS AT +7.
// P40-P47.agc:1127
//#			TIG	TIME OF IGNITION IN CS AT +28.
// P40-P47.agc:1128
//#			DLTARG	COMPUTATION CYCLE INTERVAL = 200 CS AT +28.
// P40-P47.agc:1129
//#			PIPTIME	TIME OF RN AND VN IN CS AT +28.
// P40-P47.agc:1130
//#			GDT/2	HALF OF VELOCITY GAINED IN DELTA T TIME DUE TO
// P40-P47.agc:1131
//#				ACCELERATION OF GRAVITY IN METERS/CS AT +7.
// P40-P47.agc:1132
//#			DELVREF	CHANGE IN VELOCITY DURING LAST 2 SEC IN
// P40-P47.agc:1133
//#				METERS/CS AT +7.
// P40-P47.agc:1134
//#
// P40-P47.agc:1135
//# OUTPUT		VGPREV	VELOCITY TO BE GAINED VECTOR IN METERS/CS AT +7.
// P40-P47.agc:1136
//#			VGDISP	MAG OF VGPREV FOR DISPLAY PURPOSES.
// P40-P47.agc:1137
//#			VRPREV	VELOCTY REQUIRED VECTOR IN METERS/CS AT +7.
// P40-P47.agc:1138
//#			BDT	B VECTOR IN METERS/CS AT +7.
// P40-P47.agc:1139
//#
// P40-P47.agc:1140
//# SUBROUTINES USED	INITVEL
// P40-P47.agc:1141
//
// P40-P47.agc:1142
//		EBANK=	VGPREV
// P40-P47.agc:1143
//		COUNT*	$$/S40.9
// P40-P47.agc:1144
//S40.9		TC	INTPRET
// slot 26055
    if slot <> 26055 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1672] to agcAotUnit1672@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1145
//		SETPD
// slot 26056
    26056, 65282,
// P40-P47.agc:1146
//			00D
// slot 26057
    26057, 2,
// P40-P47.agc:1147
//		SET	DLOAD
// slot 26058
    26058, 58648,
// P40-P47.agc:1148
//			AVFLAG		# SET AVFLAG FOR LEM ACTIVE
// slot 26059
    26059, 1140,
// P40-P47.agc:1149
//			HI6ZEROS
// slot 26060
    26060, 6820,
// P40-P47.agc:1150
//		PDDL
// slot 26061
    26061, 65450,
// P40-P47.agc:1151
//			EPS1
// slot 26062
    26062, 14860,
// P40-P47.agc:1152
//		BOFF	DAD		# EPSILON4 = 10 OR 45 DEGREES.
// slot 26063
    26063, 36120,
// P40-P47.agc:1153
//			NORMSW
// slot 26064
    26064, 4042,
// P40-P47.agc:1154
//			EPSSMALL
// slot 26065
    26065, 48038,
// P40-P47.agc:1155
//			EPS2
// slot 26066
    26066, 14864,
// P40-P47.agc:1156
//EPSSMALL	PUSH	CALL
// slot 26067
    26067, 37900,
// P40-P47.agc:1157
//			HAVEGUES
// slot 26068
    26068, 18436,
// P40-P47.agc:1158
//ENDS40.9	EXIT
// slot 26069
    26069, 65532
)).

// bank 27, slots 26070-26070
function agcAotUnit1673 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1159
//		TC	PHASCHNG
// slot 26070
    if slot <> 26070 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1673] to agcAotUnit1673@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1160
//		OCT	2
// slot 26071
    26071, 4
)).

// bank 27, slots 26072-26072
function agcAotUnit1674 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1161
//		TCF	ENDOFJOB
// slot 26072
    if slot <> 26072 or instruction <> 6765 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6765, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1674] to agcAotUnit1674@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1162
//
// P40-P47.agc:1163
//RASTEER1	VLOAD	ABVAL
// slot 26073
    26073, 42746,
// P40-P47.agc:1164
//			RN
// slot 26074
    26074, 1314,
// P40-P47.agc:1165
//		LXC,2	SL*
// slot 26075
    26075, 45000,
// P40-P47.agc:1166
//			RTX2
// slot 26076
    26076, 3070,
// P40-P47.agc:1167
//			0,2
// slot 26077
    26077, 48892,
// P40-P47.agc:1168
//		STOVL	RMAG
// slot 26078
    26078, 24474,
// P40-P47.agc:1169
//			RTARG
// slot 26079
    26079, 3656,
// P40-P47.agc:1170
//		VSU	RTB
// slot 26080
    26080, 40018,
// P40-P47.agc:1171
//			RN
// slot 26081
    26081, 1314,
// P40-P47.agc:1172
//			NORMUNX1
// slot 26082
    26082, 18344,
// P40-P47.agc:1173
//		STODL	IC
// slot 26083
    26083, 16220,
// P40-P47.agc:1174
//			36D		# C(36D) = ABVAL(C)
// slot 26084
    26084, 74,
// P40-P47.agc:1175
//		XAD,2	SL*
// slot 26085
    26085, 44920,
// P40-P47.agc:1176
//			X1
// slot 26086
    26086, 76,
// P40-P47.agc:1177
//# Page 777
// P40-P47.agc:1178
//			0,2
// slot 26087
    26087, 48892,
// P40-P47.agc:1179
//		STORE	30D
// slot 26088
    26088, 62,
// P40-P47.agc:1180
//		NORM	DMP
// slot 26089
    26089, 34178,
// P40-P47.agc:1181
//			X2
// slot 26090
    26090, 80,
// P40-P47.agc:1182
//			RMAG
// slot 26091
    26091, 3994,
// P40-P47.agc:1183
//		NORM	XAD,2
// slot 26092
    26092, 48258,
// P40-P47.agc:1184
//			X1
// slot 26093
    26093, 78,
// P40-P47.agc:1185
//			X1
// slot 26094
    26094, 76,
// P40-P47.agc:1186
//		SXA,2
// slot 26095
    26095, 65464,
// P40-P47.agc:1187
//			MUSCALE
// slot 26096
    26096, 4076,
// P40-P47.agc:1188
//		STODL	R1C		#			2(+56 -X)
// slot 26097
    26097, 16298,
// P40-P47.agc:1189
//			30D
// slot 26098
    26098, 62,
// P40-P47.agc:1190
//		SR1	PDDL
// slot 26099
    26099, 54724,
// P40-P47.agc:1191
//			RMAG
// slot 26100
    26100, 3994,
// P40-P47.agc:1192
//		SR1	PDDL
// slot 26101
    26101, 54724,
// P40-P47.agc:1193
//			RTMAG
// slot 26102
    26102, 4006,
// P40-P47.agc:1194
//		SR1	DAD
// slot 26103
    26103, 36292,
// P40-P47.agc:1195
//		DAD	STADR
// slot 26104
    26104, 38426,
// P40-P47.agc:1196
//		STORE	SS		# SS = (R1 + R2 + C)/2
// slot 26105
    26105, 61512,
// P40-P47.agc:1197
//		DSU	DMP
// slot 26106
    26106, 34090,
// P40-P47.agc:1198
//			30D
// slot 26107
    26107, 62,
// P40-P47.agc:1199
//			MU/A
// slot 26108
    26108, 4002,
// P40-P47.agc:1200
//		BDSU
// slot 26109
    26109, 65314,
// P40-P47.agc:1201
//			MUASTEER
// slot 26110
    26110, 3998,
// P40-P47.agc:1202
//		PDDL	DSU
// slot 26111
    26111, 38314,
// P40-P47.agc:1203
//			SS
// slot 26112
    26112, 4022,
// P40-P47.agc:1204
//			RMAG
// slot 26113
    26113, 3994,
// P40-P47.agc:1205
//		NORM	SR1
// slot 26114
    26114, 57986,
// P40-P47.agc:1206
//			X1
// slot 26115
    26115, 78,
// P40-P47.agc:1207
//		DDV	DMP
// slot 26116
    26116, 34162,
// P40-P47.agc:1208
//			R1C
// slot 26117
    26117, 4010,
// P40-P47.agc:1209
//		XSU,2	SL*
// slot 26118
    26118, 44904,
// P40-P47.agc:1210
//			X1
// slot 26119
    26119, 76,
// P40-P47.agc:1211
//			1,2
// slot 26120
    26120, 48890,
// P40-P47.agc:1212
//		LXA,2
// slot 26121
    26121, 65496,
// P40-P47.agc:1213
//			MUSCALE
// slot 26122
    26122, 4076,
// P40-P47.agc:1214
//		SQRT	SIGN
// slot 26123
    26123, 62956,
// P40-P47.agc:1215
//			GEOMSGN
// slot 26124
    26124, 2934,
// P40-P47.agc:1216
//		STORE	32D		# + OR - A
// slot 26125
    26125, 66,
// P40-P47.agc:1217
//		DLOAD	DMP
// slot 26126
    26126, 34250,
// P40-P47.agc:1218
//			SS
// slot 26127
    26127, 4022,
// P40-P47.agc:1219
//			MU/A
// slot 26128
    26128, 4002,
// P40-P47.agc:1220
//		BDSU
// slot 26129
    26129, 65314,
// P40-P47.agc:1221
//			MUASTEER
// slot 26130
    26130, 3998,
// P40-P47.agc:1222
//		PDDL	DSU
// slot 26131
    26131, 38314,
// P40-P47.agc:1223
//			SS
// slot 26132
    26132, 4022,
// P40-P47.agc:1224
//			RTMAG
// slot 26133
    26133, 4006,
// P40-P47.agc:1225
//		NORM	SR1
// slot 26134
    26134, 57986,
// P40-P47.agc:1226
//			X1
// slot 26135
    26135, 78,
// P40-P47.agc:1227
//		DDV	DMP
// slot 26136
    26136, 34162,
// P40-P47.agc:1228
//
// P40-P47.agc:1229
//# Page 778
// P40-P47.agc:1230
//			R1C
// slot 26137
    26137, 4010,
// P40-P47.agc:1231
//		XSU,2	SL*
// slot 26138
    26138, 44904,
// P40-P47.agc:1232
//			X1
// slot 26139
    26139, 76,
// P40-P47.agc:1233
//			1,2
// slot 26140
    26140, 48890,
// P40-P47.agc:1234
//		SQRT	PDDL		# -B (NO SIGN)
// slot 26141
    26141, 54764,
// P40-P47.agc:1235
//			SS
// slot 26142
    26142, 4022,
// P40-P47.agc:1236
//		DSU	DDV
// slot 26143
    26143, 47402,
// P40-P47.agc:1237
//			30D
// slot 26144
    26144, 62,
// P40-P47.agc:1238
//			SS
// slot 26145
    26145, 4022,
// P40-P47.agc:1239
//		SQRT	PUSH
// slot 26146
    26146, 34540,
// P40-P47.agc:1240
//		SR1	ASIN
// slot 26147
    26147, 57028,
// P40-P47.agc:1241
//		DMP	PDDL
// slot 26148
    26148, 54538,
// P40-P47.agc:1242
//			2PI+3
// slot 26149
    26149, 15644,
// P40-P47.agc:1243
//		PDDL	DDV
// slot 26150
    26150, 47530,
// P40-P47.agc:1244
//			30D
// slot 26151
    26151, 62,
// P40-P47.agc:1245
//			SS
// slot 26152
    26152, 4022,
// P40-P47.agc:1246
//		BOV
// slot 26153
    26153, 65280,
// P40-P47.agc:1247
//			+1
// slot 26154
    26154, 48214,
// P40-P47.agc:1248
//		SQRT	DMP
// slot 26155
    26155, 34284,
// P40-P47.agc:1249
//		SR3	BDSU
// slot 26156
    26156, 37188,
// P40-P47.agc:1250
//		SIGN	PDDL
// slot 26157
    26157, 54762,
// P40-P47.agc:1251
//			GEOMSGN
// slot 26158
    26158, 2934,
// P40-P47.agc:1252
//			2PI+3
// slot 26159
    26159, 15644,
// P40-P47.agc:1253
//		SR2	DSU
// slot 26160
    26160, 38276,
// P40-P47.agc:1254
//		DMP	PDDL
// slot 26161
    26161, 54538,
// P40-P47.agc:1255
//			SS
// slot 26162
    26162, 4022,
// P40-P47.agc:1256
//			SS
// slot 26163
    26163, 4022,
// P40-P47.agc:1257
//		SR3	SQRT
// slot 26164
    26164, 63044,
// P40-P47.agc:1258
//		DMP
// slot 26165
    26165, 65290,
// P40-P47.agc:1259
//		PDDL	SL3
// slot 26166
    26166, 43690,
// P40-P47.agc:1260
//			MUASTEER
// slot 26167
    26167, 3998,
// P40-P47.agc:1261
//		SQRT	BDDV
// slot 26168
    26168, 46572,
// P40-P47.agc:1262
//		DSU	DAD
// slot 26169
    26169, 36138,
// P40-P47.agc:1263
//			TPASS4
// slot 26170
    26170, 3890,
// P40-P47.agc:1264
//			PIPTIME
// slot 26171
    26171, 1338,
// P40-P47.agc:1265
//		STODL	30D
// slot 26172
    26172, 12350,
// P40-P47.agc:1266
//		SIGN
// slot 26173
    26173, 65514,
// P40-P47.agc:1267
//			30D		# B WITH SIGN
// slot 26174
    26174, 62,
// P40-P47.agc:1268
//		STORE	30D
// slot 26175
    26175, 62,
// P40-P47.agc:1269
//		BON	VLOAD
// slot 26176
    26176, 64792,
// P40-P47.agc:1270
//			NORMSW
// slot 26177
    26177, 3978,
// P40-P47.agc:1271
//			180MESS
// slot 26178
    26178, 48294,
// P40-P47.agc:1272
//			IC
// slot 26179
    26179, 3932,
// P40-P47.agc:1273
//		VSU	UNIT
// slot 26180
    26180, 44626,
// P40-P47.agc:1274
//			UNIT/R/
// slot 26181
    26181, 3774,
// P40-P47.agc:1275
//		VXSC	PDVL
// slot 26182
    26182, 52706,
// P40-P47.agc:1276
//			30D
// slot 26183
    26183, 62,
// P40-P47.agc:1277
//			IC
// slot 26184
    26184, 3932,
// P40-P47.agc:1278
//		VAD	UNIT
// slot 26185
    26185, 44634,
// P40-P47.agc:1279
//			UNIT/R/
// slot 26186
    26186, 3774,
// P40-P47.agc:1280
//# Page 779
// P40-P47.agc:1281
//GETVRVG1	VXSC	VAD
// slot 26187
    26187, 44514,
// P40-P47.agc:1282
//			32D
// slot 26188
    26188, 66,
// P40-P47.agc:1283
//GETVRVG2	LXC,2	VSR*
// slot 26189
    26189, 45000,
// P40-P47.agc:1284
//			RTX2
// slot 26190
    26190, 3070,
// P40-P47.agc:1285
//			0 	-1,2
// slot 26191
    26191, 48382,
// P40-P47.agc:1286
//		STORE	VIPRIME
// slot 26192
    26192, 2494,
// P40-P47.agc:1287
//		GOTO
// slot 26193
    26193, 65360,
// P40-P47.agc:1288
//			ASTREND -2
// slot 26194
    26194, 48364,
// P40-P47.agc:1289
//180MESS		VLOAD	DOT
// slot 26195
    26195, 41466
)).

agcAotInstallSourceRope(list(
// P40-P47.agc:1290
//			IC
// slot 26196
    26196, 3932,
// P40-P47.agc:1291
//			UNIT/R/
// slot 26197
    26197, 3774,
// P40-P47.agc:1292
//		BMN	VLOAD
// slot 26198
    26198, 64832,
// P40-P47.agc:1293
//			NEGPROD
// slot 26199
    26199, 48332,
// P40-P47.agc:1294
//			IC
// slot 26200
    26200, 3932,
// P40-P47.agc:1295
//		VSR1	PDVL
// slot 26201
    26201, 52708,
// P40-P47.agc:1296
//			UNIT/R/
// slot 26202
    26202, 3774,
// P40-P47.agc:1297
//		VSR1	VAD
// slot 26203
    26203, 44516,
// P40-P47.agc:1298
//		UNIT
// slot 26204
    26204, 65372,
// P40-P47.agc:1299
//		PUSH	VCOMP		# FOR A
// slot 26205
    26205, 48652,
// P40-P47.agc:1300
//		VXV	SIGN
// slot 26206
    26206, 62778,
// P40-P47.agc:1301
//			UN
// slot 26207
    26207, 2936,
// P40-P47.agc:1302
//			GEOMSGN
// slot 26208
    26208, 2934,
// P40-P47.agc:1303
//		UNIT	VXSC
// slot 26209
    26209, 61788,
// P40-P47.agc:1304
//			30D
// slot 26210
    26210, 62,
// P40-P47.agc:1305
//		PDVL			# UNIT(IC-IR)	+-B
// slot 26211
    26211, 65434,
// P40-P47.agc:1306
//		GOTO
// slot 26212
    26212, 65360,
// P40-P47.agc:1307
//			GETVRVG1
// slot 26213
    26213, 48278,
// P40-P47.agc:1308
//NEGPROD		VLOAD	VSR1
// slot 26214
    26214, 62202,
// P40-P47.agc:1309
//			UNIT/R/
// slot 26215
    26215, 3774,
// P40-P47.agc:1310
//		PDVL	VSR1
// slot 26216
    26216, 62106,
// P40-P47.agc:1311
//			IC
// slot 26217
    26217, 3932,
// P40-P47.agc:1312
//		VSU	UNIT
// slot 26218
    26218, 44626,
// P40-P47.agc:1313
//		PUSH
// slot 26219
    26219, 65292,
// P40-P47.agc:1314
//		VXV	SIGN
// slot 26220
    26220, 62778,
// P40-P47.agc:1315
//			UN		# FOR B
// slot 26221
    26221, 2936,
// P40-P47.agc:1316
//			GEOMSGN
// slot 26222
    26222, 2934,
// P40-P47.agc:1317
//		UNIT	VXSC
// slot 26223
    26223, 61788,
// P40-P47.agc:1318
//			32D
// slot 26224
    26224, 66,
// P40-P47.agc:1319
//		PDVL
// slot 26225
    26225, 65434,
// P40-P47.agc:1320
//		VXSC	VAD
// slot 26226
    26226, 44514,
// P40-P47.agc:1321
//			30D
// slot 26227
    26227, 62,
// P40-P47.agc:1322
//		GOTO
// slot 26228
    26228, 65360,
// P40-P47.agc:1323
//			GETVRVG2
// slot 26229
    26229, 48282,
// P40-P47.agc:1324
//		VSU
// slot 26230
    26230, 65362,
// P40-P47.agc:1325
//			VN1
// slot 26231
    26231, 3798,
// P40-P47.agc:1326
//ASTREND		STORE	DELVEET3
// slot 26232
    26232, 2540,
// P40-P47.agc:1327
//FIRSTTME	SLOAD	BZE
// slot 26233
    26233, 44218,
// P40-P47.agc:1328
//			RTX2
// slot 26234
    26234, 3072,
// P40-P47.agc:1329
//			GETGOBL
// slot 26235
    26235, 48382,
// P40-P47.agc:1330
//		VLOAD	GOTO		# NO OBLATENESS COMP IF IN MUN SPHERE
// slot 26236
    26236, 43258,
// P40-P47.agc:1331
//# Page 780
// P40-P47.agc:1332
//			DELVEET3
// slot 26237
    26237, 2540,
// P40-P47.agc:1333
//			NOGOBL
// slot 26238
    26238, 48404,
// P40-P47.agc:1334
//GETGOBL		VLOAD	UNIT		# CALCULATE OBLATENESS TERM.
// slot 26239
    26239, 44794,
// P40-P47.agc:1335
//			RN
// slot 26240
    26240, 1314,
// P40-P47.agc:1336
//		DLOAD	DSU
// slot 26241
    26241, 38346,
// P40-P47.agc:1337
//			PIPTIME		#              2
// slot 26242
    26242, 1338,
// P40-P47.agc:1338
//			GOBLTIME	# G    = -(MU/R )(UNITGOBL)(T-TIG)
// slot 26243
    26243, 3732,
// P40-P47.agc:1339
//		DMP	DDV		#  OBL
// slot 26244
    26244, 47370,
// P40-P47.agc:1340
//			EARTHMU
// slot 26245
    26245, 14374,
// P40-P47.agc:1341
//			34D		# 34D = /RN/ (2) FROM UNIT OPERATION.
// slot 26246
    26246, 70,
// P40-P47.agc:1342
//		VXSC	VAD
// slot 26247
    26247, 44514,
// P40-P47.agc:1343
//			UNITGOBL
// slot 26248
    26248, 3746,
// P40-P47.agc:1344
//			DELVEET3	# OUTPUT FROM INITVEL VG = VR - VN
// slot 26249
    26249, 2540,
// P40-P47.agc:1345
//NOGOBL		STORE	DELVEET3	# VG = VR + GOBL - VN
// slot 26250
    26250, 2540,
// P40-P47.agc:1346
//		GOTO
// slot 26251
    26251, 65360,
// P40-P47.agc:1347
//			VGAIN*
// slot 26252
    26252, 47706,
// P40-P47.agc:1348
//
// P40-P47.agc:1349
//2PI+3		2DEC	3.141592653 B-2
// slot 26253 26254
    26253, 25734, 26254, 31572
)).

// bank 27, slots 26255-26255
function agcAotUnit1675 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1350
//
// P40-P47.agc:1351
//# Page 781
// P40-P47.agc:1352
//# TRIMGIMB	(FORMERLY S40.6)
// P40-P47.agc:1353
//# MOD 0		24 FEB 67	ADLER KERMAN
// P40-P47.agc:1354
//#
// P40-P47.agc:1355
//# FUNCTION:
// P40-P47.agc:1356
//#	TRIMS DPS ENGINE TO MINIMIZE THRUST/CG OFFSET.  ENGINE IS GIMBALLED TO FULL + PITCH AND + ROLL (TO LOCK)
// P40-P47.agc:1357
//#	FOR REFERENCE AND IS THEN BROUGHT BACK TO TRIM POSITION BY RUNNING FOR THE PROPER TIMES (TO BE
// P40-P47.agc:1358
//#	SPECIFIED BY GAEC) IN - PITCH AND - ROLL.
// P40-P47.agc:1359
//#
// P40-P47.agc:1360
//# CALLING SEQUENCE:
// P40-P47.agc:1361
//#	VIA WAITLIST FROM R03
// P40-P47.agc:1362
//#
// P40-P47.agc:1363
//# INPUT:
// P40-P47.agc:1364
//#	PITTIME		TIME TO RUN FROM FULL + PITCH TO TRIM (CS)
// P40-P47.agc:1365
//#	ROLLTIME	TIME TO RUN FROM FULL + ROLL TO TRIM (CS)
// P40-P47.agc:1366
//#
// P40-P47.agc:1367
//# SUBROUTINES USED:
// P40-P47.agc:1368
//#	WAITLIST, FIXDELAY, VARDELAY, FLAGUP, FLAGDOWN, NOVAC
// P40-P47.agc:1369
//
// P40-P47.agc:1370
//		COUNT*	$$/S40.6
// P40-P47.agc:1371
//		EBANK=	ROLLTIME	# OCTAL MASKS: PRIO5=05000 EBANK5=02400
// P40-P47.agc:1372
//
// P40-P47.agc:1373
//TRIMGIMB	TC	DOWNFLAG	# GMBDRVSW FLAG IS SET WHEN EITHER ROLL OR
// slot 26255
    if slot <> 26255 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1675] to agcAotUnit1675@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1374
//		ADRES	GMBDRVSW	# PITCH IS COMPLETED, WHICHEVER IS FIRST.
// slot 26256
    26256, 190
)).

// bank 27, slots 26257-26263
function agcAotUnit1676 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26259 {
        if slot <= 26257 {
// P40-P47.agc:1375
//
// P40-P47.agc:1376
//		CS	PRIO5		# TURN OFF - PITCH, - ROLL, IF ON.
// slot 26257
            if slot <> 26257 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26258 {
// P40-P47.agc:1377
//		EXTEND
// slot 26258
                if slot <> 26258 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1378
//		WAND	CHAN12
// slot 26259
                if slot <> 26259 or instruction <> 1546 { return choose false if checkOnly else -1. }
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
        if slot <= 26261 {
            if slot <= 26260 {
// P40-P47.agc:1379
//		CAF	EBANK5		# TURN ON + PITCH, + ROLL.
// slot 26260
                if slot <> 26260 or instruction <> 14860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1380
//		EXTEND
// slot 26261
                if slot <> 26261 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26262 {
// P40-P47.agc:1381
//		WOR	CHAN12
// slot 26262
                if slot <> 26262 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1382
//		TC	FIXDELAY	# WAIT ONE MINUTE TO MAKE SURE ENGINE IS
// slot 26263
                if slot <> 26263 or instruction <> 2705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2705, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1676] to agcAotUnit1676@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1383
//		DEC	6000		# AT FULL + PITCH AND FULL + ROLL
// slot 26264
    26264, 12000
)).

// bank 27, slots 26265-26272
function agcAotUnit1677 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26268 {
        if slot <= 26266 {
            if slot <= 26265 {
// P40-P47.agc:1384
//		CS	EBANK5		# TURN OFF + PITCH, + ROLL.
// slot 26265
                if slot <> 26265 or instruction <> 18956 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1385
//		EXTEND
// slot 26266
                if slot <> 26266 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26267 {
// P40-P47.agc:1386
//		WAND	CHAN12
// slot 26267
                if slot <> 26267 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1387
//		CAF	PRIO5		# TURN ON - PITCH, - ROLL.
// slot 26268
                if slot <> 26268 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26270 {
            if slot <= 26269 {
// P40-P47.agc:1388
//		EXTEND
// slot 26269
                if slot <> 26269 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1389
//		WOR	CHAN12
// slot 26270
                if slot <> 26270 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26271 {
// P40-P47.agc:1390
//		CAE	PITTIME		# GET TIME TO SHUT OFF - PITCH AND SET UP
// slot 26271
                if slot <> 26271 or instruction <> 13058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 770).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1391
//		TC	TWIDDLE		# TWIDDLE-TASK TO TURN IT OFF THEN
// slot 26272
                if slot <> 26272 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1677] to agcAotUnit1677@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1392
//		ADRES	PITCHOFF
// slot 26273
    26273, 3424
)).

// bank 27, slots 26274-26284
function agcAotUnit1678 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26278 {
        if slot <= 26275 {
            if slot <= 26274 {
// P40-P47.agc:1393
//
// P40-P47.agc:1394
//		CAE	ROLLTIME	# GET TIME TO SHUT OFF - ROLL AND GO AWAY
// slot 26274
                if slot <> 26274 or instruction <> 13057 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 769).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1395
//		TC	VARDELAY	# UNTIL THEN
// slot 26275
                if slot <> 26275 or instruction <> 2708 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2708, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26276 {
// P40-P47.agc:1396
//		CS	BIT12
// slot 26276
                if slot <> 26276 or instruction <> 18912 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26277 {
// P40-P47.agc:1397
//		EXTEND
// slot 26277
                    if slot <> 26277 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:1398
//		WAND	CHAN12		# SHUT OFF ROLL
// slot 26278
                    if slot <> 26278 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26281 {
            if slot <= 26279 {
// P40-P47.agc:1399
//ROLLOVER	CA	FLAGWRD6	# IF HERE INLINE (ROLL DONE) IS PITCH DONE
// slot 26279
                if slot <> 26279 or instruction <> 12354 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26280 {
// P40-P47.agc:1400
//		MASK	GMBDRBIT	# IF HERE FROM PITCHOFF, IS ROLL DONE?
// slot 26280
                    if slot <> 26280 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:1401
//		EXTEND
// slot 26281
                    if slot <> 26281 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26282 {
// P40-P47.agc:1402
//		BZF	PITCHOFF +4	# NO.  SET FLAG, ROLL OR PITCH DONE.
// slot 26282
                if slot <> 26282 or instruction <> 5812 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5812, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26283 {
// P40-P47.agc:1403
//		CAF	PRIO10		# RETURN TO R03.
// slot 26283
                    if slot <> 26283 or instruction <> 14815 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P40-P47.agc:1404
//		TC	NOVAC
// slot 26284
                    if slot <> 26284 or instruction <> 2618 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1678] to agcAotUnit1678@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1405
//		EBANK=	WHOCARES
// P40-P47.agc:1406
//# Page 782
// P40-P47.agc:1407
//		2CADR	TRIMDONE
// slot 26285 26286
    26285, 2470, 26286, 2158
)).

// bank 27, slots 26287-26292
function agcAotUnit1679 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26289 {
        if slot <= 26287 {
// P40-P47.agc:1408
//
// P40-P47.agc:1409
//		TC	TASKOVER
// slot 26287
            if slot <> 26287 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26288 {
// P40-P47.agc:1410
//PITCHOFF	CS	BIT10
// slot 26288
                if slot <> 26288 or instruction <> 18914 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1411
//		EXTEND
// slot 26289
                if slot <> 26289 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26290 {
// P40-P47.agc:1412
//		WAND	CHAN12		# SHUT OFF PITCH
// slot 26290
            if slot <> 26290 or instruction <> 1546 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26291 {
// P40-P47.agc:1413
//		TCF	ROLLOVER	# SEE IF ROLL HAS FINISHED ALSO.
// slot 26291
                if slot <> 26291 or instruction <> 5799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P40-P47.agc:1414
//		TC	UPFLAG		# ROLL DONE; OR PITCH DONE; BUT NOT BOTH.
// slot 26292
                if slot <> 26292 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1679] to agcAotUnit1679@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1415
//		ADRES	GMBDRVSW
// slot 26293
    26293, 190
)).

// bank 27, slots 26294-26294
function agcAotUnit1680 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P40-P47.agc:1416
//		TC	TASKOVER
// slot 26294
    if slot <> 26294 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1680] to agcAotUnit1680@.

agcAotInstallSourceRope(list(
// P40-P47.agc:1417
//
// P40-P47.agc:1418
//# Page 783
// P40-P47.agc:1419
//# SUBROUTINE NAME:  S41.1	MOD. NO. 0	DATE: FEBRUARY 28, 1967
// P40-P47.agc:1420
//# MOD. NO. 1	DATE: JANUARY 23, 1968, BY ADLER KERMAN (MIT/IL)
// P40-P47.agc:1421
//#
// P40-P47.agc:1422
//# AUTHOR: ADDLESTON KERMAN (ADAMS ASSOCIATES)
// P40-P47.agc:1423
//#
// P40-P47.agc:1424
//# S41.1 PERFORMS THE COORDINATE SYSTEM TRANSFORMATION FROM THE REFERENCE FRAME TO THE BODY OF THE LM.
// P40-P47.agc:1425
//# SPECIFICALLY, IT IS USED TO TRANSFORM A VELOCITY (SCALED AT 2(+7) METERS/CENTISECOND) FROM REFERENCE TO LM AXIS
// P40-P47.agc:1426
//# COORDINATES.  FIRST THE VECTOR IS TRANSFORMED TO THE STABLE MEMBER COORDINATES BY THE MATRIX REFSMMAT.  THIS
// P40-P47.agc:1427
//# LEAVES THE VECTOR IN MPAC, SCALED AT 2(+8) METERS/CENTISECOND.  THEN
// P40-P47.agc:1428
//# THE SUBROUTINE CDUTRIG IS CALLED TO SET UP THE DOUBLE-PRECISION CDU VECTOR ALONG WITH ITS SINES AND COSINES.
// P40-P47.agc:1429
//# THE VECTOR IS THEN TRANSFORMED FROM STABLE MEMBER COORDINATES TO SPACECRAFT (OR LM) COORDINATES BY THE
// P40-P47.agc:1430
//# SUBROUTINE *SMNB*.  FINALLY, THE VECTOR IS RESCALED TO 2(+7) METERS/CENTISECOND, AND CONTROL IS RETURNED BO THE
// P40-P47.agc:1431
//# CALLER WITH C(MPAC) = VELOCITY(LM).
// P40-P47.agc:1432
//#
// P40-P47.agc:1433
//# CALLING SEQUENCE:
// P40-P47.agc:1434
//#	L	VLOAD	CALL
// P40-P47.agc:1435
//#	L +1		VELOCITY(REF)		# SCALED AT 2(+7) M/CS IN REFERENCE COORDS.
// P40-P47.agc:1436
//#	L +2		S41.1
// P40-P47.agc:1437
//#	L +3	STORE	VELOCITY(LM)		# SCALED AT 2(+7) M/CS IN LM BODY AXIS SYS.
// P40-P47.agc:1438
//#
// P40-P47.agc:1439
//# SUBROUTINES CALLED:
// P40-P47.agc:1440
//#	1.	CDUTRIG,
// P40-P47.agc:1441
//#			WHICH CALLS CDULOGIC.
// P40-P47.agc:1442
//#	2.	*SMNB*
// P40-P47.agc:1443
//#
// P40-P47.agc:1444
//# NORMAL RETURN:  L +3 (SEE CALLING SEQUENCE, ABOVE.)
// P40-P47.agc:1445
//#
// P40-P47.agc:1446
//# ALARM/ABORT MODES:  NONE.
// P40-P47.agc:1447
//#
// P40-P47.agc:1448
//# RESTART PROTECTION:  NONE.
// P40-P47.agc:1449
//#
// P40-P47.agc:1450
//# Page 784
// P40-P47.agc:1451
//# INPUT:
// P40-P47.agc:1452
//#	1.	REFSMMAT.
// P40-P47.agc:1453
//#	2.	CDUX, CDUY, CDUZ.
// P40-P47.agc:1454
//#	3.	VELOCITY (REF) IN MPAC.
// P40-P47.agc:1455
//#
// P40-P47.agc:1456
//# OUTPUT:
// P40-P47.agc:1457
//#	1.	CSUSPOT:	DOUBLE PRECISION CDU VECTOR, ORDERED Y,Z,X.
// P40-P47.agc:1458
//#	2.	SINCDU:		HALF SINES OF CDUSPOT COMPONENTS
// P40-P47.agc:1459
//#	3.	COSCDU:		HALF COSINES OF CDUSPOT COMPONENTS.
// P40-P47.agc:1460
//#	4.	MPAC:		VELOCITY(LM) (SCALED AT 2(+7) METERS/CENTISECOND)
// P40-P47.agc:1461
//#
// P40-P47.agc:1462
//# DEBRIS:  NONE.
// P40-P47.agc:1463
//#
// P40-P47.agc:1464
//# CHECKOUT STATUS:  CODED
// P40-P47.agc:1465
//
// P40-P47.agc:1466
//		COUNT*	$$/S41.1
// P40-P47.agc:1467
//S41.1		MXV	VSL1		# CONVERT VECTOR IN MPAC FROM REF AT 2(+7)
// slot 26295
    26295, 64162,
// P40-P47.agc:1468
//			REFSMMAT	# TO SM AND RESCALE DUE TO HALF-UNIT MATRIX
// slot 26296
    26296, 1976,
// P40-P47.agc:1469
//		GOTO			# CONVERT TO BODY AT 2(+7) USING PRESENT
// slot 26297
    26297, 65360,
// P40-P47.agc:1470
//			CDU*SMNB	# CDU ANGLES.  CDU*SMNB WILL RETURN
// slot 26298
    26298, 40780
)).

// no code for the lines below
// P40-P47.agc:1471
//					# VIA RVQ TO THE CALLER OF S41.1.
