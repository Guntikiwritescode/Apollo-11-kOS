// PORT: Original source unit GROUND_TRACKING_DETERMINATION_PROGRAM.agc.
// PORT: Physical bank 24. Shared continuation entries, slots 23365–23368.
function agcAotUnit1538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23366 {
        if slot <= 23365 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:2
//# Filename:	GROUND_TRACKING_DETERMINATION_PROGRAM.agc
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:9
//# Pages:	654-657
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:10
//# Mod history:	2009-05-18 RSB	Adapted from the corresponding
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:13
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:22
//# actually created.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:23
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:25
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:28
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:29
//# Page 654
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:30
//# GROUND TRACKING DETERMINATION PROGRAM P21
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:31
//# PROGRAM DESCRIPTION
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:32
//# MOD NO - 1
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:33
//# MOD BY - N.M.NEVILLE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:34
//# FUNCTIONAL DECRIPTION-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:35
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:36
//# TO PROVIDE THE ASTRONAUT DETAILS OF THE LM OR CSM GROUND TRACK WITHOUT
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:37
//# THE NEED FOR GROUND COMMUNICATION (REQUESTED BY DSKY).
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:38
//# CALLING SEQUENCE -
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:39
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:40
//# ASTRONAUT REQUEST THROUGH DSKY V37E21E
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:41
//# SUBROUTINES CALLED-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:42
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:43
//# GOPERF4
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:44
//# GOFLASH
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:45
//# THISPREC
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:46
//# OTHPREC
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:47
//# LAT-LONG
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:48
//# NORMAL EXIT MODES-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:49
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:50
//# ASTRONAUT REQUEST TROUGH DSKY TO TERMINATE PROGRAM V34E
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:51
//# ALARM OR ABORT EXIT MODES-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:52
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:53
//# NONE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:54
//# OUTPUT -
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:55
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:56
//# OCTAL DISPLAY OF OPTION CODE AND VEHICLE WHOSE GROUND TRACK IS TO BE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:57
//# COMPUTED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:58
//#	OPTION CODE	00002
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:59
//#	THIS		00001
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:60
//#	OTHER		00002
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:61
//# DECIMAL DISPLAY OF TIME TO BE INTEGRATED TO HOURS , MINUTES , SECONDS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:62
//# DECIMAL DISPLAY OF LAT,LONG,ALT
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:63
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:64
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:65
//# AXO		2DEC	4.652459653 E-5		RADIANS		%68-69 CONSTANTS"
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:66
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:67
//# -AYO		2DEC	2.147535898 E-5		RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:68
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:69
//# AZO		2DEC	.7753206164		REVOLUTIONS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:70
//# FOR LUNAR ORBITS 504LM VECTOR IS NEEDED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:71
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:72
//# 504LM		2DEC	-2.700340600 E-5	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:73
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:74
//# 504LM	_2	2DEC	-7.514128400 E-4	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:75
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:76
//# 504LM	_4	2DEC	_2.553198641 E-4	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:77
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:78
//# NONE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:79
//# DEBRIS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:80
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:81
//# Page 655
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:82
//# CENTRALS-A,Q,L
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:83
//# OTHER-THOSE USED BY THE ABOVE LISTED SUBROUTINES
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:84
//# SEE LEMPREC,LAT-LONG
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:85
//		SBANK=	LOWSUPER	# FOR LOW 2CADR'S.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:86
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:87
//		BANK	33
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:88
//		SETLOC	P20S
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:89
//		BANK
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:90
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:91
//		EBANK=	P21TIME
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:92
//		COUNT*	$$/P21
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:93
//PROG21		CAF	ONE
// PORT: Fixed ROM slots 23365.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:94
//		TS	OPTION2		# ASSUMED VEHICLE IS LM , R2 = 00001
// PORT: Fixed ROM slots 23366.
            if slot <> 23366 or instruction <> 23141 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23141, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23367 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:95
//		CAF	BIT2		#  OPTION 2
// PORT: Fixed ROM slots 23367.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:96
//		TC	BANKCALL
// PORT: Fixed ROM slots 23368.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:97
//		CADR	GOPERF4
// PORT: Fixed ROM slots 23369.
    23369, 17206
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23370–23374.
function agcAotUnit1539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23371 {
        if slot <= 23370 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:98
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 23370.
            if slot <> 23370 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:99
//		TC	+2		# PROCEED VALUE OF ASSUMED VEHICLE OK
// PORT: Fixed ROM slots 23371.
            if slot <> 23371 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23372 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:100
//		TC	-5		# R2 LOADED THROUGH DSKY
// PORT: Fixed ROM slots 23372.
            if slot <> 23372 or instruction <> 1863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1863, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23373 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:101
//P21PROG1	CAF	V6N34		# LOAD DESIRED TIME OF LAT-LONG.
// PORT: Fixed ROM slots 23373.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:102
//		TC	BANKCALL
// PORT: Fixed ROM slots 23374.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:103
//		CADR	GOFLASH
// PORT: Fixed ROM slots 23375.
    23375, 17020
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23376–23379.
function agcAotUnit1540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23377 {
        if slot <= 23376 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:104
//		TC	GOTOPOOH	# TERM
// PORT: Fixed ROM slots 23376.
            if slot <> 23376 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:105
//		TC	+2		# PROCEED VALUES OK
// PORT: Fixed ROM slots 23377.
            if slot <> 23377 or instruction <> 1875 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1875, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23378 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:106
//		TC	-5		# TIME LOADED THROUGH DSKY
// PORT: Fixed ROM slots 23378.
            if slot <> 23378 or instruction <> 1869 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1869, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:107
//		TC	INTPRET
// PORT: Fixed ROM slots 23379.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:108
//		DLOAD
// PORT: Fixed ROM slots 23380.
    23380, 65482,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:109
//			DSPTEM1
// PORT: Fixed ROM slots 23381.
    23381, 1100,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:110
//		STCALL	TDEC1		# INTEGRATE TO TIME SPECIFIED IN TDEC
// PORT: Fixed ROM slots 23382.
    23382, 28738,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:111
//			INTSTALL
// PORT: Fixed ROM slots 23383.
    23383, 24088,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:112
//		BON	CLEAR
// PORT: Fixed ROM slots 23384.
    23384, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:113
//			P21FLAG
// PORT: Fixed ROM slots 23385.
    23385, 392,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:114
//			P21CONT		# ON---RECYCLE USING BASE VECTOR
// PORT: Fixed ROM slots 23386.
    23386, 42704,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:115
//			VINTFLAG	# OFF--IST PASS CALL BASE VECTOR
// PORT: Fixed ROM slots 23387.
    23387, 1912,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:116
//		SLOAD	SR1
// PORT: Fixed ROM slots 23388.
    23388, 58042,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:117
//			OPTION2
// PORT: Fixed ROM slots 23389.
    23389, 1228,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:118
//		BHIZ	SET
// PORT: Fixed ROM slots 23390.
    23390, 35888,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:119
//			+2		# ZERO--THIS VEHICLE(LM)
// PORT: Fixed ROM slots 23391.
    23391, 42690,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:120
//			VINTFLAG	# ONE--OTHER VEHICLE(CM)
// PORT: Fixed ROM slots 23392.
    23392, 1656,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:121
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 23393.
    23393, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:122
//			DIM0FLAG
// PORT: Fixed ROM slots 23394.
    23394, 1916,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:123
//			INTYPFLG	# PRECISION
// PORT: Fixed ROM slots 23395.
    23395, 1910,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:124
//		CALL
// PORT: Fixed ROM slots 23396.
    23396, 65320,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:125
//			INTEGRV		# CALCULATE
// PORT: Fixed ROM slots 23397.
    23397, 23736,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:126
//		GOTO			# -AND
// PORT: Fixed ROM slots 23398.
    23398, 65360,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:127
//			P21VSAVE	# -SAVE BASE VECTOR
// PORT: Fixed ROM slots 23399.
    23399, 42738,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:128
//P21CONT		VLOAD
// PORT: Fixed ROM slots 23400.
    23400, 65530,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:129
//			P21BASER	# RECYCLE--INTEG FROM BASE VECTOR
// PORT: Fixed ROM slots 23401.
    23401, 3964,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:130
//		STOVL	RCV		# --POS
// PORT: Fixed ROM slots 23402.
    23402, 22202,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:131
//# Page 656
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:132
//			P21BASEV
// PORT: Fixed ROM slots 23403.
    23403, 3976,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:133
//		STODL	VCV		# --VEL
// PORT: Fixed ROM slots 23404.
    23404, 14022,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:134
//			P21TIME
// PORT: Fixed ROM slots 23405.
    23405, 4070,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:135
//		STORE	TET		# --TIME
// PORT: Fixed ROM slots 23406.
    23406, 1694,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:136
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 23407.
    23407, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:137
//			DIM0FLAG
// PORT: Fixed ROM slots 23408.
    23408, 1916,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:138
//			MOONFLAG
// PORT: Fixed ROM slots 23409.
    23409, 358,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:139
//		SLOAD	BZE
// PORT: Fixed ROM slots 23410.
    23410, 44218,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:140
//			P21ORIG
// PORT: Fixed ROM slots 23411.
    23411, 1256,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:141
//			+3		# ZERO=EARTH
// PORT: Fixed ROM slots 23412.
    23412, 42734,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:142
//		SET			# ---2=MOON
// PORT: Fixed ROM slots 23413.
    23413, 65304,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:143
//			MOONFLAG
// PORT: Fixed ROM slots 23414.
    23414, 102,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:144
// +3		CALL
// PORT: Fixed ROM slots 23415.
    23415, 65320,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:145
//			INTEGRVS
// PORT: Fixed ROM slots 23416.
    23416, 23694,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:146
//P21VSAVE	DLOAD			# SAVE CURRENT BASEVECTOR
// PORT: Fixed ROM slots 23417.
    23417, 65482,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:147
//			TAT
// PORT: Fixed ROM slots 23418.
    23418, 26,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:148
//		STOVL	P21TIME		# --TIME
// PORT: Fixed ROM slots 23419.
    23419, 24550,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:149
//			RATT1
// PORT: Fixed ROM slots 23420.
    23420, 30,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:150
//		STOVL	P21BASER	# --POS B-29 OR B-27
// PORT: Fixed ROM slots 23421.
    23421, 24444,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:151
//			VATT1
// PORT: Fixed ROM slots 23422.
    23422, 42,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:152
//		STORE	P21BASEV	# --VEL B-07 OR B-05
// PORT: Fixed ROM slots 23423.
    23423, 3976,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:153
//		ABVAL	SL*
// PORT: Fixed ROM slots 23424.
    23424, 44876,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:154
//			0,2
// PORT: Fixed ROM slots 23425.
    23425, 48892,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:155
//		STOVL	P21VEL		# VEL/ FOR N91 DISP
// PORT: Fixed ROM slots 23426.
    23426, 24468,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:156
//			RATT
// PORT: Fixed ROM slots 23427.
    23427, 2,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:157
//		UNIT	DOT
// PORT: Fixed ROM slots 23428.
    23428, 41308,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:158
//			VATT		#  U(R).V
// PORT: Fixed ROM slots 23429.
    23429, 14,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:159
//		DDV	ASIN		# U(R).U(V)
// PORT: Fixed ROM slots 23430.
    23430, 56946,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:160
//			P21VEL
// PORT: Fixed ROM slots 23431.
    23431, 3988,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:161
//		STORE	P21GAM		# SIN-1 U(R).U(V) , -90 TO &90
// PORT: Fixed ROM slots 23432.
    23432, 3992,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:162
//		SXA,2	SLOAD
// PORT: Fixed ROM slots 23433.
    23433, 56760,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:163
//			P21ORIG		# 0=EARTH
// PORT: Fixed ROM slots 23434.
    23434, 1254,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:164
//			OPTION2
// PORT: Fixed ROM slots 23435.
    23435, 1228,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:165
//		SR1	BHIZ
// PORT: Fixed ROM slots 23436.
    23436, 39108,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:166
//			+3
// PORT: Fixed ROM slots 23437.
    23437, 42784,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:167
//		GOTO
// PORT: Fixed ROM slots 23438.
    23438, 65360,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:168
//			+4
// PORT: Fixed ROM slots 23439.
    23439, 42790,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:169
// +3		BON
// PORT: Fixed ROM slots 23440.
    23440, 65304,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:170
//			SURFFLAG
// PORT: Fixed ROM slots 23441.
    23441, 4494,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:171
//			P21DSP
// PORT: Fixed ROM slots 23442.
    23442, 42794,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:172
// +4		SET
// PORT: Fixed ROM slots 23443.
    23443, 65304,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:173
//			P21FLAG
// PORT: Fixed ROM slots 23444.
    23444, 104,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:174
//P21DSP		CLEAR	SLOAD		# GENERATE DISPLAY DATA
// PORT: Fixed ROM slots 23445.
    23445, 56600,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:175
//			LUNAFLAG
// PORT: Fixed ROM slots 23446.
    23446, 1894,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:176
//			X2
// PORT: Fixed ROM slots 23447.
    23447, 80,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:177
//		BZE	SET
// PORT: Fixed ROM slots 23448.
    23448, 35928,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:178
//			+2		# 0 = EARTH
// PORT: Fixed ROM slots 23449.
    23449, 42806,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:179
//			LUNAFLAG
// PORT: Fixed ROM slots 23450.
    23450, 1638,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:180
//		VLOAD
// PORT: Fixed ROM slots 23451.
    23451, 65530,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:181
//			RATT
// PORT: Fixed ROM slots 23452.
    23452, 2,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:182
//# Page 657
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:183
//		STODL	ALPHAV
// PORT: Fixed ROM slots 23453.
    23453, 14388,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:184
//			TAT
// PORT: Fixed ROM slots 23454.
    23454, 26,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:185
//		CLEAR	CALL
// PORT: Fixed ROM slots 23455.
    23455, 37912,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:186
//			ERADFLAG
// PORT: Fixed ROM slots 23456.
    23456, 868,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:187
//			LAT-LONG
// PORT: Fixed ROM slots 23457.
    23457, 22994,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:188
//		DMP			# MPAC = ALT, METERS B-29
// PORT: Fixed ROM slots 23458.
    23458, 65290,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:189
//			K.01
// PORT: Fixed ROM slots 23459.
    23459, 10094,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:190
//		STORE	P21ALT		# ALT/100 FOR N91 DISP
// PORT: Fixed ROM slots 23460.
    23460, 3996,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:191
//		EXIT
// PORT: Fixed ROM slots 23461.
    23461, 65532
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23462–23463.
function agcAotUnit1541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23462 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:192
//		CAF	V06N43		# DISPLAY LAT, LONG, ALT
// PORT: Fixed ROM slots 23462.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:193
//		TC	BANKCALL	# LAT, LONG = 1/2 REVS B0
// PORT: Fixed ROM slots 23463.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:194
//		CADR	GOFLASH		# ALT = KM B14
// PORT: Fixed ROM slots 23464.
    23464, 17020
)).

// PORT: Physical bank 24. Shared continuation entries, slots 23465–23467.
function agcAotUnit1542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23465 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:195
//		TC	GOTOPOOH	# TERM
// PORT: Fixed ROM slots 23465.
        if slot <> 23465 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23466 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:196
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 23466.
            if slot <> 23466 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:197
//		TC	INTPRET		# V32E RECYCLE
// PORT: Fixed ROM slots 23467.
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
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:198
//		DLOAD	DAD
// PORT: Fixed ROM slots 23468.
    23468, 36298,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:199
//			P21TIME
// PORT: Fixed ROM slots 23469.
    23469, 4070,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:200
//			600SEC		# 600 SECONDS OR 10 MIN
// PORT: Fixed ROM slots 23470.
    23470, 10086,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:201
//		STORE	DSPTEM1
// PORT: Fixed ROM slots 23471.
    23471, 1100,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:202
//		RTB
// PORT: Fixed ROM slots 23472.
    23472, 65336,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:203
//			P21PROG1
// PORT: Fixed ROM slots 23473.
    23473, 42650,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:204
//600SEC		2DEC	60000		# 10 MIN
// PORT: Fixed ROM slots 23474 23475.
    23474, 6, 23475, 21696,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:205
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:206
//V06N43		VN	00643
// PORT: Fixed ROM slots 23476.
    23476, 1622,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:207
//V6N34		VN	00634
// PORT: Fixed ROM slots 23477.
    23477, 1604,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:208
//K.01		2DEC	.01
// PORT: Fixed ROM slots 23478 23479.
    23478, 326, 23479, 27526
)).

