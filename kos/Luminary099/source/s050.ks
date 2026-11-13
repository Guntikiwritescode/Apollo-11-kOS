// P20-P25.agc
// bank 24, slots 22528-22528
function agcAotUnit1394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1
//# Copyright:	Public domain.
// P20-P25.agc:2
//# Filename:	P20-P25.agc
// P20-P25.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P20-P25.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// P20-P25.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P20-P25.agc:6
//# Assembler:	yaYUL
// P20-P25.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// P20-P25.agc:8
//# Website:	www.ibiblio.org/apollo.
// P20-P25.agc:9
//# Pages:	0492-0613
// P20-P25.agc:10
//# Mod history:	2009-05-26 OH	Transcribed from page images.
// P20-P25.agc:11
//#		2009-06-05 RSB	Corrected a typos.
// P20-P25.agc:12
//#		2009-06-06 RSB	Added a missing instruction, and a block
// P20-P25.agc:13
//#				of 3 missing instructions.
// P20-P25.agc:14
//#		2009-06-07 RSB	Fixed a misprint.
// P20-P25.agc:15
//#		2009-06-07 RSB	Changed the construct "2DEC E-6 B12"
// P20-P25.agc:16
//#				(which isn't legal in yaYUL) to
// P20-P25.agc:17
//#				"2DEC 1.0 E-6 B12".
// P20-P25.agc:18
//#		2011-05-07 JL	Removed workarounds.
// P20-P25.agc:19
//
// P20-P25.agc:20
//# This source code has been transcribed or otherwise adapted from
// P20-P25.agc:21
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P20-P25.agc:22
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// P20-P25.agc:23
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P20-P25.agc:24
//# in storage size and consequent reduction in image quality as well) are
// P20-P25.agc:25
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P20-P25.agc:26
//# find that the images are illegible, contact me at info@sandroid.org
// P20-P25.agc:27
//# about getting access to the (much) higher-quality images which Paul
// P20-P25.agc:28
//# actually created.
// P20-P25.agc:29
//#
// P20-P25.agc:30
//# Notations on the hardcopy document read, in part:
// P20-P25.agc:31
//#
// P20-P25.agc:32
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P20-P25.agc:33
//#	16:27 JULY 14, 1969
// P20-P25.agc:34
//
// P20-P25.agc:35
//# Page 492
// P20-P25.agc:36
//# RENDEZVOUS NAVIGATION PROGRAM 20
// P20-P25.agc:37
//#
// P20-P25.agc:38
//# PROGRAM DESCRIPTION
// P20-P25.agc:39
//#
// P20-P25.agc:40
//# 	MOD NO -- 2
// P20-P25.agc:41
//# 	BY P. VOLANTE
// P20-P25.agc:42
//#
// P20-P25.agc:43
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:44
//#
// P20-P25.agc:45
//# 	THE PURPOSE OF THIS PROGRAM IS TO CONTROL THE RENDEZVOUS RADAR FROM
// P20-P25.agc:46
//# 	STARTUP THROUGH ACQUISITION AND LOCKON TO THE CSM AND TO UPDATE EITHER
// P20-P25.agc:47
//# 	THE LM OR CSM STATE VECTOR (AS SPECIFIED BY THE ASTRONAUT BY DSKY ENTRY)
// P20-P25.agc:48
//# 	ON THE BASIS OF THE RR TRACKING DATA.
// P20-P25.agc:49
//#
// P20-P25.agc:50
//# CALLING SEQUENCE --
// P20-P25.agc:51
//#
// P20-P25.agc:52
//# 	ASTRONAUT REQUEST THROUGH DSKY V37E20E
// P20-P25.agc:53
//#
// P20-P25.agc:54
//# SUBROUTINES CALLED
// P20-P25.agc:55
//#
// P20-P25.agc:56
//#	R02BOTH	(IMU STATUS CHECK)			FLAGUP
// P20-P25.agc:57
//#	GOFLASH	(PINBALL-DISPLAY)			FLAGDOWN
// P20-P25.agc:58
//#	R23LEM	(MANUAL ACQUISITION)			BANKCALL
// P20-P25.agc:59
//#	LS201	(LOS DETERMINATION)			TASKOVER
// P20-P25.agc:60
//#	LS202	(RANGE LIMIT TEST)
// P20-P25.agc:61
//#	R61LEM	(PREFERRED TRACKING ATTITUDE)
// P20-P25.agc:62
//#	R21LEM	(RR DESIGNATE)				ENDOFJOB
// P20-P25.agc:63
//#	R22LEM	(DATA READ)				GOPERF1
// P20-P25.agc:64
//#	R31LEM	(RENDEZVOUS PARAMETER DISPLAY)
// P20-P25.agc:65
//#	PRIOLARM (PRIORITY DISPLAY)
// P20-P25.agc:66
//#
// P20-P25.agc:67
//# NORMAL EXIT MODES --
// P20-P25.agc:68
//#
// P20-P25.agc:69
//# 	P20 MAY BE TERMINATED IN TWO WAYS -- ASTRONAUT SELECTION OF IDLING
// P20-P25.agc:70
//#	PROGRAM (P00) BY KEYING V37E00E OR BY KEYING IN V56E
// P20-P25.agc:71
//#
// P20-P25.agc:72
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:73
//#
// P20-P25.agc:74
//# 	RANGE GREATER THAN 400 NM DISPLAY
// P20-P25.agc:75
//#
// P20-P25.agc:76
//# OUTPUT
// P20-P25.agc:77
//#
// P20-P25.agc:78
//# 	TRKMKCNT = NO OF RENDEZVOUS TRACKING MARKS TAKEN (COUNTER)
// P20-P25.agc:79
//#
// P20-P25.agc:80
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:81
//#
// P20-P25.agc:82
//# FLAGS SET + RESET
// P20-P25.agc:83
//#
// P20-P25.agc:84
//#	SRCHOPT, RNDVZFLG, ACMODFLG, VEHUPFLG, UPDATFLG, TRACKFLG
// P20-P25.agc:85
//#
// P20-P25.agc:86
//# DEBRIS
// P20-P25.agc:87
//#
// P20-P25.agc:88
//#	CENTRALS -- A,Q,L
// P20-P25.agc:89
//
// P20-P25.agc:90
//		SBANK=	LOWSUPER	# FOR LOW 2CADR'S.
// P20-P25.agc:91
//
// P20-P25.agc:92
//		BANK	33
// P20-P25.agc:93
//		SETLOC	P20S
// P20-P25.agc:94
//		BANK
// P20-P25.agc:95
//
// P20-P25.agc:96
//		EBANK=	LOSCOUNT
// P20-P25.agc:97
//		COUNT*	$$/P20
// P20-P25.agc:98
//PROG22		=	PROG20
// P20-P25.agc:99
//PROG20		TC	2PHSCHNG
// slot 22528
    if slot <> 22528 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1394] to agcAotUnit1394@.

agcAotInstallSourceRope(list(
// P20-P25.agc:100
//		OCT	4
// slot 22529
    22529, 8,
// P20-P25.agc:101
//		OCT	05022
// slot 22530
    22530, 5156,
// P20-P25.agc:102
//		OCT	26000		# PRIORITY 26
// slot 22531
    22531, 22528
)).

// bank 24, slots 22532-22535
function agcAotUnit1395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22533 {
        if slot <= 22532 {
// P20-P25.agc:103
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE
// slot 22532
            if slot <> 22532 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:104
//# Page 493
// P20-P25.agc:105
//		TC	ORBCHGO		# YES
// slot 22533
            if slot <> 22533 or instruction <> 1031 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1031, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22534 {
// P20-P25.agc:106
//		TC	PROG20A -2	# NO -- CONTINUE WITH P20
// slot 22534
            if slot <> 22534 or instruction <> 1054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:107
//ORBCHGO		TC	UPFLAG		# SET VEHUPFLG -- CSM STATE
// slot 22535
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
// P20-P25.agc:108
//		ADRES	VEHUPFLG	# VECTOR TO BE UPDATED
// slot 22536
    22536, 44
)).

// bank 24, slots 22537-22540
function agcAotUnit1396 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22538 {
        if slot <= 22537 {
// P20-P25.agc:109
//		CAF	ONE		# SET R2 FOR OPTION CSM WILL NOT
// slot 22537
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
// P20-P25.agc:110
//		TS	OPTION2		# CHANGE PRESENT ORBIT
// slot 22538
            if slot <> 22538 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22539 {
// P20-P25.agc:111
//		CAF	OCT00012
// slot 22539
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
// P20-P25.agc:112
//		TC	BANKCALL	# DISPLAY ASSUMED CSM ORBIT OPTION
// slot 22540
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
// P20-P25.agc:113
//		CADR	GOPERF4
// slot 22541
    22541, 17206
)).

// bank 24, slots 22542-22550
function agcAotUnit1397 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22545 {
        if slot <= 22543 {
            if slot <= 22542 {
// P20-P25.agc:114
//		TC	GOTOPOOH	# TERMINATE
// slot 22542
                if slot <> 22542 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:115
//		TC	ORBCHG1		# PROCEED VALUE OF ASSUMED OPTION OK
// slot 22543
                if slot <> 22543 or instruction <> 1041 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1041, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22544 {
// P20-P25.agc:116
//		TC	-5		# R2 LOADED THRU DSKY
// slot 22544
                if slot <> 22544 or instruction <> 1035 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1035, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:117
//ORBCHG1		CS	P22ONE
// slot 22545
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
// P20-P25.agc:118
//		AD	OPTION2
// slot 22546
                if slot <> 22546 or instruction <> 25189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 613).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:119
//		EXTEND
// slot 22547
                if slot <> 22547 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22548 {
// P20-P25.agc:120
//		BZF	PROG20A
// slot 22548
                if slot <> 22548 or instruction <> 5152 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5152, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22549 {
// P20-P25.agc:121
//		CAF	V06N33*
// slot 22549
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
// P20-P25.agc:122
//		TC	BANKCALL	# FLASH VERB-NOUN TO REQUEST ESTIMATED
// slot 22550
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
// P20-P25.agc:123
//		CADR	GOFLASH		# TIME OF LAUNCH
// slot 22551
    22551, 17020
)).

// bank 24, slots 22552-22555
function agcAotUnit1398 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22553 {
        if slot <= 22552 {
// P20-P25.agc:124
//		TC	GOTOPOOH	# TERMINATE
// slot 22552
            if slot <> 22552 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:125
//		TC	ORBCHG2		# PROCEED VALUES OK
// slot 22553
            if slot <> 22553 or instruction <> 1051 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1051, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22554 {
// P20-P25.agc:126
//		TC	-5		# TIME LOADED THRU DSKY
// slot 22554
            if slot <> 22554 or instruction <> 1045 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1045, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:127
//ORBCHG2		TC	INTPRET
// slot 22555
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
// P20-P25.agc:128
//		GOTO
// slot 22556
    22556, 65360,
// P20-P25.agc:129
//			ORBCHG3
// slot 22557
    22557, 53534,
// P20-P25.agc:130
//	 	BANK	32
// P20-P25.agc:131
//		SETLOC	P20S4
// P20-P25.agc:132
//		BANK
// P20-P25.agc:133
//		COUNT*	$$/P20
// P20-P25.agc:134
//
// P20-P25.agc:135
//ORBCHG3		CALL
// slot 28815
    28815, 65320,
// P20-P25.agc:136
//			INTSTALL
// slot 28816
    28816, 24088,
// P20-P25.agc:137
//		DLOAD
// slot 28817
    28817, 65482,
// P20-P25.agc:138
//			TIG
// slot 28818
    28818, 3652,
// P20-P25.agc:139
//		STORE	LNCHTM
// slot 28819
    28819, 3938,
// P20-P25.agc:140
//		STORE	TDEC1		# ESTIMATED LAUNCH TIME
// slot 28820
    28820, 66,
// P20-P25.agc:141
//		CLEAR	CLEAR
// slot 28821
    28821, 35864,
// P20-P25.agc:142
//			VINTFLAG	# LM INTEGRATION
// slot 28822
    28822, 1912,
// P20-P25.agc:143
//			INTYPFLG	# PRECISION -- ENCKE
// slot 28823
    28823, 1910,
// P20-P25.agc:144
//		CLEAR	CLEAR
// slot 28824
    28824, 35864,
// P20-P25.agc:145
//			DIM0FLAG	# NO W-MATRIX
// slot 28825
    28825, 1916,
// P20-P25.agc:146
//			D6OR9FLG
// slot 28826
    28826, 1914,
// P20-P25.agc:147
//		CALL
// slot 28827
    28827, 65320,
// P20-P25.agc:148
//			INTEGRV		# PLANETARY INERTIAL ORIENTATION
// slot 28828
    28828, 23736,
// P20-P25.agc:149
//		CALL
// slot 28829
    28829, 65320,
// P20-P25.agc:150
//			GRP2PC
// slot 28830
    28830, 9544,
// P20-P25.agc:151
//		VLOAD
// slot 28831
    28831, 65530,
// P20-P25.agc:152
//			RATT1
// slot 28832
    28832, 30,
// P20-P25.agc:153
//		STODL	RSUBL		# SAVE LM POSITION
// slot 28833
    28833, 16178,
// P20-P25.agc:154
//			TAT
// slot 28834
    28834, 26,
// P20-P25.agc:155
//# Page 494
// P20-P25.agc:156
//		STCALL	TDEC1
// slot 28835
    28835, 28738,
// P20-P25.agc:157
//			INTSTALL
// slot 28836
    28836, 24088,
// P20-P25.agc:158
//		SET	CLEAR
// slot 28837
    28837, 35864,
// P20-P25.agc:159
//			VINTFLAG	# CSM INTEGRATION
// slot 28838
    28838, 1656,
// P20-P25.agc:160
//			INTYPFLG
// slot 28839
    28839, 1910,
// P20-P25.agc:161
//		CLEAR	BOFF
// slot 28840
    28840, 35864,
// P20-P25.agc:162
//			DIM0FLAG
// slot 28841
    28841, 1916,
// P20-P25.agc:163
//			RENDWFLG	# W MATRIX VALID
// slot 28842
    28842, 3036,
// P20-P25.agc:164
//			NOWMATX		# NO
// slot 28843
    28843, 53598,
// P20-P25.agc:165
//		SET	SET		# YES -- SET FOR W MATRIX
// slot 28844
    28844, 35864,
// P20-P25.agc:166
//			DIM0FLAG
// slot 28845
    28845, 1660,
// P20-P25.agc:167
//			D6OR9FLG
// slot 28846
    28846, 1658,
// P20-P25.agc:168
//NOWMATX		CALL
// slot 28847
    28847, 65320,
// P20-P25.agc:169
//			INTEGRV		# CSM INTEGRATION
// slot 28848
    28848, 23736,
// P20-P25.agc:170
//		CALL
// slot 28849
    28849, 65320,
// P20-P25.agc:171
//			GRP2PC
// slot 28850
    28850, 9544,
// P20-P25.agc:172
//		VLOAD
// slot 28851
    28851, 65530,
// P20-P25.agc:173
//			VATT1
// slot 28852
    28852, 42,
// P20-P25.agc:174
//		STOVL	VSUBC		# SAVE CSM POSITION
// slot 28853
    28853, 22498,
// P20-P25.agc:175
//			RATT1
// slot 28854
    28854, 30,
// P20-P25.agc:176
//		STORE	RSUBC		# SAVE CSM POSITION
// slot 28855
    28855, 1156,
// P20-P25.agc:177
//		VXV	UNIT		# COMPUTE NORMAL TO CSM ORBITAL PLANE
// slot 28856
    28856, 44602,
// P20-P25.agc:178
//			VSUBC		# NSUB1=UNIT(R(CM) CROSS V(CM))
// slot 28857
    28857, 2018,
// P20-P25.agc:179
//		STOVL	20D		# SAVE NSUB1
// slot 28858
    28858, 20522,
// P20-P25.agc:180
//			RSUBL		# COMPUTE ESTIMATED ORBITAL
// slot 28859
    28859, 3890,
// P20-P25.agc:181
//		VXV	UNIT		# PLANE CHANGE
// slot 28860
    28860, 44602,
// P20-P25.agc:182
//			20D		# UCSM = UNIT(R(LM) CROSS NSUB1)
// slot 28861
    28861, 42,
// P20-P25.agc:183
//		STOVL	UCSM
// slot 28862
    28862, 24382,
// P20-P25.agc:184
//			RSUBC		# COMPUTE ANGLE BETWEEN UCSM
// slot 28863
    28863, 1156,
// P20-P25.agc:185
//		UNIT	DOT		# AND RSUBC
// slot 28864
    28864, 41308,
// P20-P25.agc:186
//			UCSM		# COS A = UCSM DOT UNIT (R(CM))
// slot 28865
    28865, 3902,
// P20-P25.agc:187
//		SL1
// slot 28866
    28866, 65492,
// P20-P25.agc:188
//		STORE	CSTH		# SAVE DOE TIME-THETA SUBROUTINE
// slot 28867
    28867, 2996,
// P20-P25.agc:189
//		DSQ	BDSU		# COMPUTE SINE A
// slot 28868
    28868, 37276,
// P20-P25.agc:190
//			ONEB-2
// slot 28869
    28869, 8600,
// P20-P25.agc:191
//		SQRT
// slot 28870
    28870, 65516,
// P20-P25.agc:192
//		STOVL	SNTH		# SAVE FOR TIME-THETA SUBROUTINE
// slot 28871
    28871, 23472,
// P20-P25.agc:193
//			RSUBC		# POSITION OF CSM AT EST. LAUNCH
// slot 28872
    28872, 1156,
// P20-P25.agc:194
//		STOVL	RVEC		# TIME FOR TIME-THETHA	B-27
// slot 28873
    28873, 23386,
// P20-P25.agc:195
//			VSUBC		# VELOCITY OF CSM AT EST. LAUNCH.
// slot 28874
    28874, 2018,
// P20-P25.agc:196
//		VCOMP
// slot 28875
    28875, 65404,
// P20-P25.agc:197
//		STORE	VVEC		# TIME FOR TIME THETA 	B-5
// slot 28876
    28876, 3016,
// P20-P25.agc:198
//		CLEAR	CALL
// slot 28877
    28877, 37912,
// P20-P25.agc:199
//			RVSW
// slot 28878
    28878, 3948,
// P20-P25.agc:200
//			TIMETHET
// slot 28879
    28879, 21428,
// P20-P25.agc:201
//		VCOMP
// slot 28880
    28880, 65404,
// P20-P25.agc:202
//		STORE	NEWVEL		# TERMINAL VELOCITY OF CSM
// slot 28881
    28881, 3914,
// P20-P25.agc:203
//		DLOAD
// slot 28882
    28882, 65482,
// P20-P25.agc:204
//			T
// slot 28883
    28883, 62,
// P20-P25.agc:205
//		STOVL	TRANSTM		# TRANSFER TIME
// slot 28884
    28884, 24422,
// P20-P25.agc:206
//# Page 495
// P20-P25.agc:207
//			NEWVEL
// slot 28885
    28885, 3914,
// P20-P25.agc:208
//		ABVAL
// slot 28886
    28886, 65356,
// P20-P25.agc:209
//		STOVL	20D
// slot 28887
    28887, 20522,
// P20-P25.agc:210
//			0D
// slot 28888
    28888, 2,
// P20-P25.agc:211
//		STORE	NEWPOS		# TERMINAL POSITION OF CSM
// slot 28889
    28889, 3926,
// P20-P25.agc:212
//		VXV	UNIT		# COMPUTE NORMAL TO SCM ORBITAL PLANE
// slot 28890
    28890, 44602,
// P20-P25.agc:213
//			RSUBL		# NSUB2 = UNIT(NEWPOS CROSS R(LM))
// slot 28891
    28891, 3890,
// P20-P25.agc:214
//		VXV	UNIT		# ROTATE TERMINAL VEL INTO DESIRED
// slot 28892
    28892, 44602,
// P20-P25.agc:215
//			NEWPOS		# ORBITAL PLANE
// slot 28893
    28893, 3926,
// P20-P25.agc:216
//		VXSC	VSL1		# VSUBC = ABVAL(NEWVEL) $ UNIT (NSUB2
// slot 28894
    28894, 64226,
// P20-P25.agc:217
//			20D
// slot 28895
    28895, 42,
// P20-P25.agc:218
//		STCALL	NCSMVEL		# NEW CSM VELOCITY
// slot 28896
    28896, 32618,
// P20-P25.agc:219
//			GRP2PC
// slot 28897
    28897, 9544,
// P20-P25.agc:220
//		CALL
// slot 28898
    28898, 65320,
// P20-P25.agc:221
//			INTSTALL
// slot 28899
    28899, 24088,
// P20-P25.agc:222
//		DLOAD	BDSU
// slot 28900
    28900, 37322,
// P20-P25.agc:223
//			TRANSTM		# LAUNCH TIME -- TRANSFER TIME
// slot 28901
    28901, 3942,
// P20-P25.agc:224
//			LNCHTM
// slot 28902
    28902, 3938,
// P20-P25.agc:225
//		STOVL	TET
// slot 28903
    28903, 22174,
// P20-P25.agc:226
//			NEWPOS
// slot 28904
    28904, 3926,
// P20-P25.agc:227
//		STORE	RCV
// slot 28905
    28905, 1722,
// P20-P25.agc:228
//		STOVL	RRECT
// slot 28906
    28906, 22150,
// P20-P25.agc:229
//			NCSMVEL
// slot 28907
    28907, 3946,
// P20-P25.agc:230
//		STCALL	VRECT
// slot 28908
    28908, 30354,
// P20-P25.agc:231
//			MINIRECT
// slot 28909
    28909, 20058,
// P20-P25.agc:232
//		AXT,2	CALL
// slot 28910
    28910, 38136,
// P20-P25.agc:233
//			2
// slot 28911
    28911, 4,
// P20-P25.agc:234
//			ATOPCSM
// slot 28912
    28912, 23394,
// P20-P25.agc:235
//		CALL
// slot 28913
    28913, 65320,
// P20-P25.agc:236
//			INTWAKE0
// slot 28914
    28914, 24102,
// P20-P25.agc:237
//		EXIT
// slot 28915
    28915, 65532
)).

// bank 32, slots 28916-28916
function agcAotUnit1847 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:238
//		TC	BANKCALL
// slot 28916
    if slot <> 28916 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1847] to agcAotUnit1847@.

agcAotInstallSourceRope(list(
// P20-P25.agc:239
//		CADR	PROG20A
// slot 28917
    28917, 41024
)).

// bank 24, slots 22558-22558
function agcAotUnit1399 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:240
//
// P20-P25.agc:241
//		BANK	24
// P20-P25.agc:242
//		SETLOC	P20S
// P20-P25.agc:243
//		BANK
// P20-P25.agc:244
//		COUNT*	$$/P20
// P20-P25.agc:245
//
// P20-P25.agc:246
//		TC	DOWNFLAG	# RESET VEHUPFLG -- LM STATE VECTOR
// slot 22558
    if slot <> 22558 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1399] to agcAotUnit1399@.

agcAotInstallSourceRope(list(
// P20-P25.agc:247
//		ADRES	VEHUPFLG	# TO BE UPDATED
// slot 22559
    22559, 44
)).

// bank 24, slots 22560-22560
function agcAotUnit1400 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:248
//PROG20A		TC	BANKCALL
// slot 22560
    if slot <> 22560 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1400] to agcAotUnit1400@.

agcAotInstallSourceRope(list(
// P20-P25.agc:249
//		CADR	R02BOTH
// slot 22561
    22561, 9560
)).

// bank 24, slots 22562-22562
function agcAotUnit1401 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:250
//		TC	UPFLAG
// slot 22562
    if slot <> 22562 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1401] to agcAotUnit1401@.

agcAotInstallSourceRope(list(
// P20-P25.agc:251
//		ADRES	UPDATFLG	# SET UPDATE FLAG
// slot 22563
    22563, 46
)).

// bank 24, slots 22564-22564
function agcAotUnit1402 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:252
//		TC	UPFLAG
// slot 22564
    if slot <> 22564 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1402] to agcAotUnit1402@.

agcAotInstallSourceRope(list(
// P20-P25.agc:253
//		ADRES	TRACKFLG	# SET TRACK FLAG
// slot 22565
    22565, 50
)).

// bank 24, slots 22566-22566
function agcAotUnit1403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:254
//		TC	UPFLAG
// slot 22566
    if slot <> 22566 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1403] to agcAotUnit1403@.

agcAotInstallSourceRope(list(
// P20-P25.agc:255
//		ADRES	RNDVZFLG	# SET RENDEZVOUS FLAG
// slot 22567
    22567, 16
)).

// bank 24, slots 22568-22568
function agcAotUnit1404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:256
//		TC	DOWNFLAG
// slot 22568
    if slot <> 22568 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1404] to agcAotUnit1404@.

agcAotInstallSourceRope(list(
// P20-P25.agc:257
//		ADRES	SRCHOPTN	# INSURE SEARCH OPTION OFF
// slot 22569
    22569, 62
)).

// bank 24, slots 22570-22570
function agcAotUnit1405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:258
//# Page 496
// P20-P25.agc:259
//		TC	DOWNFLAG	# ALSO MANUAL ACQUISITION FLAG RESET
// slot 22570
    if slot <> 22570 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1405] to agcAotUnit1405@.

agcAotInstallSourceRope(list(
// P20-P25.agc:260
//		ADRES	ACMODFLG
// slot 22571
    22571, 64
)).

// bank 24, slots 22572-22572
function agcAotUnit1406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:261
//		TC	DOWNFLAG	# TURN OFF R04FLAG TO ENSURE GETTING
// slot 22572
    if slot <> 22572 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1406] to agcAotUnit1406@.

agcAotInstallSourceRope(list(
// P20-P25.agc:262
//		ADRES	R04FLAG		# ALARM 521 IF CAN'T READ RADAR
// slot 22573
    22573, 102
)).

// bank 24, slots 22574-22574
function agcAotUnit1407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:263
//		TC	DOWNFLAG	# ENSURE R25 GIMBAL MONITOR IS ENABLED
// slot 22574
    if slot <> 22574 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1407] to agcAotUnit1407@.

agcAotInstallSourceRope(list(
// P20-P25.agc:264
//		ADRES	NORRMON		# (RESET NORRMON FLAG)
// slot 22575
    22575, 172
)).

// bank 24, slots 22576-22576
function agcAotUnit1408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:265
//		TC	DOWNFLAG	# RESET LOS BEING COMPUTED FLAG
// slot 22576
    if slot <> 22576 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1408] to agcAotUnit1408@.

agcAotInstallSourceRope(list(
// P20-P25.agc:266
//		ADRES	LOSCMFLG
// slot 22577
    22577, 66
)).

// bank 24, slots 22578-22579
function agcAotUnit1409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22578 {
// P20-P25.agc:267
//		TC	CLRADMOD
// slot 22578
        if slot <> 22578 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:268
//P20LEM1		TC	PHASCHNG
// slot 22579
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
// P20-P25.agc:269
//		OCT	04022
// slot 22580
    22580, 4132
)).

// bank 24, slots 22581-22583
function agcAotUnit1410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22581 {
// P20-P25.agc:270
//		CAF	ZERO		# ZERO MARK COUNTER
// slot 22581
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
// P20-P25.agc:271
//		TS	MARKCTR
// slot 22582
            if slot <> 22582 or instruction <> 23346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23346, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:272
//		TC	INTPRET		# LOS DETERMINATION ROUTINE
// slot 22583
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
// P20-P25.agc:273
//		RTB
// slot 22584
    22584, 65336,
// P20-P25.agc:274
//			LOADTIME
// slot 22585
    22585, 18166,
// P20-P25.agc:275
//		STCALL	TDEC1
// slot 22586
    22586, 28738,
// P20-P25.agc:276
//			LPS20.1
// slot 22587
    22587, 42330,
// P20-P25.agc:277
//		CALL
// slot 22588
    22588, 65320,
// P20-P25.agc:278
//			LPS20.2		# TEST RANGE R/UTINE
// slot 22589
    22589, 44778,
// P20-P25.agc:279
//		EXIT
// slot 22590
    22590, 65532
)).

// bank 24, slots 22591-22591
function agcAotUnit1411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:280
//		INDEX	MPAC
// slot 22591
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
// P20-P25.agc:281
//		TC	+1
// slot 22592
    22592, 2178
)).

// bank 24, slots 22593-22595
function agcAotUnit1412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22593 {
// P20-P25.agc:282
//		TC	P20LEMA		# NORMAL RETURN WITHIN 400 N M
// slot 22593
        if slot <> 22593 or instruction <> 1097 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1097, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22594 {
// P20-P25.agc:283
//526ALARM	CAF	ALRM526		# ERROR EXIT -- RANGE > 400 N. MI.
// slot 22594
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
// P20-P25.agc:284
//		TC	BANKCALL
// slot 22595
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
// P20-P25.agc:285
//		CADR	PRIOLARM
// slot 22596
    22596, 18148
)).

