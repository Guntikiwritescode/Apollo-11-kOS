// PORT: Original source unit P40-P47.agc.
// PORT: Physical bank 36. Shared continuation entries, slots 33383–33383.
function agcAotUnit2164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P40-P47.agc:2
//# Filename:	P40-P47.agc
// PORT: SOURCE P40-P47.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P40-P47.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P40-P47.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P40-P47.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P40-P47.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P40-P47.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P40-P47.agc:9
//# Pages:	752-784
// PORT: SOURCE P40-P47.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// PORT: SOURCE P40-P47.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE P40-P47.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE P40-P47.agc:13
//#		2011-01-06 JL	Fixed interpretive indentation.
// PORT: SOURCE P40-P47.agc:14
//#
// PORT: SOURCE P40-P47.agc:15
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P40-P47.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P40-P47.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P40-P47.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P40-P47.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P40-P47.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P40-P47.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P40-P47.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P40-P47.agc:23
//# actually created.
// PORT: SOURCE P40-P47.agc:24
//#
// PORT: SOURCE P40-P47.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P40-P47.agc:26
//#
// PORT: SOURCE P40-P47.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P40-P47.agc:28
//#	16:27 JULY 14, 1969
// PORT: SOURCE P40-P47.agc:29
//
// PORT: SOURCE P40-P47.agc:30
//# Page 752
// PORT: SOURCE P40-P47.agc:31
//# PROGRAM DESCRIPTION: P40BOTH		DECEMBER 22, 1966
// PORT: SOURCE P40-P47.agc:32
//# MOD 03 BY PETER ADLER			MARCH 3, 1967
// PORT: SOURCE P40-P47.agc:33
//# CALLED VIA JOB FROM V37E
// PORT: SOURCE P40-P47.agc:34
//#
// PORT: SOURCE P40-P47.agc:35
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:36
//#
// PORT: SOURCE P40-P47.agc:37
//#	1)	TO COMPUTE A PREFERRED IMU ORIENTATION AND A PREFERRED VEHICLE ATTITUDE FOR A LM DPS
// PORT: SOURCE P40-P47.agc:38
//#		THRUSTING MANEUVER.
// PORT: SOURCE P40-P47.agc:39
//# 	(There is no item #2 in the original program listing --- RSB 2009.)
// PORT: SOURCE P40-P47.agc:40
//#	3)	TO DO THE VEHICLE MANEUVER TO THE THRUSTING ATTITUDE.
// PORT: SOURCE P40-P47.agc:41
//#	4)	TO CONTROL THE PGNCS DURING COUNTDOWN, IGNITION, THRUSTING, AND THRUST TERMINATION OF A
// PORT: SOURCE P40-P47.agc:42
//#		PGNCS CONTROLLED DPS MANEUVER.
// PORT: SOURCE P40-P47.agc:43
//#	5)	IN POSTBURN --- ZERO RENDEZVOUS COUNTER, MAINTAIN VG CALCULATIONS FOR POSSIBLE RCS MANEUVER,
// PORT: SOURCE P40-P47.agc:44
//#		SET MAXIMUM DEADBAND IN DAP, RESET STEERLAW CSTEER TO ZERO.
// PORT: SOURCE P40-P47.agc:45
//#
// PORT: SOURCE P40-P47.agc:46
//#	NOTE:	P42, WHICH IS IN THIS LOG SECTION, DOES THE SAME FOR AN APS BURN, AND P41 DOES 1-3 FOR
// PORT: SOURCE P40-P47.agc:47
//#		RCS PLUS DISPLAYS PARAMETERS FOR MANUAL CONTROL.
// PORT: SOURCE P40-P47.agc:48
//#
// PORT: SOURCE P40-P47.agc:49
//# SUBROUTINES USED
// PORT: SOURCE P40-P47.agc:50
//#
// PORT: SOURCE P40-P47.agc:51
//#	R02		IMU STATUS CHECK
// PORT: SOURCE P40-P47.agc:52
//#	S40.1		COMPUTATION OF THRUST DIRECTION
// PORT: SOURCE P40-P47.agc:53
//#	S40.13		LENGTH OF BURN
// PORT: SOURCE P40-P47.agc:54
//#	S40.2,3		PREFERRED IMU ORIENTATION
// PORT: SOURCE P40-P47.agc:55
//#	S40.8		X PRODUCT STEERING
// PORT: SOURCE P40-P47.agc:56
//#	S40.9		LAMBERT VTOGAIN
// PORT: SOURCE P40-P47.agc:57
//#	R60LEM		ATTITUDE MANEUVER
// PORT: SOURCE P40-P47.agc:58
//#	LEMPREC		EXTRAPOLATE STATE VECTOR
// PORT: SOURCE P40-P47.agc:59
//#	PREREAD		AVERAGE G, SERVICER
// PORT: SOURCE P40-P47.agc:60
//#	ALLCOAST	DAP COASTING INITIALIZATION
// PORT: SOURCE P40-P47.agc:61
//#	CLOKTASK	ERGO CLOCKJOB -- COUNT DOWN
// PORT: SOURCE P40-P47.agc:62
//#	PHASCHANG, INTPRET, FLAGUP, FLAGDOWN, WAITLIST, LONGCALL, GOFLASH, GOFLASHR, GOPERF1, ALARM,
// PORT: SOURCE P40-P47.agc:63
//#	PRIOLARM, GOTOPOOH, ENDOFJOB, BANKCALL, SETMAXDB, SETMINDB, CHECKMM, FLATOUT, OUTFLAT,
// PORT: SOURCE P40-P47.agc:64
//#	KILLTASK, SGNAGREE, TPAGREE, ETC.
// PORT: SOURCE P40-P47.agc:65
//#
// PORT: SOURCE P40-P47.agc:66
//# RESTARTS VIA GROUP 4
// PORT: SOURCE P40-P47.agc:67
//#
// PORT: SOURCE P40-P47.agc:68
//# DISPLAYS
// PORT: SOURCE P40-P47.agc:69
//#
// PORT: SOURCE P40-P47.agc:70
//#	V50N25	203 A/P TO PGNCS, AUTO-THROTTLE MODE, AUTO ATTITUDE CONTROL
// PORT: SOURCE P40-P47.agc:71
//#	V06N40	TTI, VG, DELTAVM (DISPLAYED ONCE/SECOND BY CLOKTASK)
// PORT: SOURCE P40-P47.agc:72
//#	V50N99	PLEASE PERFORM ENGINE ON ENABLE
// PORT: SOURCE P40-P47.agc:73
//#	V06N40	TG (TIME TO GO TO CUTOFF), VG, DELTAVM -- ONCE/SECOND
// PORT: SOURCE P40-P47.agc:74
//#	V16N40	FINAL VALUES OF TG, VG, DELTAVM
// PORT: SOURCE P40-P47.agc:75
//#	V16N85	COMP OF VG (BODY AXES) FOR POSS. RCS MANUAL MANEUVER
// PORT: SOURCE P40-P47.agc:76
//#	V05N09	POSSIBLE ALARMS
// PORT: SOURCE P40-P47.agc:77
//#	V50N07	PLEASE SELECT P00
// PORT: SOURCE P40-P47.agc:78
//#
// PORT: SOURCE P40-P47.agc:79
//# Page 753
// PORT: SOURCE P40-P47.agc:80
//#	VIA R30
// PORT: SOURCE P40-P47.agc:81
//#
// PORT: SOURCE P40-P47.agc:82
//#	V06N44	HAPO, PERI, TFF
// PORT: SOURCE P40-P47.agc:83
//#	V06N35	TIME TO PERIGEE, HMS
// PORT: SOURCE P40-P47.agc:84
//#
// PORT: SOURCE P40-P47.agc:85
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P40-P47.agc:86
//#
// PORT: SOURCE P40-P47.agc:87
//#	PROGRAM ALARM, FLASHING DISPLAY OF ALARM CODE 1706 IF P40 SELECTED WITH DESCENT UNIT STAGED.
// PORT: SOURCE P40-P47.agc:88
//#	V34E (TERMINATE) IS THE ONLY RESPONSE ACCEPTED.  TC GOTOPOOH.
// PORT: SOURCE P40-P47.agc:89
//#
// PORT: SOURCE P40-P47.agc:90
//#	PROGRAM ALARM, FLASH CODE 1703:  TIG LESS THAN 45 SECS AWAY.  V34E= GOTOPOOH OR V33E= SLIP
// PORT: SOURCE P40-P47.agc:91
//#	TIG BY 45 SECS.
// PORT: SOURCE P40-P47.agc:92
//#
// PORT: SOURCE P40-P47.agc:93
//# ERASABLE INITIALIZATION
// PORT: SOURCE P40-P47.agc:94
//#
// PORT: SOURCE P40-P47.agc:95
//# DEBRIS
// PORT: SOURCE P40-P47.agc:96
//#
// PORT: SOURCE P40-P47.agc:97
//# OUTPUT
// PORT: SOURCE P40-P47.agc:98
//#
// PORT: SOURCE P40-P47.agc:99
//#	SEE SUBROUTINES E.G.:  S40.1, S40.2,3, S40.13, S40.8, S40.9, TRIMGIMB
// PORT: SOURCE P40-P47.agc:100
//#	XDELVFLG = 1 FOR EXT DELV COMPUTATION
// PORT: SOURCE P40-P47.agc:101
//#	         = 0 FOR AIMPT (LAMBERT COMP
// PORT: SOURCE P40-P47.agc:102
//
// PORT: SOURCE P40-P47.agc:103
//		COUNT*	$$/P40
// PORT: SOURCE P40-P47.agc:104
//		EBANK=	WHICH
// PORT: SOURCE P40-P47.agc:105
//
// PORT: SOURCE P40-P47.agc:106
//		BANK	36
// PORT: SOURCE P40-P47.agc:107
//		SETLOC	P40S
// PORT: SOURCE P40-P47.agc:108
//		BANK
// PORT: SOURCE P40-P47.agc:109
//
// PORT: SOURCE P40-P47.agc:110
//P40LM		TC	PHASCHNG
// PORT: Fixed ROM slots 33383.
    if slot <> 33383 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2164] to agcAotUnit2164@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:111
