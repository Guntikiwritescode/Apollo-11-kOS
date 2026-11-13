// R63.agc
// bank 26, slots 24594-24594
function agcAotUnit1620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R63.agc:1
//# Copyright:	Public domain.
// R63.agc:2
//# Filename:	R63.agc
// R63.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// R63.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// R63.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// R63.agc:6
//# Assembler:	yaYUL
// R63.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// R63.agc:8
//# Website:	www.ibiblio.org/apollo.
// R63.agc:9
//# Pages:	338-341
// R63.agc:10
//# Mod history:	2009-05-16 RSB	Adapted from the corresponding
// R63.agc:11
//#				Luminary131 file, using page
// R63.agc:12
//#				images from Luminary 1A.
// R63.agc:13
//#
// R63.agc:14
//# This source code has been transcribed or otherwise adapted from
// R63.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// R63.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// R63.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// R63.agc:18
//# in storage size and consequent reduction in image quality as well) are
// R63.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// R63.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// R63.agc:21
//# about getting access to the (much) higher-quality images which Paul
// R63.agc:22
//# actually created.
// R63.agc:23
//#
// R63.agc:24
//# Notations on the hardcopy document read, in part:
// R63.agc:25
//#
// R63.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// R63.agc:27
//#	16:27 JULY 14, 1969
// R63.agc:28
//
// R63.agc:29
//# Page 338
// R63.agc:30
//# SUBROUTINE NAME:	V89CALL
// R63.agc:31
//# MOD NO:	0			DATE:		9 JAN 1968
// R63.agc:32
//# MOD BY:	DIGITAL DEVEL GROUP	LOG SECTION:	R63
// R63.agc:33
//#
// R63.agc:34
//# FUNCTIONAL DESCRIPTION:
// R63.agc:35
//#
// R63.agc:36
//# CALLED BY VERB 89 ENTER DURING P00.  PRIO 10 USED.  CALCULATES AND
// R63.agc:37
//# DISPLAYS FINAL FDAI BALL ANGLES TO POINT LM +X OR +Z AXIS AT CSM.
// R63.agc:38
//#
// R63.agc:39
//# 1. KEY IN V 89 E ONLY IF IN PROG 00.  IF NOT IN P00, OPERATOR ERROR AND
// R63.agc:40
//# EXIT R63, OTHERWISE CONTINUE.
// R63.agc:41
//#
// R63.agc:42
//# 2. IF IN P00, DO IMU STATUS CHECK ROUTINE (R02BOTH).  IF IMU ON AND ITS
// R63.agc:43
//# ORIENTATION KNOWN TO LGC, CONTINUE.
// R63.agc:44
//#
// R63.agc:45
//# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
// R63.agc:46
//# BE POINTED AT CSM.  INITIAL CHOICE IS PREFERRED (+Z) AXIS (R2=1).
// R63.agc:47
//# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT = 1) BY V 22 E 2 E.  CONTINUE
// R63.agc:48
//# AFTER KEYING IN PROCEED.
// R63.agc:49
//#
// R63.agc:50
//# 4. BOTH VEHICLE STATE VECTORS UPDATED BY CONIC EQS.
// R63.agc:51
//#
// R63.agc:52
//# 5. HALF MAGNITUDE UNIT LOS VECTOR (IN STABLE MEMBER COORDINATES) AND
// R63.agc:53
//# HALF MAGNITUDE UNIT SPACECRAFT AXIS VECTOR (IN BODY COORDINATES)
// R63.agc:54
//# PREPARED FOR VECPOINT.
// R63.agc:55
//#
// R63.agc:56
//# 6. GIMBAL ANGLES FROM VECPOINT TRANSFORMED INTO FDAI BALL ANGLES BY
// R63.agc:57
//# BALLANGS.  FLASH DISPLAY V 06 N 18 AND AWAIT RESPONSE.
// R63.agc:58
//#
// R63.agc:59
//# 7. RECYCLE - RETURN TO STEP 4.
// R63.agc:60
//#    TERMINATE - EXIT R63.
// R63.agc:61
//#    PROCEED - RESET 3AXISFLG AND CALL R60LEM FOR ATTITUDE MANEUVER.
// R63.agc:62
//#
// R63.agc:63
//# CALLING SEQUENCE:	V 89 E.
// R63.agc:64
//#
// R63.agc:65
//# SUBROUTINES CALLED:	CHKPOOH, R02BOTH, GOXDSPF, CSMCONIC, LEMCONIC,
// R63.agc:66
//#			VECPOINT, BALLANGS, R60LEM.
// R63.agc:67
//#
// R63.agc:68
//# NORMAL EXIT MODES: 	TC ENDEXT
// R63.agc:69
//#
// R63.agc:70
//# ALARMS:	1. OPERATOR ERROR IF NOT IN P00.
// R63.agc:71
//#		2. PROGRAM ALARM IF IMU IS OFF.
// R63.agc:72
//#		3. PROGRAM ALARM IF IMU ORIENTATION IS UNKNOWN.
// R63.agc:73
//#
// R63.agc:74
//# OUTPUT:	NONE
// R63.agc:75
//#
// R63.agc:76
//# ERASABLE INITIALIZATION REQUIRED:  NONE
// R63.agc:77
//#
// R63.agc:78
//# DEBRIS:	OPTION1, +1, TDEC1, PDINTVSM, SCAXIS, CPHI, CTHETA, CPSI,
// R63.agc:79
//# Page 339
// R63.agc:80
//#		3AXISFLG.
// R63.agc:81
//
// R63.agc:82
//		EBANK=	RONE
// R63.agc:83
//		BANK	32
// R63.agc:84
//		SETLOC	BAWLANGS
// R63.agc:85
//		BANK
// R63.agc:86
//
// R63.agc:87
//		COUNT*	$$/R63
// R63.agc:88
//V89CALL		TC	BANKCALL	# IMU STATUS CHECK.  RETURNS IF ORIENTATION
// slot 24594
    if slot <> 24594 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1620] to agcAotUnit1620@.