// bank 24, slots 22597-22601
function agcAotUnit1413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22598 {
        if slot <= 22597 {
// P20-P25.agc:286
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// slot 22597
            if slot <> 22597 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:287
//		TC	-4		# PROC (ILLEGAL)
// slot 22598
            if slot <> 22598 or instruction <> 1090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22599 {
// P20-P25.agc:288
//		TC	P20LEM1		# ENTER RECYCLE
// slot 22599
            if slot <> 22599 or instruction <> 1075 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1075, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22600 {
// P20-P25.agc:289
//		TC	ENDOFJOB
// slot 22600
                if slot <> 22600 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:290
//
// P20-P25.agc:291
//P20LEMA		TC	PHASCHNG
// slot 22601
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
// P20-P25.agc:292
//		OCT	04022
// slot 22602
    22602, 4132
)).

// bank 24, slots 22603-22605
function agcAotUnit1414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22603 {
// P20-P25.agc:293
//		TC	LUNSFCHK	# CHECK LUNAR SURFACE FLAG (P22 FLAG)
// slot 22603
        if slot <> 22603 or instruction <> 1463 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1463, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22604 {
// P20-P25.agc:294
//		TC	P20LEMB
// slot 22604
            if slot <> 22604 or instruction <> 1103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:295
//		TC	BANKCALL
// slot 22605
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
// P20-P25.agc:296
//		CADR	R61LEM		# PREFERRED TRACKING ATTITUDE ROUTINE
// slot 22606
    22606, 39068
)).

// bank 24, slots 22607-22607
function agcAotUnit1415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:297
//P20LEMB		TC	PHASCHNG
// slot 22607
    if slot <> 22607 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1415] to agcAotUnit1415@.

agcAotInstallSourceRope(list(
// P20-P25.agc:298
//		OCT	05022		# RESTART AT PRIORITY 10 TO ALLOW V37
// slot 22608
    22608, 5156,
// P20-P25.agc:299
//		OCT	10000		# REQUESTED PROGRAM TO RUN FIRST
// slot 22609
    22609, 8192
)).

// bank 24, slots 22610-22629
function agcAotUnit1416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22619 {
        if slot <= 22614 {
            if slot <= 22611 {
                if slot <= 22610 {
// P20-P25.agc:300
//		CAF	PRIO26		# RESTORE PRIORITY 26
// slot 22610
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
// P20-P25.agc:301
//		TC	PRIOCHNG
// slot 22611
                    if slot <> 22611 or instruction <> 2662 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2662, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22612 {
// P20-P25.agc:302
//		CA	FLAGWRD1	# IS THE TRACK FLAG SET
// slot 22612
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
// P20-P25.agc:303
//		MASK	TRACKBIT
// slot 22613
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
// P20-P25.agc:304
//		EXTEND
// slot 22614
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
// P20-P25.agc:305
//		BZF	P20LEMWT	# BRANCH -- NO -- WAIT FOR IT TO BE SET
// slot 22615
                    if slot <> 22615 or instruction <> 5274 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5274, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:306
//P20LEMB7	CAF	BIT2		# IS RR AUTO MODE DISCRETE PRESENT
// slot 22616
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
// P20-P25.agc:307
//		EXTEND
// slot 22617
                    if slot <> 22617 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22618 {
// P20-P25.agc:308
//# Page 497
// P20-P25.agc:309
//		RAND	CHAN33
// slot 22618
                        if slot <> 22618 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:310
//		EXTEND
// slot 22619
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
// P20-P25.agc:311
//		BZF	P20LEMB3	# YES -- DO AUTOMATIC ACQUISITION (R21)
// slot 22620
                    if slot <> 22620 or instruction <> 5240 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5240, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:312
//
// P20-P25.agc:313
//P20LEMB5	CS	OCT24		# RADAR NOT IN AUTO CHECK IF
// slot 22621
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
// P20-P25.agc:314
//		AD	MODREG		# MAJOR MODE IS 20
// slot 22622
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
// P20-P25.agc:315
//		EXTEND
// slot 22623
                        if slot <> 22623 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:316
//		BZF	P20LEMB6	# BRANCH -- YES -- OKAY TO DO PLEASE PERFORM
// slot 22624
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
// P20-P25.agc:317
//
// P20-P25.agc:318
//		AD	NEG2		# ALSO CHECK FOR P22
// slot 22625
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
// P20-P25.agc:319
//		EXTEND
// slot 22626
                    if slot <> 22626 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22627 {
// P20-P25.agc:320
//		BZF	P20LEMB6	# BRANCH -- YES OK TO DO PLEASE PERFORM
// slot 22627
                    if slot <> 22627 or instruction <> 5227 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5227, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22628 {
// P20-P25.agc:321
//		CAF	ALRM514		# TRACK FLAG SET -- FLASH PRIORITY ALARM 514 --
// slot 22628
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
// P20-P25.agc:322
//		TC	BANKCALL	# RADAR GOES OUT OF AUTO MODE WHILE IN USE
// slot 22629
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
// P20-P25.agc:323
//		CADR	PRIOLARM
// slot 22630
    22630, 18148
)).

// bank 24, slots 22631-22636
function agcAotUnit1417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22633 {
        if slot <= 22631 {
// P20-P25.agc:324
//		TC	GOTOV56		# TERMINATE EXITS VIA V56
// slot 22631
            if slot <> 22631 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22632 {
// P20-P25.agc:325
//		TC	P20LEMB		# PROCEED AND ENTER BOTH GO BACK
// slot 22632
                if slot <> 22632 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:326
//		TC	P20LEMB		# TO CHECK AUTO MODE AGAIN
// slot 22633
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
// P20-P25.agc:327
//		TC	ENDOFJOB
// slot 22634
            if slot <> 22634 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22635 {
// P20-P25.agc:328
//P20LEMB6	CAF	OCT201		# REQUEST RR AUTO MODE SELECTION
// slot 22635
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
// P20-P25.agc:329
//		TC	BANKCALL
// slot 22636
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
// P20-P25.agc:330
//		CADR	GOPERF1
// slot 22637
    22637, 17190
)).

// bank 24, slots 22638-22643
function agcAotUnit1418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22640 {
        if slot <= 22638 {
// P20-P25.agc:331
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// slot 22638
            if slot <> 22638 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22639 {
// P20-P25.agc:332
//		TC	P20LEMB		# PROCEED CHECKS AUTO MODE DISCRETE AGAIN
// slot 22639
                if slot <> 22639 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:333
//		TC	LUNSFCHK	# ENTER INDICATES MANUAL ACQUISITION (R23)
// slot 22640
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
// P20-P25.agc:334
//		TC	P20LEMB2	# YES -- R23 NOT ALLOWED -- TURN ON OPR ERROR
// slot 22641
            if slot <> 22641 or instruction <> 1142 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1142, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22642 {
// P20-P25.agc:335
//		TC	R23LEM		# NO -- DO MANUAL ACQUISITION
// slot 22642
                if slot <> 22642 or instruction <> 1629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:336
//
// P20-P25.agc:337
//P20LEMB1	TC	UPFLAG		# RETURN FROM R23 -- LOCKON ACHIEVED
// slot 22643
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
// P20-P25.agc:338
//		ADRES	ACMODFLG	# SET MANUAL FLAG AND GO BACK TO CHECK
// slot 22644
    22644, 64
)).

// bank 24, slots 22645-22656
function agcAotUnit1419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22650 {
        if slot <= 22647 {
            if slot <= 22645 {
// P20-P25.agc:339
//		TC	P20LEMB		# RR AUTO MODE
// slot 22645
                if slot <> 22645 or instruction <> 1103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22646 {
// P20-P25.agc:340
//
// P20-P25.agc:341
//P20LEMB2	TC	FALTON		# TURNS ON OPERATOR ERROR LIGHT ON DSKY
// slot 22646
                    if slot <> 22646 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:342
//		TC	P20LEMB		# AND GOES BACK TO CHECK AUTO MODE
// slot 22647
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
// P20-P25.agc:343
//
// P20-P25.agc:344
//P20LEMB3	CS	RADMODES	# ARE RR CDUS BEING ZEROED
// slot 22648
                if slot <> 22648 or instruction <> 16456 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 72).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22649 {
// P20-P25.agc:345
//		MASK	RCDU0BIT
// slot 22649
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
// P20-P25.agc:346
//		EXTEND
// slot 22650
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
// P20-P25.agc:347
//		BZF	P20LEMB4	# BRANCH -- YES -- WAIT
// slot 22651
                if slot <> 22651 or instruction <> 5253 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5253, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22652 {
// P20-P25.agc:348
//		CAF	BIT13-14	# IS SEARCH OR MANUAL ACQUISITION FLAG SET
// slot 22652
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
// P20-P25.agc:349
//		MASK	FLAGWRD2
// slot 22653
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
// P20-P25.agc:350
//		EXTEND
// slot 22654
                if slot <> 22654 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22655 {
// P20-P25.agc:351
//		BZF	P20LEMC3	# ZERO MEANS AUTOMATIC RR ACQUISITION
// slot 22655
                    if slot <> 22655 or instruction <> 5257 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5257, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:352
//		TC	DOWNFLAG	# RESET TO AUTO MODE
// slot 22656
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
// P20-P25.agc:353
//		ADRES	SRCHOPTN
// slot 22657
    22657, 62
)).

// bank 24, slots 22658-22658
function agcAotUnit1420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:354
//# Page 498
// P20-P25.agc:355
//		TC	DOWNFLAG
// slot 22658
    if slot <> 22658 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1420] to agcAotUnit1420@.

agcAotInstallSourceRope(list(
// P20-P25.agc:356
//		ADRES	ACMODFLG
// slot 22659
    22659, 64
)).

// bank 24, slots 22660-22662
function agcAotUnit1421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22660 {
// P20-P25.agc:357
//		TC	P20LEMWT	# WAIT 2.5 SECONDS THEN GO TO RR DATA READ
// slot 22660
        if slot <> 22660 or instruction <> 1178 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1178, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22661 {
// P20-P25.agc:358
//
// P20-P25.agc:359
//P20LEMB4	CAF	250DEC
// slot 22661
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
// P20-P25.agc:360
//		TC	BANKCALL	# WAIT 2.5 SECONDS WHILE RR CDUS ARE BEING
// slot 22662
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
// P20-P25.agc:361
//		CADR	DELAYJOB	# ZEROED -- THEN GO BACK AND CHECK AGAIN
// slot 22663
    22663, 1978
)).

// bank 24, slots 22664-22665
function agcAotUnit1422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22664 {
// P20-P25.agc:362
//		TC	P20LEMB3
// slot 22664
        if slot <> 22664 or instruction <> 1144 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1144, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:363
//
// P20-P25.agc:364
//P20LEMC3	TC	INTPRET
// slot 22665
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
// P20-P25.agc:365
//		RTB
// slot 22666
    22666, 65336,
// P20-P25.agc:366
//			LOADTIME
// slot 22667
    22667, 18166,
// P20-P25.agc:367
//		STCALL	TDEC1
// slot 22668
    22668, 28738,
// P20-P25.agc:368
//			UPPSV
// slot 22669
    22669, 41372,
// P20-P25.agc:369
//P20LEMC4	EXIT
// slot 22670
    22670, 65532
)).

// bank 24, slots 22671-22671
function agcAotUnit1423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:370
//P20LEMC		TC	PHASCHNG
// slot 22671
    if slot <> 22671 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1423] to agcAotUnit1423@.

agcAotInstallSourceRope(list(
// P20-P25.agc:371
//		OCT	04022
// slot 22672
    22672, 4132
)).

// bank 24, slots 22673-22683
function agcAotUnit1424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22677 {
        if slot <= 22674 {
            if slot <= 22673 {
// P20-P25.agc:372
//		CAE	FLAGWRD0	# IS THE RENDEZVOUS FLAG SET
// slot 22673
                if slot <> 22673 or instruction <> 12348 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:373
//		MASK	RNDVZBIT
// slot 22674
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
// P20-P25.agc:374
//		EXTEND
// slot 22675
                if slot <> 22675 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22676 {
// P20-P25.agc:375
//		BZF	ENDOFJOB	# NO -- EXIT P20
// slot 22676
                    if slot <> 22676 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:376
//		CAE	FLAGWRD1	# IS TRACK FLAG SET (BIT 5 FLAGWORD 1)
// slot 22677
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
// P20-P25.agc:377
//		MASK	TRACKBIT
// slot 22678
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
// P20-P25.agc:378
//		EXTEND
// slot 22679
                    if slot <> 22679 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:379
//		BZF	P20LEMD		# BRANCH -- TRACK FLAG NOT ON -- WAIT 15 SECONDS
// slot 22680
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
// P20-P25.agc:380
//P20LEMF		TC	R21LEM
// slot 22681
                if slot <> 22681 or instruction <> 1468 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1468, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22682 {
// P20-P25.agc:381
//
// P20-P25.agc:382
//P20LEMWT	CAF	250DEC
// slot 22682
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
// P20-P25.agc:383
//		TC	TWIDDLE		# USE INSTEAD OF WAITLIST SINCE SAME BANK
// slot 22683
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
// P20-P25.agc:384
//		ADRES	P20LEMC1	# WAIT 2.5 SECONDS
// slot 22684
    22684, 2376
)).

// bank 24, slots 22685-22689
function agcAotUnit1425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22686 {
        if slot <= 22685 {
// P20-P25.agc:385
//		CAE	FLAGWRD1	# IS TRACK FLAG SET
// slot 22685
            if slot <> 22685 or instruction <> 12349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:386
//		MASK	TRACKBIT
// slot 22686
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
// P20-P25.agc:387
//		EXTEND
// slot 22687
            if slot <> 22687 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22688 {
// P20-P25.agc:388
//		BZF	ENDOFJOB	# NO -- EXIT WITHOUT DOING 2.7 PHASE CHANGE
// slot 22688
                if slot <> 22688 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:389
//P20LMWT1	TC	PHASCHNG
// slot 22689
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
// P20-P25.agc:390
//		OCT	40072
// slot 22690
    22690, 32884
)).

// bank 24, slots 22691-22701
function agcAotUnit1426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22695 {
        if slot <= 22692 {
            if slot <= 22691 {
// P20-P25.agc:391
//		TC	ENDOFJOB
// slot 22691
                if slot <> 22691 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:392
//
// P20-P25.agc:393
//P20LEMC1	CAE	FLAGWRD0	# IS RENDEZVOUS FLAG SET
// slot 22692
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
// P20-P25.agc:394
//		MASK	RNDVZBIT
// slot 22693
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
// P20-P25.agc:395
//		EXTEND
// slot 22694
                    if slot <> 22694 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:396
//		BZF	TASKOVER	# NO -- EXIT P20/R22
// slot 22695
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
// P20-P25.agc:397
//		CAE	FLAGWRD1	# IS TRACK FLAG SET
// slot 22696
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
// P20-P25.agc:398
//		MASK	TRACKBIT
// slot 22697
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
// P20-P25.agc:399
//		EXTEND
// slot 22698
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
// P20-P25.agc:400
//		BZF	P20LEMC2	# NO -- DON'T SCHEDULE R22 JOB
// slot 22699
                if slot <> 22699 or instruction <> 5297 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5297, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22700 {
// P20-P25.agc:401
//# Page 499
// P20-P25.agc:402
//		CAF	PRIO26		# YES -- SCHEDULE R22 JOB (RR DATA READ)
// slot 22700
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
// P20-P25.agc:403
//		TC	FINDVAC
// slot 22701
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
// P20-P25.agc:404
//		EBANK=	LOSCOUNT
// P20-P25.agc:405
//		2CADR	R22LEM42
// slot 22702 22703
    22702, 2862, 22703, 41070
)).

// bank 24, slots 22704-22705
function agcAotUnit1427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22704 {
// P20-P25.agc:406
//
// P20-P25.agc:407
//		TC	TASKOVER
// slot 22704
        if slot <> 22704 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:408
//
// P20-P25.agc:409
//P20LEMC2	TC	FIXDELAY	# TRACK FLAG NOT SET, WAIT 15 SECONDS
// slot 22705
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
// P20-P25.agc:410
//		DEC	1500		# AND CHECK AGAIN
// slot 22706
    22706, 3000
)).

// bank 24, slots 22707-22709
function agcAotUnit1428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22707 {
// P20-P25.agc:411
//
// P20-P25.agc:412
//		TC	P20LEMC1
// slot 22707
        if slot <> 22707 or instruction <> 1188 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1188, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22708 {
// P20-P25.agc:413
//
// P20-P25.agc:414
//P20LEMD		CAF	1500DEC
// slot 22708
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
// P20-P25.agc:415
//		TC	TWIDDLE		# WAITLIST FOR 15 SECONDS
// slot 22709
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
// P20-P25.agc:416
//		ADRES	P20LEMD1
// slot 22710
    22710, 2416
)).

// bank 24, slots 22711-22716
function agcAotUnit1429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22713 {
        if slot <= 22711 {
// P20-P25.agc:417
//		TC	ENDOFJOB
// slot 22711
            if slot <> 22711 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22712 {
// P20-P25.agc:418
//
// P20-P25.agc:419
//P20LEMD1	CAE	FLAGWRD1	# IS TRACK FLAG SET
// slot 22712
                if slot <> 22712 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:420
//		MASK 	TRACKBIT
// slot 22713
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
// P20-P25.agc:421
//		CCS	A
// slot 22714
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
// P20-P25.agc:422
//		TCF	P20LEMD2	# YES -- SCHEDULE DESIGNATE JOB
// slot 22715
                if slot <> 22715 or instruction <> 5311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5311, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:423
//		TC	FIXDELAY	# NO -- WAIT 15 SECONDS
// slot 22716
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
// P20-P25.agc:424
//		DEC	1500
// slot 22717
    22717, 3000
)).

// bank 24, slots 22718-22720
function agcAotUnit1430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22718 {
// P20-P25.agc:425
//		TC	P20LEMD1
// slot 22718
        if slot <> 22718 or instruction <> 1208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1208, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22719 {
// P20-P25.agc:426
//
// P20-P25.agc:427
//P20LEMD2	CAF	PRIO26		# SCHEDULE JOB TO DO R21
// slot 22719
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
// P20-P25.agc:428
//		TC	FINDVAC
// slot 22720
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
// P20-P25.agc:429
//		EBANK=	LOSCOUNT
// P20-P25.agc:430
//		2CADR	P20LEMC3	# START AT PERM.  MEMORY INTEGRATION
// slot 22721 22722
    22721, 2322, 22722, 41070
)).

// bank 24, slots 22723-22723
function agcAotUnit1431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:431
//
// P20-P25.agc:432
//		TC	TASKOVER
// slot 22723
    if slot <> 22723 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1431] to agcAotUnit1431@.

agcAotInstallSourceRope(list(
// P20-P25.agc:433
//
// P20-P25.agc:434
//250DEC		DEC	250
// slot 22724
    22724, 500,
// P20-P25.agc:435
//ALRM526		OCT	00526
// slot 22725
    22725, 684,
// P20-P25.agc:436
//OCT201		OCT	00201
// slot 22726
    22726, 258,
// P20-P25.agc:437
//ALRM514		OCT	514
// slot 22727
    22727, 664,
// P20-P25.agc:438
//MAXTRIES	DEC	60
// slot 22728
    22728, 120,
// P20-P25.agc:439
//OCT00012	OCT	00012
// slot 22729
    22729, 20,
// P20-P25.agc:440
//P22ONE		OCT	00001
// slot 22730
    22730, 2,
// P20-P25.agc:441
//ONEB-2		2DEC	1.0 B-2
// slot 22731 22732
    22731, 8192, 22732, 0,
// P20-P25.agc:442
//
// P20-P25.agc:443
//V06N33*		VN	0633
// slot 22733
    22733, 1602,
// P20-P25.agc:444
//UPPSV		STQ	CALL		# UPDATES PERMANENT STATE VECTORS
// slot 22734
    22734, 37920,
// P20-P25.agc:445
//			LS21X		# 	TO PRESENT TIME
// slot 22735
    22735, 2014,
// P20-P25.agc:446
//			INTSTALL
// slot 22736
    22736, 24088,
// P20-P25.agc:447
//		CALL
// slot 22737
    22737, 65320,
// P20-P25.agc:448
//# Page 500
// P20-P25.agc:449
//			SETIFLGS
// slot 22738
    22738, 23368,
// P20-P25.agc:450
//		BOF	SET		# IF W-MATRIX INVALID, DON'T INTEGRATE IT
// slot 22739
    22739, 35864,
// P20-P25.agc:451
//			RENDWFLG
// slot 22740
    22740, 3036,
// P20-P25.agc:452
//			UPPSV1
// slot 22741
    22741, 41404,
// P20-P25.agc:453
//			DIM0FLAG	# SET DIM0FLAG TO INTEGRATE W-MATRIX
// slot 22742
    22742, 1660,
// P20-P25.agc:454
//		BON	SET
// slot 22743
    22743, 35864,
// P20-P25.agc:455
//			SURFFLAG	# IF ON LUNAR SURFACE W IS 6X6
// slot 22744
    22744, 4494,
// P20-P25.agc:456
//			UPPSV5
// slot 22745
    22745, 41398,
// P20-P25.agc:457
//			D6OR9FLG	# OTHERWISE 9X9
// slot 22746
    22746, 1658,
// P20-P25.agc:458
//UPPSV5		BOF
// slot 22747
    22747, 65304,
// P20-P25.agc:459
//			VEHUPFLG
// slot 22748
    22748, 974,
// P20-P25.agc:460
//			UPPSV3
// slot 22749
    22749, 41456,
// P20-P25.agc:461
//UPPSV1		SET
// slot 22750
    22750, 65304,
// P20-P25.agc:462
//			VINTFLAG
// slot 22751
    22751, 1656,
// P20-P25.agc:463
//		CALL
// slot 22752
    22752, 65320,
// P20-P25.agc:464
//			INTEGRV
// slot 22753
    22753, 23736,
// P20-P25.agc:465
//		CALL			# GROUP 2 PHASE CHANGE
// slot 22754
    22754, 65320,
// P20-P25.agc:466
//			GRP2PC		# TO PROTECT INTEGRATION
// slot 22755
    22755, 9544,
// P20-P25.agc:467
//		CALL
// slot 22756
    22756, 65320,
// P20-P25.agc:468
//			INTSTALL
// slot 22757
    22757, 24088,
// P20-P25.agc:469
//		DLOAD	CLEAR		# GET TETCSM TO STORE IN TDEC FOR LM INT.
// slot 22758
    22758, 36042,
// P20-P25.agc:470
//			TETCSM
// slot 22759
    22759, 1778,
// P20-P25.agc:471
//			VINTFLAG
// slot 22760
    22760, 1912,
// P20-P25.agc:472
//UPPSV4		CALL			# INTEGRATE OTHER VEHICLE
// slot 22761
    22761, 65320,
// P20-P25.agc:473
//			SETIFLGS	#	WITHOUT W-MATRIX
// slot 22762
    22762, 23368,
// P20-P25.agc:474
//		STCALL	TDEC1
// slot 22763
    22763, 28738,
// P20-P25.agc:475
//			INTEGRV
// slot 22764
    22764, 23736,
// P20-P25.agc:476
//		BOFF	VLOAD
// slot 22765
    22765, 64792,
// P20-P25.agc:477
//			SURFFLAG
// slot 22766
    22766, 4558,
// P20-P25.agc:478
//			P20LEMC4
// slot 22767
    22767, 41244,
// P20-P25.agc:479
//			RCVLEM
// slot 22768
    22768, 1890,
// P20-P25.agc:480
//		VSR2
// slot 22769
    22769, 65476,
// P20-P25.agc:481
//		STOVL	LMPOS
// slot 22770
    22770, 22996,
// P20-P25.agc:482
//			VCVLEM
// slot 22771
    22771, 1902,
// P20-P25.agc:483
//		VSR2
// slot 22772
    22772, 65476,
// P20-P25.agc:484
//		STORE	LMVEL
// slot 22773
    22773, 2528,
// P20-P25.agc:485
//		GOTO
// slot 22774
    22774, 65360,
// P20-P25.agc:486
//			LS21X
// slot 22775
    22775, 2014,
// P20-P25.agc:487
//
// P20-P25.agc:488
//UPPSV3		CLEAR	CALL
// slot 22776
    22776, 37912,
// P20-P25.agc:489
//			VINTFLAG
// slot 22777
    22777, 1912,
// P20-P25.agc:490
//			INTEGRV
// slot 22778
    22778, 23736,
// P20-P25.agc:491
//		CALL
// slot 22779
    22779, 65320,
// P20-P25.agc:492
//			GRP2PC
// slot 22780
    22780, 9544,
// P20-P25.agc:493
//		CALL
// slot 22781
    22781, 65320,
// P20-P25.agc:494
//			INTSTALL
// slot 22782
    22782, 24088,
// P20-P25.agc:495
//		SET	DLOAD
// slot 22783
    22783, 58648,
// P20-P25.agc:496
//			VINTFLAG
// slot 22784
    22784, 1656,
// P20-P25.agc:497
//			TETLEM		# GET TETLEM TO STORE IN TDEC FOR CSM INT.
// slot 22785
    22785, 1862,
// P20-P25.agc:498
//# Page 501
// P20-P25.agc:499
//		GOTO
// slot 22786
    22786, 65360,
// P20-P25.agc:500
//			UPPSV4
// slot 22787
    22787, 41426
)).

// bank 24, slots 22788-22788
function agcAotUnit1432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:501
//		EBANK=	LOSCOUNT
// P20-P25.agc:502
//		COUNT*	$$/P22
// P20-P25.agc:503
//
// P20-P25.agc:504
//# Page 502
// P20-P25.agc:505
//# PROGRAM DESCRIPTION
// P20-P25.agc:506
//#
// P20-P25.agc:507
//#	PREFERRED TRACKING ATTITUDE PROGRAM P25
// P20-P25.agc:508
//#	MOD NO -- 3
// P20-P25.agc:509
//# 	BY P. VOLANTE
// P20-P25.agc:510
//#
// P20-P25.agc:511
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:512
//#
// P20-P25.agc:513
//#	THE PURPOSE OF THIS PROGRAM IS TO COMPUTE THE PREFERRED TRACKING
// P20-P25.agc:514
//# 	ATTITUDE OF THE LM TO CONTINUOUSLY POINT THE LM TRTACKING BEACON AT THE
// P20-P25.agc:515
//#	CSM AND TO PERFORM THE MANEUVER TO THE PREFERRED TRACKING ATTITUDE AND
// P20-P25.agc:516
//# 	CONTINUOUSLY MAINTAIN THIS ATTITUDE WITHIN PRESCRIBED LIMITS.
// P20-P25.agc:517
//#
// P20-P25.agc:518
//# CALLING SEQUENCE --
// P20-P25.agc:519
//#
// P20-P25.agc:520
//#	ASTRONAUT REQUEST THROUGH DSKY V37E25E
// P20-P25.agc:521
//#
// P20-P25.agc:522
//# SUBROUTINES CALLED --
// P20-P25.agc:523
//#
// P20-P25.agc:524
//#	BANKCALL					FLAGUP
// P20-P25.agc:525
//#	R02BOTH	(IMU STATUS CHECK)			ENDOFJOB
// P20-P25.agc:526
//#	R61LEM	(PREF TRK ATT ROUT)			WAITLIST
// P20-P25.agc:527
//#	TASKOVER					FINDVAC
// P20-P25.agc:528
//#
// P20-P25.agc:529
//# NORMAL EXIT MODES --
// P20-P25.agc:530
//#
// P20-P25.agc:531
//# 	P25 MAY BE TERMINATED IN TWO WAYS -- ASTRONAUT SELECTION OF IDLING
// P20-P25.agc:532
//#	PROGRAM (P00) BY KEYING V37E00E OR BY KEYING IN V56E
// P20-P25.agc:533
//#
// P20-P25.agc:534
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:535
//#
// P20-P25.agc:536
//#	NONE
// P20-P25.agc:537
//#
// P20-P25.agc:538
//# OUTPUT
// P20-P25.agc:539
//#
// P20-P25.agc:540
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:541
//#
// P20-P25.agc:542
//# FLAGS SET + RESET
// P20-P25.agc:543
//#
// P20-P25.agc:544
//#	TRACKFLG, P25FLAG
// P20-P25.agc:545
//#
// P20-P25.agc:546
//# DEBRIS
// P20-P25.agc:547
//#
// P20-P25.agc:548
//#	NONE
// P20-P25.agc:549
//
// P20-P25.agc:550
//		EBANK=	LOSCOUNT
// P20-P25.agc:551
//		COUNT*	$$/P25
// P20-P25.agc:552
//PROG25		TC	2PHSCHNG
// slot 22788
    if slot <> 22788 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1432] to agcAotUnit1432@.

agcAotInstallSourceRope(list(
// P20-P25.agc:553
//		OCT	4		# MAKE GROUP 4 INACTIVE (VERB 37)
// slot 22789
    22789, 8,
// P20-P25.agc:554
//		OCT	05022
// slot 22790
    22790, 5156,
// P20-P25.agc:555
//		OCT	26000		# PRIORITY 26
// slot 22791
    22791, 22528
)).

// bank 24, slots 22792-22792
function agcAotUnit1433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:556
//
// P20-P25.agc:557
//		TC	BANKCALL
// slot 22792
    if slot <> 22792 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1433] to agcAotUnit1433@.

agcAotInstallSourceRope(list(
// P20-P25.agc:558
//		CADR	R02BOTH		# IMU STATUS CHECK
// slot 22793
    22793, 9560
)).

// bank 24, slots 22794-22794
function agcAotUnit1434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:559
//		TC	UPFLAG
// slot 22794
    if slot <> 22794 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1434] to agcAotUnit1434@.

agcAotInstallSourceRope(list(
// P20-P25.agc:560
//		ADRES	TRACKFLG	# SET TRACK FLAG
// slot 22795
    22795, 50
)).

// bank 24, slots 22796-22796
function agcAotUnit1435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:561
//		TC	UPFLAG
// slot 22796
    if slot <> 22796 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1435] to agcAotUnit1435@.

agcAotInstallSourceRope(list(
// P20-P25.agc:562
//		ADRES	P25FLAG		# SET P25FLAG
// slot 22797
    22797, 12
)).

// bank 24, slots 22798-22798
function agcAotUnit1436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:563
//P25LEM1		TC	PHASCHNG
// slot 22798
    if slot <> 22798 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1436] to agcAotUnit1436@.

agcAotInstallSourceRope(list(
// P20-P25.agc:564
//		OCT	04022
// slot 22799
    22799, 4132
)).

// bank 24, slots 22800-22810
function agcAotUnit1437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22804 {
        if slot <= 22801 {
            if slot <= 22800 {
// P20-P25.agc:565
//		CAF	P25FLBIT
// slot 22800
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
// P20-P25.agc:566
//		MASK	STATE		# IS P25FLAG SET
// slot 22801
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
// P20-P25.agc:567
//		EXTEND
// slot 22802
                if slot <> 22802 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22803 {
// P20-P25.agc:568
//		BZF	ENDOFJOB
// slot 22803
                    if slot <> 22803 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:569
//		CAF	TRACKBIT	# IS TRACKFLAG SET?
// slot 22804
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
// P20-P25.agc:570
//		MASK	STATE +1
// slot 22805
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
// P20-P25.agc:571
//		EXTEND
// slot 22806
                    if slot <> 22806 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:572
//# Page 503
// P20-P25.agc:573
//		BZF	P25LMWT1	# NO -- SKIP PHASE CHANGE AND WAIT 1 MINUTE
// slot 22807
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
// P20-P25.agc:574
//		CAF	SEVEN		# CALL R65 -- FINE PREFERRED
// slot 22808
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
// P20-P25.agc:575
//		TS	R65CNTR
// slot 22809
                    if slot <> 22809 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:576
//		TC	BANKCALL	# TRACKING ATTITUDE ROUTINE
// slot 22810
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
// P20-P25.agc:577
//		CADR	R65LEM
// slot 22811
    22811, 39078
)).

// bank 24, slots 22812-22813
function agcAotUnit1438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22812 {
// P20-P25.agc:578
//		TC	P25LEM1		# THEN GO CHECK FLAGS
// slot 22812
        if slot <> 22812 or instruction <> 1294 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1294, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:579
//P25LEMWT	TC	PHASCHNG
// slot 22813
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
// P20-P25.agc:580
//		OCT	00112
// slot 22814
    22814, 148
)).

// bank 24, slots 22815-22816
function agcAotUnit1439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22815 {
// P20-P25.agc:581
//P25LMWT1	CAF	60SCNDS
// slot 22815
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
// P20-P25.agc:582
//		TC	TWIDDLE		# WAIT ONE MINUTE THEN CHECK AGAIN
// slot 22816
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
// P20-P25.agc:583
//		ADRES	P25LEM2
// slot 22817
    22817, 2630
)).

// bank 24, slots 22818-22820
function agcAotUnit1440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22818 {
// P20-P25.agc:584
//		TC	ENDOFJOB
// slot 22818
        if slot <> 22818 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22819 {
// P20-P25.agc:585
//P25LEM2		CAF	PRIO14
// slot 22819
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
// P20-P25.agc:586
//		TC	FINDVAC
// slot 22820
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
// P20-P25.agc:587
//		EBANK=	LOSCOUNT
// P20-P25.agc:588
//		2CADR	P25LEM1
// slot 22821 22822
    22821, 2588, 22822, 41070
)).

// bank 24, slots 22823-22823
function agcAotUnit1441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:589
//
// P20-P25.agc:590
//		TC	TASKOVER
// slot 22823
    if slot <> 22823 or instruction <> 2737 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2737, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1441] to agcAotUnit1441@.

agcAotInstallSourceRope(list(
// P20-P25.agc:591
//60SCNDS		DEC	6000
// slot 22824
    22824, 12000
)).

// bank 24, slots 22825-22825
function agcAotUnit1442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:592
//
// P20-P25.agc:593
//# Page 504
// P20-P25.agc:594
//# DATA READ ROUTINE 22 (LEM)
// P20-P25.agc:595
//# PROGRAM DESCRIPTION
// P20-P25.agc:596
//#
// P20-P25.agc:597
//#	MOD NO -- 2
// P20-P25.agc:598
//#	BY P. VOLANTE
// P20-P25.agc:599
//#
// P20-P25.agc:600
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:601
//#
// P20-P25.agc:602
//#	TO PROCESS AUTOMATIC RR MARK DATA TO UPDATE THE STATE VECTOR OF EITHER
// P20-P25.agc:603
//# 	LM OR CSM AS DEFINED IN THE RENDEZVOUS NAVIGATION PROGRAM (P20)
// P20-P25.agc:604
//#
// P20-P25.agc:605
//# CALLING SEQUENCE --
// P20-P25.agc:606
//#
// P20-P25.agc:607
//#	TC	BANKCALL
// P20-P25.agc:608
//#	CADR	R22LEM
// P20-P25.agc:609
//#
// P20-P25.agc:610
//# SUBROUTINES CALLED --
// P20-P25.agc:611
//#
// P20-P25.agc:612
//#	LSR22.1		GOFLASH		WAITLIST
// P20-P25.agc:613
//#	LSR22.2		PRIOLARM	BANKCALL
// P20-P25.agc:614
//#	LSR22.3		R61LEM
// P20-P25.agc:615
//#
// P20-P25.agc:616
//# NORMAL EXIT MODES --
// P20-P25.agc:617
//#
// P20-P25.agc:618
//#	R22 WILL CONTINUE TO RECYCLE, UPDATING STATE VECTORS WITH RADAR DATA
// P20-P25.agc:619
//#	UNTIL P20 CEASES TO OPERATE (RENDEZVOUS FLAG SET TO ZERO) AT WHICH TIME
// P20-P25.agc:620
//#	R22 WILL TERMINATE SELF.
// P20-P25.agc:621
//#
// P20-P25.agc:622
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:623
//#
// P20-P25.agc:624
//#	PRIORITY ALARM
// P20-P25.agc:625
//#	PRIORITY ALARM 525 LOS NOT WITHIN 3 DEGREE LIMIT
// P20-P25.agc:626
//#
// P20-P25.agc:627
//# OUTPUT
// P20-P25.agc:628
//#
// P20-P25.agc:629
//#	SEE OUTPUT FROM LSR22.3
// P20-P25.agc:630
//#
// P20-P25.agc:631
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:632
//#
// P20-P25.agc:633
//#	SEE LSR22.1, LSR22.2, LSR22.3
// P20-P25.agc:634
//#
// P20-P25.agc:635
//# FLAGS SET + RESET
// P20-P25.agc:636
//#
// P20-P25.agc:637
//#	NOANGFLG
// P20-P25.agc:638
//#
// P20-P25.agc:639
//# DEBRIS
// P20-P25.agc:640
//#
// P20-P25.agc:641
//#	SEE LSR22.1, LSR22.2, LSR22.3
// P20-P25.agc:642
//
// P20-P25.agc:643
//		EBANK=	LRS22.1X
// P20-P25.agc:644
//		COUNT*	$$/R22
// P20-P25.agc:645
//R22LEM		TC	PHASCHNG
// slot 22825
    if slot <> 22825 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1442] to agcAotUnit1442@.

agcAotInstallSourceRope(list(
// P20-P25.agc:646
//		OCT	04022
// slot 22826
    22826, 4132
)).

// bank 24, slots 22827-22850
function agcAotUnit1443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22838 {
        if slot <= 22832 {
            if slot <= 22829 {
                if slot <= 22827 {
// P20-P25.agc:647
//		CAF	RNDVZBIT	# IS RENDEZVOUS FLAG SET?
// slot 22827
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
// P20-P25.agc:648
//		MASK	STATE
// slot 22828
                        if slot <> 22828 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:649
//		EXTEND
// slot 22829
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
// P20-P25.agc:650
//		BZF	ENDOFJOB	# NO -- EXIT R22 AND P20
// slot 22830
                    if slot <> 22830 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22831 {
// P20-P25.agc:651
//		CAF	TRACKBIT	# IS TRACKFLAG SET?
// slot 22831
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
// P20-P25.agc:652
//		MASK	STATE +1
// slot 22832
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
// P20-P25.agc:653
//		EXTEND
// slot 22833
                    if slot <> 22833 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22834 {
// P20-P25.agc:654
//		BZF	R22WAIT		# NO WAIT
// slot 22834
                        if slot <> 22834 or instruction <> 5534 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5534, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:655
//R22LEM12	CAF	BIT14		# IS RR AUTO TRACK ENABLE DISCRETE STILL
// slot 22835
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
// P20-P25.agc:656
//		EXTEND			# ON (A MONITOR REPOSITION BY R25 CLEARS IT)
// slot 22836
                    if slot <> 22836 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22837 {
// P20-P25.agc:657
//		RAND	CHAN12
// slot 22837
                        if slot <> 22837 or instruction <> 1034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:658
//		EXTEND
// slot 22838
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
// P20-P25.agc:659
//		BZF	P20LEMA		# NO -- RETURN TO P20
// slot 22839
                    if slot <> 22839 or instruction <> 5193 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5193, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22840 {
// P20-P25.agc:660
//		CAF	BIT2		# YES
// slot 22840
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
// P20-P25.agc:661
//		EXTEND			# IS RR AUTO MODE DISCRETE PRESENT
// slot 22841
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
// P20-P25.agc:662
//		RAND	CHAN33
// slot 22842
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
// P20-P25.agc:663
//# Page 505
// P20-P25.agc:664
//		EXTEND
// slot 22843
                        if slot <> 22843 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:665
//		BZF	+2		# YES CONTINUE
// slot 22844
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
// P20-P25.agc:666
//		TC	P20LEMB5	# NO -- SET IT
// slot 22845
                    if slot <> 22845 or instruction <> 1117 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1117, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22846 {
// P20-P25.agc:667
//		CS	RADMODES	# ARE RR CDUS BEING ZEROED
// slot 22846
                        if slot <> 22846 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:668
//		MASK	RCDU0BIT
// slot 22847
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
// P20-P25.agc:669
//		EXTEND
// slot 22848
                    if slot <> 22848 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22849 {
// P20-P25.agc:670
//		BZF	R22LEM42	# CDUS BEING ZEROED
// slot 22849
                        if slot <> 22849 or instruction <> 5527 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5527, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:671
//		TC	PHASCHNG	# IF A RESTART OCCURS, AND EXTRA RADAR
// slot 22850
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
// P20-P25.agc:672
//		OCT	00152		# READING IS TAKEN, SO BAD DATA ISN'T USED
// slot 22851
    22851, 212
)).

// bank 24, slots 22852-22852
function agcAotUnit1444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:673
//		TC	BANKCALL	# YES READ DATA + CALCULATE LOS
// slot 22852
    if slot <> 22852 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1444] to agcAotUnit1444@.

agcAotInstallSourceRope(list(
// P20-P25.agc:674
//		CADR	LRS22.1		# DATA READ SUBROUTINE
// slot 22853
    22853, 53740
)).

// bank 24, slots 22854-22854
function agcAotUnit1445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:675
//		INDEX	MPAC
// slot 22854
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
// P20-P25.agc:676
//		TC	+1
// slot 22855
    22855, 2704
)).

// bank 24, slots 22856-22859
function agcAotUnit1446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22857 {
        if slot <= 22856 {
// P20-P25.agc:677
//		TC	R22LEM2		# NORMAL RETURN (GOOD DATA)
// slot 22856
            if slot <> 22856 or instruction <> 1369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:678
//		TC	P20LEMC		# COULD NOT READ RADAR -- TRY TO REDESIGNATE
// slot 22857
            if slot <> 22857 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22858 {
// P20-P25.agc:679
//		CAF	ALRM525		# RR LOS NOT WITHIN 3 DEGREES (ALARM)
// slot 22858
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
// P20-P25.agc:680
//		TC	BANKCALL
// slot 22859
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
// P20-P25.agc:681
//		CADR	PRIOLARM
// slot 22860
    22860, 18148
)).

// bank 24, slots 22861-22865
function agcAotUnit1447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22862 {
        if slot <= 22861 {
// P20-P25.agc:682
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// slot 22861
            if slot <> 22861 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:683
//		TC	R22LEM1		# PROC (DISPLAY DELTA THETA)
// slot 22862
            if slot <> 22862 or instruction <> 1361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1361, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22863 {
// P20-P25.agc:684
//		TC	-5		# ENTER (ILLEGAL OPTION)
// slot 22863
            if slot <> 22863 or instruction <> 1354 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1354, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22864 {
// P20-P25.agc:685
//		TC	ENDOFJOB
// slot 22864
                if slot <> 22864 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:686
//
// P20-P25.agc:687
//R22LEM1		TC	PHASCHNG
// slot 22865
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
// P20-P25.agc:688
//		OCT	04022
// slot 22866
    22866, 4132
)).

// bank 24, slots 22867-22868
function agcAotUnit1448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22867 {
// P20-P25.agc:689
//		CAF	V06N05		# DISPLAY DELTA THETA
// slot 22867
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
// P20-P25.agc:690
//		TC	BANKCALL
// slot 22868
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
// P20-P25.agc:691
//		CADR	PRIODSP
// slot 22869
    22869, 17038
)).

// bank 24, slots 22870-22873
function agcAotUnit1449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22871 {
        if slot <= 22870 {
// P20-P25.agc:692
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// slot 22870
            if slot <> 22870 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:693
//		TC	R22LEM2		# PROC (OK CONTINUE)
// slot 22871
            if slot <> 22871 or instruction <> 1369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22872 {
// P20-P25.agc:694
//		TC	P20LEMC		# ENTER (RECYCLE)
// slot 22872
            if slot <> 22872 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:695
//R22LEM2		TC	PHASCHNG
// slot 22873
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
// P20-P25.agc:696
//		OCT	04022
// slot 22874
    22874, 4132
)).

// bank 24, slots 22875-22881
function agcAotUnit1450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22877 {
        if slot <= 22875 {
// P20-P25.agc:697
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE (P22FLAG SET)
// slot 22875
            if slot <> 22875 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22876 {
// P20-P25.agc:698
//		TC	R22LEM3		# YES -- BYPASS FLAG CHECKS AND LRS22.2
// slot 22876
                if slot <> 22876 or instruction <> 1385 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1385, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:699
//		CA	FLAGWRD1	# IS TRACK FLAG SET
// slot 22877
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
// P20-P25.agc:700
//		MASK	TRACKBIT
// slot 22878
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
// P20-P25.agc:701
//		EXTEND
// slot 22879
                if slot <> 22879 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22880 {
// P20-P25.agc:702
//		BZF	R22WAIT		# NO -- WAIT
// slot 22880
                if slot <> 22880 or instruction <> 5534 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:703
//		TC	BANKCALL	# YES
// slot 22881
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
// P20-P25.agc:704
//		CADR	LRS22.2		# CHECKS RR BORESIGHT WITHIN 30 DEG OF +Z
// slot 22882
    22882, 42422
)).

// bank 24, slots 22883-22883
function agcAotUnit1451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:705
//		INDEX	MPAC
// slot 22883
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
// P20-P25.agc:706
//		TC	+1
// slot 22884
    22884, 2762
)).

// bank 24, slots 22885-22886
function agcAotUnit1452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22885 {
// P20-P25.agc:707
//		TC	R22LEM3		# NORMAL RETURN (LOS WITHIN 30 OF Z-AXIS)
// slot 22885
        if slot <> 22885 or instruction <> 1385 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1385, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:708
//		TC	BANKCALL
// slot 22886
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
// P20-P25.agc:709
//		CADR	R61LEM
// slot 22887
    22887, 39068
)).

// bank 24, slots 22888-22899
function agcAotUnit1453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22893 {
        if slot <= 22890 {
            if slot <= 22888 {
// P20-P25.agc:710
//		TC	R22WAIT		# NOT WITHIN 30 DEG OF Z-AXIS
// slot 22888
                if slot <> 22888 or instruction <> 1438 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1438, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22889 {
// P20-P25.agc:711
//R22LEM3		CS	FLAGWRD1	# SHOULD WE BYPASS STATE VECTOR UPDATE
// slot 22889
                    if slot <> 22889 or instruction <> 16445 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 61).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:712
//		MASK	NOUPFBIT	# (IS NO UPDATE FLAG SET?)
// slot 22890
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
// P20-P25.agc:713
//# Page 506
// P20-P25.agc:714
//		EXTEND
// slot 22891
                if slot <> 22891 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22892 {
// P20-P25.agc:715
//		BZF	R22LEM42	# BRANCH -- YES
// slot 22892
                    if slot <> 22892 or instruction <> 5527 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:716
//		CA	FLAGWRD1	# IS UPDATE FLAG SET
// slot 22893
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
// P20-P25.agc:717
//		MASK	UPDATBIT
// slot 22894
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
// P20-P25.agc:718
//		EXTEND
// slot 22895
                    if slot <> 22895 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:719
//		BZF	R22LEM42	# UPDATE FLAG NOT SET
// slot 22896
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
// P20-P25.agc:720
//		CAF	PRIO26		# INSURE HIGH PRIO IN RESTART
// slot 22897
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
// P20-P25.agc:721
//		TS	PHSPRDT2
// slot 22898
                    if slot <> 22898 or instruction <> 23086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:722
//
// P20-P25.agc:723
//		TC	INTPRET
// slot 22899
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
// P20-P25.agc:724
//		GOTO
// slot 22900
    22900, 65360,
// P20-P25.agc:725
//			LSR22.3
// slot 22901
    22901, 45588,
// P20-P25.agc:726
//R22LEM93	EXIT			# NORMAL EXIT FROM LSR22.3
// slot 22902
    22902, 65532
)).

// bank 24, slots 22903-22903
function agcAotUnit1454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:727
//		TC	PHASCHNG	# PHASE CHANGE TO PROTECT AGAINST
// slot 22903
    if slot <> 22903 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1454] to agcAotUnit1454@.

agcAotInstallSourceRope(list(
// P20-P25.agc:728
//		OCT	04022		# CONFLICT WITH GRP2PC ERASEABLE
// slot 22904
    22904, 4132
)).

// bank 24, slots 22905-22905
function agcAotUnit1455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:729
//		TCF	R22LEM44
// slot 22905
    if slot <> 22905 or instruction <> 5522 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5522, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1455] to agcAotUnit1455@.

agcAotInstallSourceRope(list(
// P20-P25.agc:730
//R22LEM96	EXIT
// slot 22906
    22906, 65532
)).

// bank 24, slots 22907-22909
function agcAotUnit1456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22907 {
// P20-P25.agc:731
//		CAF	ZERO		# SET N49FLAG = ZERO TO INDICATE
// slot 22907
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
// P20-P25.agc:732
//		TS	N49FLAG		# V06 N49 DISPLAY HASN'T BEEN ANSWERED
// slot 22908
            if slot <> 22908 or instruction <> 23526 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23526, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:733
//		TC	PHASCHNG
// slot 22909
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
// P20-P25.agc:734
//		OCT	04022		# TO PROTECT DISPLAY
// slot 22910
    22910, 4132
)).

// bank 24, slots 22911-22912
function agcAotUnit1457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22911 {
// P20-P25.agc:735
//		CAF	PRIO27		# PROTECT DISPLAY
// slot 22911
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
// P20-P25.agc:736
//		TC	NOVAC
// slot 22912
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
// P20-P25.agc:737
//		EBANK=	N49FLAG
// P20-P25.agc:738
//		2CADR	N49DSP
// slot 22913 22914
    22913, 2888, 22914, 41070
)).

// bank 24, slots 22915-22915
function agcAotUnit1458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:739
//
// P20-P25.agc:740
//		TC	INTPRET
// slot 22915
    if slot <> 22915 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1458] to agcAotUnit1458@.

agcAotInstallSourceRope(list(
// P20-P25.agc:741
//		SLOAD
// slot 22916
    22916, 65466,
// P20-P25.agc:742
//			N49FLAG
// slot 22917
    22917, 4046,
// P20-P25.agc:743
//		BZE	BMN		# LOOP TO CHECK IF FLAG
// slot 22918
    22918, 41048,
// P20-P25.agc:744
//			-3		# SETTING CHANGED -- BRANCH -- NO
// slot 22919
    22919, 41736,
// P20-P25.agc:745
//			R22LEM7		# PROCEED
// slot 22920
    22920, 41756,
// P20-P25.agc:746
//		EXIT			# DISPLAY ANSERED BY RECYCLE
// slot 22921
    22921, 65532
)).

// bank 24, slots 22922-22925
function agcAotUnit1459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22923 {
        if slot <= 22922 {
// P20-P25.agc:747
//		TC	LUNSFCHK	# ARE WE ON LUNAR SURFACE
// slot 22922
            if slot <> 22922 or instruction <> 1463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1463, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:748
//		TC	R22WAIT		# YES -- 15 SECOND DELAY
// slot 22923
            if slot <> 22923 or instruction <> 1438 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1438, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22924 {
// P20-P25.agc:749
//		CA	ZERO		# NO -- SET R65COUNTER = 0, DO FINE
// slot 22924
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
// P20-P25.agc:750
//		TC	R22LEM45	# TRACKING TAKE ANOTHER RADAR READING
// slot 22925
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
// P20-P25.agc:751
//R22LEM7		CALL			# PROCEED
// slot 22926
    22926, 65320,
// P20-P25.agc:752
//			GRP2PC		# PHASE CHANGE AND
// slot 22927
    22927, 9544,
// P20-P25.agc:753
//		GOTO			# GO TO INCOPORATE DATA.
// slot 22928
    22928, 65360,
// P20-P25.agc:754
//			ASTOK
// slot 22929
    22929, 46642
)).

// bank 24, slots 22930-22939
function agcAotUnit1460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22934 {
        if slot <= 22931 {
            if slot <= 22930 {
// P20-P25.agc:755
//R22LEM44	INCR	MARKCTR		# INCREMENT COUNT OF MARKS INCORPORATED.
// slot 22930
                if slot <> 22930 or instruction <> 11058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 818).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:756
//		TC	LUNSFCHK	# ARE WE ON LUNAR SURFACE
// slot 22931
                if slot <> 22931 or instruction <> 1463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22932 {
// P20-P25.agc:757
//		TC	R22LEM46	# YES -- WAIT 2 SECONDS
// slot 22932
                if slot <> 22932 or instruction <> 1440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 22933 {
// P20-P25.agc:758
//		CA	FIVE		# NOT ON LUNAR SURFACE
// slot 22933
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
// P20-P25.agc:759
//		TC	R22LEM45	# R65COUNTER = 5
// slot 22934
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
// P20-P25.agc:760
//R22LEM42	TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE (P22FLAG SET)
// slot 22935
                if slot <> 22935 or instruction <> 1463 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1463, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:761
//		TC	R22LEM46	# YES -- WAIT 2 SECONDS
// slot 22936
                if slot <> 22936 or instruction <> 1440 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1440, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22937 {
// P20-P25.agc:762
//		CA	TWO		# NO -- SET R65COUNTER = 2
// slot 22937
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
// P20-P25.agc:763
//R22LEM45	TS	R65CNTR
// slot 22938
                    if slot <> 22938 or instruction <> 23525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23525, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:764
//# Page 507
// P20-P25.agc:765
//		TC	BANKCALL
// slot 22939
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
// P20-P25.agc:766
//		CADR	R65LEM		# FINE PREFERRED TRACKING ATTITUDE
// slot 22940
    22940, 39078
)).

// bank 24, slots 22941-22943
function agcAotUnit1461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22941 {
// P20-P25.agc:767
//		TC	R22LEM
// slot 22941
        if slot <> 22941 or instruction <> 1321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1321, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22942 {
// P20-P25.agc:768
//R22WAIT		CAF	1500DEC
// slot 22942
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
// P20-P25.agc:769
//		TC	P20LEMWT +1
// slot 22943
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

// bank 24, slots 22944-22945
function agcAotUnit1462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22944 {
// P20-P25.agc:770
//
// P20-P25.agc:771
//R22LEM46	CAF	2SECS
// slot 22944
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
// P20-P25.agc:772
//		TC	BANKCALL	# WAIT 2 SECONDS AND TAKE ANOTHER MARK
// slot 22945
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
// P20-P25.agc:773
//		CADR	DELAYJOB
// slot 22946
    22946, 1978
)).

// bank 24, slots 22947-22949
function agcAotUnit1463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22947 {
// P20-P25.agc:774
//		TC	R22LEM
// slot 22947
        if slot <> 22947 or instruction <> 1321 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1321, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 22948 {
// P20-P25.agc:775
//
// P20-P25.agc:776
//N49DSP		CAF	V06N49NB
// slot 22948
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
// P20-P25.agc:777
//		TC	BANKCALL	# EXCESSIVE STATE VECTOR UPDATE -- FLASH
// slot 22949
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
// P20-P25.agc:778
//		CADR	PRIODSP		# VERB 06 NOUN 49 R1=DELTA R, R2=DELTA V
// slot 22950
    22950, 17038
)).

// bank 24, slots 22951-22955
function agcAotUnit1464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22952 {
        if slot <= 22951 {
// P20-P25.agc:779
//		TC	GOTOV56		# TERMINATE -- EXIT R22 AND P20
// slot 22951
            if slot <> 22951 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:780
//		CS	ONE		# PROCEED -- N49FLAG = -1
// slot 22952
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
// P20-P25.agc:781
//		TS	N49FLAG		# RECYCLE -- N49FLAG = + VALUE
// slot 22953
            if slot <> 22953 or instruction <> 23526 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23526, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22954 {
// P20-P25.agc:782
//		TC	ENDOFJOB
// slot 22954
                if slot <> 22954 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:783
//R22RSTRT	TC	PHASCHNG	# IF A RESTART OCCURS WHILE READING RADAR
// slot 22955
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
// P20-P25.agc:784
//		OCT	00152		# COME HERE TO TAKE A RANGE-RATE READING
// slot 22956
    22956, 212
)).

// bank 24, slots 22957-22957
function agcAotUnit1465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:785
//		TC	BANKCALL	# WHICH ISN'T USED TO PREVENT TAKING A BAD
// slot 22957
    if slot <> 22957 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1465] to agcAotUnit1465@.

agcAotInstallSourceRope(list(
// P20-P25.agc:786
//		CADR	RRRDOT		# READING AND TRYING TO INCORPORATE THE
// slot 22958
    22958, 44166
)).

// bank 24, slots 22959-22959
function agcAotUnit1466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:787
//		TC	BANKCALL	# BAD DATA
// slot 22959
    if slot <> 22959 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1466] to agcAotUnit1466@.

agcAotInstallSourceRope(list(
// P20-P25.agc:788
//		CADR	RADSTALL	# WAIT FOR READ COMPLETE
// slot 22960
    22960, 16280
)).

// bank 24, slots 22961-22962
function agcAotUnit1467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22961 {
// P20-P25.agc:789
//		TC	P20LEMC		# COULD NOT READ RADAR -- TRY TO REDISGNATE
// slot 22961
        if slot <> 22961 or instruction <> 1167 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1167, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:790
//		TC	R22LEM		# READ SUCCESSFUL -- CONTINUE AT R22
// slot 22962
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
// P20-P25.agc:791
//
// P20-P25.agc:792
//ALRM525		OCT	00525
// slot 22963
    22963, 682,
// P20-P25.agc:793
//V06N05		VN	00605
// slot 22964
    22964, 1546,
// P20-P25.agc:794
//V06N49NB	VN	00649
// slot 22965
    22965, 1634,
// P20-P25.agc:795
//1500DEC		DEC	1500
// slot 22966
    22966, 3000
)).

// bank 24, slots 22967-22989
function agcAotUnit1468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22977 {
        if slot <= 22971 {
            if slot <= 22968 {
                if slot <= 22967 {
// P20-P25.agc:796
//
// P20-P25.agc:797
//# LUNSFCHECK -- CLOSED SUBROUTINE TO CHECK IF ON LUNAR SURFACE (P22FLAG)
// P20-P25.agc:798
//#	RETURNS TO CALLER +1 IF P22FLAG SET
// P20-P25.agc:799
//#		TO CALLER +2 IF P22FLAG NOT SET
// P20-P25.agc:800
//
// P20-P25.agc:801
//		COUNT* 	$$/P22
// P20-P25.agc:802
//LUNSFCHK	CS	FLAGWRD8	# CHECK IF ON LUNAR SURFACE
// slot 22967
                    if slot <> 22967 or instruction <> 16452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 68).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:803
//		MASK	SURFFBIT	# IS SURFFLAG SET?
// slot 22968
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
// P20-P25.agc:804
//		CCS	A		# BRANCH -- P22FLAG SET
// slot 22969
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
// P20-P25.agc:805
//		INCR	Q		# NOT SET
// slot 22970
                        if slot <> 22970 or instruction <> 10242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:806
//		TC	Q		# RETURN
// slot 22971
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
// P20-P25.agc:807
//
// P20-P25.agc:808
//# Page 508
// P20-P25.agc:809
//# RR DESIGNATE ROUTINE (R21LEM)
// P20-P25.agc:810
//# PROGRAM DESCRIPTION
// P20-P25.agc:811
//#
// P20-P25.agc:812
//# 	MOD NO -- 2
// P20-P25.agc:813
//#	BY P. VOLANTE
// P20-P25.agc:814
//#
// P20-P25.agc:815
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:816
//#
// P20-P25.agc:817
//# 	TO POINT THE RENDEZVOUS RADAR AT THE CSM UNTIL AUTOMATIC ACQUISITION
// P20-P25.agc:818
//# 	OF THE CSM IS ACCOMPLISHED BY THE RADAR.  ROUTINE IS CALLED BY P20.
// P20-P25.agc:819
//#
// P20-P25.agc:820
//# CALLING SEQUENCE --
// P20-P25.agc:821
//#
// P20-P25.agc:822
//#	TC	BANKCALL
// P20-P25.agc:823
//#	CADR	R21LEM
// P20-P25.agc:824
//#
// P20-P25.agc:825
//# SUBROUTINES CALLED --
// P20-P25.agc:826
//#
// P20-P25.agc:827
//#	FINDVAC		FLAGUP		ENDOFJOB	PRIOLARM
// P20-P25.agc:828
//#	NOVAC		INTPRET		LPS20.1		PHASCHNG
// P20-P25.agc:829
//#	WAITLIST	JOBSLEEP	JOBWAKE		FLAGDOWN
// P20-P25.agc:830
//#	TASKOVER	BANKCALL	RADSTALL	RRDESSM
// P20-P25.agc:831
//#
// P20-P25.agc:832
//# NORMAL EXIT MODES
// P20-P25.agc:833
//#
// P20-P25.agc:834
//#	WHEN LOCK-ON IS ACHIEVED, BRANCH WILL BE TO P20 WHERE R22 (DATA READ
// P20-P25.agc:835
//#	WILL BE SELECTED OR A NEED FOR A MANEUVER (BRANCH TO P20LEMA)
// P20-P25.agc:836
//#
// P20-P25.agc:837
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:838
//#
// P20-P25.agc:839
//#	PRIORITY ALARM 503 WHEN LOCK-ON HASN'T BEEN ACHIEVED AFTER 30SECS --
// P20-P25.agc:840
//#	THIS REQUIRES ASTRONAUT INTERFACE: SELECTION OF SEARCH OPTION OF
// P20-P25.agc:841
//#	ACQUISITION
// P20-P25.agc:842
//#
// P20-P25.agc:843
//# OUTPUT
// P20-P25.agc:844
//#
// P20-P25.agc:845
//#	SEE LPS20.1, RRDESSM
// P20-P25.agc:846
//#
// P20-P25.agc:847
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:848
//#
// P20-P25.agc:849
//#	RRTARGET, RADMODES ARE USED BY LPS20.1 AND RRDESSM
// P20-P25.agc:850
//#
// P20-P25.agc:851
//# FLAGS SET + RESET
// P20-P25.agc:852
//#
// P20-P25.agc:853
//#	LOSCMFLG	LOKONSW
// P20-P25.agc:854
//#
// P20-P25.agc:855
//# DEBRIS
// P20-P25.agc:856
//#
// P20-P25.agc:857
//#	SEE LPS20.1, RRSESSM
// P20-P25.agc:858
//
// P20-P25.agc:859
//		EBANK=	LOSCOUNT
// P20-P25.agc:860
//		COUNT*	$$/R21
// P20-P25.agc:861
//R21LEM		CS	BIT14		# REMOVE RR SELF TRACK ENABLE
// slot 22972
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
// P20-P25.agc:862
//		EXTEND
// slot 22973
                        if slot <> 22973 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:863
//		WAND	CHAN12
// slot 22974
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
// P20-P25.agc:864
//		TC	LUNSFCHK
// slot 22975
                    if slot <> 22975 or instruction <> 1463 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1463, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22976 {
// P20-P25.agc:865
//		TC	R21LEM5
// slot 22976
                        if slot <> 22976 or instruction <> 1477 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1477, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:866
//		CAF	ZERO		# COMMAND ANTENNA TO MODE CENTER
// slot 22977
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
// P20-P25.agc:867
//		TS	TANG		# IF NOT ON SURFACE -- MODE 1 -- (T=0,S=0)
// slot 22978
                    if slot <> 22978 or instruction <> 23111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22979 {
// P20-P25.agc:868
//		TS	TANG +1
// slot 22979
                        if slot <> 22979 or instruction <> 23112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23112, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:869
//		TC	R21LEM6
// slot 22980
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
// P20-P25.agc:870
//R21LEM5		CAF	BIT12
// slot 22981
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
// P20-P25.agc:871
//		MASK	RADMODES
// slot 22982
                        if slot <> 22982 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:872
//		CCS	A
// slot 22983
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
// P20-P25.agc:873
//		TC	R21LEM10
// slot 22984
                    if slot <> 22984 or instruction <> 1493 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1493, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22985 {
// P20-P25.agc:874
//		CAF	BIT15
// slot 22985
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
// P20-P25.agc:875
//		TS	TANG
// slot 22986
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
// P20-P25.agc:876
//		CS	HALF
// slot 22987
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
// P20-P25.agc:877
//		TS	TANG +1
// slot 22988
                        if slot <> 22988 or instruction <> 23112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23112, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:878
//
// P20-P25.agc:879
//# Page 509
// P20-P25.agc:880
//R21LEM6		TC	DOWNFLAG
// slot 22989
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
// P20-P25.agc:881
//		ADRES	LOKONSW
// slot 22990
    22990, 20
)).

// bank 24, slots 22991-22991
function agcAotUnit1469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:882
//		TC	BANKCALL
// slot 22991
    if slot <> 22991 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1469] to agcAotUnit1469@.

agcAotInstallSourceRope(list(
// P20-P25.agc:883
//		CADR	RRDESNB
// slot 22992
    22992, 43642
)).

// bank 24, slots 22993-22994
function agcAotUnit1470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22993 {
// P20-P25.agc:884
//		TC	+1
// slot 22993
        if slot <> 22993 or instruction <> 1490 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1490, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:885
//		TC	BANKCALL
// slot 22994
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
// P20-P25.agc:886
//		CADR	RADSTALL
// slot 22995
    22995, 16280
)).

// bank 24, slots 22996-22997
function agcAotUnit1471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22996 {
// P20-P25.agc:887
//		TC	R21-503		# BAD RETURN FROM DESIGNATE -- ISSUE ALARM
// slot 22996
        if slot <> 22996 or instruction <> 1520 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1520, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:888
//R21LEM10	TC	UPFLAG
// slot 22997
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
// P20-P25.agc:889
//		ADRES	LOSCMFLG	# EVERY FOURTH PASS THRU DODES
// slot 22998
    22998, 66
)).

// bank 24, slots 22999-23003
function agcAotUnit1472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23000 {
        if slot <= 22999 {
// P20-P25.agc:890
//		CAF	MAXTRIES	# ALLOW 60 PASSES (APPROX 45 SECONDS)
// slot 22999
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
// P20-P25.agc:891
//		TS	DESCOUNT	# TO DESIGNATE AND LOCK ON
// slot 23000
            if slot <> 23000 or instruction <> 23116 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23116, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23001 {
// P20-P25.agc:892
//R21LEM2		CAF	THREE
// slot 23001
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
// P20-P25.agc:893
//		TS	LOSCOUNT
// slot 23002
                if slot <> 23002 or instruction <> 23342 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23342, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:894
//R21LEM1		TC	INTPRET
// slot 23003
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
// P20-P25.agc:895
//		RTB	DAD
// slot 23004
    23004, 36152,
// P20-P25.agc:896
//			LOADTIME
// slot 23005
    23005, 18166,
// P20-P25.agc:897
//			HALFSEC		# EXTRAPOLATE TO PRESENT TIME + .5 SEC.
// slot 23006
    23006, 9376,
// P20-P25.agc:898
//		STCALL	TDEC1		# LOS DETERMINATION ROUTINE
// slot 23007
    23007, 28738,
// P20-P25.agc:899
//			LPS20.1
// slot 23008
    23008, 42330,
// P20-P25.agc:900
//		EXIT
// slot 23009
    23009, 65532
)).

// bank 24, slots 23010-23010
function agcAotUnit1473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:901
//R21LEM3		TC	UPFLAG		# SET LOKONSW TO RADAR -- ON DESIRED
// slot 23010
    if slot <> 23010 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1473] to agcAotUnit1473@.

agcAotInstallSourceRope(list(
// P20-P25.agc:902
//		ADRES	LOKONSW
// slot 23011
    23011, 20
)).

// bank 24, slots 23012-23012
function agcAotUnit1474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:903
//		TC	DOWNFLAG
// slot 23012
    if slot <> 23012 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1474] to agcAotUnit1474@.

agcAotInstallSourceRope(list(
// P20-P25.agc:904
//		ADRES	NORRMON
// slot 23013
    23013, 172
)).

// bank 24, slots 23014-23014
function agcAotUnit1475 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:905
//		TC	INTPRET
// slot 23014
    if slot <> 23014 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1475] to agcAotUnit1475@.

agcAotInstallSourceRope(list(
// P20-P25.agc:906
//		CALL			# INPUT (RRTARGET UPDATED BY LPS20.1)
// slot 23015
    23015, 65320,
// P20-P25.agc:907
//			RRDESSM		# DESIGNATE ROUTINE
// slot 23016
    23016, 43510,
// P20-P25.agc:908
//		EXIT
// slot 23017
    23017, 65532
)).

// bank 24, slots 23018-23020
function agcAotUnit1476 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23018 {
// P20-P25.agc:909
//		TC	R21LEM4		# LOS NOT IN MODE 2 COVERAGE
// slot 23018
        if slot <> 23018 or instruction <> 1535 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1535, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23019 {
// P20-P25.agc:910
//					# ON LUNAR SURFACE
// P20-P25.agc:911
//		TC	P20LEMA		# VEHICLE MANEUVER REQUIRED.
// slot 23019
            if slot <> 23019 or instruction <> 1097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1097, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:912
//		TC	BANKCALL	# NO VEHICLE MANEUVER REQUIRED
// slot 23020
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
// P20-P25.agc:913
//		CADR	RADSTALL	# WAIT FOR DESIGNATE COMPLETE -- LOCKON OR
// slot 23021
    23021, 16280
)).

// bank 24, slots 23022-23025
function agcAotUnit1477 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23023 {
        if slot <= 23022 {
// P20-P25.agc:914
//		TC	+2		# BAD END -- LOCKON NOT ACHIEVED IN 60 TRIES
// slot 23022
            if slot <> 23022 or instruction <> 1520 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1520, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:915
//		TC	R21END		# EXIT ROUTINE RETURN TO P20 (LOCK-ON)
// slot 23023
            if slot <> 23023 or instruction <> 1527 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1527, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23024 {
// P20-P25.agc:916
//R21-503		CAF	ALRM503		# ISSUE ALARM 503
// slot 23024
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
// P20-P25.agc:917
//		TC	BANKCALL
// slot 23025
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
// P20-P25.agc:918
//		CADR	PRIOLARM
// slot 23026
    23026, 18148
)).

// bank 24, slots 23027-23031
function agcAotUnit1478 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23028 {
        if slot <= 23027 {
// P20-P25.agc:919
//		TC	GOTOV56		# TERMINATE EXITS P20 VIA V56 CODING
// slot 23027
            if slot <> 23027 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:920
//		TC	R21SRCH		# PROC
// slot 23028
            if slot <> 23028 or instruction <> 1530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23029 {
// P20-P25.agc:921
//		TC	P20LEMC3
// slot 23029
            if slot <> 23029 or instruction <> 1161 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1161, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23030 {
// P20-P25.agc:922
//		TC	ENDOFJOB
// slot 23030
                if slot <> 23030 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:923
//R21END		TC	DOWNFLAG
// slot 23031
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
// P20-P25.agc:924
//		ADRES	LOSCMFLG	# RESET LOSCMFLG
// slot 23032
    23032, 66
)).

// bank 24, slots 23033-23034
function agcAotUnit1479 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23033 {
// P20-P25.agc:925
//		TC	R21DISP		# PUT UP VERIFY MAIN LOBE LOCKON DISPLAY
// slot 23033
        if slot <> 23033 or instruction <> 1617 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1617, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:926
//R21SRCH		TC	PHASCHNG
// slot 23034
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
// P20-P25.agc:927
//		OCT	04022
// slot 23035
    23035, 4132
)).

// bank 24, slots 23036-23036
function agcAotUnit1480 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:928
//		TC	R24LEM		# SEARCH ROUTINE
// slot 23036
    if slot <> 23036 or instruction <> 1670 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1670, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1480] to agcAotUnit1480@.

agcAotInstallSourceRope(list(
// P20-P25.agc:929
//ALRM503		OCT	00503
// slot 23037
    23037, 646,
// P20-P25.agc:930
//# Page 510
// P20-P25.agc:931
//ALRM527		OCT	527
// slot 23038
    23038, 686
)).

// bank 24, slots 23039-23041
function agcAotUnit1481 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23039 {
// P20-P25.agc:932
//
// P20-P25.agc:933
//R21LEM4		CAF	MAXTRIES	# SET UP COUNTER FOR
// slot 23039
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
// P20-P25.agc:934
//		TS	REPOSCNT	# 60 PASSES (APPROX 600 SECS.)
// slot 23040
            if slot <> 23040 or instruction <> 23315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:935
//		TC	UPFLAG
// slot 23041
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
// P20-P25.agc:936
//		ADRES	FSPASFLG	# SET FIRST PASS FLAG
// slot 23042
    23042, 10
)).

// bank 24, slots 23043-23043
function agcAotUnit1482 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:937
//		TC	DOWNFLAG	# RESET LOS BEING
// slot 23043
    if slot <> 23043 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1482] to agcAotUnit1482@.

agcAotInstallSourceRope(list(
// P20-P25.agc:938
//		ADRES	LOSCMFLG	# COMPUTED FLAG
// slot 23044
    23044, 66
)).

// bank 24, slots 23045-23045
function agcAotUnit1483 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:939
//		TC	INTPRET
// slot 23045
    if slot <> 23045 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1483] to agcAotUnit1483@.

agcAotInstallSourceRope(list(
// P20-P25.agc:940
//R21LEM12	RTB
// slot 23046
    23046, 65336,
// P20-P25.agc:941
//			LOADTIME
// slot 23047
    23047, 18166,
// P20-P25.agc:942
//		DAD
// slot 23048
    23048, 65306,
// P20-P25.agc:943
//			TENSEC		# TIME T = T + 10 SECS.
// slot 23049
    23049, 9372,
// P20-P25.agc:944
//		STORE	REPOSTM		# SAVE FOR LONGCALL AND UPPSV
// slot 23050
    23050, 3626,
// P20-P25.agc:945
//		STCALL	TDEC1
// slot 23051
    23051, 28738,
// P20-P25.agc:946
//			LPS20.1		# COMPUTE LOS AT TIME T
// slot 23052
    23052, 42330,
// P20-P25.agc:947
//		CALL
// slot 23053
    23053, 65320,
// P20-P25.agc:948
//			RRDESSM
// slot 23054
    23054, 43510,
// P20-P25.agc:949
//		EXIT
// slot 23055
    23055, 65532
)).

// bank 24, slots 23056-23058
function agcAotUnit1484 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23056 {
// P20-P25.agc:950
//		TC	R21LEM13	# LOS NOT IN MODE 2 COVERAGE
// slot 23056
        if slot <> 23056 or instruction <> 1563 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1563, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23057 {
// P20-P25.agc:951
//		TC	ENDOFJOB	# VEHICLE MANEUVER REQUIRED
// slot 23057
            if slot <> 23057 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:952
//		TC	KILLTASK
// slot 23058
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
// P20-P25.agc:953
//		CADR	BEGDES
// slot 23059
    23059, 43766
)).

// bank 24, slots 23060-23060
function agcAotUnit1485 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:954
//		TC	INTPRET
// slot 23060
    if slot <> 23060 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1485] to agcAotUnit1485@.

agcAotInstallSourceRope(list(
// P20-P25.agc:955
//		BOF
// slot 23061
    23061, 65304,
// P20-P25.agc:956
//			FSPASFLG	# FIRST PASS THRU REPOSITION
// slot 23062
    23062, 458,
// P20-P25.agc:957
//			R21LEMB		# NO -- GO TO CONTINUOUS DESIGNATE
// slot 23063
    23063, 42054,
// P20-P25.agc:958
//		CLRGO
// slot 23064
    23064, 65304,
// P20-P25.agc:959
//			FSPASFLG	# YES -- RESET FIRST PASS FLAG
// slot 23065
    23065, 298,
// P20-P25.agc:960
//			R21LEM7 +1
// slot 23066
    23066, 42046
)).

// bank 24, slots 23067-23071
function agcAotUnit1486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23068 {
        if slot <= 23067 {
// P20-P25.agc:961
//R21LEM13	CCS	REPOSCNT	# HAVE WE TRIED 60 TIMES?
// slot 23067
            if slot <> 23067 or instruction <> 4883 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 787).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:962
//		TC	R21LEM7		# NO -- ADD 10 SECS.  RECOMPUTE LOS
// slot 23068
            if slot <> 23068 or instruction <> 1566 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1566, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23069 {
// P20-P25.agc:963
//		TC	R21LEM11	# YES -- PUT OUT ALARM 530
// slot 23069
            if slot <> 23069 or instruction <> 1605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1605, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23070 {
// P20-P25.agc:964
//R21LEM7		TS	REPOSCNT
// slot 23070
                if slot <> 23070 or instruction <> 23315 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:965
//		TC	INTPRET
// slot 23071
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
// P20-P25.agc:966
//		DLOAD	GOTO
// slot 23072
    23072, 43210,
// P20-P25.agc:967
//			REPOSTM
// slot 23073
    23073, 3626,
// P20-P25.agc:968
//			R21LEM12 +2
// slot 23074
    23074, 42000,
// P20-P25.agc:969
//R21LEMB		DLOAD
// slot 23075
    23075, 65482,
// P20-P25.agc:970
//			REPOSTM
// slot 23076
    23076, 3626,
// P20-P25.agc:971
//		STCALL	TDEC1
// slot 23077
    23077, 28738,
// P20-P25.agc:972
//			UPPSV
// slot 23078
    23078, 41372,
// P20-P25.agc:973
//		EXIT
// slot 23079
    23079, 65532
)).

// bank 24, slots 23080-23080
function agcAotUnit1487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:974
//		TC	UPFLAG		# SET RADMODES BIT 15 FOR
// slot 23080
    if slot <> 23080 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1487] to agcAotUnit1487@.

agcAotInstallSourceRope(list(
// P20-P25.agc:975
//		ADRES	CDESFLAG	# CONTINUOUS DESIGNATION
// slot 23081
    23081, 360
)).

// bank 24, slots 23082-23082
function agcAotUnit1488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:976
//		TC	DOWNFLAG
// slot 23082
    if slot <> 23082 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1488] to agcAotUnit1488@.

agcAotInstallSourceRope(list(
// P20-P25.agc:977
//		ADRES	LOKONSW
// slot 23083
    23083, 20
)).

// bank 24, slots 23084-23084
function agcAotUnit1489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:978
//		TC	UPFLAG
// slot 23084
    if slot <> 23084 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1489] to agcAotUnit1489@.

agcAotInstallSourceRope(list(
// P20-P25.agc:979
//		ADRES	NORRMON
// slot 23085
    23085, 172
)).

// bank 24, slots 23086-23086
function agcAotUnit1490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:980
//# Page 511
// P20-P25.agc:981
//		TC	BANKCALL
// slot 23086
    if slot <> 23086 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1490] to agcAotUnit1490@.

agcAotInstallSourceRope(list(
// P20-P25.agc:982
//		CADR	RRDESNB
// slot 23087
    23087, 43642
)).

// bank 24, slots 23088-23089
function agcAotUnit1491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23088 {
// P20-P25.agc:983
//		TC	+1
// slot 23088
        if slot <> 23088 or instruction <> 1585 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1585, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:984
//		TC	INTPRET
// slot 23089
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
// P20-P25.agc:985
//		RTB	BDSU
// slot 23090
    23090, 37176,
// P20-P25.agc:986
//			LOADTIME	# COMPUTE DELTA TIME
// slot 23091
    23091, 18166,
// P20-P25.agc:987
//			REPOSTM		# FOR LONGCALL
// slot 23092
    23092, 3626,
// P20-P25.agc:988
//		STORE	DELTATM
// slot 23093
    23093, 3630,
// P20-P25.agc:989
//		EXIT
// slot 23094
    23094, 65532
)).

// bank 24, slots 23095-23097
function agcAotUnit1492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23095 {
// P20-P25.agc:990
//		EXTEND
// slot 23095
        if slot <> 23095 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23096 {
// P20-P25.agc:991
//		DCA	DELTATM
// slot 23096
            if slot <> 23096 or instruction <> 13079 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 791, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:992
//		TC	LONGCALL
// slot 23097
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
// P20-P25.agc:993
//		EBANK=	LOSCOUNT
// P20-P25.agc:994
//		2CADR	R21LEM9
// slot 23098 23099
    23098, 3194, 23099, 41070
)).

// bank 24, slots 23100-23101
function agcAotUnit1493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23100 {
// P20-P25.agc:995
//
// P20-P25.agc:996
//		TC	ENDOFJOB
// slot 23100
        if slot <> 23100 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:997
//R21LEM9		TC	KILLTASK
// slot 23101
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
// P20-P25.agc:998
//		CADR	STDESIG
// slot 23102
    23102, 43780
)).

// bank 24, slots 23103-23105
function agcAotUnit1494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23103 {
// P20-P25.agc:999
//		TC	CLRADMOD
// slot 23103
        if slot <> 23103 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23104 {
// P20-P25.agc:1000
//		CAF	PRIO26
// slot 23104
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
// P20-P25.agc:1001
//		TC	FINDVAC
// slot 23105
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
// P20-P25.agc:1002
//		EBANK=	LOSCOUNT
// P20-P25.agc:1003
//		2CADR	R21LEM10
// slot 23106 23107
    23106, 2986, 23107, 41070
)).

// bank 24, slots 23108-23110
function agcAotUnit1495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23108 {
// P20-P25.agc:1004
//
// P20-P25.agc:1005
//		TC	TASKOVER
// slot 23108
        if slot <> 23108 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23109 {
// P20-P25.agc:1006
//R21LEM11	CAF	ALRM530		# ALARM 530 -- LOS NOT IN COVERAGE
// slot 23109
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
// P20-P25.agc:1007
//		TC	BANKCALL	# AFTER TRYING TO DESIGNATE FOR
// slot 23110
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
// P20-P25.agc:1008
//		CADR	PRIOLARM	# 600 SECS.
// slot 23111
    23111, 18148
)).

// bank 24, slots 23112-23115
function agcAotUnit1496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23113 {
        if slot <= 23112 {
// P20-P25.agc:1009
//		TC	GOTOV56
// slot 23112
            if slot <> 23112 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1010
//		TC	GOTOV56
// slot 23113
            if slot <> 23113 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23114 {
// P20-P25.agc:1011
//		TC	GOTOV56
// slot 23114
            if slot <> 23114 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1012
//		TC	ENDOFJOB
// slot 23115
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
// P20-P25.agc:1013
//ALRM530		OCT	00530
// slot 23116
    23116, 688,
// P20-P25.agc:1014
//TENSEC		2DEC	1000 B-28
// slot 23117 23118
    23117, 0, 23118, 2000,
// P20-P25.agc:1015
//
// P20-P25.agc:1016
//HALFSEC		2DEC	50
// slot 23119 23120
    23119, 0, 23120, 100
)).

// bank 24, slots 23121-23121
function agcAotUnit1497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1017
//
// P20-P25.agc:1018
//R21DISP		TC	PHASCHNG
// slot 23121
    if slot <> 23121 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1497] to agcAotUnit1497@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1019
//		OCT	04022
// slot 23122
    23122, 4132
)).

// bank 24, slots 23123-23124
function agcAotUnit1498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23123 {
// P20-P25.agc:1020
//		CAF	V06N72PV	# FLASH V 50 N 72 -- PLEASE PERFORM RR
// slot 23123
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
// P20-P25.agc:1021
//		TC	BANKCALL	# MAIN LOBE LOCKON VERIFICATION
// slot 23124
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
// P20-P25.agc:1022
//		CADR	GOPERF2R
// slot 23125
    23125, 17296
)).

// bank 24, slots 23126-23131
function agcAotUnit1499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23128 {
        if slot <= 23126 {
// P20-P25.agc:1023
//		TC	GOTOV56		# TERMINATE EXITS VIA V 56
// slot 23126
            if slot <> 23126 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23127 {
// P20-P25.agc:1024
//		TC	P20LEMWT	# PROCEED CONTINUES TO R22
// slot 23127
                if slot <> 23127 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1025
//		TC 	-5		# ENTER ILLEGAL
// slot 23128
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
// P20-P25.agc:1026
//		CAF	BIT7
// slot 23129
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
// P20-P25.agc:1027
//		TC	LINUS		# SET BITS TO MAKE THIS A PRIORITY DISPLAY
// slot 23130
                if slot <> 23130 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1028
//		TC	ENDOFJOB
// slot 23131
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
// P20-P25.agc:1029
//
// P20-P25.agc:1030
//# Page 512
// P20-P25.agc:1031
//V06N72PV	VN	00672
// slot 23132
    23132, 1680
)).

// bank 24, slots 23133-23133
function agcAotUnit1500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1032
//
// P20-P25.agc:1033
//# Page 513
// P20-P25.agc:1034
//# MANUAL ACQUISITION ROUTINE R23LEM
// P20-P25.agc:1035
//# PROGRAM DESCRIPTION
// P20-P25.agc:1036
//#
// P20-P25.agc:1037
//#	MOD NO -- 2
// P20-P25.agc:1038
//#	BY P. VOLANTE
// P20-P25.agc:1039
//#
// P20-P25.agc:1040
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:1041
//#
// P20-P25.agc:1042
//#	TO ACQUIRE THE CSM BY MANUAL OPERATION OF THE RENDEZVOUS RADAR
// P20-P25.agc:1043
//#
// P20-P25.agc:1044
//# CALLING SEQUENCE --
// P20-P25.agc:1045
//#
// P20-P25.agc:1046
//#	TC	R23LEM
// P20-P25.agc:1047
//#
// P20-P25.agc:1048
//# SUBROUTINES CALLED
// P20-P25.agc:1049
//#
// P20-P25.agc:1050
//#	BANKCALL	R61LEM
// P20-P25.agc:1051
//#	SETMINDB	GOPERF1
// P20-P25.agc:1052
//#
// P20-P25.agc:1053
//# NORMAL EXIT MODES --
// P20-P25.agc:1054
//#
// P20-P25.agc:1055
//#	IN RESPONSE TO THE GOPERF1,	SELECTION OF ENTER WILL RECYCLE R23
// P20-P25.agc:1056
//#					SELECTION OF PROC WILL CONTINUE R23
// P20-P25.agc:1057
//#					SELECTION OF TERM WILL TERMINATE R23 + P20
// P20-P25.agc:1058
//#
// P20-P25.agc:1059
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:1060
//#
// P20-P25.agc:1061
//#	SEE NORMAL EXIT MODES ABOVE
// P20-P25.agc:1062
//#
// P20-P25.agc:1063
//# OUTPUT
// P20-P25.agc:1064
//#
// P20-P25.agc:1065
//#	N.A.
// P20-P25.agc:1066
//#
// P20-P25.agc:1067
//# ERASABLE INITIALIZATION REQUIRED --
// P20-P25.agc:1068
//#
// P20-P25.agc:1069
//#	ACMODFLG MUST BE SET TO 1 (MANUAL MODE)
// P20-P25.agc:1070
//
// P20-P25.agc:1071
//		EBANK=	GENRET
// P20-P25.agc:1072
//		COUNT*	$$/R23
// P20-P25.agc:1073
//R23LEM		TC	UPFLAG		# SET NO ANGLE MONITOR FLAG
// slot 23133
    if slot <> 23133 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1500] to agcAotUnit1500@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1074
//		ADRES	NORRMON
// slot 23134
    23134, 172
)).

// bank 24, slots 23135-23136
function agcAotUnit1501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23135 {
// P20-P25.agc:1075
//		INHINT
// slot 23135
        if slot <> 23135 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1076
//		TC	IBNKCALL	# SELECT MINIMUM DEADBAND
// slot 23136
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
// P20-P25.agc:1077
//		CADR	SETMINDB
// slot 23137
    23137, 32960
)).

// bank 24, slots 23138-23143
function agcAotUnit1502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23140 {
        if slot <= 23138 {
// P20-P25.agc:1078
//		RELINT
// slot 23138
            if slot <> 23138 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23139 {
// P20-P25.agc:1079
//R23LEM1		CAF	BIT14		# ENABLE TRACKER
// slot 23139
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
// P20-P25.agc:1080
//		EXTEND
// slot 23140
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
// P20-P25.agc:1081
//		WOR	CHAN12
// slot 23141
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
// P20-P25.agc:1082
//		CAF	OCT205
// slot 23142
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
// P20-P25.agc:1083
//		TC	BANKCALL
// slot 23143
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
// P20-P25.agc:1084
//		CADR	GOPERF1
// slot 23144
    23144, 17190
)).

// bank 24, slots 23145-23149
function agcAotUnit1503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23146 {
        if slot <= 23145 {
// P20-P25.agc:1085
//		TC	R23LEM2		# TERMINATE
// slot 23145
            if slot <> 23145 or instruction <> 1662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1086
//		TC	R23LEM11	# PROCEDE
// slot 23146
            if slot <> 23146 or instruction <> 1644 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1644, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23147 {
// P20-P25.agc:1087
//		TC	R23LEM3		# ENTER -- DO ANOTHER MANEUVER
// slot 23147
            if slot <> 23147 or instruction <> 1665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1665, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23148 {
// P20-P25.agc:1088
//R23LEM11	INHINT
// slot 23148
                if slot <> 23148 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1089
//		TC	RRLIMCHK	# YES -- CHECK IF ANTENNA IS WITHIN LIMITS
// slot 23149
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
// P20-P25.agc:1090
//		ADRES	CDUT
// slot 23150
    23150, 58
)).

// bank 24, slots 23151-23152
function agcAotUnit1504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23151 {
// P20-P25.agc:1091
//		TC	OUTOFLIM	# NOT WITHIN LIMITS
// slot 23151
        if slot <> 23151 or instruction <> 1654 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1654, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1092
//		TC	IBNKCALL	# RESTORE DEADBAND TO
// slot 23152
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
// P20-P25.agc:1093
//		CADR	RESTORDB	# ASTRONAUT SELECTED VALUE
// slot 23153
    23153, 32934
)).

// bank 24, slots 23154-23155
function agcAotUnit1505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23154 {
// P20-P25.agc:1094
//		RELINT
// slot 23154
        if slot <> 23154 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1095
//		TC	DOWNFLAG	# CLEAR NO ANGLE MONITOR FLAG
// slot 23155
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
// P20-P25.agc:1096
//		ADRES	NORRMON
// slot 23156
    23156, 172
)).

// bank 24, slots 23157-23157
function agcAotUnit1506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1097
//		TC	P20LEMB1	# RADAR IS LOCKED ON CONTINUE IN P20
// slot 23157
    if slot <> 23157 or instruction <> 1139 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1139, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1506] to agcAotUnit1506@.

// bank 24, slots 23158-23160
function agcAotUnit1507 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23158 {
// P20-P25.agc:1098
//OUTOFLIM	RELINT
// slot 23158
        if slot <> 23158 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23159 {
// P20-P25.agc:1099
//# Page 514
// P20-P25.agc:1100
//		CAF	OCT501PV
// slot 23159
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
// P20-P25.agc:1101
//		TC	BANKCALL	# ISSUE ALARM -- RR ANTENNA NOT WITHIN
// slot 23160
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
// P20-P25.agc:1102
//		CADR	PRIOLARM	# LIMITS
// slot 23161
    23161, 18148
)).

// bank 24, slots 23162-23166
function agcAotUnit1508 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23163 {
        if slot <= 23162 {
// P20-P25.agc:1103
//		TC	R23LEM2		# TERMINATE -- EXIT R23 TO R00 (GO TO POOH)
// slot 23162
            if slot <> 23162 or instruction <> 1662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1104
//		TC	OUTOFLIM +1	# PROCEED ILLEGAL
// slot 23163
            if slot <> 23163 or instruction <> 1655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23164 {
// P20-P25.agc:1105
//		TC	R23LEM3		# RECYCLE -- TO ANOTHER MANEUVER
// slot 23164
            if slot <> 23164 or instruction <> 1665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1665, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23165 {
// P20-P25.agc:1106
//		TC	ENDOFJOB
// slot 23165
                if slot <> 23165 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1107
//R23LEM2		TC	DOWNFLAG	# CLEAR NO ANGLE MONITOR FLAG
// slot 23166
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
// P20-P25.agc:1108
//		ADRES	NORRMON
// slot 23167
    23167, 172
)).

// bank 24, slots 23168-23169
function agcAotUnit1509 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23168 {
// P20-P25.agc:1109
//		TC	GOTOV56		# AND EXIT VIA V56
// slot 23168
        if slot <> 23168 or instruction <> 3090 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3090, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1110
//R23LEM3		TC	BANKCALL
// slot 23169
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
// P20-P25.agc:1111
//		CADR	R61LEM
// slot 23170
    23170, 39068
)).

// bank 24, slots 23171-23171
function agcAotUnit1510 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1112
//		TC	R23LEM1
// slot 23171
    if slot <> 23171 or instruction <> 1635 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1635, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1510] to agcAotUnit1510@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1113
//
// P20-P25.agc:1114
//OCT501PV	OCT	501
// slot 23172
    23172, 642,
// P20-P25.agc:1115
//OCT205		OCT	205
// slot 23173
    23173, 266
)).