//		OCT	04024
// PORT: Fixed ROM slots 33384.
    33384, 4136
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33385–33391.
function agcAotUnit2165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33387 {
        if slot <= 33385 {
// PORT: SOURCE P40-P47.agc:112
//
// PORT: SOURCE P40-P47.agc:113
//		CAF	P40ADRES	# INITIALIZATION FOR BURNBABY
// PORT: Fixed ROM slots 33385.
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
// PORT: SOURCE P40-P47.agc:114
//		TS	WHICH
// PORT: Fixed ROM slots 33386.
                if slot <> 33386 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:115
//
// PORT: SOURCE P40-P47.agc:116
//		CA	FLGWRD10
// PORT: Fixed ROM slots 33387.
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
// PORT: SOURCE P40-P47.agc:117
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 33388.
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
// PORT: SOURCE P40-P47.agc:118
//		CCS	A
// PORT: Fixed ROM slots 33389.
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
// PORT: SOURCE P40-P47.agc:119
//		TCF	P40ALM
// PORT: Fixed ROM slots 33390.
                if slot <> 33390 or instruction <> 5713 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5713, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:120
//		TC	BANKCALL	# GO DO IMU STATUS CHECK ROUTINE.
// PORT: Fixed ROM slots 33391.
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
// PORT: SOURCE P40-P47.agc:121
//		CADR	R02BOTH
// PORT: Fixed ROM slots 33392.
    33392, 9560
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33393–33401.
function agcAotUnit2166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33396 {
        if slot <= 33394 {
            if slot <= 33393 {
// PORT: SOURCE P40-P47.agc:122
//
// PORT: SOURCE P40-P47.agc:123
//		CS	DAPBOOLS	# INITIALIZE DVMON
// PORT: Fixed ROM slots 33393.
                if slot <> 33393 or instruction <> 16457 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 73).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:124
//		MASK	CSMDOCKD
// PORT: Fixed ROM slots 33394.
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
// PORT: SOURCE P40-P47.agc:125
//		CCS	A
// PORT: Fixed ROM slots 33395.
                if slot <> 33395 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:126
//		CAF	THRESH1
// PORT: Fixed ROM slots 33396.
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
// PORT: SOURCE P40-P47.agc:127
//		AD	THRESH3
// PORT: Fixed ROM slots 33397.
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
// PORT: SOURCE P40-P47.agc:128
//		TS	DVTHRUSH
// PORT: Fixed ROM slots 33398.
                if slot <> 33398 or instruction <> 23209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33399 {
// PORT: SOURCE P40-P47.agc:129
//		CAF	FOUR
// PORT: Fixed ROM slots 33399.
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
// PORT: SOURCE P40-P47.agc:130
//		TS	DVCNTR
// PORT: Fixed ROM slots 33400.
                    if slot <> 33400 or instruction <> 23373 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23373, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:131
//# Page 754
// PORT: SOURCE P40-P47.agc:132
//		TC	INTPRET		# LOAD CONSTANTS FOR DPS BURN
// PORT: Fixed ROM slots 33401.
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
// PORT: SOURCE P40-P47.agc:133
//		VLOAD	CLEAR		# LOAD F, MDOT, TDECAY
// PORT: Fixed ROM slots 33402.
    33402, 36090,
// PORT: SOURCE P40-P47.agc:134
//			FDPS
// PORT: Fixed ROM slots 33403.
    33403, 28674,
// PORT: SOURCE P40-P47.agc:135
//			NOTHROTL
// PORT: Fixed ROM slots 33404.
    33404, 2918,
// PORT: SOURCE P40-P47.agc:136
//		STORE	F
// PORT: Fixed ROM slots 33405.
    33405, 4026,
// PORT: SOURCE P40-P47.agc:137
//		SLOAD
// PORT: Fixed ROM slots 33406.
    33406, 65466,
// PORT: SOURCE P40-P47.agc:138
//			DPSVEX
// PORT: Fixed ROM slots 33407.
    33407, 22532,
// PORT: SOURCE P40-P47.agc:139
//P40IN		DCOMP	SR1
// PORT: Fixed ROM slots 33408.
    33408, 57980,
// PORT: SOURCE P40-P47.agc:140
//		STCALL	VEX		# LOAD EXHAUST VELOCITY FOR TGO COMP.
// PORT: Fixed ROM slots 33409.
    33409, 32710,
// PORT: SOURCE P40-P47.agc:141
//			S40.1		# COMPUTES UT AND VGTIG
// PORT: Fixed ROM slots 33410.
    33410, 47436,
// PORT: SOURCE P40-P47.agc:142
//		CALL
// PORT: Fixed ROM slots 33411.
    33411, 65320,
// PORT: SOURCE P40-P47.agc:143
//			S40.2,3		# COMPUTES PREFERRED IMU ORIENTATION
// PORT: Fixed ROM slots 33412.
    33412, 47638,
// PORT: SOURCE P40-P47.agc:144
//		EXIT
// PORT: Fixed ROM slots 33413.
    33413, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33414–33415.
function agcAotUnit2167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33414 {
// PORT: SOURCE P40-P47.agc:145
//
// PORT: SOURCE P40-P47.agc:146
//		INHINT
// PORT: Fixed ROM slots 33414.
        if slot <> 33414 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:147
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33415.
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
// PORT: SOURCE P40-P47.agc:148
//		CADR	PFLITEDB	# ZERO ATTITUDE ERRORS, SET DB TO ONE DEG.
// PORT: Fixed ROM slots 33416.
    33416, 32964
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33417–33422.
function agcAotUnit2168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33419 {
        if slot <= 33417 {
// PORT: SOURCE P40-P47.agc:149
//
// PORT: SOURCE P40-P47.agc:150
//		TC	P40SXT4
// PORT: Fixed ROM slots 33417.
            if slot <> 33417 or instruction <> 1675 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1675, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33418 {
// PORT: SOURCE P40-P47.agc:151
//
// PORT: SOURCE P40-P47.agc:152
//#	********************************
// PORT: SOURCE P40-P47.agc:153
//
// PORT: SOURCE P40-P47.agc:154
//		TCF	BURNBABY
// PORT: Fixed ROM slots 33418.
                if slot <> 33418 or instruction <> 5206 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5206, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:155
//
// PORT: SOURCE P40-P47.agc:156
//#	********************************
// PORT: SOURCE P40-P47.agc:157
//
// PORT: SOURCE P40-P47.agc:158
//P40SXT4		EXTEND
// PORT: Fixed ROM slots 33419.
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
// PORT: SOURCE P40-P47.agc:159
//		QXCH	P40/RET
// PORT: Fixed ROM slots 33420.
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
// PORT: SOURCE P40-P47.agc:160
//P41MANU		RELINT
// PORT: Fixed ROM slots 33421.
                if slot <> 33421 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:161
//
// PORT: SOURCE P40-P47.agc:162
//		TC	DOWNFLAG	# CLEAR 3AXISFLG -- R60 USE VECPOINT.
// PORT: Fixed ROM slots 33422.
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
// PORT: SOURCE P40-P47.agc:163
//		ADRES	3AXISFLG
// PORT: Fixed ROM slots 33423.
    33423, 168
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33424–33424.
function agcAotUnit2169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:164
//
// PORT: SOURCE P40-P47.agc:165
//		TC	BANKCALL
// PORT: Fixed ROM slots 33424.
    if slot <> 33424 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2169] to agcAotUnit2169@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:166
//		CADR	R60LEM		# DO ATTITUDE MANEUVER ROUTINE
// PORT: Fixed ROM slots 33425.
    33425, 45222
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33426–33433.
function agcAotUnit2170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33429 {
        if slot <= 33427 {
            if slot <= 33426 {
// PORT: SOURCE P40-P47.agc:167
//		TC	P40/RET
// PORT: Fixed ROM slots 33426.
                if slot <> 33426 or instruction <> 610 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 610, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:168
//
// PORT: SOURCE P40-P47.agc:169
//		EBANK=	TRKMKCNT
// PORT: SOURCE P40-P47.agc:170
//POSTBURN	CA	Z
// PORT: Fixed ROM slots 33427.
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
// PORT: SOURCE P40-P47.agc:171
//		TS	DISPDEX
// PORT: Fixed ROM slots 33428.
                if slot <> 33428 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:172
//		EXTEND
// PORT: Fixed ROM slots 33429.
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
// PORT: SOURCE P40-P47.agc:173
//		DCA	ACADN85
// PORT: Fixed ROM slots 33430.
                if slot <> 33430 or instruction <> 13358 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1070, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:174
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 33431.
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
// PORT: SOURCE P40-P47.agc:175
//		CAF	V16N40
// PORT: Fixed ROM slots 33432.
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
// PORT: SOURCE P40-P47.agc:176
//		TC	BANKCALL
// PORT: Fixed ROM slots 33433.
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
// PORT: SOURCE P40-P47.agc:177
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 33434.
    33434, 17210
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33435–33438.
function agcAotUnit2171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33436 {
        if slot <= 33435 {
// PORT: SOURCE P40-P47.agc:178
//		TC	TERM40
// PORT: Fixed ROM slots 33435.
            if slot <> 33435 or instruction <> 1710 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1710, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:179
//		TCF	TIGNOW
// PORT: Fixed ROM slots 33436.
            if slot <> 33436 or instruction <> 5793 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5793, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33437 {
// PORT: SOURCE P40-P47.agc:180
//		TC	POSTBURN
// PORT: Fixed ROM slots 33437.
            if slot <> 33437 or instruction <> 1683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:181
//# Page 755
// PORT: SOURCE P40-P47.agc:182
//P40PHS1		TC	PHASCHNG
// PORT: Fixed ROM slots 33438.
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
// PORT: SOURCE P40-P47.agc:183
//		OCT	00014
// PORT: Fixed ROM slots 33439.
    33439, 24
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33440–33442.
function agcAotUnit2172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33440 {
// PORT: SOURCE P40-P47.agc:184
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 33440.
        if slot <> 33440 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33441 {
// PORT: SOURCE P40-P47.agc:185
//
// PORT: SOURCE P40-P47.agc:186
//TIGNOW		INHINT
// PORT: Fixed ROM slots 33441.
            if slot <> 33441 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:187
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33442.
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
// PORT: SOURCE P40-P47.agc:188
//		CADR	ZATTEROR
// PORT: Fixed ROM slots 33443.
    33443, 32982
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33444–33444.
function agcAotUnit2173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:189
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33444.
    if slot <> 33444 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2173] to agcAotUnit2173@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:190
//		CADR	SETMINDB
// PORT: Fixed ROM slots 33445.
    33445, 32960
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33446–33448.
function agcAotUnit2174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33446 {
// PORT: SOURCE P40-P47.agc:191
//		RELINT
// PORT: Fixed ROM slots 33446.
        if slot <> 33446 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33447 {
// PORT: SOURCE P40-P47.agc:192
//		CAF	V16N85B
// PORT: Fixed ROM slots 33447.
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
// PORT: SOURCE P40-P47.agc:193
//		TC	BANKCALL
// PORT: Fixed ROM slots 33448.
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
// PORT: SOURCE P40-P47.agc:194
//		CADR	REFLASHR
// PORT: Fixed ROM slots 33449.
    33449, 16996
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33450–33462.
function agcAotUnit2175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33455 {
        if slot <= 33452 {
            if slot <= 33450 {
// PORT: SOURCE P40-P47.agc:195
//		TC	TERM40
// PORT: Fixed ROM slots 33450.
                if slot <> 33450 or instruction <> 1710 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1710, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33451 {
// PORT: SOURCE P40-P47.agc:196
//		TCF	TERM40
// PORT: Fixed ROM slots 33451.
                    if slot <> 33451 or instruction <> 5806 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5806, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:197
//		TC	-5
// PORT: Fixed ROM slots 33452.
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
// PORT: SOURCE P40-P47.agc:198
//
// PORT: SOURCE P40-P47.agc:199
//		TCF	P40PHS1
// PORT: Fixed ROM slots 33453.
                if slot <> 33453 or instruction <> 5790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33454 {
// PORT: SOURCE P40-P47.agc:200
//
// PORT: SOURCE P40-P47.agc:201
//TERM40		EXTEND
// PORT: Fixed ROM slots 33454.
                    if slot <> 33454 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:202
//		DCA	SERVCADR
// PORT: Fixed ROM slots 33455.
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
// PORT: SOURCE P40-P47.agc:203
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 33456.
                if slot <> 33456 or instruction <> 22187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33457 {
// PORT: SOURCE P40-P47.agc:204
//		CAF	ZERO
// PORT: Fixed ROM slots 33457.
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
// PORT: SOURCE P40-P47.agc:205
//		TS	TRKMKCNT	# ZERO RENDZVS CNTERS
// PORT: Fixed ROM slots 33458.
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
// PORT: SOURCE P40-P47.agc:206
//		CA	Z
// PORT: Fixed ROM slots 33459.
                    if slot <> 33459 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:207
//		TS	DISPDEX
// PORT: Fixed ROM slots 33460.
                    if slot <> 33460 or instruction <> 23155 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23155, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33461 {
// PORT: SOURCE P40-P47.agc:208
//		INHINT
// PORT: Fixed ROM slots 33461.
                    if slot <> 33461 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:209
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33462.
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
// PORT: SOURCE P40-P47.agc:210
//		CADR	RESTORDB
// PORT: Fixed ROM slots 33463.
    33463, 32934
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33464–33468.
function agcAotUnit2176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33465 {
        if slot <= 33464 {
// PORT: SOURCE P40-P47.agc:211
//		RELINT
// PORT: Fixed ROM slots 33464.
            if slot <> 33464 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:212
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 33465.
            if slot <> 33465 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33466 {
// PORT: SOURCE P40-P47.agc:213
//
// PORT: SOURCE P40-P47.agc:214
//		EBANK=	WHICH
// PORT: SOURCE P40-P47.agc:215
//		COUNT*	$$/P41
// PORT: SOURCE P40-P47.agc:216
//P41LM		CAF	P41ADRES	# INITIALIZATION FOR BURNBABY
// PORT: Fixed ROM slots 33466.
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
// PORT: SOURCE P40-P47.agc:217
//		TS	WHICH
// PORT: Fixed ROM slots 33467.
                if slot <> 33467 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:218
//
// PORT: SOURCE P40-P47.agc:219
//		TC	BANKCALL
// PORT: Fixed ROM slots 33468.
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
// PORT: SOURCE P40-P47.agc:220
//		CADR	R02BOTH
// PORT: Fixed ROM slots 33469.
    33469, 9560
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33470–33470.
function agcAotUnit2177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:221
//
// PORT: SOURCE P40-P47.agc:222
//		TC	INTPRET		# BOTH LM
// PORT: Fixed ROM slots 33470.
    if slot <> 33470 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2177] to agcAotUnit2177@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:223
//		BON	DLOAD		# IF NJETSFLAG IS SET, LOAD Z JET F
// PORT: Fixed ROM slots 33471.
    33471, 58648,
// PORT: SOURCE P40-P47.agc:224
//			NJETSFLG
// PORT: Fixed ROM slots 33472.
    33472, 896,
// PORT: SOURCE P40-P47.agc:225
//			P41FJET1
// PORT: Fixed ROM slots 33473.
    33473, 62858,
// PORT: SOURCE P40-P47.agc:226
//			FRCS4		# IF NJETSFLG IS CLEAR, LOAD 4 JET F
// PORT: Fixed ROM slots 33474.
    33474, 28698,
// PORT: SOURCE P40-P47.agc:227
//
// PORT: SOURCE P40-P47.agc:228
//P41FJET		STCALL	F
// PORT: Fixed ROM slots 33475.
    33475, 32698,
// PORT: SOURCE P40-P47.agc:229
//			P41IN
// PORT: Fixed ROM slots 33476.
    33476, 62864,
// PORT: SOURCE P40-P47.agc:230
//P41FJET1	DLOAD
// PORT: Fixed ROM slots 33477.
    33477, 65482,
// PORT: SOURCE P40-P47.agc:231
//# Page 756
// PORT: SOURCE P40-P47.agc:232
//			FRCS2
// PORT: Fixed ROM slots 33478.
    33478, 28702,
// PORT: SOURCE P40-P47.agc:233
//		STORE	F
// PORT: Fixed ROM slots 33479.
    33479, 4026,
// PORT: SOURCE P40-P47.agc:234
//
// PORT: SOURCE P40-P47.agc:235
//P41IN		CALL
// PORT: Fixed ROM slots 33480.
    33480, 65320,
// PORT: SOURCE P40-P47.agc:236
//			S40.1		# BOTH
// PORT: Fixed ROM slots 33481.
    33481, 47436,
// PORT: SOURCE P40-P47.agc:237
//P41NORM		CALL
// PORT: Fixed ROM slots 33482.
    33482, 65320,
// PORT: SOURCE P40-P47.agc:238
//			S40.2,3		# CALCULATE PREFERRED IMU ORIENTATION AND
// PORT: Fixed ROM slots 33483.
    33483, 47638,
// PORT: SOURCE P40-P47.agc:239
//		EXIT			# SET PFRATFLG.
// PORT: Fixed ROM slots 33484.
    33484, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33485–33486.
function agcAotUnit2178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33485 {
// PORT: SOURCE P40-P47.agc:240
//
// PORT: SOURCE P40-P47.agc:241
//		INHINT
// PORT: Fixed ROM slots 33485.
        if slot <> 33485 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:242
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33486.
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
// PORT: SOURCE P40-P47.agc:243
//		CADR	ZATTEROR	# ZERO ATTITUDE ERRORS
// PORT: Fixed ROM slots 33487.
    33487, 32982
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33488–33488.
function agcAotUnit2179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:244
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33488.
    if slot <> 33488 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2179] to agcAotUnit2179@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:245
//		CADR	SETMINDB	# SET 0.3 DEGREE DEADBAND
// PORT: Fixed ROM slots 33489.
    33489, 32960
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33490–33491.
function agcAotUnit2180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33490 {
// PORT: SOURCE P40-P47.agc:246
//		TC	P40SXT4
// PORT: Fixed ROM slots 33490.
        if slot <> 33490 or instruction <> 1675 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1675, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:247
//
// PORT: SOURCE P40-P47.agc:248
//		TC	INTPRET
// PORT: Fixed ROM slots 33491.
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
// PORT: SOURCE P40-P47.agc:249
//		VLOAD	CALL		# TRANSFORM VELOCITY-TO-BE-GAINED AT TIG
// PORT: Fixed ROM slots 33492.
    33492, 38138,
// PORT: SOURCE P40-P47.agc:250
//			VGTIG		# FROM REFERENCE COORDINATES TO LM BODY-
// PORT: Fixed ROM slots 33493.
    33493, 3970,
// PORT: SOURCE P40-P47.agc:251
//			S41.1		# AXIS COORDINATES FOR V16N85 DISPLAY.
// PORT: Fixed ROM slots 33494.
    33494, 48494,
// PORT: SOURCE P40-P47.agc:252
//		STORE	VGBODY		# (SCALED AT 2 (+7) METERS/CENTISECOND)
// PORT: Fixed ROM slots 33495.
    33495, 3716,
// PORT: SOURCE P40-P47.agc:253
//		EXIT
// PORT: Fixed ROM slots 33496.
    33496, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33497–33498.
function agcAotUnit2181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33497 {
// PORT: SOURCE P40-P47.agc:254
//
// PORT: SOURCE P40-P47.agc:255
//		CAF	V16N85B
// PORT: Fixed ROM slots 33497.
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
// PORT: SOURCE P40-P47.agc:256
//		TC	BANKCALL
// PORT: Fixed ROM slots 33498.
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
// PORT: SOURCE P40-P47.agc:257
//		CADR	GODSPRET
// PORT: Fixed ROM slots 33499.
    33499, 16972
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33500–33502.
function agcAotUnit2182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33500 {
// PORT: SOURCE P40-P47.agc:258
//
// PORT: SOURCE P40-P47.agc:259
//		CAF	PRIO5
// PORT: Fixed ROM slots 33500.
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
// PORT: SOURCE P40-P47.agc:260
//		TS	DISPDEX		# FOR SAFETY ONLY
// PORT: Fixed ROM slots 33501.
            if slot <> 33501 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:261
//		TC	FINDVAC
// PORT: Fixed ROM slots 33502.
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
// PORT: SOURCE P40-P47.agc:262
//		EBANK=	VGPREV
// PORT: SOURCE P40-P47.agc:263
//		2CADR	DYNMDISP
// PORT: Fixed ROM slots 33503 33504.
    33503, 3554, 33504, 61550
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33505–33505.
function agcAotUnit2183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:264
//
// PORT: SOURCE P40-P47.agc:265
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 33505.
    if slot <> 33505 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2183] to agcAotUnit2183@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:266
//		OCT	00076		# GROUP 6 RESTARTS AT REDO6.7
// PORT: Fixed ROM slots 33506.
    33506, 124,
// PORT: SOURCE P40-P47.agc:267
//		OCT	04024		# GROUP 4 RESTARTS HERE
// PORT: Fixed ROM slots 33507.
    33507, 4136
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33508–33510.
function agcAotUnit2184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33508 {
// PORT: SOURCE P40-P47.agc:268
//
// PORT: SOURCE P40-P47.agc:269
//#	********************************
// PORT: SOURCE P40-P47.agc:270
//
// PORT: SOURCE P40-P47.agc:271
//		TCF	B*RNB*B*
// PORT: Fixed ROM slots 33508.
        if slot <> 33508 or instruction <> 5213 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5213, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33509 {
// PORT: SOURCE P40-P47.agc:272
//
// PORT: SOURCE P40-P47.agc:273
//#	********************************
// PORT: SOURCE P40-P47.agc:274
//
// PORT: SOURCE P40-P47.agc:275
//BLNKWAIT	CAF	1SEC
// PORT: Fixed ROM slots 33509.
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
// PORT: SOURCE P40-P47.agc:276
//		TC	BANKCALL
// PORT: Fixed ROM slots 33510.
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
// PORT: SOURCE P40-P47.agc:277
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 33511.
    33511, 1978
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33512–33517.
function agcAotUnit2185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33514 {
        if slot <= 33512 {
// PORT: SOURCE P40-P47.agc:278
//
// PORT: SOURCE P40-P47.agc:279
//REDO6.7		CA	DISPDEX		# ON A RESTART, DO NOT PUT UP DISPLAY IF
// PORT: Fixed ROM slots 33512.
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
// PORT: SOURCE P40-P47.agc:280
//		AD	TWO		# BLANKING (BETWEEN TIG-35 AND TIG-30)
// PORT: Fixed ROM slots 33513.
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
// PORT: SOURCE P40-P47.agc:281
//
// PORT: SOURCE P40-P47.agc:282
//#	********************************
// PORT: SOURCE P40-P47.agc:283
//# Page 757
// PORT: SOURCE P40-P47.agc:284
//
// PORT: SOURCE P40-P47.agc:285
//		EXTEND
// PORT: Fixed ROM slots 33514.
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
// PORT: SOURCE P40-P47.agc:286
//		BZF	BLNKWAIT
// PORT: Fixed ROM slots 33515.
            if slot <> 33515 or instruction <> 5861 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5861, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33516 {
// PORT: SOURCE P40-P47.agc:287
//
// PORT: SOURCE P40-P47.agc:288
//		CAF	V16N85B
// PORT: Fixed ROM slots 33516.
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
// PORT: SOURCE P40-P47.agc:289
//		TC	BANKCALL
// PORT: Fixed ROM slots 33517.
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
// PORT: SOURCE P40-P47.agc:290
//		CADR	GODSPRET
// PORT: Fixed ROM slots 33518.
    33518, 16972
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33519–33524.
function agcAotUnit2186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33521 {
        if slot <= 33519 {
// PORT: SOURCE P40-P47.agc:291
//
// PORT: SOURCE P40-P47.agc:292
//		CAF	PRIO5
// PORT: Fixed ROM slots 33519.
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
// PORT: SOURCE P40-P47.agc:293
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 33520.
                if slot <> 33520 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:294
//
// PORT: SOURCE P40-P47.agc:295
//DYNMDISP	CA	DISPDEX		# A NON-POSITIVE DISPDEX INDICATES PAST
// PORT: Fixed ROM slots 33521.
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
// PORT: SOURCE P40-P47.agc:296
//		EXTEND			# TIG-35, SO SERVICER WILL BE DOING THE
// PORT: Fixed ROM slots 33522.
            if slot <> 33522 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33523 {
// PORT: SOURCE P40-P47.agc:297
//		BZMF	ENDOFJOB	# UPDATING OF NOUN 85.  STOP DYNMDISP.
// PORT: Fixed ROM slots 33523.
                if slot <> 33523 or instruction <> 27245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 27245, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:298
//		TC	INTPRET
// PORT: Fixed ROM slots 33524.
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
// PORT: SOURCE P40-P47.agc:299
//		VLOAD	CALL
// PORT: Fixed ROM slots 33525.
    33525, 38138,
// PORT: SOURCE P40-P47.agc:300
//			VGPREV
// PORT: Fixed ROM slots 33526.
    33526, 3970,
// PORT: SOURCE P40-P47.agc:301
//			S41.1
// PORT: Fixed ROM slots 33527.
    33527, 48494,
// PORT: SOURCE P40-P47.agc:302
//		STORE	VGBODY
// PORT: Fixed ROM slots 33528.
    33528, 3716,
// PORT: SOURCE P40-P47.agc:303
//		EXIT
// PORT: Fixed ROM slots 33529.
    33529, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33530–33531.
function agcAotUnit2187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33530 {
// PORT: SOURCE P40-P47.agc:304
//		CAF	1SEC
// PORT: Fixed ROM slots 33530.
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
// PORT: SOURCE P40-P47.agc:305
//		TC	BANKCALL
// PORT: Fixed ROM slots 33531.
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
// PORT: SOURCE P40-P47.agc:306
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 33532.
    33532, 1978
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33533–33534.
function agcAotUnit2188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33533 {
// PORT: SOURCE P40-P47.agc:307
//		TCF	DYNMDISP
// PORT: Fixed ROM slots 33533.
        if slot <> 33533 or instruction <> 5873 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5873, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:308
//
// PORT: SOURCE P40-P47.agc:309
//CALCN85		TC	INTPRET
// PORT: Fixed ROM slots 33534.
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
// PORT: SOURCE P40-P47.agc:310
//		CALL
// PORT: Fixed ROM slots 33535.
    33535, 65320,
// PORT: SOURCE P40-P47.agc:311
//			UPDATEVG
// PORT: Fixed ROM slots 33536.
    33536, 63250,
// PORT: SOURCE P40-P47.agc:312
//		VLOAD	CALL
// PORT: Fixed ROM slots 33537.
    33537, 38138,
// PORT: SOURCE P40-P47.agc:313
//			VGPREV
// PORT: Fixed ROM slots 33538.
    33538, 3970,
// PORT: SOURCE P40-P47.agc:314
//			S41.1
// PORT: Fixed ROM slots 33539.
    33539, 48494,
// PORT: SOURCE P40-P47.agc:315
//		STORE	VGBODY
// PORT: Fixed ROM slots 33540.
    33540, 3716,
// PORT: SOURCE P40-P47.agc:316
//		EXIT
// PORT: Fixed ROM slots 33541.
    33541, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33542–33542.
function agcAotUnit2189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:317
//		TC	POSTJUMP
// PORT: Fixed ROM slots 33542.
    if slot <> 33542 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2189] to agcAotUnit2189@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:318
//		CADR	SERVEXIT
// PORT: Fixed ROM slots 33543.
    33543, 55280
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33544–33544.
function agcAotUnit2190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:319
//
// PORT: SOURCE P40-P47.agc:320
//		COUNT*	$$/P42
// PORT: SOURCE P40-P47.agc:321
//		EBANK=	WHICH
// PORT: SOURCE P40-P47.agc:322
//
// PORT: SOURCE P40-P47.agc:323
//P42LM		TC	PHASCHNG
// PORT: Fixed ROM slots 33544.
    if slot <> 33544 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2190] to agcAotUnit2190@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:324
//		OCT	04024
// PORT: Fixed ROM slots 33545.
    33545, 4136
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33546–33552.
function agcAotUnit2191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33548 {
        if slot <= 33546 {
// PORT: SOURCE P40-P47.agc:325
//
// PORT: SOURCE P40-P47.agc:326
//		CAF	P42ADRES	# INITIALIZATION FOR BURNBABY.
// PORT: Fixed ROM slots 33546.
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
// PORT: SOURCE P40-P47.agc:327
//		TS	WHICH
// PORT: Fixed ROM slots 33547.
                if slot <> 33547 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:328
//
// PORT: SOURCE P40-P47.agc:329
//		CS	FLGWRD10
// PORT: Fixed ROM slots 33548.
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
// PORT: SOURCE P40-P47.agc:330
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 33549.
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
// PORT: SOURCE P40-P47.agc:331
//		CCS	A
// PORT: Fixed ROM slots 33550.
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
// PORT: SOURCE P40-P47.agc:332
//		TC	P40ALM
// PORT: Fixed ROM slots 33551.
                if slot <> 33551 or instruction <> 1617 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1617, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:333
//P42STAGE	TC	BANKCALL
// PORT: Fixed ROM slots 33552.
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
// PORT: SOURCE P40-P47.agc:334
//# Page 758
// PORT: SOURCE P40-P47.agc:335
//		CADR	R02BOTH
// PORT: Fixed ROM slots 33553.
    33553, 9560
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33554–33558.
function agcAotUnit2192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33555 {
        if slot <= 33554 {
// PORT: SOURCE P40-P47.agc:336
//		CAF	THRESH2		# INITIALIZE DVMON
// PORT: Fixed ROM slots 33554.
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
// PORT: SOURCE P40-P47.agc:337
//		TS	DVTHRUSH
// PORT: Fixed ROM slots 33555.
            if slot <> 33555 or instruction <> 23209 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23209, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33556 {
// PORT: SOURCE P40-P47.agc:338
//		CAF	FOUR
// PORT: Fixed ROM slots 33556.
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
// PORT: SOURCE P40-P47.agc:339
//		TS	DVCNTR
// PORT: Fixed ROM slots 33557.
                if slot <> 33557 or instruction <> 23373 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23373, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:340
//
// PORT: SOURCE P40-P47.agc:341
//		TC	INTPRET
// PORT: Fixed ROM slots 33558.
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
// PORT: SOURCE P40-P47.agc:342
//		SET	VLOAD		# LOAD FAPS, MDOTAPS, AND ATDECAY INTO
// PORT: Fixed ROM slots 33559.
    33559, 64792,
// PORT: SOURCE P40-P47.agc:343
//			AVFLAG		# F, MDOT, AND TDECAY BY VECTOR LOAD.
// PORT: Fixed ROM slots 33560.
    33560, 1140,
// PORT: SOURCE P40-P47.agc:344
//			FAPS
// PORT: Fixed ROM slots 33561.
    33561, 28686,
// PORT: SOURCE P40-P47.agc:345
//		STORE	F
// PORT: Fixed ROM slots 33562.
    33562, 4026,
// PORT: SOURCE P40-P47.agc:346
//		SLOAD	GOTO
// PORT: Fixed ROM slots 33563.
    33563, 43194,
// PORT: SOURCE P40-P47.agc:347
//			APSVEX
// PORT: Fixed ROM slots 33564.
    33564, 22530,
// PORT: SOURCE P40-P47.agc:348
//			P40IN
// PORT: Fixed ROM slots 33565.
    33565, 62720
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33566–33566.
function agcAotUnit2193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:349
//
// PORT: SOURCE P40-P47.agc:350
//		EBANK=	WHICH
// PORT: SOURCE P40-P47.agc:351
//
// PORT: SOURCE P40-P47.agc:352
//		COUNT*	$$/P47
// PORT: SOURCE P40-P47.agc:353
//P47LM		TC	BANKCALL
// PORT: Fixed ROM slots 33566.
    if slot <> 33566 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2193] to agcAotUnit2193@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:354
//		CADR	R02BOTH
// PORT: Fixed ROM slots 33567.
    33567, 9560
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33568–33568.
function agcAotUnit2194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:355
//		TC	INTPRET
// PORT: Fixed ROM slots 33568.
    if slot <> 33568 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2194] to agcAotUnit2194@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:356
//		CALRB
// PORT: Fixed ROM slots 33569.
    33569, 65320,
// PORT: SOURCE P40-P47.agc:357
//			MIDTOAV2
// PORT: Fixed ROM slots 33570.
    33570, 24278
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33571–33572.
function agcAotUnit2195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33571 {
// PORT: SOURCE P40-P47.agc:358
//
// PORT: SOURCE P40-P47.agc:359
//		CA	MPAC +1
// PORT: Fixed ROM slots 33571.
        if slot <> 33571 or instruction <> 12397 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 109).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:360
//		TC	TWIDDLE
// PORT: Fixed ROM slots 33572.
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
// PORT: SOURCE P40-P47.agc:361
//		ADRES	STARTP47
// PORT: Fixed ROM slots 33573.
    33573, 3662
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33574–33575.
function agcAotUnit2196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33574 {
// PORT: SOURCE P40-P47.agc:362
//
// PORT: SOURCE P40-P47.agc:363
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 33574.
        if slot <> 33574 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:364
//
// PORT: SOURCE P40-P47.agc:365
//STARTP47	TC	PHASCHNG
// PORT: Fixed ROM slots 33575.
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
// PORT: SOURCE P40-P47.agc:366
//		OCT	05014
// PORT: Fixed ROM slots 33576.
    33576, 5144,
// PORT: SOURCE P40-P47.agc:367
//		OCT	77777
// PORT: Fixed ROM slots 33577.
    33577, 65534
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33578–33582.
function agcAotUnit2197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33579 {
        if slot <= 33578 {
// PORT: SOURCE P40-P47.agc:368
//
// PORT: SOURCE P40-P47.agc:369
//		EXTEND
// PORT: Fixed ROM slots 33578.
            if slot <> 33578 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:370
//		DCA	ACADN83
// PORT: Fixed ROM slots 33579.
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
// PORT: SOURCE P40-P47.agc:371
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 33580.
            if slot <> 33580 or instruction <> 22187 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33581 {
// PORT: SOURCE P40-P47.agc:372
//		CAF	PRIO20
// PORT: Fixed ROM slots 33581.
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
// PORT: SOURCE P40-P47.agc:373
//		TC	FINDVAC
// PORT: Fixed ROM slots 33582.
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
// PORT: SOURCE P40-P47.agc:374
//		EBANK=	DELVIMU
// PORT: SOURCE P40-P47.agc:375
//		2CADR	P47BODY
// PORT: Fixed ROM slots 33583 33584.
    33583, 3734, 33584, 61550
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33585–33586.
function agcAotUnit2198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33585 {
// PORT: SOURCE P40-P47.agc:376
//
// PORT: SOURCE P40-P47.agc:377
//		TCF	REDO4.2		# CHECKS PHASE 5 AND GOES TO PREREAD
// PORT: Fixed ROM slots 33585.
        if slot <> 33585 or instruction <> 5346 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5346, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:378
//					# SEE TIG-30 IN BURNBABY
// PORT: SOURCE P40-P47.agc:379
//
// PORT: SOURCE P40-P47.agc:380
//CALCN83		TC	INTPRET
// PORT: Fixed ROM slots 33586.
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
// PORT: SOURCE P40-P47.agc:381
//		VLOAD	VAD
// PORT: Fixed ROM slots 33587.
    33587, 44538,
// PORT: SOURCE P40-P47.agc:382
//			DELVCTL
// PORT: Fixed ROM slots 33588.
    33588, 3716,
// PORT: SOURCE P40-P47.agc:383
//			DELVREF
// PORT: Fixed ROM slots 33589.
    33589, 3758,
// PORT: SOURCE P40-P47.agc:384
//		STORE	DELVSIN		# TEMP STORAGE FOR RESTARTS
// PORT: Fixed ROM slots 33590.
    33590, 3932,
// PORT: SOURCE P40-P47.agc:385
//# Page 759
// PORT: SOURCE P40-P47.agc:386
//		CALL
// PORT: Fixed ROM slots 33591.
    33591, 65320,
// PORT: SOURCE P40-P47.agc:387
//			S41.1
// PORT: Fixed ROM slots 33592.
    33592, 48494,
// PORT: SOURCE P40-P47.agc:388
//		STORE	DELVIMU
// PORT: Fixed ROM slots 33593.
    33593, 3878,
// PORT: SOURCE P40-P47.agc:389
//		EXIT
// PORT: Fixed ROM slots 33594.
    33594, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33595–33595.
function agcAotUnit2199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:390
//		TC	PHASCHNG
// PORT: Fixed ROM slots 33595.
    if slot <> 33595 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2199] to agcAotUnit2199@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:391
//		OCT	10035		# REREADAC AND HERE
// PORT: Fixed ROM slots 33596.
    33596, 8250
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33597–33597.
function agcAotUnit2200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:392
//
// PORT: SOURCE P40-P47.agc:393
//		TC	INTPRET
// PORT: Fixed ROM slots 33597.
    if slot <> 33597 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2200] to agcAotUnit2200@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:394
//		VLOAD
// PORT: Fixed ROM slots 33598.
    33598, 65530,
// PORT: SOURCE P40-P47.agc:395
//			DELVSIN
// PORT: Fixed ROM slots 33599.
    33599, 3932,
// PORT: SOURCE P40-P47.agc:396
//		STORE	DELVCTL
// PORT: Fixed ROM slots 33600.
    33600, 3716,
// PORT: SOURCE P40-P47.agc:397
//		EXIT
// PORT: Fixed ROM slots 33601.
    33601, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33602–33602.
function agcAotUnit2201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:398
//
// PORT: SOURCE P40-P47.agc:399
//		TC	POSTJUMP
// PORT: Fixed ROM slots 33602.
    if slot <> 33602 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2201] to agcAotUnit2201@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:400
//		CADR	SERVEXIT
// PORT: Fixed ROM slots 33603.
    33603, 55280
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33604–33605.
function agcAotUnit2202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33604 {
// PORT: SOURCE P40-P47.agc:401
//
// PORT: SOURCE P40-P47.agc:402
//P47BOD		CAF	V1683
// PORT: Fixed ROM slots 33604.
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
// PORT: SOURCE P40-P47.agc:403
//		TC	BANKCALL
// PORT: Fixed ROM slots 33605.
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
// PORT: SOURCE P40-P47.agc:404
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 33606.
    33606, 17210
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33607–33608.
function agcAotUnit2203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33607 {
// PORT: SOURCE P40-P47.agc:405
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 33607.
        if slot <> 33607 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P40-P47.agc:406
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 33608.
        if slot <> 33608 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2203] to agcAotUnit2203@.

// PORT: Physical bank 36. Shared continuation entries, slots 33609–33611.
function agcAotUnit2204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33609 {
// PORT: SOURCE P40-P47.agc:407
//
// PORT: SOURCE P40-P47.agc:408
//		TCF	P47BODY
// PORT: Fixed ROM slots 33609.
        if slot <> 33609 or instruction <> 5963 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5963, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33610 {
// PORT: SOURCE P40-P47.agc:409
//
// PORT: SOURCE P40-P47.agc:410
//		TCF	P40PHS1
// PORT: Fixed ROM slots 33610.
            if slot <> 33610 or instruction <> 5790 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5790, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:411
//
// PORT: SOURCE P40-P47.agc:412
//P47BODY		TC	INTPRET
// PORT: Fixed ROM slots 33611.
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
// PORT: SOURCE P40-P47.agc:413
//		VLOAD
// PORT: Fixed ROM slots 33612.
    33612, 65530,
// PORT: SOURCE P40-P47.agc:414
//			HI6ZEROS
// PORT: Fixed ROM slots 33613.
    33613, 6820,
// PORT: SOURCE P40-P47.agc:415
//		STORE	DELVIMU
// PORT: Fixed ROM slots 33614.
    33614, 3878,
// PORT: SOURCE P40-P47.agc:416
//		STORE	DELVCTL
// PORT: Fixed ROM slots 33615.
    33615, 3716,
// PORT: SOURCE P40-P47.agc:417
//		EXIT
// PORT: Fixed ROM slots 33616.
    33616, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33617–33620.
function agcAotUnit2205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33618 {
        if slot <= 33617 {
// PORT: SOURCE P40-P47.agc:418
//		TC	P47BOD
// PORT: Fixed ROM slots 33617.
            if slot <> 33617 or instruction <> 1860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1860, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:419
//
// PORT: SOURCE P40-P47.agc:420
//		COUNT*	$$/P40
// PORT: SOURCE P40-P47.agc:421
//IMPLBURN	CA	TGO 	+1
// PORT: Fixed ROM slots 33618.
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
// PORT: SOURCE P40-P47.agc:422
//		TC	GETDT
// PORT: Fixed ROM slots 33619.
            if slot <> 33619 or instruction <> 2013 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2013, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:423
//		TC	TWIDDLE
// PORT: Fixed ROM slots 33620.
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
// PORT: SOURCE P40-P47.agc:424
//		ADRES	ENGOFTSK
// PORT: Fixed ROM slots 33621.
    33621, 3780
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33622–33622.
function agcAotUnit2206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:425
//		TC	DOWNFLAG	# TURN OFF IGNFLAG
// PORT: Fixed ROM slots 33622.
    if slot <> 33622 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2206] to agcAotUnit2206@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:426
//		ADRES	IGNFLAG
// PORT: Fixed ROM slots 33623.
    33623, 214
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33624–33624.
function agcAotUnit2207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:427
//		TC	DOWNFLAG	# TURN OFF ASTNFLG
// PORT: Fixed ROM slots 33624.
    if slot <> 33624 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2207] to agcAotUnit2207@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:428
//		ADRES	ASTNFLAG
// PORT: Fixed ROM slots 33625.
    33625, 216
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33626–33626.
function agcAotUnit2208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:429
//		TC	DOWNFLAG	# TURN OFF IMPULSW
// PORT: Fixed ROM slots 33626.
    if slot <> 33626 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2208] to agcAotUnit2208@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:430
//		ADRES	IMPULSW
// PORT: Fixed ROM slots 33627.
    33627, 72
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33628–33628.
function agcAotUnit2209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:431
//		TC	PHASCHNG	# RESTART PROTECT ENGOFTSK (ENGINOFF)
// PORT: Fixed ROM slots 33628.
    if slot <> 33628 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2209] to agcAotUnit2209@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:432
//		OCT	40114
// PORT: Fixed ROM slots 33629.
    33629, 32920
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33630–33630.
function agcAotUnit2210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:433
//
// PORT: SOURCE P40-P47.agc:434
//		TC	FIXDELAY	# WAIT HALF A SECOND
// PORT: Fixed ROM slots 33630.
    if slot <> 33630 or instruction <> 2705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2210] to agcAotUnit2210@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:435
//		DEC	50
// PORT: Fixed ROM slots 33631.
    33631, 100
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33632–33634.
function agcAotUnit2211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33632 {
// PORT: SOURCE P40-P47.agc:436
//# Page 760
// PORT: SOURCE P40-P47.agc:437
//		TC	NOULLAGE	# TURN OFF ULLAGE
// PORT: Fixed ROM slots 33632.
        if slot <> 33632 or instruction <> 1451 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1451, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33633 {
// PORT: SOURCE P40-P47.agc:438
//
// PORT: SOURCE P40-P47.agc:439
//		TC	TASKOVER
// PORT: Fixed ROM slots 33633.
            if slot <> 33633 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:440
//
// PORT: SOURCE P40-P47.agc:441
//ENGOFTSK	TC	IBNKCALL	# THIS CODING ALLOWS ENGINOFF ET AL TO BE
// PORT: Fixed ROM slots 33634.
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
// PORT: SOURCE P40-P47.agc:442
//		CADR	ENGINOFF	# USED BOTH BY WAITLIST AND BY TC IBNKCALL
// PORT: Fixed ROM slots 33635.
    33635, 63178
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33636–33638.
function agcAotUnit2212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33636 {
// PORT: SOURCE P40-P47.agc:443
//		TC	TASKOVER
// PORT: Fixed ROM slots 33636.
        if slot <> 33636 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33637 {
// PORT: SOURCE P40-P47.agc:444
//
// PORT: SOURCE P40-P47.agc:445
//ENGINOFF	CAF	PRIO12		# MUST BE LOWER PRIO THAN CLOCKJOB
// PORT: Fixed ROM slots 33637.
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
// PORT: SOURCE P40-P47.agc:446
//		TC	FINDVAC
// PORT: Fixed ROM slots 33638.
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
// PORT: SOURCE P40-P47.agc:447
//		EBANK=	TRKMKCNT
// PORT: SOURCE P40-P47.agc:448
//		2CADR	POSTBURN
// PORT: Fixed ROM slots 33639 33640.
    33639, 3366, 33640, 61550
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33641–33642.
function agcAotUnit2213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33641 {
// PORT: SOURCE P40-P47.agc:449
//
// PORT: SOURCE P40-P47.agc:450
//ENGINOF2	CAF	BIT1
// PORT: Fixed ROM slots 33641.
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
// PORT: SOURCE P40-P47.agc:451
//		TC	WAITLIST
// PORT: Fixed ROM slots 33642.
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
// PORT: SOURCE P40-P47.agc:452
//		EBANK=	OMEGAQ
// PORT: SOURCE P40-P47.agc:453
//		2CADR	COASTSET
// PORT: Fixed ROM slots 33643 33644.
    33643, 3852, 33644, 61548
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33645–33670.
function agcAotUnit2214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33657 {
        if slot <= 33650 {
            if slot <= 33647 {
                if slot <= 33645 {
// PORT: SOURCE P40-P47.agc:454
//
// PORT: SOURCE P40-P47.agc:455
//ENGINOF1	CS	FLAGWRD7	# SET THE IDLE BIT.
// PORT: Fixed ROM slots 33645.
                    if slot <> 33645 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33646 {
// PORT: SOURCE P40-P47.agc:456
//		MASK	IDLEFBIT
// PORT: Fixed ROM slots 33646.
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
// PORT: SOURCE P40-P47.agc:457
//		ADS	FLAGWRD7
// PORT: Fixed ROM slots 33647.
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
// PORT: SOURCE P40-P47.agc:458
//
// PORT: SOURCE P40-P47.agc:459
//		TC	NOULLAGE
// PORT: Fixed ROM slots 33648.
                    if slot <> 33648 or instruction <> 1451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1451, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33649 {
// PORT: SOURCE P40-P47.agc:460
//
// PORT: SOURCE P40-P47.agc:461
//ENGINOF4	EXTEND
// PORT: Fixed ROM slots 33649.
                        if slot <> 33649 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:462
//		DCA	TIME2
// PORT: Fixed ROM slots 33650.
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
// PORT: SOURCE P40-P47.agc:463
//		DXCH	TEVENT
// PORT: Fixed ROM slots 33651.
                    if slot <> 33651 or instruction <> 22245 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 741, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33652 {
// PORT: SOURCE P40-P47.agc:464
//
// PORT: SOURCE P40-P47.agc:465
//ENGINOF3	CS	ENGONBIT	# INSURE ENGONFLG IS CLEAR.
// PORT: Fixed ROM slots 33652.
                        if slot <> 33652 or instruction <> 18917 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:466
//		MASK	FLAGWRD5
// PORT: Fixed ROM slots 33653.
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
// PORT: SOURCE P40-P47.agc:467
//		TS	FLAGWRD5
// PORT: Fixed ROM slots 33654.
                        if slot <> 33654 or instruction <> 22593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22593, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:468
//		CS	PRIO30		# ENGINOF3 IS USED AS A PRE-ENGINE ARM
// PORT: Fixed ROM slots 33655.
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
// PORT: SOURCE P40-P47.agc:469
//		EXTEND			# SUBROUTINE.
// PORT: Fixed ROM slots 33656.
                        if slot <> 33656 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:470
//		RAND	DSALMOUT
// PORT: Fixed ROM slots 33657.
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
// PORT: SOURCE P40-P47.agc:471
//		AD	PRIO20		# TURN OFF THE ENGINE -- DPS OR APS
// PORT: Fixed ROM slots 33658.
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
// PORT: SOURCE P40-P47.agc:472
//		EXTEND
// PORT: Fixed ROM slots 33659.
                        if slot <> 33659 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:473
//		WRITE	DSALMOUT
// PORT: Fixed ROM slots 33660.
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
// PORT: SOURCE P40-P47.agc:474
//
// PORT: SOURCE P40-P47.agc:475
//		CS	DAPBOOLS	# TURN OFF TRIM GIMBAL
// PORT: Fixed ROM slots 33661.
                    if slot <> 33661 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33662 {
// PORT: SOURCE P40-P47.agc:476
//		MASK	USEQRJTS
// PORT: Fixed ROM slots 33662.
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
// PORT: SOURCE P40-P47.agc:477
//		ADS	DAPBOOLS
// PORT: Fixed ROM slots 33663.
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
// PORT: SOURCE P40-P47.agc:478
//
// PORT: SOURCE P40-P47.agc:479
//		CS	HIRTHROT	# ZERO AUTO-THROTTLE WHENEVER THE ENGINE
// PORT: Fixed ROM slots 33664.
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
// PORT: SOURCE P40-P47.agc:480
//		TS	THRUST		# IS TURNED OFF.
// PORT: Fixed ROM slots 33665.
                        if slot <> 33665 or instruction <> 22573 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22573, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:481
//		CAF	BIT4		# THE HARDWARE DOES SO ONLY WHEN THE
// PORT: Fixed ROM slots 33666.
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
// PORT: SOURCE P40-P47.agc:482
//		EXTEND			# ENGINE IS DISARMED.
// PORT: Fixed ROM slots 33667.
                        if slot <> 33667 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:483
//		WOR	CHAN14
// PORT: Fixed ROM slots 33668.
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
// PORT: SOURCE P40-P47.agc:484
//
// PORT: SOURCE P40-P47.agc:485
//		TC	ISWRETRN
// PORT: Fixed ROM slots 33669.
                        if slot <> 33669 or instruction <> 2503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P40-P47.agc:486
//# Page 761
// PORT: SOURCE P40-P47.agc:487
//COASTSET	TC	IBNKCALL	# DO DAP COASTING INITIALIZATION
// PORT: Fixed ROM slots 33670.
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
// PORT: SOURCE P40-P47.agc:488
//		CADR	ALLCOAST
// PORT: Fixed ROM slots 33671.
    33671, 33032
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33672–33672.
function agcAotUnit2215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:489
//		TC	TASKOVER
// PORT: Fixed ROM slots 33672.
    if slot <> 33672 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2215] to agcAotUnit2215@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:490
//
// PORT: SOURCE P40-P47.agc:491
//		EBANK=	OMEGAQ
// PORT: SOURCE P40-P47.agc:492
//UPDATEVG	STQ	CALL
// PORT: Fixed ROM slots 33673.
    33673, 37920,
// PORT: SOURCE P40-P47.agc:493
//			QTEMP1
// PORT: Fixed ROM slots 33674.
    33674, 3946,
// PORT: SOURCE P40-P47.agc:494
//			S40.8		# X-PRODUCT STEERING
// PORT: Fixed ROM slots 33675.
    33675, 47694,
// PORT: SOURCE P40-P47.agc:495
//		BON	BON
// PORT: Fixed ROM slots 33676.
    33676, 35864,
// PORT: SOURCE P40-P47.agc:496
//			XDELVFLG
// PORT: Fixed ROM slots 33677.
    33677, 1422,
// PORT: SOURCE P40-P47.agc:497
//			QTEMP1
// PORT: Fixed ROM slots 33678.
    33678, 3946,
// PORT: SOURCE P40-P47.agc:498
//			NORMSW
// PORT: Fixed ROM slots 33679.
    33679, 3978,
// PORT: SOURCE P40-P47.agc:499
//			180SETUP
// PORT: Fixed ROM slots 33680.
    33680, 63286,
// PORT: SOURCE P40-P47.agc:500
//		DLOAD	DSU
// PORT: Fixed ROM slots 33681.
    33681, 38346,
// PORT: SOURCE P40-P47.agc:501
//			PIPTIME
// PORT: Fixed ROM slots 33682.
    33682, 1338,
// PORT: SOURCE P40-P47.agc:502
//			TIGSAVE
// PORT: Fixed ROM slots 33683.
    33683, 4070,
// PORT: SOURCE P40-P47.agc:503
//		DSU	BMN
// PORT: Fixed ROM slots 33684.
    33684, 41002,
// PORT: SOURCE P40-P47.agc:504
//			TNEWA
// PORT: Fixed ROM slots 33685.
    33685, 3636,
// PORT: SOURCE P40-P47.agc:505
//			GETRANS
// PORT: Fixed ROM slots 33686.
    33686, 63324,
// PORT: SOURCE P40-P47.agc:506
//		DLOAD	DAD
// PORT: Fixed ROM slots 33687.
    33687, 36298,
// PORT: SOURCE P40-P47.agc:507
//			TIGSAVE
// PORT: Fixed ROM slots 33688.
    33688, 4070,
// PORT: SOURCE P40-P47.agc:508
//			TNEWA
// PORT: Fixed ROM slots 33689.
    33689, 3636,
// PORT: SOURCE P40-P47.agc:509
//		STORE	TIGSAVEP
// PORT: Fixed ROM slots 33690.
    33690, 4074,
// PORT: SOURCE P40-P47.agc:510
//180SETUP	EXIT
// PORT: Fixed ROM slots 33691.
    33691, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33692–33696.
function agcAotUnit2216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33693 {
        if slot <= 33692 {
// PORT: SOURCE P40-P47.agc:511
//		CCS	PHASE2
// PORT: Fixed ROM slots 33692.
            if slot <> 33692 or instruction <> 4589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 493).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P40-P47.agc:512
//		TCF	NO.9
// PORT: Fixed ROM slots 33693.
            if slot <> 33693 or instruction <> 6067 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6067, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33694 {
// PORT: SOURCE P40-P47.agc:513
//		CAF	PRIO10
// PORT: Fixed ROM slots 33694.
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
// PORT: SOURCE P40-P47.agc:514
//		INHINT
// PORT: Fixed ROM slots 33695.
                if slot <> 33695 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:515
//		TC	FINDVAC
// PORT: Fixed ROM slots 33696.
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
// PORT: SOURCE P40-P47.agc:516
//		EBANK=	VG
// PORT: SOURCE P40-P47.agc:517
//		2CADR	S40.9		# LAMBERT VTOGAIN
// PORT: Fixed ROM slots 33697 33698.
    33697, 2958, 33698, 47214
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33699–33699.
function agcAotUnit2217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:518
//
// PORT: SOURCE P40-P47.agc:519
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 33699.
    if slot <> 33699 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2217] to agcAotUnit2217@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:520
//		OCT	00172		# 2.17SPOT FOR S40.9
// PORT: Fixed ROM slots 33700.
    33700, 244,
// PORT: SOURCE P40-P47.agc:521
//		OCT	10035		# HERE AND REREADAC AFTER RESTART
// PORT: Fixed ROM slots 33701.
    33701, 8250
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33702–33702.
function agcAotUnit2218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:522
//
// PORT: SOURCE P40-P47.agc:523
//ENDSTEER	TC	INTPRET
// PORT: Fixed ROM slots 33702.
    if slot <> 33702 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2218] to agcAotUnit2218@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:524
//		DLOAD
// PORT: Fixed ROM slots 33703.
    33703, 65482,
// PORT: SOURCE P40-P47.agc:525
//			TIGSAVEP
// PORT: Fixed ROM slots 33704.
    33704, 4074,
// PORT: SOURCE P40-P47.agc:526
//		STOVL	TIGSAVE
// PORT: Fixed ROM slots 33705.
    33705, 24550,
// PORT: SOURCE P40-P47.agc:527
//			RN
// PORT: Fixed ROM slots 33706.
    33706, 1314,
// PORT: SOURCE P40-P47.agc:528
//		STOVL	RINIT
// PORT: Fixed ROM slots 33707.
    33707, 22950,
// PORT: SOURCE P40-P47.agc:529
//			VN
// PORT: Fixed ROM slots 33708.
    33708, 1326,
// PORT: SOURCE P40-P47.agc:530
//		STORE	VINIT
// PORT: Fixed ROM slots 33709.
    33709, 2482,
// PORT: SOURCE P40-P47.agc:531
//GETRANS		DLOAD	DSU
// PORT: Fixed ROM slots 33710.
    33710, 38346,
// PORT: SOURCE P40-P47.agc:532
//			TPASS4
// PORT: Fixed ROM slots 33711.
    33711, 3890,
// PORT: SOURCE P40-P47.agc:533
//			PIPTIME
// PORT: Fixed ROM slots 33712.
    33712, 1338,
// PORT: SOURCE P40-P47.agc:534
//		STCALL	DELLT4
// PORT: Fixed ROM slots 33713.
    33713, 32340,
// PORT: SOURCE P40-P47.agc:535
//			QTEMP1
// PORT: Fixed ROM slots 33714.
    33714, 3946
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33715–33715.
function agcAotUnit2219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:536
//
// PORT: SOURCE P40-P47.agc:537
//# Page 762
// PORT: SOURCE P40-P47.agc:538
//NO.9		TC	INTPRET
// PORT: Fixed ROM slots 33715.
    if slot <> 33715 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2219] to agcAotUnit2219@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:539
//		GOTO
// PORT: Fixed ROM slots 33716.
    33716, 65360,
// PORT: SOURCE P40-P47.agc:540
//			QTEMP1
// PORT: Fixed ROM slots 33717.
    33717, 3946
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33718–33718.
function agcAotUnit2220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:541
//STEERING	TC	INTPRET
// PORT: Fixed ROM slots 33718.
    if slot <> 33718 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2220] to agcAotUnit2220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:542
//
// PORT: SOURCE P40-P47.agc:543
//		CALL
// PORT: Fixed ROM slots 33719.
    33719, 65320,
// PORT: SOURCE P40-P47.agc:544
//			UPDATEVG
// PORT: Fixed ROM slots 33720.
    33720, 63250,
// PORT: SOURCE P40-P47.agc:545
//		EXIT
// PORT: Fixed ROM slots 33721.
    33721, 65532
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33722–33733.
function agcAotUnit2221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33727 {
        if slot <= 33724 {
            if slot <= 33722 {
// PORT: SOURCE P40-P47.agc:546
//
// PORT: SOURCE P40-P47.agc:547
//		EBANK=	DVCNTR
// PORT: SOURCE P40-P47.agc:548
//NSTEER		INHINT
// PORT: Fixed ROM slots 33722.
                if slot <> 33722 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33723 {
// PORT: SOURCE P40-P47.agc:549
//		CA	EBANK7
// PORT: Fixed ROM slots 33723.
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
// PORT: SOURCE P40-P47.agc:550
//		TS	EBANK
// PORT: Fixed ROM slots 33724.
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
// PORT: SOURCE P40-P47.agc:551
//		CS	FLAGWRD2	# CHECK IMPULSE SWITCH.  IT IS SET EITHER
// PORT: Fixed ROM slots 33725.
                if slot <> 33725 or instruction <> 16446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 62).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33726 {
// PORT: SOURCE P40-P47.agc:552
//		MASK	IMPULBIT	# BY S40.13 IF TBURN<6 SECS OR BY S40.8 IF
// PORT: Fixed ROM slots 33726.
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
// PORT: SOURCE P40-P47.agc:553
//		CCS	A		# STEERING IS ALMOST DONE.
// PORT: Fixed ROM slots 33727.
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
// PORT: SOURCE P40-P47.agc:554
//
// PORT: SOURCE P40-P47.agc:555
//		TCF	+5		# IMPULSW = 0	EXIT
// PORT: Fixed ROM slots 33728.
                if slot <> 33728 or instruction <> 6085 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6085, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33729 {
// PORT: SOURCE P40-P47.agc:556
//		CS	FLAGWRD7	# IMPULSW = 1	WHY?  CHECK IDLEFLAG
// PORT: Fixed ROM slots 33729.
                    if slot <> 33729 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:557
//		MASK	IDLEFBIT	#	(IDLEFLAG = 0 --> DVMON ON)
// PORT: Fixed ROM slots 33730.
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
// PORT: SOURCE P40-P47.agc:558
//		CCS	A
// PORT: Fixed ROM slots 33731.
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
// PORT: SOURCE P40-P47.agc:559
//		TCF	+3		# DVMON ON --> THRUSTING --> IMPULSW VIA S40.8
// PORT: Fixed ROM slots 33732.
                    if slot <> 33732 or instruction <> 6087 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6087, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:560
//		TC	POSTJUMP	# DVMON OFF --> IMPULSW ON VIA S40.13 --> EXIT
// PORT: Fixed ROM slots 33733.
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
// PORT: SOURCE P40-P47.agc:561
//		CADR	SERVEXIT
// PORT: Fixed ROM slots 33734.
    33734, 55280
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33735–33735.
function agcAotUnit2222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:562
//
// PORT: SOURCE P40-P47.agc:563
//		TC	IBNKCALL
// PORT: Fixed ROM slots 33735.
    if slot <> 33735 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2222] to agcAotUnit2222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:564
//		CADR	STOPRATE
// PORT: Fixed ROM slots 33736.
    33736, 33002
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33737–33737.
function agcAotUnit2223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:565
//
// PORT: SOURCE P40-P47.agc:566
//		TC	DOWNFLAG	# TURN OFF IMPULSW
// PORT: Fixed ROM slots 33737.
    if slot <> 33737 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2223] to agcAotUnit2223@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:567
//		ADRES	IMPULSW
// PORT: Fixed ROM slots 33738.
    33738, 72
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33739–33739.
function agcAotUnit2224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:568
//
// PORT: SOURCE P40-P47.agc:569
//		TC	UPFLAG
// PORT: Fixed ROM slots 33739.
    if slot <> 33739 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2224] to agcAotUnit2224@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:570
//		ADRES	IDLEFLAG	# TURN OFF DVMON
// PORT: Fixed ROM slots 33740.
    33740, 226
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33741–33751.
function agcAotUnit2225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33745 {
        if slot <= 33742 {
            if slot <= 33741 {
// PORT: SOURCE P40-P47.agc:571
//
// PORT: SOURCE P40-P47.agc:572
//		INHINT
// PORT: Fixed ROM slots 33741.
                if slot <> 33741 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:573
//		EXTEND
// PORT: Fixed ROM slots 33742.
                if slot <> 33742 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33743 {
// PORT: SOURCE P40-P47.agc:574
//		DCA	TIG
// PORT: Fixed ROM slots 33743.
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
// PORT: SOURCE P40-P47.agc:575
//		DXCH	MPAC
// PORT: Fixed ROM slots 33744.
                    if slot <> 33744 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:576
//		EXTEND
// PORT: Fixed ROM slots 33745.
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
// PORT: SOURCE P40-P47.agc:577
//		DCS	TIME2
// PORT: Fixed ROM slots 33746.
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
// PORT: SOURCE P40-P47.agc:578
//		DAS	MPAC
// PORT: Fixed ROM slots 33747.
                    if slot <> 33747 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:579
//		TC	TPAGREE
// PORT: Fixed ROM slots 33748.
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
// PORT: SOURCE P40-P47.agc:580
//		CAE	MPAC 	+1
// PORT: Fixed ROM slots 33749.
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
// PORT: SOURCE P40-P47.agc:581
//		TC	GETDT
// PORT: Fixed ROM slots 33750.
                    if slot <> 33750 or instruction <> 2013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:582
//		TC	TWIDDLE
// PORT: Fixed ROM slots 33751.
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
// PORT: SOURCE P40-P47.agc:583
//		ADRES	ENGOFTSK
// PORT: Fixed ROM slots 33752.
    33752, 3780
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33753–33753.
function agcAotUnit2226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:584
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 33753.
    if slot <> 33753 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2226] to agcAotUnit2226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:585
//		OCT	40114		# ENGOFTSK (ENGINOFF)
// PORT: Fixed ROM slots 33754.
    33754, 32920,
// PORT: SOURCE P40-P47.agc:586
//		OCT	00035		# SERVICER -- REREADAC
// PORT: Fixed ROM slots 33755.
    33755, 58
)).

// PORT: Physical bank 36. Shared continuation entries, slots 33756–33766.
function agcAotUnit2227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33760 {
        if slot <= 33757 {
            if slot <= 33756 {
// PORT: SOURCE P40-P47.agc:587
//# Page 763
// PORT: SOURCE P40-P47.agc:588
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 33756.
                if slot <> 33756 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:589
//
// PORT: SOURCE P40-P47.agc:590
//GETDT		CCS	A
// PORT: Fixed ROM slots 33757.
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
// PORT: SOURCE P40-P47.agc:591
//		TCF	+3
// PORT: Fixed ROM slots 33758.
                if slot <> 33758 or instruction <> 6113 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6113, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33759 {
// PORT: SOURCE P40-P47.agc:592
//		TCF	+2
// PORT: Fixed ROM slots 33759.
                    if slot <> 33759 or instruction <> 6113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6113, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:593
//		CAF	ZERO
// PORT: Fixed ROM slots 33760.
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
// PORT: SOURCE P40-P47.agc:594
//		AD	ONE
// PORT: Fixed ROM slots 33761.
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
// PORT: SOURCE P40-P47.agc:595
//		XCH	L
// PORT: Fixed ROM slots 33762.
                    if slot <> 33762 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:596
//		CAF	ZERO
// PORT: Fixed ROM slots 33763.
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
// PORT: SOURCE P40-P47.agc:597
//		DXCH	TGO
// PORT: Fixed ROM slots 33764.
                if slot <> 33764 or instruction <> 22351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 847, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33765 {
// PORT: SOURCE P40-P47.agc:598
//		CA	TGO 	+1
// PORT: Fixed ROM slots 33765.
                    if slot <> 33765 or instruction <> 13135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 847).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:599
//		TC	Q
// PORT: Fixed ROM slots 33766.
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
// PORT: SOURCE P40-P47.agc:600
//
// PORT: SOURCE P40-P47.agc:601
//# **************************************
// PORT: SOURCE P40-P47.agc:602
//
// PORT: SOURCE P40-P47.agc:603
//SEC15DP		OCT	00000		# DON'T SEPARATE
// PORT: Fixed ROM slots 33767.
    33767, 0,
// PORT: SOURCE P40-P47.agc:604
//SEC15		DEC	1500		# DON'T SEPARATE
// PORT: Fixed ROM slots 33768.
    33768, 3000,
// PORT: SOURCE P40-P47.agc:605
//SEC30DP		2DEC	3000
// PORT: Fixed ROM slots 33769 33770.
    33769, 0, 33770, 6000,
// PORT: SOURCE P40-P47.agc:606
//
// PORT: SOURCE P40-P47.agc:607
//SEC45DP		OCT	00000		# DON'T MOVE FROM JUST BEFORE SEC45
// PORT: Fixed ROM slots 33771.
    33771, 0,
// PORT: SOURCE P40-P47.agc:608
//SEC45		DEC	4500
// PORT: Fixed ROM slots 33772.
    33772, 9000,
// PORT: SOURCE P40-P47.agc:609
//5SECDP		OCT	00000		# DON'T MOVE FROM JUST BEFORE 5SEC
// PORT: Fixed ROM slots 33773.
    33773, 0,
// PORT: SOURCE P40-P47.agc:610
//5SEC		DEC	500
// PORT: Fixed ROM slots 33774.
    33774, 1000,
// PORT: SOURCE P40-P47.agc:611
//26SECS		DEC	2600
// PORT: Fixed ROM slots 33775.
    33775, 5200,
// PORT: SOURCE P40-P47.agc:612
//V16N40		VN	1640
// PORT: Fixed ROM slots 33776.
    33776, 4176,
// PORT: SOURCE P40-P47.agc:613
//V16N85B		VN	1685
// PORT: Fixed ROM slots 33777.
    33777, 4266,
// PORT: SOURCE P40-P47.agc:614
//V1683		VN	1683
// PORT: Fixed ROM slots 33778.
    33778, 4262,
// PORT: SOURCE P40-P47.agc:615
//SEC01		=	1SEC
// PORT: SOURCE P40-P47.agc:616
//ACADN85		=	P41TABLE +2
// PORT: SOURCE P40-P47.agc:617
//
// PORT: SOURCE P40-P47.agc:618
//		EBANK=	DELVIMU
// PORT: SOURCE P40-P47.agc:619
//ACADN83		2CADR	CALCN83
// PORT: Fixed ROM slots 33779 33780.
    33779, 3684, 33780, 61550,
// PORT: SOURCE P40-P47.agc:620
//
// PORT: SOURCE P40-P47.agc:621
//# ******************************************
// PORT: SOURCE P40-P47.agc:622
//# Page 764
// PORT: SOURCE P40-P47.agc:623
//# PROGRAM DESCRIPTION: S40.1		DATE: 15 NOV 66
// PORT: SOURCE P40-P47.agc:624
//# MOD N02				LOG SECTION P40-P47
// PORT: SOURCE P40-P47.agc:625
//# MOD BY ZELDIN AND ADAPTED BY TALAYCO
// PORT: SOURCE P40-P47.agc:626
//#
// PORT: SOURCE P40-P47.agc:627
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P40-P47.agc:628
//#	COMPUTE INITIAL THRUST DIRECTION(UT) AND INITIAL VALUE OF VG
// PORT: SOURCE P40-P47.agc:629
//#	VECTOR(VGTIG).
// PORT: SOURCE P40-P47.agc:630
//#
// PORT: SOURCE P40-P47.agc:631
//# CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:632
//#	L	CALL
// PORT: SOURCE P40-P47.agc:633
//#	L+1		S40.1
// PORT: SOURCE P40-P47.agc:634
//#
// PORT: SOURCE P40-P47.agc:635
//# NORMAL EXIT MODE
// PORT: SOURCE P40-P47.agc:636
//#	AT L+2 OF CALLING SEQUENCE (GOTO L+2) NORMAL RETURN OR
// PORT: SOURCE P40-P47.agc:637
//#	ERROR RETURN IF NOSOFLAG =1
// PORT: SOURCE P40-P47.agc:638
//#
// PORT: SOURCE P40-P47.agc:639
//# SUBROUTINES CALLED
// PORT: SOURCE P40-P47.agc:640
//#	LEMPREC
// PORT: SOURCE P40-P47.agc:641
//#	INITVEL
// PORT: SOURCE P40-P47.agc:642
//#	CALCGRAV
// PORT: SOURCE P40-P47.agc:643
//#	MIDGIM
// PORT: SOURCE P40-P47.agc:644
//#
// PORT: SOURCE P40-P47.agc:645
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P40-P47.agc:646
//#	L+2 OF CALLING SEQUENCE, UNSOLVABLE CONIC IF NOSOFLAG=1
// PORT: SOURCE P40-P47.agc:647
//#
// PORT: SOURCE P40-P47.agc:648
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P40-P47.agc:649
//#	WEIGHT/G	ANTICIPATED VEHICLE MASS	DP B16 KGM
// PORT: SOURCE P40-P47.agc:650
//#	XDELVFLG	1=DELTA-V MANEUVER, 0=AIMPT STEER
// PORT: SOURCE P40-P47.agc:651
//#	F		THRUST FOR ENGINE USED
// PORT: SOURCE P40-P47.agc:652
//#   IF DELTA-V MANEUVER:
// PORT: SOURCE P40-P47.agc:653
//#	DELVSIN		SPECIFIED DELTA-V REQUIRED IN
// PORT: SOURCE P40-P47.agc:654
//#			INERTIAL COORDS. OF ACTIVE VEHICLE
// PORT: SOURCE P40-P47.agc:655
//#			AT TIME OF IGNITION		VECTOR B7 M/CS
// PORT: SOURCE P40-P47.agc:656
//#	DELVSAB		MAG. OF DELVSIN			DP B7 M/CS
// PORT: SOURCE P40-P47.agc:657
//#	RTIG		POSITION AT TIME OF IGNITION	VECTOR B29 M
// PORT: SOURCE P40-P47.agc:658
//#	VTIG		VELOCITY AT TIME OF IGNITION	VECTOR B7 M/CS.
// PORT: SOURCE P40-P47.agc:659
//#   IF AIMPT STEER:
// PORT: SOURCE P40-P47.agc:660
//#	TIG		TIME OF IGNITION		DP B28 CS
// PORT: SOURCE P40-P47.agc:661
//#	RTARG		POSITION TARGET TIME		VECTOR B29 M
// PORT: SOURCE P40-P47.agc:662
//#	CSTEER		C FOR STEER LAW			DP B2
// PORT: SOURCE P40-P47.agc:663
//#	DLTARG		TARGET TIME-IGNITION TIME	DP B28 CS
// PORT: SOURCE P40-P47.agc:664
//#
// PORT: SOURCE P40-P47.agc:665
//# OUTPUT
// PORT: SOURCE P40-P47.agc:666
//#	UT		DESIRED THRUST DIRECTION	VECT. B2 M/(CS.CS)
// PORT: SOURCE P40-P47.agc:667
//#	VGTIG		INITIAL VALUE OF VELOCITY
// PORT: SOURCE P40-P47.agc:668
//#			TO BE GAINED (INERT. COORD.)	VECTOR B7 M/CS
// PORT: SOURCE P40-P47.agc:669
//#	DELVLVC		VGTIG IN LOC. VERT. COORDS.	B7 M/CS
// PORT: SOURCE P40-P47.agc:670
//#	BDT		V REQUIRED AT TIG -V REQUIRED AT (TIG-2SEC)
// PORT: SOURCE P40-P47.agc:671
//#	   -GDT		FOR S40.13			VECT B7 M/CS
// PORT: SOURCE P40-P47.agc:672
//#	RTIG		CALC IN S40.1B (AIMPT) FOR S40.2,3	VECTOR B27M
// PORT: SOURCE P40-P47.agc:673
//#			POSITION AT TIME OF IGNITION
// PORT: SOURCE P40-P47.agc:674
//#
// PORT: SOURCE P40-P47.agc:675
//# DEBRIS	QTEMP1
// PORT: SOURCE P40-P47.agc:676
//#		MPAC, QPRET
// PORT: SOURCE P40-P47.agc:677
//#		PUSHLIST
// PORT: SOURCE P40-P47.agc:678
//
// PORT: SOURCE P40-P47.agc:679
//		BANK	14
// PORT: SOURCE P40-P47.agc:680
//		SETLOC	P40S1
// PORT: SOURCE P40-P47.agc:681
//		BANK
// PORT: SOURCE P40-P47.agc:682
//# Page 765
// PORT: SOURCE P40-P47.agc:683
//		COUNT*	$$/S40.1
// PORT: SOURCE P40-P47.agc:684
//S40.1		STQ	DLOAD
// PORT: Fixed ROM slots 25766.
    25766, 58656,
// PORT: SOURCE P40-P47.agc:685
//			QTEMP
// PORT: Fixed ROM slots 25767.
    25767, 3892,
// PORT: SOURCE P40-P47.agc:686
//			TIG
// PORT: Fixed ROM slots 25768.
    25768, 3652,
// PORT: SOURCE P40-P47.agc:687
//		STORE	TIGSAVE
// PORT: Fixed ROM slots 25769.
    25769, 4070,
// PORT: SOURCE P40-P47.agc:688
//DELVTEST	BOFF
// PORT: Fixed ROM slots 25770.
    25770, 65304,
// PORT: SOURCE P40-P47.agc:689
//			XDELVFLG
// PORT: Fixed ROM slots 25771.
    25771, 1486,
// PORT: SOURCE P40-P47.agc:690
//			S40.1B
// PORT: Fixed ROM slots 25772.
    25772, 47548,
// PORT: SOURCE P40-P47.agc:691
//CALCTHET	SETPD	VLOAD
// PORT: Fixed ROM slots 25773.
    25773, 64770,
// PORT: SOURCE P40-P47.agc:692
//			0
// PORT: Fixed ROM slots 25774.
    25774, 2,
// PORT: SOURCE P40-P47.agc:693
//			VTIG
// PORT: Fixed ROM slots 25775.
    25775, 3920,
// PORT: SOURCE P40-P47.agc:694
//		STORE	VINIT
// PORT: Fixed ROM slots 25776.
    25776, 2482,
// PORT: SOURCE P40-P47.agc:695
//		VXV	UNIT
// PORT: Fixed ROM slots 25777.
    25777, 44602,
// PORT: SOURCE P40-P47.agc:696
//			RTIG
// PORT: Fixed ROM slots 25778.
    25778, 3908,
// PORT: SOURCE P40-P47.agc:697
//		STOVL	UT		# UP IN UT
// PORT: Fixed ROM slots 25779.
    25779, 24438,
// PORT: SOURCE P40-P47.agc:698
//			RTIG
// PORT: Fixed ROM slots 25780.
    25780, 3908,
// PORT: SOURCE P40-P47.agc:699
//		STORE	RINIT
// PORT: Fixed ROM slots 25781.
    25781, 2470,
// PORT: SOURCE P40-P47.agc:700
//		VSQ	PDDL
// PORT: Fixed ROM slots 25782.
    25782, 54588,
// PORT: SOURCE P40-P47.agc:701
//			36D
// PORT: Fixed ROM slots 25783.
    25783, 74,
// PORT: SOURCE P40-P47.agc:702
//		DMP	DDV
// PORT: Fixed ROM slots 25784.
    25784, 47370,
// PORT: SOURCE P40-P47.agc:703
//			THETACON
// PORT: Fixed ROM slots 25785.
    25785, 14868,
// PORT: SOURCE P40-P47.agc:704
//		DMP	DMP
// PORT: Fixed ROM slots 25786.
    25786, 34058,
// PORT: SOURCE P40-P47.agc:705
//			DELVSAB
// PORT: Fixed ROM slots 25787.
    25787, 3944,
// PORT: SOURCE P40-P47.agc:706
//			WEIGHT/G
// PORT: Fixed ROM slots 25788.
    25788, 1354,
// PORT: SOURCE P40-P47.agc:707
//		DDV
// PORT: Fixed ROM slots 25789.
    25789, 65394,
// PORT: SOURCE P40-P47.agc:708
//			F
// PORT: Fixed ROM slots 25790.
    25790, 4026,
// PORT: SOURCE P40-P47.agc:709
//		STOVL	14D
// PORT: Fixed ROM slots 25791.
    25791, 20510,
// PORT: SOURCE P40-P47.agc:710
//			DELVSIN
// PORT: Fixed ROM slots 25792.
    25792, 3932,
// PORT: SOURCE P40-P47.agc:711
//
// PORT: SOURCE P40-P47.agc:712
//		DOT	VXSC
// PORT: Fixed ROM slots 25793.
    25793, 61762,
// PORT: SOURCE P40-P47.agc:713
//			UT
// PORT: Fixed ROM slots 25794.
    25794, 3958,
// PORT: SOURCE P40-P47.agc:714
//			UT
// PORT: Fixed ROM slots 25795.
    25795, 3958,
// PORT: SOURCE P40-P47.agc:715
//		VSL2	PUSH		# (DELTAV.UP)UP SCALED AT 2(+7) P.D.L. 0
// PORT: Fixed ROM slots 25796.
    25796, 34516,
// PORT: SOURCE P40-P47.agc:716
//		BVSU	PDDL		# DELTA VP SCALED AT 2(+7) P.D.L. 6
// PORT: Fixed ROM slots 25797.
    25797, 54602,
// PORT: SOURCE P40-P47.agc:717
//			DELVSIN
// PORT: Fixed ROM slots 25798.
    25798, 3932,
// PORT: SOURCE P40-P47.agc:718
//			14D
// PORT: Fixed ROM slots 25799.
    25799, 30,
// PORT: SOURCE P40-P47.agc:719
//		SIN	PDVL
// PORT: Fixed ROM slots 25800.
    25800, 52700,
// PORT: SOURCE P40-P47.agc:720
//			6D
// PORT: Fixed ROM slots 25801.
    25801, 14,
// PORT: SOURCE P40-P47.agc:721
//		VXV	UNIT
// PORT: Fixed ROM slots 25802.
    25802, 44602,
// PORT: SOURCE P40-P47.agc:722
//			UT
// PORT: Fixed ROM slots 25803.
    25803, 3958,
// PORT: SOURCE P40-P47.agc:723
//		VXSC	STADR
// PORT: Fixed ROM slots 25804.
    25804, 38626,
// PORT: SOURCE P40-P47.agc:724
//		STOVL	VGTIG		# UNIT(VP X UP)SIN(THETAT/2) IN VGTIG.
// PORT: Fixed ROM slots 25805.
    25805, 41084,
// PORT: SOURCE P40-P47.agc:725
//		UNIT	PDDL		# UNIT(DELTA VP) IN P.D.L. 6
// PORT: Fixed ROM slots 25806.
    25806, 54620,
// PORT: SOURCE P40-P47.agc:726
//			14D
// PORT: Fixed ROM slots 25807.
    25807, 30,
// PORT: SOURCE P40-P47.agc:727
//		COS	VXSC
// PORT: Fixed ROM slots 25808.
    25808, 61900
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:728
//		VAD	VXSC
// PORT: Fixed ROM slots 25809.
    25809, 61786,
// PORT: SOURCE P40-P47.agc:729
//			VGTIG
// PORT: Fixed ROM slots 25810.
    25810, 3970,
// PORT: SOURCE P40-P47.agc:730
//			36D
// PORT: Fixed ROM slots 25811.
    25811, 74,
// PORT: SOURCE P40-P47.agc:731
//		VSL2 	VAD
// PORT: Fixed ROM slots 25812.
    25812, 44500,
// PORT: SOURCE P40-P47.agc:732
//		STADR
// PORT: Fixed ROM slots 25813.
    25813, 65324,
// PORT: SOURCE P40-P47.agc:733
//# Page 766
// PORT: SOURCE P40-P47.agc:734
//		STORE	VGTIG		# VG IGNITION SCALED AT 2(+7) M/CS
// PORT: Fixed ROM slots 25814.
    25814, 61564,
// PORT: SOURCE P40-P47.agc:735
//
// PORT: SOURCE P40-P47.agc:736
//		UNIT
// PORT: Fixed ROM slots 25815.
    25815, 65372,
// PORT: SOURCE P40-P47.agc:737
//		STOVL	UT		# THRUST DIRECTION SCALED AT 2(+1)
// PORT: Fixed ROM slots 25816.
    25816, 24438,
// PORT: SOURCE P40-P47.agc:738
//			VGTIG
// PORT: Fixed ROM slots 25817.
    25817, 3970,
// PORT: SOURCE P40-P47.agc:739
//		PUSH	CALL
// PORT: Fixed ROM slots 25818.
    25818, 37900,
// PORT: SOURCE P40-P47.agc:740
//			GET.LVC		# VGTIG IN LV COOR AT 2(+7) M/CS IN DELVLVC
// PORT: Fixed ROM slots 25819.
    25819, 14262,
// PORT: SOURCE P40-P47.agc:741
//		GOTO
// PORT: Fixed ROM slots 25820.
    25820, 65360,
// PORT: SOURCE P40-P47.agc:742
//			QTEMP
// PORT: Fixed ROM slots 25821.
    25821, 3892,
// PORT: SOURCE P40-P47.agc:743
//S40.1B		DLOAD
// PORT: Fixed ROM slots 25822.
    25822, 65482,
// PORT: SOURCE P40-P47.agc:744
//			TIG
// PORT: Fixed ROM slots 25823.
    25823, 3652,
// PORT: SOURCE P40-P47.agc:745
//		STORE	TDEC1
// PORT: Fixed ROM slots 25824.
    25824, 66,
// PORT: SOURCE P40-P47.agc:746
//		BDSU
// PORT: Fixed ROM slots 25825.
    25825, 65314,
// PORT: SOURCE P40-P47.agc:747
//			TPASS4
// PORT: Fixed ROM slots 25826.
    25826, 3890,
// PORT: SOURCE P40-P47.agc:748
//		STCALL	DELLT4		# INTERCEPT TIME -- TIG.
// PORT: Fixed ROM slots 25827.
    25827, 32340,
// PORT: SOURCE P40-P47.agc:749
//			LEMPREC
// PORT: Fixed ROM slots 25828.
    25828, 23646,
// PORT: SOURCE P40-P47.agc:750
//		VLOAD	SETPD		# LOAD STATE VECTOR AT TIG FOR INITVEL.
// PORT: Fixed ROM slots 25829.
    25829, 33274,
// PORT: SOURCE P40-P47.agc:751
//			RATT
// PORT: Fixed ROM slots 25830.
    25830, 2,
// PORT: SOURCE P40-P47.agc:752
//			0
// PORT: Fixed ROM slots 25831.
    25831, 2,
// PORT: SOURCE P40-P47.agc:753
//		STORE	RTIG
// PORT: Fixed ROM slots 25832.
    25832, 3908,
// PORT: SOURCE P40-P47.agc:754
//		STORE	RINIT
// PORT: Fixed ROM slots 25833.
    25833, 2470,
// PORT: SOURCE P40-P47.agc:755
//		UNIT
// PORT: Fixed ROM slots 25834.
    25834, 65372,
// PORT: SOURCE P40-P47.agc:756
//		STOVL	UNIT/R/
// PORT: Fixed ROM slots 25835.
    25835, 24254,
// PORT: SOURCE P40-P47.agc:757
//			VATT
// PORT: Fixed ROM slots 25836.
    25836, 14,
// PORT: SOURCE P40-P47.agc:758
//		STORE	VTIG
// PORT: Fixed ROM slots 25837.
    25837, 3920,
// PORT: SOURCE P40-P47.agc:759
//		STORE	VINIT
// PORT: Fixed ROM slots 25838.
    25838, 2482,
// PORT: SOURCE P40-P47.agc:760
//		DLOAD	PDDL		# NUMIT = 0
// PORT: Fixed ROM slots 25839.
    25839, 54730,
// PORT: SOURCE P40-P47.agc:761
//			ZEROVECS
// PORT: Fixed ROM slots 25840.
    25840, 6820,
// PORT: SOURCE P40-P47.agc:762
//			EPS1
// PORT: Fixed ROM slots 25841.
    25841, 14860,
// PORT: SOURCE P40-P47.agc:763
//		BOFF	DAD
// PORT: Fixed ROM slots 25842.
    25842, 36120,
// PORT: SOURCE P40-P47.agc:764
//			NORMSW
// PORT: Fixed ROM slots 25843.
    25843, 4042,
// PORT: SOURCE P40-P47.agc:765
//			SMALLEPS
// PORT: Fixed ROM slots 25844.
    25844, 47596,
// PORT: SOURCE P40-P47.agc:766
//			EPS2		# EPSILON4 = 10 DEGREES OR 45 DEGREES.
// PORT: Fixed ROM slots 25845.
    25845, 14864,
// PORT: SOURCE P40-P47.agc:767
//SMALLEPS	PUSH	SXA,1
// PORT: Fixed ROM slots 25846.
    25846, 55308,
// PORT: SOURCE P40-P47.agc:768
//			RTX1
// PORT: Fixed ROM slots 25847.
    25847, 3068,
// PORT: SOURCE P40-P47.agc:769
//		SXA,2	CALL
// PORT: Fixed ROM slots 25848.
    25848, 38072,
// PORT: SOURCE P40-P47.agc:770
//			RTX2
// PORT: Fixed ROM slots 25849.
    25849, 3070,
// PORT: SOURCE P40-P47.agc:771
//			INITVEL
// PORT: Fixed ROM slots 25850.
    25850, 18432,
// PORT: SOURCE P40-P47.agc:772
//		VLOAD	PUSH
// PORT: Fixed ROM slots 25851.
    25851, 34554,
// PORT: SOURCE P40-P47.agc:773
//			DELVEET3	# VGTIG = VR - VN.
// PORT: Fixed ROM slots 25852.
    25852, 2540,
// PORT: SOURCE P40-P47.agc:774
//		STORE	VGTIG
// PORT: Fixed ROM slots 25853.
    25853, 3970,
// PORT: SOURCE P40-P47.agc:775
//		UNIT			# UT = UNIT (VGTIG)
// PORT: Fixed ROM slots 25854.
    25854, 65372,
// PORT: SOURCE P40-P47.agc:776
//		STODL	UT
// PORT: Fixed ROM slots 25855.
    25855, 16246,
// PORT: SOURCE P40-P47.agc:777
//			36D
// PORT: Fixed ROM slots 25856.
    25856, 74,
// PORT: SOURCE P40-P47.agc:778
//		STCALL	VGDISP		# CONVERT VGTIG (IN PUSHLIST) TO LOCAL
// PORT: Fixed ROM slots 25857.
    25857, 32616,
// PORT: SOURCE P40-P47.agc:779
//			GET.LVC		# VERTICAL COORDINATES.
// PORT: Fixed ROM slots 25858.
    25858, 14262,
// PORT: SOURCE P40-P47.agc:780
//		GOTO
// PORT: Fixed ROM slots 25859.
    25859, 65360,
// PORT: SOURCE P40-P47.agc:781
//			QTEMP
// PORT: Fixed ROM slots 25860.
    25860, 3892,
// PORT: SOURCE P40-P47.agc:782
//
// PORT: SOURCE P40-P47.agc:783
//EPS1		2DEC*	2.777777778 E-2*	# 10 DEGREES AT 1 REVOLUTION
// PORT: Fixed ROM slots 25861 25862.
    25861, 910, 25862, 3640,
// PORT: SOURCE P40-P47.agc:784
//
// PORT: SOURCE P40-P47.agc:785
//# Page 767
// PORT: SOURCE P40-P47.agc:786
//EPS2		2DEC*	9.722222222 E-2*	# 35 DEGREES AT 1 REVOLUTION.
// PORT: Fixed ROM slots 25863 25864.
    25863, 3184, 25864, 29128,
// PORT: SOURCE P40-P47.agc:787
//
// PORT: SOURCE P40-P47.agc:788
//THETACON	2DEC	.31830989 B-8
// PORT: Fixed ROM slots 25865 25866.
    25865, 40, 25866, 12184,
// PORT: SOURCE P40-P47.agc:789
//
// PORT: SOURCE P40-P47.agc:790
//# Page 768
// PORT: SOURCE P40-P47.agc:791
//# SUBROUTINE NAME:  S40.2,3		MOD. NO. 3, DATE APRIL 4, 1967
// PORT: SOURCE P40-P47.agc:792
//# MODIFICATION BY:  JONATHON D. ADDELSTON (ADAMS ASSOCIATES)
// PORT: SOURCE P40-P47.agc:793
//# MOD. NO. 4:  JULY 18, 1967: PETER ADLER (MIT/IL)
// PORT: SOURCE P40-P47.agc:794
//# MOD. NO. 5:  OCTOBER 18, 1967:  PETER ADLER (MIT/IL)
// PORT: SOURCE P40-P47.agc:795
//# ORIGINALLY BY:  SAYDEAN ZELDIN (MIT INSTRUMENTATION LAB) AND RICHARD TALAYCO (SYSTEM DELVELOPMENT CORP)
// PORT: SOURCE P40-P47.agc:796
//#
// PORT: SOURCE P40-P47.agc:797
//# S40.2,3 COMPUTES "POINTVSM" WHICH IS THE HALF-UNIT DESIRED THRUST VECTOR IN STABLE-MEMBER COORDINATES FROM "UT"
// PORT: SOURCE P40-P47.agc:798
//# WHICH IS THE SAME VECTOR IN REFERENCE COORDINATES.  IT DETERMINES THE CORRECT VALUES FOR "SCAXIS" USING THE +X
// PORT: SOURCE P40-P47.agc:799
//# AXIS FOR DPS, APS, AND RCS BURNS.  THE "WINGS-LEVEL HEADS-UP" LM ORIENTATION IS THEN COMPUTED IN REFERENCE
// PORT: SOURCE P40-P47.agc:800
//# COORDINATES.  THESE VECTORS ALSO DEFINE THE "PREFERRED IMU ORIENTATION".  UPON COMPLETION OF THIS CALCULATION,
// PORT: SOURCE P40-P47.agc:801
//# THE "PREFERRED ATTITUDE COMPUTED" FLAG IS SET (PFRATFLG).
// PORT: SOURCE P40-P47.agc:802
//#
// PORT: SOURCE P40-P47.agc:803
//# CALLING SEQUENCE:
// PORT: SOURCE P40-P47.agc:804
//#	L	CALL			# INTERPRETIVE CALL.
// PORT: SOURCE P40-P47.agc:805
//#	L +1		S40.2,3
// PORT: SOURCE P40-P47.agc:806
//#	L +2	(RETURN)		# GIMBAL ANGLE VECTOR IN MPAC.
// PORT: SOURCE P40-P47.agc:807
//#
// PORT: SOURCE P40-P47.agc:808
//# SUBROUTINES CALLED:  NONE.
// PORT: SOURCE P40-P47.agc:809
//#
// PORT: SOURCE P40-P47.agc:810
//# NORMAL RETURN:  L +2 (SEE CALLING SEQUENCE ABOVE).
// PORT: SOURCE P40-P47.agc:811
//#
// PORT: SOURCE P40-P47.agc:812
//# ALARM/ABORT MODES:  NONE.
// PORT: SOURCE P40-P47.agc:813
//#
// PORT: SOURCE P40-P47.agc:814
//# INPUT:
// PORT: SOURCE P40-P47.agc:815
//#	1.	REFSMMAT	MATRIX FROM REFERENCE TO STABLE-MEMBER COORDINATES SCALED AT 2.
// PORT: SOURCE P40-P47.agc:816
//#	2.	UT		HALF-UNIT DESIRED THRUST DIRECTION.
// PORT: SOURCE P40-P47.agc:817
//#	3.	RTIG		POSITION AT TIG IN REFERENCE COORDINATES.
// PORT: SOURCE P40-P47.agc:818
//#
// PORT: SOURCE P40-P47.agc:819
//# OUTPUT:
// PORT: SOURCE P40-P47.agc:820
//#	1.	`XSCREF'	WINGS-LEVEL HEADS-UP LM ORIENTATION
// PORT: SOURCE P40-P47.agc:821
//#		`YSCREF'	IN REFERENCE COORDINATES
// PORT: SOURCE P40-P47.agc:822
//#		`ZSCREF'	(PREFERRED IMU ORIENTATION).
// PORT: SOURCE P40-P47.agc:823
//#	2.	POINTVSM	DESIRED THRUST DIRECTION IN STABLE-MEMBER COORDINATES.
// PORT: SOURCE P40-P47.agc:824
//#	3.	SCAXIS		HALF-UNIT OF AXIS TO ALIGN IN STABLE-MEMBER COORDINATES.
// PORT: SOURCE P40-P47.agc:825
//#	4.	PFRATFLG	INTERPRETIVE FLAG.  ON: PREFERRED ORIENTATION COMPUTED; OFF: NOT COMPUTED.
// PORT: SOURCE P40-P47.agc:826
//#
// PORT: SOURCE P40-P47.agc:827
//# DEBRIS:  NONE
// PORT: SOURCE P40-P47.agc:828
//# Page 769
// PORT: SOURCE P40-P47.agc:829
//
// PORT: SOURCE P40-P47.agc:830
//		COUNT*	$$/S40.2
// PORT: SOURCE P40-P47.agc:831
//S40.2,3		VLOAD			# UT:  DESIRED THRUST DIRECTION (HALF-UNIT)
// PORT: Fixed ROM slots 25867.
    25867, 65530,
// PORT: SOURCE P40-P47.agc:832
//			UT		# (PUT INTO TOP OF PUSH-DOWN-LIST.)
// PORT: Fixed ROM slots 25868.
    25868, 3958,
// PORT: SOURCE P40-P47.agc:833
//		MXV	VSL1		# TRANSFORM THRUST DIRECTION TO STABLE-
// PORT: Fixed ROM slots 25869.
    25869, 64162,
// PORT: SOURCE P40-P47.agc:834
//			REFSMMAT	# MEMBER FROM REFERENCE COORDS (RESCALE).
// PORT: Fixed ROM slots 25870.
    25870, 1976,
// PORT: SOURCE P40-P47.agc:835
//		STOVL	POINTVSM	# SAVE FOR "VECPOINT" ROUTINE (LEMMANU).
// PORT: Fixed ROM slots 25871.
    25871, 24566,
// PORT: SOURCE P40-P47.agc:836
//			UNITX		# SCAXIS SET TO +X, FOR P40 AND P42 AND
// PORT: Fixed ROM slots 25872.
    25872, 6816,
// PORT: SOURCE P40-P47.agc:837
//		STOVL	SCAXIS		# FOR P41 IF RCS NOT -X,+Y,-Y,+Z,-Z.
// PORT: Fixed ROM slots 25873.
    25873, 24554,
// PORT: SOURCE P40-P47.agc:838
//
// PORT: SOURCE P40-P47.agc:839
//			UT		# ASSUME +X BURN ALWAYS, EVEN FOR RCS.
// PORT: Fixed ROM slots 25874.
    25874, 3958,
// PORT: SOURCE P40-P47.agc:840
//PLUSX		STORE	XSCREF		# XSCREF = UT (DESIRED THRUST DIRECTION)
// PORT: Fixed ROM slots 25875.
    25875, 3854,
// PORT: SOURCE P40-P47.agc:841
//		VXV	UNIT		# RTIG = POSITION AT TIME-OF-IGNITION.
// PORT: Fixed ROM slots 25876.
    25876, 44602,
// PORT: SOURCE P40-P47.agc:842
//			RTIG		# YSCREF = UNIT(UT X RTIG)
// PORT: Fixed ROM slots 25877.
    25877, 3908,
// PORT: SOURCE P40-P47.agc:843
//		PDDL	BHIZ
// PORT: Fixed ROM slots 25878.
    25878, 39082,
// PORT: SOURCE P40-P47.agc:844
//			36D		# TEST MAGNITUDE OF UT X RTIG
// PORT: Fixed ROM slots 25879.
    25879, 74,
// PORT: SOURCE P40-P47.agc:845
//			FIXY		# IF SMALL, USE UT X VTIG AS YSC
// PORT: Fixed ROM slots 25880.
    25880, 47682,
// PORT: SOURCE P40-P47.agc:846
//STORY		VLOAD	STADR
// PORT: Fixed ROM slots 25881.
    25881, 38650,
// PORT: SOURCE P40-P47.agc:847
//		STORE	YSCREF
// PORT: Fixed ROM slots 25882.
    25882, 61668,
// PORT: SOURCE P40-P47.agc:848
//		VXV	VSL1		# COMPUTE (YSCREF X XCREF), BUT FOR A
// PORT: Fixed ROM slots 25883.
    25883, 64058,
// PORT: SOURCE P40-P47.agc:849
//			XSCREF		# RIGHT HANDED SYSTEM, NEED (X CROSS Y).
// PORT: Fixed ROM slots 25884.
    25884, 3854,
// PORT: SOURCE P40-P47.agc:850
//		VCOMP			# ZSCREF = - (YSCREF X XSCREF)
// PORT: Fixed ROM slots 25885.
    25885, 65404,
// PORT: SOURCE P40-P47.agc:851
//		STORE	ZSCREF		#        = + (XSCREF X YSCREF)
// PORT: Fixed ROM slots 25886.
    25886, 3878,
// PORT: SOURCE P40-P47.agc:852
//
// PORT: SOURCE P40-P47.agc:853
//		SET	RVQ
// PORT: Fixed ROM slots 25887.
    25887, 36376,
// PORT: SOURCE P40-P47.agc:854
//			PFRATFLG
// PORT: Fixed ROM slots 25888.
    25888, 1142,
// PORT: SOURCE P40-P47.agc:855
//FIXY		VLOAD	VXV		# IN THIS CASE,
// PORT: Fixed ROM slots 25889.
    25889, 40442
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:856
//			XSCREF		# YSCREF = UNIT(XSCREF X VTIG)
// PORT: Fixed ROM slots 25890.
    25890, 3854,
// PORT: SOURCE P40-P47.agc:857
//			VTIG
// PORT: Fixed ROM slots 25891.
    25891, 3920,
// PORT: SOURCE P40-P47.agc:858
//		UNIT	PUSH
// PORT: Fixed ROM slots 25892.
    25892, 34396,
// PORT: SOURCE P40-P47.agc:859
//		GOTO
// PORT: Fixed ROM slots 25893.
    25893, 65360,
// PORT: SOURCE P40-P47.agc:860
//			STORY
// PORT: Fixed ROM slots 25894.
    25894, 47666,
// PORT: SOURCE P40-P47.agc:861
//# Page 770
// PORT: SOURCE P40-P47.agc:862
//# SUBROUTINE S40.8
// PORT: SOURCE P40-P47.agc:863
//# MODIFIED APRIL 3, 1968 BY PETER ADLER, MIT/IL
// PORT: SOURCE P40-P47.agc:864
//#
// PORT: SOURCE P40-P47.agc:865
//# DESCRIPTION
// PORT: SOURCE P40-P47.agc:866
//#	S40.8 UPDATES THE VELOCITY-TO-BE-GAINED VECTOR, VG, (AND FOR LAMBERT TARGETTED BURNS ALSO EXTRAPOLATES VG
// PORT: SOURCE P40-P47.agc:867
//#	USING THE BDT VECTOR) COMPUTES THE TIME FOR ISSUING THE ENGINE OFF COMMAND, TGO, AND CALLS THE ROUTINE
// PORT: SOURCE P40-P47.agc:868
//#	"FINDCDUW", WHICH GENERATES STEERING COMMANDS FOR THE DAP.
// PORT: SOURCE P40-P47.agc:869
//#
// PORT: SOURCE P40-P47.agc:870
//# CALLING SEQUENCE
// PORT: SOURCE P40-P47.agc:871
//#	L-1	CALL
// PORT: SOURCE P40-P47.agc:872
//#	L		S40.8
// PORT: SOURCE P40-P47.agc:873
//#	L+1			INTERPRETIVE RETURN
// PORT: SOURCE P40-P47.agc:874
//#
// PORT: SOURCE P40-P47.agc:875
//# ALARM
// PORT: SOURCE P40-P47.agc:876
//#	IF VG . DELVREF IS NEGATIVE (VG AND DELVREF OVER 90 DEGREES APART), BYPASS TGO AND STEERING COMPUTATIONS
// PORT: SOURCE P40-P47.agc:877
//#	AND SET ALARM 1407.  RETURN TO CALLER NORMALLY.
// PORT: SOURCE P40-P47.agc:878
//#
// PORT: SOURCE P40-P47.agc:879
//# INPUT AND INITIALIZATION
// PORT: SOURCE P40-P47.agc:880
//#	VGPREV		REFERENCE	2(7) M/CS
// PORT: SOURCE P40-P47.agc:881
//#	DELVREF		REFERENCE	2(7) M/CS
// PORT: SOURCE P40-P47.agc:882
//#	BDT		REFERENCE	2(7) M/CS
// PORT: SOURCE P40-P47.agc:883
//#	TDECAY		TAIL-OFF TIME	2(28) CS
// PORT: SOURCE P40-P47.agc:884
//#	XDELVFLG	1 = EXTERNAL DELTA-V; 0 = LAMBERT (AIMPOINT)
// PORT: SOURCE P40-P47.agc:885
//#	STEERSW		1 = DO STEERING AND TGO COMPUTATIONS; 0 = VG UPDATE ONLY
// PORT: SOURCE P40-P47.agc:886
//#	FIRSTFLG	1 = GONE TO LAMBERT AT LEAST ONCE; 0 = HAVEN'T GONE TO LAMBERT YET.
// PORT: SOURCE P40-P47.agc:887
//#
// PORT: SOURCE P40-P47.agc:888
//# NOTE:  VGTIG EQUALS VGPREV
// PORT: SOURCE P40-P47.agc:889
//#
// PORT: SOURCE P40-P47.agc:890
//# OUTPUT
// PORT: SOURCE P40-P47.agc:891
//#	STEERSW		SEE INPUT
// PORT: SOURCE P40-P47.agc:892
//#	INPULSW		1 = ENGINE OFF IN TGO CENTISECONDS; 0 = CONTINUE BURN
// PORT: SOURCE P40-P47.agc:893
//#	TGO		TIME TO CUT-OFF 2(28) CS
// PORT: SOURCE P40-P47.agc:894
//# 	SEE FINDCDUW FOR STEERING OUTPUTS.
// PORT: SOURCE P40-P47.agc:895
//#
// PORT: SOURCE P40-P47.agc:896
//# SUBROUTINE CALLED
// PORT: SOURCE P40-P47.agc:897
//#	FINDCDUW
// PORT: SOURCE P40-P47.agc:898
//#
// PORT: SOURCE P40-P47.agc:899
//# DEBRIS
// PORT: SOURCE P40-P47.agc:900
//#	MPACS, PUSHLIST
// PORT: SOURCE P40-P47.agc:901
//
// PORT: SOURCE P40-P47.agc:902
//		COUNT*	$$/S40.8
// PORT: SOURCE P40-P47.agc:903
//# Page 771
// PORT: SOURCE P40-P47.agc:904
//S40.8		BOF			# GENERATE VR IF NOT EXTERNAL DELTA-V BURN
// PORT: Fixed ROM slots 25895.
    25895, 65304,
// PORT: SOURCE P40-P47.agc:905
//			XDELVFLG
// PORT: Fixed ROM slots 25896.
    25896, 1486,
// PORT: SOURCE P40-P47.agc:906
//			RASTEER1
// PORT: Fixed ROM slots 25897.
    25897, 48050,
// PORT: SOURCE P40-P47.agc:907
//		VLOAD	VSU
// PORT: Fixed ROM slots 25898.
    25898, 43514,
// PORT: SOURCE P40-P47.agc:908
//			VGPREV
// PORT: Fixed ROM slots 25899.
    25899, 3970,
// PORT: SOURCE P40-P47.agc:909
//			DELVREF
// PORT: Fixed ROM slots 25900.
    25900, 3758,
// PORT: SOURCE P40-P47.agc:910
//VGAIN*		STORE	VG		# VELOCITY TO BE GAINED SCALED AT (7) M/CS
// PORT: Fixed ROM slots 25901.
    25901, 3982,
// PORT: SOURCE P40-P47.agc:911
//		MXV	VSL1
// PORT: Fixed ROM slots 25902.
    25902, 64162,
// PORT: SOURCE P40-P47.agc:912
//			REFSMMAT
// PORT: Fixed ROM slots 25903.
    25903, 1976,
// PORT: SOURCE P40-P47.agc:913
//		STORE	UNFC/2
// PORT: Fixed ROM slots 25904.
    25904, 3416,
// PORT: SOURCE P40-P47.agc:914
//BDTOK		VLOAD	ABVAL
// PORT: Fixed ROM slots 25905.
    25905, 42746,
// PORT: SOURCE P40-P47.agc:915
//			VG
// PORT: Fixed ROM slots 25906.
    25906, 3982,
// PORT: SOURCE P40-P47.agc:916
//		STORE	VGDISP
// PORT: Fixed ROM slots 25907.
    25907, 3944,
// PORT: SOURCE P40-P47.agc:917
//TGDCALC		SETPD	VLOAD
// PORT: Fixed ROM slots 25908.
    25908, 64770,
// PORT: SOURCE P40-P47.agc:918
//			0
// PORT: Fixed ROM slots 25909.
    25909, 2,
// PORT: SOURCE P40-P47.agc:919
//			VG
// PORT: Fixed ROM slots 25910.
    25910, 3982,
// PORT: SOURCE P40-P47.agc:920
//		STOVL	VGPREV
// PORT: Fixed ROM slots 25911.
    25911, 24450,
// PORT: SOURCE P40-P47.agc:921
//			DELVREF
// PORT: Fixed ROM slots 25912.
    25912, 3758,
// PORT: SOURCE P40-P47.agc:922
//		BOFF	VCOMP
// PORT: Fixed ROM slots 25913.
    25913, 48664,
// PORT: SOURCE P40-P47.agc:923
//			STEERSW
// PORT: Fixed ROM slots 25914.
    25914, 1480,
// PORT: SOURCE P40-P47.agc:924
//			QPRET
// PORT: Fixed ROM slots 25915.
    25915, 84,
// PORT: SOURCE P40-P47.agc:925
//		UNIT
// PORT: Fixed ROM slots 25916.
    25916, 65372,
// PORT: SOURCE P40-P47.agc:926
//		DOT	PUSH
// PORT: Fixed ROM slots 25917.
    25917, 34370,
// PORT: SOURCE P40-P47.agc:927
//			VG
// PORT: Fixed ROM slots 25918.
    25918, 3982,
// PORT: SOURCE P40-P47.agc:928
//		BPL	DDV
// PORT: Fixed ROM slots 25919.
    25919, 47432,
// PORT: SOURCE P40-P47.agc:929
//			ALARMIT		# DELV IS MORE THAN 90 DEGREES FROM VG.
// PORT: Fixed ROM slots 25920.
    25920, 47788,
// PORT: SOURCE P40-P47.agc:930
//			VEX
// PORT: Fixed ROM slots 25921.
    25921, 4038,
// PORT: SOURCE P40-P47.agc:931
//		DAD	DMP
// PORT: Fixed ROM slots 25922.
    25922, 34074,
// PORT: SOURCE P40-P47.agc:932
//			DPHALF
// PORT: Fixed ROM slots 25923.
    25923, 6816,
// PORT: SOURCE P40-P47.agc:933
//		SR	DDV
// PORT: Fixed ROM slots 25924.
    25924, 47458,
// PORT: SOURCE P40-P47.agc:934
//			10D
// PORT: Fixed ROM slots 25925.
    25925, 17174,
// PORT: SOURCE P40-P47.agc:935
//			36D
// PORT: Fixed ROM slots 25926.
    25926, 74,
// PORT: SOURCE P40-P47.agc:936
//		DMP	DAD
// PORT: Fixed ROM slots 25927.
    25927, 36106,
// PORT: SOURCE P40-P47.agc:937
//			-FOURDT
// PORT: Fixed ROM slots 25928.
    25928, 15034,
// PORT: SOURCE P40-P47.agc:938
//			TDECAY
// PORT: Fixed ROM slots 25929.
    25929, 4034,
// PORT: SOURCE P40-P47.agc:939
//		STORE	TGO
// PORT: Fixed ROM slots 25930.
    25930, 3742,
// PORT: SOURCE P40-P47.agc:940
//		DAD
// PORT: Fixed ROM slots 25931.
    25931, 65306,
// PORT: SOURCE P40-P47.agc:941
//			PIPTIME
// PORT: Fixed ROM slots 25932.
    25932, 1338,
// PORT: SOURCE P40-P47.agc:942
//		STODL	TIG
// PORT: Fixed ROM slots 25933.
    25933, 15940,
// PORT: SOURCE P40-P47.agc:943
//			TGO
// PORT: Fixed ROM slots 25934.
    25934, 3742,
// PORT: SOURCE P40-P47.agc:944
//		DSU	BPL
// PORT: Fixed ROM slots 25935.
    25935, 42026,
// PORT: SOURCE P40-P47.agc:945
//			FOURSECS	# 400 CS
// PORT: Fixed ROM slots 25936.
    25936, 15038,
// PORT: SOURCE P40-P47.agc:946
//			FINDCDUW -2
// PORT: Fixed ROM slots 25937.
    25937, 50322,
// PORT: SOURCE P40-P47.agc:947
//		SET	CLRGO
// PORT: Fixed ROM slots 25938.
    25938, 35864,
// PORT: SOURCE P40-P47.agc:948
//			IMPULSW
// PORT: Fixed ROM slots 25939.
    25939, 1132,
// PORT: SOURCE P40-P47.agc:949
//			STEERSW
// PORT: Fixed ROM slots 25940.
    25940, 1320,
// PORT: SOURCE P40-P47.agc:950
//			QPRET
// PORT: Fixed ROM slots 25941.
    25941, 84,
// PORT: SOURCE P40-P47.agc:951
//
// PORT: SOURCE P40-P47.agc:952
//ALARMIT		EXIT
// PORT: Fixed ROM slots 25942.
    25942, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25943–25943.
function agcAotUnit1664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:953
//
// PORT: SOURCE P40-P47.agc:954
//# Page 772
// PORT: SOURCE P40-P47.agc:955
//		TC	ALARM
// PORT: Fixed ROM slots 25943.
    if slot <> 25943 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1664] to agcAotUnit1664@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:956
//		OCT	01407
// PORT: Fixed ROM slots 25944.
    25944, 1550
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25945–25945.
function agcAotUnit1665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:957
//		TC	INTPRET
// PORT: Fixed ROM slots 25945.
    if slot <> 25945 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1665] to agcAotUnit1665@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:958
//		GOTO			# SKIP TGO COMPUTATION BUT CALL FINDCDUW.
// PORT: Fixed ROM slots 25946.
    25946, 65360,
// PORT: SOURCE P40-P47.agc:959
//			FINDCDUW -2	# FINDCDUW WILL EXIT TO UPDATEVG +3.
// PORT: Fixed ROM slots 25947.
    25947, 50322,
// PORT: SOURCE P40-P47.agc:960
//
// PORT: SOURCE P40-P47.agc:961
//-FOURDT		2DEC	-800 B-18	# -4 (200 CS.) B(-18)
// PORT: Fixed ROM slots 25948 25949.
    25948, 65434, 25949, 65534,
// PORT: SOURCE P40-P47.agc:962
//FOURSECS	2DEC	400		# 400 CS SCALED AT 2(+28) CS
// PORT: Fixed ROM slots 25950 25951.
    25950, 0, 25951, 800
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25952–25952.
function agcAotUnit1666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:963
//2VEXHUST	=	VEX
// PORT: SOURCE P40-P47.agc:964
//
// PORT: SOURCE P40-P47.agc:965
//# Page 773
// PORT: SOURCE P40-P47.agc:966
//# NAME:  		S40.13 -- TIMEBURN
// PORT: SOURCE P40-P47.agc:967
//#
// PORT: SOURCE P40-P47.agc:968
//# FUNCTION		(1) DETERMINE WHETHER A GIVEN COMBINATION OF VELOCITY TO
// PORT: SOURCE P40-P47.agc:969
//#			BE GAINED AND ENGINE CHOICE RESULT IN A BURN TIME
// PORT: SOURCE P40-P47.agc:970
//#			SUFFICIENT TO ALLOW STEERING AT THE VEHICLE DURING THE
// PORT: SOURCE P40-P47.agc:971
//#			BURN
// PORT: SOURCE P40-P47.agc:972
//#			(2) THE MAGNITUDE OF THE RESULTING BURN TIME -- IF IT
// PORT: SOURCE P40-P47.agc:973
//#			IS SHORT -- AND THE ASSOCIATED TIME OF THE ENGINE OFF
// PORT: SOURCE P40-P47.agc:974
//#			SIGNAL
// PORT: SOURCE P40-P47.agc:975
//#
// PORT: SOURCE P40-P47.agc:976
//# CALLING SEQUENCE	VIA FINDVAC AS A NEW JOB
// PORT: SOURCE P40-P47.agc:977
//#
// PORT: SOURCE P40-P47.agc:978
//# INPUT			VGTIG -- VELOCITY TO BE GAINED VECTOR (METERS/CS) AT +7
// PORT: SOURCE P40-P47.agc:979
//#			WEIGHT/G -- MASS OF VEHICLE IN KGM AT +16
// PORT: SOURCE P40-P47.agc:980
//#			F -- APS ENGINE THRUST IN M.NEWTONS AT +7
// PORT: SOURCE P40-P47.agc:981
//#				AND ALSO FOR RCS ENGINE
// PORT: SOURCE P40-P47.agc:982
//#			MDOT -- RATE OF DECREASE OF VEHICLE MASS DURING ENGINE
// PORT: SOURCE P40-P47.agc:983
//#				BURN IN KILOGRAMS/CS AT +3.  THIS SCALING MAY
// PORT: SOURCE P40-P47.agc:984
//#				REQUIRE MODIFICATION FOR SATURN BURNS.
// PORT: SOURCE P40-P47.agc:985
//#			ENG1FLAG -- SWITCH TO DECIDE WHETHER APS OR DPS ENGINE IS USED
// PORT: SOURCE P40-P47.agc:986
//#				=0	DPS
// PORT: SOURCE P40-P47.agc:987
//#				=1	APS
// PORT: SOURCE P40-P47.agc:988
//#
// PORT: SOURCE P40-P47.agc:989
//# OUTPUT		IMPULSW		ZERO FOR STEERING
// PORT: SOURCE P40-P47.agc:990
//#					ONE FOR ATTITUDE HOLD
// PORT: SOURCE P40-P47.agc:991
//#			NOTHROTL	ZERO FOR THROTTLING
// PORT: SOURCE P40-P47.agc:992
//#					ONE TO INHIBIT THROTTLING
// PORT: SOURCE P40-P47.agc:993
//#			TGO		TIME TO BURN IN CS
// PORT: SOURCE P40-P47.agc:994
//#
// PORT: SOURCE P40-P47.agc:995
//#			THE QUANTITY M.NEWTON = 10000 NEWTONS WILL BE USED TO EXPRESS
// PORT: SOURCE P40-P47.agc:996
//#			FORCE.
// PORT: SOURCE P40-P47.agc:997
//
// PORT: SOURCE P40-P47.agc:998
//		EBANK=	TGO
// PORT: SOURCE P40-P47.agc:999
//		COUNT*	$$/40.13
// PORT: SOURCE P40-P47.agc:1000
//S40.13		TC	INTPRET
// PORT: Fixed ROM slots 25952.
    if slot <> 25952 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1666] to agcAotUnit1666@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1001
//		SETPD	CLEAR
// PORT: Fixed ROM slots 25953.
    25953, 35842,
// PORT: SOURCE P40-P47.agc:1002
//			00D
// PORT: Fixed ROM slots 25954.
    25954, 2,
// PORT: SOURCE P40-P47.agc:1003
//			IMPULSW		# ASSUME NO STEERING UNTIL FOUND OTHERWISE
// PORT: Fixed ROM slots 25955.
    25955, 1388,
// PORT: SOURCE P40-P47.agc:1004
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 25956.
    25956, 42746,
// PORT: SOURCE P40-P47.agc:1005
//			VGTIG		# VELOCITY TO BE GAINED AT +7
// PORT: Fixed ROM slots 25957.
    25957, 3970,
// PORT: SOURCE P40-P47.agc:1006
//		PDDL	DMP		# 00D = MAG OF VGTIG AT +7
// PORT: Fixed ROM slots 25958.
    25958, 34218,
// PORT: SOURCE P40-P47.agc:1007
//			4SEC(17)	# CORRECT VG FOR 4 SECS OF 2 JET ULLAGE
// PORT: Fixed ROM slots 25959.
    25959, 17442,
// PORT: SOURCE P40-P47.agc:1008
//			FRCS2
// PORT: Fixed ROM slots 25960.
    25960, 28702,
// PORT: SOURCE P40-P47.agc:1009
//		DDV	SL1		# SCALE
// PORT: Fixed ROM slots 25961.
    25961, 60018,
// PORT: SOURCE P40-P47.agc:1010
//			WEIGHT/G
// PORT: Fixed ROM slots 25962.
    25962, 1354,
// PORT: SOURCE P40-P47.agc:1011
//		BDSU	PUSH
// PORT: Fixed ROM slots 25963.
    25963, 34338,
// PORT: SOURCE P40-P47.agc:1012
//		BOFF	SET
// PORT: Fixed ROM slots 25964.
    25964, 35864,
// PORT: SOURCE P40-P47.agc:1013
//			APSFLAG
// PORT: Fixed ROM slots 25965.
    25965, 5572,
// PORT: SOURCE P40-P47.agc:1014
//			S40.13D		# FOR DPS ENGINE
// PORT: Fixed ROM slots 25966.
    25966, 47916,
// PORT: SOURCE P40-P47.agc:1015
//			NOTHROTL
// PORT: Fixed ROM slots 25967.
    25967, 2662,
// PORT: SOURCE P40-P47.agc:1016
//		DLOAD	DDV		# 00D = MAG OF VGTIG CORRECTED
// PORT: Fixed ROM slots 25968.
    25968, 47562,
// PORT: SOURCE P40-P47.agc:1017
//			K1VAL		# M.NEWTONS-CS AT +24
// PORT: Fixed ROM slots 25969.
    25969, 14338,
// PORT: SOURCE P40-P47.agc:1018
//			WEIGHT/G
// PORT: Fixed ROM slots 25970.
    25970, 1354,
// PORT: SOURCE P40-P47.agc:1019
//		BDSU	BMN
// PORT: Fixed ROM slots 25971.
    25971, 40994,
// PORT: SOURCE P40-P47.agc:1020
//# Page 774
// PORT: SOURCE P40-P47.agc:1021
//			00D
// PORT: Fixed ROM slots 25972.
    25972, 2,
// PORT: SOURCE P40-P47.agc:1022
//			S40.131		# TGO LESS THAN 100 CS
// PORT: Fixed ROM slots 25973.
    25973, 47888,
// PORT: SOURCE P40-P47.agc:1023
//		PDDL	DMP		# 02D = TEMP1 AT +7
// PORT: Fixed ROM slots 25974.
    25974, 34218,
// PORT: SOURCE P40-P47.agc:1024
//			MDOT
// PORT: Fixed ROM slots 25975.
    25975, 4030,
// PORT: SOURCE P40-P47.agc:1025
//
// PORT: SOURCE P40-P47.agc:1026
//# MDOT REPRESENTS THE RATE OF DECREASE OF VEHICLE MASS DURING ENGINE
// PORT: SOURCE P40-P47.agc:1027
//# BURN IN KILOGRAMS/CS.  WHEN SATURN IS USED, THE SCALING MAY
// PORT: SOURCE P40-P47.agc:1028
//# REQUIRE ADJUSTMENT.
// PORT: SOURCE P40-P47.agc:1029
//
// PORT: SOURCE P40-P47.agc:1030
//			3.5SEC		# 350 CS AT +14
// PORT: Fixed ROM slots 25976.
    25976, 15232,
// PORT: SOURCE P40-P47.agc:1031
//		BDSU	PDDL
// PORT: Fixed ROM slots 25977.
    25977, 54562,
// PORT: SOURCE P40-P47.agc:1032
//			WEIGHT/G
// PORT: Fixed ROM slots 25978.
    25978, 1354,
// PORT: SOURCE P40-P47.agc:1033
//			F
// PORT: Fixed ROM slots 25979.
    25979, 4026,
// PORT: SOURCE P40-P47.agc:1034
//		DMP	SR2		# SCALE
// PORT: Fixed ROM slots 25980.
    25980, 49674,
// PORT: SOURCE P40-P47.agc:1035
//			5SECS
// PORT: Fixed ROM slots 25981.
    25981, 15236,
// PORT: SOURCE P40-P47.agc:1036
//		DDV	PUSH		# 04D = TEMP2
// PORT: Fixed ROM slots 25982.
    25982, 34418,
// PORT: SOURCE P40-P47.agc:1037
//		BDSU	BPL
// PORT: Fixed ROM slots 25983.
    25983, 42018,
// PORT: SOURCE P40-P47.agc:1038
//			02D
// PORT: Fixed ROM slots 25984.
    25984, 6,
// PORT: SOURCE P40-P47.agc:1039
//			S40.13D
// PORT: Fixed ROM slots 25985.
    25985, 47916,
// PORT: SOURCE P40-P47.agc:1040
//		DLOAD	BDDV
// PORT: Fixed ROM slots 25986.
    25986, 46538,
// PORT: SOURCE P40-P47.agc:1041
//		DMP	DAD
// PORT: Fixed ROM slots 25987.
    25987, 36106,
// PORT: SOURCE P40-P47.agc:1042
//			5SECS
// PORT: Fixed ROM slots 25988.
    25988, 15236,
// PORT: SOURCE P40-P47.agc:1043
//			1SEC2D		# 100 CS AT +14
// PORT: Fixed ROM slots 25989.
    25989, 15228,
// PORT: SOURCE P40-P47.agc:1044
//		GOTO
// PORT: Fixed ROM slots 25990.
    25990, 65360,
// PORT: SOURCE P40-P47.agc:1045
//			S40.132
// PORT: Fixed ROM slots 25991.
    25991, 47900,
// PORT: SOURCE P40-P47.agc:1046
//S40.131		DLOAD	DMP
// PORT: Fixed ROM slots 25992.
    25992, 34250,
// PORT: SOURCE P40-P47.agc:1047
//			WEIGHT/G
// PORT: Fixed ROM slots 25993.
    25993, 1354,
// PORT: SOURCE P40-P47.agc:1048
//		SR1	PUSH
// PORT: Fixed ROM slots 25994.
    25994, 34500,
// PORT: SOURCE P40-P47.agc:1049
//		DAD	DDV
// PORT: Fixed ROM slots 25995.
    25995, 47386,
// PORT: SOURCE P40-P47.agc:1050
//			K2VAL		# M.NEWTON CS AT +24
// PORT: Fixed ROM slots 25996.
    25996, 14342,
// PORT: SOURCE P40-P47.agc:1051
//			K3VAL		# M.NEWTON CS AT +10
// PORT: Fixed ROM slots 25997.
    25997, 14346,
// PORT: SOURCE P40-P47.agc:1052
//S40.132		SET	EXIT
// PORT: Fixed ROM slots 25998.
    25998, 65048,
// PORT: SOURCE P40-P47.agc:1053
//			IMPULSW
// PORT: Fixed ROM slots 25999.
    25999, 1132
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26000–26005.
function agcAotUnit1667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26002 {
        if slot <= 26000 {
// PORT: SOURCE P40-P47.agc:1054
//S40.132*	TC	TPAGREE
// PORT: Fixed ROM slots 26000.
            if slot <> 26000 or instruction <> 3759 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3759, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26001 {
// PORT: SOURCE P40-P47.agc:1055
//		CA	MPAC
// PORT: Fixed ROM slots 26001.
                if slot <> 26001 or instruction <> 12396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1056
//		XCH	L
// PORT: Fixed ROM slots 26002.
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
// PORT: SOURCE P40-P47.agc:1057
//		CA	ZERO
// PORT: Fixed ROM slots 26003.
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
// PORT: SOURCE P40-P47.agc:1058
//		DXCH	TGO
// PORT: Fixed ROM slots 26004.
                if slot <> 26004 or instruction <> 22351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 847, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1059
//		TCF	S40.134
// PORT: Fixed ROM slots 26005.
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
// PORT: SOURCE P40-P47.agc:1060
//
// PORT: SOURCE P40-P47.agc:1061
//S40.13D		DLOAD	DMP		# FOR DPS ENGINE
// PORT: Fixed ROM slots 26006.
    26006, 34250,
// PORT: SOURCE P40-P47.agc:1062
//			00D
// PORT: Fixed ROM slots 26007.
    26007, 2,
// PORT: SOURCE P40-P47.agc:1063
//			WEIGHT/G
// PORT: Fixed ROM slots 26008.
    26008, 1354,
// PORT: SOURCE P40-P47.agc:1064
//		PUSH	BON
// PORT: Fixed ROM slots 26009.
    26009, 35852,
// PORT: SOURCE P40-P47.agc:1065
//			APSFLAG
// PORT: Fixed ROM slots 26010.
    26010, 5508,
// PORT: SOURCE P40-P47.agc:1066
//			APSTGO
// PORT: Fixed ROM slots 26011.
    26011, 47986,
// PORT: SOURCE P40-P47.agc:1067
//		DDV	CLEAR
// PORT: Fixed ROM slots 26012.
    26012, 35954,
// PORT: SOURCE P40-P47.agc:1068
//			S40.136
// PORT: Fixed ROM slots 26013.
    26013, 14350,
// PORT: SOURCE P40-P47.agc:1069
//			NOTHROTL
// PORT: Fixed ROM slots 26014.
    26014, 2918,
// PORT: SOURCE P40-P47.agc:1070
//		BOV	PUSH
// PORT: Fixed ROM slots 26015.
    26015, 34304,
// PORT: SOURCE P40-P47.agc:1071
//# Page 775
// PORT: SOURCE P40-P47.agc:1072
//			S40.130V
// PORT: Fixed ROM slots 26016.
    26016, 47958,
// PORT: SOURCE P40-P47.agc:1073
//S40.127		DSU	BPL
// PORT: Fixed ROM slots 26017.
    26017, 42026,
// PORT: SOURCE P40-P47.agc:1074
//			6SEC		# 600.0 CS AT +14
// PORT: Fixed ROM slots 26018.
    26018, 15240,
// PORT: SOURCE P40-P47.agc:1075
//			S40.138
// PORT: Fixed ROM slots 26019.
    26019, 47970,
// PORT: SOURCE P40-P47.agc:1076
//		DAD	GOTO
// PORT: Fixed ROM slots 26020.
    26020, 43034,
// PORT: SOURCE P40-P47.agc:1077
//			6SEC
// PORT: Fixed ROM slots 26021.
    26021, 15240,
// PORT: SOURCE P40-P47.agc:1078
//			S40.132
// PORT: Fixed ROM slots 26022.
    26022, 47900,
// PORT: SOURCE P40-P47.agc:1079
//S40.133		EXIT
// PORT: Fixed ROM slots 26023.
    26023, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26024–26024.
function agcAotUnit1668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1080
//S40.134		TC	PHASCHNG
// PORT: Fixed ROM slots 26024.
    if slot <> 26024 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1668] to agcAotUnit1668@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1081
//		OCT	00003
// PORT: Fixed ROM slots 26025.
    26025, 6
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26026–26026.
function agcAotUnit1669 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1082
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 26026.
    if slot <> 26026 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1669] to agcAotUnit1669@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1083
//S40.130V	DLOAD	SR4		# RECOMPUTED TGO IN TIMER UNITS
// PORT: Fixed ROM slots 26027.
    26027, 33482,
// PORT: SOURCE P40-P47.agc:1084
//		DDV
// PORT: Fixed ROM slots 26028.
    26028, 65394,
// PORT: SOURCE P40-P47.agc:1085
//			S40.136_	# S40.136 SHIFTED LEFT 10
// PORT: Fixed ROM slots 26029.
    26029, 14354,
// PORT: SOURCE P40-P47.agc:1086
//		STORE	TGO
// PORT: Fixed ROM slots 26030.
    26030, 3742,
// PORT: SOURCE P40-P47.agc:1087
//		EXIT
// PORT: Fixed ROM slots 26031.
    26031, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26032–26032.
function agcAotUnit1670 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1088
//		TCF	S40.134		# REJOIN COMMON CODING FOR RESTART PROTECT
// PORT: Fixed ROM slots 26032.
    if slot <> 26032 or instruction <> 5544 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5544, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1670] to agcAotUnit1670@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1089
//
// PORT: SOURCE P40-P47.agc:1090
//S40.138		DSU	BPL
// PORT: Fixed ROM slots 26033.
    26033, 42026,
// PORT: SOURCE P40-P47.agc:1091
//			89SECS
// PORT: Fixed ROM slots 26034.
    26034, 15244,
// PORT: SOURCE P40-P47.agc:1092
//			STORETGO
// PORT: Fixed ROM slots 26035.
    26035, 47980,
// PORT: SOURCE P40-P47.agc:1093
//		SET
// PORT: Fixed ROM slots 26036.
    26036, 65304,
// PORT: SOURCE P40-P47.agc:1094
//			NOTHROTL
// PORT: Fixed ROM slots 26037.
    26037, 2662,
// PORT: SOURCE P40-P47.agc:1095
//STORETGO	DLOAD			# LOAD TGO AT 2(14)
// PORT: Fixed ROM slots 26038.
    26038, 65482,
// PORT: SOURCE P40-P47.agc:1096
//		EXIT
// PORT: Fixed ROM slots 26039.
    26039, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26040–26040.
function agcAotUnit1671 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1097
//		TCF	S40.132*
// PORT: Fixed ROM slots 26040.
    if slot <> 26040 or instruction <> 5520 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5520, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1671] to agcAotUnit1671@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1098
//
// PORT: SOURCE P40-P47.agc:1099
//APSTGO		DDV	SL2
// PORT: Fixed ROM slots 26041.
    26041, 51826,
// PORT: SOURCE P40-P47.agc:1100
//			FAPS
// PORT: Fixed ROM slots 26042.
    26042, 28686,
// PORT: SOURCE P40-P47.agc:1101
//		GOTO
// PORT: Fixed ROM slots 26043.
    26043, 65360,
// PORT: SOURCE P40-P47.agc:1102
//			STORETGO +1
// PORT: Fixed ROM slots 26044.
    26044, 47982,
// PORT: SOURCE P40-P47.agc:1103
//1SEC2D		2DEC	100.0 B-14	# 100.0 CS AT +14
// PORT: Fixed ROM slots 26045 26046.
    26045, 200, 26046, 0,
// PORT: SOURCE P40-P47.agc:1104
//
// PORT: SOURCE P40-P47.agc:1105
//3.5SEC		2DEC	350.0 B-13	# 350 CS AT +13
// PORT: Fixed ROM slots 26047 26048.
    26047, 1400, 26048, 0,
// PORT: SOURCE P40-P47.agc:1106
//
// PORT: SOURCE P40-P47.agc:1107
//5SECS		2DEC	500.0 B-14	# 500.0 CS AT +14
// PORT: Fixed ROM slots 26049 26050.
    26049, 1000, 26050, 0,
// PORT: SOURCE P40-P47.agc:1108
//
// PORT: SOURCE P40-P47.agc:1109
//6SEC		2DEC	600.0 B-14	# 600.0 CS AT +14
// PORT: Fixed ROM slots 26051 26052.
    26051, 1200, 26052, 0,
// PORT: SOURCE P40-P47.agc:1110
//
// PORT: SOURCE P40-P47.agc:1111
//89SECS		2DEC	8900.0 B-14
// PORT: Fixed ROM slots 26053 26054.
    26053, 17800, 26054, 0
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26055–26055.
function agcAotUnit1672 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1112
//
// PORT: SOURCE P40-P47.agc:1113
//# FUNCTION		(1) GENERATES REQUIRED VELOCITY AND VELOCITY-TO-BE-GAINED
// PORT: SOURCE P40-P47.agc:1114
//#			VECTORS FOR USE DURING AIMPOINT MANEUVERS EVERY TWO
// PORT: SOURCE P40-P47.agc:1115
//#			COMPUTATION CYCLES (4 SECONDS).
// PORT: SOURCE P40-P47.agc:1116
//#			(2) UPDATES THE B VECTOR WHICH IS USED IN THE FINAL
// PORT: SOURCE P40-P47.agc:1117
//#			CALCULATION OF EXTRAPOLATING THE VELOCITY-TO-BE-GAINED
// PORT: SOURCE P40-P47.agc:1118
//#			THROUGH ONE 2-SECOND INTERVAL INTO THE FUTURE.
// PORT: SOURCE P40-P47.agc:1119
//#
// PORT: SOURCE P40-P47.agc:1120
//# CALLING SEQUENCE	VIA FINDVAC AS NEW JOB.
// PORT: SOURCE P40-P47.agc:1121
//#
// PORT: SOURCE P40-P47.agc:1122
//# INPUT			RN	ACTIVE VEHICLE RADIUS VECTOR IN METERS AT +29
// PORT: SOURCE P40-P47.agc:1123
//#			VN	ACTIVE VEHICLE VELOCITY VECTOR IN METERS/CS AT +7
// PORT: SOURCE P40-P47.agc:1124
//# Page 776
// PORT: SOURCE P40-P47.agc:1125
//#			VPREV	LAST COMPUTED VELOCITY REQUIRED VECTOR IN
// PORT: SOURCE P40-P47.agc:1126
//#				METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1127
//#			TIG	TIME OF IGNITION IN CS AT +28.
// PORT: SOURCE P40-P47.agc:1128
//#			DLTARG	COMPUTATION CYCLE INTERVAL = 200 CS AT +28.
// PORT: SOURCE P40-P47.agc:1129
//#			PIPTIME	TIME OF RN AND VN IN CS AT +28.
// PORT: SOURCE P40-P47.agc:1130
//#			GDT/2	HALF OF VELOCITY GAINED IN DELTA T TIME DUE TO
// PORT: SOURCE P40-P47.agc:1131
//#				ACCELERATION OF GRAVITY IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1132
//#			DELVREF	CHANGE IN VELOCITY DURING LAST 2 SEC IN
// PORT: SOURCE P40-P47.agc:1133
//#				METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1134
//#
// PORT: SOURCE P40-P47.agc:1135
//# OUTPUT		VGPREV	VELOCITY TO BE GAINED VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1136
//#			VGDISP	MAG OF VGPREV FOR DISPLAY PURPOSES.
// PORT: SOURCE P40-P47.agc:1137
//#			VRPREV	VELOCTY REQUIRED VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1138
//#			BDT	B VECTOR IN METERS/CS AT +7.
// PORT: SOURCE P40-P47.agc:1139
//#
// PORT: SOURCE P40-P47.agc:1140
//# SUBROUTINES USED	INITVEL
// PORT: SOURCE P40-P47.agc:1141
//
// PORT: SOURCE P40-P47.agc:1142
//		EBANK=	VGPREV
// PORT: SOURCE P40-P47.agc:1143
//		COUNT*	$$/S40.9
// PORT: SOURCE P40-P47.agc:1144
//S40.9		TC	INTPRET
// PORT: Fixed ROM slots 26055.
    if slot <> 26055 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1672] to agcAotUnit1672@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1145
//		SETPD
// PORT: Fixed ROM slots 26056.
    26056, 65282,
// PORT: SOURCE P40-P47.agc:1146
//			00D
// PORT: Fixed ROM slots 26057.
    26057, 2,
// PORT: SOURCE P40-P47.agc:1147
//		SET	DLOAD
// PORT: Fixed ROM slots 26058.
    26058, 58648,
// PORT: SOURCE P40-P47.agc:1148
//			AVFLAG		# SET AVFLAG FOR LEM ACTIVE
// PORT: Fixed ROM slots 26059.
    26059, 1140,
// PORT: SOURCE P40-P47.agc:1149
//			HI6ZEROS
// PORT: Fixed ROM slots 26060.
    26060, 6820,
// PORT: SOURCE P40-P47.agc:1150
//		PDDL
// PORT: Fixed ROM slots 26061.
    26061, 65450,
// PORT: SOURCE P40-P47.agc:1151
//			EPS1
// PORT: Fixed ROM slots 26062.
    26062, 14860,
// PORT: SOURCE P40-P47.agc:1152
//		BOFF	DAD		# EPSILON4 = 10 OR 45 DEGREES.
// PORT: Fixed ROM slots 26063.
    26063, 36120,
// PORT: SOURCE P40-P47.agc:1153
//			NORMSW
// PORT: Fixed ROM slots 26064.
    26064, 4042,
// PORT: SOURCE P40-P47.agc:1154
//			EPSSMALL
// PORT: Fixed ROM slots 26065.
    26065, 48038,
// PORT: SOURCE P40-P47.agc:1155
//			EPS2
// PORT: Fixed ROM slots 26066.
    26066, 14864,
// PORT: SOURCE P40-P47.agc:1156
//EPSSMALL	PUSH	CALL
// PORT: Fixed ROM slots 26067.
    26067, 37900,
// PORT: SOURCE P40-P47.agc:1157
//			HAVEGUES
// PORT: Fixed ROM slots 26068.
    26068, 18436,
// PORT: SOURCE P40-P47.agc:1158
//ENDS40.9	EXIT
// PORT: Fixed ROM slots 26069.
    26069, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26070–26070.
function agcAotUnit1673 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1159
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26070.
    if slot <> 26070 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1673] to agcAotUnit1673@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1160
//		OCT	2
// PORT: Fixed ROM slots 26071.
    26071, 4
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26072–26072.
function agcAotUnit1674 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1161
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 26072.
    if slot <> 26072 or instruction <> 6765 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6765, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1674] to agcAotUnit1674@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1162
//
// PORT: SOURCE P40-P47.agc:1163
//RASTEER1	VLOAD	ABVAL
// PORT: Fixed ROM slots 26073.
    26073, 42746,
// PORT: SOURCE P40-P47.agc:1164
//			RN
// PORT: Fixed ROM slots 26074.
    26074, 1314,
// PORT: SOURCE P40-P47.agc:1165
//		LXC,2	SL*
// PORT: Fixed ROM slots 26075.
    26075, 45000,
// PORT: SOURCE P40-P47.agc:1166
//			RTX2
// PORT: Fixed ROM slots 26076.
    26076, 3070,
// PORT: SOURCE P40-P47.agc:1167
//			0,2
// PORT: Fixed ROM slots 26077.
    26077, 48892,
// PORT: SOURCE P40-P47.agc:1168
//		STOVL	RMAG
// PORT: Fixed ROM slots 26078.
    26078, 24474,
// PORT: SOURCE P40-P47.agc:1169
//			RTARG
// PORT: Fixed ROM slots 26079.
    26079, 3656,
// PORT: SOURCE P40-P47.agc:1170
//		VSU	RTB
// PORT: Fixed ROM slots 26080.
    26080, 40018,
// PORT: SOURCE P40-P47.agc:1171
//			RN
// PORT: Fixed ROM slots 26081.
    26081, 1314,
// PORT: SOURCE P40-P47.agc:1172
//			NORMUNX1
// PORT: Fixed ROM slots 26082.
    26082, 18344,
// PORT: SOURCE P40-P47.agc:1173
//		STODL	IC
// PORT: Fixed ROM slots 26083.
    26083, 16220,
// PORT: SOURCE P40-P47.agc:1174
//			36D		# C(36D) = ABVAL(C)
// PORT: Fixed ROM slots 26084.
    26084, 74,
// PORT: SOURCE P40-P47.agc:1175
//		XAD,2	SL*
// PORT: Fixed ROM slots 26085.
    26085, 44920,
// PORT: SOURCE P40-P47.agc:1176
//			X1
// PORT: Fixed ROM slots 26086.
    26086, 76,
// PORT: SOURCE P40-P47.agc:1177
//# Page 777
// PORT: SOURCE P40-P47.agc:1178
//			0,2
// PORT: Fixed ROM slots 26087.
    26087, 48892,
// PORT: SOURCE P40-P47.agc:1179
//		STORE	30D
// PORT: Fixed ROM slots 26088.
    26088, 62,
// PORT: SOURCE P40-P47.agc:1180
//		NORM	DMP
// PORT: Fixed ROM slots 26089.
    26089, 34178,
// PORT: SOURCE P40-P47.agc:1181
//			X2
// PORT: Fixed ROM slots 26090.
    26090, 80,
// PORT: SOURCE P40-P47.agc:1182
//			RMAG
// PORT: Fixed ROM slots 26091.
    26091, 3994,
// PORT: SOURCE P40-P47.agc:1183
//		NORM	XAD,2
// PORT: Fixed ROM slots 26092.
    26092, 48258,
// PORT: SOURCE P40-P47.agc:1184
//			X1
// PORT: Fixed ROM slots 26093.
    26093, 78,
// PORT: SOURCE P40-P47.agc:1185
//			X1
// PORT: Fixed ROM slots 26094.
    26094, 76,
// PORT: SOURCE P40-P47.agc:1186
//		SXA,2
// PORT: Fixed ROM slots 26095.
    26095, 65464,
// PORT: SOURCE P40-P47.agc:1187
//			MUSCALE
// PORT: Fixed ROM slots 26096.
    26096, 4076,
// PORT: SOURCE P40-P47.agc:1188
//		STODL	R1C		#			2(+56 -X)
// PORT: Fixed ROM slots 26097.
    26097, 16298,
// PORT: SOURCE P40-P47.agc:1189
//			30D
// PORT: Fixed ROM slots 26098.
    26098, 62,
// PORT: SOURCE P40-P47.agc:1190
//		SR1	PDDL
// PORT: Fixed ROM slots 26099.
    26099, 54724,
// PORT: SOURCE P40-P47.agc:1191
//			RMAG
// PORT: Fixed ROM slots 26100.
    26100, 3994,
// PORT: SOURCE P40-P47.agc:1192
//		SR1	PDDL
// PORT: Fixed ROM slots 26101.
    26101, 54724,
// PORT: SOURCE P40-P47.agc:1193
//			RTMAG
// PORT: Fixed ROM slots 26102.
    26102, 4006,
// PORT: SOURCE P40-P47.agc:1194
//		SR1	DAD
// PORT: Fixed ROM slots 26103.
    26103, 36292,
// PORT: SOURCE P40-P47.agc:1195
//		DAD	STADR
// PORT: Fixed ROM slots 26104.
    26104, 38426,
// PORT: SOURCE P40-P47.agc:1196
//		STORE	SS		# SS = (R1 + R2 + C)/2
// PORT: Fixed ROM slots 26105.
    26105, 61512,
// PORT: SOURCE P40-P47.agc:1197
//		DSU	DMP
// PORT: Fixed ROM slots 26106.
    26106, 34090,
// PORT: SOURCE P40-P47.agc:1198
//			30D
// PORT: Fixed ROM slots 26107.
    26107, 62,
// PORT: SOURCE P40-P47.agc:1199
//			MU/A
// PORT: Fixed ROM slots 26108.
    26108, 4002,
// PORT: SOURCE P40-P47.agc:1200
//		BDSU
// PORT: Fixed ROM slots 26109.
    26109, 65314,
// PORT: SOURCE P40-P47.agc:1201
//			MUASTEER
// PORT: Fixed ROM slots 26110.
    26110, 3998,
// PORT: SOURCE P40-P47.agc:1202
//		PDDL	DSU
// PORT: Fixed ROM slots 26111.
    26111, 38314,
// PORT: SOURCE P40-P47.agc:1203
//			SS
// PORT: Fixed ROM slots 26112.
    26112, 4022,
// PORT: SOURCE P40-P47.agc:1204
//			RMAG
// PORT: Fixed ROM slots 26113.
    26113, 3994,
// PORT: SOURCE P40-P47.agc:1205
//		NORM	SR1
// PORT: Fixed ROM slots 26114.
    26114, 57986,
// PORT: SOURCE P40-P47.agc:1206
//			X1
// PORT: Fixed ROM slots 26115.
    26115, 78,
// PORT: SOURCE P40-P47.agc:1207
//		DDV	DMP
// PORT: Fixed ROM slots 26116.
    26116, 34162,
// PORT: SOURCE P40-P47.agc:1208
//			R1C
// PORT: Fixed ROM slots 26117.
    26117, 4010,
// PORT: SOURCE P40-P47.agc:1209
//		XSU,2	SL*
// PORT: Fixed ROM slots 26118.
    26118, 44904,
// PORT: SOURCE P40-P47.agc:1210
//			X1
// PORT: Fixed ROM slots 26119.
    26119, 76,
// PORT: SOURCE P40-P47.agc:1211
//			1,2
// PORT: Fixed ROM slots 26120.
    26120, 48890,
// PORT: SOURCE P40-P47.agc:1212
//		LXA,2
// PORT: Fixed ROM slots 26121.
    26121, 65496,
// PORT: SOURCE P40-P47.agc:1213
//			MUSCALE
// PORT: Fixed ROM slots 26122.
    26122, 4076,
// PORT: SOURCE P40-P47.agc:1214
//		SQRT	SIGN
// PORT: Fixed ROM slots 26123.
    26123, 62956,
// PORT: SOURCE P40-P47.agc:1215
//			GEOMSGN
// PORT: Fixed ROM slots 26124.
    26124, 2934,
// PORT: SOURCE P40-P47.agc:1216
//		STORE	32D		# + OR - A
// PORT: Fixed ROM slots 26125.
    26125, 66,
// PORT: SOURCE P40-P47.agc:1217
//		DLOAD	DMP
// PORT: Fixed ROM slots 26126.
    26126, 34250,
// PORT: SOURCE P40-P47.agc:1218
//			SS
// PORT: Fixed ROM slots 26127.
    26127, 4022,
// PORT: SOURCE P40-P47.agc:1219
//			MU/A
// PORT: Fixed ROM slots 26128.
    26128, 4002,
// PORT: SOURCE P40-P47.agc:1220
//		BDSU
// PORT: Fixed ROM slots 26129.
    26129, 65314,
// PORT: SOURCE P40-P47.agc:1221
//			MUASTEER
// PORT: Fixed ROM slots 26130.
    26130, 3998,
// PORT: SOURCE P40-P47.agc:1222
//		PDDL	DSU
// PORT: Fixed ROM slots 26131.
    26131, 38314,
// PORT: SOURCE P40-P47.agc:1223
//			SS
// PORT: Fixed ROM slots 26132.
    26132, 4022,
// PORT: SOURCE P40-P47.agc:1224
//			RTMAG
// PORT: Fixed ROM slots 26133.
    26133, 4006,
// PORT: SOURCE P40-P47.agc:1225
//		NORM	SR1
// PORT: Fixed ROM slots 26134.
    26134, 57986,
// PORT: SOURCE P40-P47.agc:1226
//			X1
// PORT: Fixed ROM slots 26135.
    26135, 78,
// PORT: SOURCE P40-P47.agc:1227
//		DDV	DMP
// PORT: Fixed ROM slots 26136.
    26136, 34162,
// PORT: SOURCE P40-P47.agc:1228
//
// PORT: SOURCE P40-P47.agc:1229
//# Page 778
// PORT: SOURCE P40-P47.agc:1230
//			R1C
// PORT: Fixed ROM slots 26137.
    26137, 4010,
// PORT: SOURCE P40-P47.agc:1231
//		XSU,2	SL*
// PORT: Fixed ROM slots 26138.
    26138, 44904,
// PORT: SOURCE P40-P47.agc:1232
//			X1
// PORT: Fixed ROM slots 26139.
    26139, 76,
// PORT: SOURCE P40-P47.agc:1233
//			1,2
// PORT: Fixed ROM slots 26140.
    26140, 48890,
// PORT: SOURCE P40-P47.agc:1234
//		SQRT	PDDL		# -B (NO SIGN)
// PORT: Fixed ROM slots 26141.
    26141, 54764,
// PORT: SOURCE P40-P47.agc:1235
//			SS
// PORT: Fixed ROM slots 26142.
    26142, 4022,
// PORT: SOURCE P40-P47.agc:1236
//		DSU	DDV
// PORT: Fixed ROM slots 26143.
    26143, 47402,
// PORT: SOURCE P40-P47.agc:1237
//			30D
// PORT: Fixed ROM slots 26144.
    26144, 62,
// PORT: SOURCE P40-P47.agc:1238
//			SS
// PORT: Fixed ROM slots 26145.
    26145, 4022,
// PORT: SOURCE P40-P47.agc:1239
//		SQRT	PUSH
// PORT: Fixed ROM slots 26146.
    26146, 34540,
// PORT: SOURCE P40-P47.agc:1240
//		SR1	ASIN
// PORT: Fixed ROM slots 26147.
    26147, 57028,
// PORT: SOURCE P40-P47.agc:1241
//		DMP	PDDL
// PORT: Fixed ROM slots 26148.
    26148, 54538,
// PORT: SOURCE P40-P47.agc:1242
//			2PI+3
// PORT: Fixed ROM slots 26149.
    26149, 15644,
// PORT: SOURCE P40-P47.agc:1243
//		PDDL	DDV
// PORT: Fixed ROM slots 26150.
    26150, 47530,
// PORT: SOURCE P40-P47.agc:1244
//			30D
// PORT: Fixed ROM slots 26151.
    26151, 62,
// PORT: SOURCE P40-P47.agc:1245
//			SS
// PORT: Fixed ROM slots 26152.
    26152, 4022,
// PORT: SOURCE P40-P47.agc:1246
//		BOV
// PORT: Fixed ROM slots 26153.
    26153, 65280,
// PORT: SOURCE P40-P47.agc:1247
//			+1
// PORT: Fixed ROM slots 26154.
    26154, 48214,
// PORT: SOURCE P40-P47.agc:1248
//		SQRT	DMP
// PORT: Fixed ROM slots 26155.
    26155, 34284,
// PORT: SOURCE P40-P47.agc:1249
//		SR3	BDSU
// PORT: Fixed ROM slots 26156.
    26156, 37188,
// PORT: SOURCE P40-P47.agc:1250
//		SIGN	PDDL
// PORT: Fixed ROM slots 26157.
    26157, 54762,
// PORT: SOURCE P40-P47.agc:1251
//			GEOMSGN
// PORT: Fixed ROM slots 26158.
    26158, 2934,
// PORT: SOURCE P40-P47.agc:1252
//			2PI+3
// PORT: Fixed ROM slots 26159.
    26159, 15644,
// PORT: SOURCE P40-P47.agc:1253
//		SR2	DSU
// PORT: Fixed ROM slots 26160.
    26160, 38276,
// PORT: SOURCE P40-P47.agc:1254
//		DMP	PDDL
// PORT: Fixed ROM slots 26161.
    26161, 54538,
// PORT: SOURCE P40-P47.agc:1255
//			SS
// PORT: Fixed ROM slots 26162.
    26162, 4022,
// PORT: SOURCE P40-P47.agc:1256
//			SS
// PORT: Fixed ROM slots 26163.
    26163, 4022,
// PORT: SOURCE P40-P47.agc:1257
//		SR3	SQRT
// PORT: Fixed ROM slots 26164.
    26164, 63044,
// PORT: SOURCE P40-P47.agc:1258
//		DMP
// PORT: Fixed ROM slots 26165.
    26165, 65290,
// PORT: SOURCE P40-P47.agc:1259
//		PDDL	SL3
// PORT: Fixed ROM slots 26166.
    26166, 43690,
// PORT: SOURCE P40-P47.agc:1260
//			MUASTEER
// PORT: Fixed ROM slots 26167.
    26167, 3998,
// PORT: SOURCE P40-P47.agc:1261
//		SQRT	BDDV
// PORT: Fixed ROM slots 26168.
    26168, 46572,
// PORT: SOURCE P40-P47.agc:1262
//		DSU	DAD
// PORT: Fixed ROM slots 26169.
    26169, 36138,
// PORT: SOURCE P40-P47.agc:1263
//			TPASS4
// PORT: Fixed ROM slots 26170.
    26170, 3890,
// PORT: SOURCE P40-P47.agc:1264
//			PIPTIME
// PORT: Fixed ROM slots 26171.
    26171, 1338,
// PORT: SOURCE P40-P47.agc:1265
//		STODL	30D
// PORT: Fixed ROM slots 26172.
    26172, 12350,
// PORT: SOURCE P40-P47.agc:1266
//		SIGN
// PORT: Fixed ROM slots 26173.
    26173, 65514,
// PORT: SOURCE P40-P47.agc:1267
//			30D		# B WITH SIGN
// PORT: Fixed ROM slots 26174.
    26174, 62,
// PORT: SOURCE P40-P47.agc:1268
//		STORE	30D
// PORT: Fixed ROM slots 26175.
    26175, 62,
// PORT: SOURCE P40-P47.agc:1269
//		BON	VLOAD
// PORT: Fixed ROM slots 26176.
    26176, 64792,
// PORT: SOURCE P40-P47.agc:1270
//			NORMSW
// PORT: Fixed ROM slots 26177.
    26177, 3978,
// PORT: SOURCE P40-P47.agc:1271
//			180MESS
// PORT: Fixed ROM slots 26178.
    26178, 48294,
// PORT: SOURCE P40-P47.agc:1272
//			IC
// PORT: Fixed ROM slots 26179.
    26179, 3932,
// PORT: SOURCE P40-P47.agc:1273
//		VSU	UNIT
// PORT: Fixed ROM slots 26180.
    26180, 44626,
// PORT: SOURCE P40-P47.agc:1274
//			UNIT/R/
// PORT: Fixed ROM slots 26181.
    26181, 3774,
// PORT: SOURCE P40-P47.agc:1275
//		VXSC	PDVL
// PORT: Fixed ROM slots 26182.
    26182, 52706,
// PORT: SOURCE P40-P47.agc:1276
//			30D
// PORT: Fixed ROM slots 26183.
    26183, 62,
// PORT: SOURCE P40-P47.agc:1277
//			IC
// PORT: Fixed ROM slots 26184.
    26184, 3932,
// PORT: SOURCE P40-P47.agc:1278
//		VAD	UNIT
// PORT: Fixed ROM slots 26185.
    26185, 44634,
// PORT: SOURCE P40-P47.agc:1279
//			UNIT/R/
// PORT: Fixed ROM slots 26186.
    26186, 3774,
// PORT: SOURCE P40-P47.agc:1280
//# Page 779
// PORT: SOURCE P40-P47.agc:1281
//GETVRVG1	VXSC	VAD
// PORT: Fixed ROM slots 26187.
    26187, 44514,
// PORT: SOURCE P40-P47.agc:1282
//			32D
// PORT: Fixed ROM slots 26188.
    26188, 66,
// PORT: SOURCE P40-P47.agc:1283
//GETVRVG2	LXC,2	VSR*
// PORT: Fixed ROM slots 26189.
    26189, 45000,
// PORT: SOURCE P40-P47.agc:1284
//			RTX2
// PORT: Fixed ROM slots 26190.
    26190, 3070,
// PORT: SOURCE P40-P47.agc:1285
//			0 	-1,2
// PORT: Fixed ROM slots 26191.
    26191, 48382,
// PORT: SOURCE P40-P47.agc:1286
//		STORE	VIPRIME
// PORT: Fixed ROM slots 26192.
    26192, 2494,
// PORT: SOURCE P40-P47.agc:1287
//		GOTO
// PORT: Fixed ROM slots 26193.
    26193, 65360,
// PORT: SOURCE P40-P47.agc:1288
//			ASTREND -2
// PORT: Fixed ROM slots 26194.
    26194, 48364,
// PORT: SOURCE P40-P47.agc:1289
//180MESS		VLOAD	DOT
// PORT: Fixed ROM slots 26195.
    26195, 41466
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1290
//			IC
// PORT: Fixed ROM slots 26196.
    26196, 3932,
// PORT: SOURCE P40-P47.agc:1291
//			UNIT/R/
// PORT: Fixed ROM slots 26197.
    26197, 3774,
// PORT: SOURCE P40-P47.agc:1292
//		BMN	VLOAD
// PORT: Fixed ROM slots 26198.
    26198, 64832,
// PORT: SOURCE P40-P47.agc:1293
//			NEGPROD
// PORT: Fixed ROM slots 26199.
    26199, 48332,
// PORT: SOURCE P40-P47.agc:1294
//			IC
// PORT: Fixed ROM slots 26200.
    26200, 3932,
// PORT: SOURCE P40-P47.agc:1295
//		VSR1	PDVL
// PORT: Fixed ROM slots 26201.
    26201, 52708,
// PORT: SOURCE P40-P47.agc:1296
//			UNIT/R/
// PORT: Fixed ROM slots 26202.
    26202, 3774,
// PORT: SOURCE P40-P47.agc:1297
//		VSR1	VAD
// PORT: Fixed ROM slots 26203.
    26203, 44516,
// PORT: SOURCE P40-P47.agc:1298
//		UNIT
// PORT: Fixed ROM slots 26204.
    26204, 65372,
// PORT: SOURCE P40-P47.agc:1299
//		PUSH	VCOMP		# FOR A
// PORT: Fixed ROM slots 26205.
    26205, 48652,
// PORT: SOURCE P40-P47.agc:1300
//		VXV	SIGN
// PORT: Fixed ROM slots 26206.
    26206, 62778,
// PORT: SOURCE P40-P47.agc:1301
//			UN
// PORT: Fixed ROM slots 26207.
    26207, 2936,
// PORT: SOURCE P40-P47.agc:1302
//			GEOMSGN
// PORT: Fixed ROM slots 26208.
    26208, 2934,
// PORT: SOURCE P40-P47.agc:1303
//		UNIT	VXSC
// PORT: Fixed ROM slots 26209.
    26209, 61788,
// PORT: SOURCE P40-P47.agc:1304
//			30D
// PORT: Fixed ROM slots 26210.
    26210, 62,
// PORT: SOURCE P40-P47.agc:1305
//		PDVL			# UNIT(IC-IR)	+-B
// PORT: Fixed ROM slots 26211.
    26211, 65434,
// PORT: SOURCE P40-P47.agc:1306
//		GOTO
// PORT: Fixed ROM slots 26212.
    26212, 65360,
// PORT: SOURCE P40-P47.agc:1307
//			GETVRVG1
// PORT: Fixed ROM slots 26213.
    26213, 48278,
// PORT: SOURCE P40-P47.agc:1308
//NEGPROD		VLOAD	VSR1
// PORT: Fixed ROM slots 26214.
    26214, 62202,
// PORT: SOURCE P40-P47.agc:1309
//			UNIT/R/
// PORT: Fixed ROM slots 26215.
    26215, 3774,
// PORT: SOURCE P40-P47.agc:1310
//		PDVL	VSR1
// PORT: Fixed ROM slots 26216.
    26216, 62106,
// PORT: SOURCE P40-P47.agc:1311
//			IC
// PORT: Fixed ROM slots 26217.
    26217, 3932,
// PORT: SOURCE P40-P47.agc:1312
//		VSU	UNIT
// PORT: Fixed ROM slots 26218.
    26218, 44626,
// PORT: SOURCE P40-P47.agc:1313
//		PUSH
// PORT: Fixed ROM slots 26219.
    26219, 65292,
// PORT: SOURCE P40-P47.agc:1314
//		VXV	SIGN
// PORT: Fixed ROM slots 26220.
    26220, 62778,
// PORT: SOURCE P40-P47.agc:1315
//			UN		# FOR B
// PORT: Fixed ROM slots 26221.
    26221, 2936,
// PORT: SOURCE P40-P47.agc:1316
//			GEOMSGN
// PORT: Fixed ROM slots 26222.
    26222, 2934,
// PORT: SOURCE P40-P47.agc:1317
//		UNIT	VXSC
// PORT: Fixed ROM slots 26223.
    26223, 61788,
// PORT: SOURCE P40-P47.agc:1318
//			32D
// PORT: Fixed ROM slots 26224.
    26224, 66,
// PORT: SOURCE P40-P47.agc:1319
//		PDVL
// PORT: Fixed ROM slots 26225.
    26225, 65434,
// PORT: SOURCE P40-P47.agc:1320
//		VXSC	VAD
// PORT: Fixed ROM slots 26226.
    26226, 44514,
// PORT: SOURCE P40-P47.agc:1321
//			30D
// PORT: Fixed ROM slots 26227.
    26227, 62,
// PORT: SOURCE P40-P47.agc:1322
//		GOTO
// PORT: Fixed ROM slots 26228.
    26228, 65360,
// PORT: SOURCE P40-P47.agc:1323
//			GETVRVG2
// PORT: Fixed ROM slots 26229.
    26229, 48282,
// PORT: SOURCE P40-P47.agc:1324
//		VSU
// PORT: Fixed ROM slots 26230.
    26230, 65362,
// PORT: SOURCE P40-P47.agc:1325
//			VN1
// PORT: Fixed ROM slots 26231.
    26231, 3798,
// PORT: SOURCE P40-P47.agc:1326
//ASTREND		STORE	DELVEET3
// PORT: Fixed ROM slots 26232.
    26232, 2540,
// PORT: SOURCE P40-P47.agc:1327
//FIRSTTME	SLOAD	BZE
// PORT: Fixed ROM slots 26233.
    26233, 44218,
// PORT: SOURCE P40-P47.agc:1328
//			RTX2
// PORT: Fixed ROM slots 26234.
    26234, 3072,
// PORT: SOURCE P40-P47.agc:1329
//			GETGOBL
// PORT: Fixed ROM slots 26235.
    26235, 48382,
// PORT: SOURCE P40-P47.agc:1330
//		VLOAD	GOTO		# NO OBLATENESS COMP IF IN MOON SPHERE
// PORT: Fixed ROM slots 26236.
    26236, 43258,
// PORT: SOURCE P40-P47.agc:1331
//# Page 780
// PORT: SOURCE P40-P47.agc:1332
//			DELVEET3
// PORT: Fixed ROM slots 26237.
    26237, 2540,
// PORT: SOURCE P40-P47.agc:1333
//			NOGOBL
// PORT: Fixed ROM slots 26238.
    26238, 48404,
// PORT: SOURCE P40-P47.agc:1334
//GETGOBL		VLOAD	UNIT		# CALCULATE OBLATENESS TERM.
// PORT: Fixed ROM slots 26239.
    26239, 44794,
// PORT: SOURCE P40-P47.agc:1335
//			RN
// PORT: Fixed ROM slots 26240.
    26240, 1314,
// PORT: SOURCE P40-P47.agc:1336
//		DLOAD	DSU
// PORT: Fixed ROM slots 26241.
    26241, 38346,
// PORT: SOURCE P40-P47.agc:1337
//			PIPTIME		#              2
// PORT: Fixed ROM slots 26242.
    26242, 1338,
// PORT: SOURCE P40-P47.agc:1338
//			GOBLTIME	# G    = -(MU/R )(UNITGOBL)(T-TIG)
// PORT: Fixed ROM slots 26243.
    26243, 3732,
// PORT: SOURCE P40-P47.agc:1339
//		DMP	DDV		#  OBL
// PORT: Fixed ROM slots 26244.
    26244, 47370,
// PORT: SOURCE P40-P47.agc:1340
//			EARTHMU
// PORT: Fixed ROM slots 26245.
    26245, 14374,
// PORT: SOURCE P40-P47.agc:1341
//			34D		# 34D = /RN/ (2) FROM UNIT OPERATION.
// PORT: Fixed ROM slots 26246.
    26246, 70,
// PORT: SOURCE P40-P47.agc:1342
//		VXSC	VAD
// PORT: Fixed ROM slots 26247.
    26247, 44514,
// PORT: SOURCE P40-P47.agc:1343
//			UNITGOBL
// PORT: Fixed ROM slots 26248.
    26248, 3746,
// PORT: SOURCE P40-P47.agc:1344
//			DELVEET3	# OUTPUT FROM INITVEL VG = VR - VN
// PORT: Fixed ROM slots 26249.
    26249, 2540,
// PORT: SOURCE P40-P47.agc:1345
//NOGOBL		STORE	DELVEET3	# VG = VR + GOBL - VN
// PORT: Fixed ROM slots 26250.
    26250, 2540,
// PORT: SOURCE P40-P47.agc:1346
//		GOTO
// PORT: Fixed ROM slots 26251.
    26251, 65360,
// PORT: SOURCE P40-P47.agc:1347
//			VGAIN*
// PORT: Fixed ROM slots 26252.
    26252, 47706,
// PORT: SOURCE P40-P47.agc:1348
//
// PORT: SOURCE P40-P47.agc:1349
//2PI+3		2DEC	3.141592653 B-2
// PORT: Fixed ROM slots 26253 26254.
    26253, 25734, 26254, 31572
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26255–26255.
function agcAotUnit1675 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1350
//
// PORT: SOURCE P40-P47.agc:1351
//# Page 781
// PORT: SOURCE P40-P47.agc:1352
//# TRIMGIMB	(FORMERLY S40.6)
// PORT: SOURCE P40-P47.agc:1353
//# MOD 0		24 FEB 67	PETER ADLER
// PORT: SOURCE P40-P47.agc:1354
//#
// PORT: SOURCE P40-P47.agc:1355
//# FUNCTION:
// PORT: SOURCE P40-P47.agc:1356
//#	TRIMS DPS ENGINE TO MINIMIZE THRUST/CG OFFSET.  ENGINE IS GIMBALLED TO FULL + PITCH AND + ROLL (TO LOCK)
// PORT: SOURCE P40-P47.agc:1357
//#	FOR REFERENCE AND IS THEN BROUGHT BACK TO TRIM POSITION BY RUNNING FOR THE PROPER TIMES (TO BE
// PORT: SOURCE P40-P47.agc:1358
//#	SPECIFIED BY GAEC) IN - PITCH AND - ROLL.
// PORT: SOURCE P40-P47.agc:1359
//#
// PORT: SOURCE P40-P47.agc:1360
//# CALLING SEQUENCE:
// PORT: SOURCE P40-P47.agc:1361
//#	VIA WAITLIST FROM R03
// PORT: SOURCE P40-P47.agc:1362
//#
// PORT: SOURCE P40-P47.agc:1363
//# INPUT:
// PORT: SOURCE P40-P47.agc:1364
//#	PITTIME		TIME TO RUN FROM FULL + PITCH TO TRIM (CS)
// PORT: SOURCE P40-P47.agc:1365
//#	ROLLTIME	TIME TO RUN FROM FULL + ROLL TO TRIM (CS)
// PORT: SOURCE P40-P47.agc:1366
//#
// PORT: SOURCE P40-P47.agc:1367
//# SUBROUTINES USED:
// PORT: SOURCE P40-P47.agc:1368
//#	WAITLIST, FIXDELAY, VARDELAY, FLAGUP, FLAGDOWN, NOVAC
// PORT: SOURCE P40-P47.agc:1369
//
// PORT: SOURCE P40-P47.agc:1370
//		COUNT*	$$/S40.6
// PORT: SOURCE P40-P47.agc:1371
//		EBANK=	ROLLTIME	# OCTAL MASKS: PRIO5=05000 EBANK5=02400
// PORT: SOURCE P40-P47.agc:1372
//
// PORT: SOURCE P40-P47.agc:1373
//TRIMGIMB	TC	DOWNFLAG	# GMBDRVSW FLAG IS SET WHEN EITHER ROLL OR
// PORT: Fixed ROM slots 26255.
    if slot <> 26255 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1675] to agcAotUnit1675@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1374
//		ADRES	GMBDRVSW	# PITCH IS COMPLETED, WHICHEVER IS FIRST.
// PORT: Fixed ROM slots 26256.
    26256, 190
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26257–26263.
function agcAotUnit1676 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26259 {
        if slot <= 26257 {
// PORT: SOURCE P40-P47.agc:1375
//
// PORT: SOURCE P40-P47.agc:1376
//		CS	PRIO5		# TURN OFF - PITCH, - ROLL, IF ON.
// PORT: Fixed ROM slots 26257.
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
// PORT: SOURCE P40-P47.agc:1377
//		EXTEND
// PORT: Fixed ROM slots 26258.
                if slot <> 26258 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1378
//		WAND	CHAN12
// PORT: Fixed ROM slots 26259.
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
// PORT: SOURCE P40-P47.agc:1379
//		CAF	EBANK5		# TURN ON + PITCH, + ROLL.
// PORT: Fixed ROM slots 26260.
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
// PORT: SOURCE P40-P47.agc:1380
//		EXTEND
// PORT: Fixed ROM slots 26261.
                if slot <> 26261 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26262 {
// PORT: SOURCE P40-P47.agc:1381
//		WOR	CHAN12
// PORT: Fixed ROM slots 26262.
                if slot <> 26262 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1382
//		TC	FIXDELAY	# WAIT ONE MINUTE TO MAKE SURE ENGINE IS
// PORT: Fixed ROM slots 26263.
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
// PORT: SOURCE P40-P47.agc:1383
//		DEC	6000		# AT FULL + PITCH AND FULL + ROLL
// PORT: Fixed ROM slots 26264.
    26264, 12000
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26265–26272.
function agcAotUnit1677 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26268 {
        if slot <= 26266 {
            if slot <= 26265 {
// PORT: SOURCE P40-P47.agc:1384
//		CS	EBANK5		# TURN OFF + PITCH, + ROLL.
// PORT: Fixed ROM slots 26265.
                if slot <> 26265 or instruction <> 18956 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1385
//		EXTEND
// PORT: Fixed ROM slots 26266.
                if slot <> 26266 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26267 {
// PORT: SOURCE P40-P47.agc:1386
//		WAND	CHAN12
// PORT: Fixed ROM slots 26267.
                if slot <> 26267 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1387
//		CAF	PRIO5		# TURN ON - PITCH, - ROLL.
// PORT: Fixed ROM slots 26268.
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
// PORT: SOURCE P40-P47.agc:1388
//		EXTEND
// PORT: Fixed ROM slots 26269.
                if slot <> 26269 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1389
//		WOR	CHAN12
// PORT: Fixed ROM slots 26270.
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
// PORT: SOURCE P40-P47.agc:1390
//		CAE	PITTIME		# GET TIME TO SHUT OFF - PITCH AND SET UP
// PORT: Fixed ROM slots 26271.
                if slot <> 26271 or instruction <> 13058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 770).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1391
//		TC	TWIDDLE		# TWIDDLE-TASK TO TURN IT OFF THEN
// PORT: Fixed ROM slots 26272.
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
// PORT: SOURCE P40-P47.agc:1392
//		ADRES	PITCHOFF
// PORT: Fixed ROM slots 26273.
    26273, 3424
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26274–26284.
function agcAotUnit1678 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26278 {
        if slot <= 26275 {
            if slot <= 26274 {
// PORT: SOURCE P40-P47.agc:1393
//
// PORT: SOURCE P40-P47.agc:1394
//		CAE	ROLLTIME	# GET TIME TO SHUT OFF - ROLL AND GO AWAY
// PORT: Fixed ROM slots 26274.
                if slot <> 26274 or instruction <> 13057 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 769).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1395
//		TC	VARDELAY	# UNTIL THEN
// PORT: Fixed ROM slots 26275.
                if slot <> 26275 or instruction <> 2708 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2708, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26276 {
// PORT: SOURCE P40-P47.agc:1396
//		CS	BIT12
// PORT: Fixed ROM slots 26276.
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
// PORT: SOURCE P40-P47.agc:1397
//		EXTEND
// PORT: Fixed ROM slots 26277.
                    if slot <> 26277 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P40-P47.agc:1398
//		WAND	CHAN12		# SHUT OFF ROLL
// PORT: Fixed ROM slots 26278.
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
// PORT: SOURCE P40-P47.agc:1399
//ROLLOVER	CA	FLAGWRD6	# IF HERE INLINE (ROLL DONE) IS PITCH DONE
// PORT: Fixed ROM slots 26279.
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
// PORT: SOURCE P40-P47.agc:1400
//		MASK	GMBDRBIT	# IF HERE FROM PITCHOFF, IS ROLL DONE?
// PORT: Fixed ROM slots 26280.
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
// PORT: SOURCE P40-P47.agc:1401
//		EXTEND
// PORT: Fixed ROM slots 26281.
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
// PORT: SOURCE P40-P47.agc:1402
//		BZF	PITCHOFF +4	# NO.  SET FLAG, ROLL OR PITCH DONE.
// PORT: Fixed ROM slots 26282.
                if slot <> 26282 or instruction <> 5812 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5812, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26283 {
// PORT: SOURCE P40-P47.agc:1403
//		CAF	PRIO10		# RETURN TO R03.
// PORT: Fixed ROM slots 26283.
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
// PORT: SOURCE P40-P47.agc:1404
//		TC	NOVAC
// PORT: Fixed ROM slots 26284.
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
// PORT: SOURCE P40-P47.agc:1405
//		EBANK=	WHOCARES
// PORT: SOURCE P40-P47.agc:1406
//# Page 782
// PORT: SOURCE P40-P47.agc:1407
//		2CADR	TRIMDONE
// PORT: Fixed ROM slots 26285 26286.
    26285, 2470, 26286, 2158
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26287–26292.
function agcAotUnit1679 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26289 {
        if slot <= 26287 {
// PORT: SOURCE P40-P47.agc:1408
//
// PORT: SOURCE P40-P47.agc:1409
//		TC	TASKOVER
// PORT: Fixed ROM slots 26287.
            if slot <> 26287 or instruction <> 2737 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2737, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26288 {
// PORT: SOURCE P40-P47.agc:1410
//PITCHOFF	CS	BIT10
// PORT: Fixed ROM slots 26288.
                if slot <> 26288 or instruction <> 18914 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1411
//		EXTEND
// PORT: Fixed ROM slots 26289.
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
// PORT: SOURCE P40-P47.agc:1412
//		WAND	CHAN12		# SHUT OFF PITCH
// PORT: Fixed ROM slots 26290.
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
// PORT: SOURCE P40-P47.agc:1413
//		TCF	ROLLOVER	# SEE IF ROLL HAS FINISHED ALSO.
// PORT: Fixed ROM slots 26291.
                if slot <> 26291 or instruction <> 5799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P40-P47.agc:1414
//		TC	UPFLAG		# ROLL DONE; OR PITCH DONE; BUT NOT BOTH.
// PORT: Fixed ROM slots 26292.
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
// PORT: SOURCE P40-P47.agc:1415
//		ADRES	GMBDRVSW
// PORT: Fixed ROM slots 26293.
    26293, 190
)).

// PORT: Physical bank 27. Shared continuation entries, slots 26294–26294.
function agcAotUnit1680 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P40-P47.agc:1416
//		TC	TASKOVER
// PORT: Fixed ROM slots 26294.
    if slot <> 26294 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1680] to agcAotUnit1680@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P40-P47.agc:1417
//
// PORT: SOURCE P40-P47.agc:1418
//# Page 783
// PORT: SOURCE P40-P47.agc:1419
//# SUBROUTINE NAME:  S41.1	MOD. NO. 0	DATE: FEBRUARY 28, 1967
// PORT: SOURCE P40-P47.agc:1420
//# MOD. NO. 1	DATE: JANUARY 23, 1968, BY PETER ADLER (MIT/IL)
// PORT: SOURCE P40-P47.agc:1421
//#
// PORT: SOURCE P40-P47.agc:1422
//# AUTHOR: JONATHON D. ADDLESTON (ADAMS ASSOCIATES)
// PORT: SOURCE P40-P47.agc:1423
//#
// PORT: SOURCE P40-P47.agc:1424
//# S41.1 PERFORMS THE COORDINATE SYSTEM TRANSFORMATION FROM THE REFERENCE FRAME TO THE BODY OF THE LM.
// PORT: SOURCE P40-P47.agc:1425
//# SPECIFICALLY, IT IS USED TO TRANSFORM A VELOCITY (SCALED AT 2(+7) METERS/CENTISECOND) FROM REFERENCE TO LM AXIS
// PORT: SOURCE P40-P47.agc:1426
//# COORDINATES.  FIRST THE VECTOR IS TRANSFORMED TO THE STABLE MEMBER COORDINATES BY THE MATRIX REFSMMAT.  THIS
// PORT: SOURCE P40-P47.agc:1427
//# LEAVES THE VECTOR IN MPAC, SCALED AT 2(+8) METERS/CENTISECOND.  THEN
// PORT: SOURCE P40-P47.agc:1428
//# THE SUBROUTINE CDUTRIG IS CALLED TO SET UP THE DOUBLE-PRECISION CDU VECTOR ALONG WITH ITS SINES AND COSINES.
// PORT: SOURCE P40-P47.agc:1429
//# THE VECTOR IS THEN TRANSFORMED FROM STABLE MEMBER COORDINATES TO SPACECRAFT (OR LM) COORDINATES BY THE
// PORT: SOURCE P40-P47.agc:1430
//# SUBROUTINE *SMNB*.  FINALLY, THE VECTOR IS RESCALED TO 2(+7) METERS/CENTISECOND, AND CONTROL IS RETURNED BO THE
// PORT: SOURCE P40-P47.agc:1431
//# CALLER WITH C(MPAC) = VELOCITY(LM).
// PORT: SOURCE P40-P47.agc:1432
//#
// PORT: SOURCE P40-P47.agc:1433
//# CALLING SEQUENCE:
// PORT: SOURCE P40-P47.agc:1434
//#	L	VLOAD	CALL
// PORT: SOURCE P40-P47.agc:1435
//#	L +1		VELOCITY(REF)		# SCALED AT 2(+7) M/CS IN REFERENCE COORDS.
// PORT: SOURCE P40-P47.agc:1436
//#	L +2		S41.1
// PORT: SOURCE P40-P47.agc:1437
//#	L +3	STORE	VELOCITY(LM)		# SCALED AT 2(+7) M/CS IN LM BODY AXIS SYS.
// PORT: SOURCE P40-P47.agc:1438
//#
// PORT: SOURCE P40-P47.agc:1439
//# SUBROUTINES CALLED:
// PORT: SOURCE P40-P47.agc:1440
//#	1.	CDUTRIG,
// PORT: SOURCE P40-P47.agc:1441
//#			WHICH CALLS CDULOGIC.
// PORT: SOURCE P40-P47.agc:1442
//#	2.	*SMNB*
// PORT: SOURCE P40-P47.agc:1443
//#
// PORT: SOURCE P40-P47.agc:1444
//# NORMAL RETURN:  L +3 (SEE CALLING SEQUENCE, ABOVE.)
// PORT: SOURCE P40-P47.agc:1445
//#
// PORT: SOURCE P40-P47.agc:1446
//# ALARM/ABORT MODES:  NONE.
// PORT: SOURCE P40-P47.agc:1447
//#
// PORT: SOURCE P40-P47.agc:1448
//# RESTART PROTECTION:  NONE.
// PORT: SOURCE P40-P47.agc:1449
//#
// PORT: SOURCE P40-P47.agc:1450
//# Page 784
// PORT: SOURCE P40-P47.agc:1451
//# INPUT:
// PORT: SOURCE P40-P47.agc:1452
//#	1.	REFSMMAT.
// PORT: SOURCE P40-P47.agc:1453
//#	2.	CDUX, CDUY, CDUZ.
// PORT: SOURCE P40-P47.agc:1454
//#	3.	VELOCITY (REF) IN MPAC.
// PORT: SOURCE P40-P47.agc:1455
//#
// PORT: SOURCE P40-P47.agc:1456
//# OUTPUT:
// PORT: SOURCE P40-P47.agc:1457
//#	1.	CSUSPOT:	DOUBLE PRECISION CDU VECTOR, ORDERED Y,Z,X.
// PORT: SOURCE P40-P47.agc:1458
//#	2.	SINCDU:		HALF SINES OF CDUSPOT COMPONENTS
// PORT: SOURCE P40-P47.agc:1459
//#	3.	COSCDU:		HALF COSINES OF CDUSPOT COMPONENTS.
// PORT: SOURCE P40-P47.agc:1460
//#	4.	MPAC:		VELOCITY(LM) (SCALED AT 2(+7) METERS/CENTISECOND)
// PORT: SOURCE P40-P47.agc:1461
//#
// PORT: SOURCE P40-P47.agc:1462
//# DEBRIS:  NONE.
// PORT: SOURCE P40-P47.agc:1463
//#
// PORT: SOURCE P40-P47.agc:1464
//# CHECKOUT STATUS:  CODED
// PORT: SOURCE P40-P47.agc:1465
//
// PORT: SOURCE P40-P47.agc:1466
//		COUNT*	$$/S41.1
// PORT: SOURCE P40-P47.agc:1467
//S41.1		MXV	VSL1		# CONVERT VECTOR IN MPAC FROM REF AT 2(+7)
// PORT: Fixed ROM slots 26295.
    26295, 64162,
// PORT: SOURCE P40-P47.agc:1468
//			REFSMMAT	# TO SM AND RESCALE DUE TO HALF-UNIT MATRIX
// PORT: Fixed ROM slots 26296.
    26296, 1976,
// PORT: SOURCE P40-P47.agc:1469
//		GOTO			# CONVERT TO BODY AT 2(+7) USING PRESENT
// PORT: Fixed ROM slots 26297.
    26297, 65360,
// PORT: SOURCE P40-P47.agc:1470
//			CDU*SMNB	# CDU ANGLES.  CDU*SMNB WILL RETURN
// PORT: Fixed ROM slots 26298.
    26298, 40780
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P40-P47.agc:1471
//					# VIA RVQ TO THE CALLER OF S41.1.
