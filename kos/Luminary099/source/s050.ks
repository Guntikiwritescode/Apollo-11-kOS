// PORT: Original source unit P20-P25.agc.
// PORT: Physical bank 24. Shared continuation entries, slots 22528–22528.
function agcAotUnit1394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P20-P25.agc:2
//# Filename:	P20-P25.agc
// PORT: SOURCE P20-P25.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P20-P25.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P20-P25.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P20-P25.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P20-P25.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// PORT: SOURCE P20-P25.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P20-P25.agc:9
//# Pages:	0492-0613
// PORT: SOURCE P20-P25.agc:10
//# Mod history:	2009-05-26 OH	Transcribed from page images.
// PORT: SOURCE P20-P25.agc:11
//#		2009-06-05 RSB	Corrected a typos.
// PORT: SOURCE P20-P25.agc:12
//#		2009-06-06 RSB	Added a missing instruction, and a block
// PORT: SOURCE P20-P25.agc:13
//#				of 3 missing instructions.
// PORT: SOURCE P20-P25.agc:14
//#		2009-06-07 RSB	Fixed a misprint.
// PORT: SOURCE P20-P25.agc:15
//#		2009-06-07 RSB	Changed the construct "2DEC E-6 B12"
// PORT: SOURCE P20-P25.agc:16
//#				(which isn't legal in yaYUL) to
// PORT: SOURCE P20-P25.agc:17
//#				"2DEC 1.0 E-6 B12".
// PORT: SOURCE P20-P25.agc:18
//#		2011-05-07 JL	Removed workarounds.
// PORT: SOURCE P20-P25.agc:19
//
// PORT: SOURCE P20-P25.agc:20
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P20-P25.agc:21
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P20-P25.agc:22
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P20-P25.agc:23
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P20-P25.agc:24
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P20-P25.agc:25
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P20-P25.agc:26
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P20-P25.agc:27
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P20-P25.agc:28
//# actually created.
// PORT: SOURCE P20-P25.agc:29
//#
// PORT: SOURCE P20-P25.agc:30
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P20-P25.agc:31
//#
// PORT: SOURCE P20-P25.agc:32
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P20-P25.agc:33
//#	16:27 JULY 14, 1969
// PORT: SOURCE P20-P25.agc:34
//
// PORT: SOURCE P20-P25.agc:35
//# Page 492
// PORT: SOURCE P20-P25.agc:36
//# RENDEZVOUS NAVIGATION PROGRAM 20
// PORT: SOURCE P20-P25.agc:37
//#
// PORT: SOURCE P20-P25.agc:38
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:39
//#
// PORT: SOURCE P20-P25.agc:40
//# 	MOD NO -- 2
// PORT: SOURCE P20-P25.agc:41
//# 	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:42
//#
// PORT: SOURCE P20-P25.agc:43
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:44
//#
// PORT: SOURCE P20-P25.agc:45
//# 	THE PURPOSE OF THIS PROGRAM IS TO CONTROL THE RENDEZVOUS RADAR FROM
// PORT: SOURCE P20-P25.agc:46
//# 	STARTUP THROUGH ACQUISITION AND LOCKON TO THE CSM AND TO UPDATE EITHER
// PORT: SOURCE P20-P25.agc:47
//# 	THE LM OR CSM STATE VECTOR (AS SPECIFIED BY THE ASTRONAUT BY DSKY ENTRY)
// PORT: SOURCE P20-P25.agc:48
//# 	ON THE BASIS OF THE RR TRACKING DATA.
// PORT: SOURCE P20-P25.agc:49
//#
// PORT: SOURCE P20-P25.agc:50
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:51
//#
// PORT: SOURCE P20-P25.agc:52
//# 	ASTRONAUT REQUEST THROUGH DSKY V37E20E
// PORT: SOURCE P20-P25.agc:53
//#
// PORT: SOURCE P20-P25.agc:54
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:55
//#
// PORT: SOURCE P20-P25.agc:56
//#	R02BOTH	(IMU STATUS CHECK)			FLAGUP
// PORT: SOURCE P20-P25.agc:57
//#	GOFLASH	(PINBALL-DISPLAY)			FLAGDOWN
// PORT: SOURCE P20-P25.agc:58
//#	R23LEM	(MANUAL ACQUISITION)			BANKCALL
// PORT: SOURCE P20-P25.agc:59
//#	LS201	(LOS DETERMINATION)			TASKOVER
// PORT: SOURCE P20-P25.agc:60
//#	LS202	(RANGE LIMIT TEST)
// PORT: SOURCE P20-P25.agc:61
//#	R61LEM	(PREFERRED TRACKING ATTITUDE)
// PORT: SOURCE P20-P25.agc:62
//#	R21LEM	(RR DESIGNATE)				ENDOFJOB
// PORT: SOURCE P20-P25.agc:63
//#	R22LEM	(DATA READ)				GOPERF1
// PORT: SOURCE P20-P25.agc:64
//#	R31LEM	(RENDEZVOUS PARAMETER DISPLAY)
// PORT: SOURCE P20-P25.agc:65
//#	PRIOLARM (PRIORITY DISPLAY)
// PORT: SOURCE P20-P25.agc:66
//#
// PORT: SOURCE P20-P25.agc:67
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:68
//#
// PORT: SOURCE P20-P25.agc:69
//# 	P20 MAY BE TERMINATED IN TWO WAYS -- ASTRONAUT SELECTION OF IDLING
// PORT: SOURCE P20-P25.agc:70
//#	PROGRAM (P00) BY KEYING V37E00E OR BY KEYING IN V56E
// PORT: SOURCE P20-P25.agc:71
//#
// PORT: SOURCE P20-P25.agc:72
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:73
//#
// PORT: SOURCE P20-P25.agc:74
//# 	RANGE GREATER THAN 400 NM DISPLAY
// PORT: SOURCE P20-P25.agc:75
//#
// PORT: SOURCE P20-P25.agc:76
//# OUTPUT
// PORT: SOURCE P20-P25.agc:77
//#
// PORT: SOURCE P20-P25.agc:78
//# 	TRKMKCNT = NO OF RENDEZVOUS TRACKING MARKS TAKEN (COUNTER)
// PORT: SOURCE P20-P25.agc:79
//#
// PORT: SOURCE P20-P25.agc:80
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:81
//#
// PORT: SOURCE P20-P25.agc:82
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:83
//#
// PORT: SOURCE P20-P25.agc:84
//#	SRCHOPT, RNDVZFLG, ACMODFLG, VEHUPFLG, UPDATFLG, TRACKFLG
// PORT: SOURCE P20-P25.agc:85
//#
// PORT: SOURCE P20-P25.agc:86
//# DEBRIS
// PORT: SOURCE P20-P25.agc:87
//#
// PORT: SOURCE P20-P25.agc:88
//#	CENTRALS -- A,Q,L
// PORT: SOURCE P20-P25.agc:89
//
// PORT: SOURCE P20-P25.agc:90
//		SBANK=	LOWSUPER	# FOR LOW 2CADR'S.
// PORT: SOURCE P20-P25.agc:91
//
// PORT: SOURCE P20-P25.agc:92
//		BANK	33
// PORT: SOURCE P20-P25.agc:93
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:94
//		BANK
// PORT: SOURCE P20-P25.agc:95
//
// PORT: SOURCE P20-P25.agc:96
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:97
//		COUNT*	$$/P20
// PORT: SOURCE P20-P25.agc:98
//PROG22		=	PROG20
// PORT: SOURCE P20-P25.agc:99
//PROG20		TC	2PHSCHNG
// PORT: Fixed ROM slots 22528.
    if slot <> 22528 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1394] to agcAotUnit1394@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:100
//		OCT	4
// PORT: Fixed ROM slots 22529.
    22529, 8,
// PORT: SOURCE P20-P25.agc:101
//		OCT	05022
// PORT: Fixed ROM slots 22530.
    22530, 5156,
// PORT: SOURCE P20-P25.agc:102
//		OCT	26000		# PRIORITY 26
// PORT: Fixed ROM slots 22531.
    22531, 22528
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22532–22535.
function agcAotUnit1395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22533 {
        if slot <= 22532 {
// PORT: SOURCE P20-P25.agc:103
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE
// PORT: Fixed ROM slots 22532.
            if slot <> 22532 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:104
//# Page 493
// PORT: SOURCE P20-P25.agc:105
//		TC	ORBCHGO		# YES
// PORT: Fixed ROM slots 22533.
            if slot <> 22533 or instruction <> 1031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1031, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22534 {
// PORT: SOURCE P20-P25.agc:106
//		TC	PROG20A -2	# NO -- CONTINUE WITH P20
// PORT: Fixed ROM slots 22534.
            if slot <> 22534 or instruction <> 1054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:107
//ORBCHGO		TC	UPFLAG		# SET VEHUPFLG -- CSM STATE
// PORT: Fixed ROM slots 22535.
            if slot <> 22535 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1395] to agcAotUnit1395@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:108
//		ADRES	VEHUPFLG	# VECTOR TO BE UPDATED
// PORT: Fixed ROM slots 22536.
    22536, 44
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22537–22540.
function agcAotUnit1396 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22538 {
        if slot <= 22537 {
// PORT: SOURCE P20-P25.agc:109
//		CAF	ONE		# SET R2 FOR OPTION CSM WILL NOT
// PORT: Fixed ROM slots 22537.
            if slot <> 22537 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:110
//		TS	OPTION2		# CHANGE PRESENT ORBIT
// PORT: Fixed ROM slots 22538.
            if slot <> 22538 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22539 {
// PORT: SOURCE P20-P25.agc:111
//		CAF	OCT00012
// PORT: Fixed ROM slots 22539.
            if slot <> 22539 or instruction <> 13513 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1225), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:112
//		TC	BANKCALL	# DISPLAY ASSUMED CSM ORBIT OPTION
// PORT: Fixed ROM slots 22540.
            if slot <> 22540 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1396] to agcAotUnit1396@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:113
//		CADR	GOPERF4
// PORT: Fixed ROM slots 22541.
    22541, 17206
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22542–22550.
function agcAotUnit1397 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22545 {
        if slot <= 22543 {
            if slot <= 22542 {
// PORT: SOURCE P20-P25.agc:114
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 22542.
                if slot <> 22542 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:115
//		TC	ORBCHG1		# PROCEED VALUE OF ASSUMED OPTION OK
// PORT: Fixed ROM slots 22543.
                if slot <> 22543 or instruction <> 1041 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1041, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22544 {
// PORT: SOURCE P20-P25.agc:116
//		TC	-5		# R2 LOADED THRU DSKY
// PORT: Fixed ROM slots 22544.
                if slot <> 22544 or instruction <> 1035 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1035, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:117
//ORBCHG1		CS	P22ONE
// PORT: Fixed ROM slots 22545.
                if slot <> 22545 or instruction <> 17610 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1226), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22547 {
            if slot <= 22546 {
// PORT: SOURCE P20-P25.agc:118
//		AD	OPTION2
// PORT: Fixed ROM slots 22546.
                if slot <> 22546 or instruction <> 25189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:119
//		EXTEND
// PORT: Fixed ROM slots 22547.
                if slot <> 22547 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22548 {
// PORT: SOURCE P20-P25.agc:120
//		BZF	PROG20A
// PORT: Fixed ROM slots 22548.
                if slot <> 22548 or instruction <> 5152 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5152, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22549 {
// PORT: SOURCE P20-P25.agc:121
//		CAF	V06N33*
// PORT: Fixed ROM slots 22549.
                    if slot <> 22549 or instruction <> 13517 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1229), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:122
//		TC	BANKCALL	# FLASH VERB-NOUN TO REQUEST ESTIMATED
// PORT: Fixed ROM slots 22550.
                    if slot <> 22550 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1397] to agcAotUnit1397@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:123
//		CADR	GOFLASH		# TIME OF LAUNCH
// PORT: Fixed ROM slots 22551.
    22551, 17020
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22552–22555.
function agcAotUnit1398 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22553 {
        if slot <= 22552 {
// PORT: SOURCE P20-P25.agc:124
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 22552.
            if slot <> 22552 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:125
//		TC	ORBCHG2		# PROCEED VALUES OK
// PORT: Fixed ROM slots 22553.
            if slot <> 22553 or instruction <> 1051 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1051, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22554 {
// PORT: SOURCE P20-P25.agc:126
//		TC	-5		# TIME LOADED THRU DSKY
// PORT: Fixed ROM slots 22554.
            if slot <> 22554 or instruction <> 1045 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1045, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:127
//ORBCHG2		TC	INTPRET
// PORT: Fixed ROM slots 22555.
            if slot <> 22555 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1398] to agcAotUnit1398@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:128
//		GOTO
// PORT: Fixed ROM slots 22556.
    22556, 65360,
// PORT: SOURCE P20-P25.agc:129
//			ORBCHG3
// PORT: Fixed ROM slots 22557.
    22557, 53534,
// PORT: SOURCE P20-P25.agc:130
//	 	BANK	32
// PORT: SOURCE P20-P25.agc:131
//		SETLOC	P20S4
// PORT: SOURCE P20-P25.agc:132
//		BANK
// PORT: SOURCE P20-P25.agc:133
//		COUNT*	$$/P20
// PORT: SOURCE P20-P25.agc:134
//
// PORT: SOURCE P20-P25.agc:135
//ORBCHG3		CALL
// PORT: Fixed ROM slots 28815.
    28815, 65320,
// PORT: SOURCE P20-P25.agc:136
//			INTSTALL
// PORT: Fixed ROM slots 28816.
    28816, 24088,
// PORT: SOURCE P20-P25.agc:137
//		DLOAD
// PORT: Fixed ROM slots 28817.
    28817, 65482,
// PORT: SOURCE P20-P25.agc:138
//			TIG
// PORT: Fixed ROM slots 28818.
    28818, 3652,
// PORT: SOURCE P20-P25.agc:139
//		STORE	LNCHTM
// PORT: Fixed ROM slots 28819.
    28819, 3938,
// PORT: SOURCE P20-P25.agc:140
//		STORE	TDEC1		# ESTIMATED LAUNCH TIME
// PORT: Fixed ROM slots 28820.
    28820, 66,
// PORT: SOURCE P20-P25.agc:141
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 28821.
    28821, 35864,
// PORT: SOURCE P20-P25.agc:142
//			VINTFLAG	# LM INTEGRATION
// PORT: Fixed ROM slots 28822.
    28822, 1912,
// PORT: SOURCE P20-P25.agc:143
//			INTYPFLG	# PRECISION -- ENCKE
// PORT: Fixed ROM slots 28823.
    28823, 1910,
// PORT: SOURCE P20-P25.agc:144
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 28824.
    28824, 35864,
// PORT: SOURCE P20-P25.agc:145
//			DIM0FLAG	# NO W-MATRIX
// PORT: Fixed ROM slots 28825.
    28825, 1916,
// PORT: SOURCE P20-P25.agc:146
//			D6OR9FLG
// PORT: Fixed ROM slots 28826.
    28826, 1914,
// PORT: SOURCE P20-P25.agc:147
//		CALL
// PORT: Fixed ROM slots 28827.
    28827, 65320,
// PORT: SOURCE P20-P25.agc:148
//			INTEGRV		# PLANETARY INERTIAL ORIENTATION
// PORT: Fixed ROM slots 28828.
    28828, 23736,
// PORT: SOURCE P20-P25.agc:149
//		CALL
// PORT: Fixed ROM slots 28829.
    28829, 65320,
// PORT: SOURCE P20-P25.agc:150
//			GRP2PC
// PORT: Fixed ROM slots 28830.
    28830, 9544,
// PORT: SOURCE P20-P25.agc:151
//		VLOAD
// PORT: Fixed ROM slots 28831.
    28831, 65530,
// PORT: SOURCE P20-P25.agc:152
//			RATT1
// PORT: Fixed ROM slots 28832.
    28832, 30,
// PORT: SOURCE P20-P25.agc:153
//		STODL	RSUBL		# SAVE LM POSITION
// PORT: Fixed ROM slots 28833.
    28833, 16178,
// PORT: SOURCE P20-P25.agc:154
//			TAT
// PORT: Fixed ROM slots 28834.
    28834, 26,
// PORT: SOURCE P20-P25.agc:155
//# Page 494
// PORT: SOURCE P20-P25.agc:156
//		STCALL	TDEC1
// PORT: Fixed ROM slots 28835.
    28835, 28738,
// PORT: SOURCE P20-P25.agc:157
//			INTSTALL
// PORT: Fixed ROM slots 28836.
    28836, 24088,
// PORT: SOURCE P20-P25.agc:158
//		SET	CLEAR
// PORT: Fixed ROM slots 28837.
    28837, 35864,
// PORT: SOURCE P20-P25.agc:159
//			VINTFLAG	# CSM INTEGRATION
// PORT: Fixed ROM slots 28838.
    28838, 1656,
// PORT: SOURCE P20-P25.agc:160
//			INTYPFLG
// PORT: Fixed ROM slots 28839.
    28839, 1910,
// PORT: SOURCE P20-P25.agc:161
//		CLEAR	BOFF
// PORT: Fixed ROM slots 28840.
    28840, 35864,
// PORT: SOURCE P20-P25.agc:162
//			DIM0FLAG
// PORT: Fixed ROM slots 28841.
    28841, 1916,
// PORT: SOURCE P20-P25.agc:163
//			RENDWFLG	# W MATRIX VALID
// PORT: Fixed ROM slots 28842.
    28842, 3036,
// PORT: SOURCE P20-P25.agc:164
//			NOWMATX		# NO
// PORT: Fixed ROM slots 28843.
    28843, 53598,
// PORT: SOURCE P20-P25.agc:165
//		SET	SET		# YES -- SET FOR W MATRIX
// PORT: Fixed ROM slots 28844.
    28844, 35864,
// PORT: SOURCE P20-P25.agc:166
//			DIM0FLAG
// PORT: Fixed ROM slots 28845.
    28845, 1660,
// PORT: SOURCE P20-P25.agc:167
//			D6OR9FLG
// PORT: Fixed ROM slots 28846.
    28846, 1658,
// PORT: SOURCE P20-P25.agc:168
//NOWMATX		CALL
// PORT: Fixed ROM slots 28847.
    28847, 65320,
// PORT: SOURCE P20-P25.agc:169
//			INTEGRV		# CSM INTEGRATION
// PORT: Fixed ROM slots 28848.
    28848, 23736,
// PORT: SOURCE P20-P25.agc:170
//		CALL
// PORT: Fixed ROM slots 28849.
    28849, 65320,
// PORT: SOURCE P20-P25.agc:171
//			GRP2PC
// PORT: Fixed ROM slots 28850.
    28850, 9544,
// PORT: SOURCE P20-P25.agc:172
//		VLOAD
// PORT: Fixed ROM slots 28851.
    28851, 65530,
// PORT: SOURCE P20-P25.agc:173
//			VATT1
// PORT: Fixed ROM slots 28852.
    28852, 42,
// PORT: SOURCE P20-P25.agc:174
//		STOVL	VSUBC		# SAVE CSM POSITION
// PORT: Fixed ROM slots 28853.
    28853, 22498,
// PORT: SOURCE P20-P25.agc:175
//			RATT1
// PORT: Fixed ROM slots 28854.
    28854, 30,
// PORT: SOURCE P20-P25.agc:176
//		STORE	RSUBC		# SAVE CSM POSITION
// PORT: Fixed ROM slots 28855.
    28855, 1156,
// PORT: SOURCE P20-P25.agc:177
//		VXV	UNIT		# COMPUTE NORMAL TO CSM ORBITAL PLANE
// PORT: Fixed ROM slots 28856.
    28856, 44602,
// PORT: SOURCE P20-P25.agc:178
//			VSUBC		# NSUB1=UNIT(R(CM) CROSS V(CM))
// PORT: Fixed ROM slots 28857.
    28857, 2018,
// PORT: SOURCE P20-P25.agc:179
//		STOVL	20D		# SAVE NSUB1
// PORT: Fixed ROM slots 28858.
    28858, 20522,
// PORT: SOURCE P20-P25.agc:180
//			RSUBL		# COMPUTE ESTIMATED ORBITAL
// PORT: Fixed ROM slots 28859.
    28859, 3890,
// PORT: SOURCE P20-P25.agc:181
//		VXV	UNIT		# PLANE CHANGE
// PORT: Fixed ROM slots 28860.
    28860, 44602,
// PORT: SOURCE P20-P25.agc:182
//			20D		# UCSM = UNIT(R(LM) CROSS NSUB1)
// PORT: Fixed ROM slots 28861.
    28861, 42,
// PORT: SOURCE P20-P25.agc:183
//		STOVL	UCSM
// PORT: Fixed ROM slots 28862.
    28862, 24382,
// PORT: SOURCE P20-P25.agc:184
//			RSUBC		# COMPUTE ANGLE BETWEEN UCSM
// PORT: Fixed ROM slots 28863.
    28863, 1156,
// PORT: SOURCE P20-P25.agc:185
//		UNIT	DOT		# AND RSUBC
// PORT: Fixed ROM slots 28864.
    28864, 41308,
// PORT: SOURCE P20-P25.agc:186
//			UCSM		# COS A = UCSM DOT UNIT (R(CM))
// PORT: Fixed ROM slots 28865.
    28865, 3902,
// PORT: SOURCE P20-P25.agc:187
//		SL1
// PORT: Fixed ROM slots 28866.
    28866, 65492,
// PORT: SOURCE P20-P25.agc:188
//		STORE	CSTH		# SAVE DOE TIME-THETA SUBROUTINE
// PORT: Fixed ROM slots 28867.
    28867, 2996,
// PORT: SOURCE P20-P25.agc:189
//		DSQ	BDSU		# COMPUTE SINE A
// PORT: Fixed ROM slots 28868.
    28868, 37276,
// PORT: SOURCE P20-P25.agc:190
//			ONEB-2
// PORT: Fixed ROM slots 28869.
    28869, 8600,
// PORT: SOURCE P20-P25.agc:191
//		SQRT
// PORT: Fixed ROM slots 28870.
    28870, 65516,
// PORT: SOURCE P20-P25.agc:192
//		STOVL	SNTH		# SAVE FOR TIME-THETA SUBROUTINE
// PORT: Fixed ROM slots 28871.
    28871, 23472,
// PORT: SOURCE P20-P25.agc:193
//			RSUBC		# POSITION OF CSM AT EST. LAUNCH
// PORT: Fixed ROM slots 28872.
    28872, 1156,
// PORT: SOURCE P20-P25.agc:194
//		STOVL	RVEC		# TIME FOR TIME-THETHA	B-27
// PORT: Fixed ROM slots 28873.
    28873, 23386,
// PORT: SOURCE P20-P25.agc:195
//			VSUBC		# VELOCITY OF CSM AT EST. LAUNCH.
// PORT: Fixed ROM slots 28874.
    28874, 2018,
// PORT: SOURCE P20-P25.agc:196
//		VCOMP
// PORT: Fixed ROM slots 28875.
    28875, 65404,
// PORT: SOURCE P20-P25.agc:197
//		STORE	VVEC		# TIME FOR TIME THETA 	B-5
// PORT: Fixed ROM slots 28876.
    28876, 3016,
// PORT: SOURCE P20-P25.agc:198
//		CLEAR	CALL
// PORT: Fixed ROM slots 28877.
    28877, 37912,
// PORT: SOURCE P20-P25.agc:199
//			RVSW
// PORT: Fixed ROM slots 28878.
    28878, 3948,
// PORT: SOURCE P20-P25.agc:200
//			TIMETHET
// PORT: Fixed ROM slots 28879.
    28879, 21428,
// PORT: SOURCE P20-P25.agc:201
//		VCOMP
// PORT: Fixed ROM slots 28880.
    28880, 65404,
// PORT: SOURCE P20-P25.agc:202
//		STORE	NEWVEL		# TERMINAL VELOCITY OF CSM
// PORT: Fixed ROM slots 28881.
    28881, 3914,
// PORT: SOURCE P20-P25.agc:203
//		DLOAD
// PORT: Fixed ROM slots 28882.
    28882, 65482,
// PORT: SOURCE P20-P25.agc:204
//			T
// PORT: Fixed ROM slots 28883.
    28883, 62,
// PORT: SOURCE P20-P25.agc:205
//		STOVL	TRANSTM		# TRANSFER TIME
// PORT: Fixed ROM slots 28884.
    28884, 24422,
// PORT: SOURCE P20-P25.agc:206
//# Page 495
// PORT: SOURCE P20-P25.agc:207
//			NEWVEL
// PORT: Fixed ROM slots 28885.
    28885, 3914,
// PORT: SOURCE P20-P25.agc:208
//		ABVAL
// PORT: Fixed ROM slots 28886.
    28886, 65356,
// PORT: SOURCE P20-P25.agc:209
//		STOVL	20D
// PORT: Fixed ROM slots 28887.
    28887, 20522,
// PORT: SOURCE P20-P25.agc:210
//			0D
// PORT: Fixed ROM slots 28888.
    28888, 2,
// PORT: SOURCE P20-P25.agc:211
//		STORE	NEWPOS		# TERMINAL POSITION OF CSM
// PORT: Fixed ROM slots 28889.
    28889, 3926,
// PORT: SOURCE P20-P25.agc:212
//		VXV	UNIT		# COMPUTE NORMAL TO SCM ORBITAL PLANE
// PORT: Fixed ROM slots 28890.
    28890, 44602,
// PORT: SOURCE P20-P25.agc:213
//			RSUBL		# NSUB2 = UNIT(NEWPOS CROSS R(LM))
// PORT: Fixed ROM slots 28891.
    28891, 3890,
// PORT: SOURCE P20-P25.agc:214
//		VXV	UNIT		# ROTATE TERMINAL VEL INTO DESIRED
// PORT: Fixed ROM slots 28892.
    28892, 44602,
// PORT: SOURCE P20-P25.agc:215
//			NEWPOS		# ORBITAL PLANE
// PORT: Fixed ROM slots 28893.
    28893, 3926,
// PORT: SOURCE P20-P25.agc:216
//		VXSC	VSL1		# VSUBC = ABVAL(NEWVEL) $ UNIT (NSUB2
// PORT: Fixed ROM slots 28894.
    28894, 64226,
// PORT: SOURCE P20-P25.agc:217
//			20D
// PORT: Fixed ROM slots 28895.
    28895, 42,
// PORT: SOURCE P20-P25.agc:218
//		STCALL	NCSMVEL		# NEW CSM VELOCITY
// PORT: Fixed ROM slots 28896.
    28896, 32618,
// PORT: SOURCE P20-P25.agc:219
//			GRP2PC
// PORT: Fixed ROM slots 28897.
    28897, 9544,
// PORT: SOURCE P20-P25.agc:220
//		CALL
// PORT: Fixed ROM slots 28898.
    28898, 65320,
// PORT: SOURCE P20-P25.agc:221
//			INTSTALL
// PORT: Fixed ROM slots 28899.
    28899, 24088,
// PORT: SOURCE P20-P25.agc:222
//		DLOAD	BDSU
// PORT: Fixed ROM slots 28900.
    28900, 37322,
// PORT: SOURCE P20-P25.agc:223
//			TRANSTM		# LAUNCH TIME -- TRANSFER TIME
// PORT: Fixed ROM slots 28901.
    28901, 3942,
// PORT: SOURCE P20-P25.agc:224
//			LNCHTM
// PORT: Fixed ROM slots 28902.
    28902, 3938,
// PORT: SOURCE P20-P25.agc:225
//		STOVL	TET
// PORT: Fixed ROM slots 28903.
    28903, 22174,
// PORT: SOURCE P20-P25.agc:226
//			NEWPOS
// PORT: Fixed ROM slots 28904.
    28904, 3926,
// PORT: SOURCE P20-P25.agc:227
//		STORE	RCV
// PORT: Fixed ROM slots 28905.
    28905, 1722,
// PORT: SOURCE P20-P25.agc:228
//		STOVL	RRECT
// PORT: Fixed ROM slots 28906.
    28906, 22150,
// PORT: SOURCE P20-P25.agc:229
//			NCSMVEL
// PORT: Fixed ROM slots 28907.
    28907, 3946,
// PORT: SOURCE P20-P25.agc:230
//		STCALL	VRECT
// PORT: Fixed ROM slots 28908.
    28908, 30354,
// PORT: SOURCE P20-P25.agc:231
//			MINIRECT
// PORT: Fixed ROM slots 28909.
    28909, 20058,
// PORT: SOURCE P20-P25.agc:232
//		AXT,2	CALL
// PORT: Fixed ROM slots 28910.
    28910, 38136,
// PORT: SOURCE P20-P25.agc:233
//			2
// PORT: Fixed ROM slots 28911.
    28911, 4,
// PORT: SOURCE P20-P25.agc:234
//			ATOPCSM
// PORT: Fixed ROM slots 28912.
    28912, 23394,
// PORT: SOURCE P20-P25.agc:235
//		CALL
// PORT: Fixed ROM slots 28913.
    28913, 65320,
// PORT: SOURCE P20-P25.agc:236
//			INTWAKE0
// PORT: Fixed ROM slots 28914.
    28914, 24102,
// PORT: SOURCE P20-P25.agc:237
//		EXIT
// PORT: Fixed ROM slots 28915.
    28915, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28916–28916.
function agcAotUnit1847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:238
//		TC	BANKCALL
// PORT: Fixed ROM slots 28916.
    if slot <> 28916 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1847] to agcAotUnit1847@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:239
//		CADR	PROG20A
// PORT: Fixed ROM slots 28917.
    28917, 41024
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22558–22558.
function agcAotUnit1399 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:240
//
// PORT: SOURCE P20-P25.agc:241
//		BANK	24
// PORT: SOURCE P20-P25.agc:242
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:243
//		BANK
// PORT: SOURCE P20-P25.agc:244
//		COUNT*	$$/P20
// PORT: SOURCE P20-P25.agc:245
//
// PORT: SOURCE P20-P25.agc:246
//		TC	DOWNFLAG	# RESET VEHUPFLG -- LM STATE VECTOR
// PORT: Fixed ROM slots 22558.
    if slot <> 22558 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1399] to agcAotUnit1399@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:247
//		ADRES	VEHUPFLG	# TO BE UPDATED
// PORT: Fixed ROM slots 22559.
    22559, 44
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22560–22560.
function agcAotUnit1400 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:248
//PROG20A		TC	BANKCALL
// PORT: Fixed ROM slots 22560.
    if slot <> 22560 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1400] to agcAotUnit1400@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:249
//		CADR	R02BOTH
// PORT: Fixed ROM slots 22561.
    22561, 9560
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22562–22562.
function agcAotUnit1401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:250
//		TC	UPFLAG
// PORT: Fixed ROM slots 22562.
    if slot <> 22562 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1401] to agcAotUnit1401@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:251
//		ADRES	UPDATFLG	# SET UPDATE FLAG
// PORT: Fixed ROM slots 22563.
    22563, 46
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22564–22564.
function agcAotUnit1402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:252
//		TC	UPFLAG
// PORT: Fixed ROM slots 22564.
    if slot <> 22564 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1402] to agcAotUnit1402@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:253
//		ADRES	TRACKFLG	# SET TRACK FLAG
// PORT: Fixed ROM slots 22565.
    22565, 50
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22566–22566.
function agcAotUnit1403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:254
//		TC	UPFLAG
// PORT: Fixed ROM slots 22566.
    if slot <> 22566 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1403] to agcAotUnit1403@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:255
//		ADRES	RNDVZFLG	# SET RENDEZVOUS FLAG
// PORT: Fixed ROM slots 22567.
    22567, 16
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22568–22568.
function agcAotUnit1404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:256
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 22568.
    if slot <> 22568 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1404] to agcAotUnit1404@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:257
//		ADRES	SRCHOPTN	# INSURE SEARCH OPTION OFF
// PORT: Fixed ROM slots 22569.
    22569, 62
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22570–22570.
function agcAotUnit1405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:258
//# Page 496
// PORT: SOURCE P20-P25.agc:259
//		TC	DOWNFLAG	# ALSO MANUAL ACQUISITION FLAG RESET
// PORT: Fixed ROM slots 22570.
    if slot <> 22570 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1405] to agcAotUnit1405@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:260
//		ADRES	ACMODFLG
// PORT: Fixed ROM slots 22571.
    22571, 64
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22572–22572.
function agcAotUnit1406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:261
//		TC	DOWNFLAG	# TURN OFF R04FLAG TO ENSURE GETTING
// PORT: Fixed ROM slots 22572.
    if slot <> 22572 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1406] to agcAotUnit1406@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:262
//		ADRES	R04FLAG		# ALARM 521 IF CAN'T READ RADAR
// PORT: Fixed ROM slots 22573.
    22573, 102
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22574–22574.
function agcAotUnit1407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:263
//		TC	DOWNFLAG	# ENSURE R25 GIMBAL MONITOR IS ENABLED
// PORT: Fixed ROM slots 22574.
    if slot <> 22574 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1407] to agcAotUnit1407@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:264
//		ADRES	NORRMON		# (RESET NORRMON FLAG)
// PORT: Fixed ROM slots 22575.
    22575, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22576–22576.
function agcAotUnit1408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:265
//		TC	DOWNFLAG	# RESET LOS BEING COMPUTED FLAG
// PORT: Fixed ROM slots 22576.
    if slot <> 22576 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1408] to agcAotUnit1408@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:266
//		ADRES	LOSCMFLG
// PORT: Fixed ROM slots 22577.
    22577, 66
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22578–22579.
function agcAotUnit1409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22578 {
// PORT: SOURCE P20-P25.agc:267
//		TC	CLRADMOD
// PORT: Fixed ROM slots 22578.
        if slot <> 22578 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:268
//P20LEM1		TC	PHASCHNG
// PORT: Fixed ROM slots 22579.
        if slot <> 22579 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1409] to agcAotUnit1409@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:269
//		OCT	04022
// PORT: Fixed ROM slots 22580.
    22580, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22581–22583.
function agcAotUnit1410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22581 {
// PORT: SOURCE P20-P25.agc:270
//		CAF	ZERO		# ZERO MARK COUNTER
// PORT: Fixed ROM slots 22581.
        if slot <> 22581 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22582 {
// PORT: SOURCE P20-P25.agc:271
//		TS	MARKCTR
// PORT: Fixed ROM slots 22582.
            if slot <> 22582 or instruction <> 23346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23346, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:272
//		TC	INTPRET		# LOS DETERMINATION ROUTINE
// PORT: Fixed ROM slots 22583.
            if slot <> 22583 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1410] to agcAotUnit1410@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:273
//		RTB
// PORT: Fixed ROM slots 22584.
    22584, 65336,
// PORT: SOURCE P20-P25.agc:274
//			LOADTIME
// PORT: Fixed ROM slots 22585.
    22585, 18166,
// PORT: SOURCE P20-P25.agc:275
//		STCALL	TDEC1
// PORT: Fixed ROM slots 22586.
    22586, 28738,
// PORT: SOURCE P20-P25.agc:276
//			LPS20.1
// PORT: Fixed ROM slots 22587.
    22587, 42330,
// PORT: SOURCE P20-P25.agc:277
//		CALL
// PORT: Fixed ROM slots 22588.
    22588, 65320,
// PORT: SOURCE P20-P25.agc:278
//			LPS20.2		# TEST RANGE R/UTINE
// PORT: Fixed ROM slots 22589.
    22589, 44778,
// PORT: SOURCE P20-P25.agc:279
//		EXIT
// PORT: Fixed ROM slots 22590.
    22590, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22591–22591.
function agcAotUnit1411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:280
//		INDEX	MPAC
// PORT: Fixed ROM slots 22591.
    if slot <> 22591 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1411] to agcAotUnit1411@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:281
//		TC	+1
// PORT: Fixed ROM slots 22592.
    22592, 2178
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22593–22595.
function agcAotUnit1412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22593 {
// PORT: SOURCE P20-P25.agc:282
//		TC	P20LEMA		# NORMAL RETURN WITHIN 400 N M
// PORT: Fixed ROM slots 22593.
        if slot <> 22593 or instruction <> 1097 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1097, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22594 {
// PORT: SOURCE P20-P25.agc:283
//526ALARM	CAF	ALRM526		# ERROR EXIT -- RANGE > 400 N. MI.
// PORT: Fixed ROM slots 22594.
            if slot <> 22594 or instruction <> 13509 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1221), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:284
//		TC	BANKCALL
// PORT: Fixed ROM slots 22595.
            if slot <> 22595 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1412] to agcAotUnit1412@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:285
//		CADR	PRIOLARM
// PORT: Fixed ROM slots 22596.
    22596, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22597–22601.
function agcAotUnit1413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22598 {
        if slot <= 22597 {
// PORT: SOURCE P20-P25.agc:286
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// PORT: Fixed ROM slots 22597.
            if slot <> 22597 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:287
//		TC	-4		# PROC (ILLEGAL)
// PORT: Fixed ROM slots 22598.
            if slot <> 22598 or instruction <> 1090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22599 {
// PORT: SOURCE P20-P25.agc:288
//		TC	P20LEM1		# ENTER RECYCLE
// PORT: Fixed ROM slots 22599.
            if slot <> 22599 or instruction <> 1075 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1075, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22600 {
// PORT: SOURCE P20-P25.agc:289
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22600.
                if slot <> 22600 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:290
//
// PORT: SOURCE P20-P25.agc:291
//P20LEMA		TC	PHASCHNG
// PORT: Fixed ROM slots 22601.
                if slot <> 22601 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1413] to agcAotUnit1413@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:292
//		OCT	04022
// PORT: Fixed ROM slots 22602.
    22602, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22603–22605.
function agcAotUnit1414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22603 {
// PORT: SOURCE P20-P25.agc:293
//		TC	LUNSFCHK	# CHECK LUNAR SURFACE FLAG (P22 FLAG)
// PORT: Fixed ROM slots 22603.
        if slot <> 22603 or instruction <> 1463 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1463, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22604 {
// PORT: SOURCE P20-P25.agc:294
//		TC	P20LEMB
// PORT: Fixed ROM slots 22604.
            if slot <> 22604 or instruction <> 1103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:295
//		TC	BANKCALL
// PORT: Fixed ROM slots 22605.
            if slot <> 22605 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1414] to agcAotUnit1414@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:296
//		CADR	R61LEM		# PREFERRED TRACKING ATTITUDE ROUTINE
// PORT: Fixed ROM slots 22606.
    22606, 39068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22607–22607.
function agcAotUnit1415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:297
//P20LEMB		TC	PHASCHNG
// PORT: Fixed ROM slots 22607.
    if slot <> 22607 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1415] to agcAotUnit1415@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:298
//		OCT	05022		# RESTART AT PRIORITY 10 TO ALLOW V37
// PORT: Fixed ROM slots 22608.
    22608, 5156,
// PORT: SOURCE P20-P25.agc:299
//		OCT	10000		# REQUESTED PROGRAM TO RUN FIRST
// PORT: Fixed ROM slots 22609.
    22609, 8192
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22610–22629.
function agcAotUnit1416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22619 {
        if slot <= 22614 {
            if slot <= 22611 {
                if slot <= 22610 {
// PORT: SOURCE P20-P25.agc:300
//		CAF	PRIO26		# RESTORE PRIORITY 26
// PORT: Fixed ROM slots 22610.
                    if slot <> 22610 or instruction <> 16332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:301
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 22611.
                    if slot <> 22611 or instruction <> 2662 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2662, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22612 {
// PORT: SOURCE P20-P25.agc:302
//		CA	FLAGWRD1	# IS THE TRACK FLAG SET
// PORT: Fixed ROM slots 22612.
                    if slot <> 22612 or instruction <> 12349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22613 {
// PORT: SOURCE P20-P25.agc:303
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 22613.
                        if slot <> 22613 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:304
//		EXTEND
// PORT: Fixed ROM slots 22614.
                        if slot <> 22614 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22616 {
                if slot <= 22615 {
// PORT: SOURCE P20-P25.agc:305
//		BZF	P20LEMWT	# BRANCH -- NO -- WAIT FOR IT TO BE SET
// PORT: Fixed ROM slots 22615.
                    if slot <> 22615 or instruction <> 5274 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5274, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:306
//P20LEMB7	CAF	BIT2		# IS RR AUTO MODE DISCRETE PRESENT
// PORT: Fixed ROM slots 22616.
                    if slot <> 22616 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                if slot <= 22617 {
// PORT: SOURCE P20-P25.agc:307
//		EXTEND
// PORT: Fixed ROM slots 22617.
                    if slot <> 22617 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22618 {
// PORT: SOURCE P20-P25.agc:308
//# Page 497
// PORT: SOURCE P20-P25.agc:309
//		RAND	CHAN33
// PORT: Fixed ROM slots 22618.
                        if slot <> 22618 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:310
//		EXTEND
// PORT: Fixed ROM slots 22619.
                        if slot <> 22619 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 22624 {
            if slot <= 22621 {
                if slot <= 22620 {
// PORT: SOURCE P20-P25.agc:311
//		BZF	P20LEMB3	# YES -- DO AUTOMATIC ACQUISITION (R21)
// PORT: Fixed ROM slots 22620.
                    if slot <> 22620 or instruction <> 5240 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5240, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:312
//
// PORT: SOURCE P20-P25.agc:313
//P20LEMB5	CS	OCT24		# RADAR NOT IN AUTO CHECK IF
// PORT: Fixed ROM slots 22621.
                    if slot <> 22621 or instruction <> 19463 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22622 {
// PORT: SOURCE P20-P25.agc:314
//		AD	MODREG		# MAJOR MODE IS 20
// PORT: Fixed ROM slots 22622.
                    if slot <> 22622 or instruction <> 25097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22623 {
// PORT: SOURCE P20-P25.agc:315
//		EXTEND
// PORT: Fixed ROM slots 22623.
                        if slot <> 22623 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:316
//		BZF	P20LEMB6	# BRANCH -- YES -- OKAY TO DO PLEASE PERFORM
// PORT: Fixed ROM slots 22624.
                        if slot <> 22624 or instruction <> 5227 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22626 {
                if slot <= 22625 {
// PORT: SOURCE P20-P25.agc:317
//
// PORT: SOURCE P20-P25.agc:318
//		AD	NEG2		# ALSO CHECK FOR P22
// PORT: Fixed ROM slots 22625.
                    if slot <> 22625 or instruction <> 28646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:319
//		EXTEND
// PORT: Fixed ROM slots 22626.
                    if slot <> 22626 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22627 {
// PORT: SOURCE P20-P25.agc:320
//		BZF	P20LEMB6	# BRANCH -- YES OK TO DO PLEASE PERFORM
// PORT: Fixed ROM slots 22627.
                    if slot <> 22627 or instruction <> 5227 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5227, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22628 {
// PORT: SOURCE P20-P25.agc:321
//		CAF	ALRM514		# TRACK FLAG SET -- FLASH PRIORITY ALARM 514 --
// PORT: Fixed ROM slots 22628.
                        if slot <> 22628 or instruction <> 13511 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1223), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:322
//		TC	BANKCALL	# RADAR GOES OUT OF AUTO MODE WHILE IN USE
// PORT: Fixed ROM slots 22629.
                        if slot <> 22629 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1416] to agcAotUnit1416@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:323
//		CADR	PRIOLARM
// PORT: Fixed ROM slots 22630.
    22630, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22631–22636.
function agcAotUnit1417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22633 {
        if slot <= 22631 {
// PORT: SOURCE P20-P25.agc:324
//		TC	GOTOV56		# TERMINATE EXITS VIA V56
// PORT: Fixed ROM slots 22631.
            if slot <> 22631 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22632 {
// PORT: SOURCE P20-P25.agc:325
//		TC	P20LEMB		# PROCEED AND ENTER BOTH GO BACK
// PORT: Fixed ROM slots 22632.
                if slot <> 22632 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:326
//		TC	P20LEMB		# TO CHECK AUTO MODE AGAIN
// PORT: Fixed ROM slots 22633.
                if slot <> 22633 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22634 {
// PORT: SOURCE P20-P25.agc:327
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22634.
            if slot <> 22634 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22635 {
// PORT: SOURCE P20-P25.agc:328
//P20LEMB6	CAF	OCT201		# REQUEST RR AUTO MODE SELECTION
// PORT: Fixed ROM slots 22635.
                if slot <> 22635 or instruction <> 13510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1222), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:329
//		TC	BANKCALL
// PORT: Fixed ROM slots 22636.
                if slot <> 22636 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1417] to agcAotUnit1417@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:330
//		CADR	GOPERF1
// PORT: Fixed ROM slots 22637.
    22637, 17190
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22638–22643.
function agcAotUnit1418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22640 {
        if slot <= 22638 {
// PORT: SOURCE P20-P25.agc:331
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// PORT: Fixed ROM slots 22638.
            if slot <> 22638 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22639 {
// PORT: SOURCE P20-P25.agc:332
//		TC	P20LEMB		# PROCEED CHECKS AUTO MODE DISCRETE AGAIN
// PORT: Fixed ROM slots 22639.
                if slot <> 22639 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:333
//		TC	LUNSFCHK	# ENTER INDICATES MANUAL ACQUISITION (R23)
// PORT: Fixed ROM slots 22640.
                if slot <> 22640 or instruction <> 1463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22641 {
// PORT: SOURCE P20-P25.agc:334
//		TC	P20LEMB2	# YES -- R23 NOT ALLOWED -- TURN ON OPR ERROR
// PORT: Fixed ROM slots 22641.
            if slot <> 22641 or instruction <> 1142 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1142, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22642 {
// PORT: SOURCE P20-P25.agc:335
//		TC	R23LEM		# NO -- DO MANUAL ACQUISITION
// PORT: Fixed ROM slots 22642.
                if slot <> 22642 or instruction <> 1629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:336
//
// PORT: SOURCE P20-P25.agc:337
//P20LEMB1	TC	UPFLAG		# RETURN FROM R23 -- LOCKON ACHIEVED
// PORT: Fixed ROM slots 22643.
                if slot <> 22643 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1418] to agcAotUnit1418@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:338
//		ADRES	ACMODFLG	# SET MANUAL FLAG AND GO BACK TO CHECK
// PORT: Fixed ROM slots 22644.
    22644, 64
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22645–22656.
function agcAotUnit1419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22650 {
        if slot <= 22647 {
            if slot <= 22645 {
// PORT: SOURCE P20-P25.agc:339
//		TC	P20LEMB		# RR AUTO MODE
// PORT: Fixed ROM slots 22645.
                if slot <> 22645 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22646 {
// PORT: SOURCE P20-P25.agc:340
//
// PORT: SOURCE P20-P25.agc:341
//P20LEMB2	TC	FALTON		# TURNS ON OPERATOR ERROR LIGHT ON DSKY
// PORT: Fixed ROM slots 22646.
                    if slot <> 22646 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:342
//		TC	P20LEMB		# AND GOES BACK TO CHECK AUTO MODE
// PORT: Fixed ROM slots 22647.
                    if slot <> 22647 or instruction <> 1103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22648 {
// PORT: SOURCE P20-P25.agc:343
//
// PORT: SOURCE P20-P25.agc:344
//P20LEMB3	CS	RADMODES	# ARE RR CDUS BEING ZEROED
// PORT: Fixed ROM slots 22648.
                if slot <> 22648 or instruction <> 16456 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 72).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22649 {
// PORT: SOURCE P20-P25.agc:345
//		MASK	RCDU0BIT
// PORT: Fixed ROM slots 22649.
                    if slot <> 22649 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:346
//		EXTEND
// PORT: Fixed ROM slots 22650.
                    if slot <> 22650 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22653 {
            if slot <= 22651 {
// PORT: SOURCE P20-P25.agc:347
//		BZF	P20LEMB4	# BRANCH -- YES -- WAIT
// PORT: Fixed ROM slots 22651.
                if slot <> 22651 or instruction <> 5253 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5253, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22652 {
// PORT: SOURCE P20-P25.agc:348
//		CAF	BIT13-14	# IS SEARCH OR MANUAL ACQUISITION FLAG SET
// PORT: Fixed ROM slots 22652.
                    if slot <> 22652 or instruction <> 14573 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:349
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 22653.
                    if slot <> 22653 or instruction <> 28734 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22654 {
// PORT: SOURCE P20-P25.agc:350
//		EXTEND
// PORT: Fixed ROM slots 22654.
                if slot <> 22654 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22655 {
// PORT: SOURCE P20-P25.agc:351
//		BZF	P20LEMC3	# ZERO MEANS AUTOMATIC RR ACQUISITION
// PORT: Fixed ROM slots 22655.
                    if slot <> 22655 or instruction <> 5257 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5257, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:352
//		TC	DOWNFLAG	# RESET TO AUTO MODE
// PORT: Fixed ROM slots 22656.
                    if slot <> 22656 or instruction <> 2894 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2894, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1419] to agcAotUnit1419@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:353
//		ADRES	SRCHOPTN
// PORT: Fixed ROM slots 22657.
    22657, 62
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22658–22658.
function agcAotUnit1420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:354
//# Page 498
// PORT: SOURCE P20-P25.agc:355
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 22658.
    if slot <> 22658 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1420] to agcAotUnit1420@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:356
//		ADRES	ACMODFLG
// PORT: Fixed ROM slots 22659.
    22659, 64
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22660–22662.
function agcAotUnit1421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22660 {
// PORT: SOURCE P20-P25.agc:357
//		TC	P20LEMWT	# WAIT 2.5 SECONDS THEN GO TO RR DATA READ
// PORT: Fixed ROM slots 22660.
        if slot <> 22660 or instruction <> 1178 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1178, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22661 {
// PORT: SOURCE P20-P25.agc:358
//
// PORT: SOURCE P20-P25.agc:359
//P20LEMB4	CAF	250DEC
// PORT: Fixed ROM slots 22661.
            if slot <> 22661 or instruction <> 13508 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1220), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:360
//		TC	BANKCALL	# WAIT 2.5 SECONDS WHILE RR CDUS ARE BEING
// PORT: Fixed ROM slots 22662.
            if slot <> 22662 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1421] to agcAotUnit1421@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:361
//		CADR	DELAYJOB	# ZEROED -- THEN GO BACK AND CHECK AGAIN
// PORT: Fixed ROM slots 22663.
    22663, 1978
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22664–22665.
function agcAotUnit1422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22664 {
// PORT: SOURCE P20-P25.agc:362
//		TC	P20LEMB3
// PORT: Fixed ROM slots 22664.
        if slot <> 22664 or instruction <> 1144 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1144, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:363
//
// PORT: SOURCE P20-P25.agc:364
//P20LEMC3	TC	INTPRET
// PORT: Fixed ROM slots 22665.
        if slot <> 22665 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1422] to agcAotUnit1422@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:365
//		RTB
// PORT: Fixed ROM slots 22666.
    22666, 65336,
// PORT: SOURCE P20-P25.agc:366
//			LOADTIME
// PORT: Fixed ROM slots 22667.
    22667, 18166,
// PORT: SOURCE P20-P25.agc:367
//		STCALL	TDEC1
// PORT: Fixed ROM slots 22668.
    22668, 28738,
// PORT: SOURCE P20-P25.agc:368
//			UPPSV
// PORT: Fixed ROM slots 22669.
    22669, 41372,
// PORT: SOURCE P20-P25.agc:369
//P20LEMC4	EXIT
// PORT: Fixed ROM slots 22670.
    22670, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22671–22671.
function agcAotUnit1423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:370
//P20LEMC		TC	PHASCHNG
// PORT: Fixed ROM slots 22671.
    if slot <> 22671 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1423] to agcAotUnit1423@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:371
//		OCT	04022
// PORT: Fixed ROM slots 22672.
    22672, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22673–22683.
function agcAotUnit1424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22677 {
        if slot <= 22674 {
            if slot <= 22673 {
// PORT: SOURCE P20-P25.agc:372
//		CAE	FLAGWRD0	# IS THE RENDEZVOUS FLAG SET
// PORT: Fixed ROM slots 22673.
                if slot <> 22673 or instruction <> 12348 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:373
//		MASK	RNDVZBIT
// PORT: Fixed ROM slots 22674.
                if slot <> 22674 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 22675 {
// PORT: SOURCE P20-P25.agc:374
//		EXTEND
// PORT: Fixed ROM slots 22675.
                if slot <> 22675 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22676 {
// PORT: SOURCE P20-P25.agc:375
//		BZF	ENDOFJOB	# NO -- EXIT P20
// PORT: Fixed ROM slots 22676.
                    if slot <> 22676 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:376
//		CAE	FLAGWRD1	# IS TRACK FLAG SET (BIT 5 FLAGWORD 1)
// PORT: Fixed ROM slots 22677.
                    if slot <> 22677 or instruction <> 12349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22680 {
            if slot <= 22678 {
// PORT: SOURCE P20-P25.agc:377
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 22678.
                if slot <> 22678 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
                if slot <= 22679 {
// PORT: SOURCE P20-P25.agc:378
//		EXTEND
// PORT: Fixed ROM slots 22679.
                    if slot <> 22679 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:379
//		BZF	P20LEMD		# BRANCH -- TRACK FLAG NOT ON -- WAIT 15 SECONDS
// PORT: Fixed ROM slots 22680.
                    if slot <> 22680 or instruction <> 5300 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5300, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22681 {
// PORT: SOURCE P20-P25.agc:380
//P20LEMF		TC	R21LEM
// PORT: Fixed ROM slots 22681.
                if slot <> 22681 or instruction <> 1468 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1468, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22682 {
// PORT: SOURCE P20-P25.agc:381
//
// PORT: SOURCE P20-P25.agc:382
//P20LEMWT	CAF	250DEC
// PORT: Fixed ROM slots 22682.
                    if slot <> 22682 or instruction <> 13508 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1220), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:383
//		TC	TWIDDLE		# USE INSTEAD OF WAITLIST SINCE SAME BANK
// PORT: Fixed ROM slots 22683.
                    if slot <> 22683 or instruction <> 2683 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1424] to agcAotUnit1424@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:384
//		ADRES	P20LEMC1	# WAIT 2.5 SECONDS
// PORT: Fixed ROM slots 22684.
    22684, 2376
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22685–22689.
function agcAotUnit1425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22686 {
        if slot <= 22685 {
// PORT: SOURCE P20-P25.agc:385
//		CAE	FLAGWRD1	# IS TRACK FLAG SET
// PORT: Fixed ROM slots 22685.
            if slot <> 22685 or instruction <> 12349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:386
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 22686.
            if slot <> 22686 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 22687 {
// PORT: SOURCE P20-P25.agc:387
//		EXTEND
// PORT: Fixed ROM slots 22687.
            if slot <> 22687 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22688 {
// PORT: SOURCE P20-P25.agc:388
//		BZF	ENDOFJOB	# NO -- EXIT WITHOUT DOING 2.7 PHASE CHANGE
// PORT: Fixed ROM slots 22688.
                if slot <> 22688 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:389
//P20LMWT1	TC	PHASCHNG
// PORT: Fixed ROM slots 22689.
                if slot <> 22689 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1425] to agcAotUnit1425@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:390
//		OCT	40072
// PORT: Fixed ROM slots 22690.
    22690, 32884
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22691–22701.
function agcAotUnit1426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22695 {
        if slot <= 22692 {
            if slot <= 22691 {
// PORT: SOURCE P20-P25.agc:391
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22691.
                if slot <> 22691 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:392
//
// PORT: SOURCE P20-P25.agc:393
//P20LEMC1	CAE	FLAGWRD0	# IS RENDEZVOUS FLAG SET
// PORT: Fixed ROM slots 22692.
                if slot <> 22692 or instruction <> 12348 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22693 {
// PORT: SOURCE P20-P25.agc:394
//		MASK	RNDVZBIT
// PORT: Fixed ROM slots 22693.
                if slot <> 22693 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                if slot <= 22694 {
// PORT: SOURCE P20-P25.agc:395
//		EXTEND
// PORT: Fixed ROM slots 22694.
                    if slot <> 22694 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:396
//		BZF	TASKOVER	# NO -- EXIT P20/R22
// PORT: Fixed ROM slots 22695.
                    if slot <> 22695 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22698 {
            if slot <= 22696 {
// PORT: SOURCE P20-P25.agc:397
//		CAE	FLAGWRD1	# IS TRACK FLAG SET
// PORT: Fixed ROM slots 22696.
                if slot <> 22696 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22697 {
// PORT: SOURCE P20-P25.agc:398
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 22697.
                    if slot <> 22697 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:399
//		EXTEND
// PORT: Fixed ROM slots 22698.
                    if slot <> 22698 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22699 {
// PORT: SOURCE P20-P25.agc:400
//		BZF	P20LEMC2	# NO -- DON'T SCHEDULE R22 JOB
// PORT: Fixed ROM slots 22699.
                if slot <> 22699 or instruction <> 5297 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5297, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22700 {
// PORT: SOURCE P20-P25.agc:401
//# Page 499
// PORT: SOURCE P20-P25.agc:402
//		CAF	PRIO26		# YES -- SCHEDULE R22 JOB (RR DATA READ)
// PORT: Fixed ROM slots 22700.
                    if slot <> 22700 or instruction <> 16332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:403
//		TC	FINDVAC
// PORT: Fixed ROM slots 22701.
                    if slot <> 22701 or instruction <> 2629 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1426] to agcAotUnit1426@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:404
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:405
//		2CADR	R22LEM42
// PORT: Fixed ROM slots 22702 22703.
    22702, 2862, 22703, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22704–22705.
function agcAotUnit1427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22704 {
// PORT: SOURCE P20-P25.agc:406
//
// PORT: SOURCE P20-P25.agc:407
//		TC	TASKOVER
// PORT: Fixed ROM slots 22704.
        if slot <> 22704 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:408
//
// PORT: SOURCE P20-P25.agc:409
//P20LEMC2	TC	FIXDELAY	# TRACK FLAG NOT SET, WAIT 15 SECONDS
// PORT: Fixed ROM slots 22705.
        if slot <> 22705 or instruction <> 2705 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2705, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1427] to agcAotUnit1427@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:410
//		DEC	1500		# AND CHECK AGAIN
// PORT: Fixed ROM slots 22706.
    22706, 3000
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22707–22709.
function agcAotUnit1428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22707 {
// PORT: SOURCE P20-P25.agc:411
//
// PORT: SOURCE P20-P25.agc:412
//		TC	P20LEMC1
// PORT: Fixed ROM slots 22707.
        if slot <> 22707 or instruction <> 1188 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1188, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22708 {
// PORT: SOURCE P20-P25.agc:413
//
// PORT: SOURCE P20-P25.agc:414
//P20LEMD		CAF	1500DEC
// PORT: Fixed ROM slots 22708.
            if slot <> 22708 or instruction <> 13750 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1462), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:415
//		TC	TWIDDLE		# WAITLIST FOR 15 SECONDS
// PORT: Fixed ROM slots 22709.
            if slot <> 22709 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1428] to agcAotUnit1428@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:416
//		ADRES	P20LEMD1
// PORT: Fixed ROM slots 22710.
    22710, 2416
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22711–22716.
function agcAotUnit1429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22713 {
        if slot <= 22711 {
// PORT: SOURCE P20-P25.agc:417
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22711.
            if slot <> 22711 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22712 {
// PORT: SOURCE P20-P25.agc:418
//
// PORT: SOURCE P20-P25.agc:419
//P20LEMD1	CAE	FLAGWRD1	# IS TRACK FLAG SET
// PORT: Fixed ROM slots 22712.
                if slot <> 22712 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:420
//		MASK 	TRACKBIT
// PORT: Fixed ROM slots 22713.
                if slot <> 22713 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 22714 {
// PORT: SOURCE P20-P25.agc:421
//		CCS	A
// PORT: Fixed ROM slots 22714.
            if slot <> 22714 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22715 {
// PORT: SOURCE P20-P25.agc:422
//		TCF	P20LEMD2	# YES -- SCHEDULE DESIGNATE JOB
// PORT: Fixed ROM slots 22715.
                if slot <> 22715 or instruction <> 5311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5311, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:423
//		TC	FIXDELAY	# NO -- WAIT 15 SECONDS
// PORT: Fixed ROM slots 22716.
                if slot <> 22716 or instruction <> 2705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2705, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1429] to agcAotUnit1429@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:424
//		DEC	1500
// PORT: Fixed ROM slots 22717.
    22717, 3000
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22718–22720.
function agcAotUnit1430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22718 {
// PORT: SOURCE P20-P25.agc:425
//		TC	P20LEMD1
// PORT: Fixed ROM slots 22718.
        if slot <> 22718 or instruction <> 1208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22719 {
// PORT: SOURCE P20-P25.agc:426
//
// PORT: SOURCE P20-P25.agc:427
//P20LEMD2	CAF	PRIO26		# SCHEDULE JOB TO DO R21
// PORT: Fixed ROM slots 22719.
            if slot <> 22719 or instruction <> 16332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:428
//		TC	FINDVAC
// PORT: Fixed ROM slots 22720.
            if slot <> 22720 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1430] to agcAotUnit1430@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:429
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:430
//		2CADR	P20LEMC3	# START AT PERM.  MEMORY INTEGRATION
// PORT: Fixed ROM slots 22721 22722.
    22721, 2322, 22722, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22723–22723.
function agcAotUnit1431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:431
//
// PORT: SOURCE P20-P25.agc:432
//		TC	TASKOVER
// PORT: Fixed ROM slots 22723.
    if slot <> 22723 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1431] to agcAotUnit1431@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:433
//
// PORT: SOURCE P20-P25.agc:434
//250DEC		DEC	250
// PORT: Fixed ROM slots 22724.
    22724, 500,
// PORT: SOURCE P20-P25.agc:435
//ALRM526		OCT	00526
// PORT: Fixed ROM slots 22725.
    22725, 684,
// PORT: SOURCE P20-P25.agc:436
//OCT201		OCT	00201
// PORT: Fixed ROM slots 22726.
    22726, 258,
// PORT: SOURCE P20-P25.agc:437
//ALRM514		OCT	514
// PORT: Fixed ROM slots 22727.
    22727, 664,
// PORT: SOURCE P20-P25.agc:438
//MAXTRIES	DEC	60
// PORT: Fixed ROM slots 22728.
    22728, 120,
// PORT: SOURCE P20-P25.agc:439
//OCT00012	OCT	00012
// PORT: Fixed ROM slots 22729.
    22729, 20,
// PORT: SOURCE P20-P25.agc:440
//P22ONE		OCT	00001
// PORT: Fixed ROM slots 22730.
    22730, 2,
// PORT: SOURCE P20-P25.agc:441
//ONEB-2		2DEC	1.0 B-2
// PORT: Fixed ROM slots 22731 22732.
    22731, 8192, 22732, 0,
// PORT: SOURCE P20-P25.agc:442
//
// PORT: SOURCE P20-P25.agc:443
//V06N33*		VN	0633
// PORT: Fixed ROM slots 22733.
    22733, 1602,
// PORT: SOURCE P20-P25.agc:444
//UPPSV		STQ	CALL		# UPDATES PERMANENT STATE VECTORS
// PORT: Fixed ROM slots 22734.
    22734, 37920,
// PORT: SOURCE P20-P25.agc:445
//			LS21X		# 	TO PRESENT TIME
// PORT: Fixed ROM slots 22735.
    22735, 2014,
// PORT: SOURCE P20-P25.agc:446
//			INTSTALL
// PORT: Fixed ROM slots 22736.
    22736, 24088,
// PORT: SOURCE P20-P25.agc:447
//		CALL
// PORT: Fixed ROM slots 22737.
    22737, 65320,
// PORT: SOURCE P20-P25.agc:448
//# Page 500
// PORT: SOURCE P20-P25.agc:449
//			SETIFLGS
// PORT: Fixed ROM slots 22738.
    22738, 23368,
// PORT: SOURCE P20-P25.agc:450
//		BOF	SET		# IF W-MATRIX INVALID, DON'T INTEGRATE IT
// PORT: Fixed ROM slots 22739.
    22739, 35864,
// PORT: SOURCE P20-P25.agc:451
//			RENDWFLG
// PORT: Fixed ROM slots 22740.
    22740, 3036,
// PORT: SOURCE P20-P25.agc:452
//			UPPSV1
// PORT: Fixed ROM slots 22741.
    22741, 41404,
// PORT: SOURCE P20-P25.agc:453
//			DIM0FLAG	# SET DIM0FLAG TO INTEGRATE W-MATRIX
// PORT: Fixed ROM slots 22742.
    22742, 1660,
// PORT: SOURCE P20-P25.agc:454
//		BON	SET
// PORT: Fixed ROM slots 22743.
    22743, 35864,
// PORT: SOURCE P20-P25.agc:455
//			SURFFLAG	# IF ON LUNAR SURFACE W IS 6X6
// PORT: Fixed ROM slots 22744.
    22744, 4494,
// PORT: SOURCE P20-P25.agc:456
//			UPPSV5
// PORT: Fixed ROM slots 22745.
    22745, 41398,
// PORT: SOURCE P20-P25.agc:457
//			D6OR9FLG	# OTHERWISE 9X9
// PORT: Fixed ROM slots 22746.
    22746, 1658,
// PORT: SOURCE P20-P25.agc:458
//UPPSV5		BOF
// PORT: Fixed ROM slots 22747.
    22747, 65304,
// PORT: SOURCE P20-P25.agc:459
//			VEHUPFLG
// PORT: Fixed ROM slots 22748.
    22748, 974,
// PORT: SOURCE P20-P25.agc:460
//			UPPSV3
// PORT: Fixed ROM slots 22749.
    22749, 41456,
// PORT: SOURCE P20-P25.agc:461
//UPPSV1		SET
// PORT: Fixed ROM slots 22750.
    22750, 65304,
// PORT: SOURCE P20-P25.agc:462
//			VINTFLAG
// PORT: Fixed ROM slots 22751.
    22751, 1656,
// PORT: SOURCE P20-P25.agc:463
//		CALL
// PORT: Fixed ROM slots 22752.
    22752, 65320,
// PORT: SOURCE P20-P25.agc:464
//			INTEGRV
// PORT: Fixed ROM slots 22753.
    22753, 23736,
// PORT: SOURCE P20-P25.agc:465
//		CALL			# GROUP 2 PHASE CHANGE
// PORT: Fixed ROM slots 22754.
    22754, 65320,
// PORT: SOURCE P20-P25.agc:466
//			GRP2PC		# TO PROTECT INTEGRATION
// PORT: Fixed ROM slots 22755.
    22755, 9544,
// PORT: SOURCE P20-P25.agc:467
//		CALL
// PORT: Fixed ROM slots 22756.
    22756, 65320,
// PORT: SOURCE P20-P25.agc:468
//			INTSTALL
// PORT: Fixed ROM slots 22757.
    22757, 24088,
// PORT: SOURCE P20-P25.agc:469
//		DLOAD	CLEAR		# GET TETCSM TO STORE IN TDEC FOR LM INT.
// PORT: Fixed ROM slots 22758.
    22758, 36042,
// PORT: SOURCE P20-P25.agc:470
//			TETCSM
// PORT: Fixed ROM slots 22759.
    22759, 1778,
// PORT: SOURCE P20-P25.agc:471
//			VINTFLAG
// PORT: Fixed ROM slots 22760.
    22760, 1912,
// PORT: SOURCE P20-P25.agc:472
//UPPSV4		CALL			# INTEGRATE OTHER VEHICLE
// PORT: Fixed ROM slots 22761.
    22761, 65320,
// PORT: SOURCE P20-P25.agc:473
//			SETIFLGS	#	WITHOUT W-MATRIX
// PORT: Fixed ROM slots 22762.
    22762, 23368,
// PORT: SOURCE P20-P25.agc:474
//		STCALL	TDEC1
// PORT: Fixed ROM slots 22763.
    22763, 28738,
// PORT: SOURCE P20-P25.agc:475
//			INTEGRV
// PORT: Fixed ROM slots 22764.
    22764, 23736,
// PORT: SOURCE P20-P25.agc:476
//		BOFF	VLOAD
// PORT: Fixed ROM slots 22765.
    22765, 64792,
// PORT: SOURCE P20-P25.agc:477
//			SURFFLAG
// PORT: Fixed ROM slots 22766.
    22766, 4558,
// PORT: SOURCE P20-P25.agc:478
//			P20LEMC4
// PORT: Fixed ROM slots 22767.
    22767, 41244,
// PORT: SOURCE P20-P25.agc:479
//			RCVLEM
// PORT: Fixed ROM slots 22768.
    22768, 1890,
// PORT: SOURCE P20-P25.agc:480
//		VSR2
// PORT: Fixed ROM slots 22769.
    22769, 65476,
// PORT: SOURCE P20-P25.agc:481
//		STOVL	LMPOS
// PORT: Fixed ROM slots 22770.
    22770, 22996,
// PORT: SOURCE P20-P25.agc:482
//			VCVLEM
// PORT: Fixed ROM slots 22771.
    22771, 1902,
// PORT: SOURCE P20-P25.agc:483
//		VSR2
// PORT: Fixed ROM slots 22772.
    22772, 65476,
// PORT: SOURCE P20-P25.agc:484
//		STORE	LMVEL
// PORT: Fixed ROM slots 22773.
    22773, 2528,
// PORT: SOURCE P20-P25.agc:485
//		GOTO
// PORT: Fixed ROM slots 22774.
    22774, 65360,
// PORT: SOURCE P20-P25.agc:486
//			LS21X
// PORT: Fixed ROM slots 22775.
    22775, 2014,
// PORT: SOURCE P20-P25.agc:487
//
// PORT: SOURCE P20-P25.agc:488
//UPPSV3		CLEAR	CALL
// PORT: Fixed ROM slots 22776.
    22776, 37912,
// PORT: SOURCE P20-P25.agc:489
//			VINTFLAG
// PORT: Fixed ROM slots 22777.
    22777, 1912,
// PORT: SOURCE P20-P25.agc:490
//			INTEGRV
// PORT: Fixed ROM slots 22778.
    22778, 23736,
// PORT: SOURCE P20-P25.agc:491
//		CALL
// PORT: Fixed ROM slots 22779.
    22779, 65320,
// PORT: SOURCE P20-P25.agc:492
//			GRP2PC
// PORT: Fixed ROM slots 22780.
    22780, 9544,
// PORT: SOURCE P20-P25.agc:493
//		CALL
// PORT: Fixed ROM slots 22781.
    22781, 65320,
// PORT: SOURCE P20-P25.agc:494
//			INTSTALL
// PORT: Fixed ROM slots 22782.
    22782, 24088,
// PORT: SOURCE P20-P25.agc:495
//		SET	DLOAD
// PORT: Fixed ROM slots 22783.
    22783, 58648,
// PORT: SOURCE P20-P25.agc:496
//			VINTFLAG
// PORT: Fixed ROM slots 22784.
    22784, 1656,
// PORT: SOURCE P20-P25.agc:497
//			TETLEM		# GET TETLEM TO STORE IN TDEC FOR CSM INT.
// PORT: Fixed ROM slots 22785.
    22785, 1862,
// PORT: SOURCE P20-P25.agc:498
//# Page 501
// PORT: SOURCE P20-P25.agc:499
//		GOTO
// PORT: Fixed ROM slots 22786.
    22786, 65360,
// PORT: SOURCE P20-P25.agc:500
//			UPPSV4
// PORT: Fixed ROM slots 22787.
    22787, 41426
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22788–22788.
function agcAotUnit1432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:501
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:502
//		COUNT*	$$/P22
// PORT: SOURCE P20-P25.agc:503
//
// PORT: SOURCE P20-P25.agc:504
//# Page 502
// PORT: SOURCE P20-P25.agc:505
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:506
//#
// PORT: SOURCE P20-P25.agc:507
//#	PREFERRED TRACKING ATTITUDE PROGRAM P25
// PORT: SOURCE P20-P25.agc:508
//#	MOD NO -- 3
// PORT: SOURCE P20-P25.agc:509
//# 	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:510
//#
// PORT: SOURCE P20-P25.agc:511
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:512
//#
// PORT: SOURCE P20-P25.agc:513
//#	THE PURPOSE OF THIS PROGRAM IS TO COMPUTE THE PREFERRED TRACKING
// PORT: SOURCE P20-P25.agc:514
//# 	ATTITUDE OF THE LM TO CONTINUOUSLY POINT THE LM TRTACKING BEACON AT THE
// PORT: SOURCE P20-P25.agc:515
//#	CSM AND TO PERFORM THE MANEUVER TO THE PREFERRED TRACKING ATTITUDE AND
// PORT: SOURCE P20-P25.agc:516
//# 	CONTINUOUSLY MAINTAIN THIS ATTITUDE WITHIN PRESCRIBED LIMITS.
// PORT: SOURCE P20-P25.agc:517
//#
// PORT: SOURCE P20-P25.agc:518
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:519
//#
// PORT: SOURCE P20-P25.agc:520
//#	ASTRONAUT REQUEST THROUGH DSKY V37E25E
// PORT: SOURCE P20-P25.agc:521
//#
// PORT: SOURCE P20-P25.agc:522
//# SUBROUTINES CALLED --
// PORT: SOURCE P20-P25.agc:523
//#
// PORT: SOURCE P20-P25.agc:524
//#	BANKCALL					FLAGUP
// PORT: SOURCE P20-P25.agc:525
//#	R02BOTH	(IMU STATUS CHECK)			ENDOFJOB
// PORT: SOURCE P20-P25.agc:526
//#	R61LEM	(PREF TRK ATT ROUT)			WAITLIST
// PORT: SOURCE P20-P25.agc:527
//#	TASKOVER					FINDVAC
// PORT: SOURCE P20-P25.agc:528
//#
// PORT: SOURCE P20-P25.agc:529
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:530
//#
// PORT: SOURCE P20-P25.agc:531
//# 	P25 MAY BE TERMINATED IN TWO WAYS -- ASTRONAUT SELECTION OF IDLING
// PORT: SOURCE P20-P25.agc:532
//#	PROGRAM (P00) BY KEYING V37E00E OR BY KEYING IN V56E
// PORT: SOURCE P20-P25.agc:533
//#
// PORT: SOURCE P20-P25.agc:534
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:535
//#
// PORT: SOURCE P20-P25.agc:536
//#	NONE
// PORT: SOURCE P20-P25.agc:537
//#
// PORT: SOURCE P20-P25.agc:538
//# OUTPUT
// PORT: SOURCE P20-P25.agc:539
//#
// PORT: SOURCE P20-P25.agc:540
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:541
//#
// PORT: SOURCE P20-P25.agc:542
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:543
//#
// PORT: SOURCE P20-P25.agc:544
//#	TRACKFLG, P25FLAG
// PORT: SOURCE P20-P25.agc:545
//#
// PORT: SOURCE P20-P25.agc:546
//# DEBRIS
// PORT: SOURCE P20-P25.agc:547
//#
// PORT: SOURCE P20-P25.agc:548
//#	NONE
// PORT: SOURCE P20-P25.agc:549
//
// PORT: SOURCE P20-P25.agc:550
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:551
//		COUNT*	$$/P25
// PORT: SOURCE P20-P25.agc:552
//PROG25		TC	2PHSCHNG
// PORT: Fixed ROM slots 22788.
    if slot <> 22788 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1432] to agcAotUnit1432@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:553
//		OCT	4		# MAKE GROUP 4 INACTIVE (VERB 37)
// PORT: Fixed ROM slots 22789.
    22789, 8,
// PORT: SOURCE P20-P25.agc:554
//		OCT	05022
// PORT: Fixed ROM slots 22790.
    22790, 5156,
// PORT: SOURCE P20-P25.agc:555
//		OCT	26000		# PRIORITY 26
// PORT: Fixed ROM slots 22791.
    22791, 22528
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22792–22792.
function agcAotUnit1433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:556
//
// PORT: SOURCE P20-P25.agc:557
//		TC	BANKCALL
// PORT: Fixed ROM slots 22792.
    if slot <> 22792 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1433] to agcAotUnit1433@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:558
//		CADR	R02BOTH		# IMU STATUS CHECK
// PORT: Fixed ROM slots 22793.
    22793, 9560
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22794–22794.
function agcAotUnit1434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:559
//		TC	UPFLAG
// PORT: Fixed ROM slots 22794.
    if slot <> 22794 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1434] to agcAotUnit1434@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:560
//		ADRES	TRACKFLG	# SET TRACK FLAG
// PORT: Fixed ROM slots 22795.
    22795, 50
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22796–22796.
function agcAotUnit1435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:561
//		TC	UPFLAG
// PORT: Fixed ROM slots 22796.
    if slot <> 22796 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1435] to agcAotUnit1435@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:562
//		ADRES	P25FLAG		# SET P25FLAG
// PORT: Fixed ROM slots 22797.
    22797, 12
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22798–22798.
function agcAotUnit1436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:563
//P25LEM1		TC	PHASCHNG
// PORT: Fixed ROM slots 22798.
    if slot <> 22798 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1436] to agcAotUnit1436@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:564
//		OCT	04022
// PORT: Fixed ROM slots 22799.
    22799, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22800–22810.
function agcAotUnit1437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22804 {
        if slot <= 22801 {
            if slot <= 22800 {
// PORT: SOURCE P20-P25.agc:565
//		CAF	P25FLBIT
// PORT: Fixed ROM slots 22800.
                if slot <> 22800 or instruction <> 14819 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:566
//		MASK	STATE		# IS P25FLAG SET
// PORT: Fixed ROM slots 22801.
                if slot <> 22801 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22802 {
// PORT: SOURCE P20-P25.agc:567
//		EXTEND
// PORT: Fixed ROM slots 22802.
                if slot <> 22802 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22803 {
// PORT: SOURCE P20-P25.agc:568
//		BZF	ENDOFJOB
// PORT: Fixed ROM slots 22803.
                    if slot <> 22803 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:569
//		CAF	TRACKBIT	# IS TRACKFLAG SET?
// PORT: Fixed ROM slots 22804.
                    if slot <> 22804 or instruction <> 14823 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22807 {
            if slot <= 22805 {
// PORT: SOURCE P20-P25.agc:570
//		MASK	STATE +1
// PORT: Fixed ROM slots 22805.
                if slot <> 22805 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22806 {
// PORT: SOURCE P20-P25.agc:571
//		EXTEND
// PORT: Fixed ROM slots 22806.
                    if slot <> 22806 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:572
//# Page 503
// PORT: SOURCE P20-P25.agc:573
//		BZF	P25LMWT1	# NO -- SKIP PHASE CHANGE AND WAIT 1 MINUTE
// PORT: Fixed ROM slots 22807.
                    if slot <> 22807 or instruction <> 5407 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5407, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22808 {
// PORT: SOURCE P20-P25.agc:574
//		CAF	SEVEN		# CALL R65 -- FINE PREFERRED
// PORT: Fixed ROM slots 22808.
                if slot <> 22808 or instruction <> 14831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22809 {
// PORT: SOURCE P20-P25.agc:575
//		TS	R65CNTR
// PORT: Fixed ROM slots 22809.
                    if slot <> 22809 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:576
//		TC	BANKCALL	# TRACKING ATTITUDE ROUTINE
// PORT: Fixed ROM slots 22810.
                    if slot <> 22810 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1437] to agcAotUnit1437@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:577
//		CADR	R65LEM
// PORT: Fixed ROM slots 22811.
    22811, 39078
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22812–22813.
function agcAotUnit1438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22812 {
// PORT: SOURCE P20-P25.agc:578
//		TC	P25LEM1		# THEN GO CHECK FLAGS
// PORT: Fixed ROM slots 22812.
        if slot <> 22812 or instruction <> 1294 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1294, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:579
//P25LEMWT	TC	PHASCHNG
// PORT: Fixed ROM slots 22813.
        if slot <> 22813 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1438] to agcAotUnit1438@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:580
//		OCT	00112
// PORT: Fixed ROM slots 22814.
    22814, 148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22815–22816.
function agcAotUnit1439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22815 {
// PORT: SOURCE P20-P25.agc:581
//P25LMWT1	CAF	60SCNDS
// PORT: Fixed ROM slots 22815.
        if slot <> 22815 or instruction <> 13608 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1320), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:582
//		TC	TWIDDLE		# WAIT ONE MINUTE THEN CHECK AGAIN
// PORT: Fixed ROM slots 22816.
        if slot <> 22816 or instruction <> 2683 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2683, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1439] to agcAotUnit1439@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:583
//		ADRES	P25LEM2
// PORT: Fixed ROM slots 22817.
    22817, 2630
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22818–22820.
function agcAotUnit1440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22818 {
// PORT: SOURCE P20-P25.agc:584
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22818.
        if slot <> 22818 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22819 {
// PORT: SOURCE P20-P25.agc:585
//P25LEM2		CAF	PRIO14
// PORT: Fixed ROM slots 22819.
            if slot <> 22819 or instruction <> 14868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:586
//		TC	FINDVAC
// PORT: Fixed ROM slots 22820.
            if slot <> 22820 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1440] to agcAotUnit1440@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:587
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:588
//		2CADR	P25LEM1
// PORT: Fixed ROM slots 22821 22822.
    22821, 2588, 22822, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22823–22823.
function agcAotUnit1441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:589
//
// PORT: SOURCE P20-P25.agc:590
//		TC	TASKOVER
// PORT: Fixed ROM slots 22823.
    if slot <> 22823 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1441] to agcAotUnit1441@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:591
//60SCNDS		DEC	6000
// PORT: Fixed ROM slots 22824.
    22824, 12000
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22825–22825.
function agcAotUnit1442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:592
//
// PORT: SOURCE P20-P25.agc:593
//# Page 504
// PORT: SOURCE P20-P25.agc:594
//# DATA READ ROUTINE 22 (LEM)
// PORT: SOURCE P20-P25.agc:595
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:596
//#
// PORT: SOURCE P20-P25.agc:597
//#	MOD NO -- 2
// PORT: SOURCE P20-P25.agc:598
//#	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:599
//#
// PORT: SOURCE P20-P25.agc:600
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:601
//#
// PORT: SOURCE P20-P25.agc:602
//#	TO PROCESS AUTOMATIC RR MARK DATA TO UPDATE THE STATE VECTOR OF EITHER
// PORT: SOURCE P20-P25.agc:603
//# 	LM OR CSM AS DEFINED IN THE RENDEZVOUS NAVIGATION PROGRAM (P20)
// PORT: SOURCE P20-P25.agc:604
//#
// PORT: SOURCE P20-P25.agc:605
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:606
//#
// PORT: SOURCE P20-P25.agc:607
//#	TC	BANKCALL
// PORT: SOURCE P20-P25.agc:608
//#	CADR	R22LEM
// PORT: SOURCE P20-P25.agc:609
//#
// PORT: SOURCE P20-P25.agc:610
//# SUBROUTINES CALLED --
// PORT: SOURCE P20-P25.agc:611
//#
// PORT: SOURCE P20-P25.agc:612
//#	LSR22.1		GOFLASH		WAITLIST
// PORT: SOURCE P20-P25.agc:613
//#	LSR22.2		PRIOLARM	BANKCALL
// PORT: SOURCE P20-P25.agc:614
//#	LSR22.3		R61LEM
// PORT: SOURCE P20-P25.agc:615
//#
// PORT: SOURCE P20-P25.agc:616
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:617
//#
// PORT: SOURCE P20-P25.agc:618
//#	R22 WILL CONTINUE TO RECYCLE, UPDATING STATE VECTORS WITH RADAR DATA
// PORT: SOURCE P20-P25.agc:619
//#	UNTIL P20 CEASES TO OPERATE (RENDEZVOUS FLAG SET TO ZERO) AT WHICH TIME
// PORT: SOURCE P20-P25.agc:620
//#	R22 WILL TERMINATE SELF.
// PORT: SOURCE P20-P25.agc:621
//#
// PORT: SOURCE P20-P25.agc:622
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:623
//#
// PORT: SOURCE P20-P25.agc:624
//#	PRIORITY ALARM
// PORT: SOURCE P20-P25.agc:625
//#	PRIORITY ALARM 525 LOS NOT WITHIN 3 DEGREE LIMIT
// PORT: SOURCE P20-P25.agc:626
//#
// PORT: SOURCE P20-P25.agc:627
//# OUTPUT
// PORT: SOURCE P20-P25.agc:628
//#
// PORT: SOURCE P20-P25.agc:629
//#	SEE OUTPUT FROM LSR22.3
// PORT: SOURCE P20-P25.agc:630
//#
// PORT: SOURCE P20-P25.agc:631
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:632
//#
// PORT: SOURCE P20-P25.agc:633
//#	SEE LSR22.1, LSR22.2, LSR22.3
// PORT: SOURCE P20-P25.agc:634
//#
// PORT: SOURCE P20-P25.agc:635
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:636
//#
// PORT: SOURCE P20-P25.agc:637
//#	NOANGFLG
// PORT: SOURCE P20-P25.agc:638
//#
// PORT: SOURCE P20-P25.agc:639
//# DEBRIS
// PORT: SOURCE P20-P25.agc:640
//#
// PORT: SOURCE P20-P25.agc:641
//#	SEE LSR22.1, LSR22.2, LSR22.3
// PORT: SOURCE P20-P25.agc:642
//
// PORT: SOURCE P20-P25.agc:643
//		EBANK=	LRS22.1X
// PORT: SOURCE P20-P25.agc:644
//		COUNT*	$$/R22
// PORT: SOURCE P20-P25.agc:645
//R22LEM		TC	PHASCHNG
// PORT: Fixed ROM slots 22825.
    if slot <> 22825 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1442] to agcAotUnit1442@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:646
//		OCT	04022
// PORT: Fixed ROM slots 22826.
    22826, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22827–22850.
function agcAotUnit1443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22838 {
        if slot <= 22832 {
            if slot <= 22829 {
                if slot <= 22827 {
// PORT: SOURCE P20-P25.agc:647
//		CAF	RNDVZBIT	# IS RENDEZVOUS FLAG SET?
// PORT: Fixed ROM slots 22827.
                    if slot <> 22827 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22828 {
// PORT: SOURCE P20-P25.agc:648
//		MASK	STATE
// PORT: Fixed ROM slots 22828.
                        if slot <> 22828 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:649
//		EXTEND
// PORT: Fixed ROM slots 22829.
                        if slot <> 22829 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22830 {
// PORT: SOURCE P20-P25.agc:650
//		BZF	ENDOFJOB	# NO -- EXIT R22 AND P20
// PORT: Fixed ROM slots 22830.
                    if slot <> 22830 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22831 {
// PORT: SOURCE P20-P25.agc:651
//		CAF	TRACKBIT	# IS TRACKFLAG SET?
// PORT: Fixed ROM slots 22831.
                        if slot <> 22831 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:652
//		MASK	STATE +1
// PORT: Fixed ROM slots 22832.
                        if slot <> 22832 or instruction <> 28733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22835 {
                if slot <= 22833 {
// PORT: SOURCE P20-P25.agc:653
//		EXTEND
// PORT: Fixed ROM slots 22833.
                    if slot <> 22833 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22834 {
// PORT: SOURCE P20-P25.agc:654
//		BZF	R22WAIT		# NO WAIT
// PORT: Fixed ROM slots 22834.
                        if slot <> 22834 or instruction <> 5534 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5534, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:655
//R22LEM12	CAF	BIT14		# IS RR AUTO TRACK ENABLE DISCRETE STILL
// PORT: Fixed ROM slots 22835.
                        if slot <> 22835 or instruction <> 14814 { return choose false if checkOnly else -1. }
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
                if slot <= 22836 {
// PORT: SOURCE P20-P25.agc:656
//		EXTEND			# ON (A MONITOR REPOSITION BY R25 CLEARS IT)
// PORT: Fixed ROM slots 22836.
                    if slot <> 22836 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22837 {
// PORT: SOURCE P20-P25.agc:657
//		RAND	CHAN12
// PORT: Fixed ROM slots 22837.
                        if slot <> 22837 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:658
//		EXTEND
// PORT: Fixed ROM slots 22838.
                        if slot <> 22838 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 22844 {
            if slot <= 22841 {
                if slot <= 22839 {
// PORT: SOURCE P20-P25.agc:659
//		BZF	P20LEMA		# NO -- RETURN TO P20
// PORT: Fixed ROM slots 22839.
                    if slot <> 22839 or instruction <> 5193 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5193, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22840 {
// PORT: SOURCE P20-P25.agc:660
//		CAF	BIT2		# YES
// PORT: Fixed ROM slots 22840.
                        if slot <> 22840 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:661
//		EXTEND			# IS RR AUTO MODE DISCRETE PRESENT
// PORT: Fixed ROM slots 22841.
                        if slot <> 22841 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22842 {
// PORT: SOURCE P20-P25.agc:662
//		RAND	CHAN33
// PORT: Fixed ROM slots 22842.
                    if slot <> 22842 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22843 {
// PORT: SOURCE P20-P25.agc:663
//# Page 505
// PORT: SOURCE P20-P25.agc:664
//		EXTEND
// PORT: Fixed ROM slots 22843.
                        if slot <> 22843 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:665
//		BZF	+2		# YES CONTINUE
// PORT: Fixed ROM slots 22844.
                        if slot <> 22844 or instruction <> 5438 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5438, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22847 {
                if slot <= 22845 {
// PORT: SOURCE P20-P25.agc:666
//		TC	P20LEMB5	# NO -- SET IT
// PORT: Fixed ROM slots 22845.
                    if slot <> 22845 or instruction <> 1117 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1117, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22846 {
// PORT: SOURCE P20-P25.agc:667
//		CS	RADMODES	# ARE RR CDUS BEING ZEROED
// PORT: Fixed ROM slots 22846.
                        if slot <> 22846 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:668
//		MASK	RCDU0BIT
// PORT: Fixed ROM slots 22847.
                        if slot <> 22847 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                if slot <= 22848 {
// PORT: SOURCE P20-P25.agc:669
//		EXTEND
// PORT: Fixed ROM slots 22848.
                    if slot <> 22848 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22849 {
// PORT: SOURCE P20-P25.agc:670
//		BZF	R22LEM42	# CDUS BEING ZEROED
// PORT: Fixed ROM slots 22849.
                        if slot <> 22849 or instruction <> 5527 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5527, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:671
//		TC	PHASCHNG	# IF A RESTART OCCURS, AND EXTRA RADAR
// PORT: Fixed ROM slots 22850.
                        if slot <> 22850 or instruction <> 2795 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2795, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1443] to agcAotUnit1443@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:672
//		OCT	00152		# READING IS TAKEN, SO BAD DATA ISN'T USED
// PORT: Fixed ROM slots 22851.
    22851, 212
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22852–22852.
function agcAotUnit1444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:673
//		TC	BANKCALL	# YES READ DATA + CALCULATE LOS
// PORT: Fixed ROM slots 22852.
    if slot <> 22852 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1444] to agcAotUnit1444@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:674
//		CADR	LRS22.1		# DATA READ SUBROUTINE
// PORT: Fixed ROM slots 22853.
    22853, 53740
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22854–22854.
function agcAotUnit1445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:675
//		INDEX	MPAC
// PORT: Fixed ROM slots 22854.
    if slot <> 22854 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1445] to agcAotUnit1445@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:676
//		TC	+1
// PORT: Fixed ROM slots 22855.
    22855, 2704
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22856–22859.
function agcAotUnit1446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22857 {
        if slot <= 22856 {
// PORT: SOURCE P20-P25.agc:677
//		TC	R22LEM2		# NORMAL RETURN (GOOD DATA)
// PORT: Fixed ROM slots 22856.
            if slot <> 22856 or instruction <> 1369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:678
//		TC	P20LEMC		# COULD NOT READ RADAR -- TRY TO REDESIGNATE
// PORT: Fixed ROM slots 22857.
            if slot <> 22857 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22858 {
// PORT: SOURCE P20-P25.agc:679
//		CAF	ALRM525		# RR LOS NOT WITHIN 3 DEGREES (ALARM)
// PORT: Fixed ROM slots 22858.
            if slot <> 22858 or instruction <> 13747 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1459), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:680
//		TC	BANKCALL
// PORT: Fixed ROM slots 22859.
            if slot <> 22859 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1446] to agcAotUnit1446@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:681
//		CADR	PRIOLARM
// PORT: Fixed ROM slots 22860.
    22860, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22861–22865.
function agcAotUnit1447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22862 {
        if slot <= 22861 {
// PORT: SOURCE P20-P25.agc:682
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// PORT: Fixed ROM slots 22861.
            if slot <> 22861 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:683
//		TC	R22LEM1		# PROC (DISPLAY DELTA THETA)
// PORT: Fixed ROM slots 22862.
            if slot <> 22862 or instruction <> 1361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1361, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22863 {
// PORT: SOURCE P20-P25.agc:684
//		TC	-5		# ENTER (ILLEGAL OPTION)
// PORT: Fixed ROM slots 22863.
            if slot <> 22863 or instruction <> 1354 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1354, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22864 {
// PORT: SOURCE P20-P25.agc:685
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22864.
                if slot <> 22864 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:686
//
// PORT: SOURCE P20-P25.agc:687
//R22LEM1		TC	PHASCHNG
// PORT: Fixed ROM slots 22865.
                if slot <> 22865 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1447] to agcAotUnit1447@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:688
//		OCT	04022
// PORT: Fixed ROM slots 22866.
    22866, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22867–22868.
function agcAotUnit1448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22867 {
// PORT: SOURCE P20-P25.agc:689
//		CAF	V06N05		# DISPLAY DELTA THETA
// PORT: Fixed ROM slots 22867.
        if slot <> 22867 or instruction <> 13748 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1460), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:690
//		TC	BANKCALL
// PORT: Fixed ROM slots 22868.
        if slot <> 22868 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1448] to agcAotUnit1448@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:691
//		CADR	PRIODSP
// PORT: Fixed ROM slots 22869.
    22869, 17038
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22870–22873.
function agcAotUnit1449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22871 {
        if slot <= 22870 {
// PORT: SOURCE P20-P25.agc:692
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// PORT: Fixed ROM slots 22870.
            if slot <> 22870 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:693
//		TC	R22LEM2		# PROC (OK CONTINUE)
// PORT: Fixed ROM slots 22871.
            if slot <> 22871 or instruction <> 1369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22872 {
// PORT: SOURCE P20-P25.agc:694
//		TC	P20LEMC		# ENTER (RECYCLE)
// PORT: Fixed ROM slots 22872.
            if slot <> 22872 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:695
//R22LEM2		TC	PHASCHNG
// PORT: Fixed ROM slots 22873.
            if slot <> 22873 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1449] to agcAotUnit1449@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:696
//		OCT	04022
// PORT: Fixed ROM slots 22874.
    22874, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22875–22881.
function agcAotUnit1450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22877 {
        if slot <= 22875 {
// PORT: SOURCE P20-P25.agc:697
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE (P22FLAG SET)
// PORT: Fixed ROM slots 22875.
            if slot <> 22875 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22876 {
// PORT: SOURCE P20-P25.agc:698
//		TC	R22LEM3		# YES -- BYPASS FLAG CHECKS AND LRS22.2
// PORT: Fixed ROM slots 22876.
                if slot <> 22876 or instruction <> 1385 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1385, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:699
//		CA	FLAGWRD1	# IS TRACK FLAG SET
// PORT: Fixed ROM slots 22877.
                if slot <> 22877 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22879 {
            if slot <= 22878 {
// PORT: SOURCE P20-P25.agc:700
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 22878.
                if slot <> 22878 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:701
//		EXTEND
// PORT: Fixed ROM slots 22879.
                if slot <> 22879 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22880 {
// PORT: SOURCE P20-P25.agc:702
//		BZF	R22WAIT		# NO -- WAIT
// PORT: Fixed ROM slots 22880.
                if slot <> 22880 or instruction <> 5534 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:703
//		TC	BANKCALL	# YES
// PORT: Fixed ROM slots 22881.
                if slot <> 22881 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1450] to agcAotUnit1450@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:704
//		CADR	LRS22.2		# CHECKS RR BORESIGHT WITHIN 30 DEG OF +Z
// PORT: Fixed ROM slots 22882.
    22882, 42422
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22883–22883.
function agcAotUnit1451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:705
//		INDEX	MPAC
// PORT: Fixed ROM slots 22883.
    if slot <> 22883 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1451] to agcAotUnit1451@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:706
//		TC	+1
// PORT: Fixed ROM slots 22884.
    22884, 2762
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22885–22886.
function agcAotUnit1452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22885 {
// PORT: SOURCE P20-P25.agc:707
//		TC	R22LEM3		# NORMAL RETURN (LOS WITHIN 30 OF Z-AXIS)
// PORT: Fixed ROM slots 22885.
        if slot <> 22885 or instruction <> 1385 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1385, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:708
//		TC	BANKCALL
// PORT: Fixed ROM slots 22886.
        if slot <> 22886 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1452] to agcAotUnit1452@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:709
//		CADR	R61LEM
// PORT: Fixed ROM slots 22887.
    22887, 39068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22888–22899.
function agcAotUnit1453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22893 {
        if slot <= 22890 {
            if slot <= 22888 {
// PORT: SOURCE P20-P25.agc:710
//		TC	R22WAIT		# NOT WITHIN 30 DEG OF Z-AXIS
// PORT: Fixed ROM slots 22888.
                if slot <> 22888 or instruction <> 1438 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1438, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22889 {
// PORT: SOURCE P20-P25.agc:711
//R22LEM3		CS	FLAGWRD1	# SHOULD WE BYPASS STATE VECTOR UPDATE
// PORT: Fixed ROM slots 22889.
                    if slot <> 22889 or instruction <> 16445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 61).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:712
//		MASK	NOUPFBIT	# (IS NO UPDATE FLAG SET?)
// PORT: Fixed ROM slots 22890.
                    if slot <> 22890 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 22891 {
// PORT: SOURCE P20-P25.agc:713
//# Page 506
// PORT: SOURCE P20-P25.agc:714
//		EXTEND
// PORT: Fixed ROM slots 22891.
                if slot <> 22891 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22892 {
// PORT: SOURCE P20-P25.agc:715
//		BZF	R22LEM42	# BRANCH -- YES
// PORT: Fixed ROM slots 22892.
                    if slot <> 22892 or instruction <> 5527 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:716
//		CA	FLAGWRD1	# IS UPDATE FLAG SET
// PORT: Fixed ROM slots 22893.
                    if slot <> 22893 or instruction <> 12349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22896 {
            if slot <= 22894 {
// PORT: SOURCE P20-P25.agc:717
//		MASK	UPDATBIT
// PORT: Fixed ROM slots 22894.
                if slot <> 22894 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                if slot <= 22895 {
// PORT: SOURCE P20-P25.agc:718
//		EXTEND
// PORT: Fixed ROM slots 22895.
                    if slot <> 22895 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:719
//		BZF	R22LEM42	# UPDATE FLAG NOT SET
// PORT: Fixed ROM slots 22896.
                    if slot <> 22896 or instruction <> 5527 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 22897 {
// PORT: SOURCE P20-P25.agc:720
//		CAF	PRIO26		# INSURE HIGH PRIO IN RESTART
// PORT: Fixed ROM slots 22897.
                if slot <> 22897 or instruction <> 16332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22898 {
// PORT: SOURCE P20-P25.agc:721
//		TS	PHSPRDT2
// PORT: Fixed ROM slots 22898.
                    if slot <> 22898 or instruction <> 23086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:722
//
// PORT: SOURCE P20-P25.agc:723
//		TC	INTPRET
// PORT: Fixed ROM slots 22899.
                    if slot <> 22899 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1453] to agcAotUnit1453@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:724
//		GOTO
// PORT: Fixed ROM slots 22900.
    22900, 65360,
// PORT: SOURCE P20-P25.agc:725
//			LSR22.3
// PORT: Fixed ROM slots 22901.
    22901, 45588,
// PORT: SOURCE P20-P25.agc:726
//R22LEM93	EXIT			# NORMAL EXIT FROM LSR22.3
// PORT: Fixed ROM slots 22902.
    22902, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22903–22903.
function agcAotUnit1454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:727
//		TC	PHASCHNG	# PHASE CHANGE TO PROTECT AGAINST
// PORT: Fixed ROM slots 22903.
    if slot <> 22903 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1454] to agcAotUnit1454@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:728
//		OCT	04022		# CONFLICT WITH GRP2PC ERASEABLE
// PORT: Fixed ROM slots 22904.
    22904, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22905–22905.
function agcAotUnit1455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:729
//		TCF	R22LEM44
// PORT: Fixed ROM slots 22905.
    if slot <> 22905 or instruction <> 5522 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5522, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1455] to agcAotUnit1455@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:730
//R22LEM96	EXIT
// PORT: Fixed ROM slots 22906.
    22906, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22907–22909.
function agcAotUnit1456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22907 {
// PORT: SOURCE P20-P25.agc:731
//		CAF	ZERO		# SET N49FLAG = ZERO TO INDICATE
// PORT: Fixed ROM slots 22907.
        if slot <> 22907 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22908 {
// PORT: SOURCE P20-P25.agc:732
//		TS	N49FLAG		# V06 N49 DISPLAY HASN'T BEEN ANSWERED
// PORT: Fixed ROM slots 22908.
            if slot <> 22908 or instruction <> 23526 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23526, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:733
//		TC	PHASCHNG
// PORT: Fixed ROM slots 22909.
            if slot <> 22909 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1456] to agcAotUnit1456@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:734
//		OCT	04022		# TO PROTECT DISPLAY
// PORT: Fixed ROM slots 22910.
    22910, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22911–22912.
function agcAotUnit1457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22911 {
// PORT: SOURCE P20-P25.agc:735
//		CAF	PRIO27		# PROTECT DISPLAY
// PORT: Fixed ROM slots 22911.
        if slot <> 22911 or instruction <> 16333 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4045), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:736
//		TC	NOVAC
// PORT: Fixed ROM slots 22912.
        if slot <> 22912 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1457] to agcAotUnit1457@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:737
//		EBANK=	N49FLAG
// PORT: SOURCE P20-P25.agc:738
//		2CADR	N49DSP
// PORT: Fixed ROM slots 22913 22914.
    22913, 2888, 22914, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22915–22915.
function agcAotUnit1458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:739
//
// PORT: SOURCE P20-P25.agc:740
//		TC	INTPRET
// PORT: Fixed ROM slots 22915.
    if slot <> 22915 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1458] to agcAotUnit1458@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:741
//		SLOAD
// PORT: Fixed ROM slots 22916.
    22916, 65466,
// PORT: SOURCE P20-P25.agc:742
//			N49FLAG
// PORT: Fixed ROM slots 22917.
    22917, 4046,
// PORT: SOURCE P20-P25.agc:743
//		BZE	BMN		# LOOP TO CHECK IF FLAG
// PORT: Fixed ROM slots 22918.
    22918, 41048,
// PORT: SOURCE P20-P25.agc:744
//			-3		# SETTING CHANGED -- BRANCH -- NO
// PORT: Fixed ROM slots 22919.
    22919, 41736,
// PORT: SOURCE P20-P25.agc:745
//			R22LEM7		# PROCEED
// PORT: Fixed ROM slots 22920.
    22920, 41756,
// PORT: SOURCE P20-P25.agc:746
//		EXIT			# DISPLAY ANSERED BY RECYCLE
// PORT: Fixed ROM slots 22921.
    22921, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22922–22925.
function agcAotUnit1459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22923 {
        if slot <= 22922 {
// PORT: SOURCE P20-P25.agc:747
//		TC	LUNSFCHK	# ARE WE ON LUNAR SURFACE
// PORT: Fixed ROM slots 22922.
            if slot <> 22922 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:748
//		TC	R22WAIT		# YES -- 15 SECOND DELAY
// PORT: Fixed ROM slots 22923.
            if slot <> 22923 or instruction <> 1438 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1438, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22924 {
// PORT: SOURCE P20-P25.agc:749
//		CA	ZERO		# NO -- SET R65COUNTER = 0, DO FINE
// PORT: Fixed ROM slots 22924.
            if slot <> 22924 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:750
//		TC	R22LEM45	# TRACKING TAKE ANOTHER RADAR READING
// PORT: Fixed ROM slots 22925.
            if slot <> 22925 or instruction <> 1434 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1434, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1459] to agcAotUnit1459@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:751
//R22LEM7		CALL			# PROCEED
// PORT: Fixed ROM slots 22926.
    22926, 65320,
// PORT: SOURCE P20-P25.agc:752
//			GRP2PC		# PHASE CHANGE AND
// PORT: Fixed ROM slots 22927.
    22927, 9544,
// PORT: SOURCE P20-P25.agc:753
//		GOTO			# GO TO INCOPORATE DATA.
// PORT: Fixed ROM slots 22928.
    22928, 65360,
// PORT: SOURCE P20-P25.agc:754
//			ASTOK
// PORT: Fixed ROM slots 22929.
    22929, 46642
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22930–22939.
function agcAotUnit1460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22934 {
        if slot <= 22931 {
            if slot <= 22930 {
// PORT: SOURCE P20-P25.agc:755
//R22LEM44	INCR	MARKCTR		# INCREMENT COUNT OF MARKS INCORPORATED.
// PORT: Fixed ROM slots 22930.
                if slot <> 22930 or instruction <> 11058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 818).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:756
//		TC	LUNSFCHK	# ARE WE ON LUNAR SURFACE
// PORT: Fixed ROM slots 22931.
                if slot <> 22931 or instruction <> 1463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22932 {
// PORT: SOURCE P20-P25.agc:757
//		TC	R22LEM46	# YES -- WAIT 2 SECONDS
// PORT: Fixed ROM slots 22932.
                if slot <> 22932 or instruction <> 1440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22933 {
// PORT: SOURCE P20-P25.agc:758
//		CA	FIVE		# NOT ON LUNAR SURFACE
// PORT: Fixed ROM slots 22933.
                    if slot <> 22933 or instruction <> 14830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:759
//		TC	R22LEM45	# R65COUNTER = 5
// PORT: Fixed ROM slots 22934.
                    if slot <> 22934 or instruction <> 1434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1434, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 22936 {
            if slot <= 22935 {
// PORT: SOURCE P20-P25.agc:760
//R22LEM42	TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE (P22FLAG SET)
// PORT: Fixed ROM slots 22935.
                if slot <> 22935 or instruction <> 1463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:761
//		TC	R22LEM46	# YES -- WAIT 2 SECONDS
// PORT: Fixed ROM slots 22936.
                if slot <> 22936 or instruction <> 1440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22937 {
// PORT: SOURCE P20-P25.agc:762
//		CA	TWO		# NO -- SET R65COUNTER = 2
// PORT: Fixed ROM slots 22937.
                if slot <> 22937 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22938 {
// PORT: SOURCE P20-P25.agc:763
//R22LEM45	TS	R65CNTR
// PORT: Fixed ROM slots 22938.
                    if slot <> 22938 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:764
//# Page 507
// PORT: SOURCE P20-P25.agc:765
//		TC	BANKCALL
// PORT: Fixed ROM slots 22939.
                    if slot <> 22939 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1460] to agcAotUnit1460@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:766
//		CADR	R65LEM		# FINE PREFERRED TRACKING ATTITUDE
// PORT: Fixed ROM slots 22940.
    22940, 39078
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22941–22943.
function agcAotUnit1461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22941 {
// PORT: SOURCE P20-P25.agc:767
//		TC	R22LEM
// PORT: Fixed ROM slots 22941.
        if slot <> 22941 or instruction <> 1321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1321, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22942 {
// PORT: SOURCE P20-P25.agc:768
//R22WAIT		CAF	1500DEC
// PORT: Fixed ROM slots 22942.
            if slot <> 22942 or instruction <> 13750 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1462), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:769
//		TC	P20LEMWT +1
// PORT: Fixed ROM slots 22943.
            if slot <> 22943 or instruction <> 1179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1461] to agcAotUnit1461@.

// PORT: Physical bank 24. Shared continuation entries, slots 22944–22945.
function agcAotUnit1462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22944 {
// PORT: SOURCE P20-P25.agc:770
//
// PORT: SOURCE P20-P25.agc:771
//R22LEM46	CAF	2SECS
// PORT: Fixed ROM slots 22944.
        if slot <> 22944 or instruction <> 14848 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:772
//		TC	BANKCALL	# WAIT 2 SECONDS AND TAKE ANOTHER MARK
// PORT: Fixed ROM slots 22945.
        if slot <> 22945 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1462] to agcAotUnit1462@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:773
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 22946.
    22946, 1978
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22947–22949.
function agcAotUnit1463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22947 {
// PORT: SOURCE P20-P25.agc:774
//		TC	R22LEM
// PORT: Fixed ROM slots 22947.
        if slot <> 22947 or instruction <> 1321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1321, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22948 {
// PORT: SOURCE P20-P25.agc:775
//
// PORT: SOURCE P20-P25.agc:776
//N49DSP		CAF	V06N49NB
// PORT: Fixed ROM slots 22948.
            if slot <> 22948 or instruction <> 13749 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1461), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:777
//		TC	BANKCALL	# EXCESSIVE STATE VECTOR UPDATE -- FLASH
// PORT: Fixed ROM slots 22949.
            if slot <> 22949 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1463] to agcAotUnit1463@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:778
//		CADR	PRIODSP		# VERB 06 NOUN 49 R1=DELTA R, R2=DELTA V
// PORT: Fixed ROM slots 22950.
    22950, 17038
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22951–22955.
function agcAotUnit1464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22952 {
        if slot <= 22951 {
// PORT: SOURCE P20-P25.agc:779
//		TC	GOTOV56		# TERMINATE -- EXIT R22 AND P20
// PORT: Fixed ROM slots 22951.
            if slot <> 22951 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:780
//		CS	ONE		# PROCEED -- N49FLAG = -1
// PORT: Fixed ROM slots 22952.
            if slot <> 22952 or instruction <> 18923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22953 {
// PORT: SOURCE P20-P25.agc:781
//		TS	N49FLAG		# RECYCLE -- N49FLAG = + VALUE
// PORT: Fixed ROM slots 22953.
            if slot <> 22953 or instruction <> 23526 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23526, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22954 {
// PORT: SOURCE P20-P25.agc:782
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 22954.
                if slot <> 22954 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:783
//R22RSTRT	TC	PHASCHNG	# IF A RESTART OCCURS WHILE READING RADAR
// PORT: Fixed ROM slots 22955.
                if slot <> 22955 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1464] to agcAotUnit1464@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:784
//		OCT	00152		# COME HERE TO TAKE A RANGE-RATE READING
// PORT: Fixed ROM slots 22956.
    22956, 212
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22957–22957.
function agcAotUnit1465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:785
//		TC	BANKCALL	# WHICH ISN'T USED TO PREVENT TAKING A BAD
// PORT: Fixed ROM slots 22957.
    if slot <> 22957 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1465] to agcAotUnit1465@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:786
//		CADR	RRRDOT		# READING AND TRYING TO INCORPORATE THE
// PORT: Fixed ROM slots 22958.
    22958, 44166
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22959–22959.
function agcAotUnit1466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:787
//		TC	BANKCALL	# BAD DATA
// PORT: Fixed ROM slots 22959.
    if slot <> 22959 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1466] to agcAotUnit1466@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:788
//		CADR	RADSTALL	# WAIT FOR READ COMPLETE
// PORT: Fixed ROM slots 22960.
    22960, 16280
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22961–22962.
function agcAotUnit1467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22961 {
// PORT: SOURCE P20-P25.agc:789
//		TC	P20LEMC		# COULD NOT READ RADAR -- TRY TO REDISGNATE
// PORT: Fixed ROM slots 22961.
        if slot <> 22961 or instruction <> 1167 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1167, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:790
//		TC	R22LEM		# READ SUCCESSFUL -- CONTINUE AT R22
// PORT: Fixed ROM slots 22962.
        if slot <> 22962 or instruction <> 1321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1321, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1467] to agcAotUnit1467@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:791
//
// PORT: SOURCE P20-P25.agc:792
//ALRM525		OCT	00525
// PORT: Fixed ROM slots 22963.
    22963, 682,
// PORT: SOURCE P20-P25.agc:793
//V06N05		VN	00605
// PORT: Fixed ROM slots 22964.
    22964, 1546,
// PORT: SOURCE P20-P25.agc:794
//V06N49NB	VN	00649
// PORT: Fixed ROM slots 22965.
    22965, 1634,
// PORT: SOURCE P20-P25.agc:795
//1500DEC		DEC	1500
// PORT: Fixed ROM slots 22966.
    22966, 3000
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22967–22989.
function agcAotUnit1468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22977 {
        if slot <= 22971 {
            if slot <= 22968 {
                if slot <= 22967 {
// PORT: SOURCE P20-P25.agc:796
//
// PORT: SOURCE P20-P25.agc:797
//# LUNSFCHECK -- CLOSED SUBROUTINE TO CHECK IF ON LUNAR SURFACE (P22FLAG)
// PORT: SOURCE P20-P25.agc:798
//#	RETURNS TO CALLER +1 IF P22FLAG SET
// PORT: SOURCE P20-P25.agc:799
//#		TO CALLER +2 IF P22FLAG NOT SET
// PORT: SOURCE P20-P25.agc:800
//
// PORT: SOURCE P20-P25.agc:801
//		COUNT* 	$$/P22
// PORT: SOURCE P20-P25.agc:802
//LUNSFCHK	CS	FLAGWRD8	# CHECK IF ON LUNAR SURFACE
// PORT: Fixed ROM slots 22967.
                    if slot <> 22967 or instruction <> 16452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 68).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:803
//		MASK	SURFFBIT	# IS SURFFLAG SET?
// PORT: Fixed ROM slots 22968.
                    if slot <> 22968 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
                if slot <= 22969 {
// PORT: SOURCE P20-P25.agc:804
//		CCS	A		# BRANCH -- P22FLAG SET
// PORT: Fixed ROM slots 22969.
                    if slot <> 22969 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22970 {
// PORT: SOURCE P20-P25.agc:805
//		INCR	Q		# NOT SET
// PORT: Fixed ROM slots 22970.
                        if slot <> 22970 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:806
//		TC	Q		# RETURN
// PORT: Fixed ROM slots 22971.
                        if slot <> 22971 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22974 {
                if slot <= 22972 {
// PORT: SOURCE P20-P25.agc:807
//
// PORT: SOURCE P20-P25.agc:808
//# Page 508
// PORT: SOURCE P20-P25.agc:809
//# RR DESIGNATE ROUTINE (R21LEM)
// PORT: SOURCE P20-P25.agc:810
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:811
//#
// PORT: SOURCE P20-P25.agc:812
//# 	MOD NO -- 2
// PORT: SOURCE P20-P25.agc:813
//#	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:814
//#
// PORT: SOURCE P20-P25.agc:815
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:816
//#
// PORT: SOURCE P20-P25.agc:817
//# 	TO POINT THE RENDEZVOUS RADAR AT THE CSM UNTIL AUTOMATIC ACQUISITION
// PORT: SOURCE P20-P25.agc:818
//# 	OF THE CSM IS ACCOMPLISHED BY THE RADAR.  ROUTINE IS CALLED BY P20.
// PORT: SOURCE P20-P25.agc:819
//#
// PORT: SOURCE P20-P25.agc:820
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:821
//#
// PORT: SOURCE P20-P25.agc:822
//#	TC	BANKCALL
// PORT: SOURCE P20-P25.agc:823
//#	CADR	R21LEM
// PORT: SOURCE P20-P25.agc:824
//#
// PORT: SOURCE P20-P25.agc:825
//# SUBROUTINES CALLED --
// PORT: SOURCE P20-P25.agc:826
//#
// PORT: SOURCE P20-P25.agc:827
//#	FINDVAC		FLAGUP		ENDOFJOB	PRIOLARM
// PORT: SOURCE P20-P25.agc:828
//#	NOVAC		INTPRET		LPS20.1		PHASCHNG
// PORT: SOURCE P20-P25.agc:829
//#	WAITLIST	JOBSLEEP	JOBWAKE		FLAGDOWN
// PORT: SOURCE P20-P25.agc:830
//#	TASKOVER	BANKCALL	RADSTALL	RRDESSM
// PORT: SOURCE P20-P25.agc:831
//#
// PORT: SOURCE P20-P25.agc:832
//# NORMAL EXIT MODES
// PORT: SOURCE P20-P25.agc:833
//#
// PORT: SOURCE P20-P25.agc:834
//#	WHEN LOCK-ON IS ACHIEVED, BRANCH WILL BE TO P20 WHERE R22 (DATA READ
// PORT: SOURCE P20-P25.agc:835
//#	WILL BE SELECTED OR A NEED FOR A MANEUVER (BRANCH TO P20LEMA)
// PORT: SOURCE P20-P25.agc:836
//#
// PORT: SOURCE P20-P25.agc:837
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:838
//#
// PORT: SOURCE P20-P25.agc:839
//#	PRIORITY ALARM 503 WHEN LOCK-ON HASN'T BEEN ACHIEVED AFTER 30SECS --
// PORT: SOURCE P20-P25.agc:840
//#	THIS REQUIRES ASTRONAUT INTERFACE: SELECTION OF SEARCH OPTION OF
// PORT: SOURCE P20-P25.agc:841
//#	ACQUISITION
// PORT: SOURCE P20-P25.agc:842
//#
// PORT: SOURCE P20-P25.agc:843
//# OUTPUT
// PORT: SOURCE P20-P25.agc:844
//#
// PORT: SOURCE P20-P25.agc:845
//#	SEE LPS20.1, RRDESSM
// PORT: SOURCE P20-P25.agc:846
//#
// PORT: SOURCE P20-P25.agc:847
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:848
//#
// PORT: SOURCE P20-P25.agc:849
//#	RRTARGET, RADMODES ARE USED BY LPS20.1 AND RRDESSM
// PORT: SOURCE P20-P25.agc:850
//#
// PORT: SOURCE P20-P25.agc:851
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:852
//#
// PORT: SOURCE P20-P25.agc:853
//#	LOSCMFLG	LOKONSW
// PORT: SOURCE P20-P25.agc:854
//#
// PORT: SOURCE P20-P25.agc:855
//# DEBRIS
// PORT: SOURCE P20-P25.agc:856
//#
// PORT: SOURCE P20-P25.agc:857
//#	SEE LPS20.1, RRSESSM
// PORT: SOURCE P20-P25.agc:858
//
// PORT: SOURCE P20-P25.agc:859
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:860
//		COUNT*	$$/R21
// PORT: SOURCE P20-P25.agc:861
//R21LEM		CS	BIT14		# REMOVE RR SELF TRACK ENABLE
// PORT: Fixed ROM slots 22972.
                    if slot <> 22972 or instruction <> 18910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22973 {
// PORT: SOURCE P20-P25.agc:862
//		EXTEND
// PORT: Fixed ROM slots 22973.
                        if slot <> 22973 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:863
//		WAND	CHAN12
// PORT: Fixed ROM slots 22974.
                        if slot <> 22974 or instruction <> 1546 { return choose false if checkOnly else -1. }
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
                if slot <= 22975 {
// PORT: SOURCE P20-P25.agc:864
//		TC	LUNSFCHK
// PORT: Fixed ROM slots 22975.
                    if slot <> 22975 or instruction <> 1463 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1463, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22976 {
// PORT: SOURCE P20-P25.agc:865
//		TC	R21LEM5
// PORT: Fixed ROM slots 22976.
                        if slot <> 22976 or instruction <> 1477 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1477, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:866
//		CAF	ZERO		# COMMAND ANTENNA TO MODE CENTER
// PORT: Fixed ROM slots 22977.
                        if slot <> 22977 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 22983 {
            if slot <= 22980 {
                if slot <= 22978 {
// PORT: SOURCE P20-P25.agc:867
//		TS	TANG		# IF NOT ON SURFACE -- MODE 1 -- (T=0,S=0)
// PORT: Fixed ROM slots 22978.
                    if slot <> 22978 or instruction <> 23111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22979 {
// PORT: SOURCE P20-P25.agc:868
//		TS	TANG +1
// PORT: Fixed ROM slots 22979.
                        if slot <> 22979 or instruction <> 23112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23112, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:869
//		TC	R21LEM6
// PORT: Fixed ROM slots 22980.
                        if slot <> 22980 or instruction <> 1485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22981 {
// PORT: SOURCE P20-P25.agc:870
//R21LEM5		CAF	BIT12
// PORT: Fixed ROM slots 22981.
                    if slot <> 22981 or instruction <> 14816 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22982 {
// PORT: SOURCE P20-P25.agc:871
//		MASK	RADMODES
// PORT: Fixed ROM slots 22982.
                        if slot <> 22982 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:872
//		CCS	A
// PORT: Fixed ROM slots 22983.
                        if slot <> 22983 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 22986 {
                if slot <= 22984 {
// PORT: SOURCE P20-P25.agc:873
//		TC	R21LEM10
// PORT: Fixed ROM slots 22984.
                    if slot <> 22984 or instruction <> 1493 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1493, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22985 {
// PORT: SOURCE P20-P25.agc:874
//		CAF	BIT15
// PORT: Fixed ROM slots 22985.
                        if slot <> 22985 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:875
//		TS	TANG
// PORT: Fixed ROM slots 22986.
                        if slot <> 22986 or instruction <> 23111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23111, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22987 {
// PORT: SOURCE P20-P25.agc:876
//		CS	HALF
// PORT: Fixed ROM slots 22987.
                    if slot <> 22987 or instruction <> 18910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22988 {
// PORT: SOURCE P20-P25.agc:877
//		TS	TANG +1
// PORT: Fixed ROM slots 22988.
                        if slot <> 22988 or instruction <> 23112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23112, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:878
//
// PORT: SOURCE P20-P25.agc:879
//# Page 509
// PORT: SOURCE P20-P25.agc:880
//R21LEM6		TC	DOWNFLAG
// PORT: Fixed ROM slots 22989.
                        if slot <> 22989 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1468] to agcAotUnit1468@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:881
//		ADRES	LOKONSW
// PORT: Fixed ROM slots 22990.
    22990, 20
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22991–22991.
function agcAotUnit1469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:882
//		TC	BANKCALL
// PORT: Fixed ROM slots 22991.
    if slot <> 22991 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1469] to agcAotUnit1469@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:883
//		CADR	RRDESNB
// PORT: Fixed ROM slots 22992.
    22992, 43642
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22993–22994.
function agcAotUnit1470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22993 {
// PORT: SOURCE P20-P25.agc:884
//		TC	+1
// PORT: Fixed ROM slots 22993.
        if slot <> 22993 or instruction <> 1490 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1490, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:885
//		TC	BANKCALL
// PORT: Fixed ROM slots 22994.
        if slot <> 22994 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1470] to agcAotUnit1470@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:886
//		CADR	RADSTALL
// PORT: Fixed ROM slots 22995.
    22995, 16280
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22996–22997.
function agcAotUnit1471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22996 {
// PORT: SOURCE P20-P25.agc:887
//		TC	R21-503		# BAD RETURN FROM DESIGNATE -- ISSUE ALARM
// PORT: Fixed ROM slots 22996.
        if slot <> 22996 or instruction <> 1520 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1520, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:888
//R21LEM10	TC	UPFLAG
// PORT: Fixed ROM slots 22997.
        if slot <> 22997 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1471] to agcAotUnit1471@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:889
//		ADRES	LOSCMFLG	# EVERY FOURTH PASS THRU DODES
// PORT: Fixed ROM slots 22998.
    22998, 66
)).

// PORT: Physical bank 24. Shared continuation entries, slots 22999–23003.
function agcAotUnit1472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23000 {
        if slot <= 22999 {
// PORT: SOURCE P20-P25.agc:890
//		CAF	MAXTRIES	# ALLOW 60 PASSES (APPROX 45 SECONDS)
// PORT: Fixed ROM slots 22999.
            if slot <> 22999 or instruction <> 13512 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1224), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:891
//		TS	DESCOUNT	# TO DESIGNATE AND LOCK ON
// PORT: Fixed ROM slots 23000.
            if slot <> 23000 or instruction <> 23116 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23116, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23001 {
// PORT: SOURCE P20-P25.agc:892
//R21LEM2		CAF	THREE
// PORT: Fixed ROM slots 23001.
            if slot <> 23001 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23002 {
// PORT: SOURCE P20-P25.agc:893
//		TS	LOSCOUNT
// PORT: Fixed ROM slots 23002.
                if slot <> 23002 or instruction <> 23342 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23342, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:894
//R21LEM1		TC	INTPRET
// PORT: Fixed ROM slots 23003.
                if slot <> 23003 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1472] to agcAotUnit1472@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:895
//		RTB	DAD
// PORT: Fixed ROM slots 23004.
    23004, 36152,
// PORT: SOURCE P20-P25.agc:896
//			LOADTIME
// PORT: Fixed ROM slots 23005.
    23005, 18166,
// PORT: SOURCE P20-P25.agc:897
//			HALFSEC		# EXTRAPOLATE TO PRESENT TIME + .5 SEC.
// PORT: Fixed ROM slots 23006.
    23006, 9376,
// PORT: SOURCE P20-P25.agc:898
//		STCALL	TDEC1		# LOS DETERMINATION ROUTINE
// PORT: Fixed ROM slots 23007.
    23007, 28738,
// PORT: SOURCE P20-P25.agc:899
//			LPS20.1
// PORT: Fixed ROM slots 23008.
    23008, 42330,
// PORT: SOURCE P20-P25.agc:900
//		EXIT
// PORT: Fixed ROM slots 23009.
    23009, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23010–23010.
function agcAotUnit1473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:901
//R21LEM3		TC	UPFLAG		# SET LOKONSW TO RADAR -- ON DESIRED
// PORT: Fixed ROM slots 23010.
    if slot <> 23010 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1473] to agcAotUnit1473@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:902
//		ADRES	LOKONSW
// PORT: Fixed ROM slots 23011.
    23011, 20
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23012–23012.
function agcAotUnit1474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:903
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 23012.
    if slot <> 23012 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1474] to agcAotUnit1474@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:904
//		ADRES	NORRMON
// PORT: Fixed ROM slots 23013.
    23013, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23014–23014.
function agcAotUnit1475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:905
//		TC	INTPRET
// PORT: Fixed ROM slots 23014.
    if slot <> 23014 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1475] to agcAotUnit1475@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:906
//		CALL			# INPUT (RRTARGET UPDATED BY LPS20.1)
// PORT: Fixed ROM slots 23015.
    23015, 65320,
// PORT: SOURCE P20-P25.agc:907
//			RRDESSM		# DESIGNATE ROUTINE
// PORT: Fixed ROM slots 23016.
    23016, 43510,
// PORT: SOURCE P20-P25.agc:908
//		EXIT
// PORT: Fixed ROM slots 23017.
    23017, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23018–23020.
function agcAotUnit1476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23018 {
// PORT: SOURCE P20-P25.agc:909
//		TC	R21LEM4		# LOS NOT IN MODE 2 COVERAGE
// PORT: Fixed ROM slots 23018.
        if slot <> 23018 or instruction <> 1535 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1535, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23019 {
// PORT: SOURCE P20-P25.agc:910
//					# ON LUNAR SURFACE
// PORT: SOURCE P20-P25.agc:911
//		TC	P20LEMA		# VEHICLE MANEUVER REQUIRED.
// PORT: Fixed ROM slots 23019.
            if slot <> 23019 or instruction <> 1097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1097, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:912
//		TC	BANKCALL	# NO VEHICLE MANEUVER REQUIRED
// PORT: Fixed ROM slots 23020.
            if slot <> 23020 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1476] to agcAotUnit1476@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:913
//		CADR	RADSTALL	# WAIT FOR DESIGNATE COMPLETE -- LOCKON OR
// PORT: Fixed ROM slots 23021.
    23021, 16280
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23022–23025.
function agcAotUnit1477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23023 {
        if slot <= 23022 {
// PORT: SOURCE P20-P25.agc:914
//		TC	+2		# BAD END -- LOCKON NOT ACHIEVED IN 60 TRIES
// PORT: Fixed ROM slots 23022.
            if slot <> 23022 or instruction <> 1520 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1520, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:915
//		TC	R21END		# EXIT ROUTINE RETURN TO P20 (LOCK-ON)
// PORT: Fixed ROM slots 23023.
            if slot <> 23023 or instruction <> 1527 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1527, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23024 {
// PORT: SOURCE P20-P25.agc:916
//R21-503		CAF	ALRM503		# ISSUE ALARM 503
// PORT: Fixed ROM slots 23024.
            if slot <> 23024 or instruction <> 13821 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1533), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:917
//		TC	BANKCALL
// PORT: Fixed ROM slots 23025.
            if slot <> 23025 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1477] to agcAotUnit1477@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:918
//		CADR	PRIOLARM
// PORT: Fixed ROM slots 23026.
    23026, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23027–23031.
function agcAotUnit1478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23028 {
        if slot <= 23027 {
// PORT: SOURCE P20-P25.agc:919
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// PORT: Fixed ROM slots 23027.
            if slot <> 23027 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:920
//		TC	R21SRCH		# PROC
// PORT: Fixed ROM slots 23028.
            if slot <> 23028 or instruction <> 1530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23029 {
// PORT: SOURCE P20-P25.agc:921
//		TC	P20LEMC3
// PORT: Fixed ROM slots 23029.
            if slot <> 23029 or instruction <> 1161 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1161, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23030 {
// PORT: SOURCE P20-P25.agc:922
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 23030.
                if slot <> 23030 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:923
//R21END		TC	DOWNFLAG
// PORT: Fixed ROM slots 23031.
                if slot <> 23031 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1478] to agcAotUnit1478@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:924
//		ADRES	LOSCMFLG	# RESET LOSCMFLG
// PORT: Fixed ROM slots 23032.
    23032, 66
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23033–23034.
function agcAotUnit1479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23033 {
// PORT: SOURCE P20-P25.agc:925
//		TC	R21DISP		# PUT UP VERIFY MAIN LOBE LOCKON DISPLAY
// PORT: Fixed ROM slots 23033.
        if slot <> 23033 or instruction <> 1617 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1617, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:926
//R21SRCH		TC	PHASCHNG
// PORT: Fixed ROM slots 23034.
        if slot <> 23034 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1479] to agcAotUnit1479@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:927
//		OCT	04022
// PORT: Fixed ROM slots 23035.
    23035, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23036–23036.
function agcAotUnit1480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:928
//		TC	R24LEM		# SEARCH ROUTINE
// PORT: Fixed ROM slots 23036.
    if slot <> 23036 or instruction <> 1670 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1670, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1480] to agcAotUnit1480@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:929
//ALRM503		OCT	00503
// PORT: Fixed ROM slots 23037.
    23037, 646,
// PORT: SOURCE P20-P25.agc:930
//# Page 510
// PORT: SOURCE P20-P25.agc:931
//ALRM527		OCT	527
// PORT: Fixed ROM slots 23038.
    23038, 686
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23039–23041.
function agcAotUnit1481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23039 {
// PORT: SOURCE P20-P25.agc:932
//
// PORT: SOURCE P20-P25.agc:933
//R21LEM4		CAF	MAXTRIES	# SET UP COUNTER FOR
// PORT: Fixed ROM slots 23039.
        if slot <> 23039 or instruction <> 13512 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1224), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23040 {
// PORT: SOURCE P20-P25.agc:934
//		TS	REPOSCNT	# 60 PASSES (APPROX 600 SECS.)
// PORT: Fixed ROM slots 23040.
            if slot <> 23040 or instruction <> 23315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:935
//		TC	UPFLAG
// PORT: Fixed ROM slots 23041.
            if slot <> 23041 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1481] to agcAotUnit1481@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:936
//		ADRES	FSPASFLG	# SET FIRST PASS FLAG
// PORT: Fixed ROM slots 23042.
    23042, 10
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23043–23043.
function agcAotUnit1482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:937
//		TC	DOWNFLAG	# RESET LOS BEING
// PORT: Fixed ROM slots 23043.
    if slot <> 23043 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1482] to agcAotUnit1482@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:938
//		ADRES	LOSCMFLG	# COMPUTED FLAG
// PORT: Fixed ROM slots 23044.
    23044, 66
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23045–23045.
function agcAotUnit1483 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:939
//		TC	INTPRET
// PORT: Fixed ROM slots 23045.
    if slot <> 23045 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1483] to agcAotUnit1483@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:940
//R21LEM12	RTB
// PORT: Fixed ROM slots 23046.
    23046, 65336,
// PORT: SOURCE P20-P25.agc:941
//			LOADTIME
// PORT: Fixed ROM slots 23047.
    23047, 18166,
// PORT: SOURCE P20-P25.agc:942
//		DAD
// PORT: Fixed ROM slots 23048.
    23048, 65306,
// PORT: SOURCE P20-P25.agc:943
//			TENSEC		# TIME T = T + 10 SECS.
// PORT: Fixed ROM slots 23049.
    23049, 9372,
// PORT: SOURCE P20-P25.agc:944
//		STORE	REPOSTM		# SAVE FOR LONGCALL AND UPPSV
// PORT: Fixed ROM slots 23050.
    23050, 3626,
// PORT: SOURCE P20-P25.agc:945
//		STCALL	TDEC1
// PORT: Fixed ROM slots 23051.
    23051, 28738,
// PORT: SOURCE P20-P25.agc:946
//			LPS20.1		# COMPUTE LOS AT TIME T
// PORT: Fixed ROM slots 23052.
    23052, 42330,
// PORT: SOURCE P20-P25.agc:947
//		CALL
// PORT: Fixed ROM slots 23053.
    23053, 65320,
// PORT: SOURCE P20-P25.agc:948
//			RRDESSM
// PORT: Fixed ROM slots 23054.
    23054, 43510,
// PORT: SOURCE P20-P25.agc:949
//		EXIT
// PORT: Fixed ROM slots 23055.
    23055, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23056–23058.
function agcAotUnit1484 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23056 {
// PORT: SOURCE P20-P25.agc:950
//		TC	R21LEM13	# LOS NOT IN MODE 2 COVERAGE
// PORT: Fixed ROM slots 23056.
        if slot <> 23056 or instruction <> 1563 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1563, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23057 {
// PORT: SOURCE P20-P25.agc:951
//		TC	ENDOFJOB	# VEHICLE MANEUVER REQUIRED
// PORT: Fixed ROM slots 23057.
            if slot <> 23057 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:952
//		TC	KILLTASK
// PORT: Fixed ROM slots 23058.
            if slot <> 23058 or instruction <> 3095 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3095, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1484] to agcAotUnit1484@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:953
//		CADR	BEGDES
// PORT: Fixed ROM slots 23059.
    23059, 43766
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23060–23060.
function agcAotUnit1485 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:954
//		TC	INTPRET
// PORT: Fixed ROM slots 23060.
    if slot <> 23060 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1485] to agcAotUnit1485@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:955
//		BOF
// PORT: Fixed ROM slots 23061.
    23061, 65304,
// PORT: SOURCE P20-P25.agc:956
//			FSPASFLG	# FIRST PASS THRU REPOSITION
// PORT: Fixed ROM slots 23062.
    23062, 458,
// PORT: SOURCE P20-P25.agc:957
//			R21LEMB		# NO -- GO TO CONTINUOUS DESIGNATE
// PORT: Fixed ROM slots 23063.
    23063, 42054,
// PORT: SOURCE P20-P25.agc:958
//		CLRGO
// PORT: Fixed ROM slots 23064.
    23064, 65304,
// PORT: SOURCE P20-P25.agc:959
//			FSPASFLG	# YES -- RESET FIRST PASS FLAG
// PORT: Fixed ROM slots 23065.
    23065, 298,
// PORT: SOURCE P20-P25.agc:960
//			R21LEM7 +1
// PORT: Fixed ROM slots 23066.
    23066, 42046
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23067–23071.
function agcAotUnit1486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23068 {
        if slot <= 23067 {
// PORT: SOURCE P20-P25.agc:961
//R21LEM13	CCS	REPOSCNT	# HAVE WE TRIED 60 TIMES?
// PORT: Fixed ROM slots 23067.
            if slot <> 23067 or instruction <> 4883 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 787).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:962
//		TC	R21LEM7		# NO -- ADD 10 SECS.  RECOMPUTE LOS
// PORT: Fixed ROM slots 23068.
            if slot <> 23068 or instruction <> 1566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1566, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23069 {
// PORT: SOURCE P20-P25.agc:963
//		TC	R21LEM11	# YES -- PUT OUT ALARM 530
// PORT: Fixed ROM slots 23069.
            if slot <> 23069 or instruction <> 1605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1605, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23070 {
// PORT: SOURCE P20-P25.agc:964
//R21LEM7		TS	REPOSCNT
// PORT: Fixed ROM slots 23070.
                if slot <> 23070 or instruction <> 23315 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:965
//		TC	INTPRET
// PORT: Fixed ROM slots 23071.
                if slot <> 23071 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1486] to agcAotUnit1486@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:966
//		DLOAD	GOTO
// PORT: Fixed ROM slots 23072.
    23072, 43210,
// PORT: SOURCE P20-P25.agc:967
//			REPOSTM
// PORT: Fixed ROM slots 23073.
    23073, 3626,
// PORT: SOURCE P20-P25.agc:968
//			R21LEM12 +2
// PORT: Fixed ROM slots 23074.
    23074, 42000,
// PORT: SOURCE P20-P25.agc:969
//R21LEMB		DLOAD
// PORT: Fixed ROM slots 23075.
    23075, 65482,
// PORT: SOURCE P20-P25.agc:970
//			REPOSTM
// PORT: Fixed ROM slots 23076.
    23076, 3626,
// PORT: SOURCE P20-P25.agc:971
//		STCALL	TDEC1
// PORT: Fixed ROM slots 23077.
    23077, 28738,
// PORT: SOURCE P20-P25.agc:972
//			UPPSV
// PORT: Fixed ROM slots 23078.
    23078, 41372,
// PORT: SOURCE P20-P25.agc:973
//		EXIT
// PORT: Fixed ROM slots 23079.
    23079, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23080–23080.
function agcAotUnit1487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:974
//		TC	UPFLAG		# SET RADMODES BIT 15 FOR
// PORT: Fixed ROM slots 23080.
    if slot <> 23080 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1487] to agcAotUnit1487@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:975
//		ADRES	CDESFLAG	# CONTINUOUS DESIGNATION
// PORT: Fixed ROM slots 23081.
    23081, 360
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23082–23082.
function agcAotUnit1488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:976
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 23082.
    if slot <> 23082 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1488] to agcAotUnit1488@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:977
//		ADRES	LOKONSW
// PORT: Fixed ROM slots 23083.
    23083, 20
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23084–23084.
function agcAotUnit1489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:978
//		TC	UPFLAG
// PORT: Fixed ROM slots 23084.
    if slot <> 23084 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1489] to agcAotUnit1489@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:979
//		ADRES	NORRMON
// PORT: Fixed ROM slots 23085.
    23085, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23086–23086.
function agcAotUnit1490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:980
//# Page 511
// PORT: SOURCE P20-P25.agc:981
//		TC	BANKCALL
// PORT: Fixed ROM slots 23086.
    if slot <> 23086 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1490] to agcAotUnit1490@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:982
//		CADR	RRDESNB
// PORT: Fixed ROM slots 23087.
    23087, 43642
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23088–23089.
function agcAotUnit1491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23088 {
// PORT: SOURCE P20-P25.agc:983
//		TC	+1
// PORT: Fixed ROM slots 23088.
        if slot <> 23088 or instruction <> 1585 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1585, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:984
//		TC	INTPRET
// PORT: Fixed ROM slots 23089.
        if slot <> 23089 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1491] to agcAotUnit1491@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:985
//		RTB	BDSU
// PORT: Fixed ROM slots 23090.
    23090, 37176,
// PORT: SOURCE P20-P25.agc:986
//			LOADTIME	# COMPUTE DELTA TIME
// PORT: Fixed ROM slots 23091.
    23091, 18166,
// PORT: SOURCE P20-P25.agc:987
//			REPOSTM		# FOR LONGCALL
// PORT: Fixed ROM slots 23092.
    23092, 3626,
// PORT: SOURCE P20-P25.agc:988
//		STORE	DELTATM
// PORT: Fixed ROM slots 23093.
    23093, 3630,
// PORT: SOURCE P20-P25.agc:989
//		EXIT
// PORT: Fixed ROM slots 23094.
    23094, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23095–23097.
function agcAotUnit1492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23095 {
// PORT: SOURCE P20-P25.agc:990
//		EXTEND
// PORT: Fixed ROM slots 23095.
        if slot <> 23095 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23096 {
// PORT: SOURCE P20-P25.agc:991
//		DCA	DELTATM
// PORT: Fixed ROM slots 23096.
            if slot <> 23096 or instruction <> 13079 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 791, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:992
//		TC	LONGCALL
// PORT: Fixed ROM slots 23097.
            if slot <> 23097 or instruction <> 2751 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2751, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1492] to agcAotUnit1492@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:993
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:994
//		2CADR	R21LEM9
// PORT: Fixed ROM slots 23098 23099.
    23098, 3194, 23099, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23100–23101.
function agcAotUnit1493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23100 {
// PORT: SOURCE P20-P25.agc:995
//
// PORT: SOURCE P20-P25.agc:996
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 23100.
        if slot <> 23100 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:997
//R21LEM9		TC	KILLTASK
// PORT: Fixed ROM slots 23101.
        if slot <> 23101 or instruction <> 3095 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3095, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1493] to agcAotUnit1493@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:998
//		CADR	STDESIG
// PORT: Fixed ROM slots 23102.
    23102, 43780
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23103–23105.
function agcAotUnit1494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23103 {
// PORT: SOURCE P20-P25.agc:999
//		TC	CLRADMOD
// PORT: Fixed ROM slots 23103.
        if slot <> 23103 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23104 {
// PORT: SOURCE P20-P25.agc:1000
//		CAF	PRIO26
// PORT: Fixed ROM slots 23104.
            if slot <> 23104 or instruction <> 16332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1001
//		TC	FINDVAC
// PORT: Fixed ROM slots 23105.
            if slot <> 23105 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1494] to agcAotUnit1494@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1002
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1003
//		2CADR	R21LEM10
// PORT: Fixed ROM slots 23106 23107.
    23106, 2986, 23107, 41070
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23108–23110.
function agcAotUnit1495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23108 {
// PORT: SOURCE P20-P25.agc:1004
//
// PORT: SOURCE P20-P25.agc:1005
//		TC	TASKOVER
// PORT: Fixed ROM slots 23108.
        if slot <> 23108 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23109 {
// PORT: SOURCE P20-P25.agc:1006
//R21LEM11	CAF	ALRM530		# ALARM 530 -- LOS NOT IN COVERAGE
// PORT: Fixed ROM slots 23109.
            if slot <> 23109 or instruction <> 13900 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1612), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1007
//		TC	BANKCALL	# AFTER TRYING TO DESIGNATE FOR
// PORT: Fixed ROM slots 23110.
            if slot <> 23110 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1495] to agcAotUnit1495@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1008
//		CADR	PRIOLARM	# 600 SECS.
// PORT: Fixed ROM slots 23111.
    23111, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23112–23115.
function agcAotUnit1496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23113 {
        if slot <= 23112 {
// PORT: SOURCE P20-P25.agc:1009
//		TC	GOTOV56
// PORT: Fixed ROM slots 23112.
            if slot <> 23112 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1010
//		TC	GOTOV56
// PORT: Fixed ROM slots 23113.
            if slot <> 23113 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23114 {
// PORT: SOURCE P20-P25.agc:1011
//		TC	GOTOV56
// PORT: Fixed ROM slots 23114.
            if slot <> 23114 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1012
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 23115.
            if slot <> 23115 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1496] to agcAotUnit1496@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1013
//ALRM530		OCT	00530
// PORT: Fixed ROM slots 23116.
    23116, 688,
// PORT: SOURCE P20-P25.agc:1014
//TENSEC		2DEC	1000 B-28
// PORT: Fixed ROM slots 23117 23118.
    23117, 0, 23118, 2000,
// PORT: SOURCE P20-P25.agc:1015
//
// PORT: SOURCE P20-P25.agc:1016
//HALFSEC		2DEC	50
// PORT: Fixed ROM slots 23119 23120.
    23119, 0, 23120, 100
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23121–23121.
function agcAotUnit1497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1017
//
// PORT: SOURCE P20-P25.agc:1018
//R21DISP		TC	PHASCHNG
// PORT: Fixed ROM slots 23121.
    if slot <> 23121 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1497] to agcAotUnit1497@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1019
//		OCT	04022
// PORT: Fixed ROM slots 23122.
    23122, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23123–23124.
function agcAotUnit1498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23123 {
// PORT: SOURCE P20-P25.agc:1020
//		CAF	V06N72PV	# FLASH V 50 N 72 -- PLEASE PERFORM RR
// PORT: Fixed ROM slots 23123.
        if slot <> 23123 or instruction <> 13916 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1628), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1021
//		TC	BANKCALL	# MAIN LOBE LOCKON VERIFICATION
// PORT: Fixed ROM slots 23124.
        if slot <> 23124 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1498] to agcAotUnit1498@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1022
//		CADR	GOPERF2R
// PORT: Fixed ROM slots 23125.
    23125, 17296
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23126–23131.
function agcAotUnit1499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23128 {
        if slot <= 23126 {
// PORT: SOURCE P20-P25.agc:1023
//		TC	GOTOV56		# TERMINATE EXITS VIA V 56
// PORT: Fixed ROM slots 23126.
            if slot <> 23126 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23127 {
// PORT: SOURCE P20-P25.agc:1024
//		TC	P20LEMWT	# PROCEED CONTINUES TO R22
// PORT: Fixed ROM slots 23127.
                if slot <> 23127 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1025
//		TC 	-5		# ENTER ILLEGAL
// PORT: Fixed ROM slots 23128.
                if slot <> 23128 or instruction <> 1619 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1619, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23129 {
// PORT: SOURCE P20-P25.agc:1026
//		CAF	BIT7
// PORT: Fixed ROM slots 23129.
            if slot <> 23129 or instruction <> 14821 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23130 {
// PORT: SOURCE P20-P25.agc:1027
//		TC	LINUS		# SET BITS TO MAKE THIS A PRIORITY DISPLAY
// PORT: Fixed ROM slots 23130.
                if slot <> 23130 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1028
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 23131.
                if slot <> 23131 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1499] to agcAotUnit1499@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1029
//
// PORT: SOURCE P20-P25.agc:1030
//# Page 512
// PORT: SOURCE P20-P25.agc:1031
//V06N72PV	VN	00672
// PORT: Fixed ROM slots 23132.
    23132, 1680
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23133–23133.
function agcAotUnit1500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1032
//
// PORT: SOURCE P20-P25.agc:1033
//# Page 513
// PORT: SOURCE P20-P25.agc:1034
//# MANUAL ACQUISITION ROUTINE R23LEM
// PORT: SOURCE P20-P25.agc:1035
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:1036
//#
// PORT: SOURCE P20-P25.agc:1037
//#	MOD NO -- 2
// PORT: SOURCE P20-P25.agc:1038
//#	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:1039
//#
// PORT: SOURCE P20-P25.agc:1040
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:1041
//#
// PORT: SOURCE P20-P25.agc:1042
//#	TO ACQUIRE THE CSM BY MANUAL OPERATION OF THE RENDEZVOUS RADAR
// PORT: SOURCE P20-P25.agc:1043
//#
// PORT: SOURCE P20-P25.agc:1044
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:1045
//#
// PORT: SOURCE P20-P25.agc:1046
//#	TC	R23LEM
// PORT: SOURCE P20-P25.agc:1047
//#
// PORT: SOURCE P20-P25.agc:1048
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:1049
//#
// PORT: SOURCE P20-P25.agc:1050
//#	BANKCALL	R61LEM
// PORT: SOURCE P20-P25.agc:1051
//#	SETMINDB	GOPERF1
// PORT: SOURCE P20-P25.agc:1052
//#
// PORT: SOURCE P20-P25.agc:1053
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:1054
//#
// PORT: SOURCE P20-P25.agc:1055
//#	IN RESPONSE TO THE GOPERF1,	SELECTION OF ENTER WILL RECYCLE R23
// PORT: SOURCE P20-P25.agc:1056
//#					SELECTION OF PROC WILL CONTINUE R23
// PORT: SOURCE P20-P25.agc:1057
//#					SELECTION OF TERM WILL TERMINATE R23 + P20
// PORT: SOURCE P20-P25.agc:1058
//#
// PORT: SOURCE P20-P25.agc:1059
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:1060
//#
// PORT: SOURCE P20-P25.agc:1061
//#	SEE NORMAL EXIT MODES ABOVE
// PORT: SOURCE P20-P25.agc:1062
//#
// PORT: SOURCE P20-P25.agc:1063
//# OUTPUT
// PORT: SOURCE P20-P25.agc:1064
//#
// PORT: SOURCE P20-P25.agc:1065
//#	N.A.
// PORT: SOURCE P20-P25.agc:1066
//#
// PORT: SOURCE P20-P25.agc:1067
//# ERASABLE INITIALIZATION REQUIRED --
// PORT: SOURCE P20-P25.agc:1068
//#
// PORT: SOURCE P20-P25.agc:1069
//#	ACMODFLG MUST BE SET TO 1 (MANUAL MODE)
// PORT: SOURCE P20-P25.agc:1070
//
// PORT: SOURCE P20-P25.agc:1071
//		EBANK=	GENRET
// PORT: SOURCE P20-P25.agc:1072
//		COUNT*	$$/R23
// PORT: SOURCE P20-P25.agc:1073
//R23LEM		TC	UPFLAG		# SET NO ANGLE MONITOR FLAG
// PORT: Fixed ROM slots 23133.
    if slot <> 23133 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1500] to agcAotUnit1500@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1074
//		ADRES	NORRMON
// PORT: Fixed ROM slots 23134.
    23134, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23135–23136.
function agcAotUnit1501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23135 {
// PORT: SOURCE P20-P25.agc:1075
//		INHINT
// PORT: Fixed ROM slots 23135.
        if slot <> 23135 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1076
//		TC	IBNKCALL	# SELECT MINIMUM DEADBAND
// PORT: Fixed ROM slots 23136.
        if slot <> 23136 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1501] to agcAotUnit1501@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1077
//		CADR	SETMINDB
// PORT: Fixed ROM slots 23137.
    23137, 32960
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23138–23143.
function agcAotUnit1502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23140 {
        if slot <= 23138 {
// PORT: SOURCE P20-P25.agc:1078
//		RELINT
// PORT: Fixed ROM slots 23138.
            if slot <> 23138 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23139 {
// PORT: SOURCE P20-P25.agc:1079
//R23LEM1		CAF	BIT14		# ENABLE TRACKER
// PORT: Fixed ROM slots 23139.
                if slot <> 23139 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1080
//		EXTEND
// PORT: Fixed ROM slots 23140.
                if slot <> 23140 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23141 {
// PORT: SOURCE P20-P25.agc:1081
//		WOR	CHAN12
// PORT: Fixed ROM slots 23141.
            if slot <> 23141 or instruction <> 2570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23142 {
// PORT: SOURCE P20-P25.agc:1082
//		CAF	OCT205
// PORT: Fixed ROM slots 23142.
                if slot <> 23142 or instruction <> 13957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1669), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1083
//		TC	BANKCALL
// PORT: Fixed ROM slots 23143.
                if slot <> 23143 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1502] to agcAotUnit1502@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1084
//		CADR	GOPERF1
// PORT: Fixed ROM slots 23144.
    23144, 17190
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23145–23149.
function agcAotUnit1503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23146 {
        if slot <= 23145 {
// PORT: SOURCE P20-P25.agc:1085
//		TC	R23LEM2		# TERMINATE
// PORT: Fixed ROM slots 23145.
            if slot <> 23145 or instruction <> 1662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1086
//		TC	R23LEM11	# PROCEDE
// PORT: Fixed ROM slots 23146.
            if slot <> 23146 or instruction <> 1644 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1644, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23147 {
// PORT: SOURCE P20-P25.agc:1087
//		TC	R23LEM3		# ENTER -- DO ANOTHER MANEUVER
// PORT: Fixed ROM slots 23147.
            if slot <> 23147 or instruction <> 1665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1665, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23148 {
// PORT: SOURCE P20-P25.agc:1088
//R23LEM11	INHINT
// PORT: Fixed ROM slots 23148.
                if slot <> 23148 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1089
//		TC	RRLIMCHK	# YES -- CHECK IF ANTENNA IS WITHIN LIMITS
// PORT: Fixed ROM slots 23149.
                if slot <> 23149 or instruction <> 2387 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2387, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1503] to agcAotUnit1503@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1090
//		ADRES	CDUT
// PORT: Fixed ROM slots 23150.
    23150, 58
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23151–23152.
function agcAotUnit1504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23151 {
// PORT: SOURCE P20-P25.agc:1091
//		TC	OUTOFLIM	# NOT WITHIN LIMITS
// PORT: Fixed ROM slots 23151.
        if slot <> 23151 or instruction <> 1654 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1654, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1092
//		TC	IBNKCALL	# RESTORE DEADBAND TO
// PORT: Fixed ROM slots 23152.
        if slot <> 23152 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1504] to agcAotUnit1504@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1093
//		CADR	RESTORDB	# ASTRONAUT SELECTED VALUE
// PORT: Fixed ROM slots 23153.
    23153, 32934
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23154–23155.
function agcAotUnit1505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23154 {
// PORT: SOURCE P20-P25.agc:1094
//		RELINT
// PORT: Fixed ROM slots 23154.
        if slot <> 23154 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1095
//		TC	DOWNFLAG	# CLEAR NO ANGLE MONITOR FLAG
// PORT: Fixed ROM slots 23155.
        if slot <> 23155 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1505] to agcAotUnit1505@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1096
//		ADRES	NORRMON
// PORT: Fixed ROM slots 23156.
    23156, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23157–23157.
function agcAotUnit1506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1097
//		TC	P20LEMB1	# RADAR IS LOCKED ON CONTINUE IN P20
// PORT: Fixed ROM slots 23157.
    if slot <> 23157 or instruction <> 1139 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1139, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1506] to agcAotUnit1506@.

// PORT: Physical bank 24. Shared continuation entries, slots 23158–23160.
function agcAotUnit1507 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23158 {
// PORT: SOURCE P20-P25.agc:1098
//OUTOFLIM	RELINT
// PORT: Fixed ROM slots 23158.
        if slot <> 23158 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23159 {
// PORT: SOURCE P20-P25.agc:1099
//# Page 514
// PORT: SOURCE P20-P25.agc:1100
//		CAF	OCT501PV
// PORT: Fixed ROM slots 23159.
            if slot <> 23159 or instruction <> 13956 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1668), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1101
//		TC	BANKCALL	# ISSUE ALARM -- RR ANTENNA NOT WITHIN
// PORT: Fixed ROM slots 23160.
            if slot <> 23160 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1507] to agcAotUnit1507@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1102
//		CADR	PRIOLARM	# LIMITS
// PORT: Fixed ROM slots 23161.
    23161, 18148
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23162–23166.
function agcAotUnit1508 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23163 {
        if slot <= 23162 {
// PORT: SOURCE P20-P25.agc:1103
//		TC	R23LEM2		# TERMINATE -- EXIT R23 TO R00 (GO TO POOH)
// PORT: Fixed ROM slots 23162.
            if slot <> 23162 or instruction <> 1662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1104
//		TC	OUTOFLIM +1	# PROCEED ILLEGAL
// PORT: Fixed ROM slots 23163.
            if slot <> 23163 or instruction <> 1655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23164 {
// PORT: SOURCE P20-P25.agc:1105
//		TC	R23LEM3		# RECYCLE -- TO ANOTHER MANEUVER
// PORT: Fixed ROM slots 23164.
            if slot <> 23164 or instruction <> 1665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1665, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23165 {
// PORT: SOURCE P20-P25.agc:1106
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 23165.
                if slot <> 23165 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1107
//R23LEM2		TC	DOWNFLAG	# CLEAR NO ANGLE MONITOR FLAG
// PORT: Fixed ROM slots 23166.
                if slot <> 23166 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1508] to agcAotUnit1508@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1108
//		ADRES	NORRMON
// PORT: Fixed ROM slots 23167.
    23167, 172
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23168–23169.
function agcAotUnit1509 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23168 {
// PORT: SOURCE P20-P25.agc:1109
//		TC	GOTOV56		# AND EXIT VIA V56
// PORT: Fixed ROM slots 23168.
        if slot <> 23168 or instruction <> 3090 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3090, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1110
//R23LEM3		TC	BANKCALL
// PORT: Fixed ROM slots 23169.
        if slot <> 23169 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1509] to agcAotUnit1509@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1111
//		CADR	R61LEM
// PORT: Fixed ROM slots 23170.
    23170, 39068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23171–23171.
function agcAotUnit1510 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1112
//		TC	R23LEM1
// PORT: Fixed ROM slots 23171.
    if slot <> 23171 or instruction <> 1635 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1635, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1510] to agcAotUnit1510@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1113
//
// PORT: SOURCE P20-P25.agc:1114
//OCT501PV	OCT	501
// PORT: Fixed ROM slots 23172.
    23172, 642,
// PORT: SOURCE P20-P25.agc:1115
//OCT205		OCT	205
// PORT: Fixed ROM slots 23173.
    23173, 266
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23174–23174.
function agcAotUnit1511 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1116
//
// PORT: SOURCE P20-P25.agc:1117
//# Page 515
// PORT: SOURCE P20-P25.agc:1118
//# SEARCH ROUTINE R24LEM
// PORT: SOURCE P20-P25.agc:1119
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:1120
//#
// PORT: SOURCE P20-P25.agc:1121
//#	MOD NO -- 2
// PORT: SOURCE P20-P25.agc:1122
//#	BY P. VOLANTE
// PORT: SOURCE P20-P25.agc:1123
//#
// PORT: SOURCE P20-P25.agc:1124
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:1125
//#
// PORT: SOURCE P20-P25.agc:1126
//#	TO ACQUIRE THE CSM BY A SEARCH PATTERN WHEN THE RENDEZVOUS RADAR HAS
// PORT: SOURCE P20-P25.agc:1127
//#	FAILED TO ACQUIRE TEH CSM IN THE AUTOMATIC TRACKING MODE AND TO ALLOW
// PORT: SOURCE P20-P25.agc:1128
//# 	THE ASTRONAUT TO CONFIRM THAT REACQUISITION HAS NOT BEEN IN SIDELOBE.
// PORT: SOURCE P20-P25.agc:1129
//#
// PORT: SOURCE P20-P25.agc:1130
//# CALLING SEQUENCE
// PORT: SOURCE P20-P25.agc:1131
//#
// PORT: SOURCE P20-P25.agc:1132
//#	CAF	PRIONN
// PORT: SOURCE P20-P25.agc:1133
//#	TC	FINDVAC
// PORT: SOURCE P20-P25.agc:1134
//#	EBANK=	DATAGOOD
// PORT: SOURCE P20-P25.agc:1135
//#	2CADR	R24LEM
// PORT: SOURCE P20-P25.agc:1136
//#
// PORT: SOURCE P20-P25.agc:1137
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:1138
//#
// PORT: SOURCE P20-P25.agc:1139
//#	FLAGUP		FLAGDOWN	BANKCALL
// PORT: SOURCE P20-P25.agc:1140
//#	R61LEM		GOFLASHR	FINDVAC
// PORT: SOURCE P20-P25.agc:1141
//#	ENDOFJOB	NOVAC		LSR24.1
// PORT: SOURCE P20-P25.agc:1142
//#
// PORT: SOURCE P20-P25.agc:1143
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:1144
//#
// PORT: SOURCE P20-P25.agc:1145
//#	ASTRONAUT RESPONSE TO DISPLAY OF OMEGA AND DATAGOOD.  HE CAN EITHER
// PORT: SOURCE P20-P25.agc:1146
//# 	REJECT BY TERMINATING (SEARCH OPTION AND RESELECTING P20) OR ACCEPT BY
// PORT: SOURCE P20-P25.agc:1147
//#	PROCEEDING (EXIT ROUTINE AND RETURN TO AUTO MODE IN P20)
// PORT: SOURCE P20-P25.agc:1148
//#
// PORT: SOURCE P20-P25.agc:1149
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:1150
//#
// PORT: SOURCE P20-P25.agc:1151
//#	SEE NORMAL EXIT MODES ABOVE
// PORT: SOURCE P20-P25.agc:1152
//#
// PORT: SOURCE P20-P25.agc:1153
//# OUTPUT --
// PORT: SOURCE P20-P25.agc:1154
//#
// PORT: SOURCE P20-P25.agc:1155
//#	SEE OUTPUT FROM LSR24.1 + R61LEM
// PORT: SOURCE P20-P25.agc:1156
//#
// PORT: SOURCE P20-P25.agc:1157
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:1158
//#
// PORT: SOURCE P20-P25.agc:1159
//#	SET INPUT FOR LSR24.1
// PORT: SOURCE P20-P25.agc:1160
//#
// PORT: SOURCE P20-P25.agc:1161
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:1162
//#
// PORT: SOURCE P20-P25.agc:1163
//#	SRCHOPT, ACMODFLG
// PORT: SOURCE P20-P25.agc:1164
//
// PORT: SOURCE P20-P25.agc:1165
//		EBANK=	DATAGOOD
// PORT: SOURCE P20-P25.agc:1166
//		COUNT*	$$/R24
// PORT: SOURCE P20-P25.agc:1167
//R24LEM		TC	UPFLAG
// PORT: Fixed ROM slots 23174.
    if slot <> 23174 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1511] to agcAotUnit1511@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1168
//		ADRES	SRCHOPTN	# SET SRCHOPT FLAG
// PORT: Fixed ROM slots 23175.
    23175, 62
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23176–23176.
function agcAotUnit1512 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1169
//		TC	DOWNFLAG	# RESET LOS BEING COMPUTED FLAG TO MAKE
// PORT: Fixed ROM slots 23176.
    if slot <> 23176 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1512] to agcAotUnit1512@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1170
//		ADRES	LOSCMFLG	# SURE DODES DOESN'T GO TO R21
// PORT: Fixed ROM slots 23177.
    23177, 66
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23178–23182.
function agcAotUnit1513 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23179 {
        if slot <= 23178 {
// PORT: SOURCE P20-P25.agc:1171
//R24LEM1		CAF	ZERO
// PORT: Fixed ROM slots 23178.
            if slot <> 23178 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1172
//		TS	DATAGOOD	# ZERO OUT DATA INDICATOR
// PORT: Fixed ROM slots 23179.
            if slot <> 23179 or instruction <> 23515 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23515, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23180 {
// PORT: SOURCE P20-P25.agc:1173
//		TS	OMEGAD		# ZERO OMEGA DISPLAY REGS
// PORT: Fixed ROM slots 23180.
            if slot <> 23180 or instruction <> 23516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23181 {
// PORT: SOURCE P20-P25.agc:1174
//		TS	OMEGAD +1	# ZERO OMEGA DISPLAY REGS
// PORT: Fixed ROM slots 23181.
                if slot <> 23181 or instruction <> 23517 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23517, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1175
//R24LEM2		TC	PHASCHNG
// PORT: Fixed ROM slots 23182.
                if slot <> 23182 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1513] to agcAotUnit1513@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1176
//		OCT	04022
// PORT: Fixed ROM slots 23183.
    23183, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23184–23185.
function agcAotUnit1514 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23184 {
// PORT: SOURCE P20-P25.agc:1177
//		CAF	V16N80
// PORT: Fixed ROM slots 23184.
        if slot <> 23184 or instruction <> 13996 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1708), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1178
//		TC	BANKCALL
// PORT: Fixed ROM slots 23185.
        if slot <> 23185 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1514] to agcAotUnit1514@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1179
//		CADR	PRIODSPR
// PORT: Fixed ROM slots 23186.
    23186, 17032
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23187–23190.
function agcAotUnit1515 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23188 {
        if slot <= 23187 {
// PORT: SOURCE P20-P25.agc:1180
//		TC	GOTOV56
// PORT: Fixed ROM slots 23187.
            if slot <> 23187 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1181
//		TC	R24END		# PROCEED EXIT R24 TO P20LEM1
// PORT: Fixed ROM slots 23188.
            if slot <> 23188 or instruction <> 1688 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1688, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23189 {
// PORT: SOURCE P20-P25.agc:1182
//
// PORT: SOURCE P20-P25.agc:1183
//		TC	R24LEM3		# RECYCLE -- CALL R61 TO MANEUVER S/C
// PORT: Fixed ROM slots 23189.
            if slot <> 23189 or instruction <> 1692 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1692, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1184
//# Page 516
// PORT: SOURCE P20-P25.agc:1185
//		TC	BANKCALL
// PORT: Fixed ROM slots 23190.
            if slot <> 23190 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1515] to agcAotUnit1515@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1186
//		CADR	LRS24.1
// PORT: Fixed ROM slots 23191.
    23191, 46660
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23192–23192.
function agcAotUnit1516 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1187
//R24END		TC	KILLTASK
// PORT: Fixed ROM slots 23192.
    if slot <> 23192 or instruction <> 3095 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3095, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1516] to agcAotUnit1516@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1188
//		CADR	CALLDGCH
// PORT: Fixed ROM slots 23193.
    23193, 46918
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23194–23195.
function agcAotUnit1517 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23194 {
// PORT: SOURCE P20-P25.agc:1189
//		TC	CLRADMOD	# CLEAR BITS 10 & 15 OF RADMODES.
// PORT: Fixed ROM slots 23194.
        if slot <> 23194 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1190
//		TCF	P20LEM1		# AND GO TO 400 MI. RANGE CHECK IN P20
// PORT: Fixed ROM slots 23195.
        if slot <> 23195 or instruction <> 5171 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5171, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1517] to agcAotUnit1517@.

// PORT: Physical bank 03. Shared continuation entries, slots 5129–5136.
function agcAotUnit251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5132 {
        if slot <= 5130 {
            if slot <= 5129 {
// PORT: SOURCE P20-P25.agc:1191
//
// PORT: SOURCE P20-P25.agc:1192
//		BLOCK	3
// PORT: SOURCE P20-P25.agc:1193
//		SETLOC	FFTAG6
// PORT: SOURCE P20-P25.agc:1194
//		BANK
// PORT: SOURCE P20-P25.agc:1195
//		COUNT*	$$/R24
// PORT: SOURCE P20-P25.agc:1196
//
// PORT: SOURCE P20-P25.agc:1197
//CLRADMOD	CS	BIT10+15
// PORT: Fixed ROM slots 5129.
                if slot <> 5129 or instruction <> 19473 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3089), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1198
//		INHINT
// PORT: Fixed ROM slots 5130.
                if slot <> 5130 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5131 {
// PORT: SOURCE P20-P25.agc:1199
//		MASK	RADMODES
// PORT: Fixed ROM slots 5131.
                if slot <> 5131 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1200
//		TS	RADMODES
// PORT: Fixed ROM slots 5132.
                if slot <> 5132 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5134 {
            if slot <= 5133 {
// PORT: SOURCE P20-P25.agc:1201
//		CS	BIT2		# DISABLE RR ERROR COUNTERS
// PORT: Fixed ROM slots 5133.
                if slot <> 5133 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1202
//		EXTEND
// PORT: Fixed ROM slots 5134.
                if slot <> 5134 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5135 {
// PORT: SOURCE P20-P25.agc:1203
//		WAND	CHAN12		# USER WILL RELINT
// PORT: Fixed ROM slots 5135.
                if slot <> 5135 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1204
//
// PORT: SOURCE P20-P25.agc:1205
//		TC	Q
// PORT: Fixed ROM slots 5136.
                if slot <> 5136 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[251] to agcAotUnit251@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1206
//
// PORT: SOURCE P20-P25.agc:1207
//BIT10+15	OCT	41000
// PORT: Fixed ROM slots 5137.
    5137, 33792
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23196–23196.
function agcAotUnit1518 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1208
//		BANK	24
// PORT: SOURCE P20-P25.agc:1209
//		SETLOC	P20S
// PORT: SOURCE P20-P25.agc:1210
//		BANK
// PORT: SOURCE P20-P25.agc:1211
//		COUNT*	$$/R24
// PORT: SOURCE P20-P25.agc:1212
//
// PORT: SOURCE P20-P25.agc:1213
//R24LEM3		TC	PHASCHNG
// PORT: Fixed ROM slots 23196.
    if slot <> 23196 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1518] to agcAotUnit1518@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1214
//		OCT	04022
// PORT: Fixed ROM slots 23197.
    23197, 4132
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23198–23198.
function agcAotUnit1519 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1215
//		TC	KILLTASK
// PORT: Fixed ROM slots 23198.
    if slot <> 23198 or instruction <> 3095 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3095, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1519] to agcAotUnit1519@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1216
//		CADR	CALLDGCH	# KILL WAITLIST FOR NEXT POINT IN PATTERN
// PORT: Fixed ROM slots 23199.
    23199, 46918
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23200–23203.
function agcAotUnit1520 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23201 {
        if slot <= 23200 {
// PORT: SOURCE P20-P25.agc:1217
//		TC	CLRADMOD	# CLEAR BITS 10 + 15 OF RADMODES TO KILL
// PORT: Fixed ROM slots 23200.
            if slot <> 23200 or instruction <> 3081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1218
//		RELINT			# HALF SECOND DESIGNATE LOOP
// PORT: Fixed ROM slots 23201.
            if slot <> 23201 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23202 {
// PORT: SOURCE P20-P25.agc:1219
//		CAF	.5SEC
// PORT: Fixed ROM slots 23202.
            if slot <> 23202 or instruction <> 14844 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2556), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1220
//		TC	BANKCALL	# WAIT FOR DESIGNATE LOOP TO DIE
// PORT: Fixed ROM slots 23203.
            if slot <> 23203 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1520] to agcAotUnit1520@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1221
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 23204.
    23204, 1978
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23205–23207.
function agcAotUnit1521 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23205 {
// PORT: SOURCE P20-P25.agc:1222
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE
// PORT: Fixed ROM slots 23205.
        if slot <> 23205 or instruction <> 1463 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1463, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23206 {
// PORT: SOURCE P20-P25.agc:1223
//		TC	R24LEM4		# YES -- DON'T DO ATTITUDE MANEUVER
// PORT: Fixed ROM slots 23206.
            if slot <> 23206 or instruction <> 1705 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1705, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1224
//		TC	BANKCALL	# CALL R61 TO DO PREFERRED TRACKING
// PORT: Fixed ROM slots 23207.
            if slot <> 23207 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1521] to agcAotUnit1521@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1225
//		CADR	R61LEM		# ATTITUDE MANEUVER
// PORT: Fixed ROM slots 23208.
    23208, 39068
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23209–23211.
function agcAotUnit1522 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23209 {
// PORT: SOURCE P20-P25.agc:1226
//R24LEM4		CAF	ZERO		# ZERO OUT RADCADR (WHICH WAS SET BY
// PORT: Fixed ROM slots 23209.
        if slot <> 23209 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23210 {
// PORT: SOURCE P20-P25.agc:1227
//		TS	RADCADR		# ENDRADAR WHEN DESIGNATE STOPPED) SO THAT
// PORT: Fixed ROM slots 23210.
            if slot <> 23210 or instruction <> 23238 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23238, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1228
//					# RRDESSM WILL RETURN TO CALLER
// PORT: SOURCE P20-P25.agc:1229
//		TC	R24LEM2		# AND GO BACK TO PUT UP V16 N80 DISPLAY
// PORT: Fixed ROM slots 23211.
            if slot <> 23211 or instruction <> 1678 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1678, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1522] to agcAotUnit1522@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1230
//
// PORT: SOURCE P20-P25.agc:1231
//V16N80		VN	01680
// PORT: Fixed ROM slots 23212.
    23212, 4256
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21582–21584.
function agcAotUnit1339 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21582 {
// PORT: SOURCE P20-P25.agc:1232
//
// PORT: SOURCE P20-P25.agc:1233
//# Page 517
// PORT: SOURCE P20-P25.agc:1234
//# PREFERRED TRACKING ATTITUDE ROUTINE R61LEM
// PORT: SOURCE P20-P25.agc:1235
//# PROGRAM DESCRIPTION
// PORT: SOURCE P20-P25.agc:1236
//#
// PORT: SOURCE P20-P25.agc:1237
//#	MOD NO: 3		DATE: 4-11-67
// PORT: SOURCE P20-P25.agc:1238
//#	MOD BY: P. VOLANTE, SDC
// PORT: SOURCE P20-P25.agc:1239
//#
// PORT: SOURCE P20-P25.agc:1240
//# FUNCTIONAL DESCRIPTION --
// PORT: SOURCE P20-P25.agc:1241
//#
// PORT: SOURCE P20-P25.agc:1242
//#	TO COMPUTE THE PREFERRED TRACKING ATTITUDE OF THE LM TO ENABLE RR
// PORT: SOURCE P20-P25.agc:1243
//#	TRACKING OF THE CSM AND TO PERFORM THE MANEUVER TO THE PREFERRED
// PORT: SOURCE P20-P25.agc:1244
//#	ATTITUDE.
// PORT: SOURCE P20-P25.agc:1245
//#
// PORT: SOURCE P20-P25.agc:1246
//# CALLING SEQUENCE --
// PORT: SOURCE P20-P25.agc:1247
//#
// PORT: SOURCE P20-P25.agc:1248
//#	TC	BANKCALL
// PORT: SOURCE P20-P25.agc:1249
//#	CADR	R61LEM
// PORT: SOURCE P20-P25.agc:1250
//#
// PORT: SOURCE P20-P25.agc:1251
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:1252
//#
// PORT: SOURCE P20-P25.agc:1253
//#	LPS20.1		VECPOINT
// PORT: SOURCE P20-P25.agc:1254
//#	KALCMAN3
// PORT: SOURCE P20-P25.agc:1255
//#
// PORT: SOURCE P20-P25.agc:1256
//# NORMAL EXIT MODES --
// PORT: SOURCE P20-P25.agc:1257
//#
// PORT: SOURCE P20-P25.agc:1258
//#	NORMAL RETURN IS TO CALLER + 1
// PORT: SOURCE P20-P25.agc:1259
//#
// PORT: SOURCE P20-P25.agc:1260
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE P20-P25.agc:1261
//#
// PORT: SOURCE P20-P25.agc:1262
//#	TERMINATE P20 + R61 BY BRANCHING TO P20END IF BOTH TRACKFLAG +
// PORT: SOURCE P20-P25.agc:1263
//#	RENDEZVOUS FLAG ARE NOT SET.
// PORT: SOURCE P20-P25.agc:1264
//#
// PORT: SOURCE P20-P25.agc:1265
//# OUTPUT --
// PORT: SOURCE P20-P25.agc:1266
//#
// PORT: SOURCE P20-P25.agc:1267
//#	SEE OUTPUT FOR LPS20.1 + ATTITUDE MANEUVER ROUTINE (R60)
// PORT: SOURCE P20-P25.agc:1268
//#
// PORT: SOURCE P20-P25.agc:1269
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P20-P25.agc:1270
//#
// PORT: SOURCE P20-P25.agc:1271
//#	GENRET USED TO SAVE Q FOR RETURN
// PORT: SOURCE P20-P25.agc:1272
//#
// PORT: SOURCE P20-P25.agc:1273
//# FLAGS SET + RESET
// PORT: SOURCE P20-P25.agc:1274
//#
// PORT: SOURCE P20-P25.agc:1275
//#	3AXISFLG
// PORT: SOURCE P20-P25.agc:1276
//#
// PORT: SOURCE P20-P25.agc:1277
//# DEBRIS
// PORT: SOURCE P20-P25.agc:1278
//#
// PORT: SOURCE P20-P25.agc:1279
//# 	SEE SUBROUTINES
// PORT: SOURCE P20-P25.agc:1280
//
// PORT: SOURCE P20-P25.agc:1281
//		SETLOC	R61
// PORT: SOURCE P20-P25.agc:1282
//		BANK
// PORT: SOURCE P20-P25.agc:1283
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1284
//		COUNT*	$$/R61
// PORT: SOURCE P20-P25.agc:1285
//R61LEM		TC	MAKECADR
// PORT: Fixed ROM slots 21582.
        if slot <> 21582 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21583 {
// PORT: SOURCE P20-P25.agc:1286
//		TS	GENRET
// PORT: Fixed ROM slots 21583.
            if slot <> 21583 or instruction <> 23139 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23139, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1287
//		TC	UPFLAG		# SET R61 FLAG
// PORT: Fixed ROM slots 21584.
            if slot <> 21584 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1339] to agcAotUnit1339@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1288
//		ADRES	R61FLAG
// PORT: Fixed ROM slots 21585.
    21585, 40
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21586–21589.
function agcAotUnit1340 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21587 {
        if slot <= 21586 {
// PORT: SOURCE P20-P25.agc:1289
//		TC	R61C+L01
// PORT: Fixed ROM slots 21586.
            if slot <> 21586 or instruction <> 1111 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1111, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1290
//R65LEM		TC	MAKECADR
// PORT: Fixed ROM slots 21587.
            if slot <> 21587 or instruction <> 2469 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2469, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21588 {
// PORT: SOURCE P20-P25.agc:1291
//		TS	GENRET
// PORT: Fixed ROM slots 21588.
            if slot <> 21588 or instruction <> 23139 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23139, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1292
//		TC	DOWNFLAG	# RESET R61 FLAG
// PORT: Fixed ROM slots 21589.
            if slot <> 21589 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1340] to agcAotUnit1340@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1293
//		ADRES	R61FLAG
// PORT: Fixed ROM slots 21590.
    21590, 40
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21591–21595.
function agcAotUnit1341 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21592 {
        if slot <= 21591 {
// PORT: SOURCE P20-P25.agc:1294
//R61C+L01	CAF	TRACKBIT	# TRACKFLAG
// PORT: Fixed ROM slots 21591.
            if slot <> 21591 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1295
//		MASK	STATE +1
// PORT: Fixed ROM slots 21592.
            if slot <> 21592 or instruction <> 28733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21593 {
// PORT: SOURCE P20-P25.agc:1296
//		EXTEND
// PORT: Fixed ROM slots 21593.
            if slot <> 21593 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21594 {
// PORT: SOURCE P20-P25.agc:1297
//		BZF	R65WAIT		# NOT SET
// PORT: Fixed ROM slots 21594.
                if slot <> 21594 or instruction <> 5305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5305, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1298
//R61C+L03	TC	INTPRET
// PORT: Fixed ROM slots 21595.
                if slot <> 21595 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1341] to agcAotUnit1341@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1299
//		VLOAD
// PORT: Fixed ROM slots 21596.
    21596, 65530,
// PORT: SOURCE P20-P25.agc:1300
//# Page 518
// PORT: SOURCE P20-P25.agc:1301
//			HIUNITZ
// PORT: Fixed ROM slots 21597.
    21597, 6808,
// PORT: SOURCE P20-P25.agc:1302
//		STORE	SCAXIS		# TRACK AXIS UNIT VECTOR
// PORT: Fixed ROM slots 21598.
    21598, 4074,
// PORT: SOURCE P20-P25.agc:1303
//R61LEM1		RTB	DAD
// PORT: Fixed ROM slots 21599.
    21599, 36152,
// PORT: SOURCE P20-P25.agc:1304
//			LOADTIME	# EXTRAPOLATE FORWARD TO CENTER
// PORT: Fixed ROM slots 21600.
    21600, 18166,
// PORT: SOURCE P20-P25.agc:1305
//			3SECONDS	# SIX SECOND PERIOD.
// PORT: Fixed ROM slots 21601.
    21601, 14228,
// PORT: SOURCE P20-P25.agc:1306
//		STCALL	TDEC1
// PORT: Fixed ROM slots 21602.
    21602, 28738,
// PORT: SOURCE P20-P25.agc:1307
//			LPS20.1		# LOS DETERMINATION + VEH ATTITUDE
// PORT: Fixed ROM slots 21603.
    21603, 42330,
// PORT: SOURCE P20-P25.agc:1308
//		VLOAD
// PORT: Fixed ROM slots 21604.
    21604, 65530,
// PORT: SOURCE P20-P25.agc:1309
//			RRTARGET
// PORT: Fixed ROM slots 21605.
    21605, 1156,
// PORT: SOURCE P20-P25.agc:1310
//		STORE	POINTVSM
// PORT: Fixed ROM slots 21606.
    21606, 4086,
// PORT: SOURCE P20-P25.agc:1311
//		RTB	CALL		# GET DESIRED CDU'S FOR VECPNT1
// PORT: Fixed ROM slots 21607.
    21607, 37944,
// PORT: SOURCE P20-P25.agc:1312
//			READCDUD
// PORT: Fixed ROM slots 21608.
    21608, 39294,
// PORT: SOURCE P20-P25.agc:1313
//			VECPNT1		# COMPUTES FINAL ANGLES FROM PRESENT CDUDS
// PORT: Fixed ROM slots 21609.
    21609, 47156,
// PORT: SOURCE P20-P25.agc:1314
//		STORE	CPHI		# STORE FINAL ANGLES -- CPHI, CTHETA, CPSI
// PORT: Fixed ROM slots 21610.
    21610, 420,
// PORT: SOURCE P20-P25.agc:1315
//		EXIT
// PORT: Fixed ROM slots 21611.
    21611, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21612–21612.
function agcAotUnit1342 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1316
//		TC	PHASCHNG
// PORT: Fixed ROM slots 21612.
    if slot <> 21612 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1342] to agcAotUnit1342@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1317
//		OCT	04022
// PORT: Fixed ROM slots 21613.
    21613, 4132
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21614–21618.
function agcAotUnit1343 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21615 {
        if slot <= 21614 {
// PORT: SOURCE P20-P25.agc:1318
//		CAF	TRACKBIT	# IS TRACK FLAG SET
// PORT: Fixed ROM slots 21614.
            if slot <> 21614 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1319
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 21615.
            if slot <> 21615 or instruction <> 28733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21616 {
// PORT: SOURCE P20-P25.agc:1320
//		EXTEND
// PORT: Fixed ROM slots 21616.
            if slot <> 21616 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21617 {
// PORT: SOURCE P20-P25.agc:1321
//		BZF	R65WAIT
// PORT: Fixed ROM slots 21617.
                if slot <> 21617 or instruction <> 5305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5305, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1322
//		TC	BANKCALL
// PORT: Fixed ROM slots 21618.
                if slot <> 21618 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1343] to agcAotUnit1343@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1323
//		CADR	G+N,AUTO	# CHECK FOR AUTO MODE
// PORT: Fixed ROM slots 21619.
    21619, 45402
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21620–21622.
function agcAotUnit1344 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21620 {
// PORT: SOURCE P20-P25.agc:1324
//		CCS	A
// PORT: Fixed ROM slots 21620.
        if slot <> 21620 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21621 {
// PORT: SOURCE P20-P25.agc:1325
//		TC	R61C+L04	# NOT IN AUTO
// PORT: Fixed ROM slots 21621.
            if slot <> 21621 or instruction <> 1199 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1199, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1326
//		TC	INTPRET
// PORT: Fixed ROM slots 21622.
            if slot <> 21622 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1344] to agcAotUnit1344@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1327
//		VLOAD	CALL
// PORT: Fixed ROM slots 21623.
    21623, 38138,
// PORT: SOURCE P20-P25.agc:1328
//			RRTARGET
// PORT: Fixed ROM slots 21624.
    21624, 1156,
// PORT: SOURCE P20-P25.agc:1329
//			CDU*SMNB
// PORT: Fixed ROM slots 21625.
    21625, 40780,
// PORT: SOURCE P20-P25.agc:1330
//		DLOAD	DSU		# GET PHI -- ARCCOS OF Z-COMPONENT OF LOS
// PORT: Fixed ROM slots 21626.
    21626, 38346,
// PORT: SOURCE P20-P25.agc:1331
//			MPAC +5
// PORT: Fixed ROM slots 21627.
    21627, 228,
// PORT: SOURCE P20-P25.agc:1332
//			COS15DEG
// PORT: Fixed ROM slots 21628.
    21628, 6522,
// PORT: SOURCE P20-P25.agc:1333
//R61LEM2		BMN	EXIT		# BRANCH -- PHI > 15 DEGREES
// PORT: Fixed ROM slots 21629.
    21629, 65088,
// PORT: SOURCE P20-P25.agc:1334
//			R61C+L05	# PHI GRE 10DEG
// PORT: Fixed ROM slots 21630.
    21630, 39190
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21631–21642.
function agcAotUnit1345 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21636 {
        if slot <= 21633 {
            if slot <= 21631 {
// PORT: SOURCE P20-P25.agc:1335
//		EBANK=	CDUXD
// PORT: SOURCE P20-P25.agc:1336
//		CAF	EBANK6
// PORT: Fixed ROM slots 21631.
                if slot <> 21631 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21632 {
// PORT: SOURCE P20-P25.agc:1337
//		TS	EBANK
// PORT: Fixed ROM slots 21632.
                    if slot <> 21632 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1338
//		INHINT
// PORT: Fixed ROM slots 21633.
                    if slot <> 21633 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21634 {
// PORT: SOURCE P20-P25.agc:1339
//		EXTEND
// PORT: Fixed ROM slots 21634.
                if slot <> 21634 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21635 {
// PORT: SOURCE P20-P25.agc:1340
//		DCA	CPHI
// PORT: Fixed ROM slots 21635.
                    if slot <> 21635 or instruction <> 12498 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 210, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1341
//		DXCH	CDUXD
// PORT: Fixed ROM slots 21636.
                    if slot <> 21636 or instruction <> 22430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 926, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21639 {
            if slot <= 21637 {
// PORT: SOURCE P20-P25.agc:1342
//		CA	CPSI
// PORT: Fixed ROM slots 21637.
                if slot <> 21637 or instruction <> 12499 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 211).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21638 {
// PORT: SOURCE P20-P25.agc:1343
//		TS	CDUZD
// PORT: Fixed ROM slots 21638.
                    if slot <> 21638 or instruction <> 23455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23455, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1344
//		RELINT
// PORT: Fixed ROM slots 21639.
                    if slot <> 21639 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21640 {
// PORT: SOURCE P20-P25.agc:1345
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1346
//		CAF	EBANK7
// PORT: Fixed ROM slots 21640.
                if slot <> 21640 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21641 {
// PORT: SOURCE P20-P25.agc:1347
//		TS	EBANK
// PORT: Fixed ROM slots 21641.
                    if slot <> 21641 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1348
//		TC	R61C+L06
// PORT: Fixed ROM slots 21642.
                    if slot <> 21642 or instruction <> 1182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1182, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1345] to agcAotUnit1345@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1349
//R61C+L05	EXIT
// PORT: Fixed ROM slots 21643.
    21643, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21644–21645.
function agcAotUnit1346 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21644 {
// PORT: SOURCE P20-P25.agc:1350
//		INHINT
// PORT: Fixed ROM slots 21644.
        if slot <> 21644 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1351
//# Page 519
// PORT: SOURCE P20-P25.agc:1352
//		TC	IBNKCALL
// PORT: Fixed ROM slots 21645.
        if slot <> 21645 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1346] to agcAotUnit1346@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1353
//		FCADR	ZATTEROR
// PORT: Fixed ROM slots 21646.
    21646, 32982
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21647–21647.
function agcAotUnit1347 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1354
//		TC	IBNKCALL
// PORT: Fixed ROM slots 21647.
    if slot <> 21647 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1347] to agcAotUnit1347@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1355
//		FCADR	SETMINDB	# REDUCE ATTITUDE ERROR
// PORT: Fixed ROM slots 21648.
    21648, 32960
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21649–21649.
function agcAotUnit1348 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1356
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 21649.
    if slot <> 21649 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1348] to agcAotUnit1348@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1357
//		ADRES	3AXISFLG
// PORT: Fixed ROM slots 21650.
    21650, 168
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21651–21651.
function agcAotUnit1349 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1358
//		TC	UPFLAG
// PORT: Fixed ROM slots 21651.
    if slot <> 21651 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1349] to agcAotUnit1349@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1359
//		ADRES	PDSPFLAG	# SET PRIORITY DISPLAY FLAG
// PORT: Fixed ROM slots 21652.
    21652, 126
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21653–21653.
function agcAotUnit1350 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1360
//		TC	BANKCALL
// PORT: Fixed ROM slots 21653.
    if slot <> 21653 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1350] to agcAotUnit1350@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1361
//		CADR	R60LEM
// PORT: Fixed ROM slots 21654.
    21654, 45222
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21655–21656.
function agcAotUnit1351 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21655 {
// PORT: SOURCE P20-P25.agc:1362
//		INHINT
// PORT: Fixed ROM slots 21655.
        if slot <> 21655 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1363
//		TC	IBNKCALL
// PORT: Fixed ROM slots 21656.
        if slot <> 21656 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1351] to agcAotUnit1351@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1364
//		FCADR	RESTORDB
// PORT: Fixed ROM slots 21657.
    21657, 32934
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21658–21658.
function agcAotUnit1352 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1365
//		TC	PHASCHNG
// PORT: Fixed ROM slots 21658.
    if slot <> 21658 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1352] to agcAotUnit1352@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1366
//		OCT	04022
// PORT: Fixed ROM slots 21659.
    21659, 4132
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21660–21660.
function agcAotUnit1353 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1367
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 21660.
    if slot <> 21660 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1353] to agcAotUnit1353@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1368
//		ADRES	PDSPFLAG	# RESET PRIORITY DISPLAY FLAG
// PORT: Fixed ROM slots 21661.
    21661, 126
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21662–21671.
function agcAotUnit1354 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21666 {
        if slot <= 21663 {
            if slot <= 21662 {
// PORT: SOURCE P20-P25.agc:1369
//R61C+L06	CA	FLAGWRD1
// PORT: Fixed ROM slots 21662.
                if slot <> 21662 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1370
//		MASK	R61FLBIT
// PORT: Fixed ROM slots 21663.
                if slot <> 21663 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 21664 {
// PORT: SOURCE P20-P25.agc:1371
//		CCS	A
// PORT: Fixed ROM slots 21664.
                if slot <> 21664 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21665 {
// PORT: SOURCE P20-P25.agc:1372
//		TC	R61C+L4
// PORT: Fixed ROM slots 21665.
                    if slot <> 21665 or instruction <> 1202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1202, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1373
//		CCS	R65CNTR
// PORT: Fixed ROM slots 21666.
                    if slot <> 21666 or instruction <> 5093 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 997).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21668 {
            if slot <= 21667 {
// PORT: SOURCE P20-P25.agc:1374
//		TC	+2
// PORT: Fixed ROM slots 21667.
                if slot <> 21667 or instruction <> 1189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1189, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1375
//		TC	R61C+L4		# R65CNTR = 0 - EXIT ROUTINE
// PORT: Fixed ROM slots 21668.
                if slot <> 21668 or instruction <> 1202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1202, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21669 {
// PORT: SOURCE P20-P25.agc:1376
//		TS	R65CNTR
// PORT: Fixed ROM slots 21669.
                if slot <> 21669 or instruction <> 23525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23525, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21670 {
// PORT: SOURCE P20-P25.agc:1377
//		CAF	06SEC
// PORT: Fixed ROM slots 21670.
                    if slot <> 21670 or instruction <> 13502 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1214), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1378
//		TC	TWIDDLE
// PORT: Fixed ROM slots 21671.
                    if slot <> 21671 or instruction <> 2683 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1354] to agcAotUnit1354@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1379
//		ADRES	R61C+L2
// PORT: Fixed ROM slots 21672.
    21672, 2388
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21673–21675.
function agcAotUnit1355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21673 {
// PORT: SOURCE P20-P25.agc:1380
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 21673.
        if slot <> 21673 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21674 {
// PORT: SOURCE P20-P25.agc:1381
//R61C+L2		CAF	PRIO26
// PORT: Fixed ROM slots 21674.
            if slot <> 21674 or instruction <> 16332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1382
//		TC	FINDVAC
// PORT: Fixed ROM slots 21675.
            if slot <> 21675 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1355] to agcAotUnit1355@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1383
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1384
//		2CADR	R61C+L01
// PORT: Fixed ROM slots 21676 21677.
    21676, 2222, 21677, 39022
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21678–21679.
function agcAotUnit1356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21678 {
// PORT: SOURCE P20-P25.agc:1385
//
// PORT: SOURCE P20-P25.agc:1386
//		TC	TASKOVER
// PORT: Fixed ROM slots 21678.
        if slot <> 21678 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1387
//R61C+L04	TC	BANKCALL	# TO CONVERT ANGLES TO FDAI
// PORT: Fixed ROM slots 21679.
        if slot <> 21679 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1356] to agcAotUnit1356@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1388
//		CADR	BALLANGS
// PORT: Fixed ROM slots 21680.
    21680, 45420
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21681–21689.
function agcAotUnit1357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21684 {
        if slot <= 21682 {
            if slot <= 21681 {
// PORT: SOURCE P20-P25.agc:1389
//		TC	R61C+L06
// PORT: Fixed ROM slots 21681.
                if slot <> 21681 or instruction <> 1182 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1182, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1390
//R61C+L4		CAE	GENRET
// PORT: Fixed ROM slots 21682.
                if slot <> 21682 or instruction <> 12899 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 611).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21683 {
// PORT: SOURCE P20-P25.agc:1391
//		TCF	BANKJUMP	# EXIT R61
// PORT: Fixed ROM slots 21683.
                if slot <> 21683 or instruction <> 6560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1392
//R61C+L1		CAF	BIT7+9PV	# IS RENDEZVOUS OR P25FLAG SET
// PORT: Fixed ROM slots 21684.
                if slot <> 21684 or instruction <> 13499 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1211), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21686 {
            if slot <= 21685 {
// PORT: SOURCE P20-P25.agc:1393
//		MASK	STATE
// PORT: Fixed ROM slots 21685.
                if slot <> 21685 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1394
//		EXTEND
// PORT: Fixed ROM slots 21686.
                if slot <> 21686 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21687 {
// PORT: SOURCE P20-P25.agc:1395
//		BZF	ENDOFJOB	# NO -- EXIT ROUTINE AND PROGRAM.
// PORT: Fixed ROM slots 21687.
                if slot <> 21687 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21688 {
// PORT: SOURCE P20-P25.agc:1396
//		TC	R61C+L06	# YES EXIT ROUTINE
// PORT: Fixed ROM slots 21688.
                    if slot <> 21688 or instruction <> 1182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1182, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1397
//R65WAIT		TC	POSTJUMP
// PORT: Fixed ROM slots 21689.
                    if slot <> 21689 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1357] to agcAotUnit1357@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1398
//		CADR	P20LEMWT
// PORT: Fixed ROM slots 21690.
    21690, 41268,
// PORT: SOURCE P20-P25.agc:1399
//
// PORT: SOURCE P20-P25.agc:1400
//BIT7+9PV	OCT	00500
// PORT: Fixed ROM slots 21691.
    21691, 640,
// PORT: SOURCE P20-P25.agc:1401
//# Page 520
// PORT: SOURCE P20-P25.agc:1402
//COS15DEG	2DEC	0.96593 B-1
// PORT: Fixed ROM slots 21692 21693.
    21692, 15824, 21693, 29444,
// PORT: SOURCE P20-P25.agc:1403
//
// PORT: SOURCE P20-P25.agc:1404
//06SEC		DEC	600
// PORT: Fixed ROM slots 21694.
    21694, 1200
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21695–21707.
function agcAotUnit1358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21700 {
        if slot <= 21697 {
            if slot <= 21695 {
// PORT: SOURCE P20-P25.agc:1405
//PHI		EQUALS	20D
// PORT: SOURCE P20-P25.agc:1406
//READCDUD	INHINT			# READS DESIRED CDU'S AND STORES IN
// PORT: Fixed ROM slots 21695.
                if slot <> 21695 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21696 {
// PORT: SOURCE P20-P25.agc:1407
//		CAF	EBANK6		# MPAC TP EXITS WITH MODE SET TO TP
// PORT: Fixed ROM slots 21696.
                    if slot <> 21696 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1408
//		XCH	EBANK
// PORT: Fixed ROM slots 21697.
                    if slot <> 21697 or instruction <> 23555 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 3, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21698 {
// PORT: SOURCE P20-P25.agc:1409
//		TS	RUPTREG1
// PORT: Fixed ROM slots 21698.
                if slot <> 21698 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21699 {
// PORT: SOURCE P20-P25.agc:1410
//		EBANK=	CDUXD
// PORT: SOURCE P20-P25.agc:1411
//		CA	CDUXD
// PORT: Fixed ROM slots 21699.
                    if slot <> 21699 or instruction <> 13213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 925).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1412
//		TS	MPAC
// PORT: Fixed ROM slots 21700.
                    if slot <> 21700 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21703 {
            if slot <= 21701 {
// PORT: SOURCE P20-P25.agc:1413
//		EXTEND
// PORT: Fixed ROM slots 21701.
                if slot <> 21701 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21702 {
// PORT: SOURCE P20-P25.agc:1414
//		DCA	CDUYD
// PORT: Fixed ROM slots 21702.
                    if slot <> 21702 or instruction <> 13215 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 927, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1415
//		DXCH	MPAC +1
// PORT: Fixed ROM slots 21703.
                    if slot <> 21703 or instruction <> 21614 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21705 {
                if slot <= 21704 {
// PORT: SOURCE P20-P25.agc:1416
//		CA	RUPTREG1
// PORT: Fixed ROM slots 21704.
                    if slot <> 21704 or instruction <> 12344 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 56).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1417
//		TS	EBANK
// PORT: Fixed ROM slots 21705.
                    if slot <> 21705 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21706 {
// PORT: SOURCE P20-P25.agc:1418
//		RELINT
// PORT: Fixed ROM slots 21706.
                    if slot <> 21706 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1419
//		TCF	TMODE
// PORT: Fixed ROM slots 21707.
                    if slot <> 21707 or instruction <> 7487 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7487, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1358] to agcAotUnit1358@.

// PORT: Physical bank 02. Shared continuation entries, slots 4426–4430.
function agcAotUnit166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4427 {
        if slot <= 4426 {
// PORT: SOURCE P20-P25.agc:1420
//		BLOCK	02
// PORT: SOURCE P20-P25.agc:1421
//		SETLOC	RADARFF
// PORT: SOURCE P20-P25.agc:1422
//		BANK
// PORT: SOURCE P20-P25.agc:1423
//
// PORT: SOURCE P20-P25.agc:1424
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1425
//		COUNT*	$$/RRSUB
// PORT: SOURCE P20-P25.agc:1426
//
// PORT: SOURCE P20-P25.agc:1427
//# Page 521
// PORT: SOURCE P20-P25.agc:1428
//# THE FOLLOWING SUBROUTINE RETURNS TO CALLER +2 IF THE ABSOLUTE VALUE OF VALUE OF C(A) IS GREATER THAN THE
// PORT: SOURCE P20-P25.agc:1429
//# NEGATIVE OF THE NUMBER AT CALLER +1.  OTHERWISE IT RETURNS TO CALLER +3.  MAY BE CALLED IN RUPT OR UNDER EXEC.
// PORT: SOURCE P20-P25.agc:1430
//
// PORT: SOURCE P20-P25.agc:1431
//MAGSUB		EXTEND
// PORT: Fixed ROM slots 4426.
            if slot <> 4426 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1432
//		BZMF	+2
// PORT: Fixed ROM slots 4427.
            if slot <> 4427 or instruction <> 26957 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26957, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4428 {
// PORT: SOURCE P20-P25.agc:1433
//		TCF	+2
// PORT: Fixed ROM slots 4428.
            if slot <> 4428 or instruction <> 6478 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6478, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4429 {
// PORT: SOURCE P20-P25.agc:1434
//		COM
// PORT: Fixed ROM slots 4429.
                if slot <> 4429 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1435
//
// PORT: SOURCE P20-P25.agc:1436
//		INDEX	Q
// PORT: Fixed ROM slots 4430.
                if slot <> 4430 or instruction <> 20482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[166] to agcAotUnit166@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1437
//		AD	0
// PORT: Fixed ROM slots 4431.
    4431, 49152
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4432–4436.
function agcAotUnit167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4433 {
        if slot <= 4432 {
// PORT: SOURCE P20-P25.agc:1438
//		EXTEND
// PORT: Fixed ROM slots 4432.
            if slot <> 4432 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1439
//		BZMF	Q+2		# ABS(A) <= CONST GO TO L+3
// PORT: Fixed ROM slots 4433.
            if slot <> 4433 or instruction <> 28129 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 28129, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4434 {
// PORT: SOURCE P20-P25.agc:1440
//		TCF	Q+1		# ABS(A) > CONST GO TO L+2
// PORT: Fixed ROM slots 4434.
            if slot <> 4434 or instruction <> 7647 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7647, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4435 {
// PORT: SOURCE P20-P25.agc:1441
//
// PORT: SOURCE P20-P25.agc:1442
//# Page 522
// PORT: SOURCE P20-P25.agc:1443
//# PROGRAM NAME:	RRLIMCHK
// PORT: SOURCE P20-P25.agc:1444
//#
// PORT: SOURCE P20-P25.agc:1445
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1446
//#
// PORT: SOURCE P20-P25.agc:1447
//#	RRLIMCHK CHECKS RR DESIRED GIMBAL ANGLES TO SEE IF THEY ARE WITHIN
// PORT: SOURCE P20-P25.agc:1448
//# 	THE LIMITS OF THE CURRENT MODE.  INITIALLY THE DESIRED TRUNNION AND
// PORT: SOURCE P20-P25.agc:1449
//#	SHAFT ANGLES ARE STORED IN ITEMP1 AND ITEMP2.  THE CURRENT RR
// PORT: SOURCE P20-P25.agc:1450
//# 	ANTENNAE MODE (RADMODES BIT 12) IS CHECKED WHICH IS = 0 FOR
// PORT: SOURCE P20-P25.agc:1451
//#	MODE 1 AND =1 FOR MODE 2.
// PORT: SOURCE P20-P25.agc:1452
//#
// PORT: SOURCE P20-P25.agc:1453
//#	MODE 1 -- THE TRUNNION ANGLE IS CHECKED AT MAGSUB TO SEE IF IT IS
// PORT: SOURCE P20-P25.agc:1454
//#	BETWEEN -55 AND +55 DEGREES.  IF NOT, RETURN TO L +2.  IF WITHIN LIMITS,
// PORT: SOURCE P20-P25.agc:1455
//#	THE SHAFT ANGLE IS CHECKED TO SEE IF IT IS BETWEEN -70 AND +59 DEGREES.
// PORT: SOURCE P20-P25.agc:1456
//#	IF NOT, RETURN TO L +2.  IF IN LIMITS, RETURN TO L +3.
// PORT: SOURCE P20-P25.agc:1457
//#
// PORT: SOURCE P20-P25.agc:1458
//#	MODE 2 -- THE SHAFT ANGLE IS CHECKED AT MAGSUB TO SEE IF IT IS
// PORT: SOURCE P20-P25.agc:1459
//#	BETWEEN -139 AND -25 DEGREES.  IF NOT, RETURN TO L +2.  IF WITHIN
// PORT: SOURCE P20-P25.agc:1460
//#	LIMITS, THE TRUNNION ANGLE IS CHECKED TO SEE IF IT IS BETWEEN +125
// PORT: SOURCE P20-P25.agc:1461
//# 	AND -125 (+235) DEGREES.  IF NOT, RETURN TO L +2.  IF IN LIMITS, RETURN
// PORT: SOURCE P20-P25.agc:1462
//#	TO L +3.
// PORT: SOURCE P20-P25.agc:1463
//#
// PORT: SOURCE P20-P25.agc:1464
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:1465
//#
// PORT: SOURCE P20-P25.agc:1466
//#	L  TC  RLIMCHK (WITH INTERRUPT INHIBITED)
// PORT: SOURCE P20-P25.agc:1467
//#	L  +1  ADRES  T,S  (DESIRED TRUNNION ANGLE ADDRESS)
// PORT: SOURCE P20-P25.agc:1468
//#
// PORT: SOURCE P20-P25.agc:1469
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1470
//#
// PORT: SOURCE P20-P25.agc:1471
//#	RADMODES, MODEA, MODEB (OR DESIRED TRUNNION AND SHAFT
// PORT: SOURCE P20-P25.agc:1472
//#	ANGLES ELSEWHERE IN CONSECUTIVE LOCATIONS -- UNSWITCHED ERASABLE OR
// PORT: SOURCE P20-P25.agc:1473
//#	CURRENT EBANK).
// PORT: SOURCE P20-P25.agc:1474
//#
// PORT: SOURCE P20-P25.agc:1475
//# SUBROUTINES CALLED:	MAGSUB
// PORT: SOURCE P20-P25.agc:1476
//#
// PORT: SOURCE P20-P25.agc:1477
//# JOBS OR TASKS INITIATED:  NONE
// PORT: SOURCE P20-P25.agc:1478
//#
// PORT: SOURCE P20-P25.agc:1479
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:1480
//#
// PORT: SOURCE P20-P25.agc:1481
//# EXIT:		L + 2	(EITHER OR BOTH ANGLES NOT WITHIN LIMITS OF CURRENT MODE)
// PORT: SOURCE P20-P25.agc:1482
//#		L + 3	(BOTH ANGLES WITHIN LIMITS OF CURRENT MODE)
// PORT: SOURCE P20-P25.agc:1483
//
// PORT: SOURCE P20-P25.agc:1484
//RRLIMCHK	EXTEND
// PORT: Fixed ROM slots 4435.
                if slot <> 4435 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1485
//		INDEX	Q
// PORT: Fixed ROM slots 4436.
                if slot <> 4436 or instruction <> 20482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[167] to agcAotUnit167@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1486
//		INDEX	0
// PORT: Fixed ROM slots 4437.
    4437, 40960,
// PORT: SOURCE P20-P25.agc:1487
//		DCA	0
// PORT: Fixed ROM slots 4438.
    4438, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4439–4447.
function agcAotUnit168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4442 {
        if slot <= 4440 {
            if slot <= 4439 {
// PORT: SOURCE P20-P25.agc:1488
//		INCR	Q
// PORT: Fixed ROM slots 4439.
                if slot <> 4439 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1489
//		DXCH	ITEMP1
// PORT: Fixed ROM slots 4440.
                if slot <> 4440 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4441 {
// PORT: SOURCE P20-P25.agc:1490
//		LXCH	Q		# L(CALLER +2) TO L.
// PORT: Fixed ROM slots 4441.
                if slot <> 4441 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1491
//
// PORT: SOURCE P20-P25.agc:1492
//		CAF	ANTENBIT	# SEE WHICH MODE RR IS IN.
// PORT: Fixed ROM slots 4442.
                if slot <> 4442 or instruction <> 14816 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4444 {
            if slot <= 4443 {
// PORT: SOURCE P20-P25.agc:1493
//		MASK	RADMODES
// PORT: Fixed ROM slots 4443.
                if slot <> 4443 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1494
//		CCS	A
// PORT: Fixed ROM slots 4444.
                if slot <> 4444 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4445 {
// PORT: SOURCE P20-P25.agc:1495
//		TCF	MODE2CHK
// PORT: Fixed ROM slots 4445.
                if slot <> 4445 or instruction <> 6504 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6504, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4446 {
// PORT: SOURCE P20-P25.agc:1496
//
// PORT: SOURCE P20-P25.agc:1497
//		CA	ITEMP1		# MODE 1 IS DEFINED AS
// PORT: Fixed ROM slots 4446.
                    if slot <> 4446 or instruction <> 12337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1498
//# Page 523
// PORT: SOURCE P20-P25.agc:1499
//		TC	MAGSUB		# 	1. ABS(T) L 55 DEGS.
// PORT: Fixed ROM slots 4447.
                    if slot <> 4447 or instruction <> 2378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2378, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[168] to agcAotUnit168@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1500
//		DEC	-.30555		# 	2. ABS(S + 5.5 DEGS) L 64.5 DEGS
// PORT: Fixed ROM slots 4448.
    4448, 55522
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4449–4452.
function agcAotUnit169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4450 {
        if slot <= 4449 {
// PORT: SOURCE P20-P25.agc:1501
//		TC	L		#		(SHAFT LIMITS AT +59, -70 DEGS)
// PORT: Fixed ROM slots 4449.
            if slot <> 4449 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1502
//
// PORT: SOURCE P20-P25.agc:1503
//		CAF	5.5DEGS
// PORT: Fixed ROM slots 4450.
            if slot <> 4450 or instruction <> 14706 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2418), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4451 {
// PORT: SOURCE P20-P25.agc:1504
//		AD	ITEMP2
// PORT: Fixed ROM slots 4451.
            if slot <> 4451 or instruction <> 24626 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1505
//		TC	MAGSUB
// PORT: Fixed ROM slots 4452.
            if slot <> 4452 or instruction <> 2378 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2378, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[169] to agcAotUnit169@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1506
//		DEC	-.35833		# 64.5 DEGS
// PORT: Fixed ROM slots 4453.
    4453, 53792
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4454–4458.
function agcAotUnit170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4455 {
        if slot <= 4454 {
// PORT: SOURCE P20-P25.agc:1507
//		TC	L
// PORT: Fixed ROM slots 4454.
            if slot <> 4454 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1508
//		TC	RRLIMOK		# IN LIMITS.
// PORT: Fixed ROM slots 4455.
            if slot <> 4455 or instruction <> 2416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4456 {
// PORT: SOURCE P20-P25.agc:1509
//
// PORT: SOURCE P20-P25.agc:1510
//MODE2CHK	CAF	82DEGS		# MODE 2 IS DEFINED AS
// PORT: Fixed ROM slots 4456.
            if slot <> 4456 or instruction <> 14707 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2419), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4457 {
// PORT: SOURCE P20-P25.agc:1511
//		AD	ITEMP2		#	1. ABS(T) G 125 DEGS.
// PORT: Fixed ROM slots 4457.
                if slot <> 4457 or instruction <> 24626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1512
//		TC	MAGSUB		#	2. ABS(S + 82 DEGS) L 57 DEGS
// PORT: Fixed ROM slots 4458.
                if slot <> 4458 or instruction <> 2378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[170] to agcAotUnit170@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1513
//		DEC	-.31667		#		(SHAFT LIMITS AT -25, -139 DEGS)
// PORT: Fixed ROM slots 4459.
    4459, 55158
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4460–4462.
function agcAotUnit171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4460 {
// PORT: SOURCE P20-P25.agc:1514
//		TC	L
// PORT: Fixed ROM slots 4460.
        if slot <> 4460 or instruction <> 1 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4461 {
// PORT: SOURCE P20-P25.agc:1515
//
// PORT: SOURCE P20-P25.agc:1516
//		CA	ITEMP1
// PORT: Fixed ROM slots 4461.
            if slot <> 4461 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1517
//		TC	MAGSUB
// PORT: Fixed ROM slots 4462.
            if slot <> 4462 or instruction <> 2378 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2378, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[171] to agcAotUnit171@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1518
//		DEC	-.69444		# 125 DEGS
// PORT: Fixed ROM slots 4463.
    4463, 42778
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4464–4464.
function agcAotUnit172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1519
//
// PORT: SOURCE P20-P25.agc:1520
//RRLIMOK		INDEX	L
// PORT: Fixed ROM slots 4464.
    if slot <> 4464 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[172] to agcAotUnit172@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1521
//		TC	L		# ( = TC 1 )
// PORT: Fixed ROM slots 4465.
    4465, 2,
// PORT: SOURCE P20-P25.agc:1522
//
// PORT: SOURCE P20-P25.agc:1523
//5.5DEGS		DEC	.03056
// PORT: Fixed ROM slots 4466.
    4466, 1002,
// PORT: SOURCE P20-P25.agc:1524
//82DEGS		DEC	.45556
// PORT: Fixed ROM slots 4467.
    4467, 14928
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4468–4492.
function agcAotUnit173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4479 {
        if slot <= 4473 {
            if slot <= 4470 {
                if slot <= 4468 {
// PORT: SOURCE P20-P25.agc:1525
//
// PORT: SOURCE P20-P25.agc:1526
//# Page 524
// PORT: SOURCE P20-P25.agc:1527
//# PROGRAM NAME:	SETTRKF
// PORT: SOURCE P20-P25.agc:1528
//#
// PORT: SOURCE P20-P25.agc:1529
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1530
//#
// PORT: SOURCE P20-P25.agc:1531
//# 	SETTRKF UPDATES THE TRACKER FAIL LAMP ON THE DSKY.
// PORT: SOURCE P20-P25.agc:1532
//#	INITIALLY THE LAMP TEST FLAG (IMODES33 BIT 1) IS CHECKED.
// PORT: SOURCE P20-P25.agc:1533
//# 	IF A LAMP TEST IS IN PROGRESS, THE PROGRAM EXITS TO L +1.
// PORT: SOURCE P20-P25.agc:1534
//#	IF NO LAMP TEST THE FOLLOWING IS CHECKED SEQUENTIALLY:
// PORT: SOURCE P20-P25.agc:1535
//#		1) RR CDU'S BEING ZEROED, RR CDU OK, AND RR NOT IN
// PORT: SOURCE P20-P25.agc:1536
//#		   AUTO MODE (RADMODES BITS 13, 7, 2).
// PORT: SOURCE P20-P25.agc:1537
//#		2) LR VEL DATA FAIL AND NO LR POS DATA (RADMODES BITS
// PORT: SOURCE P20-P25.agc:1538
//#		   8,5)
// PORT: SOURCE P20-P25.agc:1539
//#		3) NO RR DATA (RADMODES BIT 4)
// PORT: SOURCE P20-P25.agc:1540
//#	THE ABSENCE OF ALL THREE SIMULTANEOUSLY IN (1), THE PRESENCE OF BOTH
// PORT: SOURCE P20-P25.agc:1541
//#	IN (2), AND THE PRESENCE OF (3) RESULTS IN EITHER THE TRACKER FAIL
// PORT: SOURCE P20-P25.agc:1542
//#	LAMP (DSPTAB +11D BIT 8) BEING TURNED OFF OR IS LEFT OFF.  THEREFORE, THE
// PORT: SOURCE P20-P25.agc:1543
//#	TRACKER FAIL LAMP IS TURN ON IF:
// PORT: SOURCE P20-P25.agc:1544
//#		A) RR CDU FAILED WITH RR IN AUTO MODE AND RR CDU'S NOT BEING ZEROED
// PORT: SOURCE P20-P25.agc:1545
//#		B) N SAMPLES OF LR DATA COULD NOT BE TAKEN IN 2N TRIES WITH
// PORT: SOURCE P20-P25.agc:1546
//#		   EITHER THE ALT OR VEL INFORMATION
// PORT: SOURCE P20-P25.agc:1547
//#		C) N SAMPLES OF RR DATA COULD NOT BE OBTAINED FROM 2N TRIES
// PORT: SOURCE P20-P25.agc:1548
//#		   WITH EITHER THE AL
// PORT: SOURCE P20-P25.agc:1549
//#
// PORT: SOURCE P20-P25.agc:1550
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:1551
//#
// PORT: SOURCE P20-P25.agc:1552
//#	L	TC	SETTRKF
// PORT: SOURCE P20-P25.agc:1553
//#
// PORT: SOURCE P20-P25.agc:1554
//# ERASABLE INITIALIZATION REQUIRED:  IMODES33, RADMODES, DSPTAB +11D
// PORT: SOURCE P20-P25.agc:1555
//#
// PORT: SOURCE P20-P25.agc:1556
//# SUBROUTINES CALLED:  NONE
// PORT: SOURCE P20-P25.agc:1557
//#
// PORT: SOURCE P20-P25.agc:1558
//# JOBS OR TASKS INITIATED:  NONE
// PORT: SOURCE P20-P25.agc:1559
//#
// PORT: SOURCE P20-P25.agc:1560
//# ALARMS:  TRACKER FAIL LAMP
// PORT: SOURCE P20-P25.agc:1561
//#
// PORT: SOURCE P20-P25.agc:1562
//# EXIT:  L +1 (ALWAYS)
// PORT: SOURCE P20-P25.agc:1563
//
// PORT: SOURCE P20-P25.agc:1564
//SETTRKF		CAF	BIT1		# NO ACTION IF DURING LAMP TEST
// PORT: Fixed ROM slots 4468.
                    if slot <> 4468 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4469 {
// PORT: SOURCE P20-P25.agc:1565
//		MASK	IMODES33
// PORT: Fixed ROM slots 4469.
                        if slot <> 4469 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1566
//		CCS	A
// PORT: Fixed ROM slots 4470.
                        if slot <> 4470 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 4471 {
// PORT: SOURCE P20-P25.agc:1567
//		TC	Q
// PORT: Fixed ROM slots 4471.
                    if slot <> 4471 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4472 {
// PORT: SOURCE P20-P25.agc:1568
//
// PORT: SOURCE P20-P25.agc:1569
//RRTRKF		CA	BIT8
// PORT: Fixed ROM slots 4472.
                        if slot <> 4472 or instruction <> 14820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1570
//		TS	L
// PORT: Fixed ROM slots 4473.
                        if slot <> 4473 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4476 {
                if slot <= 4474 {
// PORT: SOURCE P20-P25.agc:1571
//
// PORT: SOURCE P20-P25.agc:1572
//		CAF	13,7,2		# SEE IF CDU FAILED.
// PORT: Fixed ROM slots 4474.
                    if slot <> 4474 or instruction <> 14733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2445), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4475 {
// PORT: SOURCE P20-P25.agc:1573
//		MASK	RADMODES
// PORT: Fixed ROM slots 4475.
                        if slot <> 4475 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1574
//		EXTEND
// PORT: Fixed ROM slots 4476.
                        if slot <> 4476 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4477 {
// PORT: SOURCE P20-P25.agc:1575
//		BZF	TRKFLON		# CONDITION 3 ABOVE.
// PORT: Fixed ROM slots 4477.
                    if slot <> 4477 or instruction <> 6529 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4478 {
// PORT: SOURCE P20-P25.agc:1576
//
// PORT: SOURCE P20-P25.agc:1577
//RRCHECK		CAF	RRDATABT	# SEE IF RR DATA FAILED.
// PORT: Fixed ROM slots 4478.
                        if slot <> 4478 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1578
//		MASK	RADMODES
// PORT: Fixed ROM slots 4479.
                        if slot <> 4479 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4485 {
            if slot <= 4482 {
                if slot <= 4480 {
// PORT: SOURCE P20-P25.agc:1579
//# Page 525
// PORT: SOURCE P20-P25.agc:1580
//		CCS	A
// PORT: Fixed ROM slots 4480.
                    if slot <> 4480 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4481 {
// PORT: SOURCE P20-P25.agc:1581
//TRKFLON		CA	L
// PORT: Fixed ROM slots 4481.
                        if slot <> 4481 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1582
//		AD	DSPTAB +11D	# HALF ADD DESIRED AND PRESENT STATES.
// PORT: Fixed ROM slots 4482.
                        if slot <> 4482 or instruction <> 25118 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 4483 {
// PORT: SOURCE P20-P25.agc:1583
//		MASK	L
// PORT: Fixed ROM slots 4483.
                    if slot <> 4483 or instruction <> 28673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4484 {
// PORT: SOURCE P20-P25.agc:1584
//		EXTEND
// PORT: Fixed ROM slots 4484.
                        if slot <> 4484 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1585
//		BZF	TCQ		# NO CHANGE.
// PORT: Fixed ROM slots 4485.
                        if slot <> 4485 or instruction <> 7650 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7650, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4488 {
                if slot <= 4486 {
// PORT: SOURCE P20-P25.agc:1586
//
// PORT: SOURCE P20-P25.agc:1587
//FLIP		CA	DSPTAB +11D	# CAN'T USE LXCH DSPTAB +11D (RESTART PROB)
// PORT: Fixed ROM slots 4486.
                    if slot <> 4486 or instruction <> 12830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 542).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4487 {
// PORT: SOURCE P20-P25.agc:1588
//		EXTEND
// PORT: Fixed ROM slots 4487.
                        if slot <> 4487 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1589
//		RXOR	LCHAN
// PORT: Fixed ROM slots 4488.
                        if slot <> 4488 or instruction <> 3073 { return choose false if checkOnly else -1. }
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
                if slot <= 4490 {
                    if slot <= 4489 {
// PORT: SOURCE P20-P25.agc:1590
//		MASK	POSMAX
// PORT: Fixed ROM slots 4489.
                        if slot <> 4489 or instruction <> 31195 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:1591
//		AD	BIT15
// PORT: Fixed ROM slots 4490.
                        if slot <> 4490 or instruction <> 27101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4491 {
// PORT: SOURCE P20-P25.agc:1592
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 4491.
                        if slot <> 4491 or instruction <> 23070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:1593
//		TC	Q
// PORT: Fixed ROM slots 4492.
                        if slot <> 4492 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[173] to agcAotUnit173@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1594
//
// PORT: SOURCE P20-P25.agc:1595
//13,7,2		OCT	10102
// PORT: Fixed ROM slots 4493.
    4493, 8324
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23602–23603.
function agcAotUnit1549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23602 {
// PORT: SOURCE P20-P25.agc:1596
//ENDRMODF	EQUALS
// PORT: SOURCE P20-P25.agc:1597
//
// PORT: SOURCE P20-P25.agc:1598
//# Page 526
// PORT: SOURCE P20-P25.agc:1599
//# PROGRAM NAME:  RRTURNON
// PORT: SOURCE P20-P25.agc:1600
//#
// PORT: SOURCE P20-P25.agc:1601
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1602
//#
// PORT: SOURCE P20-P25.agc:1603
//#	RRTURNON IS THE TURN-ON SEQUENCE WHICH, ALONG WTIH
// PORT: SOURCE P20-P25.agc:1604
//#	RRZEROSB, ZEROES THE CDU'S AND DETERMINES THE RR MODE.
// PORT: SOURCE P20-P25.agc:1605
//#	INITIALLY, CONTROL IS TRANSFERRED TO RRZEROSB FOR THE
// PORT: SOURCE P20-P25.agc:1606
//#	ACTUAL TURN-ON SEQUENCE.  UPON RETURN THE PROGRAM
// PORT: SOURCE P20-P25.agc:1607
//#	WAITS 1 SECOND BEFORE REMOVING THE TURN-ON FLAG
// PORT: SOURCE P20-P25.agc:1608
//#	(RADMODES BIT1) SO THE REPOSITION ROUTINE WON'T
// PORT: SOURCE P20-P25.agc:1609
//#	INITIATE PROGRAM ALARM 00501.  A CHECK IS THEN MADE
// PORT: SOURCE P20-P25.agc:1610
//#	TO SEE IF A PROGRAM IS USING THE RR (STATE BIT 7).  IF
// PORT: SOURCE P20-P25.agc:1611
//#	SO, THE PROGRAM EXITS TO ENDRADAR SO THAT THE RR CDU
// PORT: SOURCE P20-P25.agc:1612
//#	FAIL FLAG (RADMODES BIT 7) CAN BE CHECKED BEFORE
// PORT: SOURCE P20-P25.agc:1613
//#	RETURNING TO THE WAITING PROGRAM.  IF NOT, THE PROGRAM EXITS
// PORT: SOURCE P20-P25.agc:1614
//#	TO TASKOVER.
// PORT: SOURCE P20-P25.agc:1615
//#
// PORT: SOURCE P20-P25.agc:1616
//# CALLING SEQUENCE:  WAITLIST TASK FROM RRAUTCHK IF THE RR POWER-ON AUTO
// PORT: SOURCE P20-P25.agc:1617
//# BIT (CHAN 33 BIT 2) CHANGES TO 0 AND NO PROGRAM WAS USING
// PORT: SOURCE P20-P25.agc:1618
//# THE RR (STATE BIT 7).
// PORT: SOURCE P20-P25.agc:1619
//#
// PORT: SOURCE P20-P25.agc:1620
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1621
//#
// PORT: SOURCE P20-P25.agc:1622
//#	RADMODES, STATE
// PORT: SOURCE P20-P25.agc:1623
//#
// PORT: SOURCE P20-P25.agc:1624
//# SUBROUTINES CALLED:  RRZEROSB, FIXDELAY, TASKOVER, ENDRADAR
// PORT: SOURCE P20-P25.agc:1625
//#
// PORT: SOURCE P20-P25.agc:1626
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:1627
//#
// PORT: SOURCE P20-P25.agc:1628
//#	NONE
// PORT: SOURCE P20-P25.agc:1629
//#
// PORT: SOURCE P20-P25.agc:1630
//# ALARMS:  NONE (SEE RRZEROSB)
// PORT: SOURCE P20-P25.agc:1631
//#
// PORT: SOURCE P20-P25.agc:1632
//# EXIT:  TASKOVER, ENDRADAR (WAITING PROGRAM)
// PORT: SOURCE P20-P25.agc:1633
//
// PORT: SOURCE P20-P25.agc:1634
//		BANK	24
// PORT: SOURCE P20-P25.agc:1635
//		SETLOC	P20S1
// PORT: SOURCE P20-P25.agc:1636
//		BANK
// PORT: SOURCE P20-P25.agc:1637
//
// PORT: SOURCE P20-P25.agc:1638
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:1639
//		COUNT*	$$/RSUB
// PORT: SOURCE P20-P25.agc:1640
//RRTURNON	TC	RRZEROSB
// PORT: Fixed ROM slots 23602.
        if slot <> 23602 or instruction <> 1081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:1641
//		TC	FIXDELAY	# WAIT 1 SEC BEFORE REMOVING TURN ON FLAG
// PORT: Fixed ROM slots 23603.
        if slot <> 23603 or instruction <> 2705 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2705, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1549] to agcAotUnit1549@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1642
//		DEC	100		# SO A MONITOR REPOSITION WON'T ALARM.
// PORT: Fixed ROM slots 23604.
    23604, 200
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23605–23614.
function agcAotUnit1550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23609 {
        if slot <= 23606 {
            if slot <= 23605 {
// PORT: SOURCE P20-P25.agc:1643
//		CS	TURNONBT
// PORT: Fixed ROM slots 23605.
                if slot <> 23605 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1644
//		MASK	RADMODES
// PORT: Fixed ROM slots 23606.
                if slot <> 23606 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23607 {
// PORT: SOURCE P20-P25.agc:1645
//		TS	RADMODES
// PORT: Fixed ROM slots 23607.
                if slot <> 23607 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23608 {
// PORT: SOURCE P20-P25.agc:1646
//		TCF	TASKOVER
// PORT: Fixed ROM slots 23608.
                    if slot <> 23608 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1647
//# Page 527
// PORT: SOURCE P20-P25.agc:1648
//# PROGRAM NAME:  RRZEROSB
// PORT: SOURCE P20-P25.agc:1649
//#
// PORT: SOURCE P20-P25.agc:1650
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1651
//#
// PORT: SOURCE P20-P25.agc:1652
//#	RRZEROSB IS A CLOSED SUBROUTINE TO ZERO THE RR CDU'S,
// PORT: SOURCE P20-P25.agc:1653
//#	DETERMINE THE RR MODE, AND TURN ON THE TRACKER FAIL
// PORT: SOURCE P20-P25.agc:1654
//#	LAMP IF REQUIRED.  INITIALLY THE RR CDU ZERO BIT (CHAN 12
// PORT: SOURCE P20-P25.agc:1655
//#	BIT 1) IS SET.  FOLLOWING A 20 MILLISECOND WAIT, THE LGC
// PORT: SOURCE P20-P25.agc:1656
//#	RR CDU COUNTERS (OPTY, OPTX) ARE SET = 0 AFTER
// PORT: SOURCE P20-P25.agc:1657
//# 	WHICH THE RR CDU ZERO DISCRETE (CHAN 12 BIT 1) IS
// PORT: SOURCE P20-P25.agc:1658
//#	REMOVED.  A 4 SECOND WAIT IS SET TO ALL THE RR CDU'S
// PORT: SOURCE P20-P25.agc:1659
//#	TO REPEAT THE ACTUAL TRUNNION AND SHAFT ANGLES.  THE
// PORT: SOURCE P20-P25.agc:1660
//#	RR CDU ZERO FLAG (RADMODES BIT 13) IS REMOVED.  THE
// PORT: SOURCE P20-P25.agc:1661
//#	CONTENTS OF OPTY IS THEN CHECKED TO SEE IF THE TRUNNION
// PORT: SOURCE P20-P25.agc:1662
//#	ANGLE IS LESS THAN 90 DEGREES.  IF NOT, BIT 12 OF
// PORT: SOURCE P20-P25.agc:1663
//#	RADMODES IS SET = 1 TO INDICATE RR ANTENNA MODE 2.
// PORT: SOURCE P20-P25.agc:1664
//#	IF LESS THAN 90 DEGREES, BIT 12 OF RADMODES IS SET = 0 TO
// PORT: SOURCE P20-P25.agc:1665
//#	INDICATE RR ANTENNA MODE 1.  SETTRKF IS THEN CALLED TO
// PORT: SOURCE P20-P25.agc:1666
//#	SEE IF THE TRACKER FAIL LAMP SHOULD BE TURNED ON.
// PORT: SOURCE P20-P25.agc:1667
//#
// PORT: SOURCE P20-P25.agc:1668
//# CALLING SEQUENCE:  L  TC  RRZEROSB  (FROM RRTURNON AND RRZERO)
// PORT: SOURCE P20-P25.agc:1669
//#
// PORT: SOURCE P20-P25.agc:1670
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1671
//#
// PORT: SOURCE P20-P25.agc:1672
//#	RADMODES (BIT 13 SET), DSPTAB +11D
// PORT: SOURCE P20-P25.agc:1673
//#
// PORT: SOURCE P20-P25.agc:1674
//# SUBROUTINES CALLED:  FIXDELAY, MAGSUB, SETTRKF
// PORT: SOURCE P20-P25.agc:1675
//#
// PORT: SOURCE P20-P25.agc:1676
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:1677
//#
// PORT: SOURCE P20-P25.agc:1678
//#	NONE
// PORT: SOURCE P20-P25.agc:1679
//#
// PORT: SOURCE P20-P25.agc:1680
//# ALARMS:  TRAKCER FAIL
// PORT: SOURCE P20-P25.agc:1681
//#
// PORT: SOURCE P20-P25.agc:1682
//# EXIT:  L +1 (ALWAYS)
// PORT: SOURCE P20-P25.agc:1683
//
// PORT: SOURCE P20-P25.agc:1684
//RRZEROSB	EXTEND
// PORT: Fixed ROM slots 23609.
                    if slot <> 23609 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23611 {
            if slot <= 23610 {
// PORT: SOURCE P20-P25.agc:1685
//		QXCH	RRRET
// PORT: Fixed ROM slots 23610.
                if slot <> 23610 or instruction <> 9933 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 717, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1686
//		CAF	BIT1		# BIT 13 OF RADMODES MUST BE SET BEFORE
// PORT: Fixed ROM slots 23611.
                if slot <> 23611 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 23612 {
// PORT: SOURCE P20-P25.agc:1687
//		EXTEND			# COMING HERE.
// PORT: Fixed ROM slots 23612.
                if slot <> 23612 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23613 {
// PORT: SOURCE P20-P25.agc:1688
//		WOR	CHAN12		# TURN ON ZERO RR CDU
// PORT: Fixed ROM slots 23613.
                    if slot <> 23613 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1689
//		TC	FIXDELAY
// PORT: Fixed ROM slots 23614.
                    if slot <> 23614 or instruction <> 2705 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2705, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1550] to agcAotUnit1550@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1690
//		DEC	2
// PORT: Fixed ROM slots 23615.
    23615, 4
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23616–23622.
function agcAotUnit1551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23618 {
        if slot <= 23616 {
// PORT: SOURCE P20-P25.agc:1691
//
// PORT: SOURCE P20-P25.agc:1692
//		CAF	ZERO
// PORT: Fixed ROM slots 23616.
            if slot <> 23616 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23617 {
// PORT: SOURCE P20-P25.agc:1693
//		TS	CDUT
// PORT: Fixed ROM slots 23617.
                if slot <> 23617 or instruction <> 22557 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22557, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1694
//		TS	CDUS
// PORT: Fixed ROM slots 23618.
                if slot <> 23618 or instruction <> 22558 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22558, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23620 {
            if slot <= 23619 {
// PORT: SOURCE P20-P25.agc:1695
//		CS	ONE		# REMOVE ZEROING BIT.
// PORT: Fixed ROM slots 23619.
                if slot <> 23619 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1696
//		EXTEND
// PORT: Fixed ROM slots 23620.
                if slot <> 23620 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23621 {
// PORT: SOURCE P20-P25.agc:1697
//		WAND	CHAN12
// PORT: Fixed ROM slots 23621.
                if slot <> 23621 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1698
//		TC	FIXDELAY
// PORT: Fixed ROM slots 23622.
                if slot <> 23622 or instruction <> 2705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2705, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1551] to agcAotUnit1551@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1699
//		DEC	1000		# RESET FAIL INHIBIT IN 10 SECS. -- D.281
// PORT: Fixed ROM slots 23623.
    23623, 2000
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23624–23628.
function agcAotUnit1552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23625 {
        if slot <= 23624 {
// PORT: SOURCE P20-P25.agc:1700
//
// PORT: SOURCE P20-P25.agc:1701
//		CS	RCDU0BIT	# REMOVE ZEROING IN PROCESS BIT
// PORT: Fixed ROM slots 23624.
            if slot <> 23624 or instruction <> 18911 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:1702
//# Page 528
// PORT: SOURCE P20-P25.agc:1703
//		MASK	RADMODES
// PORT: Fixed ROM slots 23625.
            if slot <> 23625 or instruction <> 28744 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 72).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23626 {
// PORT: SOURCE P20-P25.agc:1704
//		TS	RADMODES
// PORT: Fixed ROM slots 23626.
            if slot <> 23626 or instruction <> 22600 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22600, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23627 {
// PORT: SOURCE P20-P25.agc:1705
//
// PORT: SOURCE P20-P25.agc:1706
//		CA	CDUT
// PORT: Fixed ROM slots 23627.
                if slot <> 23627 or instruction <> 12317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 29).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1707
//		TC	MAGSUB
// PORT: Fixed ROM slots 23628.
                if slot <> 23628 or instruction <> 2378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1552] to agcAotUnit1552@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1708
//		DEC	-.5
// PORT: Fixed ROM slots 23629.
    23629, 49150
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23630–23640.
function agcAotUnit1553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23634 {
        if slot <= 23631 {
            if slot <= 23630 {
// PORT: SOURCE P20-P25.agc:1709
//		TCF	+3		# IF MODE 2.
// PORT: Fixed ROM slots 23630.
                if slot <> 23630 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1710
//
// PORT: SOURCE P20-P25.agc:1711
//		CAF	ZERO
// PORT: Fixed ROM slots 23631.
                if slot <> 23631 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23632 {
// PORT: SOURCE P20-P25.agc:1712
//		TCF	+2
// PORT: Fixed ROM slots 23632.
                if slot <> 23632 or instruction <> 5202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5202, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23633 {
// PORT: SOURCE P20-P25.agc:1713
//		CAF	ANTENBIT
// PORT: Fixed ROM slots 23633.
                    if slot <> 23633 or instruction <> 14816 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1714
//		XCH	RADMODES
// PORT: Fixed ROM slots 23634.
                    if slot <> 23634 or instruction <> 23624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 72, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23637 {
            if slot <= 23635 {
// PORT: SOURCE P20-P25.agc:1715
//		MASK	-BIT12
// PORT: Fixed ROM slots 23635.
                if slot <> 23635 or instruction <> 32737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4065), 32768).
                    if fixedOperand = 30719 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2048) * 1 + mod(floor(words[0] / 4096), 8) * 4096).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23636 {
// PORT: SOURCE P20-P25.agc:1716
//		ADS	RADMODES
// PORT: Fixed ROM slots 23636.
                    if slot <> 23636 or instruction <> 11336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1717
//
// PORT: SOURCE P20-P25.agc:1718
//		TC	SETTRKF		# TRACKER LAMP MIGHT GO ON NOW.
// PORT: Fixed ROM slots 23637.
                    if slot <> 23637 or instruction <> 2420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2420, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23638 {
// PORT: SOURCE P20-P25.agc:1719
//
// PORT: SOURCE P20-P25.agc:1720
//		TC	RRRET		# DONE.
// PORT: Fixed ROM slots 23638.
                if slot <> 23638 or instruction <> 717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23639 {
// PORT: SOURCE P20-P25.agc:1721
//
// PORT: SOURCE P20-P25.agc:1722
//-BIT12		EQUALS	-1/8		# IN SPROOT
// PORT: SOURCE P20-P25.agc:1723
//
// PORT: SOURCE P20-P25.agc:1724
//# Page 529
// PORT: SOURCE P20-P25.agc:1725
//# PROGRAM NAME:  DORREPOS
// PORT: SOURCE P20-P25.agc:1726
//#
// PORT: SOURCE P20-P25.agc:1727
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1728
//#
// PORT: SOURCE P20-P25.agc:1729
//#	DORREPOS IS A SEQUENCE OF TASKS TO DRIVE THE RENDEZVOUS RADAR
// PORT: SOURCE P20-P25.agc:1730
//#	TO A SAFE POSITION.  INIITALLY SETRRECR IS CALLED WHERE THE RR
// PORT: SOURCE P20-P25.agc:1731
//#	ERROR COUNTERS (CHAN 12 BIT 2) ARE ENABLED AND LASTYCMD
// PORT: SOURCE P20-P25.agc:1732
//#	AND LASTXCMD SET = 0 TO INDICATE THE DIFFERENCE BETWEEN THE
// PORT: SOURCE P20-P25.agc:1733
//#	DESIRED STATE AND PRESENT STATE OF THE COMMANDS.  THE RR
// PORT: SOURCE P20-P25.agc:1734
//#	TURN-ON FLAG (RADMODES BIT 1) IS CHECKED AND IF NOT PRESENT,
// PORT: SOURCE P20-P25.agc:1735
//#	PROGRAM ALARM 00501 IS REQUESTED BEFORE CONTINUING.  IN EITHER
// PORT: SOURCE P20-P25.agc:1736
//#	CASE, FOLLOWING A 20 MILLISECOND WAIT THE PROGRAM CHECKS THE CURRENT
// PORT: SOURCE P20-P25.agc:1737
//#	RR ANTENNA MODE (RADMODES BIT 12).  RRTONLY IS THEN CALLED
// PORT: SOURCE P20-P25.agc:1738
//#	TO DRIVE THE TRUNNION ANGLE TO 0 DEGREES IF IN MODE 1 AND TO 180
// PORT: SOURCE P20-P25.agc:1739
//#	DEGREES IF IN MODE 2.  UPON RETURN, THE CURRENT RR ANTENNA
// PORT: SOURCE P20-P25.agc:1740
//#	MODE (RADMODES BIT 12) IS AGAIN CHECKED.  RRSONLY IS THEN
// PORT: SOURCE P20-P25.agc:1741
//#	CALLED TO DRIVE THE SHAFT ANGLE TO 0 DEGREES IF IN MODE 1 AND TO
// PORT: SOURCE P20-P25.agc:1742
//#	-90 DEGREES IF IN MODE 2.  IF DURING RRTONLY OR RRSONLY A
// PORT: SOURCE P20-P25.agc:1743
//#	REMODE HAS BEEN REQUESTED (RADMODES BIT 14), AND ALWAYS
// PORT: SOURCE P20-P25.agc:1744
//#	FOLLOWING COMPLETION OF RRSONLY, CONTROL IS TRANFERRED TO
// PORT: SOURCE P20-P25.agc:1745
//#	REPOSRPT.  HERE THE REPOSITION FLAG (RADMODES BIT 11) IS
// PORT: SOURCE P20-P25.agc:1746
//#	REMOVED.  A CHECK IS THEN MADE ON THE DESIGNATE FLAG (RADMODES
// PORT: SOURCE P20-P25.agc:1747
//#	BIT 10).  IF PRESENT, CONTROL IS TRANSFERRED TO BEGDES.  IF NOT PRESENT
// PORT: SOURCE P20-P25.agc:1748
//#	INDICATING NO FURTHER ANTENNA CONTROL REQUIRED, THE RR ERROR
// PORT: SOURCE P20-P25.agc:1749
//#	COUNTER BIT (CHAN 12 BIT 2) IS REMOVED AND THE ROUTINE EXITS TO
// PORT: SOURCE P20-P25.agc:1750
//#	TASKOVER.
// PORT: SOURCE P20-P25.agc:1751
//#
// PORT: SOURCE P20-P25.agc:1752
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:1753
//#
// PORT: SOURCE P20-P25.agc:1754
//#	WAITLIST CALL FROM RRGIMON IF TRUNNION AND SHAFT CDU ANGLES
// PORT: SOURCE P20-P25.agc:1755
//#	NOT WITHIN LIMITS OF CURRENT MODE.
// PORT: SOURCE P20-P25.agc:1756
//#
// PORT: SOURCE P20-P25.agc:1757
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1758
//#
// PORT: SOURCE P20-P25.agc:1759
//#	RADMODES
// PORT: SOURCE P20-P25.agc:1760
//#
// PORT: SOURCE P20-P25.agc:1761
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:1762
//#
// PORT: SOURCE P20-P25.agc:1763
//#	RRTONLY, RRSONLY, BEGDES (EXIT)
// PORT: SOURCE P20-P25.agc:1764
//#
// PORT: SOURCE P20-P25.agc:1765
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:1766
//#
// PORT: SOURCE P20-P25.agc:1767
//#	NONE
// PORT: SOURCE P20-P25.agc:1768
//#
// PORT: SOURCE P20-P25.agc:1769
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:1770
//#
// PORT: SOURCE P20-P25.agc:1771
//# EXIT:  TASKOVER, BEGDES
// PORT: SOURCE P20-P25.agc:1772
//
// PORT: SOURCE P20-P25.agc:1773
//DORREPOS	TC	SETRRECR	# SET UP RR CDU ERROR COUNTERS.
// PORT: Fixed ROM slots 23639.
                    if slot <> 23639 or instruction <> 1134 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1134, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1774
//
// PORT: SOURCE P20-P25.agc:1775
//# ALARM 501 DELETED IN DANCE 279 PER PCR 97.
// PORT: SOURCE P20-P25.agc:1776
//
// PORT: SOURCE P20-P25.agc:1777
//		TC	FIXDELAY
// PORT: Fixed ROM slots 23640.
                    if slot <> 23640 or instruction <> 2705 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2705, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1553] to agcAotUnit1553@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1778
//		DEC	2
// PORT: Fixed ROM slots 23641.
    23641, 4
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23642–23704.
function agcAotUnit1554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23672 {
        if slot <= 23656 {
            if slot <= 23648 {
                if slot <= 23644 {
                    if slot <= 23642 {
// PORT: SOURCE P20-P25.agc:1779
//
// PORT: SOURCE P20-P25.agc:1780
//		CAF	ANTENBIT	# MANEUVER TRUNNION ANGLE TO NOMINAL POS.
// PORT: Fixed ROM slots 23642.
                        if slot <> 23642 or instruction <> 14816 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 23643 {
// PORT: SOURCE P20-P25.agc:1781
//# Page 530
// PORT: SOURCE P20-P25.agc:1782
//		MASK RADMODES
// PORT: Fixed ROM slots 23643.
                            if slot <> 23643 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1783
//		CCS	A
// PORT: Fixed ROM slots 23644.
                            if slot <> 23644 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 23646 {
                        if slot <= 23645 {
// PORT: SOURCE P20-P25.agc:1784
//		CAF	BIT15		# 0 FOR MODE 1 AND 180 FOR MODE 2.
// PORT: Fixed ROM slots 23645.
                            if slot <> 23645 or instruction <> 14813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1785
//		TC	RRTONLY
// PORT: Fixed ROM slots 23646.
                            if slot <> 23646 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23647 {
// PORT: SOURCE P20-P25.agc:1786
//
// PORT: SOURCE P20-P25.agc:1787
//		CAF	ANTENBIT	# NOT PUT SHAFT IN RIGHT POSITION
// PORT: Fixed ROM slots 23647.
                            if slot <> 23647 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1788
//		MASK	RADMODES
// PORT: Fixed ROM slots 23648.
                            if slot <> 23648 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 23652 {
                    if slot <= 23650 {
                        if slot <= 23649 {
// PORT: SOURCE P20-P25.agc:1789
//		CCS	A
// PORT: Fixed ROM slots 23649.
                            if slot <> 23649 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1790
//		CS	HALF		# -90 FOR MODE 2.
// PORT: Fixed ROM slots 23650.
                            if slot <> 23650 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23651 {
// PORT: SOURCE P20-P25.agc:1791
//		TC	RRSONLY
// PORT: Fixed ROM slots 23651.
                            if slot <> 23651 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1792
//
// PORT: SOURCE P20-P25.agc:1793
//REPOSRPT	CS	REPOSBIT	# RETURNS HERE FROM RR1AXIS IN REMODE
// PORT: Fixed ROM slots 23652.
                            if slot <> 23652 or instruction <> 18913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 23654 {
                        if slot <= 23653 {
// PORT: SOURCE P20-P25.agc:1794
//					# REQUESTED DURING REPOSITION.
// PORT: SOURCE P20-P25.agc:1795
//		MASK	RADMODES	# REMOVE REPOSITION BIT.
// PORT: Fixed ROM slots 23653.
                            if slot <> 23653 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1796
//		TS	RADMODES
// PORT: Fixed ROM slots 23654.
                            if slot <> 23654 or instruction <> 22600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22600, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23655 {
// PORT: SOURCE P20-P25.agc:1797
//		MASK	DESIGBIT	# SEE IF SOMEONE IS WAITING TO DESIGNATE.
// PORT: Fixed ROM slots 23655.
                            if slot <> 23655 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:1798
//		CCS	A
// PORT: Fixed ROM slots 23656.
                            if slot <> 23656 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 23664 {
                if slot <= 23660 {
                    if slot <= 23658 {
                        if slot <= 23657 {
// PORT: SOURCE P20-P25.agc:1799
//		TCF	BEGDES
// PORT: Fixed ROM slots 23657.
                            if slot <> 23657 or instruction <> 5499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5499, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1800
//		CS	BIT2		# IF NO FURTHER ANTENNA CONTROL REQUIRED,
// PORT: Fixed ROM slots 23658.
                            if slot <> 23658 or instruction <> 18922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23659 {
// PORT: SOURCE P20-P25.agc:1801
//		EXTEND			# REMOVE ERROR COUNTER ENABLE.
// PORT: Fixed ROM slots 23659.
                            if slot <> 23659 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1802
//		WAND	CHAN12
// PORT: Fixed ROM slots 23660.
                            if slot <> 23660 or instruction <> 1546 { return choose false if checkOnly else -1. }
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
                    if slot <= 23662 {
                        if slot <= 23661 {
// PORT: SOURCE P20-P25.agc:1803
//		TCF	TASKOVER
// PORT: Fixed ROM slots 23661.
                            if slot <> 23661 or instruction <> 6833 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6833, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1804
//
// PORT: SOURCE P20-P25.agc:1805
//SETRRECR	CAF	BIT2		# SET UP RR ERROR COUNTERS
// PORT: Fixed ROM slots 23662.
                            if slot <> 23662 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                        if slot <= 23663 {
// PORT: SOURCE P20-P25.agc:1806
//		EXTEND
// PORT: Fixed ROM slots 23663.
                            if slot <> 23663 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1807
//		RAND	CHAN12
// PORT: Fixed ROM slots 23664.
                            if slot <> 23664 or instruction <> 1034 { return choose false if checkOnly else -1. }
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
                if slot <= 23668 {
                    if slot <= 23666 {
                        if slot <= 23665 {
// PORT: SOURCE P20-P25.agc:1808
//		CCS	A		# DO NOT CLEAR LAST COMMAND IF
// PORT: Fixed ROM slots 23665.
                            if slot <> 23665 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1809
//		TC	Q		# ERROR COUNTERS ARE ENABLED
// PORT: Fixed ROM slots 23666.
                            if slot <> 23666 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23667 {
// PORT: SOURCE P20-P25.agc:1810
//
// PORT: SOURCE P20-P25.agc:1811
//		TS	LASTYCMD
// PORT: Fixed ROM slots 23667.
                            if slot <> 23667 or instruction <> 22602 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22602, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1812
//		TS	LASTXCMD
// PORT: Fixed ROM slots 23668.
                            if slot <> 23668 or instruction <> 22603 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22603, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 23670 {
                        if slot <= 23669 {
// PORT: SOURCE P20-P25.agc:1813
//		CAF	BIT2
// PORT: Fixed ROM slots 23669.
                            if slot <> 23669 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1814
//		EXTEND
// PORT: Fixed ROM slots 23670.
                            if slot <> 23670 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23671 {
// PORT: SOURCE P20-P25.agc:1815
//		WOR	CHAN12		# ENABLE RR CDU ERROR COUNTERS.
// PORT: Fixed ROM slots 23671.
                            if slot <> 23671 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1816
//		TC	Q
// PORT: Fixed ROM slots 23672.
                            if slot <> 23672 or instruction <> 2 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 23688 {
            if slot <= 23680 {
                if slot <= 23676 {
                    if slot <= 23674 {
                        if slot <= 23673 {
// PORT: SOURCE P20-P25.agc:1817
//# Page 531
// PORT: SOURCE P20-P25.agc:1818
//# PROGRAM NAME:  REMODE
// PORT: SOURCE P20-P25.agc:1819
//#
// PORT: SOURCE P20-P25.agc:1820
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P20-P25.agc:1821
//#
// PORT: SOURCE P20-P25.agc:1822
//#	REMODE IS THE GENERAL REMODING SUBROUTINE.  IT DRIVES THE
// PORT: SOURCE P20-P25.agc:1823
//#	TRUNNION ANGLE TO 0 DEGREES IF THE CURRENT MODE IS MODE 1,
// PORT: SOURCE P20-P25.agc:1824
//#	180 DEGREES FOR MODE 2, THEN DRIVES THE SHAFT ANGLE TO -45
// PORT: SOURCE P20-P25.agc:1825
//#	DEGREES, AND FINALLY DRIVES THE TRUNNION ANGLE TO -130 DEGREES,
// PORT: SOURCE P20-P25.agc:1826
//#	TO PLACE THE RR IN MODE 2, -50 DEGREES FOR MODE 1, BEFORE
// PORT: SOURCE P20-P25.agc:1827
//#	INITIATING 2-AXIS CONTROL.  ALL REMODING IS DONE WITH SINGLE
// PORT: SOURCE P20-P25.agc:1828
//#	AXIS ROTATIONS (RR1AXIS).  INITIALLY THE RR ANTENNA MODE FLAG
// PORT: SOURCE P20-P25.agc:1829
//#	(RADMODES BIT 12) IS CHECKED.  CONTROL IS THEN TRANSFERRED TO
// PORT: SOURCE P20-P25.agc:1830
//#	RRTONLY TO DRIVE THR TRUNNION ANGLE TO 0 DEGREES IF IN MODE 1
// PORT: SOURCE P20-P25.agc:1831
//#	OR 180 DEGREES IF IN MODE 2.  RRSONLY IS THEN CALLED TO DRIVE
// PORT: SOURCE P20-P25.agc:1832
//#	THE SHAFT ANGLE TO -45 DEGREES. THE RR ANTENNA MODE FLAG
// PORT: SOURCE P20-P25.agc:1833
//#	(RADMODES BIT 12) IS CHECKED AGAIN.  CONTROL IS AGAIN
// PORT: SOURCE P20-P25.agc:1834
//#	TRANSFERRED TO RRTONLY TO DRIVE THE TRUNNION ANGLE TO -130
// PORT: SOURCE P20-P25.agc:1835
//#	DEGREES TO PLACE THE RR IN MODE 2 IF CURRENTLY IN MODE 1 OR TO
// PORT: SOURCE P20-P25.agc:1836
//#	-50 DEGREES IF IN MODE 2 TO PLACE THE RR IN MODE 1.  RMODINV
// PORT: SOURCE P20-P25.agc:1837
//#	IS THEN CALLED TO SET RADMODES BIT 12 TO INDICATE THE NEW
// PORT: SOURCE P20-P25.agc:1838
//#	RR ANTENNA MODE.  THE REMODE FLAG (RADMODES BIT 14)
// PORT: SOURCE P20-P25.agc:1839
//#	IS REMOVED TO INDICATE THAT REMODING IS COMPLETE.  THE PROGRAM
// PORT: SOURCE P20-P25.agc:1840
//#	THEN EXITS TO STDESIG TO BEGIN 2-AXIS CONTROL.
// PORT: SOURCE P20-P25.agc:1841
//#
// PORT: SOURCE P20-P25.agc:1842
//# CALLIN SEQUENCE:
// PORT: SOURCE P20-P25.agc:1843
//#
// PORT: SOURCE P20-P25.agc:1844
//#	FROM BEGDES WHEN REMODE FLAG (RADMODES BIT 14) IS SET.
// PORT: SOURCE P20-P25.agc:1845
//#	THIS FLAG MAY BE SET IN RRDESSM AND RRDESNB IF RRLIMCHK
// PORT: SOURCE P20-P25.agc:1846
//#	DETERMINES THAT THE DESIRED ANGLES ARE WITHIN THE LIMITS OF THE
// PORT: SOURCE P20-P25.agc:1847
//#	OTHER MODE.
// PORT: SOURCE P20-P25.agc:1848
//#
// PORT: SOURCE P20-P25.agc:1849
//# ERASABLE INIITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1850
//#
// PORT: SOURCE P20-P25.agc:1851
//#	RADMODES
// PORT: SOURCE P20-P25.agc:1852
//#
// PORT: SOURCE P20-P25.agc:1853
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:1854
//#
// PORT: SOURCE P20-P25.agc:1855
//#	RRTONLY, RRSONL, RMODINV (ACTUALLY PART OF)
// PORT: SOURCE P20-P25.agc:1856
//#
// PORT: SOURCE P20-P25.agc:1857
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:1858
//#
// PORT: SOURCE P20-P25.agc:1859
//#	NONE
// PORT: SOURCE P20-P25.agc:1860
//#
// PORT: SOURCE P20-P25.agc:1861
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:1862
//#
// PORT: SOURCE P20-P25.agc:1863
//# EXIT:  STDESIG
// PORT: SOURCE P20-P25.agc:1864
//
// PORT: SOURCE P20-P25.agc:1865
//REMODE		CAF	ANTENBIT	# DRIVE TRUNNION TO 0 (180)
// PORT: Fixed ROM slots 23673.
                            if slot <> 23673 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1866
//		MASK	RADMODES	# (ERROR COUNTER ALREADY ENABLED)
// PORT: Fixed ROM slots 23674.
                            if slot <> 23674 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23675 {
// PORT: SOURCE P20-P25.agc:1867
//		CCS	A
// PORT: Fixed ROM slots 23675.
                            if slot <> 23675 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1868
//		CAF	BIT15
// PORT: Fixed ROM slots 23676.
                            if slot <> 23676 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 23678 {
                        if slot <= 23677 {
// PORT: SOURCE P20-P25.agc:1869
//		TC	RRTONLY
// PORT: Fixed ROM slots 23677.
                            if slot <> 23677 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1870
//
// PORT: SOURCE P20-P25.agc:1871
//		CAF	-45DEGSR
// PORT: Fixed ROM slots 23678.
                            if slot <> 23678 or instruction <> 16352 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4064), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23679 {
// PORT: SOURCE P20-P25.agc:1872
//		TC	RRSONLY
// PORT: Fixed ROM slots 23679.
                            if slot <> 23679 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1873
//# Page 532
// PORT: SOURCE P20-P25.agc:1874
//		CS	RADMODES
// PORT: Fixed ROM slots 23680.
                            if slot <> 23680 or instruction <> 16456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 72).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 23684 {
                    if slot <= 23682 {
                        if slot <= 23681 {
// PORT: SOURCE P20-P25.agc:1875
//		MASK	ANTENBIT
// PORT: Fixed ROM slots 23681.
                            if slot <> 23681 or instruction <> 31200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                if fixedOperand = 2048 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1876
//		CCS	A
// PORT: Fixed ROM slots 23682.
                            if slot <> 23682 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23683 {
// PORT: SOURCE P20-P25.agc:1877
//		CAF	-80DEGSR	# GO TO T = -130 (-50).
// PORT: Fixed ROM slots 23683.
                            if slot <> 23683 or instruction <> 13466 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1178), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1878
//		AD	-50DEGSR
// PORT: Fixed ROM slots 23684.
                            if slot <> 23684 or instruction <> 25753 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1177), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 23686 {
                        if slot <= 23685 {
// PORT: SOURCE P20-P25.agc:1879
//		TC	RRTONLY
// PORT: Fixed ROM slots 23685.
                            if slot <> 23685 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1880
//
// PORT: SOURCE P20-P25.agc:1881
//		CS	RADMODES
// PORT: Fixed ROM slots 23686.
                            if slot <> 23686 or instruction <> 16456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 72).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23687 {
// PORT: SOURCE P20-P25.agc:1882
//		MASK	ANTENBIT
// PORT: Fixed ROM slots 23687.
                            if slot <> 23687 or instruction <> 31200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                if fixedOperand = 2048 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1883
//		CCS	A
// PORT: Fixed ROM slots 23688.
                            if slot <> 23688 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 23696 {
                if slot <= 23692 {
                    if slot <= 23690 {
                        if slot <= 23689 {
// PORT: SOURCE P20-P25.agc:1884
//		CAF	BIT15		# GO TO T = -180 (+0).
// PORT: Fixed ROM slots 23689.
                            if slot <> 23689 or instruction <> 14813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1885
//		TC	RRTONLY
// PORT: Fixed ROM slots 23690.
                            if slot <> 23690 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23691 {
// PORT: SOURCE P20-P25.agc:1886
//
// PORT: SOURCE P20-P25.agc:1887
//		CS	RADMODES 	# GO TO S = -90 (+0).
// PORT: Fixed ROM slots 23691.
                            if slot <> 23691 or instruction <> 16456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 72).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1888
//		MASK	ANTENBIT
// PORT: Fixed ROM slots 23692.
                            if slot <> 23692 or instruction <> 31200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                if fixedOperand = 2048 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 23694 {
                        if slot <= 23693 {
// PORT: SOURCE P20-P25.agc:1889
//		CCS	A
// PORT: Fixed ROM slots 23693.
                            if slot <> 23693 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1890
//		CS	HALF
// PORT: Fixed ROM slots 23694.
                            if slot <> 23694 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23695 {
// PORT: SOURCE P20-P25.agc:1891
//		TC	RRSONLY
// PORT: Fixed ROM slots 23695.
                            if slot <> 23695 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1892
//
// PORT: SOURCE P20-P25.agc:1893
//		TC	RMODINV
// PORT: Fixed ROM slots 23696.
                            if slot <> 23696 or instruction <> 1179 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1179, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 23700 {
                    if slot <= 23698 {
                        if slot <= 23697 {
// PORT: SOURCE P20-P25.agc:1894
//
// PORT: SOURCE P20-P25.agc:1895
//		CS	REMODBIT	# END OF REMODE.
// PORT: Fixed ROM slots 23697.
                            if slot <> 23697 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1896
//		MASK	RADMODES
// PORT: Fixed ROM slots 23698.
                            if slot <> 23698 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23699 {
// PORT: SOURCE P20-P25.agc:1897
//		TS	RADMODES
// PORT: Fixed ROM slots 23699.
                            if slot <> 23699 or instruction <> 22600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22600, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1898
//
// PORT: SOURCE P20-P25.agc:1899
//		CAF	DESIGBIT	# WAS REMODE CALLED DURING DESIGNATE?
// PORT: Fixed ROM slots 23700.
                            if slot <> 23700 or instruction <> 14818 { return choose false if checkOnly else -1. }
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
                    if slot <= 23702 {
                        if slot <= 23701 {
// PORT: SOURCE P20-P25.agc:1900
//		MASK	RADMODES	# (BIT10 RADMODES = 1)
// PORT: Fixed ROM slots 23701.
                            if slot <> 23701 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1901
//		EXTEND
// PORT: Fixed ROM slots 23702.
                            if slot <> 23702 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23703 {
// PORT: SOURCE P20-P25.agc:1902
//		BZF	RGOODEND	# NO -- RETURN TO CALLER WAITING IN RADSTALL
// PORT: Fixed ROM slots 23703.
                            if slot <> 23703 or instruction <> 5997 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5997, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P20-P25.agc:1903
//		TC	STDESIG		# YES -- RETURN TO DESIGNATE
// PORT: Fixed ROM slots 23704.
                            if slot <> 23704 or instruction <> 1410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1410, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1554] to agcAotUnit1554@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1904
//-45DEGSR	=	13,14,15
// PORT: SOURCE P20-P25.agc:1905
//-50DEGSR	DEC	-.27778
// PORT: Fixed ROM slots 23705.
    23705, 56432,
// PORT: SOURCE P20-P25.agc:1906
//-80DEGSR	DEC	-.44444
// PORT: Fixed ROM slots 23706.
    23706, 50970
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23707–23722.
function agcAotUnit1555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23714 {
        if slot <= 23710 {
            if slot <= 23708 {
                if slot <= 23707 {
// PORT: SOURCE P20-P25.agc:1907
//
// PORT: SOURCE P20-P25.agc:1908
//RMODINV		LXCH	RADMODES	# INVERT THE MODE STATUS.
// PORT: Fixed ROM slots 23707.
                    if slot <> 23707 or instruction <> 9288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 72, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1909
//		CAF	ANTENBIT
// PORT: Fixed ROM slots 23708.
                    if slot <> 23708 or instruction <> 14816 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23709 {
// PORT: SOURCE P20-P25.agc:1910
//		EXTEND
// PORT: Fixed ROM slots 23709.
                    if slot <> 23709 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1911
//		RXOR	LCHAN
// PORT: Fixed ROM slots 23710.
                    if slot <> 23710 or instruction <> 3073 { return choose false if checkOnly else -1. }
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
            if slot <= 23712 {
                if slot <= 23711 {
// PORT: SOURCE P20-P25.agc:1912
//		TS	RADMODES
// PORT: Fixed ROM slots 23711.
                    if slot <> 23711 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1913
//		TC	Q
// PORT: Fixed ROM slots 23712.
                    if slot <> 23712 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23713 {
// PORT: SOURCE P20-P25.agc:1914
//
// PORT: SOURCE P20-P25.agc:1915
//# Page 533
// PORT: SOURCE P20-P25.agc:1916
//# PROGRAM NAMES:	RRTONLY, RRSONLY
// PORT: SOURCE P20-P25.agc:1917
//#
// PORT: SOURCE P20-P25.agc:1918
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:1919
//#
// PORT: SOURCE P20-P25.agc:1920
//# 	RRTONLY AND RRSONLY ARE SUBROUTINES FOR DOING SINGLE AXIS
// PORT: SOURCE P20-P25.agc:1921
//#	RR MANEUVERS FOR REMODE AND REPOSITION.  IT DRIVES TO
// PORT: SOURCE P20-P25.agc:1922
//#	WITHIN 1 DEGREE.  INITIALLY, AT RR1AX2, THE REMODE AND REPOSITION
// PORT: SOURCE P20-P25.agc:1923
//#	FLAGS (RADMODES BITS 14, 11) ARE CHECKED.  IF BOTH EXIST,
// PORT: SOURCE P20-P25.agc:1924
//#	THE PROGRAM EXITS TO REPOSRPT (SEE DORREPOS).  THIS INDICATES
// PORT: SOURCE P20-P25.agc:1925
//#	THAT SOMEONE POSSIBLY REQUESTED A DESIGNATE (RADMODES BIT 10)
// PORT: SOURCE P20-P25.agc:1926
//#	WHICH REQUIRES A REMODE (RADMODES BIT 14) AND THAT A
// PORT: SOURCE P20-P25.agc:1927
//#	REPOSITION IS IN PROGRESS (RADMODES BIT 11).  IF NONE
// PORT: SOURCE P20-P25.agc:1928
//# 	OR ONLY ONE OF THE FLAGS EXIST, REMODE OR REPOSITION, MAGSUB
// PORT: SOURCE P20-P25.agc:1929
//#	IS CALLED TO SEE IF THE APPROPRIATE ANGLE IS WITHIN 1 DEGREE.  IF YES,
// PORT: SOURCE P20-P25.agc:1930
//#	CONTROL RETURNS TO THE CALLING ROUTINE.  IF NOT, CONTROL IS
// PORT: SOURCE P20-P25.agc:1931
//#	TRANSFERRED TO RROUT FOR SINGLE AXIS MANEUVERS WITH THE OTHER
// PORT: SOURCE P20-P25.agc:1932
//#	ANGLE SET = 0.  FOLLOWING A .5 SECOND WAIT, THE ABOVE PROCEDURE IS
// PORT: SOURCE P20-P25.agc:1933
//#	REPEATED.
// PORT: SOURCE P20-P25.agc:1934
//#
// PORT: SOURCE P20-P25.agc:1935
//# CALLING SEQUENCE:	L-1	CAF	*ANGLE*		(DESIRED ANGLE SCALED PI)
// PORT: SOURCE P20-P25.agc:1936
//#			L	TC	RRTONLY		(TRUNNION ONLY)
// PORT: SOURCE P20-P25.agc:1937
//#			RRSONLY				(SHAFT ONLY)
// PORT: SOURCE P20-P25.agc:1938
//#			RRTONLY IS CALLED BY PREPOS29;
// PORT: SOURCE P20-P25.agc:1939
//#			RRTONLY AND RRSONLY ARE CALLED BY DORREPOS AND REMODE
// PORT: SOURCE P20-P25.agc:1940
//#
// PORT: SOURCE P20-P25.agc:1941
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:1942
//#
// PORT: SOURCE P20-P25.agc:1943
//#	C(A) = DESIRED ANGLE, RADMODES
// PORT: SOURCE P20-P25.agc:1944
//#
// PORT: SOURCE P20-P25.agc:1945
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:1946
//#
// PORT: SOURCE P20-P25.agc:1947
//#	FIXDELAY, REPOSRPT, MAGSUB, RROUT
// PORT: SOURCE P20-P25.agc:1948
//#
// PORT: SOURCE P20-P25.agc:1949
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:1950
//#
// PORT: SOURCE P20-P25.agc:1951
//#	NONE
// PORT: SOURCE P20-P25.agc:1952
//#
// PORT: SOURCE P20-P25.agc:1953
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:1954
//#
// PORT: SOURCE P20-P25.agc:1955
//# EXIT:	REPOSRPT (REMODE AND REPOSITION FLAGS PRESENT -- RADMODES
// PORT: SOURCE P20-P25.agc:1956
//#	BITS 14, 11)
// PORT: SOURCE P20-P25.agc:1957
//#	L+1 (ANGLE WITHIN ONE DEGREE OR RR OUT OF AUTO MODE)
// PORT: SOURCE P20-P25.agc:1958
//
// PORT: SOURCE P20-P25.agc:1959
//RRTONLY		TS	RDES		# DESIRED TRUNNION ANGLE.
// PORT: Fixed ROM slots 23713.
                    if slot <> 23713 or instruction <> 23246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23246, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1960
//		CAF	ZERO
// PORT: Fixed ROM slots 23714.
                    if slot <> 23714 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        if slot <= 23718 {
            if slot <= 23716 {
                if slot <= 23715 {
// PORT: SOURCE P20-P25.agc:1961
//		TCF	RR1AXIS
// PORT: Fixed ROM slots 23715.
                    if slot <> 23715 or instruction <> 5286 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5286, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1962
//
// PORT: SOURCE P20-P25.agc:1963
//RRSONLY		TS	RDES		# SHAFT COMMANDS ARE UNRESOLVED SINCE THIS
// PORT: Fixed ROM slots 23716.
                    if slot <> 23716 or instruction <> 23246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23246, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23717 {
// PORT: SOURCE P20-P25.agc:1964
//		CAF	ONE		# ROUTINE ENTERED ONLY WHEN T = 0 OR 180.
// PORT: Fixed ROM slots 23717.
                    if slot <> 23717 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1965
//
// PORT: SOURCE P20-P25.agc:1966
//RR1AXIS		TS	RRINDEX
// PORT: Fixed ROM slots 23718.
                    if slot <> 23718 or instruction <> 23247 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23247, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23720 {
                if slot <= 23719 {
// PORT: SOURCE P20-P25.agc:1967
//		EXTEND
// PORT: Fixed ROM slots 23719.
                    if slot <> 23719 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1968
//		QXCH	RRRET
// PORT: Fixed ROM slots 23720.
                    if slot <> 23720 or instruction <> 9933 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 717, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23721 {
// PORT: SOURCE P20-P25.agc:1969
//		TCF	RR1AX2
// PORT: Fixed ROM slots 23721.
                    if slot <> 23721 or instruction <> 5292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:1970
//
// PORT: SOURCE P20-P25.agc:1971
//# Page 534
// PORT: SOURCE P20-P25.agc:1972
//NXTRR1AX	TC	FIXDELAY
// PORT: Fixed ROM slots 23722.
                    if slot <> 23722 or instruction <> 2705 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2705, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1555] to agcAotUnit1555@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1973
//		DEC	50		# 2 SAMPLES PER SECOND.
// PORT: Fixed ROM slots 23723.
    23723, 100
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23724–23730.
function agcAotUnit1556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23726 {
        if slot <= 23724 {
// PORT: SOURCE P20-P25.agc:1974
//
// PORT: SOURCE P20-P25.agc:1975
//RR1AX2		CS	RADMODES	# IF SOMEONE REQUESTS A DESIGNATE WHICH
// PORT: Fixed ROM slots 23724.
            if slot <> 23724 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23725 {
// PORT: SOURCE P20-P25.agc:1976
//		MASK	PRIO22		# REQUIRES A REMODE AND A REPOSITION IS IN
// PORT: Fixed ROM slots 23725.
                if slot <> 23725 or instruction <> 32712 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                    if fixedOperand = 9216 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024 + mod(floor(words[0] / 8192), 2) * 8192).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1977
//		EXTEND			# PROGRESS, INTERRUPT IT AND START THE
// PORT: Fixed ROM slots 23726.
                if slot <> 23726 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23728 {
            if slot <= 23727 {
// PORT: SOURCE P20-P25.agc:1978
//		BZF	REPOSRPT	# REMODE IMMEDIATELY.
// PORT: Fixed ROM slots 23727.
                if slot <> 23727 or instruction <> 5220 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5220, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1979
//
// PORT: SOURCE P20-P25.agc:1980
//		CA	RDES
// PORT: Fixed ROM slots 23728.
                if slot <> 23728 or instruction <> 13006 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 718).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23729 {
// PORT: SOURCE P20-P25.agc:1981
//		EXTEND
// PORT: Fixed ROM slots 23729.
                if slot <> 23729 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1982
//		INDEX	RRINDEX
// PORT: Fixed ROM slots 23730.
                if slot <> 23730 or instruction <> 21199 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21199, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21199, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1556] to agcAotUnit1556@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1983
//		MSU	CDUT
// PORT: Fixed ROM slots 23731.
    23731, 16442
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23732–23738.
function agcAotUnit1557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23734 {
        if slot <= 23732 {
// PORT: SOURCE P20-P25.agc:1984
//		TS	ITEMP1		# SAVE ERROR SIGNAL.
// PORT: Fixed ROM slots 23732.
            if slot <> 23732 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23733 {
// PORT: SOURCE P20-P25.agc:1985
//		EXTEND
// PORT: Fixed ROM slots 23733.
                if slot <> 23733 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1986
//		MP	RRSPGAIN	# TRIES TO NULL .7 OF ERROR OVER NEXT .5
// PORT: Fixed ROM slots 23734.
                if slot <> 23734 or instruction <> 29893 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 1221, readEffective:call(words, 1221)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23736 {
            if slot <= 23735 {
// PORT: SOURCE P20-P25.agc:1987
//		TS	L
// PORT: Fixed ROM slots 23735.
                if slot <> 23735 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1988
//		CA	RADMODES
// PORT: Fixed ROM slots 23736.
                if slot <> 23736 or instruction <> 12360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23737 {
// PORT: SOURCE P20-P25.agc:1989
//		MASK	AUTOMBIT
// PORT: Fixed ROM slots 23737.
                if slot <> 23737 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:1990
//		XCH	ITEMP1		# STORE RR-OUT-OF-AUTO-MODE BIT.
// PORT: Fixed ROM slots 23738.
                if slot <> 23738 or instruction <> 23601 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 49, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1557] to agcAotUnit1557@.

// PORT: Physical bank 25. Shared continuation entries, slots 23739–23739.
function agcAotUnit1558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:1991
//		TC	MAGSUB		# SEE IF WITHIN ONE DEGREE.
// PORT: Fixed ROM slots 23739.
    if slot <> 23739 or instruction <> 2378 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2378, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1558] to agcAotUnit1558@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:1992
//		DEC	-.00555		# SCALED IN HALF-REVS.
// PORT: Fixed ROM slots 23740.
    23740, 65352
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23741–23748.
function agcAotUnit1559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23744 {
        if slot <= 23742 {
            if slot <= 23741 {
// PORT: SOURCE P20-P25.agc:1993
//
// PORT: SOURCE P20-P25.agc:1994
//		CCS	ITEMP1		# NO.  IF RR OUT OF AUTO MODE, EXIT.
// PORT: Fixed ROM slots 23741.
                if slot <> 23741 or instruction <> 4145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 49).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1995
//		TC	RRRET		# RETURN TO CALLER.
// PORT: Fixed ROM slots 23742.
                if slot <> 23742 or instruction <> 717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23743 {
// PORT: SOURCE P20-P25.agc:1996
//
// PORT: SOURCE P20-P25.agc:1997
//		CCS	RRINDEX		# COMMAND FOR OTHER AXIS IS ZERO.
// PORT: Fixed ROM slots 23743.
                if slot <> 23743 or instruction <> 4815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 719).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:1998
//		TCF	+2		# SETTING A TO 0.
// PORT: Fixed ROM slots 23744.
                if slot <> 23744 or instruction <> 5314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5314, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23746 {
            if slot <= 23745 {
// PORT: SOURCE P20-P25.agc:1999
//		XCH	L
// PORT: Fixed ROM slots 23745.
                if slot <> 23745 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2000
//		DXCH	TANG
// PORT: Fixed ROM slots 23746.
                if slot <> 23746 or instruction <> 22088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23747 {
// PORT: SOURCE P20-P25.agc:2001
//
// PORT: SOURCE P20-P25.agc:2002
//		TC	RROUT
// PORT: Fixed ROM slots 23747.
                if slot <> 23747 or instruction <> 1222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2003
//
// PORT: SOURCE P20-P25.agc:2004
//		TCF	NXTRR1AX	# COME BACK IN .5 SECONDS.
// PORT: Fixed ROM slots 23748.
                if slot <> 23748 or instruction <> 5290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5290, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1559] to agcAotUnit1559@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2005
//
// PORT: SOURCE P20-P25.agc:2006
//RRSPGAIN	DEC	.59062		# NULL .7 ERROR IN .5 SEC.
// PORT: Fixed ROM slots 23749.
    23749, 19354
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23750–23753.
function agcAotUnit1560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23751 {
        if slot <= 23750 {
// PORT: SOURCE P20-P25.agc:2007
//
// PORT: SOURCE P20-P25.agc:2008
//# Page 535
// PORT: SOURCE P20-P25.agc:2009
//# PROGRAM NAME:  RROUT
// PORT: SOURCE P20-P25.agc:2010
//#
// PORT: SOURCE P20-P25.agc:2011
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2012
//#
// PORT: SOURCE P20-P25.agc:2013
//#	RROUT RECEIVES RR GYRO COMMANDS IN TANG, TANG +1 IN RR
// PORT: SOURCE P20-P25.agc:2014
//#	ERROR COUNTER SCALING.  RROUT THEN LIMITS THEM AND
// PORT: SOURCE P20-P25.agc:2015
//#	GENERATES COMMANDS TO THE CDU TO ADJUST THE ERROR COUNTERS
// PORT: SOURCE P20-P25.agc:2016
//#	TO THE DESIRED VALUES.  INITIALLY MAGSUB CHECKS THE MAGNITUDE OF
// PORT: SOURCE P20-P25.agc:2017
//#	THE COMMAND (SHAFT ON 1ST PASS) TO SEE IF IT IS GREATER THAN
// PORT: SOURCE P20-P25.agc:2018
//#	384 PULSES.  IF NOT, CONTROL IS TRANFERRED TO RROUTLIM TO
// PORT: SOURCE P20-P25.agc:2019
//#	LIMIT THE COMMAND TO +384 OR -384 PULSES.  THE DIFFERENCE IS
// PORT: SOURCE P20-P25.agc:2020
//#	THEN CALCULATED BETWEEN THE DESIRED STATE AND TEH PRESENT STATE OF
// PORT: SOURCE P20-P25.agc:2021
//#	THE ERROR COUNTER AS RECORDED IN LASTYCMD AND LASTXCMD.
// PORT: SOURCE P20-P25.agc:2022
//#	THE RESULT IS STORED IN OPTXCMD (1ST PASS) AND OPTYCMD (2ND
// PORT: SOURCE P20-P25.agc:2023
//#	PASS).  FOLLOWING THE SECOND PASS, FOR THE TRUNNION COMMAND, THE
// PORT: SOURCE P20-P25.agc:2024
//#	OCDUT AND OCDUS ERROR COUNTER DRIVE BITS (CHAN 14 BITS 12, 11)
// PORT: SOURCE P20-P25.agc:2025
//#	ARE SET.  THIS PROGRAM THEN EXITS TO THE CALLING PROGRAM.
// PORT: SOURCE P20-P25.agc:2026
//#
// PORT: SOURCE P20-P25.agc:2027
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:2028
//#
// PORT: SOURCE P20-P25.agc:2029
//#	L TC RROUT (WITH RUPT INHIBITED) RROUT IS CALLED BY
// PORT: SOURCE P20-P25.agc:2030
//#	RRTONLY, RRSONLY, AND DODES
// PORT: SOURCE P20-P25.agc:2031
//#
// PORT: SOURCE P20-P25.agc:2032
//# ERASABLE INITIALIZATION REQURIED:
// PORT: SOURCE P20-P25.agc:2033
//#
// PORT: SOURCE P20-P25.agc:2034
//#	TANG, TANG +1 (DESIRED COMMANDS), LASTYCMD, LASTXCMD
// PORT: SOURCE P20-P25.agc:2035
//#	(1ST PASS = 0), RR ERROR COUNTER ENAGLE SET (CHAN 12 BIT 2).
// PORT: SOURCE P20-P25.agc:2036
//#
// PORT: SOURCE P20-P25.agc:2037
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:2038
//#
// PORT: SOURCE P20-P25.agc:2039
//#	MAGSUB
// PORT: SOURCE P20-P25.agc:2040
//#
// PORT: SOURCE P20-P25.agc:2041
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:2042
//#
// PORT: SOURCE P20-P25.agc:2043
//#	NONE
// PORT: SOURCE P20-P25.agc:2044
//#
// PORT: SOURCE P20-P25.agc:2045
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:2046
//#
// PORT: SOURCE P20-P25.agc:2047
//# EXIT:  L+1 (ALWAYS)
// PORT: SOURCE P20-P25.agc:2048
//
// PORT: SOURCE P20-P25.agc:2049
//RROUT		LXCH	Q		# SAVE RETURN
// PORT: Fixed ROM slots 23750.
            if slot <> 23750 or instruction <> 9218 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 2, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2050
//		CAF	ONE		# LOOP TWICE.
// PORT: Fixed ROM slots 23751.
            if slot <> 23751 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        if slot <= 23752 {
// PORT: SOURCE P20-P25.agc:2051
//RROUT2		TS	ITEMP2
// PORT: Fixed ROM slots 23752.
            if slot <> 23752 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2052
//		INDEX	A
// PORT: Fixed ROM slots 23753.
            if slot <> 23753 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1560] to agcAotUnit1560@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2053
//		CA	TANG
// PORT: Fixed ROM slots 23754.
    23754, 25742
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23755–23756.
function agcAotUnit1561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23755 {
// PORT: SOURCE P20-P25.agc:2054
//		TS	ITEMP1		# SAVE SIGN COMMAND FOR LIMITING.
// PORT: Fixed ROM slots 23755.
        if slot <> 23755 or instruction <> 22577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22577, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2055
//
// PORT: SOURCE P20-P25.agc:2056
//		TC	MAGSUB		# SEE IF WITHIN LIMITS.
// PORT: Fixed ROM slots 23756.
        if slot <> 23756 or instruction <> 2378 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2378, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1561] to agcAotUnit1561@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2057
//-RRLIMIT	DEC	-384
// PORT: Fixed ROM slots 23757.
    23757, 64766
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23758–23760.
function agcAotUnit1562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23758 {
// PORT: SOURCE P20-P25.agc:2058
//		TCF	RROUTLIM	# LIMIT COMMAND TO MAG OF 384.
// PORT: Fixed ROM slots 23758.
        if slot <> 23758 or instruction <> 5341 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5341, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23759 {
// PORT: SOURCE P20-P25.agc:2059
//
// PORT: SOURCE P20-P25.agc:2060
//SETRRCTR	CA	ITEMP1		# COUNT OUT DIFFERENCE BETWEEN DESIRED
// PORT: Fixed ROM slots 23759.
            if slot <> 23759 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2061
//		INDEX	ITEMP2		# STATE AND PRESENT STATE AS RECORDED IN
// PORT: Fixed ROM slots 23760.
            if slot <> 23760 or instruction <> 20530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20530, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1562] to agcAotUnit1562@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2062
//		XCH	LASTYCMD	# LASTYCMD AND LASTXCMD
// PORT: Fixed ROM slots 23761.
    23761, 47252
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23762–23765.
function agcAotUnit1563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23763 {
        if slot <= 23762 {
// PORT: SOURCE P20-P25.agc:2063
//		COM
// PORT: Fixed ROM slots 23762.
            if slot <> 23762 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2064
//# Page 536
// PORT: SOURCE P20-P25.agc:2065
//		AD	ITEMP1
// PORT: Fixed ROM slots 23763.
            if slot <> 23763 or instruction <> 24625 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23764 {
// PORT: SOURCE P20-P25.agc:2066
//		AD	NEG0		# PREVENT +0 IN OUTCOUNTER
// PORT: Fixed ROM slots 23764.
            if slot <> 23764 or instruction <> 27116 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:2067
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 23765.
            if slot <> 23765 or instruction <> 20530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20530, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1563] to agcAotUnit1563@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2068
//		TS	CDUTCMD
// PORT: Fixed ROM slots 23766.
    23766, 45142
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23767–23789.
function agcAotUnit1564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23777 {
        if slot <= 23771 {
            if slot <= 23768 {
                if slot <= 23767 {
// PORT: SOURCE P20-P25.agc:2069
//
// PORT: SOURCE P20-P25.agc:2070
//		CCS	ITEMP2		# PROCESS BOTH INPUTS.
// PORT: Fixed ROM slots 23767.
                    if slot <> 23767 or instruction <> 4146 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2071
//		TCF	RROUT2
// PORT: Fixed ROM slots 23768.
                    if slot <> 23768 or instruction <> 5320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5320, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23769 {
// PORT: SOURCE P20-P25.agc:2072
//
// PORT: SOURCE P20-P25.agc:2073
//		CAF	PRIO6		# ENABLE COUNTERS.
// PORT: Fixed ROM slots 23769.
                    if slot <> 23769 or instruction <> 14864 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23770 {
// PORT: SOURCE P20-P25.agc:2074
//		EXTEND
// PORT: Fixed ROM slots 23770.
                        if slot <> 23770 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2075
//		WOR	CHAN14		# PUT ON CDU DRIVES S AND T
// PORT: Fixed ROM slots 23771.
                        if slot <> 23771 or instruction <> 2572 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23774 {
                if slot <= 23772 {
// PORT: SOURCE P20-P25.agc:2076
//		TC	L		# RETURN.
// PORT: Fixed ROM slots 23772.
                    if slot <> 23772 or instruction <> 1 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23773 {
// PORT: SOURCE P20-P25.agc:2077
//
// PORT: SOURCE P20-P25.agc:2078
//RROUTLIM	CCS	ITEMP1		# LIMIT COMMAND TO ABS VAL OF 384.
// PORT: Fixed ROM slots 23773.
                        if slot <> 23773 or instruction <> 4145 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 49).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2079
//		CS	-RRLIMIT
// PORT: Fixed ROM slots 23774.
                        if slot <> 23774 or instruction <> 17613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1229), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23775 {
// PORT: SOURCE P20-P25.agc:2080
//		TCF	+2
// PORT: Fixed ROM slots 23775.
                    if slot <> 23775 or instruction <> 5345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23776 {
// PORT: SOURCE P20-P25.agc:2081
//		CA	-RRLIMIT
// PORT: Fixed ROM slots 23776.
                        if slot <> 23776 or instruction <> 13517 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1229), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2082
//		TS	ITEMP1
// PORT: Fixed ROM slots 23777.
                        if slot <> 23777 or instruction <> 22577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22577, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 23783 {
            if slot <= 23780 {
                if slot <= 23778 {
// PORT: SOURCE P20-P25.agc:2083
//		TCF	SETRRCTR +1
// PORT: Fixed ROM slots 23778.
                    if slot <> 23778 or instruction <> 5328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5328, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23779 {
// PORT: SOURCE P20-P25.agc:2084
//
// PORT: SOURCE P20-P25.agc:2085
//# Page 537
// PORT: SOURCE P20-P25.agc:2086
//# ROUTINE TO ZERO THE RR CDUS AND DETERMINE THE ANTENNA MODE.
// PORT: SOURCE P20-P25.agc:2087
//
// PORT: SOURCE P20-P25.agc:2088
//RRZERO		CAF	BIT11+1		# SEE IF MONITOR REPOSITION OR NOT IN AUTO
// PORT: Fixed ROM slots 23779.
                        if slot <> 23779 or instruction <> 13562 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1274), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2089
//		MASK	RADMODES	# IF SO, DON'T RE-ZERO CDUS.
// PORT: Fixed ROM slots 23780.
                        if slot <> 23780 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23781 {
// PORT: SOURCE P20-P25.agc:2090
//		CCS	A
// PORT: Fixed ROM slots 23781.
                    if slot <> 23781 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23782 {
// PORT: SOURCE P20-P25.agc:2091
//		TCF	RADNOOP		# (IMMEDIATE TASK TO RGOODEND).
// PORT: Fixed ROM slots 23782.
                        if slot <> 23782 or instruction <> 5976 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5976, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2092
//
// PORT: SOURCE P20-P25.agc:2093
//		INHINT
// PORT: Fixed ROM slots 23783.
                        if slot <> 23783 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23786 {
                if slot <= 23784 {
// PORT: SOURCE P20-P25.agc:2094
//		CS	RCDU0BIT	# SET FLAG TO SHOW ZEROING IN PROGRESS.
// PORT: Fixed ROM slots 23784.
                    if slot <> 23784 or instruction <> 18911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23785 {
// PORT: SOURCE P20-P25.agc:2095
//		MASK	RADMODES
// PORT: Fixed ROM slots 23785.
                        if slot <> 23785 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2096
//		AD	RCDU0BIT
// PORT: Fixed ROM slots 23786.
                        if slot <> 23786 or instruction <> 27103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23787 {
// PORT: SOURCE P20-P25.agc:2097
//		TS	RADMODES
// PORT: Fixed ROM slots 23787.
                    if slot <> 23787 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23788 {
// PORT: SOURCE P20-P25.agc:2098
//
// PORT: SOURCE P20-P25.agc:2099
//		CAF	ONE
// PORT: Fixed ROM slots 23788.
                        if slot <> 23788 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2100
//		TC	WAITLIST
// PORT: Fixed ROM slots 23789.
                        if slot <> 23789 or instruction <> 2691 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1564] to agcAotUnit1564@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2101
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:2102
//		2CADR	RRZ2
// PORT: Fixed ROM slots 23790 23791.
    23790, 2544, 23791, 43118
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23792–23796.
function agcAotUnit1565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23793 {
        if slot <= 23792 {
// PORT: SOURCE P20-P25.agc:2103
//
// PORT: SOURCE P20-P25.agc:2104
//		CS	RADMODES	# SEE IF IN AUTO MODE.
// PORT: Fixed ROM slots 23792.
            if slot <> 23792 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2105
//		MASK	AUTOMBIT
// PORT: Fixed ROM slots 23793.
            if slot <> 23793 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 23794 {
// PORT: SOURCE P20-P25.agc:2106
//		CCS	A
// PORT: Fixed ROM slots 23794.
            if slot <> 23794 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23795 {
// PORT: SOURCE P20-P25.agc:2107
//		TCF	ROADBACK
// PORT: Fixed ROM slots 23795.
                if slot <> 23795 or instruction <> 5366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2108
//		TC	ALARM		# AUTO DISCRETE NOT PRESENT -- TRYING
// PORT: Fixed ROM slots 23796.
                if slot <> 23796 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1565] to agcAotUnit1565@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2109
//		OCT	510
// PORT: Fixed ROM slots 23797.
    23797, 656
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23798–23801.
function agcAotUnit1566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23799 {
        if slot <= 23798 {
// PORT: SOURCE P20-P25.agc:2110
//ROADBACK	RELINT
// PORT: Fixed ROM slots 23798.
            if slot <> 23798 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2111
//		TCF	SWRETURN
// PORT: Fixed ROM slots 23799.
            if slot <> 23799 or instruction <> 6553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6553, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23800 {
// PORT: SOURCE P20-P25.agc:2112
//
// PORT: SOURCE P20-P25.agc:2113
//RRZ2		TC	RRZEROSB	# COMMON TO TURNON AND RRZERO.
// PORT: Fixed ROM slots 23800.
            if slot <> 23800 or instruction <> 1081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2114
//		TCF	ENDRADAR
// PORT: Fixed ROM slots 23801.
            if slot <> 23801 or instruction <> 5990 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5990, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1566] to agcAotUnit1566@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2115
//
// PORT: SOURCE P20-P25.agc:2116
//BIT11+1		OCT	02001
// PORT: Fixed ROM slots 23802.
    23802, 2050,
// PORT: SOURCE P20-P25.agc:2117
//
// PORT: SOURCE P20-P25.agc:2118
//# Page 538
// PORT: SOURCE P20-P25.agc:2119
//# PROGRAM NAME:  RRDESSM
// PORT: SOURCE P20-P25.agc:2120
//#
// PORT: SOURCE P20-P25.agc:2121
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2122
//#
// PORT: SOURCE P20-P25.agc:2123
//# 	THIS INTERPRETIVE ROUTINE WILL DESIGNATE, IF DESIRED ANGLES ARE
// PORT: SOURCE P20-P25.agc:2124
//#	WITHIN THE LIMITS OF EITHER MODE, TO A LINE-OF-SIGHT (LOS) VECTOR
// PORT: SOURCE P20-P25.agc:2125
//#	(HALF-UNIT) KNOWN WITH RESPECT TO THE STABLE MEMBER PRESENT
// PORT: SOURCE P20-P25.agc:2126
//#	ORIENTATION.  INITIALLY THE IMU CDU'S ARE READ AND CONTROL
// PORT: SOURCE P20-P25.agc:2127
//#	TRANSFERRED TO SMNB TO TRANSFORM THE LOS VECTOR FROM STABLE
// PORT: SOURCE P20-P25.agc:2128
//#	MEMBER TO NAVIGATION BASE COORDINATES (SEE STG MEMO 699)
// PORT: SOURCE P20-P25.agc:2129
//#	RRANGLES IS THEN CALLED TO CALCULATE THE RR GIMBAL ANGLES,
// PORT: SOURCE P20-P25.agc:2130
//#	TRUNNION AND SHAFT, FOR BOT THE PRESENT AND ALTERNATE MODE.
// PORT: SOURCE P20-P25.agc:2131
//#	RRLIMCHK IS CALLED TO SEE IF THE ANGLES CALCULATED FOR THE
// PORT: SOURCE P20-P25.agc:2132
//#	PRESENT MODE ARE WITHIN LIMITS.  IF WITHIN LIMITS, THE RETUREN
// PORT: SOURCE P20-P25.agc:2133
//#	LOCATION IS INCREMENTED, INASMUCH AS NO VEHICLE MANEUVER IS
// PORT: SOURCE P20-P25.agc:2134
//#	REQUIRED, BEFORE EXITING TO STARTDES.  IF NOT WITHIN THE LIMITS OF THE
// PORT: SOURCE P20-P25.agc:2135
//#	CURRENT MODE, TRYSWS IS CALLED.  FOLLOWING INVERTING OF THE RR
// PORT: SOURCE P20-P25.agc:2136
//#	ANTENNA MODE FLAG (RADMODES BIT 12), RRLIMCHK IS CALLED
// PORT: SOURCE P20-P25.agc:2137
//#	TO SEE IF THE ANGLES CALCULATED FOR THE ALTERNATE MODE ARE WITHIN
// PORT: SOURCE P20-P25.agc:2138
//#	LIMITS.  IF YES, THE RR ANTENNA MODE FLAG IS AGAIN INVERTED,
// PORT: SOURCE P20-P25.agc:2139
//#	THE REMODE FLAG (RADMODES BIT 14) SET, AND THE RETURN LOCATION
// PORT: SOURCE P20-P25.agc:2140
//#	INCREMENTED, TO INDICATE NO VEHICLE MANEUVER IS REQUIRED, BEFORE
// PORT: SOURCE P20-P25.agc:2141
//#	EXITING TO STARTDES.  IF THESE ANGLES ARE NOT WITHIN LIMITS
// PORT: SOURCE P20-P25.agc:2142
//#	OF THE ALTERNATE MODE, THE RR ANTENNA MODE FLAG (RADMODES
// PORT: SOURCE P20-P25.agc:2143
//#	BIT 12) IS INVERTED BEFORE RETURNING DIRECTLY TO THE CALLING PROGRAM
// PORT: SOURCE P20-P25.agc:2144
//# 	TO INDICATE THAT A VEHICLE MANEUVER IS REQUIRED.
// PORT: SOURCE P20-P25.agc:2145
//#
// PORT: SOURCE P20-P25.agc:2146
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:2147
//#
// PORT: SOURCE P20-P25.agc:2148
//#	L	STCALL	RRTARGET	(LOS HALF-UNIT VECTOR IN SM COORDINATES)
// PORT: SOURCE P20-P25.agc:2149
//#	L+1	RRDESM
// PORT: SOURCE P20-P25.agc:2150
//#	L+2	BASIC			(VEHICLE MANEUVER REQUIRED)
// PORT: SOURCE P20-P25.agc:2151
//#	L+3	BASIC			(NO VEHICLE MANEUVER REQUIRED)
// PORT: SOURCE P20-P25.agc:2152
//#
// PORT: SOURCE P20-P25.agc:2153
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:2154
//#
// PORT: SOURCE P20-P25.agc:2155
//#	RRTARGET, RADMODES
// PORT: SOURCE P20-P25.agc:2156
//#
// PORT: SOURCE P20-P25.agc:2157
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:2158
//#
// PORT: SOURCE P20-P25.agc:2159
//#	READCDUS, SMNB, RRANGLES, RRLIMCHK, TRYSWS (ACTUALLY
// PORT: SOURCE P20-P25.agc:2160
//#	PART OF), RMODINV
// PORT: SOURCE P20-P25.agc:2161
//#
// PORT: SOURCE P20-P25.agc:2162
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:2163
//#
// PORT: SOURCE P20-P25.agc:2164
//#	NONE
// PORT: SOURCE P20-P25.agc:2165
//#
// PORT: SOURCE P20-P25.agc:2166
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:2167
//#
// PORT: SOURCE P20-P25.agc:2168
//# EXIT:  L+2 (NEITHER SET OF ANGLES ARE WITHIN LIMITS OF RELATED MODE)
// PORT: SOURCE P20-P25.agc:2169
//# STARTDES (DESIGNATE POSSIBLE AT PRESENT VEHICLES ATTITUDE -- RETURNS
// PORT: SOURCE P20-P25.agc:2170
//# TO L+3 FROM STARTDES)
// PORT: SOURCE P20-P25.agc:2171
//
// PORT: SOURCE P20-P25.agc:2172
//RRDESSM		STQ	CLEAR
// PORT: Fixed ROM slots 23803.
    23803, 35872,
// PORT: SOURCE P20-P25.agc:2173
//			DESRET
// PORT: Fixed ROM slots 23804.
    23804, 1174,
// PORT: SOURCE P20-P25.agc:2174
//# Page 539
// PORT: SOURCE P20-P25.agc:2175
//			RRNBSW
// PORT: Fixed ROM slots 23805.
    23805, 370,
// PORT: SOURCE P20-P25.agc:2176
//		CALL			# COMPUTES SINES AND COSINES, ORDER Y Z X
// PORT: Fixed ROM slots 23806.
    23806, 65320,
// PORT: SOURCE P20-P25.agc:2177
//			CDUTRIG
// PORT: Fixed ROM slots 23807.
    23807, 40638,
// PORT: SOURCE P20-P25.agc:2178
//		VLOAD	CALL		# LOAD VECTOR AND CALL TRANSFORMATION
// PORT: Fixed ROM slots 23808.
    23808, 38138,
// PORT: SOURCE P20-P25.agc:2179
//			RRTARGET
// PORT: Fixed ROM slots 23809.
    23809, 1156,
// PORT: SOURCE P20-P25.agc:2180
//			*SMNB*
// PORT: Fixed ROM slots 23810.
    23810, 40818,
// PORT: SOURCE P20-P25.agc:2181
//
// PORT: SOURCE P20-P25.agc:2182
//		CALL			# GET RR GIMBAL ANGLES IN PRESENT AND
// PORT: Fixed ROM slots 23811.
    23811, 65320,
// PORT: SOURCE P20-P25.agc:2183
//			RRANGLES	# ALTERNATE MODE.
// PORT: Fixed ROM slots 23812.
    23812, 22710,
// PORT: SOURCE P20-P25.agc:2184
//		EXIT
// PORT: Fixed ROM slots 23813.
    23813, 65532
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23814–23815.
function agcAotUnit1567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23814 {
// PORT: SOURCE P20-P25.agc:2185
//
// PORT: SOURCE P20-P25.agc:2186
//		INHINT
// PORT: Fixed ROM slots 23814.
        if slot <> 23814 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P20-P25.agc:2187
//		TC	RRLIMCHK
// PORT: Fixed ROM slots 23815.
        if slot <> 23815 or instruction <> 2387 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2387, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1567] to agcAotUnit1567@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2188
//		ADRES	MODEA		# CONFIGURATION FOR CURRENT MODE.
// PORT: Fixed ROM slots 23816.
    23816, 1166
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23817–23843.
function agcAotUnit1568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23829 {
        if slot <= 23822 {
            if slot <= 23819 {
                if slot <= 23817 {
// PORT: SOURCE P20-P25.agc:2189
//		TC	+3		# NOT IN CURRENT MODE
// PORT: Fixed ROM slots 23817.
                    if slot <> 23817 or instruction <> 1292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23818 {
// PORT: SOURCE P20-P25.agc:2190
//OKDESSM		INCR	DESRET		# INCREMENT SAYS NO VEHICLE MANEUVER REQ.
// PORT: Fixed ROM slots 23818.
                        if slot <> 23818 or instruction <> 10827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 587).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2191
//		TC	STARTDES	# SHOW DESIGNATE REQUIRED
// PORT: Fixed ROM slots 23819.
                        if slot <> 23819 or instruction <> 1306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1306, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23820 {
// PORT: SOURCE P20-P25.agc:2192
//		CS	FLAGWRD8
// PORT: Fixed ROM slots 23820.
                    if slot <> 23820 or instruction <> 16452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 68).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23821 {
// PORT: SOURCE P20-P25.agc:2193
//		MASK	SURFFBIT	# CHECK IF ON LUNAR SURFACE (SURFFLAG=P22F)
// PORT: Fixed ROM slots 23821.
                        if slot <> 23821 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:2194
//		EXTEND
// PORT: Fixed ROM slots 23822.
                        if slot <> 23822 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23825 {
                if slot <= 23823 {
// PORT: SOURCE P20-P25.agc:2195
//		BZF	NORDSTAL	# BRANCH -- YES -- CANNOT DESIGNATE IN MODE 2
// PORT: Fixed ROM slots 23823.
                    if slot <> 23823 or instruction <> 5422 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23824 {
// PORT: SOURCE P20-P25.agc:2196
//		TC	TRYSWS
// PORT: Fixed ROM slots 23824.
                        if slot <> 23824 or instruction <> 1329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1329, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2197
//
// PORT: SOURCE P20-P25.agc:2198
//LUNDESCH	CS	FLAGWRD8	# OVERFLOW RETURN FROM RRANGLES
// PORT: Fixed ROM slots 23825.
                        if slot <> 23825 or instruction <> 16452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 68).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23827 {
                    if slot <= 23826 {
// PORT: SOURCE P20-P25.agc:2199
//		MASK	SURFFBIT	# CHECK IF ON LUNAR SURFACE
// PORT: Fixed ROM slots 23826.
                        if slot <> 23826 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:2200
//		EXTEND
// PORT: Fixed ROM slots 23827.
                        if slot <> 23827 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23828 {
// PORT: SOURCE P20-P25.agc:2201
//		BZF	NORDSTAL	# BRANCH -- YES -- RETURN TO CALLER -- ALARM 527
// PORT: Fixed ROM slots 23828.
                        if slot <> 23828 or instruction <> 5422 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5422, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2202
//		CA	STATE
// PORT: Fixed ROM slots 23829.
                        if slot <> 23829 or instruction <> 12348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 23836 {
            if slot <= 23832 {
                if slot <= 23830 {
// PORT: SOURCE P20-P25.agc:2203
//		MASK	RNDVZBIT
// PORT: Fixed ROM slots 23830.
                    if slot <> 23830 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                    if slot <= 23831 {
// PORT: SOURCE P20-P25.agc:2204
//		CCS	A		# TEST RNDVZFLG
// PORT: Fixed ROM slots 23831.
                        if slot <> 23831 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2205
//		TC	NODESSM		# NOT ON MOON -- CALL FOR ATTITUDE MANEUVER
// PORT: Fixed ROM slots 23832.
                        if slot <> 23832 or instruction <> 1337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23834 {
                    if slot <= 23833 {
// PORT: SOURCE P20-P25.agc:2206
//		TCF	ENDOFJOB	# ... BUT NOT IN R29.
// PORT: Fixed ROM slots 23833.
                        if slot <> 23833 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2207
//
// PORT: SOURCE P20-P25.agc:2208
//# Page 540
// PORT: SOURCE P20-P25.agc:2209
//# PROGRAM NAME:  STARTDES
// PORT: SOURCE P20-P25.agc:2210
//#
// PORT: SOURCE P20-P25.agc:2211
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2212
//#
// PORT: SOURCE P20-P25.agc:2213
//#	STARTDES IS ENTERED WHEN WE ARE READY TO BEGIN DESIGNATION.
// PORT: SOURCE P20-P25.agc:2214
//#	BIT 14 OF RADMODES IS ALREADY SET IF A REMODE IS REQUIRED.
// PORT: SOURCE P20-P25.agc:2215
//#	AT THIS TIME, THE RR ANTENNA MAY BE IN A REPOSITON
// PORT: SOURCE P20-P25.agc:2216
//#	OPERATION.  IN THIS CASE, IF A REMODE IS REQUIRED IT MAY HAVE
// PORT: SOURCE P20-P25.agc:2217
//#	ALREADY BEGUN BUT IN ANY CASE THE REPOSITION WILL BE INTERRUPTED.
// PORT: SOURCE P20-P25.agc:2218
//#	OTHERWISE, THE REPOSITION WILL BE COMPLETED BEFORE 2-AXIS
// PORT: SOURCE P20-P25.agc:2219
//#	DESIGNATION BEGINS.  INITIALLY DESCOUNT IS SET = 60 TO INDICATE
// PORT: SOURCE P20-P25.agc:2220
//#	THAT 30 SECONDS WILL BE ALLOWED FOR THE RR DATA GOOD INBIT
// PORT: SOURCE P20-P25.agc:2221
//#	(CHAN 33 BIT 4) IF LOCK-ON IS DESIRED (STATE BIT 5).  BIT 10
// PORT: SOURCE P20-P25.agc:2222
//#	OF RADMODES IS SET TO SHOW THAT A DESIGNATE IS REQUIRED.
// PORT: SOURCE P20-P25.agc:2223
//#	THE REPOSITON FLAG (RADMODES BIT 11) IS CHECKED.  IF SET,
// PORT: SOURCE P20-P25.agc:2224
//#	THE PROGRAM EXITS TO L+3 OF THE CALLING PROGRAM (SEE RRDESSM
// PORT: SOURCE P20-P25.agc:2225
//#	AND RRDESNB).  THE PROGRAM WILL BEGIN DESIGNATING TO THE DESIRED
// PORT: SOURCE P20-P25.agc:2226
//#	ANGLES FOLLOWING THE REPOSITON OR REMODE IF ONE WAS
// PORT: SOURCE P20-P25.agc:2227
//#	REQUESTED.  IF THE REPOSITON FLAG IS NOT SET, SETRRECR IS CALLED
// PORT: SOURCE P20-P25.agc:2228
//#	WITH SETS THE RR ERROR COUNTER ENABLE BIT (CHAN 12 BIT 2)
// PORT: SOURCE P20-P25.agc:2229
//# 	AND SETS LASTYCMD AND LASTXCMD = 0 TO INDICATE THE
// PORT: SOURCE P20-P25.agc:2230
//#	DIFFERENCE BETWEEN THE PRESENT AND DESIRED STATE OF THE ERROR
// PORT: SOURCE P20-P25.agc:2231
//#	COUNTERS.  A 20 MILLISECOND WAITLIST CALL IS SET FOR BEGDES
// PORT: SOURCE P20-P25.agc:2232
//#	AFTER WHICH THE PROGRAM EXITS TO L+3 OF TEH CALLING PROGRAM.
// PORT: SOURCE P20-P25.agc:2233
//#
// PORT: SOURCE P20-P25.agc:2234
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:2235
//#
// PORT: SOURCE P20-P25.agc:2236
//#	FROM RRDESSM AND RRDESNB WHEN ANGLES WITHIN LIMITS.
// PORT: SOURCE P20-P25.agc:2237
//#
// PORT: SOURCE P20-P25.agc:2238
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:2239
//#
// PORT: SOURCE P20-P25.agc:2240
//#	RADMODES, (SEE DODES)
// PORT: SOURCE P20-P25.agc:2241
//#
// PORT: SOURCE P20-P25.agc:2242
//# SUBROUTINES CALLED
// PORT: SOURCE P20-P25.agc:2243
//#
// PORT: SOURCE P20-P25.agc:2244
//#	SETRRECR, WAITLIST
// PORT: SOURCE P20-P25.agc:2245
//#
// PORT: SOURCE P20-P25.agc:2246
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:2247
//#
// PORT: SOURCE P20-P25.agc:2248
//#	BEGDES
// PORT: SOURCE P20-P25.agc:2249
//#
// PORT: SOURCE P20-P25.agc:2250
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:2251
//#
// PORT: SOURCE P20-P25.agc:2252
//# EXIT:	L+3 OF CALLING PROGRAM (SEE RRDESSM)
// PORT: SOURCE P20-P25.agc:2253
//#	L+2 OF CALLING PROGRAM (SEE RRDESNB)
// PORT: SOURCE P20-P25.agc:2254
//
// PORT: SOURCE P20-P25.agc:2255
//STARTDES	INCR	DESRET
// PORT: Fixed ROM slots 23834.
                        if slot <> 23834 or instruction <> 10827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 587).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23835 {
// PORT: SOURCE P20-P25.agc:2256
//		CS	RADMODES
// PORT: Fixed ROM slots 23835.
                        if slot <> 23835 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2257
//		MASK	DESIGBIT
// PORT: Fixed ROM slots 23836.
                        if slot <> 23836 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        } else {
            if slot <= 23839 {
                if slot <= 23837 {
// PORT: SOURCE P20-P25.agc:2258
//		ADS	RADMODES
// PORT: Fixed ROM slots 23837.
                    if slot <> 23837 or instruction <> 11336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23838 {
// PORT: SOURCE P20-P25.agc:2259
//		MASK	REPOSBIT	# SEE IF REPOSITIONING IN PROGRESS.
// PORT: Fixed ROM slots 23838.
                        if slot <> 23838 or instruction <> 31201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            if fixedOperand = 1024 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2260
//		CCS	A
// PORT: Fixed ROM slots 23839.
                        if slot <> 23839 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 23841 {
                    if slot <= 23840 {
// PORT: SOURCE P20-P25.agc:2261
//		TCF	DESRETRN	# ECTR ALREADY SET UP.
// PORT: Fixed ROM slots 23840.
                        if slot <> 23840 or instruction <> 5414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2262
//
// PORT: SOURCE P20-P25.agc:2263
//		TC	SETRRECR	# SET UP ERROR COUNTERS.
// PORT: Fixed ROM slots 23841.
                        if slot <> 23841 or instruction <> 1134 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1134, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23842 {
// PORT: SOURCE P20-P25.agc:2264
//# Page 541
// PORT: SOURCE P20-P25.agc:2265
//		CAF	TWO
// PORT: Fixed ROM slots 23842.
                        if slot <> 23842 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2266
//		TC	WAITLIST
// PORT: Fixed ROM slots 23843.
                        if slot <> 23843 or instruction <> 2691 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1568] to agcAotUnit1568@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2267
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:2268
//		2CADR	BEGDES
// PORT: Fixed ROM slots 23844 23845.
    23844, 2806, 23845, 43118
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23846–23858.
function agcAotUnit1569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23851 {
        if slot <= 23848 {
            if slot <= 23846 {
// PORT: SOURCE P20-P25.agc:2269
//
// PORT: SOURCE P20-P25.agc:2270
//DESRETRN	CA	RADCADR		# FIRST PASS THRU DESIGNATE
// PORT: Fixed ROM slots 23846.
                if slot <> 23846 or instruction <> 12998 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 710).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23847 {
// PORT: SOURCE P20-P25.agc:2271
//		EXTEND
// PORT: Fixed ROM slots 23847.
                    if slot <> 23847 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2272
//		BZF	DESRTRN		# YES	SET EXIT
// PORT: Fixed ROM slots 23848.
                    if slot <> 23848 or instruction <> 5418 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5418, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23849 {
// PORT: SOURCE P20-P25.agc:2273
//		TC	ENDOFJOB	# NO
// PORT: Fixed ROM slots 23849.
                if slot <> 23849 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23850 {
// PORT: SOURCE P20-P25.agc:2274
//DESRTRN		RELINT
// PORT: Fixed ROM slots 23850.
                    if slot <> 23850 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2275
//		INCR	DESRET
// PORT: Fixed ROM slots 23851.
                    if slot <> 23851 or instruction <> 10827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 587).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23854 {
            if slot <= 23852 {
// PORT: SOURCE P20-P25.agc:2276
//		CA	DESRET
// PORT: Fixed ROM slots 23852.
                if slot <> 23852 or instruction <> 12875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 587).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23853 {
// PORT: SOURCE P20-P25.agc:2277
//		TCF	BANKJUMP
// PORT: Fixed ROM slots 23853.
                    if slot <> 23853 or instruction <> 6560 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6560, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2278
//
// PORT: SOURCE P20-P25.agc:2279
//NORDSTAL	CAF	ZERO		# ZERO RADCADR TO WIPE OUT ANYONE
// PORT: Fixed ROM slots 23854.
                    if slot <> 23854 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 23856 {
                if slot <= 23855 {
// PORT: SOURCE P20-P25.agc:2280
//		TS	RADCADR		# WAITING IN RADSTALL SINCE WE ARE NOW
// PORT: Fixed ROM slots 23855.
                    if slot <> 23855 or instruction <> 23238 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23238, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2281
//		TCF	DESRTRN		# RETURNING TO P20 AND MAY DO NEW RADSTALL
// PORT: Fixed ROM slots 23856.
                    if slot <> 23856 or instruction <> 5418 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5418, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23857 {
// PORT: SOURCE P20-P25.agc:2282
//
// PORT: SOURCE P20-P25.agc:2283
//# Page 542
// PORT: SOURCE P20-P25.agc:2284
//# SEE IF RRDESSM CAN BE ACCOMPLISHED AFTER A REMODE.
// PORT: SOURCE P20-P25.agc:2285
//
// PORT: SOURCE P20-P25.agc:2286
//TRYSWS		TC	RMODINV		# (NOTE RUPT INHIBIT)
// PORT: Fixed ROM slots 23857.
                    if slot <> 23857 or instruction <> 1179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1179, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2287
//		TC	RRLIMCHK	# TRY DIFFERENT MODE.
// PORT: Fixed ROM slots 23858.
                    if slot <> 23858 or instruction <> 2387 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1569] to agcAotUnit1569@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2288
//		ADRES	MODEB
// PORT: Fixed ROM slots 23859.
    23859, 1170
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23860–23867.
function agcAotUnit1570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23863 {
        if slot <= 23861 {
            if slot <= 23860 {
// PORT: SOURCE P20-P25.agc:2289
//		TCF	NODESSM		# VEHICLE MANEUVER REQUIRED
// PORT: Fixed ROM slots 23860.
                if slot <> 23860 or instruction <> 5433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2290
//
// PORT: SOURCE P20-P25.agc:2291
//		TC	RMODINV		# RESET BIT12
// PORT: Fixed ROM slots 23861.
                if slot <> 23861 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23862 {
// PORT: SOURCE P20-P25.agc:2292
//		CAF	REMODBIT	# SET FLAG FOR REMODE.
// PORT: Fixed ROM slots 23862.
                if slot <> 23862 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2293
//		ADS	RADMODES
// PORT: Fixed ROM slots 23863.
                if slot <> 23863 or instruction <> 11336 { return choose false if checkOnly else -1. }
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
        if slot <= 23865 {
            if slot <= 23864 {
// PORT: SOURCE P20-P25.agc:2294
//
// PORT: SOURCE P20-P25.agc:2295
//		TCF	OKDESSM
// PORT: Fixed ROM slots 23864.
                if slot <> 23864 or instruction <> 5386 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2296
//
// PORT: SOURCE P20-P25.agc:2297
//NODESSM		TC	RMODINV		# RE-INVERT MODE AND RETURN
// PORT: Fixed ROM slots 23865.
                if slot <> 23865 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23866 {
// PORT: SOURCE P20-P25.agc:2298
//		INCR 	DESRET		# TO CALLER +2
// PORT: Fixed ROM slots 23866.
                if slot <> 23866 or instruction <> 10827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 587).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2299
//		TCF	NORDSTAL
// PORT: Fixed ROM slots 23867.
                if slot <> 23867 or instruction <> 5422 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5422, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1570] to agcAotUnit1570@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2300
//
// PORT: SOURCE P20-P25.agc:2301
//MAXTRYS		DEC	60
// PORT: Fixed ROM slots 23868.
    23868, 120
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23869–23871.
function agcAotUnit1571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23869 {
// PORT: SOURCE P20-P25.agc:2302
//
// PORT: SOURCE P20-P25.agc:2303
//# Page 543
// PORT: SOURCE P20-P25.agc:2304
//# DESIGNATE TO SPECIFIC RR GIMBAL ANGLES (INDEPENDENT OF VEHICLE MOTION).  ENTER WITH DESIRED ANGLES IN
// PORT: SOURCE P20-P25.agc:2305
//# TANG AND TANG +1.
// PORT: SOURCE P20-P25.agc:2306
//
// PORT: SOURCE P20-P25.agc:2307
//RRDESNB		TC	MAKECADR
// PORT: Fixed ROM slots 23869.
        if slot <> 23869 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23870 {
// PORT: SOURCE P20-P25.agc:2308
//		TS	DESRET
// PORT: Fixed ROM slots 23870.
            if slot <> 23870 or instruction <> 23115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23115, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2309
//
// PORT: SOURCE P20-P25.agc:2310
//		TC	DOWNFLAG	# RESET FLAG TO PREVENT DODES FROM GOING
// PORT: Fixed ROM slots 23871.
            if slot <> 23871 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1571] to agcAotUnit1571@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2311
//		ADRES	LOSCMFLG	# BACK TO R21
// PORT: Fixed ROM slots 23872.
    23872, 66
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23873–23876.
function agcAotUnit1572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23874 {
        if slot <= 23873 {
// PORT: SOURCE P20-P25.agc:2312
//		CA	MAXTRYS		# SET TIME LIMIT COUNTER
// PORT: Fixed ROM slots 23873.
            if slot <> 23873 or instruction <> 13628 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1340), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2313
//		TS	DESCOUNT	# FOR DESIGNATE
// PORT: Fixed ROM slots 23874.
            if slot <> 23874 or instruction <> 23116 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23116, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23875 {
// PORT: SOURCE P20-P25.agc:2314
//		INHINT			# SEE IF CURRENT MODE OK.
// PORT: Fixed ROM slots 23875.
            if slot <> 23875 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2315
//		TC	RRLIMNB		# DO SPECIAL V41 LIMIT CHECK
// PORT: Fixed ROM slots 23876.
            if slot <> 23876 or instruction <> 1376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1376, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1572] to agcAotUnit1572@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2316
//		ADRES	TANG
// PORT: Fixed ROM slots 23877.
    23877, 1166
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23878–23883.
function agcAotUnit1573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23880 {
        if slot <= 23878 {
// PORT: SOURCE P20-P25.agc:2317
//		TCF	TRYSWN		# SEE IF IN OTHER MODE.
// PORT: Fixed ROM slots 23878.
            if slot <> 23878 or instruction <> 5459 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5459, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23879 {
// PORT: SOURCE P20-P25.agc:2318
//
// PORT: SOURCE P20-P25.agc:2319
//OKDESNB		RELINT
// PORT: Fixed ROM slots 23879.
                if slot <> 23879 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2320
//		EXTEND
// PORT: Fixed ROM slots 23880.
                if slot <> 23880 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23881 {
// PORT: SOURCE P20-P25.agc:2321
//		DCA	TANG
// PORT: Fixed ROM slots 23881.
            if slot <> 23881 or instruction <> 12872 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 584, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23882 {
// PORT: SOURCE P20-P25.agc:2322
//		DXCH	TANGNB
// PORT: Fixed ROM slots 23882.
                if slot <> 23882 or instruction <> 22507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1003, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2323
//		TC	INTPRET
// PORT: Fixed ROM slots 23883.
                if slot <> 23883 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1573] to agcAotUnit1573@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2324
//
// PORT: SOURCE P20-P25.agc:2325
//		CALL			# GET LOS IN NB COORDS.
// PORT: Fixed ROM slots 23884.
    23884, 65320,
// PORT: SOURCE P20-P25.agc:2326
//			RRNB
// PORT: Fixed ROM slots 23885.
    23885, 38978,
// PORT: SOURCE P20-P25.agc:2327
//		STORE	RRTARGET
// PORT: Fixed ROM slots 23886.
    23886, 1156,
// PORT: SOURCE P20-P25.agc:2328
//
// PORT: SOURCE P20-P25.agc:2329
//		SET	EXIT
// PORT: Fixed ROM slots 23887.
    23887, 65048,
// PORT: SOURCE P20-P25.agc:2330
//			RRNBSW
// PORT: Fixed ROM slots 23888.
    23888, 114
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23889–23892.
function agcAotUnit1574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23890 {
        if slot <= 23889 {
// PORT: SOURCE P20-P25.agc:2331
//
// PORT: SOURCE P20-P25.agc:2332
//		INHINT
// PORT: Fixed ROM slots 23889.
            if slot <> 23889 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2333
//		TCF	STARTDES +1
// PORT: Fixed ROM slots 23890.
            if slot <> 23890 or instruction <> 5403 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5403, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23891 {
// PORT: SOURCE P20-P25.agc:2334
//TRYSWN		TC	RMODINV		# SEE IF OTHER MODE WILL DO.
// PORT: Fixed ROM slots 23891.
            if slot <> 23891 or instruction <> 1179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2335
//		TC	RRLIMNB		# DO SPECIAL V41 LIMIT CHECK
// PORT: Fixed ROM slots 23892.
            if slot <> 23892 or instruction <> 1376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1376, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1574] to agcAotUnit1574@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2336
//		ADRES	TANG
// PORT: Fixed ROM slots 23893.
    23893, 1166
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23894–23900.
function agcAotUnit1575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23896 {
        if slot <= 23894 {
// PORT: SOURCE P20-P25.agc:2337
//		TCF	NODESNB		# NOT POSSIBLE.
// PORT: Fixed ROM slots 23894.
            if slot <> 23894 or instruction <> 5467 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5467, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23895 {
// PORT: SOURCE P20-P25.agc:2338
//
// PORT: SOURCE P20-P25.agc:2339
//		TC	RMODINV
// PORT: Fixed ROM slots 23895.
                if slot <> 23895 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2340
//		CAF	REMODBIT	# CALL FOR REMODE.
// PORT: Fixed ROM slots 23896.
                if slot <> 23896 or instruction <> 14814 { return choose false if checkOnly else -1. }
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
        if slot <= 23898 {
            if slot <= 23897 {
// PORT: SOURCE P20-P25.agc:2341
//		ADS	RADMODES
// PORT: Fixed ROM slots 23897.
                if slot <> 23897 or instruction <> 11336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2342
//		TCF	OKDESNB
// PORT: Fixed ROM slots 23898.
                if slot <> 23898 or instruction <> 5447 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5447, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23899 {
// PORT: SOURCE P20-P25.agc:2343
//
// PORT: SOURCE P20-P25.agc:2344
//NODESNB		TC	RMODINV		# REINVERT MODE BIT.
// PORT: Fixed ROM slots 23899.
                if slot <> 23899 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2345
//		TC	ALARM		# BAD INPUT ANGLES.
// PORT: Fixed ROM slots 23900.
                if slot <> 23900 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1575] to agcAotUnit1575@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2346
//		OCT	502
// PORT: Fixed ROM slots 23901.
    23901, 644
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23902–23904.
function agcAotUnit1576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23902 {
// PORT: SOURCE P20-P25.agc:2347
//		TC	CLRADMOD
// PORT: Fixed ROM slots 23902.
        if slot <> 23902 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23903 {
// PORT: SOURCE P20-P25.agc:2348
//		TC	ENDOFJOB	# AVOID 503 ALARM.
// PORT: Fixed ROM slots 23903.
            if slot <> 23903 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2349
//
// PORT: SOURCE P20-P25.agc:2350
//RRLIMNB		INDEX	Q		# THIS ROUTINE IS IDENTICAL TO RRLIMCHK
// PORT: Fixed ROM slots 23904.
            if slot <> 23904 or instruction <> 20482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1576] to agcAotUnit1576@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2351
//		CAF	0		# EXCEPT THAT THE MODE 1 SHAFT LOWER
// PORT: Fixed ROM slots 23905.
    23905, 24576
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23906–23908.
function agcAotUnit1577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23906 {
// PORT: SOURCE P20-P25.agc:2352
//		INCR	Q		# LIMIT IS -85 INSTEAD OF -70 DEGREES
// PORT: Fixed ROM slots 23906.
        if slot <> 23906 or instruction <> 10242 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 2).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23907 {
// PORT: SOURCE P20-P25.agc:2353
//		EXTEND
// PORT: Fixed ROM slots 23907.
            if slot <> 23907 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2354
//# Page 544
// PORT: SOURCE P20-P25.agc:2355
//		INDEX	A		# READ GIMBAL ANGLES INTO ITEMP STORAGE
// PORT: Fixed ROM slots 23908.
            if slot <> 23908 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1577] to agcAotUnit1577@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2356
//		DCA	0
// PORT: Fixed ROM slots 23909.
    23909, 24578
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23910–23917.
function agcAotUnit1578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23913 {
        if slot <= 23911 {
            if slot <= 23910 {
// PORT: SOURCE P20-P25.agc:2357
//		DXCH	ITEMP1
// PORT: Fixed ROM slots 23910.
                if slot <> 23910 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2358
//		LXCH	Q		# L(CALLER +2) TO L
// PORT: Fixed ROM slots 23911.
                if slot <> 23911 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23912 {
// PORT: SOURCE P20-P25.agc:2359
//
// PORT: SOURCE P20-P25.agc:2360
//		CAF	ANTENBIT	# SEE WHICH MODE RR IS IN
// PORT: Fixed ROM slots 23912.
                if slot <> 23912 or instruction <> 14816 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2361
//		MASK	RADMODES
// PORT: Fixed ROM slots 23913.
                if slot <> 23913 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23915 {
            if slot <= 23914 {
// PORT: SOURCE P20-P25.agc:2362
//		CCS	A
// PORT: Fixed ROM slots 23914.
                if slot <> 23914 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2363
//		TCF	MODE2CHK	# MODE 2 CAN USE RRLIMCHK CODING
// PORT: Fixed ROM slots 23915.
                if slot <> 23915 or instruction <> 6504 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6504, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23916 {
// PORT: SOURCE P20-P25.agc:2364
//		CA	ITEMP1
// PORT: Fixed ROM slots 23916.
                if slot <> 23916 or instruction <> 12337 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 49).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2365
//		TC	MAGSUB		# MODE 1 IS DEFINED AS
// PORT: Fixed ROM slots 23917.
                if slot <> 23917 or instruction <> 2378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1578] to agcAotUnit1578@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2366
//		DEC	-.30555		# 1 	ABS(T) L 55 DEGS
// PORT: Fixed ROM slots 23918.
    23918, 55522
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23919–23924.
function agcAotUnit1579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23921 {
        if slot <= 23919 {
// PORT: SOURCE P20-P25.agc:2367
//		TC	L		# 2 	SHAFT LIMITS AT +59, -85 DEGS
// PORT: Fixed ROM slots 23919.
            if slot <> 23919 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23920 {
// PORT: SOURCE P20-P25.agc:2368
//
// PORT: SOURCE P20-P25.agc:2369
//		CA	ITEMP2		# LOAD SHAFT ANGLE
// PORT: Fixed ROM slots 23920.
                if slot <> 23920 or instruction <> 12338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2370
//		EXTEND
// PORT: Fixed ROM slots 23921.
                if slot <> 23921 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23922 {
// PORT: SOURCE P20-P25.agc:2371
//		BZMF	NEGSHAFT	# IF NEGATIVE SHAFT ANGLE, ADD 20.5 DEGS
// PORT: Fixed ROM slots 23922.
            if slot <> 23922 or instruction <> 25976 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 25976, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23923 {
// PORT: SOURCE P20-P25.agc:2372
//		AD	5.5DEGS
// PORT: Fixed ROM slots 23923.
                if slot <> 23923 or instruction <> 26994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2418), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2373
//SHAFTLIM	TC	MAGSUB
// PORT: Fixed ROM slots 23924.
                if slot <> 23924 or instruction <> 2378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2378, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1579] to agcAotUnit1579@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2374
//		DEC	-.35833		# 64.5 DEGREES
// PORT: Fixed ROM slots 23925.
    23925, 53792
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23926–23929.
function agcAotUnit1580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23927 {
        if slot <= 23926 {
// PORT: SOURCE P20-P25.agc:2375
//		TC	L		# NOT IN LIMITS
// PORT: Fixed ROM slots 23926.
            if slot <> 23926 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2376
//		TC	RRLIMOK		# IN LIMITS
// PORT: Fixed ROM slots 23927.
            if slot <> 23927 or instruction <> 2416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23928 {
// PORT: SOURCE P20-P25.agc:2377
//NEGSHAFT	AD	20.5DEGS	# MAKE NEGATIVE SHAFT LIMIT -85 DEGREES
// PORT: Fixed ROM slots 23928.
            if slot <> 23928 or instruction <> 25978 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1402), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2378
//		TCF	SHAFTLIM
// PORT: Fixed ROM slots 23929.
            if slot <> 23929 or instruction <> 5492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1580] to agcAotUnit1580@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2379
//
// PORT: SOURCE P20-P25.agc:2380
//20.5DEGS	DEC	.11389
// PORT: Fixed ROM slots 23930.
    23930, 3732
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23931–23936.
function agcAotUnit1581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23933 {
        if slot <= 23931 {
// PORT: SOURCE P20-P25.agc:2381
//
// PORT: SOURCE P20-P25.agc:2382
//# Page 545
// PORT: SOURCE P20-P25.agc:2383
//# PROGRAM NAME:  BEGDES
// PORT: SOURCE P20-P25.agc:2384
//#
// PORT: SOURCE P20-P25.agc:2385
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2386
//#
// PORT: SOURCE P20-P25.agc:2387
//#	BEGDES CHECKS VARIOUS DESIGNATE REQUESTS AND REQUESTS THE
// PORT: SOURCE P20-P25.agc:2388
//#	ACTUAL RR DESIGNATION.  INITIALLY A CHECK IS MADE TO SEE IF A
// PORT: SOURCE P20-P25.agc:2389
//# 	REMODE (RADMODES BIT 14) IS REQUESTED OR IN PROGRESS.  IF SO,
// PORT: SOURCE P20-P25.agc:2390
//#	CONTROL IS TRANFERRED TO STDESIG AFTER ROUTINE REMODE IS
// PORT: SOURCE P20-P25.agc:2391
//#	EXECUTED.  IF NO REMODE, STDESIG IS IMMEDIATELY CALLED WHERE
// PORT: SOURCE P20-P25.agc:2392
//#	FIRST THE REPOSITION FLAG (RADMODES BIT 11) IS CHECKED.  IF
// PORT: SOURCE P20-P25.agc:2393
//#	PRESENT, THE DESIGNATE FLAG (RADMODES BIT 10) IS REMOVED
// PORT: SOURCE P20-P25.agc:2394
//#	AFTER WHICH THE PROGRAM EXITS TO RDBADEND.  IF THE REPOSITION
// PORT: SOURCE P20-P25.agc:2395
//#	FLAG IS NOT PRESET, THE CONTINUOUS DESIGNATE FLAG (RADMODES
// PORT: SOURCE P20-P25.agc:2396
//#	BIT 15) IS CHECKED.  IF PRESENT, AN EXECUTIVE CALL IS IMMEDIATELY
// PORT: SOURCE P20-P25.agc:2397
//#	MADE FOR DODES AFTER WHICH A .5 SECOND WAIT IS INITIATED BEFORE
// PORT: SOURCE P20-P25.agc:2398
//#	REPEATING AT STDESIG.  IF THE RR SEARCH ROUTINE (LRS24.1) IS DESIGNATING
// PORT: SOURCE P20-P25.agc:2399
//#	TO A NEW POINT (NEWPTFLG SET) THE CURRENT DESIGNATE TASK IS TERMINATED.
// PORT: SOURCE P20-P25.agc:2400
//#	IF CONTINUOUS DESIGNATE IS NOT WANTED, THE DESIGNATE FLAG (RADMODES
// PORT: SOURCE P20-P25.agc:2401
//#	BIT 10) IS CHECKED.  IF NOT PRESENT, THE PROGRAM EXITS TO ENDRADAR TO
// PORT: SOURCE P20-P25.agc:2402
//#	CHECK RR CDU FAIL BEFORE RETURNING TO THE CALLING PROGRAM.  IF DESIGNATE
// PORT: SOURCE P20-P25.agc:2403
//#	IS STILL REQUIRED, DESCOUNT IS CHECKED TO SEE IF THE 30 SECONDS HAS
// PORT: SOURCE P20-P25.agc:2404
//#	EXPIRED BEFORE RECEIVING THE RR DATA GOOD (CHAN 33 BIT 4)
// PORT: SOURCE P20-P25.agc:2405
//#	SIGNAL.  IF OUT OF TIME, PROGRAM ALARM 00503 IS REQUESTED, THE
// PORT: SOURCE P20-P25.agc:2406
//#	RR AUTO TRACKER ENABLE AND RR ERROR COUNTER ENABLE
// PORT: SOURCE P20-P25.agc:2407
//#	(CHAN 12 BITS 14,2) BITS REMOVED, AND THE DESIGNATE FLAG
// PORT: SOURCE P20-P25.agc:2408
//#	(RADMODES BIT 10) REMOVED BEFORE EEXITING TO RDBADEND.  IF
// PORT: SOURCE P20-P25.agc:2409
//#	TIME HAS NOT EXPIRED, DESCOUNT IS DECREMENTED, THE
// PORT: SOURCE P20-P25.agc:2410
//#	EXECUTIVE CALL MADE FOR DODES, AND A .5 SECOND WAIT INITIATED
// PORT: SOURCE P20-P25.agc:2411
//#	BEFORE REPEATING THIS PROCEDURE AT STDESIG.
// PORT: SOURCE P20-P25.agc:2412
//#
// PORT: SOURCE P20-P25.agc:2413
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:2414
//#
// PORT: SOURCE P20-P25.agc:2415
//#	WAITLIST CALL FROM STARTDES
// PORT: SOURCE P20-P25.agc:2416
//#	TCF BEGDES FROM DORREPOS
// PORT: SOURCE P20-P25.agc:2417
//#	TC STDESIG RETURNING, FROM REMODE
// PORT: SOURCE P20-P25.agc:2418
//#
// PORT: SOURCE P20-P25.agc:2419
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:2420
//#
// PORT: SOURCE P20-P25.agc:2421
//#	DESCOUNT, FINDVAC
// PORT: SOURCE P20-P25.agc:2422
//#
// PORT: SOURCE P20-P25.agc:2423
//# JOBS OR TASKS INITIATED:  DODES
// PORT: SOURCE P20-P25.agc:2424
//#
// PORT: SOURCE P20-P25.agc:2425
//# ALARMS:  PROGRAM ALARM 00503 (30 SECONDS HAVE EXPIRED) WITH NO RR DATA
// PORT: SOURCE P20-P25.agc:2426
//# GOOD (CHAN 33 BIT 4) RECEIVED WHEN LOCK-ON (STATE BIT 5) WAS REQUESTED.
// PORT: SOURCE P20-P25.agc:2427
//#
// PORT: SOURCE P20-P25.agc:2428
//# EXIT:  	TASKOVER (SEARCH PATTERN DESIGNATING TO NEW POINT)
// PORT: SOURCE P20-P25.agc:2429
//# 		ENDRADAR (NO DESIGNATE -- RADMODES BIT 10)
// PORT: SOURCE P20-P25.agc:2430
//#		RDBADEND (REPOSITION OR 30 SECONDS EXPIRED)
// PORT: SOURCE P20-P25.agc:2431
//
// PORT: SOURCE P20-P25.agc:2432
//BEGDES		CS	RADMODES
// PORT: Fixed ROM slots 23931.
            if slot <> 23931 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23932 {
// PORT: SOURCE P20-P25.agc:2433
//# Page 546
// PORT: SOURCE P20-P25.agc:2434
//		MASK	REMODBIT
// PORT: Fixed ROM slots 23932.
                if slot <> 23932 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P20-P25.agc:2435
//		CCS	A
// PORT: Fixed ROM slots 23933.
                if slot <> 23933 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 23934 {
// PORT: SOURCE P20-P25.agc:2436
//		TC	STDESIG
// PORT: Fixed ROM slots 23934.
            if slot <> 23934 or instruction <> 1410 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1410, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23935 {
// PORT: SOURCE P20-P25.agc:2437
//		TC	REMODE
// PORT: Fixed ROM slots 23935.
                if slot <> 23935 or instruction <> 1145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1145, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P20-P25.agc:2438
//DESLOOP		TC	FIXDELAY	# 2 SAMPLES PER SECOND.
// PORT: Fixed ROM slots 23936.
                if slot <> 23936 or instruction <> 2705 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2705, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1581] to agcAotUnit1581@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2439
//		DEC	50
// PORT: Fixed ROM slots 23937.
    23937, 100
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23938–23961.
function agcAotUnit1582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23949 {
        if slot <= 23943 {
            if slot <= 23940 {
                if slot <= 23938 {
// PORT: SOURCE P20-P25.agc:2440
//
// PORT: SOURCE P20-P25.agc:2441
//STDESIG		CAF	REPOSBIT
// PORT: Fixed ROM slots 23938.
                    if slot <> 23938 or instruction <> 14817 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23939 {
// PORT: SOURCE P20-P25.agc:2442
//		MASK	RADMODES	# SEE IF GIMBAL LIMIT MONITOR HAS FOUND US
// PORT: Fixed ROM slots 23939.
                        if slot <> 23939 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2443
//		CCS	A		# OUT OF BOUNDS.  IF SO, THIS BIT SHOWS A
// PORT: Fixed ROM slots 23940.
                        if slot <> 23940 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 23941 {
// PORT: SOURCE P20-P25.agc:2444
//		TCF	BADDES		# REPOSITION TO BE IN PROGRESS.
// PORT: Fixed ROM slots 23941.
                    if slot <> 23941 or instruction <> 5523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5523, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23942 {
// PORT: SOURCE P20-P25.agc:2445
//
// PORT: SOURCE P20-P25.agc:2446
//		CCS	RADMODES	# SEE IF CONTINUOUS DESIGNATE WANTED.
// PORT: Fixed ROM slots 23942.
                        if slot <> 23942 or instruction <> 4168 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2447
//		TCF	+3		# IF SO, DON'T CHECK BIT 10 TO SEE IF IN
// PORT: Fixed ROM slots 23943.
                        if slot <> 23943 or instruction <> 5514 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5514, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23946 {
                if slot <= 23944 {
// PORT: SOURCE P20-P25.agc:2448
//		TCF	+2		# LIMITS BUT GO RIGHT TO FINDVAC ENTRY.
// PORT: Fixed ROM slots 23944.
                    if slot <> 23944 or instruction <> 5514 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5514, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23945 {
// PORT: SOURCE P20-P25.agc:2449
//		TCF	MOREDES +1
// PORT: Fixed ROM slots 23945.
                        if slot <> 23945 or instruction <> 5528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2450
//
// PORT: SOURCE P20-P25.agc:2451
//		CS	RADMODES	# IF NON-CONTINUOUS, SEE IF END OF
// PORT: Fixed ROM slots 23946.
                        if slot <> 23946 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23947 {
// PORT: SOURCE P20-P25.agc:2452
//		MASK	DESIGBIT	# PROBLEM (DATA GOOD IF LOCK-ON WANTED OR
// PORT: Fixed ROM slots 23947.
                    if slot <> 23947 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
                    if slot <= 23948 {
// PORT: SOURCE P20-P25.agc:2453
//		CCS	A		# WITHIN LIMITS IF NOT).  IF SO, EXIT AFTER
// PORT: Fixed ROM slots 23948.
                        if slot <> 23948 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2454
//		TCF	ENDRADAR	# CHECKING RR CDU FAIL.
// PORT: Fixed ROM slots 23949.
                        if slot <> 23949 or instruction <> 5990 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5990, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 23955 {
            if slot <= 23952 {
                if slot <= 23950 {
// PORT: SOURCE P20-P25.agc:2455
//
// PORT: SOURCE P20-P25.agc:2456
//STDESIG1	CCS	DESCOUNT	# SEE IF THE TIME LIMIT HAS EXPIRED
// PORT: Fixed ROM slots 23950.
                    if slot <> 23950 or instruction <> 4684 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 588).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23951 {
// PORT: SOURCE P20-P25.agc:2457
//		TCF	MOREDES
// PORT: Fixed ROM slots 23951.
                        if slot <> 23951 or instruction <> 5527 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5527, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2458
//
// PORT: SOURCE P20-P25.agc:2459
//		CS	B14+B2		# IF OUT OF TIME, REMOVE ECR ENABLE + TRKR
// PORT: Fixed ROM slots 23952.
                        if slot <> 23952 or instruction <> 17821 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1437), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23953 {
// PORT: SOURCE P20-P25.agc:2460
//		EXTEND
// PORT: Fixed ROM slots 23953.
                    if slot <> 23953 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23954 {
// PORT: SOURCE P20-P25.agc:2461
//		WAND	CHAN12
// PORT: Fixed ROM slots 23954.
                        if slot <> 23954 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2462
//BADDES		CS	DESIGBIT	# REMOVE DESIGNATE FLAG
// PORT: Fixed ROM slots 23955.
                        if slot <> 23955 or instruction <> 18914 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23958 {
                if slot <= 23956 {
// PORT: SOURCE P20-P25.agc:2463
//		MASK	RADMODES
// PORT: Fixed ROM slots 23956.
                    if slot <> 23956 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23957 {
// PORT: SOURCE P20-P25.agc:2464
//		TS	RADMODES
// PORT: Fixed ROM slots 23957.
                        if slot <> 23957 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2465
//		TCF	RDBADEND
// PORT: Fixed ROM slots 23958.
                        if slot <> 23958 or instruction <> 6002 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6002, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 23959 {
// PORT: SOURCE P20-P25.agc:2466
//
// PORT: SOURCE P20-P25.agc:2467
//MOREDES		TS	DESCOUNT
// PORT: Fixed ROM slots 23959.
                    if slot <> 23959 or instruction <> 23116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23116, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23960 {
// PORT: SOURCE P20-P25.agc:2468
//		CAF	PRIO26		# UPDATE GYRO TORQUE COMMANDS.
// PORT: Fixed ROM slots 23960.
                        if slot <> 23960 or instruction <> 16332 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P20-P25.agc:2469
//		TC	FINDVAC
// PORT: Fixed ROM slots 23961.
                        if slot <> 23961 or instruction <> 2629 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1582] to agcAotUnit1582@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2470
//		EBANK=	LOSCOUNT
// PORT: SOURCE P20-P25.agc:2471
//		2CADR	DODES
// PORT: Fixed ROM slots 23962 23963.
    23962, 2876, 23963, 43118
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23964–23964.
function agcAotUnit1583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P20-P25.agc:2472
//
// PORT: SOURCE P20-P25.agc:2473
//		TCF	DESLOOP
// PORT: Fixed ROM slots 23964.
    if slot <> 23964 or instruction <> 5504 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5504, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1583] to agcAotUnit1583@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2474
//
// PORT: SOURCE P20-P25.agc:2475
//B14+B2		OCT	20002
// PORT: Fixed ROM slots 23965.
    23965, 16388
)).

// PORT: Physical bank 25. Shared continuation entries, slots 23966–23969.
function agcAotUnit1584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23967 {
        if slot <= 23966 {
// PORT: SOURCE P20-P25.agc:2476
//
// PORT: SOURCE P20-P25.agc:2477
//# Page 547
// PORT: SOURCE P20-P25.agc:2478
//# PROGRAM NAME:  DODES
// PORT: SOURCE P20-P25.agc:2479
//#
// PORT: SOURCE P20-P25.agc:2480
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE P20-P25.agc:2481
//#
// PORT: SOURCE P20-P25.agc:2482
//#	DODES CALCULATES AND REQUESTS ISSUANCE OF RR GYRO TORQUE
// PORT: SOURCE P20-P25.agc:2483
//#	COMMANDS.  INITIALLY THE CURRENT RR CDU ANGLES ARE STORED AND
// PORT: SOURCE P20-P25.agc:2484
//#	THE LOS HALF-UNIT VECTOR TRANSFORMED FROM STABLE MEMBER TO
// PORT: SOURCE P20-P25.agc:2485
//#	NAVIGATION BASE COORDINATES VIA SMNB IF NECESSARY.  THE
// PORT: SOURCE P20-P25.agc:2486
//#	SHAFT AND TRUNNION COMMANDS ARE THEN CALCULATED AS FOLLOWS:
// PORT: SOURCE P20-P25.agc:2487
//#		+ SHAFT = LOS . (COS(S), 0, -SIN(S))  (DOT PRODUCT)
// PORT: SOURCE P20-P25.agc:2488
//#		- TRUNNION = LOS . (SIN(T)SIN(S), COS(T), SIN(T)COS(S))
// PORT: SOURCE P20-P25.agc:2489
//#	THE SIGN OF THE SHAFT COMMAND IS THEN REVERSED IF IN MODE 2
// PORT: SOURCE P20-P25.agc:2490
//#	(RADMODES BIT 12) BECAUSE A RELAY IN THE RR REVERSES THE
// PORT: SOURCE P20-P25.agc:2491
//#	POLARITY OF THE COMMAND.  AT RRSCALUP EACH COMMAND IS
// PORT: SOURCE P20-P25.agc:2492
//#	SCALED AND IF EITHER, OR BOTH, OF THE COMMANDS IS GREATER THAN
// PORT: SOURCE P20-P25.agc:2493
//#	.5 DEGREES, MPAC +1 IS SET POSITIVE.  IF A CONTINUOUS DESIGNATE
// PORT: SOURCE P20-P25.agc:2494
//#	(RADMODES BIT 15) IS DESIRED AND THE SEARCH ROUTINE IS NOT OPERATING,
// PORT: SOURCE P20-P25.agc:2495
//#	THE RR AUTO TRACKER ENABLE BIT (CHAN 12 BIT 14) IS CLEARED AND RROUT
// PORT: SOURCE P20-P25.agc:2496
//#	CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITION (RADMODES BIT 11)
// PORT: SOURCE P20-P25.agc:2497
//#	IS IN PROGRESS.  IF A CONTINUOUS DESIGNATE AND THE SEARCH ROUTINE IS
// PORT: SOURCE P20-P25.agc:2498
//#	OPERATING (SRCHOPT FLAT SET) THE TRACK ENABLE IS NOT CLEARED.  IF NO
// PORT: SOURCE P20-P25.agc:2499
//#	CONTINUOUS DESIGNATE AND BOTH COMMANDS ARE NOT LESS THAN .5 DEGREES AS
// PORT: SOURCE P20-P25.agc:2500
//#	INDICATED BY MPAC +1, THE RR AUTO TRACKER ENABLE BIT (CHAN 12 BIT 14) IS
// PORT: SOURCE P20-P25.agc:2501
//# 	CLEARED AND RROUT CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITON
// PORT: SOURCE P20-P25.agc:2502
//#	(RADMODES BIT 11) IS IN PROGRESS.  IF BOTH COMMANDS ARE LESS THAN .5
// PORT: SOURCE P20-P25.agc:2503
//#	DEGREES AS INDICATED BY MPAC+1, THE RR AUTO TRACKER ENABLE BIT
// PORT: SOURCE P20-P25.agc:2504
//#	(CHAN 12 BIT 14) IS CLEARED AND RROUT CALLED TO PUT OUT THE
// PORT: SOURCE P20-P25.agc:2505
//#	COMMANDS PROVIDED NO REPOSITION (RADMODES BIT 11) IS IN
// PORT: SOURCE P20-P25.agc:2506
//#	PROGRESS.  IF BOTH COMMANDS ARE LESS THAN .5 DEGREES, THE
// PORT: SOURCE P20-P25.agc:2507
//#	LOCK-ON FLAG (STATE BIT 5) IS CHECKED.  IF NOT PRESETN, THE
// PORT: SOURCE P20-P25.agc:2508
//#	DESIGNATE FLAG (RADMODES BIT 10) IS CLEARED, AND ENDOFJOB
// PORT: SOURCE P20-P25.agc:2509
//#	CALLED.  IF LOCK-ON IS DESIRED, THE RR AUTO TRACKER (CHAN 12
// PORT: SOURCE P20-P25.agc:2510
//#	BIT 14) IS ENABLED FOLLOWED BY A CHECK OF THE RECEIPT OF THE
// PORT: SOURCE P20-P25.agc:2511
//#	RR DATA GOOD (CHAN 33 BIT 4) SIGNAL.  IF RR DATA GOOD
// PORT: SOURCE P20-P25.agc:2512
//#	PRESENT, THE DESIGNATE FLAG (RADMODES BIT 10) IS CLEARED,
// PORT: SOURCE P20-P25.agc:2513
//# 	THE RR ERROR COUNTER ENABLE BIT (CHAN 12 BIT 2) IS CLEARED,
// PORT: SOURCE P20-P25.agc:2514
//#	AND ENDOFJOB CALLED.  IF RR DATA GOOD IS NOT PRESENT, RROUT
// PORT: SOURCE P20-P25.agc:2515
//#	IS CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITION
// PORT: SOURCE P20-P25.agc:2516
//#	(RADMODES BIT 11) IS IN PROGRESS AFTER WHICH THE JOB IS TERMINATED
// PORT: SOURCE P20-P25.agc:2517
//#	VIA ENDOFJOB.
// PORT: SOURCE P20-P25.agc:2518
//#
// PORT: SOURCE P20-P25.agc:2519
//# CALLING SEQUENCE:
// PORT: SOURCE P20-P25.agc:2520
//#
// PORT: SOURCE P20-P25.agc:2521
//#	EXECUTIVE CALL EVERY .5 SECONDS FROM BEGDES.
// PORT: SOURCE P20-P25.agc:2522
//#
// PORT: SOURCE P20-P25.agc:2523
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P20-P25.agc:2524
//#
// PORT: SOURCE P20-P25.agc:2525
//#	RRTARGET (HALF-UNIT LOS VECTOR IN EITHER SM OR NB COORDINATES),
// PORT: SOURCE P20-P25.agc:2526
//#	LOKONSW (STATE BIT 5), RRNBSW (STATE BIT 6), RADMODES
// PORT: SOURCE P20-P25.agc:2527
//#
// PORT: SOURCE P20-P25.agc:2528
//# SUBROUTINES CALLED:
// PORT: SOURCE P20-P25.agc:2529
//#
// PORT: SOURCE P20-P25.agc:2530
//# 	READCDUS, SMNB, CDULOGIC, MAGSUB, RROUT
// PORT: SOURCE P20-P25.agc:2531
//# Page 548
// PORT: SOURCE P20-P25.agc:2532
//#
// PORT: SOURCE P20-P25.agc:2533
//# JOBS OR TASKS INITIATED:
// PORT: SOURCE P20-P25.agc:2534
//#
// PORT: SOURCE P20-P25.agc:2535
//#	NONE
// PORT: SOURCE P20-P25.agc:2536
//#
// PORT: SOURCE P20-P25.agc:2537
//# ALARMS:  NONE
// PORT: SOURCE P20-P25.agc:2538
//#
// PORT: SOURCE P20-P25.agc:2539
//# EXIT:  ENDOFJOB (ALWAYS)
// PORT: SOURCE P20-P25.agc:2540
//
// PORT: SOURCE P20-P25.agc:2541
//DODES		EXTEND
// PORT: Fixed ROM slots 23966.
            if slot <> 23966 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2542
//		DCA	CDUT
// PORT: Fixed ROM slots 23967.
            if slot <> 23967 or instruction <> 12318 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23968 {
// PORT: SOURCE P20-P25.agc:2543
//		DXCH	TANG
// PORT: Fixed ROM slots 23968.
            if slot <> 23968 or instruction <> 22088 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P20-P25.agc:2544
//
// PORT: SOURCE P20-P25.agc:2545
//		TC	INTPRET
// PORT: Fixed ROM slots 23969.
            if slot <> 23969 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1584] to agcAotUnit1584@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2546
//
// PORT: SOURCE P20-P25.agc:2547
//		SETPD	VLOAD
// PORT: Fixed ROM slots 23970.
    23970, 64770,
// PORT: SOURCE P20-P25.agc:2548
//			0
// PORT: Fixed ROM slots 23971.
    23971, 2,
// PORT: SOURCE P20-P25.agc:2549
//			RRTARGET
// PORT: Fixed ROM slots 23972.
    23972, 1156,
// PORT: SOURCE P20-P25.agc:2550
//		BON	VXSC
// PORT: Fixed ROM slots 23973.
    23973, 61720,
// PORT: SOURCE P20-P25.agc:2551
//			RRNBSW
// PORT: Fixed ROM slots 23974.
    23974, 402,
// PORT: SOURCE P20-P25.agc:2552
//			DONBRD		# TARGET IN NAV-BASE COORDINATES
// PORT: Fixed ROM slots 23975.
    23975, 43874,
// PORT: SOURCE P20-P25.agc:2553
//			MLOSV		# MULTIPLY UNIT LOS BY MAGNITUDE
// PORT: Fixed ROM slots 23976.
    23976, 2030,
// PORT: SOURCE P20-P25.agc:2554
//		VSL1	PDVL
// PORT: Fixed ROM slots 23977.
    23977, 52724,
// PORT: SOURCE P20-P25.agc:2555
//			LOSVEL
// PORT: Fixed ROM slots 23978.
    23978, 2018,
// PORT: SOURCE P20-P25.agc:2556
//		VXSC	VAD		# ADD ONE SECOND RELATIVE VELOCITY TO LOS
// PORT: Fixed ROM slots 23979.
    23979, 44514,
// PORT: SOURCE P20-P25.agc:2557
//			MCTOMS
// PORT: Fixed ROM slots 23980.
    23980, 11380,
// PORT: SOURCE P20-P25.agc:2558
//		UNIT	CALL
// PORT: Fixed ROM slots 23981.
    23981, 37980,
// PORT: SOURCE P20-P25.agc:2559
//			CDUTRIG
// PORT: Fixed ROM slots 23982.
    23982, 40638,
// PORT: SOURCE P20-P25.agc:2560
//		CALL
// PORT: Fixed ROM slots 23983.
    23983, 65320,
// PORT: SOURCE P20-P25.agc:2561
//			*SMNB*
// PORT: Fixed ROM slots 23984.
    23984, 40818,
// PORT: SOURCE P20-P25.agc:2562
//
// PORT: SOURCE P20-P25.agc:2563
//DONBRD		STODL	32D
// PORT: Fixed ROM slots 23985.
    23985, 12354,
// PORT: SOURCE P20-P25.agc:2564
//			TANG +1
// PORT: Fixed ROM slots 23986.
    23986, 1170,
// PORT: SOURCE P20-P25.agc:2565
//		RTB	PUSH		# SHAFT COMMAND = V(32D).(COS(S), 0,
// PORT: Fixed ROM slots 23987.
    23987, 34360,
// PORT: SOURCE P20-P25.agc:2566
//			CDULOGIC	#	-SIN(S)).
// PORT: Fixed ROM slots 23988.
    23988, 18172,
// PORT: SOURCE P20-P25.agc:2567
//		SIN	PDDL		# SIN(S) TO 0 AND COS(S) TO 2.
// PORT: Fixed ROM slots 23989.
    23989, 54748,
// PORT: SOURCE P20-P25.agc:2568
//		COS	PUSH
// PORT: Fixed ROM slots 23990.
    23990, 34508,
// PORT: SOURCE P20-P25.agc:2569
//		DMP	PDDL
// PORT: Fixed ROM slots 23991.
    23991, 54538,
// PORT: SOURCE P20-P25.agc:2570
//			32D
// PORT: Fixed ROM slots 23992.
    23992, 66,
// PORT: SOURCE P20-P25.agc:2571
//			36D
// PORT: Fixed ROM slots 23993.
    23993, 74,
// PORT: SOURCE P20-P25.agc:2572
//		DMP	BDSU
// PORT: Fixed ROM slots 23994.
    23994, 37130,
// PORT: SOURCE P20-P25.agc:2573
//			0
// PORT: Fixed ROM slots 23995.
    23995, 2,
// PORT: SOURCE P20-P25.agc:2574
//		STADR
// PORT: Fixed ROM slots 23996.
    23996, 65324,
// PORT: SOURCE P20-P25.agc:2575
//		STORE	TANG +1		# SHAFT COMMAND
// PORT: Fixed ROM slots 23997.
    23997, 64364,
// PORT: SOURCE P20-P25.agc:2576
//
// PORT: SOURCE P20-P25.agc:2577
//		SLOAD	RTB
// PORT: Fixed ROM slots 23998.
    23998, 40122,
// PORT: SOURCE P20-P25.agc:2578
//			TANG
// PORT: Fixed ROM slots 23999.
    23999, 1168,
// PORT: SOURCE P20-P25.agc:2579
//			CDULOGIC
// PORT: Fixed ROM slots 24000.
    24000, 18172,
// PORT: SOURCE P20-P25.agc:2580
//		PUSH	COS		# COS(T) TO 4.
// PORT: Fixed ROM slots 24001.
    24001, 58892,
// PORT: SOURCE P20-P25.agc:2581
//		PDDL	SIN
// PORT: Fixed ROM slots 24002.
    24002, 61098,
// PORT: SOURCE P20-P25.agc:2582
//		PUSH	DMP		# SIN(T) TO 6.
// PORT: Fixed ROM slots 24003.
    24003, 34060,
// PORT: SOURCE P20-P25.agc:2583
//			2
// PORT: Fixed ROM slots 24004.
    24004, 6,
// PORT: SOURCE P20-P25.agc:2584
//# Page 549
// PORT: SOURCE P20-P25.agc:2585
//		SL1	PDDL		# DEFINE VECTOR U =	[SIN(T)SIN(S)]
// PORT: Fixed ROM slots 24005.
    24005, 54740,
// PORT: SOURCE P20-P25.agc:2586
//			4		#			[   COS(T)   ]
// PORT: Fixed ROM slots 24006.
    24006, 10,
// PORT: SOURCE P20-P25.agc:2587
//		PDDL	DMP		#			[SIN(T)COS(S)]
// PORT: Fixed ROM slots 24007.
    24007, 34218,
// PORT: SOURCE P20-P25.agc:2588
//			6
// PORT: Fixed ROM slots 24008.
    24008, 14,
// PORT: SOURCE P20-P25.agc:2589
//			0
// PORT: Fixed ROM slots 24009.
    24009, 2,
// PORT: SOURCE P20-P25.agc:2590
//		SL1	VDEF
// PORT: Fixed ROM slots 24010.
    24010, 46804,
// PORT: SOURCE P20-P25.agc:2591
//		DOT	EXIT		# DOT U WITH LOS TO GET TRUNNION COMMAND.
// PORT: Fixed ROM slots 24011.
    24011, 65090,
// PORT: SOURCE P20-P25.agc:2592
//			32D
// PORT: Fixed ROM slots 24012.
    24012, 66
)).

// PORT: Physical bank 25. Shared continuation entries, slots 24013–24027.
function agcAotUnit1585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24019 {
        if slot <= 24015 {
            if slot <= 24013 {
// PORT: SOURCE P20-P25.agc:2593
//
// PORT: SOURCE P20-P25.agc:2594
//# Page 550
// PORT: SOURCE P20-P25.agc:2595
//# AT THIS POINT WE HAVE A ROTATION VECTOR IN DISH AXES LYING IN THE TS PLANE.  CONVERT THIS TO A
// PORT: SOURCE P20-P25.agc:2596
//# COMMANDED RATE AND ENABLE THE TRACKER IF WE ARE WITHIN .5 DEGREES OF THE TARGET.
// PORT: SOURCE P20-P25.agc:2597
//
// PORT: SOURCE P20-P25.agc:2598
//		CS	MPAC		# DOT WAS NEGATIVE OF DESREG ANGLE.
// PORT: Fixed ROM slots 24013.
                if slot <> 24013 or instruction <> 16492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 108).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24014 {
// PORT: SOURCE P20-P25.agc:2599
//		EXTEND
// PORT: Fixed ROM slots 24014.
                    if slot <> 24014 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2600
//		MP	RDESGAIN	# SCALING ON INPUT ANGLE WAS 4 RADIANS.
// PORT: Fixed ROM slots 24015.
                    if slot <> 24015 or instruction <> 30262 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1590, readEffective:call(words, 1590)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24017 {
                if slot <= 24016 {
// PORT: SOURCE P20-P25.agc:2601
//		TS	TANG		# TRUNNION COMMAND.
// PORT: Fixed ROM slots 24016.
                    if slot <> 24016 or instruction <> 23111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2602
//		CS	RADMODES	# A RELAY IN THE RR REVERSES POLARITY OF
// PORT: Fixed ROM slots 24017.
                    if slot <> 24017 or instruction <> 16456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 72).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24018 {
// PORT: SOURCE P20-P25.agc:2603
//		MASK	BIT12		# THE SHAFT COMMANDS IN MODE 2 SO THAT A
// PORT: Fixed ROM slots 24018.
                    if slot <> 24018 or instruction <> 31200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        if fixedOperand = 2048 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2604
//		EXTEND			# POSITIVE TORQUE APPLIED TO THE SHAFT
// PORT: Fixed ROM slots 24019.
                    if slot <> 24019 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24023 {
            if slot <= 24021 {
                if slot <= 24020 {
// PORT: SOURCE P20-P25.agc:2605
//		BZF	+3		# GYRO CAUSES A POSITIVE CHANGE IN THE
// PORT: Fixed ROM slots 24020.
                    if slot <> 24020 or instruction <> 5591 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5591, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2606
//		CA	TANG +1		# SHAFT ANGLE.  COMPENSATE FOR THIS SWITCH
// PORT: Fixed ROM slots 24021.
                    if slot <> 24021 or instruction <> 12872 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 584).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24022 {
// PORT: SOURCE P20-P25.agc:2607
//		TCF	+2		# BY CHANGING THE POLARITY OF OUR COMMAND.
// PORT: Fixed ROM slots 24022.
                    if slot <> 24022 or instruction <> 5592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2608
// +3		CS	TANG +1
// PORT: Fixed ROM slots 24023.
                    if slot <> 24023 or instruction <> 16968 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 584).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24025 {
                if slot <= 24024 {
// PORT: SOURCE P20-P25.agc:2609
//		EXTEND
// PORT: Fixed ROM slots 24024.
                    if slot <> 24024 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2610
//		MP	RDESGAIN	# SCALING ON INPUT ANGLE WAS 4 RADIANS.
// PORT: Fixed ROM slots 24025.
                    if slot <> 24025 or instruction <> 30262 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1590, readEffective:call(words, 1590)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24026 {
// PORT: SOURCE P20-P25.agc:2611
//		TS	TANG +1		# SHAFT COMMAND FOR RROUT
// PORT: Fixed ROM slots 24026.
                    if slot <> 24026 or instruction <> 23112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23112, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P20-P25.agc:2612
//		TC	INTPRET
// PORT: Fixed ROM slots 24027.
                    if slot <> 24027 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1585] to agcAotUnit1585@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P20-P25.agc:2613
//
// PORT: SOURCE P20-P25.agc:2614
//		DLOAD	DMP
// PORT: Fixed ROM slots 24028.
    24028, 34250,
// PORT: SOURCE P20-P25.agc:2615
//			2		# COS(S).
// PORT: Fixed ROM slots 24029.
    24029, 6,
// PORT: SOURCE P20-P25.agc:2616
//			4		# COS(T).
// PORT: Fixed ROM slots 24030.
    24030, 10,
// PORT: SOURCE P20-P25.agc:2617
//		SL1	PDDL		# Z COMPONENT OF URR.
// PORT: Fixed ROM slots 24031.
    24031, 54740,
// PORT: SOURCE P20-P25.agc:2618
//		DCOMP	PDDL		# Y COMPONENT = -SIN(T)
// PORT: Fixed ROM slots 24032.
    24032, 54652,
// PORT: SOURCE P20-P25.agc:2619
//			0		# SIN(S).
// PORT: Fixed ROM slots 24033.
    24033, 2,
// PORT: SOURCE P20-P25.agc:2620
//		DMP	SL1
// PORT: Fixed ROM slots 24034.
    24034, 59914,
// PORT: SOURCE P20-P25.agc:2621
//			4		# COS(T).
// PORT: Fixed ROM slots 24035.
    24035, 10,
// PORT: SOURCE P20-P25.agc:2622
//		VDEF	BON		# FORM URR IN NB AXES.
// PORT: Fixed ROM slots 24036.
    24036, 35948,
// PORT: SOURCE P20-P25.agc:2623
//			RRNBSW		# BYPASS NBSM CONVERSION IN VERB 41
// PORT: Fixed ROM slots 24037.
    24037, 402,
// PORT: SOURCE P20-P25.agc:2624
//			+3
// PORT: Fixed ROM slots 24038.
    24038, 43986,
// PORT: SOURCE P20-P25.agc:2625
//		CALL
// PORT: Fixed ROM slots 24039.
    24039, 65320,
// PORT: SOURCE P20-P25.agc:2626
//			*NBSM*		# GET URR IN SM AXES.
// PORT: Fixed ROM slots 24040.
    24040, 40822,
// PORT: SOURCE P20-P25.agc:2627
//		DOT	EXIT
// PORT: Fixed ROM slots 24041.
    24041, 65090,
// PORT: SOURCE P20-P25.agc:2628
//			RRTARGET	# GET COSIN OF ANGLE BETWEEN RR AND LOS
// PORT: Fixed ROM slots 24042.
    24042, 1156
)).