// bank 24, slots 23174-23174
function agcAotUnit1511 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1116
//
// P20-P25.agc:1117
//# Page 515
// P20-P25.agc:1118
//# SEARCH ROUTINE R24LEM
// P20-P25.agc:1119
//# PROGRAM DESCRIPTION
// P20-P25.agc:1120
//#
// P20-P25.agc:1121
//#	MOD NO -- 2
// P20-P25.agc:1122
//#	BY P. VOLANTE
// P20-P25.agc:1123
//#
// P20-P25.agc:1124
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:1125
//#
// P20-P25.agc:1126
//#	TO ACQUIRE THE CSM BY A SEARCH PATTERN WHEN THE RENDEZVOUS RADAR HAS
// P20-P25.agc:1127
//#	FAILED TO ACQUIRE TEH CSM IN THE AUTOMATIC TRACKING MODE AND TO ALLOW
// P20-P25.agc:1128
//# 	THE ASTRONAUT TO CONFIRM THAT REACQUISITION HAS NOT BEEN IN SIDELOBE.
// P20-P25.agc:1129
//#
// P20-P25.agc:1130
//# CALLING SEQUENCE
// P20-P25.agc:1131
//#
// P20-P25.agc:1132
//#	CAF	PRIONN
// P20-P25.agc:1133
//#	TC	FINDVAC
// P20-P25.agc:1134
//#	EBANK=	DATAGOOD
// P20-P25.agc:1135
//#	2CADR	R24LEM
// P20-P25.agc:1136
//#
// P20-P25.agc:1137
//# SUBROUTINES CALLED
// P20-P25.agc:1138
//#
// P20-P25.agc:1139
//#	FLAGUP		FLAGDOWN	BANKCALL
// P20-P25.agc:1140
//#	R61LEM		GOFLASHR	FINDVAC
// P20-P25.agc:1141
//#	ENDOFJOB	NOVAC		LSR24.1
// P20-P25.agc:1142
//#
// P20-P25.agc:1143
//# NORMAL EXIT MODES --
// P20-P25.agc:1144
//#
// P20-P25.agc:1145
//#	ASTRONAUT RESPONSE TO DISPLAY OF OMEGA AND DATAGOOD.  HE CAN EITHER
// P20-P25.agc:1146
//# 	REJECT BY TERMINATING (SEARCH OPTION AND RESELECTING P20) OR ACCEPT BY
// P20-P25.agc:1147
//#	PROCEEDING (EXIT ROUTINE AND RETURN TO AUTO MODE IN P20)
// P20-P25.agc:1148
//#
// P20-P25.agc:1149
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:1150
//#
// P20-P25.agc:1151
//#	SEE NORMAL EXIT MODES ABOVE
// P20-P25.agc:1152
//#
// P20-P25.agc:1153
//# OUTPUT --
// P20-P25.agc:1154
//#
// P20-P25.agc:1155
//#	SEE OUTPUT FROM LSR24.1 + R61LEM
// P20-P25.agc:1156
//#
// P20-P25.agc:1157
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:1158
//#
// P20-P25.agc:1159
//#	SET INPUT FOR LSR24.1
// P20-P25.agc:1160
//#
// P20-P25.agc:1161
//# FLAGS SET + RESET
// P20-P25.agc:1162
//#
// P20-P25.agc:1163
//#	SRCHOPT, ACMODFLG
// P20-P25.agc:1164
//
// P20-P25.agc:1165
//		EBANK=	DATAGOOD
// P20-P25.agc:1166
//		COUNT*	$$/R24
// P20-P25.agc:1167
//R24LEM		TC	UPFLAG
// slot 23174
    if slot <> 23174 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1511] to agcAotUnit1511@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1168