agcAotInstallSourceRope(list(
// R63.agc:89
//		CADR	R02BOTH		# KNOWN.  ALARMS IF NOT.
// slot 24595
    24595, 9560
)).

// bank 26, slots 24596-24601
function agcAotUnit1621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24598 {
        if slot <= 24596 {
// R63.agc:90
//		CAF	THREE		# ALLOW ASTRONAUT TO SELECT DESIRED
// slot 24596
            if slot <> 24596 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24597 {
// R63.agc:91
//		TS	OPTIONX		# TRACKING ATTITUDE AXIS.
// slot 24597
                if slot <> 24597 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R63.agc:92
//		CAF	ONE
// slot 24598
                if slot <> 24598 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        if slot <= 24599 {
// R63.agc:93
//		TS	OPTIONX  +1
// slot 24599
            if slot <> 24599 or instruction <> 23082 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24600 {
// R63.agc:94
//		CAF	VB04N12		# V 04 N 12
// slot 24600
                if slot <> 24600 or instruction <> 13391 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1103), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R63.agc:95
//		TC	BANKCALL
// slot 24601
                if slot <> 24601 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1621] to agcAotUnit1621@.

agcAotInstallSourceRope(list(
// R63.agc:96
//		CADR	GOFLASH
// slot 24602
    24602, 17020
)).

// bank 26, slots 24603-24606
function agcAotUnit1622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24604 {
        if slot <= 24603 {
// R63.agc:97
//		TC	ENDEXT		# TERMINATE
// slot 24603
            if slot <> 24603 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R63.agc:98
//		TC 	+2		# PROCEED
// slot 24604
            if slot <> 24604 or instruction <> 1054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24605 {
// R63.agc:99
//		TC	-5		# DATA IN.  OPTION1+1 = 1 FOR Z AXIS
// slot 24605
            if slot <> 24605 or instruction <> 1048 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1048, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R63.agc:100
//V89RECL		TC	INTPRET		#			= 2 FOR X AXIS
// slot 24606
            if slot <> 24606 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1622] to agcAotUnit1622@.

agcAotInstallSourceRope(list(
// R63.agc:101
//		RTB	DAD
// slot 24607
    24607, 36152,
// R63.agc:102
//			LOADTIME	# READ PRESENT TIME
// slot 24608
    24608, 18166,
// R63.agc:103
//			DP1MIN
// slot 24609
    24609, 12452,
// R63.agc:104
//		STORE	TSTART82	# SAVE TIME FOR LEMCONIC CALL
// slot 24610
    24610, 2314,
// R63.agc:105
//		STCALL	TDEC1		# STORE TIME FOR CSMCONIC CALL
// slot 24611
    24611, 28738,
// R63.agc:106
//			CSMCONIC	# CSM STATE VECTOR UPDATE
// slot 24612
    24612, 23660,
// R63.agc:107
//		VLOAD			# CSMCONIC LEFT R VECTOR IN RATT
// slot 24613
    24613, 65530,
// R63.agc:108
//			RATT
// slot 24614
    24614, 2,
// R63.agc:109
//		STODL	RONE		# SAVE FOR LINE OF SIGHT (LOS) COMPUTATION
// slot 24615
    24615, 14606,
// R63.agc:110
//			TSTART82
// slot 24616
    24616, 2314,
// R63.agc:111
//		STCALL	TDEC1		# STORE TIME FOR LEMCONIC CALL
// slot 24617
    24617, 28738,
// R63.agc:112
//			LEMCONIC	# LEM STATE VECTOR UPDATE
// slot 24618
    24618, 23680,
// R63.agc:113
//		VLOAD	VSU		# CSM POSITION - LEM POSITION = LOS
// slot 24619
    24619, 43514,
// R63.agc:114
//			RONE		# LOS VECTOR LEFT IN MPAC
// slot 24620
    24620, 2318,
// R63.agc:115
//			RATT
// slot 24621
    24621, 2,
// R63.agc:116
//		MXV	RTB		# (REFSMAT X LOS).  TRANSFORMS LOS FROM
// slot 24622
    24622, 40098,
// R63.agc:117
//			REFSMMAT	# REFERENCE COORD TO STAB MEMB COORD.
// slot 24623
    24623, 1976,
// R63.agc:118
//			NORMUNIT
// slot 24624
    24624, 18348,
// R63.agc:119
//		STORE	POINTVSM	# STORE LOS FOR VECPOINT CALCULATION
// slot 24625
    24625, 4086,
// R63.agc:120
//		EXIT
// slot 24626
    24626, 65532
)).

// bank 26, slots 24627-24631
function agcAotUnit1623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24628 {
        if slot <= 24627 {
// R63.agc:121
//		CS	OPTIONX +1	# 1 FOR Z AXIS.  2 FOR X AXIS.
// slot 24627
            if slot <> 24627 or instruction <> 16938 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 554).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R63.agc:122
//		AD	ONE
// slot 24628
            if slot <> 24628 or instruction <> 27115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24629 {
// R63.agc:123
//		EXTEND
// slot 24629
            if slot <> 24629 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24630 {
// R63.agc:124
//		BZF	ALINEZ
// slot 24630
                if slot <> 24630 or instruction <> 5195 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5195, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R63.agc:125
//ALINEX		TC	INTPRET		# X AXIS ALIGNMENT
// slot 24631
                if slot <> 24631 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1623] to agcAotUnit1623@.

agcAotInstallSourceRope(list(
// R63.agc:126
//		VLOAD
// slot 24632
    24632, 65530,
// R63.agc:127
//			UNITX		# READ (.5, 0, 0)
// slot 24633
    24633, 6816,
// R63.agc:128
//# Page 340
// R63.agc:129
//V89CALL1	STCALL	SCAXIS		# STORE SELECTED ALIGNMENT AXIS
// slot 24634
    24634, 32746,
// R63.agc:130
//			VECPOINT	# PUTS DESIRED GIM ANG (OG,IG,MG) IN TMPAC
// slot 24635
    24635, 47168,
// R63.agc:131
//		STORE	CPHI		# STORE GIMBAL ANGLES FOR BALLANGS CALL.
// slot 24636
    24636, 420,
// R63.agc:132
//		EXIT
// slot 24637
    24637, 65532
)).

// bank 26, slots 24638-24638
function agcAotUnit1624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R63.agc:133
//		TC	BANKCALL
// slot 24638
    if slot <> 24638 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1624] to agcAotUnit1624@.

agcAotInstallSourceRope(list(
// R63.agc:134
//		CADR	BALLANGS	# PUTS DESIRED BALL ANGLE IN FDAIX,Y,Z
// slot 24639
    24639, 45420
)).

// bank 26, slots 24640-24641
function agcAotUnit1625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24640 {
// R63.agc:135
//		CAF	VB06N18		# V 06 N 18
// slot 24640
        if slot <> 24640 or instruction <> 13392 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1104), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R63.agc:136
//		TC	BANKCALL	# NOUN 18 REFERS TO FDAIX,Y,Z
// slot 24641
        if slot <> 24641 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1625] to agcAotUnit1625@.

agcAotInstallSourceRope(list(
// R63.agc:137
//		CADR	GOFLASH
// slot 24642
    24642, 17020
)).

// bank 26, slots 24643-24646
function agcAotUnit1626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24644 {
        if slot <= 24643 {
// R63.agc:138
//		TC	ENDEXT		# TERMINATE
// slot 24643
            if slot <> 24643 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R63.agc:139
//		TC	+2		# PROCEED
// slot 24644
            if slot <> 24644 or instruction <> 1094 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1094, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24645 {
// R63.agc:140
//		TC	V89RECL		# RECYCLE
// slot 24645
            if slot <> 24645 or instruction <> 1054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1054, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R63.agc:141
//		TC	DOWNFLAG	# RESET 3 AXIS FLAG
// slot 24646
            if slot <> 24646 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1626] to agcAotUnit1626@.

agcAotInstallSourceRope(list(
// R63.agc:142
//		ADRES	3AXISFLG	# RESET BIT6 FLAG WORD 5
// slot 24647
    24647, 168
)).

// bank 26, slots 24648-24648
function agcAotUnit1627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R63.agc:143
//		TC	BANKCALL	# PERFORMS LEM MANEUVER TO ALIGN SELECTED
// slot 24648
    if slot <> 24648 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1627] to agcAotUnit1627@.

agcAotInstallSourceRope(list(
// R63.agc:144
//		CADR	R60LEM		# SPACECRAFT AXIS TO CSM.
// slot 24649
    24649, 45222
)).

// bank 26, slots 24650-24651
function agcAotUnit1628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24650 {
// R63.agc:145
//		TCF	ENDEXT		# TERMINATE R63
// slot 24650
        if slot <> 24650 or instruction <> 6970 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6970, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// R63.agc:146
//
// R63.agc:147
//ALINEZ		TC	INTPRET		# Z AXIS ALIGNMENT
// slot 24651
        if slot <> 24651 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1628] to agcAotUnit1628@.

agcAotInstallSourceRope(list(
// R63.agc:148
//		VLOAD	GOTO
// slot 24652
    24652, 43258,
// R63.agc:149
//			UNITZ		# READ (0, 0, .5)
// slot 24653
    24653, 6808,
// R63.agc:150
//			V89CALL1
// slot 24654
    24654, 45172,
// R63.agc:151
//
// R63.agc:152
//VB04N12		VN	412
// slot 24655
    24655, 1048,
// R63.agc:153
//VB06N18		VN	0618
// slot 24656
    24656, 1572,
// R63.agc:154
//# Page 341
// R63.agc:155
//DP1MIN		2DEC	6000
// slot 24657 24658
    24657, 0, 24658, 12000
)).

// no code for the lines below
// R63.agc:156
//
