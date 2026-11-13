// GROUND_TRACKING_DETERMINATION_PROGRAM.agc
// bank 24, slots 23365-23368
function agcAotUnit1538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23366 {
        if slot <= 23365 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:1
//# Copyright:	Public domain.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:2
//# Filename:	GROUND_TRACKING_DETERMINATION_PROGRAM.agc
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:6
//# Assembler:	yaYUL
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:9
//# Pages:	654-657
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:10
//# Mod history:	2009-05-18 RSB	Adapted from the corresponding
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:11
//#				Luminary131 file, using page
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:12
//#				images from Luminary 1A.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:13
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:14
//# This source code has been transcribed or otherwise adapted from
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:21
//# about getting access to the (much) higher-quality images which Paul
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:22
//# actually created.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:23
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:24
//# Notations on the hardcopy document read, in part:
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:25
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:27
//#	16:27 JULY 14, 1969
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:28
//
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:29
//# Page 654
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:30
//# GROUND TRACKING DETERMINATION PROGRAM P21
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:31
//# PROGRAM DESCRIPTION
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:32
//# MOD NO - 1
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:33
//# MOD BY - N.M.NEVILLE
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:34
//# FUNCTIONAL DECRIPTION-
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:35
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:36
//# TO PROVIDE THE ASTRONAUT DETAILS OF THE LM OR CSM GROUND TRACK WITHOUT
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:37
//# THE NEED FOR GROUND COMMUNICATION (REQUESTED BY DSKY).
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:38
//# CALLING SEQUENCE -
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:39
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:40
//# ASTRONAUT REQUEST THROUGH DSKY V37E21E
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:41
//# SUBROUTINES CALLED-
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:42
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:43
//# GOPERF4
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:44
//# GOFLASH
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:45
//# THISPREC
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:46
//# OTHPREC
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:47
//# LAT-LONG
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:48
//# NORMAL EXIT MODES-
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:49
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:50
//# ASTRONAUT REQUEST TROUGH DSKY TO TERMINATE PROGRAM V34E
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:51
//# ALARM OR ABORT EXIT MODES-
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:52
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:53
//# NONE
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:54
//# OUTPUT -
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:55
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:56
//# OCTAL DISPLAY OF OPTION CODE AND VEHICLE WHOSE GROUND TRACK IS TO BE
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:57
//# COMPUTED
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:58
//#	OPTION CODE	00002
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:59
//#	THIS		00001
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:60
//#	OTHER		00002
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:61
//# DECIMAL DISPLAY OF TIME TO BE INTEGRATED TO HOURS , MINUTES , SECONDS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:62
//# DECIMAL DISPLAY OF LAT,LONG,ALT
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:63
//# ERASABLE INITIALIZATION REQUIRED
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:64
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:65
//# AXO		2DEC	4.652459653 E-5		RADIANS		%68-69 CONSTANTS"
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:66
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:67
//# -AYO		2DEC	2.147535898 E-5		RADIANS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:68
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:69
//# AZO		2DEC	.7753206164		REVOLUTIONS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:70
//# FOR LUNAR ORBITS 504LM VECTOR IS NEEDED
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:71
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:72
//# 504LM		2DEC	-2.700340600 E-5	RADIANS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:73
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:74
//# 504LM	_2	2DEC	-7.514128400 E-4	RADIANS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:75
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:76
//# 504LM	_4	2DEC	_2.553198641 E-4	RADIANS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:77
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:78
//# NONE
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:79
//# DEBRIS
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:80
//#
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:81
//# Page 655
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:82
//# CENTRALS-A,Q,L
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:83
//# OTHER-THOSE USED BY THE ABOVE LISTED SUBROUTINES
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:84
//# SEE LEMPREC,LAT-LONG
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:85
//		SBANK=	LOWSUPER	# FOR LOW 2CADR'S.
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:86
//
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:87
//		BANK	33
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:88
//		SETLOC	P20S
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:89
//		BANK
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:90
//
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:91
//		EBANK=	P21TIME
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:92
//		COUNT*	$$/P21
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:93
//PROG21		CAF	ONE
// slot 23365
            if slot <> 23365 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:94
//		TS	OPTION2		# ASSUMED VEHICLE IS LM , R2 = 00001
// slot 23366
            if slot <> 23366 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23367 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:95
//		CAF	BIT2		#  OPTION 2
// slot 23367
            if slot <> 23367 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:96
//		TC	BANKCALL
// slot 23368
            if slot <> 23368 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1538] to agcAotUnit1538@.

agcAotInstallSourceRope(list(
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:97
//		CADR	GOPERF4
// slot 23369
    23369, 17206
)).

// bank 24, slots 23370-23374
function agcAotUnit1539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23371 {
        if slot <= 23370 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:98
//		TC	GOTOPOOH	# TERMINATE
// slot 23370
            if slot <> 23370 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:99
//		TC	+2		# PROCEED VALUE OF ASSUMED VEHICLE OK
// slot 23371
            if slot <> 23371 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23372 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:100
//		TC	-5		# R2 LOADED THROUGH DSKY
// slot 23372
            if slot <> 23372 or instruction <> 1863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1863, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23373 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:101
//P21PROG1	CAF	V6N34		# LOAD DESIRED TIME OF LAT-LONG.
// slot 23373
                if slot <> 23373 or instruction <> 14261 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1973), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:102