//		ADRES	SRCHOPTN	# SET SRCHOPT FLAG
// slot 23175
    23175, 62
)).

// bank 24, slots 23176-23176
function agcAotUnit1512 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1169
//		TC	DOWNFLAG	# RESET LOS BEING COMPUTED FLAG TO MAKE
// slot 23176
    if slot <> 23176 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1512] to agcAotUnit1512@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1170
//		ADRES	LOSCMFLG	# SURE DODES DOESN'T GO TO R21
// slot 23177
    23177, 66
)).

// bank 24, slots 23178-23182
function agcAotUnit1513 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23179 {
        if slot <= 23178 {
// P20-P25.agc:1171
//R24LEM1		CAF	ZERO
// slot 23178
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
// P20-P25.agc:1172
//		TS	DATAGOOD	# ZERO OUT DATA INDICATOR
// slot 23179
            if slot <> 23179 or instruction <> 23515 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23515, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23180 {
// P20-P25.agc:1173
//		TS	OMEGAD		# ZERO OMEGA DISPLAY REGS
// slot 23180
            if slot <> 23180 or instruction <> 23516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23181 {
// P20-P25.agc:1174
//		TS	OMEGAD +1	# ZERO OMEGA DISPLAY REGS
// slot 23181
                if slot <> 23181 or instruction <> 23517 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23517, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1175
//R24LEM2		TC	PHASCHNG
// slot 23182
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
// P20-P25.agc:1176
//		OCT	04022
// slot 23183
    23183, 4132
)).

// bank 24, slots 23184-23185
function agcAotUnit1514 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23184 {
// P20-P25.agc:1177
//		CAF	V16N80
// slot 23184
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
// P20-P25.agc:1178
//		TC	BANKCALL
// slot 23185
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
// P20-P25.agc:1179
//		CADR	PRIODSPR
// slot 23186
    23186, 17032
)).

// bank 24, slots 23187-23190
function agcAotUnit1515 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23188 {
        if slot <= 23187 {
// P20-P25.agc:1180
//		TC	GOTOV56
// slot 23187
            if slot <> 23187 or instruction <> 3090 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3090, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1181
//		TC	R24END		# PROCEED EXIT R24 TO P20LEM1
// slot 23188
            if slot <> 23188 or instruction <> 1688 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1688, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23189 {
// P20-P25.agc:1182
//
// P20-P25.agc:1183
//		TC	R24LEM3		# RECYCLE -- CALL R61 TO MANEUVER S/C
// slot 23189
            if slot <> 23189 or instruction <> 1692 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1692, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1184
//# Page 516
// P20-P25.agc:1185
//		TC	BANKCALL
// slot 23190
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
// P20-P25.agc:1186
//		CADR	LRS24.1
// slot 23191
    23191, 46660
)).

// bank 24, slots 23192-23192
function agcAotUnit1516 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1187
//R24END		TC	KILLTASK
// slot 23192
    if slot <> 23192 or instruction <> 3095 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3095, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1516] to agcAotUnit1516@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1188
//		CADR	CALLDGCH
// slot 23193
    23193, 46918
)).

// bank 24, slots 23194-23195
function agcAotUnit1517 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23194 {
// P20-P25.agc:1189
//		TC	CLRADMOD	# CLEAR BITS 10 & 15 OF RADMODES.
// slot 23194
        if slot <> 23194 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1190
//		TCF	P20LEM1		# AND GO TO 400 MI. RANGE CHECK IN P20
// slot 23195
        if slot <> 23195 or instruction <> 5171 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5171, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1517] to agcAotUnit1517@.

// bank 03, slots 5129-5136
function agcAotUnit251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5132 {
        if slot <= 5130 {
            if slot <= 5129 {
// P20-P25.agc:1191
//
// P20-P25.agc:1192
//		BLOCK	3
// P20-P25.agc:1193
//		SETLOC	FFTAG6
// P20-P25.agc:1194
//		BANK
// P20-P25.agc:1195
//		COUNT*	$$/R24
// P20-P25.agc:1196
//
// P20-P25.agc:1197
//CLRADMOD	CS	BIT10+15
// slot 5129
                if slot <> 5129 or instruction <> 19473 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3089), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1198
//		INHINT
// slot 5130
                if slot <> 5130 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5131 {
// P20-P25.agc:1199
//		MASK	RADMODES
// slot 5131
                if slot <> 5131 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1200
//		TS	RADMODES
// slot 5132
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
// P20-P25.agc:1201
//		CS	BIT2		# DISABLE RR ERROR COUNTERS
// slot 5133
                if slot <> 5133 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1202
//		EXTEND
// slot 5134
                if slot <> 5134 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 5135 {
// P20-P25.agc:1203
//		WAND	CHAN12		# USER WILL RELINT
// slot 5135
                if slot <> 5135 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1204
//
// P20-P25.agc:1205
//		TC	Q
// slot 5136
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
// P20-P25.agc:1206
//
// P20-P25.agc:1207
//BIT10+15	OCT	41000
// slot 5137
    5137, 33792
)).

// bank 24, slots 23196-23196
function agcAotUnit1518 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1208
//		BANK	24
// P20-P25.agc:1209
//		SETLOC	P20S
// P20-P25.agc:1210
//		BANK
// P20-P25.agc:1211
//		COUNT*	$$/R24
// P20-P25.agc:1212
//
// P20-P25.agc:1213
//R24LEM3		TC	PHASCHNG
// slot 23196
    if slot <> 23196 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1518] to agcAotUnit1518@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1214
//		OCT	04022
// slot 23197
    23197, 4132
)).

// bank 24, slots 23198-23198
function agcAotUnit1519 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1215
//		TC	KILLTASK
// slot 23198
    if slot <> 23198 or instruction <> 3095 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3095, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1519] to agcAotUnit1519@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1216
//		CADR	CALLDGCH	# KILL WAITLIST FOR NEXT POINT IN PATTERN
// slot 23199
    23199, 46918
)).

// bank 24, slots 23200-23203
function agcAotUnit1520 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23201 {
        if slot <= 23200 {
// P20-P25.agc:1217
//		TC	CLRADMOD	# CLEAR BITS 10 + 15 OF RADMODES TO KILL
// slot 23200
            if slot <> 23200 or instruction <> 3081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1218
//		RELINT			# HALF SECOND DESIGNATE LOOP
// slot 23201
            if slot <> 23201 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23202 {
// P20-P25.agc:1219
//		CAF	.5SEC
// slot 23202
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
// P20-P25.agc:1220
//		TC	BANKCALL	# WAIT FOR DESIGNATE LOOP TO DIE
// slot 23203
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
// P20-P25.agc:1221
//		CADR	DELAYJOB
// slot 23204
    23204, 1978
)).

// bank 24, slots 23205-23207
function agcAotUnit1521 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23205 {
// P20-P25.agc:1222
//		TC	LUNSFCHK	# CHECK IF ON LUNAR SURFACE
// slot 23205
        if slot <> 23205 or instruction <> 1463 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1463, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23206 {
// P20-P25.agc:1223
//		TC	R24LEM4		# YES -- DON'T DO ATTITUDE MANEUVER
// slot 23206
            if slot <> 23206 or instruction <> 1705 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1705, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1224
//		TC	BANKCALL	# CALL R61 TO DO PREFERRED TRACKING
// slot 23207
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
// P20-P25.agc:1225
//		CADR	R61LEM		# ATTITUDE MANEUVER
// slot 23208
    23208, 39068
)).

// bank 24, slots 23209-23211
function agcAotUnit1522 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23209 {
// P20-P25.agc:1226
//R24LEM4		CAF	ZERO		# ZERO OUT RADCADR (WHICH WAS SET BY
// slot 23209
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
// P20-P25.agc:1227
//		TS	RADCADR		# ENDRADAR WHEN DESIGNATE STOPPED) SO THAT
// slot 23210
            if slot <> 23210 or instruction <> 23238 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23238, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1228
//					# RRDESSM WILL RETURN TO CALLER
// P20-P25.agc:1229
//		TC	R24LEM2		# AND GO BACK TO PUT UP V16 N80 DISPLAY
// slot 23211
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
// P20-P25.agc:1230
//
// P20-P25.agc:1231
//V16N80		VN	01680
// slot 23212
    23212, 4256
)).

// bank 23, slots 21582-21584
function agcAotUnit1339 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21582 {
// P20-P25.agc:1232
//
// P20-P25.agc:1233
//# Page 517
// P20-P25.agc:1234
//# PREFERRED TRACKING ATTITUDE ROUTINE R61LEM
// P20-P25.agc:1235
//# PROGRAM DESCRIPTION
// P20-P25.agc:1236
//#
// P20-P25.agc:1237
//#	MOD NO: 3		DATE: 4-11-67
// P20-P25.agc:1238
//#	MOD BY: P. VOLANTE, SDC
// P20-P25.agc:1239
//#
// P20-P25.agc:1240
//# FUNCTIONAL DESCRIPTION --
// P20-P25.agc:1241
//#
// P20-P25.agc:1242
//#	TO COMPUTE THE PREFERRED TRACKING ATTITUDE OF THE LM TO ENABLE RR
// P20-P25.agc:1243
//#	TRACKING OF THE CSM AND TO PERFORM THE MANEUVER TO THE PREFERRED
// P20-P25.agc:1244
//#	ATTITUDE.
// P20-P25.agc:1245
//#
// P20-P25.agc:1246
//# CALLING SEQUENCE --
// P20-P25.agc:1247
//#
// P20-P25.agc:1248
//#	TC	BANKCALL
// P20-P25.agc:1249
//#	CADR	R61LEM
// P20-P25.agc:1250
//#
// P20-P25.agc:1251
//# SUBROUTINES CALLED
// P20-P25.agc:1252
//#
// P20-P25.agc:1253
//#	LPS20.1		VECPOINT
// P20-P25.agc:1254
//#	KALCMAN3
// P20-P25.agc:1255
//#
// P20-P25.agc:1256
//# NORMAL EXIT MODES --
// P20-P25.agc:1257
//#
// P20-P25.agc:1258
//#	NORMAL RETURN IS TO CALLER + 1
// P20-P25.agc:1259
//#
// P20-P25.agc:1260
//# ALARM OR ABORT EXIT MODES --
// P20-P25.agc:1261
//#
// P20-P25.agc:1262
//#	TERMINATE P20 + R61 BY BRANCHING TO P20END IF BOTH TRACKFLAG +
// P20-P25.agc:1263
//#	RENDEZVOUS FLAG ARE NOT SET.
// P20-P25.agc:1264
//#
// P20-P25.agc:1265
//# OUTPUT --
// P20-P25.agc:1266
//#
// P20-P25.agc:1267
//#	SEE OUTPUT FOR LPS20.1 + ATTITUDE MANEUVER ROUTINE (R60)
// P20-P25.agc:1268
//#
// P20-P25.agc:1269
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:1270
//#
// P20-P25.agc:1271
//#	GENRET USED TO SAVE Q FOR RETURN
// P20-P25.agc:1272
//#
// P20-P25.agc:1273
//# FLAGS SET + RESET
// P20-P25.agc:1274
//#
// P20-P25.agc:1275
//#	3AXISFLG
// P20-P25.agc:1276
//#
// P20-P25.agc:1277
//# DEBRIS
// P20-P25.agc:1278
//#
// P20-P25.agc:1279
//# 	SEE SUBROUTINES
// P20-P25.agc:1280
//
// P20-P25.agc:1281
//		SETLOC	R61
// P20-P25.agc:1282
//		BANK
// P20-P25.agc:1283
//		EBANK=	LOSCOUNT
// P20-P25.agc:1284
//		COUNT*	$$/R61
// P20-P25.agc:1285
//R61LEM		TC	MAKECADR
// slot 21582
        if slot <> 21582 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21583 {
// P20-P25.agc:1286
//		TS	GENRET
// slot 21583
            if slot <> 21583 or instruction <> 23139 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23139, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1287
//		TC	UPFLAG		# SET R61 FLAG
// slot 21584
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
// P20-P25.agc:1288
//		ADRES	R61FLAG
// slot 21585
    21585, 40
)).

