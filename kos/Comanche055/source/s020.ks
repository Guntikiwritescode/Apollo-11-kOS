// PORT: Original source unit GROUND_TRACKING_DETERMINATION_PROGRAM.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 33793–33796.
function agcAotUnit1879 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33794 {
        if slot <= 33793 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:2
//# Filename:	GROUND_TRACKING_DETERMINATION_PROGRAM.agc
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:7
//# Reference:	pp. 456-459
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:8
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:9
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:10
//# Mod history:	2009-05-07 OH	Transcription Batch 1 Assignment
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:11
//#		2009-05-20 RSB	Corrected a couple of DIMOFLAG to DIM0FLAG.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:12
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:14
//# from scanned documents.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:15
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:16
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:17
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:18
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:19
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:20
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:21
//#	Prepared by
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:22
//#			Massachusetts Institute of Technology
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:23
//#			75 Cambridge Parkway
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:24
//#			Cambridge, Massachusetts
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:25
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:26
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:27
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:28
//# Refer directly to the online document mentioned above for further information.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:29
//# Please report any errors to info@sandroid.org.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:30
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:31
//# Page 456
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:32
//# GROUND TRACKING DETERMINATION PROGRAM P21
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:33
//# PROGRAM DESCRIPTION
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:34
//# MOD NO - 1
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:35
//# MOD BY - N.M.NEVILLE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:36
//# FUNCTIONAL DECRIPTION-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:37
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:38
//# TO PROVIDE THE ASTRONAUT DETAILS OF THE LM OR CSM GROUND TRACK WITHOUT
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:39
//# THE NEED FOR GROUND COMMUNICATION (REQUESTED BY DSKY).
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:40
//# CALLING SEQUENCE -
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:41
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:42
//# ASTRONAUT REQUEST THROUGH DSKY V37E21E
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:43
//# SUBROUTINES CALLED-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:44
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:45
//# GOPERF4
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:46
//# GOFLASH
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:47
//# THISPREC
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:48
//# OTHPREC
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:49
//# LAT-LONG
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:50
//# NORMAL EXIT MODES-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:51
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:52
//# ASTRONAUT REQUEST THROUGH DSKY TO TERMINATE PROGRAM V34E
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:53
//# ALARM OR ABORT EXIT MODES-
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:54
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:55
//# NONE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:56
//# OUTPUT -
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:57
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:58
//# OCTAL DISPLAY OF OPTION CODE AND VEHICLE WHOSE GROUND TRACK IS TO BE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:59
//# COMPUTED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:60
//#	OPTION CODE	00002
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:61
//#	THIS		00001
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:62
//#	OTHER		00002
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:63
//# DECIMAL DISPLAY OF TIME TO BE INTEGRATED TO HOURS , MINUTES , SECONDS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:64
//# DECIMAL DISPLAY OF LAT,LONG,ALT
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:65
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:66
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:67
//# AX0		2DEC	4.652459653 E-5		RADIANS		"68-69 CONSTANTS"
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:68
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:69
//# -AY0		2DEC	2.147535898 E-5		RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:70
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:71
//# AZ0		2DEC	.7753206164		REVOLUTIONS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:72
//# FOR LUNAR ORBITS 504LM VECTOR IS NEEDED
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:73
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:74
//# 504LM		2DEC	-2.700340600 E-5	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:75
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:76
//# 504LM _2	2DEC	-7.514128400 E-4	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:77
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:78
//# 504LM _4	2DEC	_2.553198641 E-4	RADIANS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:79
//#
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:80
//# NONE
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:81
//# DEBRIS
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:82
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:83
//# Page 457
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:84
//# CENTRALS-A,Q,L
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:85
//# OTHER-THOSE USED BY THE ABOVE LISTED SUBROUTINES
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:86
//# SEE LEMPREC,LAT-LONG
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:87
//		SBANK=	LOWSUPER	# FOR LOW 2CADR'S.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:88
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:89
//		BANK	33
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:90
//		SETLOC	P20S
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:91
//		BANK
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:92
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:93
//		EBANK=	P21TIME
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:94
//		COUNT	24/P21
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:95
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:96
//PROG21		CAF	ONE
// PORT: Fixed ROM slots 33793.
            if slot <> 33793 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:97
//		TS	OPTION2		# ASSUMED VEHICLE IS LM , R2 = 00001
// PORT: Fixed ROM slots 33794.
            if slot <> 33794 or instruction <> 23130 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23130, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33795 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:98
//		CAF	BIT2		#  OPTION 2
// PORT: Fixed ROM slots 33795.
            if slot <> 33795 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:99
//		TC	BANKCALL
// PORT: Fixed ROM slots 33796.
            if slot <> 33796 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1879] to agcAotUnit1879@.