//		TC	BANKCALL
// slot 23374
                if slot <> 23374 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1539] to agcAotUnit1539@.

agcAotInstallSourceRope(list(
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:103
//		CADR	GOFLASH
// slot 23375
    23375, 17020
)).

// bank 24, slots 23376-23379
function agcAotUnit1540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23377 {
        if slot <= 23376 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:104
//		TC	GOTOPOOH	# TERM
// slot 23376
            if slot <> 23376 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:105
//		TC	+2		# PROCEED VALUES OK
// slot 23377
            if slot <> 23377 or instruction <> 1875 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1875, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23378 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:106
//		TC	-5		# TIME LOADED THROUGH DSKY
// slot 23378
            if slot <> 23378 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:107
//		TC	INTPRET
// slot 23379
            if slot <> 23379 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1540] to agcAotUnit1540@.

agcAotInstallSourceRope(list(
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:108
//		DLOAD
// slot 23380
    23380, 65482,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:109
//			DSPTEM1
// slot 23381
    23381, 1100,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:110
//		STCALL	TDEC1		# INTEGRATE TO TIME SPECIFIED IN TDEC
// slot 23382
    23382, 28738,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:111
//			INTSTALL
// slot 23383
    23383, 24088,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:112
//		BON	CLEAR
// slot 23384
    23384, 35864,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:113
//			P21FLAG
// slot 23385
    23385, 392,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:114
//			P21CONT		# ON---RECYCLE USING BASE VECTOR
// slot 23386
    23386, 42704,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:115
//			VINTFLAG	# OFF--IST PASS CALL BASE VECTOR
// slot 23387
    23387, 1912,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:116
//		SLOAD	SR1
// slot 23388
    23388, 58042,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:117
//			OPTION2
// slot 23389
    23389, 1228,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:118
//		BHIZ	SET
// slot 23390
    23390, 35888,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:119
//			+2		# ZERO--THIS VEHICLE(LM)
// slot 23391
    23391, 42690,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:120
//			VINTFLAG	# ONE--OTHER VEHICLE(CM)
// slot 23392
    23392, 1656,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:121
//		CLEAR	CLEAR
// slot 23393
    23393, 35864,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:122
//			DIM0FLAG
// slot 23394
    23394, 1916,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:123
//			INTYPFLG	# PRECISION
// slot 23395
    23395, 1910,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:124
//		CALL
// slot 23396
    23396, 65320,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:125
//			INTEGRV		# CALCULATE
// slot 23397
    23397, 23736,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:126
//		GOTO			# -AND
// slot 23398
    23398, 65360,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:127
//			P21VSAVE	# -SAVE BASE VECTOR
// slot 23399
    23399, 42738,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:128
//P21CONT		VLOAD
// slot 23400
    23400, 65530,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:129
//			P21BASER	# RECYCLE--INTEG FROM BASE VECTOR
// slot 23401
    23401, 3964,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:130
//		STOVL	RCV		# --POS
// slot 23402
    23402, 22202,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:131
//# Page 656
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:132
//			P21BASEV
// slot 23403
    23403, 3976,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:133
//		STODL	VCV		# --VEL
// slot 23404
    23404, 14022,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:134
//			P21TIME
// slot 23405
    23405, 4070,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:135
//		STORE	TET		# --TIME
// slot 23406
    23406, 1694,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:136
//		CLEAR	CLEAR
// slot 23407
    23407, 35864,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:137
//			DIM0FLAG
// slot 23408
    23408, 1916,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:138
//			MOONFLAG
// slot 23409
    23409, 358,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:139
//		SLOAD	BZE
// slot 23410
    23410, 44218,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:140
//			P21ORIG
// slot 23411
    23411, 1256,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:141
//			+3		# ZERO=EARTH
// slot 23412
    23412, 42734,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:142
//		SET			# ---2=MOON
// slot 23413
    23413, 65304,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:143
//			MOONFLAG
// slot 23414
    23414, 102,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:144
// +3		CALL
// slot 23415
    23415, 65320,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:145
//			INTEGRVS
// slot 23416
    23416, 23694,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:146
//P21VSAVE	DLOAD			# SAVE CURRENT BASEVECTOR
// slot 23417
    23417, 65482,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:147
//			TAT
// slot 23418
    23418, 26,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:148
//		STOVL	P21TIME		# --TIME
// slot 23419
    23419, 24550,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:149
//			RATT1
// slot 23420
    23420, 30,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:150
//		STOVL	P21BASER	# --POS B-29 OR B-27
// slot 23421
    23421, 24444,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:151
//			VATT1
// slot 23422
    23422, 42,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:152
//		STORE	P21BASEV	# --VEL B-07 OR B-05
// slot 23423
    23423, 3976,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:153
//		ABVAL	SL*
// slot 23424
    23424, 44876,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:154
//			0,2
// slot 23425
    23425, 48892,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:155
//		STOVL	P21VEL		# VEL/ FOR N91 DISP
// slot 23426
    23426, 24468,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:156
//			RATT
// slot 23427
    23427, 2,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:157
//		UNIT	DOT
// slot 23428
    23428, 41308,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:158
//			VATT		#  U(R).V
// slot 23429
    23429, 14,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:159
//		DDV	ASIN		# U(R).U(V)
// slot 23430
    23430, 56946,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:160
//			P21VEL
// slot 23431
    23431, 3988,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:161
//		STORE	P21GAM		# SIN-1 U(R).U(V) , -90 TO &90
// slot 23432
    23432, 3992,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:162
//		SXA,2	SLOAD
// slot 23433
    23433, 56760,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:163
//			P21ORIG		# 0=EARTH
// slot 23434
    23434, 1254,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:164
//			OPTION2
// slot 23435
    23435, 1228,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:165
//		SR1	BHIZ
// slot 23436
    23436, 39108,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:166
//			+3
// slot 23437
    23437, 42784,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:167
//		GOTO
// slot 23438
    23438, 65360,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:168
//			+4
// slot 23439
    23439, 42790,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:169
// +3		BON
// slot 23440
    23440, 65304,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:170
//			SURFFLAG
// slot 23441
    23441, 4494,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:171
//			P21DSP
// slot 23442
    23442, 42794,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:172
// +4		SET
// slot 23443
    23443, 65304,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:173
//			P21FLAG
// slot 23444
    23444, 104,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:174
//P21DSP		CLEAR	SLOAD		# GENERATE DISPLAY DATA
// slot 23445
    23445, 56600,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:175
//			LUNAFLAG
// slot 23446
    23446, 1894,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:176
//			X2
// slot 23447
    23447, 80,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:177
//		BZE	SET
// slot 23448
    23448, 35928,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:178
//			+2		# 0 = EARTH
// slot 23449
    23449, 42806,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:179
//			LUNAFLAG
// slot 23450
    23450, 1638,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:180
//		VLOAD
// slot 23451
    23451, 65530,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:181
//			RATT
// slot 23452
    23452, 2,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:182
//# Page 657
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:183
//		STODL	ALPHAV
// slot 23453
    23453, 14388,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:184
//			TAT
// slot 23454
    23454, 26,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:185
//		CLEAR	CALL
// slot 23455
    23455, 37912,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:186
//			ERADFLAG
// slot 23456
    23456, 868,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:187
//			LAT-LONG
// slot 23457
    23457, 22994,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:188
//		DMP			# MPAC = ALT, METERS B-29
// slot 23458
    23458, 65290,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:189
//			K.01
// slot 23459
    23459, 10094,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:190
//		STORE	P21ALT		# ALT/100 FOR N91 DISP
// slot 23460
    23460, 3996,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:191
//		EXIT
// slot 23461
    23461, 65532
)).