// bank 23, slots 21586-21589
function agcAotUnit1340 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21587 {
        if slot <= 21586 {
// P20-P25.agc:1289
//		TC	R61C+L01
// slot 21586
            if slot <> 21586 or instruction <> 1111 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1111, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1290
//R65LEM		TC	MAKECADR
// slot 21587
            if slot <> 21587 or instruction <> 2469 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2469, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21588 {
// P20-P25.agc:1291
//		TS	GENRET
// slot 21588
            if slot <> 21588 or instruction <> 23139 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23139, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1292
//		TC	DOWNFLAG	# RESET R61 FLAG
// slot 21589
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
// P20-P25.agc:1293
//		ADRES	R61FLAG
// slot 21590
    21590, 40
)).

// bank 23, slots 21591-21595
function agcAotUnit1341 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21592 {
        if slot <= 21591 {
// P20-P25.agc:1294
//R61C+L01	CAF	TRACKBIT	# TRACKFLAG
// slot 21591
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
// P20-P25.agc:1295
//		MASK	STATE +1
// slot 21592
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
// P20-P25.agc:1296
//		EXTEND
// slot 21593
            if slot <> 21593 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21594 {
// P20-P25.agc:1297
//		BZF	R65WAIT		# NOT SET
// slot 21594
                if slot <> 21594 or instruction <> 5305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5305, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1298
//R61C+L03	TC	INTPRET
// slot 21595
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
// P20-P25.agc:1299
//		VLOAD
// slot 21596
    21596, 65530,
// P20-P25.agc:1300
//# Page 518
// P20-P25.agc:1301
//			HIUNITZ
// slot 21597
    21597, 6808,
// P20-P25.agc:1302
//		STORE	SCAXIS		# TRACK AXIS UNIT VECTOR
// slot 21598
    21598, 4074,
// P20-P25.agc:1303
//R61LEM1		RTB	DAD
// slot 21599
    21599, 36152,
// P20-P25.agc:1304
//			LOADTIME	# EXTRAPOLATE FORWARD TO CENTER
// slot 21600
    21600, 18166,
// P20-P25.agc:1305
//			3SECONDS	# SIX SECOND PERIOD.
// slot 21601
    21601, 14228,
// P20-P25.agc:1306
//		STCALL	TDEC1
// slot 21602
    21602, 28738,
// P20-P25.agc:1307
//			LPS20.1		# LOS DETERMINATION + VEH ATTITUDE
// slot 21603
    21603, 42330,
// P20-P25.agc:1308
//		VLOAD
// slot 21604
    21604, 65530,
// P20-P25.agc:1309
//			RRTARGET
// slot 21605
    21605, 1156,
// P20-P25.agc:1310
//		STORE	POINTVSM
// slot 21606
    21606, 4086,
// P20-P25.agc:1311
//		RTB	CALL		# GET DESIRED CDU'S FOR VECPNT1
// slot 21607
    21607, 37944,
// P20-P25.agc:1312
//			READCDUD
// slot 21608
    21608, 39294,
// P20-P25.agc:1313
//			VECPNT1		# COMPUTES FINAL ANGLES FROM PRESENT CDUDS
// slot 21609
    21609, 47156,
// P20-P25.agc:1314
//		STORE	CPHI		# STORE FINAL ANGLES -- CPHI, CTHETA, CPSI
// slot 21610
    21610, 420,
// P20-P25.agc:1315
//		EXIT
// slot 21611
    21611, 65532
)).

// bank 23, slots 21612-21612
function agcAotUnit1342 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1316
//		TC	PHASCHNG
// slot 21612
    if slot <> 21612 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1342] to agcAotUnit1342@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1317
//		OCT	04022
// slot 21613
    21613, 4132
)).

// bank 23, slots 21614-21618
function agcAotUnit1343 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21615 {
        if slot <= 21614 {
// P20-P25.agc:1318
//		CAF	TRACKBIT	# IS TRACK FLAG SET
// slot 21614
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
// P20-P25.agc:1319
//		MASK	FLAGWRD1
// slot 21615
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
// P20-P25.agc:1320
//		EXTEND
// slot 21616
            if slot <> 21616 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21617 {
// P20-P25.agc:1321
//		BZF	R65WAIT
// slot 21617
                if slot <> 21617 or instruction <> 5305 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5305, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1322
//		TC	BANKCALL
// slot 21618
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
// P20-P25.agc:1323
//		CADR	G+N,AUTO	# CHECK FOR AUTO MODE
// slot 21619
    21619, 45402
)).

// bank 23, slots 21620-21622
function agcAotUnit1344 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21620 {
// P20-P25.agc:1324
//		CCS	A
// slot 21620
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
// P20-P25.agc:1325
//		TC	R61C+L04	# NOT IN AUTO
// slot 21621
            if slot <> 21621 or instruction <> 1199 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1199, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1326
//		TC	INTPRET
// slot 21622
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
// P20-P25.agc:1327
//		VLOAD	CALL
// slot 21623
    21623, 38138,
// P20-P25.agc:1328
//			RRTARGET
// slot 21624
    21624, 1156,
// P20-P25.agc:1329
//			CDU*SMNB
// slot 21625
    21625, 40780,
// P20-P25.agc:1330
//		DLOAD	DSU		# GET PHI -- ARCCOS OF Z-COMPONENT OF LOS
// slot 21626
    21626, 38346,
// P20-P25.agc:1331
//			MPAC +5
// slot 21627
    21627, 228,
// P20-P25.agc:1332
//			COS15DEG
// slot 21628
    21628, 6522,
// P20-P25.agc:1333
//R61LEM2		BMN	EXIT		# BRANCH -- PHI > 15 DEGREES
// slot 21629
    21629, 65088,
// P20-P25.agc:1334
//			R61C+L05	# PHI GRE 10DEG
// slot 21630
    21630, 39190
)).

// bank 23, slots 21631-21642
function agcAotUnit1345 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21636 {
        if slot <= 21633 {
            if slot <= 21631 {
// P20-P25.agc:1335
//		EBANK=	CDUXD
// P20-P25.agc:1336
//		CAF	EBANK6
// slot 21631
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
// P20-P25.agc:1337
//		TS	EBANK
// slot 21632
                    if slot <> 21632 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1338
//		INHINT
// slot 21633
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
// P20-P25.agc:1339
//		EXTEND
// slot 21634
                if slot <> 21634 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21635 {
// P20-P25.agc:1340
//		DCA	CPHI
// slot 21635
                    if slot <> 21635 or instruction <> 12498 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 210, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1341
//		DXCH	CDUXD
// slot 21636
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
// P20-P25.agc:1342
//		CA	CPSI
// slot 21637
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
// P20-P25.agc:1343
//		TS	CDUZD
// slot 21638
                    if slot <> 21638 or instruction <> 23455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23455, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1344
//		RELINT
// slot 21639
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
// P20-P25.agc:1345
//		EBANK=	LOSCOUNT
// P20-P25.agc:1346
//		CAF	EBANK7
// slot 21640
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
// P20-P25.agc:1347
//		TS	EBANK
// slot 21641
                    if slot <> 21641 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1348
//		TC	R61C+L06
// slot 21642
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
// P20-P25.agc:1349
//R61C+L05	EXIT
// slot 21643
    21643, 65532
)).

// bank 23, slots 21644-21645
function agcAotUnit1346 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21644 {
// P20-P25.agc:1350
//		INHINT
// slot 21644
        if slot <> 21644 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1351
//# Page 519
// P20-P25.agc:1352
//		TC	IBNKCALL
// slot 21645
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
// P20-P25.agc:1353
//		FCADR	ZATTEROR
// slot 21646
    21646, 32982
)).

// bank 23, slots 21647-21647
function agcAotUnit1347 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1354
//		TC	IBNKCALL
// slot 21647
    if slot <> 21647 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1347] to agcAotUnit1347@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1355
//		FCADR	SETMINDB	# REDUCE ATTITUDE ERROR
// slot 21648
    21648, 32960
)).

// bank 23, slots 21649-21649
function agcAotUnit1348 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1356
//		TC	DOWNFLAG
// slot 21649
    if slot <> 21649 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1348] to agcAotUnit1348@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1357
//		ADRES	3AXISFLG
// slot 21650
    21650, 168
)).

// bank 23, slots 21651-21651
function agcAotUnit1349 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1358
//		TC	UPFLAG
// slot 21651
    if slot <> 21651 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1349] to agcAotUnit1349@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1359
//		ADRES	PDSPFLAG	# SET PRIORITY DISPLAY FLAG
// slot 21652
    21652, 126
)).

// bank 23, slots 21653-21653
function agcAotUnit1350 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1360
//		TC	BANKCALL
// slot 21653
    if slot <> 21653 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1350] to agcAotUnit1350@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1361
//		CADR	R60LEM
// slot 21654
    21654, 45222
)).

// bank 23, slots 21655-21656
function agcAotUnit1351 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21655 {
// P20-P25.agc:1362
//		INHINT
// slot 21655
        if slot <> 21655 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1363
//		TC	IBNKCALL
// slot 21656
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
// P20-P25.agc:1364
//		FCADR	RESTORDB
// slot 21657
    21657, 32934
)).

// bank 23, slots 21658-21658
function agcAotUnit1352 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1365
//		TC	PHASCHNG
// slot 21658
    if slot <> 21658 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1352] to agcAotUnit1352@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1366
//		OCT	04022
// slot 21659
    21659, 4132
)).

// bank 23, slots 21660-21660
function agcAotUnit1353 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1367
//		TC	DOWNFLAG
// slot 21660
    if slot <> 21660 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1353] to agcAotUnit1353@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1368
//		ADRES	PDSPFLAG	# RESET PRIORITY DISPLAY FLAG
// slot 21661
    21661, 126
)).