agcAotInstallSourceRope(list(
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:100
//		CADR	GOPERF4
// PORT: Fixed ROM slots 33797.
    33797, 17498
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33798–33802.
function agcAotUnit1880 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33799 {
        if slot <= 33798 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:101
//		TC	GOTOPOOH	# TERMINATE
// PORT: Fixed ROM slots 33798.
            if slot <> 33798 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:102
//		TC	+2		# PROCEED VALUE OF ASSUMED VEHICLE OK
// PORT: Fixed ROM slots 33799.
            if slot <> 33799 or instruction <> 1033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1033, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33800 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:103
//		TC	-5		# R2 LOADED THROUGH DSKY
// PORT: Fixed ROM slots 33800.
            if slot <> 33800 or instruction <> 1027 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1027, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33801 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:104
//P21PROG1	CAF	V6N34		# LOAD DESIRED TIME OF LAT-LONG.
// PORT: Fixed ROM slots 33801.
                if slot <> 33801 or instruction <> 13418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1130), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:105
//		TC	BANKCALL
// PORT: Fixed ROM slots 33802.
                if slot <> 33802 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1880] to agcAotUnit1880@.

agcAotInstallSourceRope(list(
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:106
//		CADR	GOFLASH
// PORT: Fixed ROM slots 33803.
    33803, 17312
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33804–33807.
function agcAotUnit1881 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33805 {
        if slot <= 33804 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:107
//		TC	GOTOPOOH	# TERM
// PORT: Fixed ROM slots 33804.
            if slot <> 33804 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:108
//		TC	+2		# PROCEED VALUES OK
// PORT: Fixed ROM slots 33805.
            if slot <> 33805 or instruction <> 1039 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1039, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33806 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:109
//		TC	-5		# TIME LOADED THROUGH DSKY
// PORT: Fixed ROM slots 33806.
            if slot <> 33806 or instruction <> 1033 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1033, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:110
//		TC	INTPRET
// PORT: Fixed ROM slots 33807.
            if slot <> 33807 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1881] to agcAotUnit1881@.

agcAotInstallSourceRope(list(
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:111
//		DLOAD
// PORT: Fixed ROM slots 33808.
    33808, 65482,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:112
//			DSPTEM1
// PORT: Fixed ROM slots 33809.
    33809, 1100,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:113
//		STCALL	TDEC1		# INTEG TO TIME SPECIFIED IN TDEC
// PORT: Fixed ROM slots 33810.
    33810, 28738,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:114
//			INTSTALL
// PORT: Fixed ROM slots 33811.
    33811, 24132,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:115
//		BON	SET
// PORT: Fixed ROM slots 33812.
    33812, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:116
//			P21FLAG
// PORT: Fixed ROM slots 33813.
    33813, 1414,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:117
//			P21CONT		# ON...RECYCLE USING BASE VECTOR
// PORT: Fixed ROM slots 33814.
    33814, 63560,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:118
//			VINTFLAG	# OFF..1ST PASS CALC BASE VECTOR
// PORT: Fixed ROM slots 33815.
    33815, 1656,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:119
//		SLOAD	SR1
// PORT: Fixed ROM slots 33816.
    33816, 58042,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:120
//			OPTION2
// PORT: Fixed ROM slots 33817.
    33817, 1206,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:121
//		BHIZ	CLEAR
// PORT: Fixed ROM slots 33818.
    33818, 35888,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:122
//			+2		# ZERO..THIS VEHICLE (CM)
// PORT: Fixed ROM slots 33819.
    33819, 63546,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:123
//			VINTFLAG	# ONE...OTHER VEHICLE(LM)
// PORT: Fixed ROM slots 33820.
    33820, 1912,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:124
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 33821.
    33821, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:125
//			DIM0FLAG
// PORT: Fixed ROM slots 33822.
    33822, 1916,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:126
//			INTYPFLG	# PRECISION
// PORT: Fixed ROM slots 33823.
    33823, 1910,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:127
//		CALL
// PORT: Fixed ROM slots 33824.
    33824, 65320,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:128
//			INTEGRV		# CALCULATE
// PORT: Fixed ROM slots 33825.
    33825, 23780,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:129
//		GOTO			# .AND
// PORT: Fixed ROM slots 33826.
    33826, 65360,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:130
//			P21VSAVE	# ..SAVE BASE VECTOR
// PORT: Fixed ROM slots 33827.
    33827, 63594,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:131
//P21CONT		VLOAD			# RECYCLE..INTEG FROM BASE VECTOR
// PORT: Fixed ROM slots 33828.
    33828, 65530,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:132
//			P21BASER
// PORT: Fixed ROM slots 33829.
    33829, 3850,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:133
//# Page 458
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:134
//		STOVL	RCV		# ..POS
// PORT: Fixed ROM slots 33830.
    33830, 22202,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:135
//			P21BASEV
// PORT: Fixed ROM slots 33831.
    33831, 3862,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:136
//		STODL	VCV		# ..VEL
// PORT: Fixed ROM slots 33832.
    33832, 14022,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:137
//			P21TIME
// PORT: Fixed ROM slots 33833.
    33833, 2460,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:138
//		STORE	TET		# ..TIME
// PORT: Fixed ROM slots 33834.
    33834, 1694,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:139
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 33835.
    33835, 35864,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:140
//			DIM0FLAG
// PORT: Fixed ROM slots 33836.
    33836, 1916,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:141
//			MOONFLAG
// PORT: Fixed ROM slots 33837.
    33837, 358,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:142
//		SLOAD	BZE
// PORT: Fixed ROM slots 33838.
    33838, 44218,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:143
//			P21ORIG
// PORT: Fixed ROM slots 33839.
    33839, 3848,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:144
//			+3		# ZERO = EARTH
// PORT: Fixed ROM slots 33840.
    33840, 63590,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:145
//		SET			# ...2 = MOON
// PORT: Fixed ROM slots 33841.
    33841, 65304,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:146
//			MOONFLAG
// PORT: Fixed ROM slots 33842.
    33842, 102,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:147
//		CALL
// PORT: Fixed ROM slots 33843.
    33843, 65320,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:148
//			INTEGRVS
// PORT: Fixed ROM slots 33844.
    33844, 23738,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:149
//P21VSAVE	DLOAD			# SAVE CURRENT BASE VECTOR
// PORT: Fixed ROM slots 33845.
    33845, 65482,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:150
//			TAT
// PORT: Fixed ROM slots 33846.
    33846, 26,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:151
//		STOVL	P21TIME		# ..TIME
// PORT: Fixed ROM slots 33847.
    33847, 22940,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:152
//			RATT1
// PORT: Fixed ROM slots 33848.
    33848, 30,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:153
//		STOVL	P21BASER	# ..POS B-29 OR B-27
// PORT: Fixed ROM slots 33849.
    33849, 24330,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:154
//			VATT1
// PORT: Fixed ROM slots 33850.
    33850, 42,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:155
//		STORE	P21BASEV	# ..VEL B-7  OR B-5
// PORT: Fixed ROM slots 33851.
    33851, 3862,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:156
//		ABVAL	SL*
// PORT: Fixed ROM slots 33852.
    33852, 44876,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:157
//			0,2
// PORT: Fixed ROM slots 33853.
    33853, 48892,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:158
//		STOVL	P21VEL		# /VEL/ FOR N73 DSP
// PORT: Fixed ROM slots 33854.
    33854, 24358,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:159
//			RATT
// PORT: Fixed ROM slots 33855.
    33855, 2,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:160
//		UNIT	DOT
// PORT: Fixed ROM slots 33856.
    33856, 41308,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:161
//			VATT		# U(R).(V)
// PORT: Fixed ROM slots 33857.
    33857, 14,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:162
//		DDV	ASIN		# U(R).U(V)
// PORT: Fixed ROM slots 33858.
    33858, 56946,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:163
//			P21VEL
// PORT: Fixed ROM slots 33859.
    33859, 3878,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:164
//		STORE	P21GAM		# SIN-1 U(R).U(V), -90 TO +90
// PORT: Fixed ROM slots 33860.
    33860, 3882,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:165
//		SXA,2	SET
// PORT: Fixed ROM slots 33861.
    33861, 36024,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:166
//			P21ORIG		# 0 = EARTH  2 = MOON
// PORT: Fixed ROM slots 33862.
    33862, 3846,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:167
//			P21FLAG
// PORT: Fixed ROM slots 33863.
    33863, 1126,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:168
//P21DSP		CLEAR	SLOAD		# GENERATE DISPLAY DATA
// PORT: Fixed ROM slots 33864.
    33864, 56600,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:169
//			LUNAFLAG
// PORT: Fixed ROM slots 33865.
    33865, 1894,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:170
//			X2
// PORT: Fixed ROM slots 33866.
    33866, 80,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:171
//		BZE	SET
// PORT: Fixed ROM slots 33867.
    33867, 35928,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:172
//			+2		# 0 = EARTH
// PORT: Fixed ROM slots 33868.
    33868, 63644,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:173
//			LUNAFLAG
// PORT: Fixed ROM slots 33869.
    33869, 1638,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:174
//		VLOAD
// PORT: Fixed ROM slots 33870.
    33870, 65530,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:175
//			RATT
// PORT: Fixed ROM slots 33871.
    33871, 2,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:176
//		STODL	ALPHAV
// PORT: Fixed ROM slots 33872.
    33872, 14548,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:177
//			TAT
// PORT: Fixed ROM slots 33873.
    33873, 26,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:178
//		CLEAR	CALL
// PORT: Fixed ROM slots 33874.
    33874, 37912,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:179
//			ERADFLAG
// PORT: Fixed ROM slots 33875.
    33875, 868,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:180
//			LAT-LONG
// PORT: Fixed ROM slots 33876.
    33876, 23024,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:181
//		DMP			# MPAC = ALT, METERS B-29
// PORT: Fixed ROM slots 33877.
    33877, 65290,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:182
//			K.01
// PORT: Fixed ROM slots 33878.
    33878, 30936,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:183
//		STORE	P21ALT		# ALT/100 FOR N73 DSP
// PORT: Fixed ROM slots 33879.
    33879, 3874,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:184
//# Page 459
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:185
//		EXIT
// PORT: Fixed ROM slots 33880.
    33880, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33881–33882.
function agcAotUnit1882 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33881 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:186
//		CAF	V06N43		# DISPLAY LAT,LONG,ALT
// PORT: Fixed ROM slots 33881.
        if slot <> 33881 or instruction <> 13417 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1129), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:187
//		TC	BANKCALL	# LAT,LONG = REVS B0 BOTH EARTH/MOON
// PORT: Fixed ROM slots 33882.
        if slot <> 33882 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1882] to agcAotUnit1882@.

agcAotInstallSourceRope(list(
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:188
//		CADR	GOFLASH		# ALT = METERS B-29  BOTH EARTH/MOON
// PORT: Fixed ROM slots 33883.
    33883, 17312
)).

// PORT: Physical bank 37. Shared continuation entries, slots 33884–33886.
function agcAotUnit1883 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33884 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:189
//		TC	GOTOPOOH	# TERM
// PORT: Fixed ROM slots 33884.
        if slot <> 33884 or instruction <> 2118 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2118, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33885 {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:190
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 33885.
            if slot <> 33885 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:191
//		TC	INTPRET		# V32E RECYCLE
// PORT: Fixed ROM slots 33886.
            if slot <> 33886 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1883] to agcAotUnit1883@.

agcAotInstallSourceRope(list(
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:192
//		DLOAD	DAD
// PORT: Fixed ROM slots 33887.
    33887, 36298,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:193
//			P21TIME
// PORT: Fixed ROM slots 33888.
    33888, 2460,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:194
//			600SEC		# 600 SECONDS OR 10 MIN
// PORT: Fixed ROM slots 33889.
    33889, 30924,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:195
//		STORE	DSPTEM1
// PORT: Fixed ROM slots 33890.
    33890, 1100,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:196
//		RTB
// PORT: Fixed ROM slots 33891.
    33891, 65336,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:197
//			P21PROG1
// PORT: Fixed ROM slots 33892.
    33892, 63506,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:198
//600SEC		2DEC	60000		# 10 MIN
// PORT: Fixed ROM slots 33893 33894.
    33893, 6, 33894, 21696,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:199
//
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:200
//P21ONENN	OCT	00001		# NEEDED TO DETERMINE VEHICLE
// PORT: Fixed ROM slots 33895.
    33895, 2,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:201
//		OCT	00000		# TO BE INTEGRATED
// PORT: Fixed ROM slots 33896.
    33896, 0,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:202
//V06N43		VN	00643
// PORT: Fixed ROM slots 33897.
    33897, 1622,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:203
//V6N34		VN	00634
// PORT: Fixed ROM slots 33898.
    33898, 1604,
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:204
//K.01		2DEC	.01
// PORT: Fixed ROM slots 33899 33900.
    33899, 326, 33900, 27526
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE GROUND_TRACKING_DETERMINATION_PROGRAM.agc:205
//