// bank 24, slots 23462-23463
function agcAotUnit1541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23462 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:192
//		CAF	V06N43		# DISPLAY LAT, LONG, ALT
// slot 23462
        if slot <> 23462 or instruction <> 14260 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1972), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:193
//		TC	BANKCALL	# LAT, LONG = 1/2 REVS B0
// slot 23463
        if slot <> 23463 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1541] to agcAotUnit1541@.

agcAotInstallSourceRope(list(
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:194
//		CADR	GOFLASH		# ALT = KM B14
// slot 23464
    23464, 17020
)).

// bank 24, slots 23465-23467
function agcAotUnit1542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23465 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:195
//		TC	GOTOPOOH	# TERM
// slot 23465
        if slot <> 23465 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23466 {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:196
//		TC	GOTOPOOH
// slot 23466
            if slot <> 23466 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:197
//		TC	INTPRET		# V32E RECYCLE
// slot 23467
            if slot <> 23467 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1542] to agcAotUnit1542@.

agcAotInstallSourceRope(list(
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:198
//		DLOAD	DAD
// slot 23468
    23468, 36298,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:199
//			P21TIME
// slot 23469
    23469, 4070,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:200
//			600SEC		# 600 SECONDS OR 10 MIN
// slot 23470
    23470, 10086,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:201
//		STORE	DSPTEM1
// slot 23471
    23471, 1100,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:202
//		RTB
// slot 23472
    23472, 65336,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:203
//			P21PROG1
// slot 23473
    23473, 42650,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:204
//600SEC		2DEC	60000		# 10 MIN
// slot 23474 23475
    23474, 6, 23475, 21696,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:205
//
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:206
//V06N43		VN	00643
// slot 23476
    23476, 1622,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:207
//V6N34		VN	00634
// slot 23477
    23477, 1604,
// GROUND_TRACKING_DETERMINATION_PROGRAM.agc:208
//K.01		2DEC	.01
// slot 23478 23479
    23478, 326, 23479, 27526
)).