// bank 23, slots 21662-21671
function agcAotUnit1354 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21666 {
        if slot <= 21663 {
            if slot <= 21662 {
// P20-P25.agc:1369
//R61C+L06	CA	FLAGWRD1
// slot 21662
                if slot <> 21662 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1370
//		MASK	R61FLBIT
// slot 21663
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
// P20-P25.agc:1371
//		CCS	A
// slot 21664
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
// P20-P25.agc:1372
//		TC	R61C+L4
// slot 21665
                    if slot <> 21665 or instruction <> 1202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1202, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1373
//		CCS	R65CNTR
// slot 21666
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
// P20-P25.agc:1374
//		TC	+2
// slot 21667
                if slot <> 21667 or instruction <> 1189 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1189, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1375
//		TC	R61C+L4		# R65CNTR = 0 - EXIT ROUTINE
// slot 21668
                if slot <> 21668 or instruction <> 1202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1202, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21669 {
// P20-P25.agc:1376
//		TS	R65CNTR
// slot 21669
                if slot <> 21669 or instruction <> 23525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23525, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21670 {
// P20-P25.agc:1377
//		CAF	06SEC
// slot 21670
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
// P20-P25.agc:1378
//		TC	TWIDDLE
// slot 21671
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
// P20-P25.agc:1379
//		ADRES	R61C+L2
// slot 21672
    21672, 2388
)).

// bank 23, slots 21673-21675
function agcAotUnit1355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21673 {
// P20-P25.agc:1380
//		TC	ENDOFJOB
// slot 21673
        if slot <> 21673 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21674 {
// P20-P25.agc:1381
//R61C+L2		CAF	PRIO26
// slot 21674
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
// P20-P25.agc:1382
//		TC	FINDVAC
// slot 21675
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
// P20-P25.agc:1383
//		EBANK=	LOSCOUNT
// P20-P25.agc:1384
//		2CADR	R61C+L01
// slot 21676 21677
    21676, 2222, 21677, 39022
)).

// bank 23, slots 21678-21679
function agcAotUnit1356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21678 {
// P20-P25.agc:1385
//
// P20-P25.agc:1386
//		TC	TASKOVER
// slot 21678
        if slot <> 21678 or instruction <> 2737 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2737, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1387
//R61C+L04	TC	BANKCALL	# TO CONVERT ANGLES TO FDAI
// slot 21679
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
// P20-P25.agc:1388
//		CADR	BALLANGS
// slot 21680
    21680, 45420
)).

// bank 23, slots 21681-21689
function agcAotUnit1357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21684 {
        if slot <= 21682 {
            if slot <= 21681 {
// P20-P25.agc:1389
//		TC	R61C+L06
// slot 21681
                if slot <> 21681 or instruction <> 1182 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1182, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1390
//R61C+L4		CAE	GENRET
// slot 21682
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
// P20-P25.agc:1391
//		TCF	BANKJUMP	# EXIT R61
// slot 21683
                if slot <> 21683 or instruction <> 6560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1392
//R61C+L1		CAF	BIT7+9PV	# IS RENDEZVOUS OR P25FLAG SET
// slot 21684
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
// P20-P25.agc:1393
//		MASK	STATE
// slot 21685
                if slot <> 21685 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1394
//		EXTEND
// slot 21686
                if slot <> 21686 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21687 {
// P20-P25.agc:1395
//		BZF	ENDOFJOB	# NO -- EXIT ROUTINE AND PROGRAM.
// slot 21687
                if slot <> 21687 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21688 {
// P20-P25.agc:1396
//		TC	R61C+L06	# YES EXIT ROUTINE
// slot 21688
                    if slot <> 21688 or instruction <> 1182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1182, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1397
//R65WAIT		TC	POSTJUMP
// slot 21689
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
// P20-P25.agc:1398
//		CADR	P20LEMWT
// slot 21690
    21690, 41268,
// P20-P25.agc:1399
//
// P20-P25.agc:1400
//BIT7+9PV	OCT	00500
// slot 21691
    21691, 640,
// P20-P25.agc:1401
//# Page 520
// P20-P25.agc:1402
//COS15DEG	2DEC	0.96593 B-1
// slot 21692 21693
    21692, 15824, 21693, 29444,
// P20-P25.agc:1403
//
// P20-P25.agc:1404
//06SEC		DEC	600
// slot 21694
    21694, 1200
)).

// bank 23, slots 21695-21707
function agcAotUnit1358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21700 {
        if slot <= 21697 {
            if slot <= 21695 {
// P20-P25.agc:1405
//PHI		EQUALS	20D
// P20-P25.agc:1406
//READCDUD	INHINT			# READS DESIRED CDU'S AND STORES IN
// slot 21695
                if slot <> 21695 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21696 {
// P20-P25.agc:1407
//		CAF	EBANK6		# MPAC TP EXITS WITH MODE SET TO TP
// slot 21696
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
// P20-P25.agc:1408
//		XCH	EBANK
// slot 21697
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
// P20-P25.agc:1409
//		TS	RUPTREG1
// slot 21698
                if slot <> 21698 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21699 {
// P20-P25.agc:1410
//		EBANK=	CDUXD
// P20-P25.agc:1411
//		CA	CDUXD
// slot 21699
                    if slot <> 21699 or instruction <> 13213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 925).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1412
//		TS	MPAC
// slot 21700
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
// P20-P25.agc:1413
//		EXTEND
// slot 21701
                if slot <> 21701 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21702 {
// P20-P25.agc:1414
//		DCA	CDUYD
// slot 21702
                    if slot <> 21702 or instruction <> 13215 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 927, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1415
//		DXCH	MPAC +1
// slot 21703
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
// P20-P25.agc:1416
//		CA	RUPTREG1
// slot 21704
                    if slot <> 21704 or instruction <> 12344 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 56).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1417
//		TS	EBANK
// slot 21705
                    if slot <> 21705 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21706 {
// P20-P25.agc:1418
//		RELINT
// slot 21706
                    if slot <> 21706 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1419
//		TCF	TMODE
// slot 21707
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

// bank 02, slots 4426-4430
function agcAotUnit166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4427 {
        if slot <= 4426 {
// P20-P25.agc:1420
//		BLOCK	02
// P20-P25.agc:1421
//		SETLOC	RADARFF
// P20-P25.agc:1422
//		BANK
// P20-P25.agc:1423
//
// P20-P25.agc:1424
//		EBANK=	LOSCOUNT
// P20-P25.agc:1425
//		COUNT*	$$/RRSUB
// P20-P25.agc:1426
//
// P20-P25.agc:1427
//# Page 521
// P20-P25.agc:1428
//# THE FOLLOWING SUBROUTINE RETURNS TO CALLER +2 IF THE ABSOLUTE VALUE OF VALUE OF C(A) IS GREATER THAN THE
// P20-P25.agc:1429
//# NEGATIVE OF THE NUMBER AT CALLER +1.  OTHERWISE IT RETURNS TO CALLER +3.  MAY BE CALLED IN RUPT OR UNDER EXEC.
// P20-P25.agc:1430
//
// P20-P25.agc:1431
//MAGSUB		EXTEND
// slot 4426
            if slot <> 4426 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1432
//		BZMF	+2
// slot 4427
            if slot <> 4427 or instruction <> 26957 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26957, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4428 {
// P20-P25.agc:1433
//		TCF	+2
// slot 4428
            if slot <> 4428 or instruction <> 6478 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6478, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4429 {
// P20-P25.agc:1434
//		COM
// slot 4429
                if slot <> 4429 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1435
//
// P20-P25.agc:1436
//		INDEX	Q
// slot 4430
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
// P20-P25.agc:1437
//		AD	0
// slot 4431
    4431, 49152
)).

// bank 02, slots 4432-4436
function agcAotUnit167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4433 {
        if slot <= 4432 {
// P20-P25.agc:1438
//		EXTEND
// slot 4432
            if slot <> 4432 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1439
//		BZMF	Q+2		# ABS(A) <= CONST GO TO L+3
// slot 4433
            if slot <> 4433 or instruction <> 28129 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 28129, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4434 {
// P20-P25.agc:1440
//		TCF	Q+1		# ABS(A) > CONST GO TO L+2
// slot 4434
            if slot <> 4434 or instruction <> 7647 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7647, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4435 {
// P20-P25.agc:1441
//
// P20-P25.agc:1442
//# Page 522
// P20-P25.agc:1443
//# PROGRAM NAME:	RRLIMCHK
// P20-P25.agc:1444
//#
// P20-P25.agc:1445
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1446
//#
// P20-P25.agc:1447
//#	RRLIMCHK CHECKS RR DESIRED GIMBAL ANGLES TO SEE IF THEY ARE WITHIN
// P20-P25.agc:1448
//# 	THE LIMITS OF THE CURRENT MODE.  INITIALLY THE DESIRED TRUNNION AND
// P20-P25.agc:1449
//#	SHAFT ANGLES ARE STORED IN ITEMP1 AND ITEMP2.  THE CURRENT RR
// P20-P25.agc:1450
//# 	ANTENNAE MODE (RADMODES BIT 12) IS CHECKED WHICH IS = 0 FOR
// P20-P25.agc:1451
//#	MODE 1 AND =1 FOR MODE 2.
// P20-P25.agc:1452
//#
// P20-P25.agc:1453
//#	MODE 1 -- THE TRUNNION ANGLE IS CHECKED AT MAGSUB TO SEE IF IT IS
// P20-P25.agc:1454
//#	BETWEEN -55 AND +55 DEGREES.  IF NOT, RETURN TO L +2.  IF WITHIN LIMITS,
// P20-P25.agc:1455
//#	THE SHAFT ANGLE IS CHECKED TO SEE IF IT IS BETWEEN -70 AND +59 DEGREES.
// P20-P25.agc:1456
//#	IF NOT, RETURN TO L +2.  IF IN LIMITS, RETURN TO L +3.
// P20-P25.agc:1457
//#
// P20-P25.agc:1458
//#	MODE 2 -- THE SHAFT ANGLE IS CHECKED AT MAGSUB TO SEE IF IT IS
// P20-P25.agc:1459
//#	BETWEEN -139 AND -25 DEGREES.  IF NOT, RETURN TO L +2.  IF WITHIN
// P20-P25.agc:1460
//#	LIMITS, THE TRUNNION ANGLE IS CHECKED TO SEE IF IT IS BETWEEN +125
// P20-P25.agc:1461
//# 	AND -125 (+235) DEGREES.  IF NOT, RETURN TO L +2.  IF IN LIMITS, RETURN
// P20-P25.agc:1462
//#	TO L +3.
// P20-P25.agc:1463
//#
// P20-P25.agc:1464
//# CALLING SEQUENCE:
// P20-P25.agc:1465
//#
// P20-P25.agc:1466
//#	L  TC  RLIMCHK (WITH INTERRUPT INHIBITED)
// P20-P25.agc:1467
//#	L  +1  ADRES  T,S  (DESIRED TRUNNION ANGLE ADDRESS)
// P20-P25.agc:1468
//#
// P20-P25.agc:1469
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:1470
//#
// P20-P25.agc:1471
//#	RADMODES, MODEA, MODEB (OR DESIRED TRUNNION AND SHAFT
// P20-P25.agc:1472
//#	ANGLES ELSEWHERE IN CONSECUTIVE LOCATIONS -- UNSWITCHED ERASABLE OR
// P20-P25.agc:1473
//#	CURRENT EBANK).
// P20-P25.agc:1474
//#
// P20-P25.agc:1475
//# SUBROUTINES CALLED:	MAGSUB
// P20-P25.agc:1476
//#
// P20-P25.agc:1477
//# JOBS OR TASKS INITIATED:  NONE
// P20-P25.agc:1478
//#
// P20-P25.agc:1479
//# ALARMS:  NONE
// P20-P25.agc:1480
//#
// P20-P25.agc:1481
//# EXIT:		L + 2	(EITHER OR BOTH ANGLES NOT WITHIN LIMITS OF CURRENT MODE)
// P20-P25.agc:1482
//#		L + 3	(BOTH ANGLES WITHIN LIMITS OF CURRENT MODE)
// P20-P25.agc:1483
//
// P20-P25.agc:1484
//RRLIMCHK	EXTEND
// slot 4435
                if slot <> 4435 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1485
//		INDEX	Q
// slot 4436
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
// P20-P25.agc:1486
//		INDEX	0
// slot 4437
    4437, 40960,
// P20-P25.agc:1487
//		DCA	0
// slot 4438
    4438, 24578
)).

// bank 02, slots 4439-4447
function agcAotUnit168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4442 {
        if slot <= 4440 {
            if slot <= 4439 {
// P20-P25.agc:1488
//		INCR	Q
// slot 4439
                if slot <> 4439 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1489
//		DXCH	ITEMP1
// slot 4440
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
// P20-P25.agc:1490
//		LXCH	Q		# L(CALLER +2) TO L.
// slot 4441
                if slot <> 4441 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1491
//
// P20-P25.agc:1492
//		CAF	ANTENBIT	# SEE WHICH MODE RR IS IN.
// slot 4442
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
// P20-P25.agc:1493
//		MASK	RADMODES
// slot 4443
                if slot <> 4443 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1494
//		CCS	A
// slot 4444
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
// P20-P25.agc:1495
//		TCF	MODE2CHK
// slot 4445
                if slot <> 4445 or instruction <> 6504 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6504, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4446 {
// P20-P25.agc:1496
//
// P20-P25.agc:1497
//		CA	ITEMP1		# MODE 1 IS DEFINED AS
// slot 4446
                    if slot <> 4446 or instruction <> 12337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1498
//# Page 523
// P20-P25.agc:1499
//		TC	MAGSUB		# 	1. ABS(T) L 55 DEGS.
// slot 4447
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
// P20-P25.agc:1500
//		DEC	-.30555		# 	2. ABS(S + 5.5 DEGS) L 64.5 DEGS
// slot 4448
    4448, 55522
)).

// bank 02, slots 4449-4452
function agcAotUnit169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4450 {
        if slot <= 4449 {
// P20-P25.agc:1501
//		TC	L		#		(SHAFT LIMITS AT +59, -70 DEGS)
// slot 4449
            if slot <> 4449 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1502
//
// P20-P25.agc:1503
//		CAF	5.5DEGS
// slot 4450
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
// P20-P25.agc:1504
//		AD	ITEMP2
// slot 4451
            if slot <> 4451 or instruction <> 24626 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 50).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1505
//		TC	MAGSUB
// slot 4452
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
// P20-P25.agc:1506
//		DEC	-.35833		# 64.5 DEGS
// slot 4453
    4453, 53792
)).

// bank 02, slots 4454-4458
function agcAotUnit170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4455 {
        if slot <= 4454 {
// P20-P25.agc:1507
//		TC	L
// slot 4454
            if slot <> 4454 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1508
//		TC	RRLIMOK		# IN LIMITS.
// slot 4455
            if slot <> 4455 or instruction <> 2416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4456 {
// P20-P25.agc:1509
//
// P20-P25.agc:1510
//MODE2CHK	CAF	82DEGS		# MODE 2 IS DEFINED AS
// slot 4456
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
// P20-P25.agc:1511
//		AD	ITEMP2		#	1. ABS(T) G 125 DEGS.
// slot 4457
                if slot <> 4457 or instruction <> 24626 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1512
//		TC	MAGSUB		#	2. ABS(S + 82 DEGS) L 57 DEGS
// slot 4458
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
// P20-P25.agc:1513
//		DEC	-.31667		#		(SHAFT LIMITS AT -25, -139 DEGS)
// slot 4459
    4459, 55158
)).

// bank 02, slots 4460-4462
function agcAotUnit171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4460 {
// P20-P25.agc:1514
//		TC	L
// slot 4460
        if slot <> 4460 or instruction <> 1 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4461 {
// P20-P25.agc:1515
//
// P20-P25.agc:1516
//		CA	ITEMP1
// slot 4461
            if slot <> 4461 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1517
//		TC	MAGSUB
// slot 4462
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
// P20-P25.agc:1518
//		DEC	-.69444		# 125 DEGS
// slot 4463
    4463, 42778
)).

// bank 02, slots 4464-4464
function agcAotUnit172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1519
//
// P20-P25.agc:1520
//RRLIMOK		INDEX	L
// slot 4464
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
// P20-P25.agc:1521
//		TC	L		# ( = TC 1 )
// slot 4465
    4465, 2,
// P20-P25.agc:1522
//
// P20-P25.agc:1523
//5.5DEGS		DEC	.03056
// slot 4466
    4466, 1002,
// P20-P25.agc:1524
//82DEGS		DEC	.45556
// slot 4467
    4467, 14928
)).

// bank 02, slots 4468-4492
function agcAotUnit173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4479 {
        if slot <= 4473 {
            if slot <= 4470 {
                if slot <= 4468 {
// P20-P25.agc:1525
//
// P20-P25.agc:1526
//# Page 524
// P20-P25.agc:1527
//# PROGRAM NAME:	SETTRKF
// P20-P25.agc:1528
//#
// P20-P25.agc:1529
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1530
//#
// P20-P25.agc:1531
//# 	SETTRKF UPDATES THE TRACKER FAIL LAMP ON THE DSKY.
// P20-P25.agc:1532
//#	INITIALLY THE LAMP TEST FLAG (IMODES33 BIT 1) IS CHECKED.
// P20-P25.agc:1533
//# 	IF A LAMP TEST IS IN PROGRESS, THE PROGRAM EXITS TO L +1.
// P20-P25.agc:1534
//#	IF NO LAMP TEST THE FOLLOWING IS CHECKED SEQUENTIALLY:
// P20-P25.agc:1535
//#		1) RR CDU'S BEING ZEROED, RR CDU OK, AND RR NOT IN
// P20-P25.agc:1536
//#		   AUTO MODE (RADMODES BITS 13, 7, 2).
// P20-P25.agc:1537
//#		2) LR VEL DATA FAIL AND NO LR POS DATA (RADMODES BITS
// P20-P25.agc:1538
//#		   8,5)
// P20-P25.agc:1539
//#		3) NO RR DATA (RADMODES BIT 4)
// P20-P25.agc:1540
//#	THE ABSENCE OF ALL THREE SIMULTANEOUSLY IN (1), THE PRESENCE OF BOTH
// P20-P25.agc:1541
//#	IN (2), AND THE PRESENCE OF (3) RESULTS IN EITHER THE TRACKER FAIL
// P20-P25.agc:1542
//#	LAMP (DSPTAB +11D BIT 8) BEING TURNED OFF OR IS LEFT OFF.  THEREFORE, THE
// P20-P25.agc:1543
//#	TRACKER FAIL LAMP IS TURN ON IF:
// P20-P25.agc:1544
//#		A) RR CDU FAILED WITH RR IN AUTO MODE AND RR CDU'S NOT BEING ZEROED
// P20-P25.agc:1545
//#		B) N SAMPLES OF LR DATA COULD NOT BE TAKEN IN 2N TRIES WITH
// P20-P25.agc:1546
//#		   EITHER THE ALT OR VEL INFORMATION
// P20-P25.agc:1547
//#		C) N SAMPLES OF RR DATA COULD NOT BE OBTAINED FROM 2N TRIES
// P20-P25.agc:1548
//#		   WITH EITHER THE AL
// P20-P25.agc:1549
//#
// P20-P25.agc:1550
//# CALLING SEQUENCE:
// P20-P25.agc:1551
//#
// P20-P25.agc:1552
//#	L	TC	SETTRKF
// P20-P25.agc:1553
//#
// P20-P25.agc:1554
//# ERASABLE INITIALIZATION REQUIRED:  IMODES33, RADMODES, DSPTAB +11D
// P20-P25.agc:1555
//#
// P20-P25.agc:1556
//# SUBROUTINES CALLED:  NONE
// P20-P25.agc:1557
//#
// P20-P25.agc:1558
//# JOBS OR TASKS INITIATED:  NONE
// P20-P25.agc:1559
//#
// P20-P25.agc:1560
//# ALARMS:  TRACKER FAIL LAMP
// P20-P25.agc:1561
//#
// P20-P25.agc:1562
//# EXIT:  L +1 (ALWAYS)
// P20-P25.agc:1563
//
// P20-P25.agc:1564
//SETTRKF		CAF	BIT1		# NO ACTION IF DURING LAMP TEST
// slot 4468
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
// P20-P25.agc:1565
//		MASK	IMODES33
// slot 4469
                        if slot <> 4469 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1566
//		CCS	A
// slot 4470
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
// P20-P25.agc:1567
//		TC	Q
// slot 4471
                    if slot <> 4471 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4472 {
// P20-P25.agc:1568
//
// P20-P25.agc:1569
//RRTRKF		CA	BIT8
// slot 4472
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
// P20-P25.agc:1570
//		TS	L
// slot 4473
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
// P20-P25.agc:1571
//
// P20-P25.agc:1572
//		CAF	13,7,2		# SEE IF CDU FAILED.
// slot 4474
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
// P20-P25.agc:1573
//		MASK	RADMODES
// slot 4475
                        if slot <> 4475 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1574
//		EXTEND
// slot 4476
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
// P20-P25.agc:1575
//		BZF	TRKFLON		# CONDITION 3 ABOVE.
// slot 4477
                    if slot <> 4477 or instruction <> 6529 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4478 {
// P20-P25.agc:1576
//
// P20-P25.agc:1577
//RRCHECK		CAF	RRDATABT	# SEE IF RR DATA FAILED.
// slot 4478
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
// P20-P25.agc:1578
//		MASK	RADMODES
// slot 4479
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
// P20-P25.agc:1579
//# Page 525
// P20-P25.agc:1580
//		CCS	A
// slot 4480
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
// P20-P25.agc:1581
//TRKFLON		CA	L
// slot 4481
                        if slot <> 4481 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1582
//		AD	DSPTAB +11D	# HALF ADD DESIRED AND PRESENT STATES.
// slot 4482
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
// P20-P25.agc:1583
//		MASK	L
// slot 4483
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
// P20-P25.agc:1584
//		EXTEND
// slot 4484
                        if slot <> 4484 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1585
//		BZF	TCQ		# NO CHANGE.
// slot 4485
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
// P20-P25.agc:1586
//
// P20-P25.agc:1587
//FLIP		CA	DSPTAB +11D	# CAN'T USE LXCH DSPTAB +11D (RESTART PROB)
// slot 4486
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
// P20-P25.agc:1588
//		EXTEND
// slot 4487
                        if slot <> 4487 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1589
//		RXOR	LCHAN
// slot 4488
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
// P20-P25.agc:1590
//		MASK	POSMAX
// slot 4489
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
// P20-P25.agc:1591
//		AD	BIT15
// slot 4490
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
// P20-P25.agc:1592
//		TS	DSPTAB +11D
// slot 4491
                        if slot <> 4491 or instruction <> 23070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:1593
//		TC	Q
// slot 4492
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
// P20-P25.agc:1594
//
// P20-P25.agc:1595
//13,7,2		OCT	10102
// slot 4493
    4493, 8324
)).

// bank 25, slots 23602-23603
function agcAotUnit1549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23602 {
// P20-P25.agc:1596
//ENDRMODF	EQUALS
// P20-P25.agc:1597
//
// P20-P25.agc:1598
//# Page 526
// P20-P25.agc:1599
//# PROGRAM NAME:  RRTURNON
// P20-P25.agc:1600
//#
// P20-P25.agc:1601
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1602
//#
// P20-P25.agc:1603
//#	RRTURNON IS THE TURN-ON SEQUENCE WHICH, ALONG WTIH
// P20-P25.agc:1604
//#	RRZEROSB, ZEROES THE CDU'S AND DETERMINES THE RR MODE.
// P20-P25.agc:1605
//#	INITIALLY, CONTROL IS TRANSFERRED TO RRZEROSB FOR THE
// P20-P25.agc:1606
//#	ACTUAL TURN-ON SEQUENCE.  UPON RETURN THE PROGRAM
// P20-P25.agc:1607
//#	WAITS 1 SECOND BEFORE REMOVING THE TURN-ON FLAG
// P20-P25.agc:1608
//#	(RADMODES BIT1) SO THE REPOSITION ROUTINE WON'T
// P20-P25.agc:1609
//#	INITIATE PROGRAM ALARM 00501.  A CHECK IS THEN MADE
// P20-P25.agc:1610
//#	TO SEE IF A PROGRAM IS USING THE RR (STATE BIT 7).  IF
// P20-P25.agc:1611
//#	SO, THE PROGRAM EXITS TO ENDRADAR SO THAT THE RR CDU
// P20-P25.agc:1612
//#	FAIL FLAG (RADMODES BIT 7) CAN BE CHECKED BEFORE
// P20-P25.agc:1613
//#	RETURNING TO THE WAITING PROGRAM.  IF NOT, THE PROGRAM EXITS
// P20-P25.agc:1614
//#	TO TASKOVER.
// P20-P25.agc:1615
//#
// P20-P25.agc:1616
//# CALLING SEQUENCE:  WAITLIST TASK FROM RRAUTCHK IF THE RR POWER-ON AUTO
// P20-P25.agc:1617
//# BIT (CHAN 33 BIT 2) CHANGES TO 0 AND NO PROGRAM WAS USING
// P20-P25.agc:1618
//# THE RR (STATE BIT 7).
// P20-P25.agc:1619
//#
// P20-P25.agc:1620
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:1621
//#
// P20-P25.agc:1622
//#	RADMODES, STATE
// P20-P25.agc:1623
//#
// P20-P25.agc:1624
//# SUBROUTINES CALLED:  RRZEROSB, FIXDELAY, TASKOVER, ENDRADAR
// P20-P25.agc:1625
//#
// P20-P25.agc:1626
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:1627
//#
// P20-P25.agc:1628
//#	NONE
// P20-P25.agc:1629
//#
// P20-P25.agc:1630
//# ALARMS:  NONE (SEE RRZEROSB)
// P20-P25.agc:1631
//#
// P20-P25.agc:1632
//# EXIT:  TASKOVER, ENDRADAR (WAITING PROGRAM)
// P20-P25.agc:1633
//
// P20-P25.agc:1634
//		BANK	24
// P20-P25.agc:1635
//		SETLOC	P20S1
// P20-P25.agc:1636
//		BANK
// P20-P25.agc:1637
//
// P20-P25.agc:1638
//		EBANK=	LOSCOUNT
// P20-P25.agc:1639
//		COUNT*	$$/RSUB
// P20-P25.agc:1640
//RRTURNON	TC	RRZEROSB
// slot 23602
        if slot <> 23602 or instruction <> 1081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:1641
//		TC	FIXDELAY	# WAIT 1 SEC BEFORE REMOVING TURN ON FLAG
// slot 23603
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
// P20-P25.agc:1642
//		DEC	100		# SO A MONITOR REPOSITION WON'T ALARM.
// slot 23604
    23604, 200
)).

// bank 25, slots 23605-23614
function agcAotUnit1550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23609 {
        if slot <= 23606 {
            if slot <= 23605 {
// P20-P25.agc:1643
//		CS	TURNONBT
// slot 23605
                if slot <> 23605 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1644
//		MASK	RADMODES
// slot 23606
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
// P20-P25.agc:1645
//		TS	RADMODES
// slot 23607
                if slot <> 23607 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23608 {
// P20-P25.agc:1646
//		TCF	TASKOVER
// slot 23608
                    if slot <> 23608 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1647
//# Page 527
// P20-P25.agc:1648
//# PROGRAM NAME:  RRZEROSB
// P20-P25.agc:1649
//#
// P20-P25.agc:1650
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1651
//#
// P20-P25.agc:1652
//#	RRZEROSB IS A CLOSED SUBROUTINE TO ZERO THE RR CDU'S,
// P20-P25.agc:1653
//#	DETERMINE THE RR MODE, AND TURN ON THE TRACKER FAIL
// P20-P25.agc:1654
//#	LAMP IF REQUIRED.  INITIALLY THE RR CDU ZERO BIT (CHAN 12
// P20-P25.agc:1655
//#	BIT 1) IS SET.  FOLLOWING A 20 MILLISECOND WAIT, THE LGC
// P20-P25.agc:1656
//#	RR CDU COUNTERS (OPTY, OPTX) ARE SET = 0 AFTER
// P20-P25.agc:1657
//# 	WHICH THE RR CDU ZERO DISCRETE (CHAN 12 BIT 1) IS
// P20-P25.agc:1658
//#	REMOVED.  A 4 SECOND WAIT IS SET TO ALL THE RR CDU'S
// P20-P25.agc:1659
//#	TO REPEAT THE ACTUAL TRUNNION AND SHAFT ANGLES.  THE
// P20-P25.agc:1660
//#	RR CDU ZERO FLAG (RADMODES BIT 13) IS REMOVED.  THE
// P20-P25.agc:1661
//#	CONTENTS OF OPTY IS THEN CHECKED TO SEE IF THE TRUNNION
// P20-P25.agc:1662
//#	ANGLE IS LESS THAN 90 DEGREES.  IF NOT, BIT 12 OF
// P20-P25.agc:1663
//#	RADMODES IS SET = 1 TO INDICATE RR ANTENNA MODE 2.
// P20-P25.agc:1664
//#	IF LESS THAN 90 DEGREES, BIT 12 OF RADMODES IS SET = 0 TO
// P20-P25.agc:1665
//#	INDICATE RR ANTENNA MODE 1.  SETTRKF IS THEN CALLED TO
// P20-P25.agc:1666
//#	SEE IF THE TRACKER FAIL LAMP SHOULD BE TURNED ON.
// P20-P25.agc:1667
//#
// P20-P25.agc:1668
//# CALLING SEQUENCE:  L  TC  RRZEROSB  (FROM RRTURNON AND RRZERO)
// P20-P25.agc:1669
//#
// P20-P25.agc:1670
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:1671
//#
// P20-P25.agc:1672
//#	RADMODES (BIT 13 SET), DSPTAB +11D
// P20-P25.agc:1673
//#
// P20-P25.agc:1674
//# SUBROUTINES CALLED:  FIXDELAY, MAGSUB, SETTRKF
// P20-P25.agc:1675
//#
// P20-P25.agc:1676
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:1677
//#
// P20-P25.agc:1678
//#	NONE
// P20-P25.agc:1679
//#
// P20-P25.agc:1680
//# ALARMS:  TRAKCER FAIL
// P20-P25.agc:1681
//#
// P20-P25.agc:1682
//# EXIT:  L +1 (ALWAYS)
// P20-P25.agc:1683
//
// P20-P25.agc:1684
//RRZEROSB	EXTEND
// slot 23609
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
// P20-P25.agc:1685
//		QXCH	RRRET
// slot 23610
                if slot <> 23610 or instruction <> 9933 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 717, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1686
//		CAF	BIT1		# BIT 13 OF RADMODES MUST BE SET BEFORE
// slot 23611
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
// P20-P25.agc:1687
//		EXTEND			# COMING HERE.
// slot 23612
                if slot <> 23612 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23613 {
// P20-P25.agc:1688
//		WOR	CHAN12		# TURN ON ZERO RR CDU
// slot 23613
                    if slot <> 23613 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1689
//		TC	FIXDELAY
// slot 23614
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
// P20-P25.agc:1690
//		DEC	2
// slot 23615
    23615, 4
)).

// bank 25, slots 23616-23622
function agcAotUnit1551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23618 {
        if slot <= 23616 {
// P20-P25.agc:1691
//
// P20-P25.agc:1692
//		CAF	ZERO
// slot 23616
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
// P20-P25.agc:1693
//		TS	CDUT
// slot 23617
                if slot <> 23617 or instruction <> 22557 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22557, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1694
//		TS	CDUS
// slot 23618
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
// P20-P25.agc:1695
//		CS	ONE		# REMOVE ZEROING BIT.
// slot 23619
                if slot <> 23619 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1696
//		EXTEND
// slot 23620
                if slot <> 23620 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23621 {
// P20-P25.agc:1697
//		WAND	CHAN12
// slot 23621
                if slot <> 23621 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1698
//		TC	FIXDELAY
// slot 23622
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
// P20-P25.agc:1699
//		DEC	1000		# RESET FAIL INHIBIT IN 10 SECS. -- D.281
// slot 23623
    23623, 2000
)).

// bank 25, slots 23624-23628
function agcAotUnit1552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23625 {
        if slot <= 23624 {
// P20-P25.agc:1700
//
// P20-P25.agc:1701
//		CS	RCDU0BIT	# REMOVE ZEROING IN PROCESS BIT
// slot 23624
            if slot <> 23624 or instruction <> 18911 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:1702
//# Page 528
// P20-P25.agc:1703
//		MASK	RADMODES
// slot 23625
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
// P20-P25.agc:1704
//		TS	RADMODES
// slot 23626
            if slot <> 23626 or instruction <> 22600 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22600, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23627 {
// P20-P25.agc:1705
//
// P20-P25.agc:1706
//		CA	CDUT
// slot 23627
                if slot <> 23627 or instruction <> 12317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 29).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1707
//		TC	MAGSUB
// slot 23628
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
// P20-P25.agc:1708
//		DEC	-.5
// slot 23629
    23629, 49150
)).

// bank 25, slots 23630-23640
function agcAotUnit1553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23634 {
        if slot <= 23631 {
            if slot <= 23630 {
// P20-P25.agc:1709
//		TCF	+3		# IF MODE 2.
// slot 23630
                if slot <> 23630 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1710
//
// P20-P25.agc:1711
//		CAF	ZERO
// slot 23631
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
// P20-P25.agc:1712
//		TCF	+2
// slot 23632
                if slot <> 23632 or instruction <> 5202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5202, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23633 {
// P20-P25.agc:1713
//		CAF	ANTENBIT
// slot 23633
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
// P20-P25.agc:1714
//		XCH	RADMODES
// slot 23634
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
// P20-P25.agc:1715
//		MASK	-BIT12
// slot 23635
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
// P20-P25.agc:1716
//		ADS	RADMODES
// slot 23636
                    if slot <> 23636 or instruction <> 11336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1717
//
// P20-P25.agc:1718
//		TC	SETTRKF		# TRACKER LAMP MIGHT GO ON NOW.
// slot 23637
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
// P20-P25.agc:1719
//
// P20-P25.agc:1720
//		TC	RRRET		# DONE.
// slot 23638
                if slot <> 23638 or instruction <> 717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23639 {
// P20-P25.agc:1721
//
// P20-P25.agc:1722
//-BIT12		EQUALS	-1/8		# IN SPROOT
// P20-P25.agc:1723
//
// P20-P25.agc:1724
//# Page 529
// P20-P25.agc:1725
//# PROGRAM NAME:  DORREPOS
// P20-P25.agc:1726
//#
// P20-P25.agc:1727
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1728
//#
// P20-P25.agc:1729
//#	DORREPOS IS A SEQUENCE OF TASKS TO DRIVE THE RENDEZVOUS RADAR
// P20-P25.agc:1730
//#	TO A SAFE POSITION.  INIITALLY SETRRECR IS CALLED WHERE THE RR
// P20-P25.agc:1731
//#	ERROR COUNTERS (CHAN 12 BIT 2) ARE ENABLED AND LASTYCMD
// P20-P25.agc:1732
//#	AND LASTXCMD SET = 0 TO INDICATE THE DIFFERENCE BETWEEN THE
// P20-P25.agc:1733
//#	DESIRED STATE AND PRESENT STATE OF THE COMMANDS.  THE RR
// P20-P25.agc:1734
//#	TURN-ON FLAG (RADMODES BIT 1) IS CHECKED AND IF NOT PRESENT,
// P20-P25.agc:1735
//#	PROGRAM ALARM 00501 IS REQUESTED BEFORE CONTINUING.  IN EITHER
// P20-P25.agc:1736
//#	CASE, FOLLOWING A 20 MILLISECOND WAIT THE PROGRAM CHECKS THE CURRENT
// P20-P25.agc:1737
//#	RR ANTENNA MODE (RADMODES BIT 12).  RRTONLY IS THEN CALLED
// P20-P25.agc:1738
//#	TO DRIVE THE TRUNNION ANGLE TO 0 DEGREES IF IN MODE 1 AND TO 180
// P20-P25.agc:1739
//#	DEGREES IF IN MODE 2.  UPON RETURN, THE CURRENT RR ANTENNA
// P20-P25.agc:1740
//#	MODE (RADMODES BIT 12) IS AGAIN CHECKED.  RRSONLY IS THEN
// P20-P25.agc:1741
//#	CALLED TO DRIVE THE SHAFT ANGLE TO 0 DEGREES IF IN MODE 1 AND TO
// P20-P25.agc:1742
//#	-90 DEGREES IF IN MODE 2.  IF DURING RRTONLY OR RRSONLY A
// P20-P25.agc:1743
//#	REMODE HAS BEEN REQUESTED (RADMODES BIT 14), AND ALWAYS
// P20-P25.agc:1744
//#	FOLLOWING COMPLETION OF RRSONLY, CONTROL IS TRANFERRED TO
// P20-P25.agc:1745
//#	REPOSRPT.  HERE THE REPOSITION FLAG (RADMODES BIT 11) IS
// P20-P25.agc:1746
//#	REMOVED.  A CHECK IS THEN MADE ON THE DESIGNATE FLAG (RADMODES
// P20-P25.agc:1747
//#	BIT 10).  IF PRESENT, CONTROL IS TRANSFERRED TO BEGDES.  IF NOT PRESENT
// P20-P25.agc:1748
//#	INDICATING NO FURTHER ANTENNA CONTROL REQUIRED, THE RR ERROR
// P20-P25.agc:1749
//#	COUNTER BIT (CHAN 12 BIT 2) IS REMOVED AND THE ROUTINE EXITS TO
// P20-P25.agc:1750
//#	TASKOVER.
// P20-P25.agc:1751
//#
// P20-P25.agc:1752
//# CALLING SEQUENCE:
// P20-P25.agc:1753
//#
// P20-P25.agc:1754
//#	WAITLIST CALL FROM RRGIMON IF TRUNNION AND SHAFT CDU ANGLES
// P20-P25.agc:1755
//#	NOT WITHIN LIMITS OF CURRENT MODE.
// P20-P25.agc:1756
//#
// P20-P25.agc:1757
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:1758
//#
// P20-P25.agc:1759
//#	RADMODES
// P20-P25.agc:1760
//#
// P20-P25.agc:1761
//# SUBROUTINES CALLED
// P20-P25.agc:1762
//#
// P20-P25.agc:1763
//#	RRTONLY, RRSONLY, BEGDES (EXIT)
// P20-P25.agc:1764
//#
// P20-P25.agc:1765
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:1766
//#
// P20-P25.agc:1767
//#	NONE
// P20-P25.agc:1768
//#
// P20-P25.agc:1769
//# ALARMS:  NONE
// P20-P25.agc:1770
//#
// P20-P25.agc:1771
//# EXIT:  TASKOVER, BEGDES
// P20-P25.agc:1772
//
// P20-P25.agc:1773
//DORREPOS	TC	SETRRECR	# SET UP RR CDU ERROR COUNTERS.
// slot 23639
                    if slot <> 23639 or instruction <> 1134 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1134, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1774
//
// P20-P25.agc:1775
//# ALARM 501 DELETED IN DANCE 279 PER PCR 97.
// P20-P25.agc:1776
//
// P20-P25.agc:1777
//		TC	FIXDELAY
// slot 23640
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
// P20-P25.agc:1778
//		DEC	2
// slot 23641
    23641, 4
)).

// bank 25, slots 23642-23704
function agcAotUnit1554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23672 {
        if slot <= 23656 {
            if slot <= 23648 {
                if slot <= 23644 {
                    if slot <= 23642 {
// P20-P25.agc:1779
//
// P20-P25.agc:1780
//		CAF	ANTENBIT	# MANEUVER TRUNNION ANGLE TO NOMINAL POS.
// slot 23642
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
// P20-P25.agc:1781
//# Page 530
// P20-P25.agc:1782
//		MASK RADMODES
// slot 23643
                            if slot <> 23643 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1783
//		CCS	A
// slot 23644
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
// P20-P25.agc:1784
//		CAF	BIT15		# 0 FOR MODE 1 AND 180 FOR MODE 2.
// slot 23645
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
// P20-P25.agc:1785
//		TC	RRTONLY
// slot 23646
                            if slot <> 23646 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23647 {
// P20-P25.agc:1786
//
// P20-P25.agc:1787
//		CAF	ANTENBIT	# NOT PUT SHAFT IN RIGHT POSITION
// slot 23647
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
// P20-P25.agc:1788
//		MASK	RADMODES
// slot 23648
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
// P20-P25.agc:1789
//		CCS	A
// slot 23649
                            if slot <> 23649 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1790
//		CS	HALF		# -90 FOR MODE 2.
// slot 23650
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
// P20-P25.agc:1791
//		TC	RRSONLY
// slot 23651
                            if slot <> 23651 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1792
//
// P20-P25.agc:1793
//REPOSRPT	CS	REPOSBIT	# RETURNS HERE FROM RR1AXIS IN REMODE
// slot 23652
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
// P20-P25.agc:1794
//					# REQUESTED DURING REPOSITION.
// P20-P25.agc:1795
//		MASK	RADMODES	# REMOVE REPOSITION BIT.
// slot 23653
                            if slot <> 23653 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1796
//		TS	RADMODES
// slot 23654
                            if slot <> 23654 or instruction <> 22600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22600, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23655 {
// P20-P25.agc:1797
//		MASK	DESIGBIT	# SEE IF SOMEONE IS WAITING TO DESIGNATE.
// slot 23655
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
// P20-P25.agc:1798
//		CCS	A
// slot 23656
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
// P20-P25.agc:1799
//		TCF	BEGDES
// slot 23657
                            if slot <> 23657 or instruction <> 5499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5499, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1800
//		CS	BIT2		# IF NO FURTHER ANTENNA CONTROL REQUIRED,
// slot 23658
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
// P20-P25.agc:1801
//		EXTEND			# REMOVE ERROR COUNTER ENABLE.
// slot 23659
                            if slot <> 23659 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1802
//		WAND	CHAN12
// slot 23660
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
// P20-P25.agc:1803
//		TCF	TASKOVER
// slot 23661
                            if slot <> 23661 or instruction <> 6833 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6833, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1804
//
// P20-P25.agc:1805
//SETRRECR	CAF	BIT2		# SET UP RR ERROR COUNTERS
// slot 23662
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
// P20-P25.agc:1806
//		EXTEND
// slot 23663
                            if slot <> 23663 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1807
//		RAND	CHAN12
// slot 23664
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
// P20-P25.agc:1808
//		CCS	A		# DO NOT CLEAR LAST COMMAND IF
// slot 23665
                            if slot <> 23665 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1809
//		TC	Q		# ERROR COUNTERS ARE ENABLED
// slot 23666
                            if slot <> 23666 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23667 {
// P20-P25.agc:1810
//
// P20-P25.agc:1811
//		TS	LASTYCMD
// slot 23667
                            if slot <> 23667 or instruction <> 22602 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22602, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1812
//		TS	LASTXCMD
// slot 23668
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
// P20-P25.agc:1813
//		CAF	BIT2
// slot 23669
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
// P20-P25.agc:1814
//		EXTEND
// slot 23670
                            if slot <> 23670 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23671 {
// P20-P25.agc:1815
//		WOR	CHAN12		# ENABLE RR CDU ERROR COUNTERS.
// slot 23671
                            if slot <> 23671 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1816
//		TC	Q
// slot 23672
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
// P20-P25.agc:1817
//# Page 531
// P20-P25.agc:1818
//# PROGRAM NAME:  REMODE
// P20-P25.agc:1819
//#
// P20-P25.agc:1820
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:1821
//#
// P20-P25.agc:1822
//#	REMODE IS THE GENERAL REMODING SUBROUTINE.  IT DRIVES THE
// P20-P25.agc:1823
//#	TRUNNION ANGLE TO 0 DEGREES IF THE CURRENT MODE IS MODE 1,
// P20-P25.agc:1824
//#	180 DEGREES FOR MODE 2, THEN DRIVES THE SHAFT ANGLE TO -45
// P20-P25.agc:1825
//#	DEGREES, AND FINALLY DRIVES THE TRUNNION ANGLE TO -130 DEGREES,
// P20-P25.agc:1826
//#	TO PLACE THE RR IN MODE 2, -50 DEGREES FOR MODE 1, BEFORE
// P20-P25.agc:1827
//#	INITIATING 2-AXIS CONTROL.  ALL REMODING IS DONE WITH SINGLE
// P20-P25.agc:1828
//#	AXIS ROTATIONS (RR1AXIS).  INITIALLY THE RR ANTENNA MODE FLAG
// P20-P25.agc:1829
//#	(RADMODES BIT 12) IS CHECKED.  CONTROL IS THEN TRANSFERRED TO
// P20-P25.agc:1830
//#	RRTONLY TO DRIVE THR TRUNNION ANGLE TO 0 DEGREES IF IN MODE 1
// P20-P25.agc:1831
//#	OR 180 DEGREES IF IN MODE 2.  RRSONLY IS THEN CALLED TO DRIVE
// P20-P25.agc:1832
//#	THE SHAFT ANGLE TO -45 DEGREES. THE RR ANTENNA MODE FLAG
// P20-P25.agc:1833
//#	(RADMODES BIT 12) IS CHECKED AGAIN.  CONTROL IS AGAIN
// P20-P25.agc:1834
//#	TRANSFERRED TO RRTONLY TO DRIVE THE TRUNNION ANGLE TO -130
// P20-P25.agc:1835
//#	DEGREES TO PLACE THE RR IN MODE 2 IF CURRENTLY IN MODE 1 OR TO
// P20-P25.agc:1836
//#	-50 DEGREES IF IN MODE 2 TO PLACE THE RR IN MODE 1.  RMODINV
// P20-P25.agc:1837
//#	IS THEN CALLED TO SET RADMODES BIT 12 TO INDICATE THE NEW
// P20-P25.agc:1838
//#	RR ANTENNA MODE.  THE REMODE FLAG (RADMODES BIT 14)
// P20-P25.agc:1839
//#	IS REMOVED TO INDICATE THAT REMODING IS COMPLETE.  THE PROGRAM
// P20-P25.agc:1840
//#	THEN EXITS TO STDESIG TO BEGIN 2-AXIS CONTROL.
// P20-P25.agc:1841
//#
// P20-P25.agc:1842
//# CALLIN SEQUENCE:
// P20-P25.agc:1843
//#
// P20-P25.agc:1844
//#	FROM BEGDES WHEN REMODE FLAG (RADMODES BIT 14) IS SET.
// P20-P25.agc:1845
//#	THIS FLAG MAY BE SET IN RRDESSM AND RRDESNB IF RRLIMCHK
// P20-P25.agc:1846
//#	DETERMINES THAT THE DESIRED ANGLES ARE WITHIN THE LIMITS OF THE
// P20-P25.agc:1847
//#	OTHER MODE.
// P20-P25.agc:1848
//#
// P20-P25.agc:1849
//# ERASABLE INIITIALIZATION REQUIRED:
// P20-P25.agc:1850
//#
// P20-P25.agc:1851
//#	RADMODES
// P20-P25.agc:1852
//#
// P20-P25.agc:1853
//# SUBROUTINES CALLED:
// P20-P25.agc:1854
//#
// P20-P25.agc:1855
//#	RRTONLY, RRSONL, RMODINV (ACTUALLY PART OF)
// P20-P25.agc:1856
//#
// P20-P25.agc:1857
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:1858
//#
// P20-P25.agc:1859
//#	NONE
// P20-P25.agc:1860
//#
// P20-P25.agc:1861
//# ALARMS:  NONE
// P20-P25.agc:1862
//#
// P20-P25.agc:1863
//# EXIT:  STDESIG
// P20-P25.agc:1864
//
// P20-P25.agc:1865
//REMODE		CAF	ANTENBIT	# DRIVE TRUNNION TO 0 (180)
// slot 23673
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
// P20-P25.agc:1866
//		MASK	RADMODES	# (ERROR COUNTER ALREADY ENABLED)
// slot 23674
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
// P20-P25.agc:1867
//		CCS	A
// slot 23675
                            if slot <> 23675 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1868
//		CAF	BIT15
// slot 23676
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
// P20-P25.agc:1869
//		TC	RRTONLY
// slot 23677
                            if slot <> 23677 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1870
//
// P20-P25.agc:1871
//		CAF	-45DEGSR
// slot 23678
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
// P20-P25.agc:1872
//		TC	RRSONLY
// slot 23679
                            if slot <> 23679 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1873
//# Page 532
// P20-P25.agc:1874
//		CS	RADMODES
// slot 23680
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
// P20-P25.agc:1875
//		MASK	ANTENBIT
// slot 23681
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
// P20-P25.agc:1876
//		CCS	A
// slot 23682
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
// P20-P25.agc:1877
//		CAF	-80DEGSR	# GO TO T = -130 (-50).
// slot 23683
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
// P20-P25.agc:1878
//		AD	-50DEGSR
// slot 23684
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
// P20-P25.agc:1879
//		TC	RRTONLY
// slot 23685
                            if slot <> 23685 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1880
//
// P20-P25.agc:1881
//		CS	RADMODES
// slot 23686
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
// P20-P25.agc:1882
//		MASK	ANTENBIT
// slot 23687
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
// P20-P25.agc:1883
//		CCS	A
// slot 23688
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
// P20-P25.agc:1884
//		CAF	BIT15		# GO TO T = -180 (+0).
// slot 23689
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
// P20-P25.agc:1885
//		TC	RRTONLY
// slot 23690
                            if slot <> 23690 or instruction <> 1185 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1185, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23691 {
// P20-P25.agc:1886
//
// P20-P25.agc:1887
//		CS	RADMODES 	# GO TO S = -90 (+0).
// slot 23691
                            if slot <> 23691 or instruction <> 16456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 72).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1888
//		MASK	ANTENBIT
// slot 23692
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
// P20-P25.agc:1889
//		CCS	A
// slot 23693
                            if slot <> 23693 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1890
//		CS	HALF
// slot 23694
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
// P20-P25.agc:1891
//		TC	RRSONLY
// slot 23695
                            if slot <> 23695 or instruction <> 1188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1892
//
// P20-P25.agc:1893
//		TC	RMODINV
// slot 23696
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
// P20-P25.agc:1894
//
// P20-P25.agc:1895
//		CS	REMODBIT	# END OF REMODE.
// slot 23697
                            if slot <> 23697 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1896
//		MASK	RADMODES
// slot 23698
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
// P20-P25.agc:1897
//		TS	RADMODES
// slot 23699
                            if slot <> 23699 or instruction <> 22600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22600, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1898
//
// P20-P25.agc:1899
//		CAF	DESIGBIT	# WAS REMODE CALLED DURING DESIGNATE?
// slot 23700
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
// P20-P25.agc:1900
//		MASK	RADMODES	# (BIT10 RADMODES = 1)
// slot 23701
                            if slot <> 23701 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1901
//		EXTEND
// slot 23702
                            if slot <> 23702 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 23703 {
// P20-P25.agc:1902
//		BZF	RGOODEND	# NO -- RETURN TO CALLER WAITING IN RADSTALL
// slot 23703
                            if slot <> 23703 or instruction <> 5997 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5997, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:1903
//		TC	STDESIG		# YES -- RETURN TO DESIGNATE
// slot 23704
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
// P20-P25.agc:1904
//-45DEGSR	=	13,14,15
// P20-P25.agc:1905
//-50DEGSR	DEC	-.27778
// slot 23705
    23705, 56432,
// P20-P25.agc:1906
//-80DEGSR	DEC	-.44444
// slot 23706
    23706, 50970
)).

// bank 25, slots 23707-23722
function agcAotUnit1555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23714 {
        if slot <= 23710 {
            if slot <= 23708 {
                if slot <= 23707 {
// P20-P25.agc:1907
//
// P20-P25.agc:1908
//RMODINV		LXCH	RADMODES	# INVERT THE MODE STATUS.
// slot 23707
                    if slot <> 23707 or instruction <> 9288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 72, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1909
//		CAF	ANTENBIT
// slot 23708
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
// P20-P25.agc:1910
//		EXTEND
// slot 23709
                    if slot <> 23709 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1911
//		RXOR	LCHAN
// slot 23710
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
// P20-P25.agc:1912
//		TS	RADMODES
// slot 23711
                    if slot <> 23711 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1913
//		TC	Q
// slot 23712
                    if slot <> 23712 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23713 {
// P20-P25.agc:1914
//
// P20-P25.agc:1915
//# Page 533
// P20-P25.agc:1916
//# PROGRAM NAMES:	RRTONLY, RRSONLY
// P20-P25.agc:1917
//#
// P20-P25.agc:1918
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:1919
//#
// P20-P25.agc:1920
//# 	RRTONLY AND RRSONLY ARE SUBROUTINES FOR DOING SINGLE AXIS
// P20-P25.agc:1921
//#	RR MANEUVERS FOR REMODE AND REPOSITION.  IT DRIVES TO
// P20-P25.agc:1922
//#	WITHIN 1 DEGREE.  INITIALLY, AT RR1AX2, THE REMODE AND REPOSITION
// P20-P25.agc:1923
//#	FLAGS (RADMODES BITS 14, 11) ARE CHECKED.  IF BOTH EXIST,
// P20-P25.agc:1924
//#	THE PROGRAM EXITS TO REPOSRPT (SEE DORREPOS).  THIS INDICATES
// P20-P25.agc:1925
//#	THAT SOMEONE POSSIBLY REQUESTED A DESIGNATE (RADMODES BIT 10)
// P20-P25.agc:1926
//#	WHICH REQUIRES A REMODE (RADMODES BIT 14) AND THAT A
// P20-P25.agc:1927
//#	REPOSITION IS IN PROGRESS (RADMODES BIT 11).  IF NONE
// P20-P25.agc:1928
//# 	OR ONLY ONE OF THE FLAGS EXIST, REMODE OR REPOSITION, MAGSUB
// P20-P25.agc:1929
//#	IS CALLED TO SEE IF THE APPROPRIATE ANGLE IS WITHIN 1 DEGREE.  IF YES,
// P20-P25.agc:1930
//#	CONTROL RETURNS TO THE CALLING ROUTINE.  IF NOT, CONTROL IS
// P20-P25.agc:1931
//#	TRANSFERRED TO RROUT FOR SINGLE AXIS MANEUVERS WITH THE OTHER
// P20-P25.agc:1932
//#	ANGLE SET = 0.  FOLLOWING A .5 SECOND WAIT, THE ABOVE PROCEDURE IS
// P20-P25.agc:1933
//#	REPEATED.
// P20-P25.agc:1934
//#
// P20-P25.agc:1935
//# CALLING SEQUENCE:	L-1	CAF	*ANGLE*		(DESIRED ANGLE SCALED PI)
// P20-P25.agc:1936
//#			L	TC	RRTONLY		(TRUNNION ONLY)
// P20-P25.agc:1937
//#			RRSONLY				(SHAFT ONLY)
// P20-P25.agc:1938
//#			RRTONLY IS CALLED BY PREPOS29;
// P20-P25.agc:1939
//#			RRTONLY AND RRSONLY ARE CALLED BY DORREPOS AND REMODE
// P20-P25.agc:1940
//#
// P20-P25.agc:1941
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:1942
//#
// P20-P25.agc:1943
//#	C(A) = DESIRED ANGLE, RADMODES
// P20-P25.agc:1944
//#
// P20-P25.agc:1945
//# SUBROUTINES CALLED:
// P20-P25.agc:1946
//#
// P20-P25.agc:1947
//#	FIXDELAY, REPOSRPT, MAGSUB, RROUT
// P20-P25.agc:1948
//#
// P20-P25.agc:1949
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:1950
//#
// P20-P25.agc:1951
//#	NONE
// P20-P25.agc:1952
//#
// P20-P25.agc:1953
//# ALARMS:  NONE
// P20-P25.agc:1954
//#
// P20-P25.agc:1955
//# EXIT:	REPOSRPT (REMODE AND REPOSITION FLAGS PRESENT -- RADMODES
// P20-P25.agc:1956
//#	BITS 14, 11)
// P20-P25.agc:1957
//#	L+1 (ANGLE WITHIN ONE DEGREE OR RR OUT OF AUTO MODE)
// P20-P25.agc:1958
//
// P20-P25.agc:1959
//RRTONLY		TS	RDES		# DESIRED TRUNNION ANGLE.
// slot 23713
                    if slot <> 23713 or instruction <> 23246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23246, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1960
//		CAF	ZERO
// slot 23714
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
// P20-P25.agc:1961
//		TCF	RR1AXIS
// slot 23715
                    if slot <> 23715 or instruction <> 5286 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5286, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1962
//
// P20-P25.agc:1963
//RRSONLY		TS	RDES		# SHAFT COMMANDS ARE UNRESOLVED SINCE THIS
// slot 23716
                    if slot <> 23716 or instruction <> 23246 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23246, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23717 {
// P20-P25.agc:1964
//		CAF	ONE		# ROUTINE ENTERED ONLY WHEN T = 0 OR 180.
// slot 23717
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
// P20-P25.agc:1965
//
// P20-P25.agc:1966
//RR1AXIS		TS	RRINDEX
// slot 23718
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
// P20-P25.agc:1967
//		EXTEND
// slot 23719
                    if slot <> 23719 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1968
//		QXCH	RRRET
// slot 23720
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
// P20-P25.agc:1969
//		TCF	RR1AX2
// slot 23721
                    if slot <> 23721 or instruction <> 5292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:1970
//
// P20-P25.agc:1971
//# Page 534
// P20-P25.agc:1972
//NXTRR1AX	TC	FIXDELAY
// slot 23722
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
// P20-P25.agc:1973
//		DEC	50		# 2 SAMPLES PER SECOND.
// slot 23723
    23723, 100
)).

// bank 25, slots 23724-23730
function agcAotUnit1556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23726 {
        if slot <= 23724 {
// P20-P25.agc:1974
//
// P20-P25.agc:1975
//RR1AX2		CS	RADMODES	# IF SOMEONE REQUESTS A DESIGNATE WHICH
// slot 23724
            if slot <> 23724 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23725 {
// P20-P25.agc:1976
//		MASK	PRIO22		# REQUIRES A REMODE AND A REPOSITION IS IN
// slot 23725
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
// P20-P25.agc:1977
//		EXTEND			# PROGRESS, INTERRUPT IT AND START THE
// slot 23726
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
// P20-P25.agc:1978
//		BZF	REPOSRPT	# REMODE IMMEDIATELY.
// slot 23727
                if slot <> 23727 or instruction <> 5220 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5220, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1979
//
// P20-P25.agc:1980
//		CA	RDES
// slot 23728
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
// P20-P25.agc:1981
//		EXTEND
// slot 23729
                if slot <> 23729 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1982
//		INDEX	RRINDEX
// slot 23730
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
// P20-P25.agc:1983
//		MSU	CDUT
// slot 23731
    23731, 16442
)).

// bank 25, slots 23732-23738
function agcAotUnit1557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23734 {
        if slot <= 23732 {
// P20-P25.agc:1984
//		TS	ITEMP1		# SAVE ERROR SIGNAL.
// slot 23732
            if slot <> 23732 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23733 {
// P20-P25.agc:1985
//		EXTEND
// slot 23733
                if slot <> 23733 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1986
//		MP	RRSPGAIN	# TRIES TO NULL .7 OF ERROR OVER NEXT .5
// slot 23734
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
// P20-P25.agc:1987
//		TS	L
// slot 23735
                if slot <> 23735 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1988
//		CA	RADMODES
// slot 23736
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
// P20-P25.agc:1989
//		MASK	AUTOMBIT
// slot 23737
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
// P20-P25.agc:1990
//		XCH	ITEMP1		# STORE RR-OUT-OF-AUTO-MODE BIT.
// slot 23738
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

// bank 25, slots 23739-23739
function agcAotUnit1558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:1991
//		TC	MAGSUB		# SEE IF WITHIN ONE DEGREE.
// slot 23739
    if slot <> 23739 or instruction <> 2378 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2378, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1558] to agcAotUnit1558@.

agcAotInstallSourceRope(list(
// P20-P25.agc:1992
//		DEC	-.00555		# SCALED IN HALF-REVS.
// slot 23740
    23740, 65352
)).

// bank 25, slots 23741-23748
function agcAotUnit1559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23744 {
        if slot <= 23742 {
            if slot <= 23741 {
// P20-P25.agc:1993
//
// P20-P25.agc:1994
//		CCS	ITEMP1		# NO.  IF RR OUT OF AUTO MODE, EXIT.
// slot 23741
                if slot <> 23741 or instruction <> 4145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 49).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1995
//		TC	RRRET		# RETURN TO CALLER.
// slot 23742
                if slot <> 23742 or instruction <> 717 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 717, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23743 {
// P20-P25.agc:1996
//
// P20-P25.agc:1997
//		CCS	RRINDEX		# COMMAND FOR OTHER AXIS IS ZERO.
// slot 23743
                if slot <> 23743 or instruction <> 4815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 719).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:1998
//		TCF	+2		# SETTING A TO 0.
// slot 23744
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
// P20-P25.agc:1999
//		XCH	L
// slot 23745
                if slot <> 23745 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2000
//		DXCH	TANG
// slot 23746
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
// P20-P25.agc:2001
//
// P20-P25.agc:2002
//		TC	RROUT
// slot 23747
                if slot <> 23747 or instruction <> 1222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2003
//
// P20-P25.agc:2004
//		TCF	NXTRR1AX	# COME BACK IN .5 SECONDS.
// slot 23748
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
// P20-P25.agc:2005
//
// P20-P25.agc:2006
//RRSPGAIN	DEC	.59062		# NULL .7 ERROR IN .5 SEC.
// slot 23749
    23749, 19354
)).

// bank 25, slots 23750-23753
function agcAotUnit1560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23751 {
        if slot <= 23750 {
// P20-P25.agc:2007
//
// P20-P25.agc:2008
//# Page 535
// P20-P25.agc:2009
//# PROGRAM NAME:  RROUT
// P20-P25.agc:2010
//#
// P20-P25.agc:2011
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:2012
//#
// P20-P25.agc:2013
//#	RROUT RECEIVES RR GYRO COMMANDS IN TANG, TANG +1 IN RR
// P20-P25.agc:2014
//#	ERROR COUNTER SCALING.  RROUT THEN LIMITS THEM AND
// P20-P25.agc:2015
//#	GENERATES COMMANDS TO THE CDU TO ADJUST THE ERROR COUNTERS
// P20-P25.agc:2016
//#	TO THE DESIRED VALUES.  INITIALLY MAGSUB CHECKS THE MAGNITUDE OF
// P20-P25.agc:2017
//#	THE COMMAND (SHAFT ON 1ST PASS) TO SEE IF IT IS GREATER THAN
// P20-P25.agc:2018
//#	384 PULSES.  IF NOT, CONTROL IS TRANFERRED TO RROUTLIM TO
// P20-P25.agc:2019
//#	LIMIT THE COMMAND TO +384 OR -384 PULSES.  THE DIFFERENCE IS
// P20-P25.agc:2020
//#	THEN CALCULATED BETWEEN THE DESIRED STATE AND TEH PRESENT STATE OF
// P20-P25.agc:2021
//#	THE ERROR COUNTER AS RECORDED IN LASTYCMD AND LASTXCMD.
// P20-P25.agc:2022
//#	THE RESULT IS STORED IN OPTXCMD (1ST PASS) AND OPTYCMD (2ND
// P20-P25.agc:2023
//#	PASS).  FOLLOWING THE SECOND PASS, FOR THE TRUNNION COMMAND, THE
// P20-P25.agc:2024
//#	OCDUT AND OCDUS ERROR COUNTER DRIVE BITS (CHAN 14 BITS 12, 11)
// P20-P25.agc:2025
//#	ARE SET.  THIS PROGRAM THEN EXITS TO THE CALLING PROGRAM.
// P20-P25.agc:2026
//#
// P20-P25.agc:2027
//# CALLING SEQUENCE:
// P20-P25.agc:2028
//#
// P20-P25.agc:2029
//#	L TC RROUT (WITH RUPT INHIBITED) RROUT IS CALLED BY
// P20-P25.agc:2030
//#	RRTONLY, RRSONLY, AND DODES
// P20-P25.agc:2031
//#
// P20-P25.agc:2032
//# ERASABLE INITIALIZATION REQURIED:
// P20-P25.agc:2033
//#
// P20-P25.agc:2034
//#	TANG, TANG +1 (DESIRED COMMANDS), LASTYCMD, LASTXCMD
// P20-P25.agc:2035
//#	(1ST PASS = 0), RR ERROR COUNTER ENAGLE SET (CHAN 12 BIT 2).
// P20-P25.agc:2036
//#
// P20-P25.agc:2037
//# SUBROUTINES CALLED:
// P20-P25.agc:2038
//#
// P20-P25.agc:2039
//#	MAGSUB
// P20-P25.agc:2040
//#
// P20-P25.agc:2041
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:2042
//#
// P20-P25.agc:2043
//#	NONE
// P20-P25.agc:2044
//#
// P20-P25.agc:2045
//# ALARMS:  NONE
// P20-P25.agc:2046
//#
// P20-P25.agc:2047
//# EXIT:  L+1 (ALWAYS)
// P20-P25.agc:2048
//
// P20-P25.agc:2049
//RROUT		LXCH	Q		# SAVE RETURN
// slot 23750
            if slot <> 23750 or instruction <> 9218 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 2, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2050
//		CAF	ONE		# LOOP TWICE.
// slot 23751
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
// P20-P25.agc:2051
//RROUT2		TS	ITEMP2
// slot 23752
            if slot <> 23752 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2052
//		INDEX	A
// slot 23753
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
// P20-P25.agc:2053
//		CA	TANG
// slot 23754
    23754, 25742
)).

// bank 25, slots 23755-23756
function agcAotUnit1561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23755 {
// P20-P25.agc:2054
//		TS	ITEMP1		# SAVE SIGN COMMAND FOR LIMITING.
// slot 23755
        if slot <> 23755 or instruction <> 22577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22577, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:2055
//
// P20-P25.agc:2056
//		TC	MAGSUB		# SEE IF WITHIN LIMITS.
// slot 23756
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
// P20-P25.agc:2057
//-RRLIMIT	DEC	-384
// slot 23757
    23757, 64766
)).

// bank 25, slots 23758-23760
function agcAotUnit1562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23758 {
// P20-P25.agc:2058
//		TCF	RROUTLIM	# LIMIT COMMAND TO MAG OF 384.
// slot 23758
        if slot <> 23758 or instruction <> 5341 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5341, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23759 {
// P20-P25.agc:2059
//
// P20-P25.agc:2060
//SETRRCTR	CA	ITEMP1		# COUNT OUT DIFFERENCE BETWEEN DESIRED
// slot 23759
            if slot <> 23759 or instruction <> 12337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 49).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2061
//		INDEX	ITEMP2		# STATE AND PRESENT STATE AS RECORDED IN
// slot 23760
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
// P20-P25.agc:2062
//		XCH	LASTYCMD	# LASTYCMD AND LASTXCMD
// slot 23761
    23761, 47252
)).

// bank 25, slots 23762-23765
function agcAotUnit1563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23763 {
        if slot <= 23762 {
// P20-P25.agc:2063
//		COM
// slot 23762
            if slot <> 23762 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2064
//# Page 536
// P20-P25.agc:2065
//		AD	ITEMP1
// slot 23763
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
// P20-P25.agc:2066
//		AD	NEG0		# PREVENT +0 IN OUTCOUNTER
// slot 23764
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
// P20-P25.agc:2067
//		INDEX	ITEMP2
// slot 23765
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
// P20-P25.agc:2068
//		TS	CDUTCMD
// slot 23766
    23766, 45142
)).

// bank 25, slots 23767-23789
function agcAotUnit1564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23777 {
        if slot <= 23771 {
            if slot <= 23768 {
                if slot <= 23767 {
// P20-P25.agc:2069
//
// P20-P25.agc:2070
//		CCS	ITEMP2		# PROCESS BOTH INPUTS.
// slot 23767
                    if slot <> 23767 or instruction <> 4146 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2071
//		TCF	RROUT2
// slot 23768
                    if slot <> 23768 or instruction <> 5320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5320, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23769 {
// P20-P25.agc:2072
//
// P20-P25.agc:2073
//		CAF	PRIO6		# ENABLE COUNTERS.
// slot 23769
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
// P20-P25.agc:2074
//		EXTEND
// slot 23770
                        if slot <> 23770 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2075
//		WOR	CHAN14		# PUT ON CDU DRIVES S AND T
// slot 23771
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
// P20-P25.agc:2076
//		TC	L		# RETURN.
// slot 23772
                    if slot <> 23772 or instruction <> 1 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23773 {
// P20-P25.agc:2077
//
// P20-P25.agc:2078
//RROUTLIM	CCS	ITEMP1		# LIMIT COMMAND TO ABS VAL OF 384.
// slot 23773
                        if slot <> 23773 or instruction <> 4145 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 49).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2079
//		CS	-RRLIMIT
// slot 23774
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
// P20-P25.agc:2080
//		TCF	+2
// slot 23775
                    if slot <> 23775 or instruction <> 5345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23776 {
// P20-P25.agc:2081
//		CA	-RRLIMIT
// slot 23776
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
// P20-P25.agc:2082
//		TS	ITEMP1
// slot 23777
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
// P20-P25.agc:2083
//		TCF	SETRRCTR +1
// slot 23778
                    if slot <> 23778 or instruction <> 5328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5328, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23779 {
// P20-P25.agc:2084
//
// P20-P25.agc:2085
//# Page 537
// P20-P25.agc:2086
//# ROUTINE TO ZERO THE RR CDUS AND DETERMINE THE ANTENNA MODE.
// P20-P25.agc:2087
//
// P20-P25.agc:2088
//RRZERO		CAF	BIT11+1		# SEE IF MONITOR REPOSITION OR NOT IN AUTO
// slot 23779
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
// P20-P25.agc:2089
//		MASK	RADMODES	# IF SO, DON'T RE-ZERO CDUS.
// slot 23780
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
// P20-P25.agc:2090
//		CCS	A
// slot 23781
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
// P20-P25.agc:2091
//		TCF	RADNOOP		# (IMMEDIATE TASK TO RGOODEND).
// slot 23782
                        if slot <> 23782 or instruction <> 5976 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5976, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2092
//
// P20-P25.agc:2093
//		INHINT
// slot 23783
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
// P20-P25.agc:2094
//		CS	RCDU0BIT	# SET FLAG TO SHOW ZEROING IN PROGRESS.
// slot 23784
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
// P20-P25.agc:2095
//		MASK	RADMODES
// slot 23785
                        if slot <> 23785 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2096
//		AD	RCDU0BIT
// slot 23786
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
// P20-P25.agc:2097
//		TS	RADMODES
// slot 23787
                    if slot <> 23787 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23788 {
// P20-P25.agc:2098
//
// P20-P25.agc:2099
//		CAF	ONE
// slot 23788
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
// P20-P25.agc:2100
//		TC	WAITLIST
// slot 23789
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
// P20-P25.agc:2101
//		EBANK=	LOSCOUNT
// P20-P25.agc:2102
//		2CADR	RRZ2
// slot 23790 23791
    23790, 2544, 23791, 43118
)).

// bank 25, slots 23792-23796
function agcAotUnit1565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23793 {
        if slot <= 23792 {
// P20-P25.agc:2103
//
// P20-P25.agc:2104
//		CS	RADMODES	# SEE IF IN AUTO MODE.
// slot 23792
            if slot <> 23792 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2105
//		MASK	AUTOMBIT
// slot 23793
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
// P20-P25.agc:2106
//		CCS	A
// slot 23794
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
// P20-P25.agc:2107
//		TCF	ROADBACK
// slot 23795
                if slot <> 23795 or instruction <> 5366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2108
//		TC	ALARM		# AUTO DISCRETE NOT PRESENT -- TRYING
// slot 23796
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
// P20-P25.agc:2109
//		OCT	510
// slot 23797
    23797, 656
)).

// bank 25, slots 23798-23801
function agcAotUnit1566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23799 {
        if slot <= 23798 {
// P20-P25.agc:2110
//ROADBACK	RELINT
// slot 23798
            if slot <> 23798 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2111
//		TCF	SWRETURN
// slot 23799
            if slot <> 23799 or instruction <> 6553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6553, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23800 {
// P20-P25.agc:2112
//
// P20-P25.agc:2113
//RRZ2		TC	RRZEROSB	# COMMON TO TURNON AND RRZERO.
// slot 23800
            if slot <> 23800 or instruction <> 1081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2114
//		TCF	ENDRADAR
// slot 23801
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
// P20-P25.agc:2115
//
// P20-P25.agc:2116
//BIT11+1		OCT	02001
// slot 23802
    23802, 2050,
// P20-P25.agc:2117
//
// P20-P25.agc:2118
//# Page 538
// P20-P25.agc:2119
//# PROGRAM NAME:  RRDESSM
// P20-P25.agc:2120
//#
// P20-P25.agc:2121
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:2122
//#
// P20-P25.agc:2123
//# 	THIS INTERPRETIVE ROUTINE WILL DESIGNATE, IF DESIRED ANGLES ARE
// P20-P25.agc:2124
//#	WITHIN THE LIMITS OF EITHER MODE, TO A LINE-OF-SIGHT (LOS) VECTOR
// P20-P25.agc:2125
//#	(HALF-UNIT) KNOWN WITH RESPECT TO THE STABLE MEMBER PRESENT
// P20-P25.agc:2126
//#	ORIENTATION.  INITIALLY THE IMU CDU'S ARE READ AND CONTROL
// P20-P25.agc:2127
//#	TRANSFERRED TO SMNB TO TRANSFORM THE LOS VECTOR FROM STABLE
// P20-P25.agc:2128
//#	MEMBER TO NAVIGATION BASE COORDINATES (SEE STG MEMO 699)
// P20-P25.agc:2129
//#	RRANGLES IS THEN CALLED TO CALCULATE THE RR GIMBAL ANGLES,
// P20-P25.agc:2130
//#	TRUNNION AND SHAFT, FOR BOT THE PRESENT AND ALTERNATE MODE.
// P20-P25.agc:2131
//#	RRLIMCHK IS CALLED TO SEE IF THE ANGLES CALCULATED FOR THE
// P20-P25.agc:2132
//#	PRESENT MODE ARE WITHIN LIMITS.  IF WITHIN LIMITS, THE RETUREN
// P20-P25.agc:2133
//#	LOCATION IS INCREMENTED, INASMUCH AS NO VEHICLE MANEUVER IS
// P20-P25.agc:2134
//#	REQUIRED, BEFORE EXITING TO STARTDES.  IF NOT WITHIN THE LIMITS OF THE
// P20-P25.agc:2135
//#	CURRENT MODE, TRYSWS IS CALLED.  FOLLOWING INVERTING OF THE RR
// P20-P25.agc:2136
//#	ANTENNA MODE FLAG (RADMODES BIT 12), RRLIMCHK IS CALLED
// P20-P25.agc:2137
//#	TO SEE IF THE ANGLES CALCULATED FOR THE ALTERNATE MODE ARE WITHIN
// P20-P25.agc:2138
//#	LIMITS.  IF YES, THE RR ANTENNA MODE FLAG IS AGAIN INVERTED,
// P20-P25.agc:2139
//#	THE REMODE FLAG (RADMODES BIT 14) SET, AND THE RETURN LOCATION
// P20-P25.agc:2140
//#	INCREMENTED, TO INDICATE NO VEHICLE MANEUVER IS REQUIRED, BEFORE
// P20-P25.agc:2141
//#	EXITING TO STARTDES.  IF THESE ANGLES ARE NOT WITHIN LIMITS
// P20-P25.agc:2142
//#	OF THE ALTERNATE MODE, THE RR ANTENNA MODE FLAG (RADMODES
// P20-P25.agc:2143
//#	BIT 12) IS INVERTED BEFORE RETURNING DIRECTLY TO THE CALLING PROGRAM
// P20-P25.agc:2144
//# 	TO INDICATE THAT A VEHICLE MANEUVER IS REQUIRED.
// P20-P25.agc:2145
//#
// P20-P25.agc:2146
//# CALLING SEQUENCE:
// P20-P25.agc:2147
//#
// P20-P25.agc:2148
//#	L	STCALL	RRTARGET	(LOS HALF-UNIT VECTOR IN SM COORDINATES)
// P20-P25.agc:2149
//#	L+1	RRDESM
// P20-P25.agc:2150
//#	L+2	BASIC			(VEHICLE MANEUVER REQUIRED)
// P20-P25.agc:2151
//#	L+3	BASIC			(NO VEHICLE MANEUVER REQUIRED)
// P20-P25.agc:2152
//#
// P20-P25.agc:2153
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:2154
//#
// P20-P25.agc:2155
//#	RRTARGET, RADMODES
// P20-P25.agc:2156
//#
// P20-P25.agc:2157
//# SUBROUTINES CALLED:
// P20-P25.agc:2158
//#
// P20-P25.agc:2159
//#	READCDUS, SMNB, RRANGLES, RRLIMCHK, TRYSWS (ACTUALLY
// P20-P25.agc:2160
//#	PART OF), RMODINV
// P20-P25.agc:2161
//#
// P20-P25.agc:2162
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:2163
//#
// P20-P25.agc:2164
//#	NONE
// P20-P25.agc:2165
//#
// P20-P25.agc:2166
//# ALARMS:  NONE
// P20-P25.agc:2167
//#
// P20-P25.agc:2168
//# EXIT:  L+2 (NEITHER SET OF ANGLES ARE WITHIN LIMITS OF RELATED MODE)
// P20-P25.agc:2169
//# STARTDES (DESIGNATE POSSIBLE AT PRESENT VEHICLES ATTITUDE -- RETURNS
// P20-P25.agc:2170
//# TO L+3 FROM STARTDES)
// P20-P25.agc:2171
//
// P20-P25.agc:2172
//RRDESSM		STQ	CLEAR
// slot 23803
    23803, 35872,
// P20-P25.agc:2173
//			DESRET
// slot 23804
    23804, 1174,
// P20-P25.agc:2174
//# Page 539
// P20-P25.agc:2175
//			RRNBSW
// slot 23805
    23805, 370,
// P20-P25.agc:2176
//		CALL			# COMPUTES SINES AND COSINES, ORDER Y Z X
// slot 23806
    23806, 65320,
// P20-P25.agc:2177
//			CDUTRIG
// slot 23807
    23807, 40638,
// P20-P25.agc:2178
//		VLOAD	CALL		# LOAD VECTOR AND CALL TRANSFORMATION
// slot 23808
    23808, 38138,
// P20-P25.agc:2179
//			RRTARGET
// slot 23809
    23809, 1156,
// P20-P25.agc:2180
//			*SMNB*
// slot 23810
    23810, 40818,
// P20-P25.agc:2181
//
// P20-P25.agc:2182
//		CALL			# GET RR GIMBAL ANGLES IN PRESENT AND
// slot 23811
    23811, 65320,
// P20-P25.agc:2183
//			RRANGLES	# ALTERNATE MODE.
// slot 23812
    23812, 22710,
// P20-P25.agc:2184
//		EXIT
// slot 23813
    23813, 65532
)).

// bank 25, slots 23814-23815
function agcAotUnit1567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23814 {
// P20-P25.agc:2185
//
// P20-P25.agc:2186
//		INHINT
// slot 23814
        if slot <> 23814 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:2187
//		TC	RRLIMCHK
// slot 23815
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
// P20-P25.agc:2188
//		ADRES	MODEA		# CONFIGURATION FOR CURRENT MODE.
// slot 23816
    23816, 1166
)).

// bank 25, slots 23817-23843
function agcAotUnit1568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23829 {
        if slot <= 23822 {
            if slot <= 23819 {
                if slot <= 23817 {
// P20-P25.agc:2189
//		TC	+3		# NOT IN CURRENT MODE
// slot 23817
                    if slot <> 23817 or instruction <> 1292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23818 {
// P20-P25.agc:2190
//OKDESSM		INCR	DESRET		# INCREMENT SAYS NO VEHICLE MANEUVER REQ.
// slot 23818
                        if slot <> 23818 or instruction <> 10827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 587).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2191
//		TC	STARTDES	# SHOW DESIGNATE REQUIRED
// slot 23819
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
// P20-P25.agc:2192
//		CS	FLAGWRD8
// slot 23820
                    if slot <> 23820 or instruction <> 16452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 68).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23821 {
// P20-P25.agc:2193
//		MASK	SURFFBIT	# CHECK IF ON LUNAR SURFACE (SURFFLAG=P22F)
// slot 23821
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
// P20-P25.agc:2194
//		EXTEND
// slot 23822
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
// P20-P25.agc:2195
//		BZF	NORDSTAL	# BRANCH -- YES -- CANNOT DESIGNATE IN MODE 2
// slot 23823
                    if slot <> 23823 or instruction <> 5422 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5422, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23824 {
// P20-P25.agc:2196
//		TC	TRYSWS
// slot 23824
                        if slot <> 23824 or instruction <> 1329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1329, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2197
//
// P20-P25.agc:2198
//LUNDESCH	CS	FLAGWRD8	# OVERFLOW RETURN FROM RRANGLES
// slot 23825
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
// P20-P25.agc:2199
//		MASK	SURFFBIT	# CHECK IF ON LUNAR SURFACE
// slot 23826
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
// P20-P25.agc:2200
//		EXTEND
// slot 23827
                        if slot <> 23827 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23828 {
// P20-P25.agc:2201
//		BZF	NORDSTAL	# BRANCH -- YES -- RETURN TO CALLER -- ALARM 527
// slot 23828
                        if slot <> 23828 or instruction <> 5422 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5422, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2202
//		CA	STATE
// slot 23829
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
// P20-P25.agc:2203
//		MASK	RNDVZBIT
// slot 23830
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
// P20-P25.agc:2204
//		CCS	A		# TEST RNDVZFLG
// slot 23831
                        if slot <> 23831 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2205
//		TC	NODESSM		# NOT ON MOON -- CALL FOR ATTITUDE MANEUVER
// slot 23832
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
// P20-P25.agc:2206
//		TCF	ENDOFJOB	# ... BUT NOT IN R29.
// slot 23833
                        if slot <> 23833 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2207
//
// P20-P25.agc:2208
//# Page 540
// P20-P25.agc:2209
//# PROGRAM NAME:  STARTDES
// P20-P25.agc:2210
//#
// P20-P25.agc:2211
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:2212
//#
// P20-P25.agc:2213
//#	STARTDES IS ENTERED WHEN WE ARE READY TO BEGIN DESIGNATION.
// P20-P25.agc:2214
//#	BIT 14 OF RADMODES IS ALREADY SET IF A REMODE IS REQUIRED.
// P20-P25.agc:2215
//#	AT THIS TIME, THE RR ANTENNA MAY BE IN A REPOSITON
// P20-P25.agc:2216
//#	OPERATION.  IN THIS CASE, IF A REMODE IS REQUIRED IT MAY HAVE
// P20-P25.agc:2217
//#	ALREADY BEGUN BUT IN ANY CASE THE REPOSITION WILL BE INTERRUPTED.
// P20-P25.agc:2218
//#	OTHERWISE, THE REPOSITION WILL BE COMPLETED BEFORE 2-AXIS
// P20-P25.agc:2219
//#	DESIGNATION BEGINS.  INITIALLY DESCOUNT IS SET = 60 TO INDICATE
// P20-P25.agc:2220
//#	THAT 30 SECONDS WILL BE ALLOWED FOR THE RR DATA GOOD INBIT
// P20-P25.agc:2221
//#	(CHAN 33 BIT 4) IF LOCK-ON IS DESIRED (STATE BIT 5).  BIT 10
// P20-P25.agc:2222
//#	OF RADMODES IS SET TO SHOW THAT A DESIGNATE IS REQUIRED.
// P20-P25.agc:2223
//#	THE REPOSITON FLAG (RADMODES BIT 11) IS CHECKED.  IF SET,
// P20-P25.agc:2224
//#	THE PROGRAM EXITS TO L+3 OF THE CALLING PROGRAM (SEE RRDESSM
// P20-P25.agc:2225
//#	AND RRDESNB).  THE PROGRAM WILL BEGIN DESIGNATING TO THE DESIRED
// P20-P25.agc:2226
//#	ANGLES FOLLOWING THE REPOSITON OR REMODE IF ONE WAS
// P20-P25.agc:2227
//#	REQUESTED.  IF THE REPOSITON FLAG IS NOT SET, SETRRECR IS CALLED
// P20-P25.agc:2228
//#	WITH SETS THE RR ERROR COUNTER ENABLE BIT (CHAN 12 BIT 2)
// P20-P25.agc:2229
//# 	AND SETS LASTYCMD AND LASTXCMD = 0 TO INDICATE THE
// P20-P25.agc:2230
//#	DIFFERENCE BETWEEN THE PRESENT AND DESIRED STATE OF THE ERROR
// P20-P25.agc:2231
//#	COUNTERS.  A 20 MILLISECOND WAITLIST CALL IS SET FOR BEGDES
// P20-P25.agc:2232
//#	AFTER WHICH THE PROGRAM EXITS TO L+3 OF TEH CALLING PROGRAM.
// P20-P25.agc:2233
//#
// P20-P25.agc:2234
//# CALLING SEQUENCE:
// P20-P25.agc:2235
//#
// P20-P25.agc:2236
//#	FROM RRDESSM AND RRDESNB WHEN ANGLES WITHIN LIMITS.
// P20-P25.agc:2237
//#
// P20-P25.agc:2238
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:2239
//#
// P20-P25.agc:2240
//#	RADMODES, (SEE DODES)
// P20-P25.agc:2241
//#
// P20-P25.agc:2242
//# SUBROUTINES CALLED
// P20-P25.agc:2243
//#
// P20-P25.agc:2244
//#	SETRRECR, WAITLIST
// P20-P25.agc:2245
//#
// P20-P25.agc:2246
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:2247
//#
// P20-P25.agc:2248
//#	BEGDES
// P20-P25.agc:2249
//#
// P20-P25.agc:2250
//# ALARMS:  NONE
// P20-P25.agc:2251
//#
// P20-P25.agc:2252
//# EXIT:	L+3 OF CALLING PROGRAM (SEE RRDESSM)
// P20-P25.agc:2253
//#	L+2 OF CALLING PROGRAM (SEE RRDESNB)
// P20-P25.agc:2254
//
// P20-P25.agc:2255
//STARTDES	INCR	DESRET
// slot 23834
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
// P20-P25.agc:2256
//		CS	RADMODES
// slot 23835
                        if slot <> 23835 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2257
//		MASK	DESIGBIT
// slot 23836
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
// P20-P25.agc:2258
//		ADS	RADMODES
// slot 23837
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
// P20-P25.agc:2259
//		MASK	REPOSBIT	# SEE IF REPOSITIONING IN PROGRESS.
// slot 23838
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
// P20-P25.agc:2260
//		CCS	A
// slot 23839
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
// P20-P25.agc:2261
//		TCF	DESRETRN	# ECTR ALREADY SET UP.
// slot 23840
                        if slot <> 23840 or instruction <> 5414 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5414, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2262
//
// P20-P25.agc:2263
//		TC	SETRRECR	# SET UP ERROR COUNTERS.
// slot 23841
                        if slot <> 23841 or instruction <> 1134 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1134, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 23842 {
// P20-P25.agc:2264
//# Page 541
// P20-P25.agc:2265
//		CAF	TWO
// slot 23842
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
// P20-P25.agc:2266
//		TC	WAITLIST
// slot 23843
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
// P20-P25.agc:2267
//		EBANK=	LOSCOUNT
// P20-P25.agc:2268
//		2CADR	BEGDES
// slot 23844 23845
    23844, 2806, 23845, 43118
)).

// bank 25, slots 23846-23858
function agcAotUnit1569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23851 {
        if slot <= 23848 {
            if slot <= 23846 {
// P20-P25.agc:2269
//
// P20-P25.agc:2270
//DESRETRN	CA	RADCADR		# FIRST PASS THRU DESIGNATE
// slot 23846
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
// P20-P25.agc:2271
//		EXTEND
// slot 23847
                    if slot <> 23847 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2272
//		BZF	DESRTRN		# YES	SET EXIT
// slot 23848
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
// P20-P25.agc:2273
//		TC	ENDOFJOB	# NO
// slot 23849
                if slot <> 23849 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23850 {
// P20-P25.agc:2274
//DESRTRN		RELINT
// slot 23850
                    if slot <> 23850 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2275
//		INCR	DESRET
// slot 23851
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
// P20-P25.agc:2276
//		CA	DESRET
// slot 23852
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
// P20-P25.agc:2277
//		TCF	BANKJUMP
// slot 23853
                    if slot <> 23853 or instruction <> 6560 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6560, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2278
//
// P20-P25.agc:2279
//NORDSTAL	CAF	ZERO		# ZERO RADCADR TO WIPE OUT ANYONE
// slot 23854
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
// P20-P25.agc:2280
//		TS	RADCADR		# WAITING IN RADSTALL SINCE WE ARE NOW
// slot 23855
                    if slot <> 23855 or instruction <> 23238 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23238, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2281
//		TCF	DESRTRN		# RETURNING TO P20 AND MAY DO NEW RADSTALL
// slot 23856
                    if slot <> 23856 or instruction <> 5418 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5418, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23857 {
// P20-P25.agc:2282
//
// P20-P25.agc:2283
//# Page 542
// P20-P25.agc:2284
//# SEE IF RRDESSM CAN BE ACCOMPLISHED AFTER A REMODE.
// P20-P25.agc:2285
//
// P20-P25.agc:2286
//TRYSWS		TC	RMODINV		# (NOTE RUPT INHIBIT)
// slot 23857
                    if slot <> 23857 or instruction <> 1179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1179, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2287
//		TC	RRLIMCHK	# TRY DIFFERENT MODE.
// slot 23858
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
// P20-P25.agc:2288
//		ADRES	MODEB
// slot 23859
    23859, 1170
)).

// bank 25, slots 23860-23867
function agcAotUnit1570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23863 {
        if slot <= 23861 {
            if slot <= 23860 {
// P20-P25.agc:2289
//		TCF	NODESSM		# VEHICLE MANEUVER REQUIRED
// slot 23860
                if slot <> 23860 or instruction <> 5433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5433, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2290
//
// P20-P25.agc:2291
//		TC	RMODINV		# RESET BIT12
// slot 23861
                if slot <> 23861 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23862 {
// P20-P25.agc:2292
//		CAF	REMODBIT	# SET FLAG FOR REMODE.
// slot 23862
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
// P20-P25.agc:2293
//		ADS	RADMODES
// slot 23863
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
// P20-P25.agc:2294
//
// P20-P25.agc:2295
//		TCF	OKDESSM
// slot 23864
                if slot <> 23864 or instruction <> 5386 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2296
//
// P20-P25.agc:2297
//NODESSM		TC	RMODINV		# RE-INVERT MODE AND RETURN
// slot 23865
                if slot <> 23865 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23866 {
// P20-P25.agc:2298
//		INCR 	DESRET		# TO CALLER +2
// slot 23866
                if slot <> 23866 or instruction <> 10827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 587).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2299
//		TCF	NORDSTAL
// slot 23867
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
// P20-P25.agc:2300
//
// P20-P25.agc:2301
//MAXTRYS		DEC	60
// slot 23868
    23868, 120
)).

// bank 25, slots 23869-23871
function agcAotUnit1571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23869 {
// P20-P25.agc:2302
//
// P20-P25.agc:2303
//# Page 543
// P20-P25.agc:2304
//# DESIGNATE TO SPECIFIC RR GIMBAL ANGLES (INDEPENDENT OF VEHICLE MOTION).  ENTER WITH DESIRED ANGLES IN
// P20-P25.agc:2305
//# TANG AND TANG +1.
// P20-P25.agc:2306
//
// P20-P25.agc:2307
//RRDESNB		TC	MAKECADR
// slot 23869
        if slot <> 23869 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23870 {
// P20-P25.agc:2308
//		TS	DESRET
// slot 23870
            if slot <> 23870 or instruction <> 23115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23115, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2309
//
// P20-P25.agc:2310
//		TC	DOWNFLAG	# RESET FLAG TO PREVENT DODES FROM GOING
// slot 23871
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
// P20-P25.agc:2311
//		ADRES	LOSCMFLG	# BACK TO R21
// slot 23872
    23872, 66
)).

// bank 25, slots 23873-23876
function agcAotUnit1572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23874 {
        if slot <= 23873 {
// P20-P25.agc:2312
//		CA	MAXTRYS		# SET TIME LIMIT COUNTER
// slot 23873
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
// P20-P25.agc:2313
//		TS	DESCOUNT	# FOR DESIGNATE
// slot 23874
            if slot <> 23874 or instruction <> 23116 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23116, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23875 {
// P20-P25.agc:2314
//		INHINT			# SEE IF CURRENT MODE OK.
// slot 23875
            if slot <> 23875 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2315
//		TC	RRLIMNB		# DO SPECIAL V41 LIMIT CHECK
// slot 23876
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
// P20-P25.agc:2316
//		ADRES	TANG
// slot 23877
    23877, 1166
)).

// bank 25, slots 23878-23883
function agcAotUnit1573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23880 {
        if slot <= 23878 {
// P20-P25.agc:2317
//		TCF	TRYSWN		# SEE IF IN OTHER MODE.
// slot 23878
            if slot <> 23878 or instruction <> 5459 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5459, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23879 {
// P20-P25.agc:2318
//
// P20-P25.agc:2319
//OKDESNB		RELINT
// slot 23879
                if slot <> 23879 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2320
//		EXTEND
// slot 23880
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
// P20-P25.agc:2321
//		DCA	TANG
// slot 23881
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
// P20-P25.agc:2322
//		DXCH	TANGNB
// slot 23882
                if slot <> 23882 or instruction <> 22507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1003, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2323
//		TC	INTPRET
// slot 23883
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
// P20-P25.agc:2324
//
// P20-P25.agc:2325
//		CALL			# GET LOS IN NB COORDS.
// slot 23884
    23884, 65320,
// P20-P25.agc:2326
//			RRNB
// slot 23885
    23885, 38978,
// P20-P25.agc:2327
//		STORE	RRTARGET
// slot 23886
    23886, 1156,
// P20-P25.agc:2328
//
// P20-P25.agc:2329
//		SET	EXIT
// slot 23887
    23887, 65048,
// P20-P25.agc:2330
//			RRNBSW
// slot 23888
    23888, 114
)).

// bank 25, slots 23889-23892
function agcAotUnit1574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23890 {
        if slot <= 23889 {
// P20-P25.agc:2331
//
// P20-P25.agc:2332
//		INHINT
// slot 23889
            if slot <> 23889 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2333
//		TCF	STARTDES +1
// slot 23890
            if slot <> 23890 or instruction <> 5403 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5403, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23891 {
// P20-P25.agc:2334
//TRYSWN		TC	RMODINV		# SEE IF OTHER MODE WILL DO.
// slot 23891
            if slot <> 23891 or instruction <> 1179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2335
//		TC	RRLIMNB		# DO SPECIAL V41 LIMIT CHECK
// slot 23892
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
// P20-P25.agc:2336
//		ADRES	TANG
// slot 23893
    23893, 1166
)).

// bank 25, slots 23894-23900
function agcAotUnit1575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23896 {
        if slot <= 23894 {
// P20-P25.agc:2337
//		TCF	NODESNB		# NOT POSSIBLE.
// slot 23894
            if slot <> 23894 or instruction <> 5467 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5467, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23895 {
// P20-P25.agc:2338
//
// P20-P25.agc:2339
//		TC	RMODINV
// slot 23895
                if slot <> 23895 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2340
//		CAF	REMODBIT	# CALL FOR REMODE.
// slot 23896
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
// P20-P25.agc:2341
//		ADS	RADMODES
// slot 23897
                if slot <> 23897 or instruction <> 11336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2342
//		TCF	OKDESNB
// slot 23898
                if slot <> 23898 or instruction <> 5447 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5447, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23899 {
// P20-P25.agc:2343
//
// P20-P25.agc:2344
//NODESNB		TC	RMODINV		# REINVERT MODE BIT.
// slot 23899
                if slot <> 23899 or instruction <> 1179 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1179, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2345
//		TC	ALARM		# BAD INPUT ANGLES.
// slot 23900
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
// P20-P25.agc:2346
//		OCT	502
// slot 23901
    23901, 644
)).

// bank 25, slots 23902-23904
function agcAotUnit1576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23902 {
// P20-P25.agc:2347
//		TC	CLRADMOD
// slot 23902
        if slot <> 23902 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23903 {
// P20-P25.agc:2348
//		TC	ENDOFJOB	# AVOID 503 ALARM.
// slot 23903
            if slot <> 23903 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2349
//
// P20-P25.agc:2350
//RRLIMNB		INDEX	Q		# THIS ROUTINE IS IDENTICAL TO RRLIMCHK
// slot 23904
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
// P20-P25.agc:2351
//		CAF	0		# EXCEPT THAT THE MODE 1 SHAFT LOWER
// slot 23905
    23905, 24576
)).

// bank 25, slots 23906-23908
function agcAotUnit1577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23906 {
// P20-P25.agc:2352
//		INCR	Q		# LIMIT IS -85 INSTEAD OF -70 DEGREES
// slot 23906
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
// P20-P25.agc:2353
//		EXTEND
// slot 23907
            if slot <> 23907 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2354
//# Page 544
// P20-P25.agc:2355
//		INDEX	A		# READ GIMBAL ANGLES INTO ITEMP STORAGE
// slot 23908
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
// P20-P25.agc:2356
//		DCA	0
// slot 23909
    23909, 24578
)).

// bank 25, slots 23910-23917
function agcAotUnit1578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23913 {
        if slot <= 23911 {
            if slot <= 23910 {
// P20-P25.agc:2357
//		DXCH	ITEMP1
// slot 23910
                if slot <> 23910 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2358
//		LXCH	Q		# L(CALLER +2) TO L
// slot 23911
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
// P20-P25.agc:2359
//
// P20-P25.agc:2360
//		CAF	ANTENBIT	# SEE WHICH MODE RR IS IN
// slot 23912
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
// P20-P25.agc:2361
//		MASK	RADMODES
// slot 23913
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
// P20-P25.agc:2362
//		CCS	A
// slot 23914
                if slot <> 23914 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2363
//		TCF	MODE2CHK	# MODE 2 CAN USE RRLIMCHK CODING
// slot 23915
                if slot <> 23915 or instruction <> 6504 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6504, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23916 {
// P20-P25.agc:2364
//		CA	ITEMP1
// slot 23916
                if slot <> 23916 or instruction <> 12337 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 49).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2365
//		TC	MAGSUB		# MODE 1 IS DEFINED AS
// slot 23917
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
// P20-P25.agc:2366
//		DEC	-.30555		# 1 	ABS(T) L 55 DEGS
// slot 23918
    23918, 55522
)).

// bank 25, slots 23919-23924
function agcAotUnit1579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23921 {
        if slot <= 23919 {
// P20-P25.agc:2367
//		TC	L		# 2 	SHAFT LIMITS AT +59, -85 DEGS
// slot 23919
            if slot <> 23919 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23920 {
// P20-P25.agc:2368
//
// P20-P25.agc:2369
//		CA	ITEMP2		# LOAD SHAFT ANGLE
// slot 23920
                if slot <> 23920 or instruction <> 12338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2370
//		EXTEND
// slot 23921
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
// P20-P25.agc:2371
//		BZMF	NEGSHAFT	# IF NEGATIVE SHAFT ANGLE, ADD 20.5 DEGS
// slot 23922
            if slot <> 23922 or instruction <> 25976 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 25976, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23923 {
// P20-P25.agc:2372
//		AD	5.5DEGS
// slot 23923
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
// P20-P25.agc:2373
//SHAFTLIM	TC	MAGSUB
// slot 23924
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
// P20-P25.agc:2374
//		DEC	-.35833		# 64.5 DEGREES
// slot 23925
    23925, 53792
)).

// bank 25, slots 23926-23929
function agcAotUnit1580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23927 {
        if slot <= 23926 {
// P20-P25.agc:2375
//		TC	L		# NOT IN LIMITS
// slot 23926
            if slot <> 23926 or instruction <> 1 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2376
//		TC	RRLIMOK		# IN LIMITS
// slot 23927
            if slot <> 23927 or instruction <> 2416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23928 {
// P20-P25.agc:2377
//NEGSHAFT	AD	20.5DEGS	# MAKE NEGATIVE SHAFT LIMIT -85 DEGREES
// slot 23928
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
// P20-P25.agc:2378
//		TCF	SHAFTLIM
// slot 23929
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
// P20-P25.agc:2379
//
// P20-P25.agc:2380
//20.5DEGS	DEC	.11389
// slot 23930
    23930, 3732
)).

// bank 25, slots 23931-23936
function agcAotUnit1581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23933 {
        if slot <= 23931 {
// P20-P25.agc:2381
//
// P20-P25.agc:2382
//# Page 545
// P20-P25.agc:2383
//# PROGRAM NAME:  BEGDES
// P20-P25.agc:2384
//#
// P20-P25.agc:2385
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:2386
//#
// P20-P25.agc:2387
//#	BEGDES CHECKS VARIOUS DESIGNATE REQUESTS AND REQUESTS THE
// P20-P25.agc:2388
//#	ACTUAL RR DESIGNATION.  INITIALLY A CHECK IS MADE TO SEE IF A
// P20-P25.agc:2389
//# 	REMODE (RADMODES BIT 14) IS REQUESTED OR IN PROGRESS.  IF SO,
// P20-P25.agc:2390
//#	CONTROL IS TRANFERRED TO STDESIG AFTER ROUTINE REMODE IS
// P20-P25.agc:2391
//#	EXECUTED.  IF NO REMODE, STDESIG IS IMMEDIATELY CALLED WHERE
// P20-P25.agc:2392
//#	FIRST THE REPOSITION FLAG (RADMODES BIT 11) IS CHECKED.  IF
// P20-P25.agc:2393
//#	PRESENT, THE DESIGNATE FLAG (RADMODES BIT 10) IS REMOVED
// P20-P25.agc:2394
//#	AFTER WHICH THE PROGRAM EXITS TO RDBADEND.  IF THE REPOSITION
// P20-P25.agc:2395
//#	FLAG IS NOT PRESET, THE CONTINUOUS DESIGNATE FLAG (RADMODES
// P20-P25.agc:2396
//#	BIT 15) IS CHECKED.  IF PRESENT, AN EXECUTIVE CALL IS IMMEDIATELY
// P20-P25.agc:2397
//#	MADE FOR DODES AFTER WHICH A .5 SECOND WAIT IS INITIATED BEFORE
// P20-P25.agc:2398
//#	REPEATING AT STDESIG.  IF THE RR SEARCH ROUTINE (LRS24.1) IS DESIGNATING
// P20-P25.agc:2399
//#	TO A NEW POINT (NEWPTFLG SET) THE CURRENT DESIGNATE TASK IS TERMINATED.
// P20-P25.agc:2400
//#	IF CONTINUOUS DESIGNATE IS NOT WANTED, THE DESIGNATE FLAG (RADMODES
// P20-P25.agc:2401
//#	BIT 10) IS CHECKED.  IF NOT PRESENT, THE PROGRAM EXITS TO ENDRADAR TO
// P20-P25.agc:2402
//#	CHECK RR CDU FAIL BEFORE RETURNING TO THE CALLING PROGRAM.  IF DESIGNATE
// P20-P25.agc:2403
//#	IS STILL REQUIRED, DESCOUNT IS CHECKED TO SEE IF THE 30 SECONDS HAS
// P20-P25.agc:2404
//#	EXPIRED BEFORE RECEIVING THE RR DATA GOOD (CHAN 33 BIT 4)
// P20-P25.agc:2405
//#	SIGNAL.  IF OUT OF TIME, PROGRAM ALARM 00503 IS REQUESTED, THE
// P20-P25.agc:2406
//#	RR AUTO TRACKER ENABLE AND RR ERROR COUNTER ENABLE
// P20-P25.agc:2407
//#	(CHAN 12 BITS 14,2) BITS REMOVED, AND THE DESIGNATE FLAG
// P20-P25.agc:2408
//#	(RADMODES BIT 10) REMOVED BEFORE EEXITING TO RDBADEND.  IF
// P20-P25.agc:2409
//#	TIME HAS NOT EXPIRED, DESCOUNT IS DECREMENTED, THE
// P20-P25.agc:2410
//#	EXECUTIVE CALL MADE FOR DODES, AND A .5 SECOND WAIT INITIATED
// P20-P25.agc:2411
//#	BEFORE REPEATING THIS PROCEDURE AT STDESIG.
// P20-P25.agc:2412
//#
// P20-P25.agc:2413
//# CALLING SEQUENCE:
// P20-P25.agc:2414
//#
// P20-P25.agc:2415
//#	WAITLIST CALL FROM STARTDES
// P20-P25.agc:2416
//#	TCF BEGDES FROM DORREPOS
// P20-P25.agc:2417
//#	TC STDESIG RETURNING, FROM REMODE
// P20-P25.agc:2418
//#
// P20-P25.agc:2419
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:2420
//#
// P20-P25.agc:2421
//#	DESCOUNT, FINDVAC
// P20-P25.agc:2422
//#
// P20-P25.agc:2423
//# JOBS OR TASKS INITIATED:  DODES
// P20-P25.agc:2424
//#
// P20-P25.agc:2425
//# ALARMS:  PROGRAM ALARM 00503 (30 SECONDS HAVE EXPIRED) WITH NO RR DATA
// P20-P25.agc:2426
//# GOOD (CHAN 33 BIT 4) RECEIVED WHEN LOCK-ON (STATE BIT 5) WAS REQUESTED.
// P20-P25.agc:2427
//#
// P20-P25.agc:2428
//# EXIT:  	TASKOVER (SEARCH PATTERN DESIGNATING TO NEW POINT)
// P20-P25.agc:2429
//# 		ENDRADAR (NO DESIGNATE -- RADMODES BIT 10)
// P20-P25.agc:2430
//#		RDBADEND (REPOSITION OR 30 SECONDS EXPIRED)
// P20-P25.agc:2431
//
// P20-P25.agc:2432
//BEGDES		CS	RADMODES
// slot 23931
            if slot <> 23931 or instruction <> 16456 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 72).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23932 {
// P20-P25.agc:2433
//# Page 546
// P20-P25.agc:2434
//		MASK	REMODBIT
// slot 23932
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
// P20-P25.agc:2435
//		CCS	A
// slot 23933
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
// P20-P25.agc:2436
//		TC	STDESIG
// slot 23934
            if slot <> 23934 or instruction <> 1410 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1410, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23935 {
// P20-P25.agc:2437
//		TC	REMODE
// slot 23935
                if slot <> 23935 or instruction <> 1145 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1145, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2438
//DESLOOP		TC	FIXDELAY	# 2 SAMPLES PER SECOND.
// slot 23936
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
// P20-P25.agc:2439
//		DEC	50
// slot 23937
    23937, 100
)).

// bank 25, slots 23938-23961
function agcAotUnit1582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23949 {
        if slot <= 23943 {
            if slot <= 23940 {
                if slot <= 23938 {
// P20-P25.agc:2440
//
// P20-P25.agc:2441
//STDESIG		CAF	REPOSBIT
// slot 23938
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
// P20-P25.agc:2442
//		MASK	RADMODES	# SEE IF GIMBAL LIMIT MONITOR HAS FOUND US
// slot 23939
                        if slot <> 23939 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2443
//		CCS	A		# OUT OF BOUNDS.  IF SO, THIS BIT SHOWS A
// slot 23940
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
// P20-P25.agc:2444
//		TCF	BADDES		# REPOSITION TO BE IN PROGRESS.
// slot 23941
                    if slot <> 23941 or instruction <> 5523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5523, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23942 {
// P20-P25.agc:2445
//
// P20-P25.agc:2446
//		CCS	RADMODES	# SEE IF CONTINUOUS DESIGNATE WANTED.
// slot 23942
                        if slot <> 23942 or instruction <> 4168 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2447
//		TCF	+3		# IF SO, DON'T CHECK BIT 10 TO SEE IF IN
// slot 23943
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
// P20-P25.agc:2448
//		TCF	+2		# LIMITS BUT GO RIGHT TO FINDVAC ENTRY.
// slot 23944
                    if slot <> 23944 or instruction <> 5514 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5514, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23945 {
// P20-P25.agc:2449
//		TCF	MOREDES +1
// slot 23945
                        if slot <> 23945 or instruction <> 5528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2450
//
// P20-P25.agc:2451
//		CS	RADMODES	# IF NON-CONTINUOUS, SEE IF END OF
// slot 23946
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
// P20-P25.agc:2452
//		MASK	DESIGBIT	# PROBLEM (DATA GOOD IF LOCK-ON WANTED OR
// slot 23947
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
// P20-P25.agc:2453
//		CCS	A		# WITHIN LIMITS IF NOT).  IF SO, EXIT AFTER
// slot 23948
                        if slot <> 23948 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2454
//		TCF	ENDRADAR	# CHECKING RR CDU FAIL.
// slot 23949
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
// P20-P25.agc:2455
//
// P20-P25.agc:2456
//STDESIG1	CCS	DESCOUNT	# SEE IF THE TIME LIMIT HAS EXPIRED
// slot 23950
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
// P20-P25.agc:2457
//		TCF	MOREDES
// slot 23951
                        if slot <> 23951 or instruction <> 5527 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5527, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2458
//
// P20-P25.agc:2459
//		CS	B14+B2		# IF OUT OF TIME, REMOVE ECR ENABLE + TRKR
// slot 23952
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
// P20-P25.agc:2460
//		EXTEND
// slot 23953
                    if slot <> 23953 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23954 {
// P20-P25.agc:2461
//		WAND	CHAN12
// slot 23954
                        if slot <> 23954 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2462
//BADDES		CS	DESIGBIT	# REMOVE DESIGNATE FLAG
// slot 23955
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
// P20-P25.agc:2463
//		MASK	RADMODES
// slot 23956
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
// P20-P25.agc:2464
//		TS	RADMODES
// slot 23957
                        if slot <> 23957 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2465
//		TCF	RDBADEND
// slot 23958
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
// P20-P25.agc:2466
//
// P20-P25.agc:2467
//MOREDES		TS	DESCOUNT
// slot 23959
                    if slot <> 23959 or instruction <> 23116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23116, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23960 {
// P20-P25.agc:2468
//		CAF	PRIO26		# UPDATE GYRO TORQUE COMMANDS.
// slot 23960
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
// P20-P25.agc:2469
//		TC	FINDVAC
// slot 23961
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
// P20-P25.agc:2470
//		EBANK=	LOSCOUNT
// P20-P25.agc:2471
//		2CADR	DODES
// slot 23962 23963
    23962, 2876, 23963, 43118
)).

// bank 25, slots 23964-23964
function agcAotUnit1583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2472
//
// P20-P25.agc:2473
//		TCF	DESLOOP
// slot 23964
    if slot <> 23964 or instruction <> 5504 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5504, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1583] to agcAotUnit1583@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2474
//
// P20-P25.agc:2475
//B14+B2		OCT	20002
// slot 23965
    23965, 16388
)).

// bank 25, slots 23966-23969
function agcAotUnit1584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23967 {
        if slot <= 23966 {
// P20-P25.agc:2476
//
// P20-P25.agc:2477
//# Page 547
// P20-P25.agc:2478
//# PROGRAM NAME:  DODES
// P20-P25.agc:2479
//#
// P20-P25.agc:2480
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:2481
//#
// P20-P25.agc:2482
//#	DODES CALCULATES AND REQUESTS ISSUANCE OF RR GYRO TORQUE
// P20-P25.agc:2483
//#	COMMANDS.  INITIALLY THE CURRENT RR CDU ANGLES ARE STORED AND
// P20-P25.agc:2484
//#	THE LOS HALF-UNIT VECTOR TRANSFORMED FROM STABLE MEMBER TO
// P20-P25.agc:2485
//#	NAVIGATION BASE COORDINATES VIA SMNB IF NECESSARY.  THE
// P20-P25.agc:2486
//#	SHAFT AND TRUNNION COMMANDS ARE THEN CALCULATED AS FOLLOWS:
// P20-P25.agc:2487
//#		+ SHAFT = LOS . (COS(S), 0, -SIN(S))  (DOT PRODUCT)
// P20-P25.agc:2488
//#		- TRUNNION = LOS . (SIN(T)SIN(S), COS(T), SIN(T)COS(S))
// P20-P25.agc:2489
//#	THE SIGN OF THE SHAFT COMMAND IS THEN REVERSED IF IN MODE 2
// P20-P25.agc:2490
//#	(RADMODES BIT 12) BECAUSE A RELAY IN THE RR REVERSES THE
// P20-P25.agc:2491
//#	POLARITY OF THE COMMAND.  AT RRSCALUP EACH COMMAND IS
// P20-P25.agc:2492
//#	SCALED AND IF EITHER, OR BOTH, OF THE COMMANDS IS GREATER THAN
// P20-P25.agc:2493
//#	.5 DEGREES, MPAC +1 IS SET POSITIVE.  IF A CONTINUOUS DESIGNATE
// P20-P25.agc:2494
//#	(RADMODES BIT 15) IS DESIRED AND THE SEARCH ROUTINE IS NOT OPERATING,
// P20-P25.agc:2495
//#	THE RR AUTO TRACKER ENABLE BIT (CHAN 12 BIT 14) IS CLEARED AND RROUT
// P20-P25.agc:2496
//#	CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITION (RADMODES BIT 11)
// P20-P25.agc:2497
//#	IS IN PROGRESS.  IF A CONTINUOUS DESIGNATE AND THE SEARCH ROUTINE IS
// P20-P25.agc:2498
//#	OPERATING (SRCHOPT FLAT SET) THE TRACK ENABLE IS NOT CLEARED.  IF NO
// P20-P25.agc:2499
//#	CONTINUOUS DESIGNATE AND BOTH COMMANDS ARE NOT LESS THAN .5 DEGREES AS
// P20-P25.agc:2500
//#	INDICATED BY MPAC +1, THE RR AUTO TRACKER ENABLE BIT (CHAN 12 BIT 14) IS
// P20-P25.agc:2501
//# 	CLEARED AND RROUT CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITON
// P20-P25.agc:2502
//#	(RADMODES BIT 11) IS IN PROGRESS.  IF BOTH COMMANDS ARE LESS THAN .5
// P20-P25.agc:2503
//#	DEGREES AS INDICATED BY MPAC+1, THE RR AUTO TRACKER ENABLE BIT
// P20-P25.agc:2504
//#	(CHAN 12 BIT 14) IS CLEARED AND RROUT CALLED TO PUT OUT THE
// P20-P25.agc:2505
//#	COMMANDS PROVIDED NO REPOSITION (RADMODES BIT 11) IS IN
// P20-P25.agc:2506
//#	PROGRESS.  IF BOTH COMMANDS ARE LESS THAN .5 DEGREES, THE
// P20-P25.agc:2507
//#	LOCK-ON FLAG (STATE BIT 5) IS CHECKED.  IF NOT PRESETN, THE
// P20-P25.agc:2508
//#	DESIGNATE FLAG (RADMODES BIT 10) IS CLEARED, AND ENDOFJOB
// P20-P25.agc:2509
//#	CALLED.  IF LOCK-ON IS DESIRED, THE RR AUTO TRACKER (CHAN 12
// P20-P25.agc:2510
//#	BIT 14) IS ENABLED FOLLOWED BY A CHECK OF THE RECEIPT OF THE
// P20-P25.agc:2511
//#	RR DATA GOOD (CHAN 33 BIT 4) SIGNAL.  IF RR DATA GOOD
// P20-P25.agc:2512
//#	PRESENT, THE DESIGNATE FLAG (RADMODES BIT 10) IS CLEARED,
// P20-P25.agc:2513
//# 	THE RR ERROR COUNTER ENABLE BIT (CHAN 12 BIT 2) IS CLEARED,
// P20-P25.agc:2514
//#	AND ENDOFJOB CALLED.  IF RR DATA GOOD IS NOT PRESENT, RROUT
// P20-P25.agc:2515
//#	IS CALLED TO PUT OUT THE COMMANDS PROVIDED NO REPOSITION
// P20-P25.agc:2516
//#	(RADMODES BIT 11) IS IN PROGRESS AFTER WHICH THE JOB IS TERMINATED
// P20-P25.agc:2517
//#	VIA ENDOFJOB.
// P20-P25.agc:2518
//#
// P20-P25.agc:2519
//# CALLING SEQUENCE:
// P20-P25.agc:2520
//#
// P20-P25.agc:2521
//#	EXECUTIVE CALL EVERY .5 SECONDS FROM BEGDES.
// P20-P25.agc:2522
//#
// P20-P25.agc:2523
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:2524
//#
// P20-P25.agc:2525
//#	RRTARGET (HALF-UNIT LOS VECTOR IN EITHER SM OR NB COORDINATES),
// P20-P25.agc:2526
//#	LOKONSW (STATE BIT 5), RRNBSW (STATE BIT 6), RADMODES
// P20-P25.agc:2527
//#
// P20-P25.agc:2528
//# SUBROUTINES CALLED:
// P20-P25.agc:2529
//#
// P20-P25.agc:2530
//# 	READCDUS, SMNB, CDULOGIC, MAGSUB, RROUT
// P20-P25.agc:2531
//# Page 548
// P20-P25.agc:2532
//#
// P20-P25.agc:2533
//# JOBS OR TASKS INITIATED:
// P20-P25.agc:2534
//#
// P20-P25.agc:2535
//#	NONE
// P20-P25.agc:2536
//#
// P20-P25.agc:2537
//# ALARMS:  NONE
// P20-P25.agc:2538
//#
// P20-P25.agc:2539
//# EXIT:  ENDOFJOB (ALWAYS)
// P20-P25.agc:2540
//
// P20-P25.agc:2541
//DODES		EXTEND
// slot 23966
            if slot <> 23966 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2542
//		DCA	CDUT
// slot 23967
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
// P20-P25.agc:2543
//		DXCH	TANG
// slot 23968
            if slot <> 23968 or instruction <> 22088 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2544
//
// P20-P25.agc:2545
//		TC	INTPRET
// slot 23969
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
// P20-P25.agc:2546
//
// P20-P25.agc:2547
//		SETPD	VLOAD
// slot 23970
    23970, 64770,
// P20-P25.agc:2548
//			0
// slot 23971
    23971, 2,
// P20-P25.agc:2549
//			RRTARGET
// slot 23972
    23972, 1156,
// P20-P25.agc:2550
//		BON	VXSC
// slot 23973
    23973, 61720,
// P20-P25.agc:2551
//			RRNBSW
// slot 23974
    23974, 402,
// P20-P25.agc:2552
//			DONBRD		# TARGET IN NAV-BASE COORDINATES
// slot 23975
    23975, 43874,
// P20-P25.agc:2553
//			MLOSV		# MULTIPLY UNIT LOS BY MAGNITUDE
// slot 23976
    23976, 2030,
// P20-P25.agc:2554
//		VSL1	PDVL
// slot 23977
    23977, 52724,
// P20-P25.agc:2555
//			LOSVEL
// slot 23978
    23978, 2018,
// P20-P25.agc:2556
//		VXSC	VAD		# ADD ONE SECOND RELATIVE VELOCITY TO LOS
// slot 23979
    23979, 44514,
// P20-P25.agc:2557
//			MCTOMS
// slot 23980
    23980, 11380,
// P20-P25.agc:2558
//		UNIT	CALL
// slot 23981
    23981, 37980,
// P20-P25.agc:2559
//			CDUTRIG
// slot 23982
    23982, 40638,
// P20-P25.agc:2560
//		CALL
// slot 23983
    23983, 65320,
// P20-P25.agc:2561
//			*SMNB*
// slot 23984
    23984, 40818,
// P20-P25.agc:2562
//
// P20-P25.agc:2563
//DONBRD		STODL	32D
// slot 23985
    23985, 12354,
// P20-P25.agc:2564
//			TANG +1
// slot 23986
    23986, 1170,
// P20-P25.agc:2565
//		RTB	PUSH		# SHAFT COMMAND = V(32D).(COS(S), 0,
// slot 23987
    23987, 34360,
// P20-P25.agc:2566
//			CDULOGIC	#	-SIN(S)).
// slot 23988
    23988, 18172,
// P20-P25.agc:2567
//		SIN	PDDL		# SIN(S) TO 0 AND COS(S) TO 2.
// slot 23989
    23989, 54748,
// P20-P25.agc:2568
//		COS	PUSH
// slot 23990
    23990, 34508,
// P20-P25.agc:2569
//		DMP	PDDL
// slot 23991
    23991, 54538,
// P20-P25.agc:2570
//			32D
// slot 23992
    23992, 66,
// P20-P25.agc:2571
//			36D
// slot 23993
    23993, 74,
// P20-P25.agc:2572
//		DMP	BDSU
// slot 23994
    23994, 37130,
// P20-P25.agc:2573
//			0
// slot 23995
    23995, 2,
// P20-P25.agc:2574
//		STADR
// slot 23996
    23996, 65324,
// P20-P25.agc:2575
//		STORE	TANG +1		# SHAFT COMMAND
// slot 23997
    23997, 64364,
// P20-P25.agc:2576
//
// P20-P25.agc:2577
//		SLOAD	RTB
// slot 23998
    23998, 40122,
// P20-P25.agc:2578
//			TANG
// slot 23999
    23999, 1168,
// P20-P25.agc:2579
//			CDULOGIC
// slot 24000
    24000, 18172,
// P20-P25.agc:2580
//		PUSH	COS		# COS(T) TO 4.
// slot 24001
    24001, 58892,
// P20-P25.agc:2581
//		PDDL	SIN
// slot 24002
    24002, 61098,
// P20-P25.agc:2582
//		PUSH	DMP		# SIN(T) TO 6.
// slot 24003
    24003, 34060,
// P20-P25.agc:2583
//			2
// slot 24004
    24004, 6,
// P20-P25.agc:2584
//# Page 549
// P20-P25.agc:2585
//		SL1	PDDL		# DEFINE VECTOR U =	[SIN(T)SIN(S)]
// slot 24005
    24005, 54740,
// P20-P25.agc:2586
//			4		#			[   COS(T)   ]
// slot 24006
    24006, 10,
// P20-P25.agc:2587
//		PDDL	DMP		#			[SIN(T)COS(S)]
// slot 24007
    24007, 34218,
// P20-P25.agc:2588
//			6
// slot 24008
    24008, 14,
// P20-P25.agc:2589
//			0
// slot 24009
    24009, 2,
// P20-P25.agc:2590
//		SL1	VDEF
// slot 24010
    24010, 46804,
// P20-P25.agc:2591
//		DOT	EXIT		# DOT U WITH LOS TO GET TRUNNION COMMAND.
// slot 24011
    24011, 65090,
// P20-P25.agc:2592
//			32D
// slot 24012
    24012, 66
)).

// bank 25, slots 24013-24027
function agcAotUnit1585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24019 {
        if slot <= 24015 {
            if slot <= 24013 {
// P20-P25.agc:2593
//
// P20-P25.agc:2594
//# Page 550
// P20-P25.agc:2595
//# AT THIS POINT WE HAVE A ROTATION VECTOR IN DISH AXES LYING IN THE TS PLANE.  CONVERT THIS TO A
// P20-P25.agc:2596
//# COMMANDED RATE AND ENABLE THE TRACKER IF WE ARE WITHIN .5 DEGREES OF THE TARGET.
// P20-P25.agc:2597
//
// P20-P25.agc:2598
//		CS	MPAC		# DOT WAS NEGATIVE OF DESREG ANGLE.
// slot 24013
                if slot <> 24013 or instruction <> 16492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 108).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24014 {
// P20-P25.agc:2599
//		EXTEND
// slot 24014
                    if slot <> 24014 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2600
//		MP	RDESGAIN	# SCALING ON INPUT ANGLE WAS 4 RADIANS.
// slot 24015
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
// P20-P25.agc:2601
//		TS	TANG		# TRUNNION COMMAND.
// slot 24016
                    if slot <> 24016 or instruction <> 23111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2602
//		CS	RADMODES	# A RELAY IN THE RR REVERSES POLARITY OF
// slot 24017
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
// P20-P25.agc:2603
//		MASK	BIT12		# THE SHAFT COMMANDS IN MODE 2 SO THAT A
// slot 24018
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
// P20-P25.agc:2604
//		EXTEND			# POSITIVE TORQUE APPLIED TO THE SHAFT
// slot 24019
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
// P20-P25.agc:2605
//		BZF	+3		# GYRO CAUSES A POSITIVE CHANGE IN THE
// slot 24020
                    if slot <> 24020 or instruction <> 5591 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5591, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2606
//		CA	TANG +1		# SHAFT ANGLE.  COMPENSATE FOR THIS SWITCH
// slot 24021
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
// P20-P25.agc:2607
//		TCF	+2		# BY CHANGING THE POLARITY OF OUR COMMAND.
// slot 24022
                    if slot <> 24022 or instruction <> 5592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2608
// +3		CS	TANG +1
// slot 24023
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
// P20-P25.agc:2609
//		EXTEND
// slot 24024
                    if slot <> 24024 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2610
//		MP	RDESGAIN	# SCALING ON INPUT ANGLE WAS 4 RADIANS.
// slot 24025
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
// P20-P25.agc:2611
//		TS	TANG +1		# SHAFT COMMAND FOR RROUT
// slot 24026
                    if slot <> 24026 or instruction <> 23112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23112, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2612
//		TC	INTPRET
// slot 24027
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
// P20-P25.agc:2613
//
// P20-P25.agc:2614
//		DLOAD	DMP
// slot 24028
    24028, 34250,
// P20-P25.agc:2615
//			2		# COS(S).
// slot 24029
    24029, 6,
// P20-P25.agc:2616
//			4		# COS(T).
// slot 24030
    24030, 10,
// P20-P25.agc:2617
//		SL1	PDDL		# Z COMPONENT OF URR.
// slot 24031
    24031, 54740,
// P20-P25.agc:2618
//		DCOMP	PDDL		# Y COMPONENT = -SIN(T)
// slot 24032
    24032, 54652,
// P20-P25.agc:2619
//			0		# SIN(S).
// slot 24033
    24033, 2,
// P20-P25.agc:2620
//		DMP	SL1
// slot 24034
    24034, 59914,
// P20-P25.agc:2621
//			4		# COS(T).
// slot 24035
    24035, 10,
// P20-P25.agc:2622
//		VDEF	BON		# FORM URR IN NB AXES.
// slot 24036
    24036, 35948,
// P20-P25.agc:2623
//			RRNBSW		# BYPASS NBSM CONVERSION IN VERB 41
// slot 24037
    24037, 402,
// P20-P25.agc:2624
//			+3
// slot 24038
    24038, 43986,
// P20-P25.agc:2625
//		CALL
// slot 24039
    24039, 65320,
// P20-P25.agc:2626
//			*NBSM*		# GET URR IN SM AXES.
// slot 24040
    24040, 40822,
// P20-P25.agc:2627
//		DOT	EXIT
// slot 24041
    24041, 65090,
// P20-P25.agc:2628
//			RRTARGET	# GET COSIN OF ANGLE BETWEEN RR AND LOS
// slot 24042
    24042, 1156
)).
