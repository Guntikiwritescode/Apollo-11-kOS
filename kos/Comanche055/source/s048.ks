// P61-P67.agc
// bank 26, slots 24719-24725
function agcAotUnit1424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24721 {
        if slot <= 24719 {
// P61-P67.agc:1
//# Copyright:    Public domain.
// P61-P67.agc:2
//# Filename:     P61-P67.agc
// P61-P67.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// P61-P67.agc:4
//#               is part of the source code for the Command Module's
// P61-P67.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// P61-P67.agc:6
//# Assembler:    yaYUL
// P61-P67.agc:7
//# Reference:    pp. 789-818
// P61-P67.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// P61-P67.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// P61-P67.agc:10
//# Mod history:  2009-05-12 RSB	Adapted from Colossus249 file of the same
// P61-P67.agc:11
//#				name and Comanche 055 page images.
// P61-P67.agc:12
//#		2009-05-20 RSB	Corrections:  V06N68 -> V06N74, added missing
// P61-P67.agc:13
//#				definition of V06N74, in several
// P61-P67.agc:14
//#				interpreter operands fixed stuff like
// P61-P67.agc:15
//#				N-M,1 to N -M,1
// P61-P67.agc:16
//#
// P61-P67.agc:17
//# The contents of the "Comanche055" files, in general, are transcribed
// P61-P67.agc:18
//# from scanned documents.
// P61-P67.agc:19
//#
// P61-P67.agc:20
//#       Assemble revision 055 of AGC program Comanche by NASA
// P61-P67.agc:21
//#       2021113-051.  April 1, 1969.
// P61-P67.agc:22
//#
// P61-P67.agc:23
//#       This AGC program shall also be referred to as Colossus 2A
// P61-P67.agc:24
//#
// P61-P67.agc:25
//#       Prepared by
// P61-P67.agc:26
//#                       Massachusetts Institute of Technology
// P61-P67.agc:27
//#                       75 Cambridge Parkway
// P61-P67.agc:28
//#                       Cambridge, Massachusetts
// P61-P67.agc:29
//#
// P61-P67.agc:30
//#       under NASA contract NAS 9-4065.
// P61-P67.agc:31
//#
// P61-P67.agc:32
//# Refer directly to the online document mentioned above for further
// P61-P67.agc:33
//# information.  Please report any errors to info@sandroid.org.
// P61-P67.agc:34
//
// P61-P67.agc:35
//# Page 789
// P61-P67.agc:36
//# PROGRAM:	P61
// P61-P67.agc:37
//# MOD NO.:	0	MAR. 13, 1967
// P61-P67.agc:38
//# MOD BY:	R. HIRSCHKOP
// P61-P67.agc:39
//# MOD NO: 1	MOD BY:  RR BAIRNSFATHER	DATE: 22 JUN 67		RESTARTS
// P61-P67.agc:40
//# MOD NO: 2	MOD BY:  RR BAIRNSFATHER	DATE: 17 JAN 68		COLOSSUS GSOP CHANGES
// P61-P67.agc:41
//# MOD NO: 3	MOD BY:  RR BAIRNSFATHER	DATE:  8 MAY 68		DELETE CMSM MANEUVER (PCR 50)
// P61-P67.agc:42
//# FUNCTION:	TO CALCULATE AND DISPLAY EMS INITIALIZATION DATA
// P61-P67.agc:43
//# CALLING SEQUENCE:  BY V37
// P61-P67.agc:44
//# EXIT:		TO P62
// P61-P67.agc:45
//# SUBROUTINE CALLS:  S61.1, S61.3, GOFLASH, FLAGUP, R02BOTH
// P61-P67.agc:46
//# ERASABLE INITIALIZATION:
// P61-P67.agc:47
//#	EMSALT (-29) M		.05G ALTITUDE ABOVE FISCHER ELLIPSOID	PAD LOADED.
// P61-P67.agc:48
//#	ALFAPAD /180		HYPERSONIC CM TRIM ANGLE OF ATTACK	PAD LOADED
// P61-P67.agc:49
//# OUTPUT:	THE FOLLOWING REGISTERS ARE WRITTEN IN FOR USE BY DISPLAYS
// P61-P67.agc:50
//#		GMAX	100 GMAX (-14) G,S	MAXIMUM ACCELERATION
// P61-P67.agc:51
//#		VPRED	(-7) M/CS		PREDICTED VELOCITY AT 400K FT
// P61-P67.agc:52
//#		GAMMAEI	(GAMMA/360		PREDICTED GAMMA    AT 400K FT
// P61-P67.agc:53
//#		RTGO	THETAH/360		RANGE ANGLE TO SPLASH FROM EMSALT	EMSALT IS PAD LOADED
// P61-P67.agc:54
//#		VIO	(-7) M/CS		INERTIAL VELOCITY AT	   EMSALT	EMSALT IS PAD LOADED
// P61-P67.agc:55
//#		TTE	(-28) CS		TIME TO			   EMSALT	EMSALT IS PAD LOADED
// P61-P67.agc:56
//#		LAT(SPL) /360			TARGET LOCATION				LEFT BY DSKY
// P61-P67.agc:57
//#		LNG(SPL) /360			TARGET LOCATION				LEFT BY DSKY
// P61-P67.agc:58
//#		HEADSUP	(0)			+1 = LIFT DOWN, -1 = LIFT UP		LEFT BY DSKY
// P61-P67.agc:59
//# DEBRIS:	SEE SUBROUTINES.
// P61-P67.agc:60
//
// P61-P67.agc:61
//		BANK	26
// P61-P67.agc:62
//		SETLOC	P60S
// P61-P67.agc:63
//		BANK
// P61-P67.agc:64
//
// P61-P67.agc:65
//		EBANK=	AOG
// P61-P67.agc:66
//
// P61-P67.agc:67
//		COUNT*	$$/P61
// P61-P67.agc:68
//
// P61-P67.agc:69
//P61		CA	BIT14		# EXTENDED VERB SHOULD BE FREE THIS CLOSE
// slot 24719
            if slot <> 24719 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24720 {
// P61-P67.agc:70
//		TS	EXTVBACT	# TO V37
// slot 24720
                if slot <> 24720 or instruction <> 23076 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:71
//					# LOCK OUT EXTENDED VERBS SO CAN USE TFF
// P61-P67.agc:72
//					# ROUTINES.  EXT VERB ERASE IS USED
// P61-P67.agc:73
//
// P61-P67.agc:74
//		CS	ONE		# REMOVE IF HEADSUP EVER ON UPLINK DATA
// slot 24721
                if slot <> 24721 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24723 {
            if slot <= 24722 {
// P61-P67.agc:75
//		TS	HEADSUP		# PRELOAD
// slot 24722
                if slot <> 24722 or instruction <> 23510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23510, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:76
//
// P61-P67.agc:77
//		TC	S61.1		# CHECK STATE VECTOR AND IMU ORIENTATION
// slot 24723
                if slot <> 24723 or instruction <> 1380 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1380, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24724 {
// P61-P67.agc:78
//					# RV 60GENRET. DOES PHASCHNG, GROUP 4.
// P61-P67.agc:79
//
// P61-P67.agc:80
//		CA	V06N61		# LAT(SPL)	LNG(SPL)	HEADSUP
// slot 24724
                if slot <> 24724 or instruction <> 13589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1301), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:81
//					# XXX.XX DEG	XXX.XX DEG	XXXXX.
// P61-P67.agc:82
//		TC	BANKCALL
// slot 24725
                if slot <> 24725 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1424] to agcAotUnit1424@.

agcAotInstallSourceRope(list(
// P61-P67.agc:83
//		CADR	GOFLASHR
// slot 24726
    24726, 17502
)).

// bank 26, slots 24727-24730
function agcAotUnit1425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24728 {
        if slot <= 24727 {
// P61-P67.agc:84
//		TC	GOTOPOOH
// slot 24727
            if slot <> 24727 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:85
//# Page 790
// P61-P67.agc:86
//		TC	P61.4
// slot 24728
            if slot <> 24728 or instruction <> 1181 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1181, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24729 {
// P61-P67.agc:87
//		TC	-5
// slot 24729
            if slot <> 24729 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:88
//
// P61-P67.agc:89
//P61.3		TC	PHASCHNG
// slot 24730
            if slot <> 24730 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1425] to agcAotUnit1425@.

agcAotInstallSourceRope(list(
// P61-P67.agc:90
//		OCT	00014
// slot 24731
    24731, 24
)).

// bank 26, slots 24732-24738
function agcAotUnit1426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24734 {
        if slot <= 24732 {
// P61-P67.agc:91
//
// P61-P67.agc:92
//		TC	ENDOFJOB
// slot 24732
            if slot <> 24732 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24733 {
// P61-P67.agc:93
//
// P61-P67.agc:94
//P61.4		ZL
// slot 24733
                if slot <> 24733 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:95
//		CCS	HEADSUP		# C(HEADSUP)= +1/-1
// slot 24734
                if slot <> 24734 or instruction <> 5078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 982).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24736 {
            if slot <= 24735 {
// P61-P67.agc:96
//		CA	BIT14		# IF HEADSUP POS,ROLLC =180 DEG.(LIFT DWN)
// slot 24735
                if slot <> 24735 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:97
//		NOOP			# IF HEADSUP NEG,ROLLC =0 (LIFT UP)
// slot 24736
                if slot <> 24736 or instruction <> 5281 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5281, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24737 {
// P61-P67.agc:98
//		DXCH	ROLLC		# ROLLC IS USED BY S62.3: GIM ANG AT .05G
// slot 24737
                if slot <> 24737 or instruction <> 22478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 974, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:99
//
// P61-P67.agc:100
//		TC	INTPRET
// slot 24738
                if slot <> 24738 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1426] to agcAotUnit1426@.

agcAotInstallSourceRope(list(
// P61-P67.agc:101
//NEWRNVN		DLOAD
// slot 24739
    24739, 65482,
// P61-P67.agc:102
//			PIPTIME		# SAVE TIME OF RN,VN TO DETERMINE IF AN
// slot 24740
    24740, 1290,
// P61-P67.agc:103
//		STCALL	MM		# UPDATE HAS OCCURRED.
// slot 24741
    24741, 32594,
// P61-P67.agc:104
//			STARTEN1	# INITIALIZE
// slot 24742
    24742, 43110,
// P61-P67.agc:105
//		VLOAD
// slot 24743
    24743, 65530,
// P61-P67.agc:106
//			RN
// slot 24744
    24744, 1266,
// P61-P67.agc:107
//		STORE	RONE
// slot 24745
    24745, 2478,
// P61-P67.agc:108
//		UNIT
// slot 24746
    24746, 65372,
// P61-P67.agc:109
//		STOVL	URONE
// slot 24747
    24747, 22982,
// P61-P67.agc:110
//			VN
// slot 24748
    24748, 1278,
// P61-P67.agc:111
//		STORE	VONE
// slot 24749
    24749, 2490,
// P61-P67.agc:112
//		VXV	UNIT
// slot 24750
    24750, 44602,
// P61-P67.agc:113
//			URONE
// slot 24751
    24751, 2502,
// P61-P67.agc:114
//		STORE	UNI
// slot 24752
    24752, 3716,
// P61-P67.agc:115
//DUMPP61		DLOAD	DSU
// slot 24753
    24753, 38346,
// P61-P67.agc:116
//			MM		# INITIAL VALUE OF PIPTIME
// slot 24754
    24754, 3922,
// P61-P67.agc:117
//			PIPTIME
// slot 24755
    24755, 1290,
// P61-P67.agc:118
//		BMN	CALRB
// slot 24756
    24756, 37952,
// P61-P67.agc:119
//			NEWRNVN		# UPDATED... GO TRY AGAIN
// slot 24757
    24757, 45382,
// P61-P67.agc:120
//			S61.2		# GET DISPLAY DATA FOR N60 AND N63
// slot 24758
    24758, 45906
)).

// bank 26, slots 24759-24761
function agcAotUnit1427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24759 {
// P61-P67.agc:121
//					# AND RETURN IN BASIC, BELOW.
// P61-P67.agc:122
//P61.1		TC	CLEARMRK
// slot 24759
        if slot <> 24759 or instruction <> 2910 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2910, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24760 {
// P61-P67.agc:123
//		CA	V06N60		# GMAX		VPRED		GAMMAEI
// slot 24760
            if slot <> 24760 or instruction <> 13588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1300), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:124
//					# XXX.XX G	XXXXX. FPS	XXX.XX DEG
// P61-P67.agc:125
//		TC	BANKCALL
// slot 24761
            if slot <> 24761 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1427] to agcAotUnit1427@.

agcAotInstallSourceRope(list(
// P61-P67.agc:126
//		CADR	GOFLASH
// slot 24762
    24762, 17312
)).

// bank 26, slots 24763-24766
function agcAotUnit1428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24764 {
        if slot <= 24763 {
// P61-P67.agc:127
//
// P61-P67.agc:128
//		TC	GOTOPOOH
// slot 24763
            if slot <> 24763 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:129
//		TC	P61.2		# PROCEED
// slot 24764
            if slot <> 24764 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24765 {
// P61-P67.agc:130
//		TC	-5
// slot 24765
            if slot <> 24765 or instruction <> 1208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:131
//
// P61-P67.agc:132
//P61.2		TC	INTPRET		# CORRECT TTE FOR TIME LAPSE DURING
// slot 24766
            if slot <> 24766 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1428] to agcAotUnit1428@.

agcAotInstallSourceRope(list(
// P61-P67.agc:133
//					# ABOVE DISPLAY.
// P61-P67.agc:134
//		RTB	DSU
// slot 24767
    24767, 38200,
// P61-P67.agc:135
//			LOADTIME	# CURRENT TIME.
// slot 24768
    24768, 38544,
// P61-P67.agc:136
//# Page 791
// P61-P67.agc:137
//			MM		# PIPTIME FOR RONE & VONE.
// slot 24769
    24769, 3922,
// P61-P67.agc:138
//		DAD
// slot 24770
    24770, 65306,
// P61-P67.agc:139
//			TTE1		# NEGATIVE OF FREE FALL TIME.
// slot 24771
    24771, 4022,
// P61-P67.agc:140
//		STORE	TTE		# DECREMENTED
// slot 24772
    24772, 4014,
// P61-P67.agc:141
//
// P61-P67.agc:142
//		EXIT
// slot 24773
    24773, 65532
)).

// bank 26, slots 24774-24775
function agcAotUnit1429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24774 {
// P61-P67.agc:143
//
// P61-P67.agc:144
//		CA	V06N63		# RTGO		VIO		TTE
// slot 24774
        if slot <> 24774 or instruction <> 13590 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1302), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:145
//					# XXXX.X NM	XXXXX. FPS	XXBXX M,S
// P61-P67.agc:146
//		TC	BANKCALL
// slot 24775
        if slot <> 24775 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1429] to agcAotUnit1429@.

agcAotInstallSourceRope(list(
// P61-P67.agc:147
//		CADR	GOFLASH
// slot 24776
    24776, 17312
)).

// bank 26, slots 24777-24780
function agcAotUnit1430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24778 {
        if slot <= 24777 {
// P61-P67.agc:148
//		TC	GOTOPOOH
// slot 24777
            if slot <> 24777 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:149
//		TC	+2
// slot 24778
            if slot <> 24778 or instruction <> 1228 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1228, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24779 {
// P61-P67.agc:150
//		TC	P61.2		# REDO
// slot 24779
            if slot <> 24779 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:151
//
// P61-P67.agc:152
//#		.... THEN FALL INTO P62
// P61-P67.agc:153
//# Page 792
// P61-P67.agc:154
//
// P61-P67.agc:155
//# PROGRAM:	P62
// P61-P67.agc:156
//# MOD NO.:	0	MAR. 13, 1967
// P61-P67.agc:157
//# MOD BY:	R. HIRSCHKOP
// P61-P67.agc:158
//# MOD NO:  1	MOD BY:  RR BAIRNSFATHER	DATE: 21 MAR 67
// P61-P67.agc:159
//# MOD NO:  2	MOD BY:  RR BAIRNSFATHER	DATE: 22 JUN 67		RESTARTS.
// P61-P67.agc:160
//# MOD NO:  3	MOD BY:  RR BAIRNSFATHER	DATE: 17 JAN 68		COLOSSUS GSOP CHANGES.
// P61-P67.agc:161
//# MOD NO:  4	MOD BY:  RR BAIRNSFATHER	DATE:  8 MAY 68		MOVE START OF DESIRED GIMBAL CALC.
// P61-P67.agc:162
//# FUNCTION:	1) TO NOTIFY CREW WHEN GNC SYSTEM IS PREPARED FOR CM/SM SEPARATION.
// P61-P67.agc:163
//#		2) TO ORIENT THE CM TO THE CORRECT ATTITUDE FOR ATMOSPHERIC ENTRY.
// P61-P67.agc:164
//# CALLING SEQUENCE:  BY V37 OR DIRECTLY FROM P61
// P61-P67.agc:165
//# EXIT:		TO P63
// P61-P67.agc:166
//# ERASABLE INITIALIZATION:
// P61-P67.agc:167
//#	ALFAPAD					 	LEFT BY PAD LOAD
// P61-P67.agc:168
//#	LADPAD						LEFT BY PAD LOAD
// P61-P67.agc:169
//#	LODPAD						LEFT BY PAD LOAD
// P61-P67.agc:170
//#	LAT(SPL)	(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// P61-P67.agc:171
//#	LNG(SPL)	(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// P61-P67.agc:172
//#	HEADSUP		(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// P61-P67.agc:173
//# SUBROUTINE CALLS:  NEWMODEX, S61.1, CM/DAPIC, CM/DAPON, R02BOTH, GOPERF1, GOFLASH, GODSPR.
// P61-P67.agc:174
//
// P61-P67.agc:175
//		COUNT*	$$/P62
// P61-P67.agc:176
//
// P61-P67.agc:177
//		TC	NEWMODEX		# MODE CHANGE IF CAME FROM P61.
// slot 24780
            if slot <> 24780 or instruction <> 2796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1430] to agcAotUnit1430@.

agcAotInstallSourceRope(list(
// P61-P67.agc:178
//		MM	62			# MODE CHANGE AUTOMATIC VIA V 37.
// slot 24781
    24781, 124
)).

// bank 26, slots 24782-24785
function agcAotUnit1431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24783 {
        if slot <= 24782 {
// P61-P67.agc:179
//		CA	ONE
// slot 24782
            if slot <> 24782 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:180
//		TS	DNLSTCOD
// slot 24783
            if slot <> 24783 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24784 {
// P61-P67.agc:181
//
// P61-P67.agc:182
//P62		TC	S61.1			# CHECK STATE VECTOR AND IMU ORIENTATION.
// slot 24784
            if slot <> 24784 or instruction <> 1380 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1380, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:183
//
// P61-P67.agc:184
//		TC	INTPRET
// slot 24785
            if slot <> 24785 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1431] to agcAotUnit1431@.

agcAotInstallSourceRope(list(
// P61-P67.agc:185
//		SSP	RTB
// slot 24786
    24786, 40114,
// P61-P67.agc:186
//			POSEXIT
// slot 24787
    24787, 3498,
// P61-P67.agc:187
//			P62.3			# CALCULATE DESIRED .05G GIMBAL ANGLES.
// slot 24788
    24788, 45570,
// P61-P67.agc:188
//						# WITHOUT DISPLAY.
// P61-P67.agc:189
//			CM/DAPIC		# START CM/POSE AND BODY RATE CALC
// slot 24789
    24789, 34676
)).

// bank 26, slots 24790-24794
function agcAotUnit1432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24791 {
        if slot <= 24790 {
// P61-P67.agc:190
//
// P61-P67.agc:191
//						# DOES 2PHSCHNG, OCT 40116, OCT 05024, OCT 13000.
// P61-P67.agc:192
//						# CM/DAPIC SETS EBANK = EBAOG
// P61-P67.agc:193
//						# AND RETURNS IN BASIC TO P62.2.
// P61-P67.agc:194
//P62.2		EXTEND
// slot 24790
            if slot <> 24790 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:195
//		DCA	POSECADR		# CONTINUE WITH CM/POSE AFTER AV G.
// slot 24791
            if slot <> 24791 or instruction <> 13594 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1306, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24792 {
// P61-P67.agc:196
//		DXCH	AVEGEXIT
// slot 24792
            if slot <> 24792 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24793 {
// P61-P67.agc:197
//
// P61-P67.agc:198
//		CAF	OCT41			# REQUEST SEPARATION
// slot 24793
                if slot <> 24793 or instruction <> 14520 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2232), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:199
//		TC	BANKCALL
// slot 24794
                if slot <> 24794 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1432] to agcAotUnit1432@.

agcAotInstallSourceRope(list(
// P61-P67.agc:200
//		CADR	GOPERF1R
// slot 24795
    24795, 17578
)).

// bank 26, slots 24796-24800
function agcAotUnit1433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24797 {
        if slot <= 24796 {
// P61-P67.agc:201
//		TC	GOTOPOOH
// slot 24796
            if slot <> 24796 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:202
//		TC	+3			# PROCEED
// slot 24797
            if slot <> 24797 or instruction <> 1248 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1248, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24798 {
// P61-P67.agc:203
//# Page 793
// P61-P67.agc:204
//						# NOTE:  NODOFLAG WILL BE SET IN CM/DAPON. ***
// P61-P67.agc:205
//		TC	-5			# ENTER
// slot 24798
            if slot <> 24798 or instruction <> 1241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1241, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24799 {
// P61-P67.agc:206
//		TC	P61.3			# FOR PHASCHNG AND ENDOFJOB
// slot 24799
                if slot <> 24799 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:207
//
// P61-P67.agc:208
//	+3	TC	POSTJUMP
// slot 24800
                if slot <> 24800 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1433] to agcAotUnit1433@.

agcAotInstallSourceRope(list(
// P61-P67.agc:209
//		CADR	CM/DAPON		# DISABLE RCS DAP, ENABLE ENTRY DAP AND
// slot 24801
    24801, 34580
)).

// bank 26, slots 24802-24803
function agcAotUnit1434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24802 {
// P61-P67.agc:210
//						# DO ATTITUDE HOLD.
// P61-P67.agc:211
//
// P61-P67.agc:212
//						# WILL IDLE UNTIL CM/POSE DOES ONE UPDATE.
// P61-P67.agc:213
//						# CM/DAPON DOES NO PHASCHNG.
// P61-P67.agc:214
//
// P61-P67.agc:215
//P62.1		CA	V06N61			# LAT(SPL)	LNG(SPL)	HEADSUP
// slot 24802
        if slot <> 24802 or instruction <> 13589 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1301), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:216
//						# XXX.XX DEG	XXX.XX DEG	0000X.
// P61-P67.agc:217
//
// P61-P67.agc:218
//						# TERMINATE ATTITUDE HOLD.  SET UP COMMANDS:
// P61-P67.agc:219
//						# ROLLC, ALFACOM, BETACOM.  BEGIN MANEUVER TO
// P61-P67.agc:220
//						# ENTRY ATTITUDE.
// P61-P67.agc:221
//
// P61-P67.agc:222
//		TC	BANKCALL
// slot 24803
        if slot <> 24803 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1434] to agcAotUnit1434@.

agcAotInstallSourceRope(list(
// P61-P67.agc:223
//		CADR	GOFLASH
// slot 24804
    24804, 17312
)).

// bank 26, slots 24805-24808
function agcAotUnit1435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24806 {
        if slot <= 24805 {
// P61-P67.agc:224
//		TC	-3
// slot 24805
            if slot <> 24805 or instruction <> 1250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1250, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:225
//		TC	+2
// slot 24806
            if slot <> 24806 or instruction <> 1256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24807 {
// P61-P67.agc:226
//		TC	-5
// slot 24807
            if slot <> 24807 or instruction <> 1250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1250, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:227
//
// P61-P67.agc:228
//		TC	PHASCHNG
// slot 24808
            if slot <> 24808 or instruction <> 2826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1435] to agcAotUnit1435@.

agcAotInstallSourceRope(list(
// P61-P67.agc:229
//		OCT	04024			# USE ENTRYVN FOR DISPLAY BELOW.
// slot 24809
    24809, 4136
)).

// bank 26, slots 24810-24821
function agcAotUnit1436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24815 {
        if slot <= 24812 {
            if slot <= 24810 {
// P61-P67.agc:230
//						# EBANK WAS SET IN CM/DAPON TO EBAOG
// P61-P67.agc:231
//
// P61-P67.agc:232
//		CCS	HEADSUP			# C(HEADSUP) = +/- 1
// slot 24810
                if slot <> 24810 or instruction <> 5078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 982).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24811 {
// P61-P67.agc:233
//		CA	BIT14			# IF HEADSUP POS, ROLLC=180 DEG (LIFT DWN)
// slot 24811
                    if slot <> 24811 or instruction <> 14850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:234
//		NOOP				# IF HEADSUP NEG, ROLLC=0 DEG (LIFT UP)
// slot 24812
                    if slot <> 24812 or instruction <> 5357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5357, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24813 {
// P61-P67.agc:235
//		TS	ROLLC
// slot 24813
                if slot <> 24813 or instruction <> 23501 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23501, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24814 {
// P61-P67.agc:236
//		CA	ALFAPAD			# NOMINAL ALFATRIM PAD LOADED, NEG. NO.
// slot 24814
                    if slot <> 24814 or instruction <> 13065 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 777).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:237
//		ZL
// slot 24815
                    if slot <> 24815 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24818 {
            if slot <= 24816 {
// P61-P67.agc:238
//		DXCH	ALFACOM			# SET ALFACOM = ALFA TRIM, BETACOM=0
// slot 24816
                if slot <> 24816 or instruction <> 22404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 900, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24817 {
// P61-P67.agc:239
//
// P61-P67.agc:240
//		CA	ONE			# PERMITS EXDAP2 TO CHANGE FLAG TO +0
// slot 24817
                    if slot <> 24817 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:241
//		TS	P63FLAG			# AS INDICATOR.  STARTS UP P63.
// slot 24818
                    if slot <> 24818 or instruction <> 23511 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23511, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24819 {
// P61-P67.agc:242
//
// P61-P67.agc:243
//		CA	V06N22			# SET UP DISPLAY FOR CDU DESIRED VALUES
// slot 24819
                if slot <> 24819 or instruction <> 14890 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2602), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24820 {
// P61-P67.agc:244
//		TS	ENTRYVN			# FROM ENTRY ATTITUDE CALC, THAT IS
// slot 24820
                    if slot <> 24820 or instruction <> 23219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23219, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:245
//						# ALREADY GOING.
// P61-P67.agc:246
//		TC	UPFLAG			# TURN ON ENTRY DISPLAY
// slot 24821
                    if slot <> 24821 or instruction <> 2918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1436] to agcAotUnit1436@.

agcAotInstallSourceRope(list(
// P61-P67.agc:247
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// slot 24822
    24822, 184
)).

// bank 26, slots 24823-24829
function agcAotUnit1437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24825 {
        if slot <= 24823 {
// P61-P67.agc:248
//SKIP
// P61-P67.agc:249
//# Page 794
// P61-P67.agc:250
//		CS	CMDAPMOD		# GO DIRECTLY TO P63 IF BODY ATTITUDE
// slot 24823
            if slot <> 24823 or instruction <> 17344 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 960).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24824 {
// P61-P67.agc:251
//		MASK	ONE			# IS SUCH THAT THE DELAY TASK: WAKEP62
// slot 24824
                if slot <> 24824 or instruction <> 31247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:252
//		EXTEND				# WILL BE OMITTED.
// slot 24825
                if slot <> 24825 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24827 {
            if slot <= 24826 {
// P61-P67.agc:253
//		BZF	P63.1			# DISABLE GRP 4, GO TO ENDOFJOB.
// slot 24826
                if slot <> 24826 or instruction <> 5393 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:254
//						# (I.E., CONTINUE IF CMDAPMOD = -1, OR +0)
// P61-P67.agc:255
//		TC	P63
// slot 24827
                if slot <> 24827 or instruction <> 1285 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1285, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24828 {
// P61-P67.agc:256
//
// P61-P67.agc:257
//						# PUT JOB TO SLEEP UNTIL VEHICLE MANEUVER HAS
// P61-P67.agc:258
//						# REDUCED ALFA TO +/-45 DEG. CONSIDER REMAINING
// P61-P67.agc:259
//						# 65 DEG (25 DEG IF ALFA NEG) TO ALFA TRIM TO
// P61-P67.agc:260
//						# OCCUR AT 3 DEG/SEC, AND TERMINATE P62 AT THAT
// P61-P67.agc:261
//						# TIME.
// P61-P67.agc:262
//
// P61-P67.agc:263
//						# TASK WAKEP62 IS CALLED FROM ENTRY DAP.
// P61-P67.agc:264
//WAKEP62		CA	PRIO13
// slot 24828
                if slot <> 24828 or instruction <> 14901 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2613), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:265
//		TC	NOVAC
// slot 24829
                if slot <> 24829 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1437] to agcAotUnit1437@.

agcAotInstallSourceRope(list(
// P61-P67.agc:266
//		EBANK=	AOG
// P61-P67.agc:267
//		2CADR	P63
// slot 24830 24831
    24830, 2570, 24831, 45164
)).

// bank 26, slots 24832-24832
function agcAotUnit1438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:268
//
// P61-P67.agc:269
//		TC	TASKOVER
// slot 24832
    if slot <> 24832 or instruction <> 2772 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2772, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1438] to agcAotUnit1438@.

agcAotInstallSourceRope(list(
// P61-P67.agc:270
//
// P61-P67.agc:271
//						# EACH 2 SEC, CALCULATE GIMBAL ANGLES FOR ENTRY CON-
// P61-P67.agc:272
//						# DITIONS THAT WILL HOLD IF REORIENTATION WERE MADE
// P61-P67.agc:273
//						# AT PRESENT RN, VN.  COME HERE FROM CM/POSE AND ALSO
// P61-P67.agc:274
//						# IN KEPLER PHASE OF ENTRY.
// P61-P67.agc:275
//
// P61-P67.agc:276
//P62.3		SSP	GOTO			# SET RETURN ADDRESS SO THAT ROUTINE
// slot 24833
    24833, 43186,
// P61-P67.agc:277
//			QPRET			# GOES DIRECTLY TO ENTRY GUIDANCE EXIT
// slot 24834
    24834, 86,
// P61-P67.agc:278
//			ENDEXIT			# THAT DOES ENTRY DISPLAY, GRP 5.
// slot 24835
    24835, 44796,
// P61-P67.agc:279
//			S62.3			# PUT DESIRED CDU VALUES IN CPHI'S FOR
// slot 24836
    24836, 16892
)).

// bank 26, slots 24837-24837
function agcAotUnit1439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:280
//						# N22 DISPLAY.
// P61-P67.agc:281
//
// P61-P67.agc:282
//# Page 795
// P61-P67.agc:283
//#	P63
// P61-P67.agc:284
//# PROGRAM:	P63
// P61-P67.agc:285
//# MOD NO:	0	MAR. 13, 1967
// P61-P67.agc:286
//# MOD BY:	R. HIRSCHKOP
// P61-P67.agc:287
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 22 JUN 67		RESTARTS
// P61-P67.agc:288
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 14 JUL 67		REVISED RESTARTS
// P61-P67.agc:289
//# FUNCTION:	1) TO INITIALIZE THE ENTRY EQUATIONS.
// P61-P67.agc:290
//#		2) TO CONTINUE TO HOLD THE CM TO THE CORRECT ATTITUDE WITH RESPECT TO THE ATMOSPHERE FOR
// P61-P67.agc:291
//#		   THE ONSET OF ENTRY DECELERATION.  ROLL ANGLE IS LIFT UP/DOWN AS SPECIFIED BY HEADSUP.
// P61-P67.agc:292
//#		3) TO SENSE .05G.
// P61-P67.agc:293
//# CALLING SEQUENCE:  DIRECTLY FROM P62
// P61-P67.agc:294
//# EXIT:		TO ENDOFJOB
// P61-P67.agc:295
//# SUBROUTINE CALLS:  NEWMODEX, GODSPR
// P61-P67.agc:296
//
// P61-P67.agc:297
//		COUNT*	$$/P63
// P61-P67.agc:298
//
// P61-P67.agc:299
//P63		TC	NEWMODEX
// slot 24837
    if slot <> 24837 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1439] to agcAotUnit1439@.

agcAotInstallSourceRope(list(
// P61-P67.agc:300
//		MM	63
// slot 24838
    24838, 126
)).

// bank 26, slots 24839-24845
function agcAotUnit1440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24841 {
        if slot <= 24839 {
// P61-P67.agc:301
//
// P61-P67.agc:302
//						# ARRIVE WITH EBANK = AOG.
// P61-P67.agc:303
//
// P61-P67.agc:304
//		CA	ENTCADR			# CONTINUE AT STARTENT AFTER CM/POSE.
// slot 24839
            if slot <> 24839 or instruction <> 13592 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1304), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24840 {
// P61-P67.agc:305
//
// P61-P67.agc:306
//						# AT END OF STATEMENT, CHANGE ADDRESS IN GOTOADDR
// P61-P67.agc:307
//						# TO CONTINUE AT SCALEPOP THEREAFTER.
// P61-P67.agc:308
//
// P61-P67.agc:309
//		TS	POSEXIT
// slot 24840
                if slot <> 24840 or instruction <> 23508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23508, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:310
//
// P61-P67.agc:311
//		CA	V06N64			# G		VI		R TO SPLSH
// slot 24841
                if slot <> 24841 or instruction <> 13591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1303), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24843 {
            if slot <= 24842 {
// P61-P67.agc:312
//						# XXX.XX G	XXXX. FPS	XXXX.X NM
// P61-P67.agc:313
//		TS	ENTRYVN			# FOR DISPLAY CALL IN OVERNOUT
// slot 24842
                if slot <> 24842 or instruction <> 23219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23219, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:314
//
// P61-P67.agc:315
//		CS	ONE			# IN CASE FLAG IS LEFT AT +1 BY DAP.  THE
// slot 24843
                if slot <> 24843 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24844 {
// P61-P67.agc:316
//		TS	P63FLAG			# -1 ASSURES THAT EXO-ATM DAP WILL NOT
// slot 24844
                if slot <> 24844 or instruction <> 23511 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:317
//						# CALL P63 OUT OF SEQUENCE IN P66.
// P61-P67.agc:318
//
// P61-P67.agc:319
//		TC	PHASCHNG		# THIS IS REQUIRED TO PRESERVE CLEANDSP
// slot 24845
                if slot <> 24845 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1440] to agcAotUnit1440@.

agcAotInstallSourceRope(list(
// P61-P67.agc:320
//		OCT	00004			# RETURN IN EVENT OF AN EXTENDED VERB
// slot 24846
    24846, 8
)).

// bank 26, slots 24847-24847
function agcAotUnit1441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:321
//
// P61-P67.agc:322
//		TC	BANKCALL		# FLUSH 'N22' DISPLAY, IF ON, (OMIT
// slot 24847
    if slot <> 24847 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1441] to agcAotUnit1441@.

agcAotInstallSourceRope(list(
// P61-P67.agc:323
//		CADR	CLEANDSP		# DISPLAY DURING 'STARTENT' PASS.)
// slot 24848
    24848, 17286
)).

// bank 26, slots 24849-24849
function agcAotUnit1442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:324
//
// P61-P67.agc:325
//P63.1		TC	PHASCHNG
// slot 24849
    if slot <> 24849 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1442] to agcAotUnit1442@.

agcAotInstallSourceRope(list(
// P61-P67.agc:326
//		OCT	00004			# DISABLE.  DISPLAY RESTARTED VIA ENTRY.
// slot 24850
    24850, 8
)).

// bank 26, slots 24851-24851
function agcAotUnit1443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:327
//
// P61-P67.agc:328
//		TC	ENDOFJOB
// slot 24851
    if slot <> 24851 or instruction <> 2703 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2703, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1443] to agcAotUnit1443@.

agcAotInstallSourceRope(list(
// P61-P67.agc:329
//
// P61-P67.agc:330
//V06N60		VN	0660
// slot 24852
    24852, 1656,
// P61-P67.agc:331
//V06N61		VN	0661
// slot 24853
    24853, 1658,
// P61-P67.agc:332
//V06N63		VN	0663
// slot 24854
    24854, 1662,
// P61-P67.agc:333
//# Page 796
// P61-P67.agc:334
//V06N64		VN	0664
// slot 24855
    24855, 1664,
// P61-P67.agc:335
//ENTCADR		CADR	STARTENT
// slot 24856
    24856, 43008,
// P61-P67.agc:336
//
// P61-P67.agc:337
//		EBANK=	RTINIT			# TO CARRY OVER INTO ENTRY STEERING.
// P61-P67.agc:338
//POSECADR	2CADR	CM/POSE
// slot 24857 24858
    24857, 3696, 24858, 63598
)).

// bank 26, slots 24859-24859
function agcAotUnit1444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:339
//
// P61-P67.agc:340
//# Page 797
// P61-P67.agc:341
//# PROGRAM:	P64
// P61-P67.agc:342
//# MOD NO:	1	SEPT. 19, 1967
// P61-P67.agc:343
//# MOD BY:	R. HIRSCHKOP
// P61-P67.agc:344
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 8 MAY 68		REVISED COMMENTS FOR COLOSSUS
// P61-P67.agc:345
//# FUNCTION:	1.  TO START ENTRY GUIDANCE AT .05G SELECTING ROLL ATTITUDE, CONSTANT DRAG LEVEL, AND
// P61-P67.agc:346
//#		    DRAG THRESHOLD, KA, WHICH ARE KEYED TO THE .05G POINT.
// P61-P67.agc:347
//#		2.  SELECT FINAL PHASE P67 IF V < 27000 FPS WHEN .2G OCCURS.
// P61-P67.agc:348
//#		3.  ITERATE FOR UP-CONTROL SOLUTION P65 IF V > 27000 FPS AND IF ALTITUDE RATE AND DRAG
// P61-P67.agc:349
//#		    LEVEL CONDITIONS ARE SATISFIED.  ENTER P65 WHEN CONSTANT DRAG CONTROLLER HAS BROUGHT RANGE
// P61-P67.agc:350
//#		    AS PREDICTED TO WITHIN 25 NM OF DESIRED RANGE.
// P61-P67.agc:351
//#		4.  SELECT FINAL PHASE  P67  IF NO UP-CONTROL SOLUTION EXISTS WITH VL > 18000 FPS.
// P61-P67.agc:352
//# CALLING SEQUENCE:  BY RTB FROM REENTRY CONTROL
// P61-P67.agc:353
//# EXIT:		BACK TO REENTRY CONTROL.
// P61-P67.agc:354
//# SUBROUTINE CALLS:  NEWMODEX
// P61-P67.agc:355
//
// P61-P67.agc:356
//		BANK	25
// P61-P67.agc:357
//		SETLOC	P60S1
// P61-P67.agc:358
//		BANK
// P61-P67.agc:359
//
// P61-P67.agc:360
//# THIS DISPLAY IS CALLED EACH PASS THROUGH STEERING.  RESTART PROTECTION IS VIA STEERING.
// P61-P67.agc:361
//
// P61-P67.agc:362
//		COUNT*	$$/P64
// P61-P67.agc:363
//
// P61-P67.agc:364
//P64		TC	NEWMODEX		# ENTER VIA RTB WHEN .05G IS EXCEEDED.
// slot 24859
    if slot <> 24859 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1444] to agcAotUnit1444@.

agcAotInstallSourceRope(list(
// P61-P67.agc:365
//		MM	64
// slot 24860
    24860, 128
)).

// bank 26, slots 24861-24863
function agcAotUnit1445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24861 {
// P61-P67.agc:366
//		CA	V06N74			# ROLLC		VI		D
// slot 24861
        if slot <> 24861 or instruction <> 13600 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1312), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24862 {
// P61-P67.agc:367
//						# XXX.XX DEG	XXXXX. FPS	XXX.XX G
// P61-P67.agc:368
//		TS	ENTRYVN			# DISPLAY VIA OVERNOUT.
// slot 24862
            if slot <> 24862 or instruction <> 23219 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23219, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:369
//
// P61-P67.agc:370
//		TC	DANZIG			# ... AND CONTINUE IN INITROLL ...
// slot 24863
            if slot <> 24863 or instruction <> 3096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3096, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1445] to agcAotUnit1445@.

agcAotInstallSourceRope(list(
// P61-P67.agc:371
//
// P61-P67.agc:372
//V06N74		VN	0674
// slot 24864
    24864, 1684
)).

// bank 26, slots 24865-24865
function agcAotUnit1446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:373
//
// P61-P67.agc:374
//# Page 798
// P61-P67.agc:375
//# PROGRAM:	P65
// P61-P67.agc:376
//# MOD NO:  0	MOD BY:  RR BAIRNSFATHER	DATE:  17 JAN 68	COLOSSUS GSOP ADDITION.
// P61-P67.agc:377
//# FUNCTION:	TO CONTINUE ENTRY GUIDANCE, USING THE UP-CONTROL PHASE TO STEER TO A CONTROLLED EXIT
// P61-P67.agc:378
//#		CONDITION.  THIS PHASE TERMINATES  A) IF D < Q7 FPSS, GOTO TO P66.
// P61-P67.agc:379
//#						   B) IF RDOT NEG, AND IF V < VL +500 FPS, GO TO P67.
// P61-P67.agc:380
//# CALLING SEQUENCE:  BY RTB FROM REENTRY CONTROL
// P61-P67.agc:381
//# EXIT:		BACK TO REENTRY CONTROL, OR TO ENDOFJOB.
// P61-P67.agc:382
//# SUBROUTINE CALLS:  NEWMODEX
// P61-P67.agc:383
//
// P61-P67.agc:384
//		COUNT*	$$/P65
// P61-P67.agc:385
//
// P61-P67.agc:386
//P65		TC	NEWMODEX		# ENTER VIA RTB WHEN RANGE < 25 N M OF
// slot 24865
    if slot <> 24865 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1446] to agcAotUnit1446@.

agcAotInstallSourceRope(list(
// P61-P67.agc:387
//		MM	65			# TARGET.
// slot 24866
    24866, 130
)).

// bank 26, slots 24867-24868
function agcAotUnit1447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24867 {
// P61-P67.agc:388
//
// P61-P67.agc:389
//		CA	PRIO13
// slot 24867
        if slot <> 24867 or instruction <> 14901 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2613), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:390
//		TC	NOVAC
// slot 24868
        if slot <> 24868 or instruction <> 2652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1447] to agcAotUnit1447@.

agcAotInstallSourceRope(list(
// P61-P67.agc:391
//		EBANK=	ENTRYVN
// P61-P67.agc:392
//		2CADR	P65.1
// slot 24869 24870
    24869, 2654, 24870, 45156
)).

// bank 26, slots 24871-24871
function agcAotUnit1448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:393
//
// P61-P67.agc:394
//		TC	2PHSCHNG		# 2 PHASE CHG REQUIRED TO PREVENT RE-
// slot 24871
    if slot <> 24871 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1448] to agcAotUnit1448@.

agcAotInstallSourceRope(list(
// P61-P67.agc:395
//		OCT	00554			# STARTING FLASHING DISPLAY TWICE.
// slot 24872
    24872, 728,
// P61-P67.agc:396
//		OCT	10035			# 4.55 SPOT AND SERVICER, HERE.
// slot 24873
    24873, 8250
)).

// bank 26, slots 24874-24874
function agcAotUnit1449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:397
//		TC	INTPRET
// slot 24874
    if slot <> 24874 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1449] to agcAotUnit1449@.

agcAotInstallSourceRope(list(
// P61-P67.agc:398
//		SSP	RTB
// slot 24875
    24875, 40114,
// P61-P67.agc:399
//			GOTOADDR		# CHANGE ENTRY MODE TO UPCONTRL.
// slot 24876
    24876, 3916,
// P61-P67.agc:400
//			UPCONTRL
// slot 24877
    24877, 44090,
// P61-P67.agc:401
//			REFAZE10		# GO HERE TO REESTABLISH ENTRY SEQUENCER.
// slot 24878
    24878, 43168
)).

// bank 26, slots 24879-24879
function agcAotUnit1450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:402
//						# AND CONTINUE AT UPCONTRL...
// P61-P67.agc:403
//
// P61-P67.agc:404
//P65.1		TC	DOWNFLAG
// slot 24879
    if slot <> 24879 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1450] to agcAotUnit1450@.

agcAotInstallSourceRope(list(
// P61-P67.agc:405
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// slot 24880
    24880, 184
)).

// bank 26, slots 24881-24882
function agcAotUnit1451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24881 {
// P61-P67.agc:406
//
// P61-P67.agc:407
//		CA	V16N69			# ROLLC		DL (Q7)		VL
// slot 24881
        if slot <> 24881 or instruction <> 13627 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1339), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:408
//		TC	BANKCALL		# XXX.XX DEG	XXX.XX G	XXXXX. FPS
// slot 24882
        if slot <> 24882 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1451] to agcAotUnit1451@.

agcAotInstallSourceRope(list(
// P61-P67.agc:409
//		CADR	GOFLASHR
// slot 24883
    24883, 17502
)).

// bank 26, slots 24884-24888
function agcAotUnit1452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24885 {
        if slot <= 24884 {
// P61-P67.agc:410
//		TC	-3			# NODOFLAG IS SET ...
// slot 24884
            if slot <> 24884 or instruction <> 1329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1329, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:411
//		TC	+3
// slot 24885
            if slot <> 24885 or instruction <> 1336 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1336, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24886 {
// P61-P67.agc:412
//		TC	-5
// slot 24886
            if slot <> 24886 or instruction <> 1329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1329, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24887 {
// P61-P67.agc:413
//		TC	P61.3			# EST. GRP 4 FOR DISPLAY AND DO ENDOFJOB
// slot 24887
                if slot <> 24887 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P61-P67.agc:414
//						# IF PROCEED, CONTINUE
// P61-P67.agc:415
//		TC	UPFLAG
// slot 24888
                if slot <> 24888 or instruction <> 2918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2918, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1452] to agcAotUnit1452@.

agcAotInstallSourceRope(list(
// P61-P67.agc:416
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// slot 24889
    24889, 184
)).

// bank 26, slots 24890-24890
function agcAotUnit1453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:417
//
// P61-P67.agc:418
//		TC	P63.1			# DISABLE GRP 4, START UP ENTRY DISPLAY
// slot 24890
    if slot <> 24890 or instruction <> 1297 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1297, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1453] to agcAotUnit1453@.

agcAotInstallSourceRope(list(
// P61-P67.agc:419
//						# N06V68 VIA OVERNOUT, AS USED IN P64
// P61-P67.agc:420
//V16N69		VN	1669
// slot 24891
    24891, 4234
)).

// bank 26, slots 24892-24892
function agcAotUnit1454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:421
//
// P61-P67.agc:422
//# Page 799
// P61-P67.agc:423
//# PROGRAM:	P66
// P61-P67.agc:424
//# MOD NO: 0	MOD BY: RR BAIRNSFATHER		DATE: 17 JAN 68		COLOSSUS GSOP ADDITIONS
// P61-P67.agc:425
//# FUNCTION:	KEEP CM ATTITUDE IN TRIM TO THE RELATIVE VELOCITY VECTOR.  ENTRY GUIDANCE STOPS GENERATING
// P61-P67.agc:426
//#		ROLL COMMANDS UNTIL DRAG BUILDS UP TO Q7+0.5 FPSS.
// P61-P67.agc:427
//# CALLING SEQUENCE:  VIA RTB FROM REENTRY CONTROL.
// P61-P67.agc:428
//# EXIT:		BACK TO REENTRY CONTROL.
// P61-P67.agc:429
//# SUBROUTINE CALLS:  NEWMODEX
// P61-P67.agc:430
//
// P61-P67.agc:431
//		COUNT*	$$/P66
// P61-P67.agc:432
//
// P61-P67.agc:433
//P66		TC	NEWMODEX		# ENTER VIA RTB WHEN D < Q7 FPSS
// slot 24892
    if slot <> 24892 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1454] to agcAotUnit1454@.

agcAotInstallSourceRope(list(
// P61-P67.agc:434
//		MM	66
// slot 24893
    24893, 132
)).

// bank 26, slots 24894-24896
function agcAotUnit1455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24894 {
// P61-P67.agc:435
//
// P61-P67.agc:436
//		CA	V06N22			# OGA		IGA		MGA
// slot 24894
        if slot <> 24894 or instruction <> 14890 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2602), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24895 {
// P61-P67.agc:437
//						# XXX.XX DEG	XXX.XX DEG	XXX.XX DEG
// P61-P67.agc:438
//		TC	P66END			# IN CASE CAME FROM P65, GO TO DISABLE GRP 4,
// slot 24895
            if slot <> 24895 or instruction <> 1347 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1347, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:439
//						# AND SET ENTRYDSP TO DO DISPLAY VIA
// P61-P67.agc:440
//						# OVERNOUT.
// P61-P67.agc:441
//
// P61-P67.agc:442
//						# ... AND CONTINUE AT KEP2
// P61-P67.agc:443
//
// P61-P67.agc:444
//# Page 800
// P61-P67.agc:445
//# PROGRAM:	P67
// P61-P67.agc:446
//# MOD NO:	0	MAR. 16, 1967
// P61-P67.agc:447
//# MOD BY:	R. HIRSCHKOP
// P61-P67.agc:448
//# FUNCTION:	TO TERMINATE STEERING WHEN THE CM VELOCITY WRT EARTH = 1000 FT/SEC
// P61-P67.agc:449
//# CALLING SEQUENCE:
// P61-P67.agc:450
//# EXIT:		TO POOH
// P61-P67.agc:451
//# SUBROUTINE CALLS:  GOFLASH
// P61-P67.agc:452
//
// P61-P67.agc:453
//# THIS DISPLAY IS CALLED EACH PASS THROUGH STEERING.  RESTART PROTECTION IS VIA STEERING.
// P61-P67.agc:454
//
// P61-P67.agc:455
//		COUNT*	$$/P67
// P61-P67.agc:456
//
// P61-P67.agc:457
//P67		TC	NEWMODEX		# ENTER VIA RTB
// slot 24896
            if slot <> 24896 or instruction <> 2796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1455] to agcAotUnit1455@.

agcAotInstallSourceRope(list(
// P61-P67.agc:458
//		MM	67
// slot 24897
    24897, 134
)).

// bank 26, slots 24898-24900
function agcAotUnit1456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24898 {
// P61-P67.agc:459
//		CA	V06N66			# ROLLC		XRNGERR		DNRNGERR
// slot 24898
        if slot <> 24898 or instruction <> 13641 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1353), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24899 {
// P61-P67.agc:460
//						# XXX.XX DEG	XXXX.X NM	XXXX.X NM
// P61-P67.agc:461
//P66END		TS	ENTRYVN			# DISPLAY VIA OVERNOUT.
// slot 24899
            if slot <> 24899 or instruction <> 23219 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23219, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:462
//
// P61-P67.agc:463
//		TC	UPFLAG			# (IN CASE CAME FROM P65.  ENTRY DISPLAY
// slot 24900
            if slot <> 24900 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1456] to agcAotUnit1456@.

agcAotInstallSourceRope(list(
// P61-P67.agc:464
//		ADRES	ENTRYDSP		# WILL FLUSH FLASHING DISP.  IF STILL ON)
// slot 24901
    24901, 184
)).

// bank 26, slots 24902-24902
function agcAotUnit1457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:465
//						# BIT 13 FLAG 6
// P61-P67.agc:466
//KILLGRP4	TC	PHASCHNG		# DISABLE GRP4, IN CASE CAME FROM HUNTEST.
// slot 24902
    if slot <> 24902 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1457] to agcAotUnit1457@.

agcAotInstallSourceRope(list(
// P61-P67.agc:467
//		OCT	00004			# (COME TO KILLGRP4 VIA RTB, RET TO CALLER)
// slot 24903
    24903, 8
)).

// bank 26, slots 24904-24904
function agcAotUnit1458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:468
//
// P61-P67.agc:469
//		TC	DANZIG			# ... AND CONTINUE AT PREDICT3 ...
// slot 24904
    if slot <> 24904 or instruction <> 3096 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3096, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1458] to agcAotUnit1458@.

agcAotInstallSourceRope(list(
// P61-P67.agc:470
//
// P61-P67.agc:471
//V06N66		VN	0666
// slot 24905
    24905, 1668
)).

// bank 26, slots 24906-24907
function agcAotUnit1459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24906 {
// P61-P67.agc:472
//
// P61-P67.agc:473
//		BANK	26
// P61-P67.agc:474
//		SETLOC	P60S2
// P61-P67.agc:475
//		BANK
// P61-P67.agc:476
//
// P61-P67.agc:477
//P67.1		CA	V16N67			# RTOGO		LAT		LONG
// slot 24906
        if slot <> 24906 or instruction <> 13667 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1379), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:478
//						# XXXX.X NM	XXX.XX DEG	XXX.XX DEG
// P61-P67.agc:479
//		TC	BANKCALL
// slot 24907
        if slot <> 24907 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1459] to agcAotUnit1459@.

agcAotInstallSourceRope(list(
// P61-P67.agc:480
//		CADR	GOFLASH
// slot 24908
    24908, 17312
)).

// bank 26, slots 24909-24920
function agcAotUnit1460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24914 {
        if slot <= 24911 {
            if slot <= 24909 {
// P61-P67.agc:481
//		TC	+3			# EFFECTIVE GOTOPOOH
// slot 24909
                if slot <> 24909 or instruction <> 1360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1360, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24910 {
// P61-P67.agc:482
//		TC	+2
// slot 24910
                    if slot <> 24910 or instruction <> 1360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1360, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:483
//		TC	P67.1			# REDO
// slot 24911
                    if slot <> 24911 or instruction <> 1354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24912 {
// P61-P67.agc:484
//
// P61-P67.agc:485
//		CS	THREE			# TURN OFF ENTRY DAP
// slot 24912
                if slot <> 24912 or instruction <> 19596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24913 {
// P61-P67.agc:486
//		INHINT
// slot 24913
                    if slot <> 24913 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:487
//		MASK	CM/FLAGS		# CM/DSTBY, GAMDIFSW
// slot 24914
                    if slot <> 24914 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24917 {
            if slot <= 24915 {
// P61-P67.agc:488
//		TS	CM/FLAGS
// slot 24915
                if slot <> 24915 or instruction <> 22594 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22594, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24916 {
// P61-P67.agc:489
//		RELINT
// slot 24916
                    if slot <> 24916 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:490
//		EXTEND
// slot 24917
                    if slot <> 24917 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24918 {
// P61-P67.agc:491
//		DCA	SERVCAD2
// slot 24918
                if slot <> 24918 or instruction <> 13731 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1443, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24919 {
// P61-P67.agc:492
//
// P61-P67.agc:493
//# Page 801
// P61-P67.agc:494
//		DXCH	AVEGEXIT
// slot 24919
                    if slot <> 24919 or instruction <> 22163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P61-P67.agc:495
//
// P61-P67.agc:496
//		TCF	GOTOPOOH
// slot 24920
                    if slot <> 24920 or instruction <> 6214 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6214, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1460] to agcAotUnit1460@.

agcAotInstallSourceRope(list(
// P61-P67.agc:497
//
// P61-P67.agc:498
//# Page 802
// P61-P67.agc:499
//P67.2		VLOAD	CLEAR			# CALC PRESENT LAT, LONG, ALT.
// slot 24921
    24921, 36090,
// P61-P67.agc:500
//			RN
// slot 24922
    24922, 1266,
// P61-P67.agc:501
//			ERADFLAG		# USE PAD RAD FOR ALT. (NOT SEEN ANYWAY)
// slot 24923
    24923, 868,
// P61-P67.agc:502
//		STODL	ALPHAV
// slot 24924
    24924, 14548,
// P61-P67.agc:503
//			PIPTIME			# USE TIME OF RN
// slot 24925
    24925, 1290,
// P61-P67.agc:504
//		CLEAR	CALL
// slot 24926
    24926, 37912,
// P61-P67.agc:505
//			LUNAFLAG
// slot 24927
    24927, 1894,
// P61-P67.agc:506
//			LAT-LONG
// slot 24928
    24928, 23024,
// P61-P67.agc:507
//P67.3		RTB				# ENTRY EXIT THAT OMITS DISPLAY.
// slot 24929
    24929, 65336,
// P61-P67.agc:508
//			SERVNOUT
// slot 24930
    24930, 44818,
// P61-P67.agc:509
//
// P61-P67.agc:510
//V16N67		VN	1667
// slot 24931
    24931, 4230
)).

// bank 26, slots 24932-24934
function agcAotUnit1461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24932 {
// P61-P67.agc:511
//OCT41		=	33DEC
// P61-P67.agc:512
//SERVCAD2	=	SERVCAD1
// P61-P67.agc:513
//
// P61-P67.agc:514
//# Page 803
// P61-P67.agc:515
//# SUBROUTINE NAME:	S61.1
// P61-P67.agc:516
//# MOD NO:	0					DATE:		21 FEB 67
// P61-P67.agc:517
//# MOD BY:	RR BAIRNSFATHER				LOG SECTION:	P61-P67
// P61-P67.agc:518
//# MOD NO:	1	MOD BY:	RR BAIRNSFATHER		DATE:		22 JUN 67	RESTARTS.
// P61-P67.agc:519
//# FUNCTIONAL DESCRIPTION:	CALLED BY BOTH P61 AND P62
// P61-P67.agc:520
//#	FIRST, TEST TO SEE IF  AVERAGEG  IS ON.  IF NOT, UPDATE THE STATE VECTOR TO PRESENT TIME + TOLERANCE
// P61-P67.agc:521
//#	AND TURN ON  AVERAGEG  AT THAT TIME, AND CONTINUE.  OTHERWISE CONTINUE:  SEE IF IMU Y AXIS IS
// P61-P67.agc:522
//#	WITHIN 30 DEG OF VAR.  IF YES, EXIT SUBROUTINE S61.1.  IF SO, SEE IF -Y AXIS OF IMU IS WITHIN
// P61-P67.agc:523
//#	30 DEG OF VAR.	IF YES, DISPLAY ALARM:	01427	IMU REVERSED.
// P61-P67.agc:524
//#			IF NO, DISPLAY ALARM:	01426	IMU UNSATISFACTORY.
// P61-P67.agc:525
//#	IN EITHER OF THESE LAST 2 CASES, WAIT 10 SEC AND THEN EXIT SUBROUTINE S61.1.
// P61-P67.agc:526
//#
// P61-P67.agc:527
//# REMARK:	THERE WILL BE A SHORT 10 SEC DELAY IF AN ALARM EXIT IS TAKEN.  THE DELAY FOR INTEGRATION IS
// P61-P67.agc:528
//#		AS SHORT AS CAN BE MADE, BUT IS ARBITRARY SINCE IT DEPENDS ON THE AGE OF THE STATE VECTOR.
// P61-P67.agc:529
//#
// P61-P67.agc:530
//# CALLING SEQUENCE:	CALL
// P61-P67.agc:531
//#				S61.1
// P61-P67.agc:532
//#
// P61-P67.agc:533
//#			C(MPAC) UNSPECIFIED
// P61-P67.agc:534
//#			PUSHLOC UNSPECIFIED
// P61-P67.agc:535
//#
// P61-P67.agc:536
//# SUBROUTINES CALLED: 	LOADTIME, CSMPREC, TPAGTREE,
// P61-P67.agc:537
//#			WAITLIST, JOBSLEEP, JOBWAKE, PREREAD, ALARM, GODSPR, BANKCALL, DELAYJOB
// P61-P67.agc:538
//#
// P61-P67.agc:539
//# NORMAL EXIT MODES:	RVQ
// P61-P67.agc:540
//#
// P61-P67.agc:541
//# ALARMS:	01426	IMU UNSATISFACTORY
// P61-P67.agc:542
//#		01427	IMU REVERSED
// P61-P67.agc:543
//#
// P61-P67.agc:544
//# OUTPUT:	POSSIBLE ALARMS
// P61-P67.agc:545
//#		POSSIBLY TDEC1, RATT, VATT, RN, VN
// P61-P67.agc:546
//#
// P61-P67.agc:547
//# ERASABLE INITIALIZATION REQUIRED:
// P61-P67.agc:548
//#	AVEGFLAG		AVERAGEG ON OR OFF				LEFT BY SERVICER
// P61-P67.agc:549
//#	PIPTIME   (-28) CS	TIME OF PIPA UPDATE				LEFT BY READACCS
// P61-P67.agc:550
//#	RN        (-29) M	STATE VECTOR					LEFT BY AVERAGEG
// P61-P67.agc:551
//#	VN	  (-7) M/CS	STATE VECTOR					LEFT BY AVERAGEG
// P61-P67.agc:552
//#	REFSMMAT  (-1)		.5 REF TO SM MATRIX				LEFT BY LAST IMU ALIGNMENT
// P61-P67.agc:553
//#
// P61-P67.agc:554
//# DEBRIS:	QPRET
// P61-P67.agc:555
//#		POSSIBLY PIPTIME1, RATT, VATT, TDEC1, RN1, VN1, QTEMP, X1	IF UPDATED
// P61-P67.agc:556
//#		PUSH LIST LOCS USED BY CSMPREC
// P61-P67.agc:557
//
// P61-P67.agc:558
//		EBANK=	AOG		# FOR 60GENRET, S61DT
// P61-P67.agc:559
//		BANK	26
// P61-P67.agc:560
//		SETLOC	P60S3
// P61-P67.agc:561
//		BANK
// P61-P67.agc:562
//
// P61-P67.agc:563
//		COUNT*	$$/S61.1
// P61-P67.agc:564
//
// P61-P67.agc:565
//S61.1		EXTEND
// slot 24932
        if slot <> 24932 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24933 {
// P61-P67.agc:566
//		QXCH	60GENRET	# SAVE RET ADDR IN EB 6
// slot 24933
            if slot <> 24933 or instruction <> 10235 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1019, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:567
//		TC	BANKCALL
// slot 24934
            if slot <> 24934 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1461] to agcAotUnit1461@.

agcAotInstallSourceRope(list(
// P61-P67.agc:568
//		CADR	R02BOTH
// slot 24935
    24935, 16214
)).

// bank 26, slots 24936-24936
function agcAotUnit1462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:569
//		TC	INTPRET
// slot 24936
    if slot <> 24936 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1462] to agcAotUnit1462@.

agcAotInstallSourceRope(list(
// P61-P67.agc:570
//# Page 804
// P61-P67.agc:571
//		BON	CALRB
// slot 24937
    24937, 37912,
// P61-P67.agc:572
//			AVEGFLAG	# IS AVERAGEG ON
// slot 24938
    24938, 924,
// P61-P67.agc:573
//			S61.1A		# YES
// slot 24939
    24939, 45832,
// P61-P67.agc:574
//			MIDTOAV2	# GET FUTURE STATE VECTOR SOON AS CAN
// slot 24940
    24940, 24262
)).

// bank 26, slots 24941-24941
function agcAotUnit1463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:575
//
// P61-P67.agc:576
//		CA	MPAC +1		# RETURN INHINTED ***
// slot 24941
    if slot <> 24941 or instruction <> 12397 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 109).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1463] to agcAotUnit1463@.

// bank 26, slots 24942-24943
function agcAotUnit1464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24942 {
// P61-P67.agc:577
//		TS	S61DT		# FOR RESTART.
// slot 24942
        if slot <> 24942 or instruction <> 23548 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23548, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:578
//		TC	WAITLIST
// slot 24943
        if slot <> 24943 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1464] to agcAotUnit1464@.

agcAotInstallSourceRope(list(
// P61-P67.agc:579
//		EBANK=	DVCNTR
// P61-P67.agc:580
//		2CADR	S61.1C
// slot 24944 24945
    24944, 2794, 24945, 45166
)).

// bank 26, slots 24946-24946
function agcAotUnit1465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:581
//
// P61-P67.agc:582
//		TC	PHASCHNG
// slot 24946
    if slot <> 24946 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1465] to agcAotUnit1465@.

agcAotInstallSourceRope(list(
// P61-P67.agc:583
//		OCT	40434
// slot 24947
    24947, 33336
)).

// bank 26, slots 24948-24950
function agcAotUnit1466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24948 {
// P61-P67.agc:584
//		TC	ENDOFJOB
// slot 24948
        if slot <> 24948 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24949 {
// P61-P67.agc:585
//
// P61-P67.agc:586
//S61.1C		CA	PRIO13
// slot 24949
            if slot <> 24949 or instruction <> 14901 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2613), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:587
//		TC	FINDVAC
// slot 24950
            if slot <> 24950 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1466] to agcAotUnit1466@.

agcAotInstallSourceRope(list(
// P61-P67.agc:588
//		EBANK=	AOG
// P61-P67.agc:589
//		2CADR	S61.1A 	-1
// slot 24951 24952
    24951, 2822, 24952, 45164
)).

// bank 26, slots 24953-24956
function agcAotUnit1467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24954 {
        if slot <= 24953 {
// P61-P67.agc:590
//
// P61-P67.agc:591
//		EXTEND
// slot 24953
            if slot <> 24953 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:592
//		DCA	SERVCAD1	# HE WHO START AVERAGEG MUST SERVICE
// slot 24954
            if slot <> 24954 or instruction <> 13731 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1443, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24955 {
// P61-P67.agc:593
//		DXCH	AVEGEXIT	# THE EXIT.
// slot 24955
            if slot <> 24955 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:594
//
// P61-P67.agc:595
//		TC	2PHSCHNG
// slot 24956
            if slot <> 24956 or instruction <> 2810 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2810, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1467] to agcAotUnit1467@.

agcAotInstallSourceRope(list(
// P61-P67.agc:596
//		OCT	00454
// slot 24957
    24957, 600,
// P61-P67.agc:597
//		OCT	00415
// slot 24958
    24958, 538
)).

// bank 26, slots 24959-24961
function agcAotUnit1468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24959 {
// P61-P67.agc:598
//
// P61-P67.agc:599
//		CA	EBENTRY		# SET EB= 7 FOR PREREAD.
// slot 24959
        if slot <> 24959 or instruction <> 14896 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2608), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24960 {
// P61-P67.agc:600
//		TS	EBANK
// slot 24960
            if slot <> 24960 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P61-P67.agc:601
//
// P61-P67.agc:602
//		TC	POSTJUMP
// slot 24961
            if slot <> 24961 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1468] to agcAotUnit1468@.

agcAotInstallSourceRope(list(
// P61-P67.agc:603
//		CADR	PREREAD		# PREREAD DOES TC TASKOVER.
// slot 24962
    24962, 64386
)).

// bank 26, slots 24963-24963
function agcAotUnit1469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:604
//
// P61-P67.agc:605
//		TC	INTPRET
// slot 24963
    if slot <> 24963 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1469] to agcAotUnit1469@.

agcAotInstallSourceRope(list(
// P61-P67.agc:606
//S61.1A		BOVB	VLOAD
// slot 24964
    24964, 64776,
// P61-P67.agc:607
//			TCDANZIG	# TURN OFF OVFIND, IF ON
// slot 24965
    24965, 48596,
// P61-P67.agc:608
//			VN		# VN	(-7) M/CS
// slot 24966
    24966, 1278,
// P61-P67.agc:609
//		VXV	MXV
// slot 24967
    24967, 53562,
// P61-P67.agc:610
//			RN		# RN	(-29) M
// slot 24968
    24968, 1266,
// P61-P67.agc:611
//			REFSMMAT	# .5 UNIT MATRIX
// slot 24969
    24969, 1980,
// P61-P67.agc:612
//		UNIT	DLOAD
// slot 24970
    24970, 58716,
// P61-P67.agc:613
//			MPAC +3		# GET COS(THETA)/2
// slot 24971
    24971, 224,
// P61-P67.agc:614
//		BMN	DAD
// slot 24972
    24972, 36160,
// P61-P67.agc:615
//			S61.1B		# DO TEST ON -YSM
// slot 24973
    24973, 45860,
// P61-P67.agc:616
//			C(30)LIM	# = 1.0 -.5 COS(30)
// slot 24974
    24974, 13130,
// P61-P67.agc:617
//		BOVB	RTB
// slot 24975
    24975, 39944,
// P61-P67.agc:618
//			RETRN1
// slot 24976
    24976, 45890,
// P61-P67.agc:619
//			RETRN3
// slot 24977
    24977, 45868,
// P61-P67.agc:620
//# Page 805
// P61-P67.agc:621
//S61.1B		DCOMP	DAD
// slot 24978
    24978, 36220,
// P61-P67.agc:622
//			C(30)LIM	# = 1.0 - .5 COS(30)
// slot 24979
    24979, 13130,
// P61-P67.agc:623
//		BOVB	EXIT
// slot 24980
    24980, 65032,
// P61-P67.agc:624
//			RETRN2
// slot 24981
    24981, 45874
)).

// bank 26, slots 24982-24982
function agcAotUnit1470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:625
//
// P61-P67.agc:626
//RETRN3		TC	ALARM
// slot 24982
    if slot <> 24982 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1470] to agcAotUnit1470@.

agcAotInstallSourceRope(list(
// P61-P67.agc:627
//		OCT	01426		# IMU UNSATISFACTORY
// slot 24983
    24983, 1580
)).

// bank 26, slots 24984-24985
function agcAotUnit1471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24984 {
// P61-P67.agc:628
//		TC	RETRN2 +2
// slot 24984
        if slot <> 24984 or instruction <> 1435 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1435, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:629
//
// P61-P67.agc:630
//RETRN2		TC	ALARM
// slot 24985
        if slot <> 24985 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1471] to agcAotUnit1471@.

agcAotInstallSourceRope(list(
// P61-P67.agc:631
//		OCT	01427		# IMU REVERSED
// slot 24986
    24986, 1582
)).

// bank 26, slots 24987-24988
function agcAotUnit1472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24987 {
// P61-P67.agc:632
//
// P61-P67.agc:633
//	+2	CAF	V05N09
// slot 24987
        if slot <> 24987 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:634
//		TC	BANKCALL
// slot 24988
        if slot <> 24988 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1472] to agcAotUnit1472@.

agcAotInstallSourceRope(list(
// P61-P67.agc:635
//		CADR	GODSPR		# DO DISPLAY
// slot 24989
    24989, 17276
)).

// bank 26, slots 24990-24991
function agcAotUnit1473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24990 {
// P61-P67.agc:636
//		CA	10SECS
// slot 24990
        if slot <> 24990 or instruction <> 13734 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1446), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P61-P67.agc:637
//		TC	BANKCALL
// slot 24991
        if slot <> 24991 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1473] to agcAotUnit1473@.

agcAotInstallSourceRope(list(
// P61-P67.agc:638
//		CADR	DELAYJOB
// slot 24992
    24992, 1972
)).

// bank 26, slots 24993-24993
function agcAotUnit1474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P61-P67.agc:639
//
// P61-P67.agc:640
//RETRN1		TC	60GENRET
// slot 24993
    if slot <> 24993 or instruction <> 1019 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1019, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1474] to agcAotUnit1474@.

agcAotInstallSourceRope(list(
// P61-P67.agc:641
//
// P61-P67.agc:642
//		EBANK=	DVCNTR
// P61-P67.agc:643
//SERVCAD1	2CADR	SERVEXIT
// slot 24994 24995
    24994, 3374, 24995, 63598,
// P61-P67.agc:644
//
// P61-P67.agc:645
//C(30)LIM	2DEC	.566985		# = 1.0 - .5 COS(30)
// slot 24996 24997
    24996, 18578, 24997, 15802,
// P61-P67.agc:646
//
// P61-P67.agc:647
//10SECS		DEC	1000		# 1000 CS
// slot 24998
    24998, 2000,
// P61-P67.agc:648
//60SECDP		2DEC	6000 B-28	# 6000 CS
// slot 24999 25000
    24999, 0, 25000, 12000,
// P61-P67.agc:649
//
// P61-P67.agc:650
//# Page 806
// P61-P67.agc:651
//# PROGRAM NAME:		S61.2			DATE:		14 FEB 67
// P61-P67.agc:652
//# MOD NO:  	1				LOG SECTION:	P61-P67
// P61-P67.agc:653
//# MOD BY:	NORTH / BAIRNSFATHER
// P61-P67.agc:654
//# MOD NO: 2	MOD BY: NORTH/BAIRNSFATHER	DATE: 11 MAY 67		ADD 2ND ITER FOR ERAD AT 400K FT.
// P61-P67.agc:655
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 21 NOV 67		VARIABLE MU ADDED.
// P61-P67.agc:656
//# MOD NO: 4	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		DIFFERENT EARTH/MOON SCALES IN TFF'S
// P61-P67.agc:657
//#
// P61-P67.agc:658
//# FUNCTIONAL DESCRIPTION:  CALLED IN P61.  PROVIDES DISPLAYS FOR NOUNS  N60  AND  N63 .
// P61-P67.agc:659
//#	PROGRAM CALCULATES ENTRY DISPLAY OF MAXIMUM ACCELERATION EXPECTED  (GMAX)  AND ALSO THE EXPECTED
// P61-P67.agc:660
//#	INERTIAL VELOCITY (VPRED) AND ENTRY ANGLE  (GAMMAEI)  THAT WILL OBTAIN AT 400K FT ABOVE THE FISCHER
// P61-P67.agc:661
//#	ELLIPSOID.  PROGRAM ALSO CALCULATES A SECOND DISPLAY RELATIVE TO THE  EMSALT  ABOVE FISCHER ELLIPSOID
// P61-P67.agc:662
//#	AND CONSISTS OF RANGE TO SPLASH FROM NOW  (RTGO) , PREDICTED INERTIAL VELOCITY  (VIO) , AND THE TIME TO
// P61-P67.agc:663
//#	GO FROM NOW  (TTE) .
// P61-P67.agc:664
//#
// P61-P67.agc:665
//# CALLING SEQUENCE:	CALL
// P61-P67.agc:666
//#				S61.2
// P61-P67.agc:667
//#			C(MPAC) UNSPECIFIED
// P61-P67.agc:668
//#			PUSHLOC WILL BE SET TO ZERO.
// P61-P67.agc:669
//#
// P61-P67.agc:670
//# SUBROUTINES CALLED:	TFFCONIC, CALCTFF, TFF/TRIG, FISHCALC, GETERAD, VGAMCALC
// P61-P67.agc:671
//#
// P61-P67.agc:672
//# NORMAL EXIT MODES:	RTB, P61.1
// P61-P67.agc:673
//#
// P61-P67.agc:674
//# ALARMS:  	NONE
// P61-P67.agc:675
//#
// P61-P67.agc:676
//# OUTPUT:	THE FOLLOWING REGISTERS ARE WRITTEN IN FOR USE BY DISPLAYS
// P61-P67.agc:677
//#		GMAX	100 GMAX (-14) G,S	MAXIMUM ACCELERATION
// P61-P67.agc:678
//#		VPRED	(-7) M/CS		PREDICTED VELOCITY AT 400K FT
// P61-P67.agc:679
//#		GAMMAEI	GAMMA/360		PREDICTED GAMMA    AT 400K FT
// P61-P67.agc:680
//#						FOR TM, DP(GAMMAEI) = (GAMMAEI, RTGO) / 360
// P61-P67.agc:681
//#		RTGO	THETAH/360		RANGE ANGLE TO SPLASH FROM EMSALT	EMSALT IS PAD LOADED.
// P61-P67.agc:682
//#		VIO	(-7) M/CS		INTERTIAL VELOCITY AT      EMSALT	EMSALT IS PAD LOADED.
// P61-P67.agc:683
//#		TTE	(-28) CS		TIME TO                    EMSALT	EMSALT IS PAD LOADED.
// P61-P67.agc:684
//#		PUSHLOC	= 0
// P61-P67.agc:685
//#		CONIC PARAMETERS STORED IN VAC AREA (SEE TFF SUBROUTINES)
// P61-P67.agc:686
//#
// P61-P67.agc:687
//# ERASABLE INITIALIZATION REQUIRED:
// P61-P67.agc:688
//#		RONE	(-29) M			STATE VECTOR				LEFT BY USER
// P61-P67.agc:689
//#		VONE	(-7) M/CS		STATE VECTOR				LEFT BY USER
// P61-P67.agc:690
//#		URONE	UR/2								LEFT BY USER
// P61-P67.agc:691
//#		UNI	(-1)			UNIT NORMAL V*R				LEFT BY ENTRY / P61
// P61-P67.agc:692
//#		THETAH	THETAH/360		RANGE ANGLE				LEFT BY ENTRY / P61
// P61-P67.agc:693
//#		UNITW	(0)			UNIT POLAR VECTOR			LEFT BY PAD LOAD
// P61-P67.agc:694
//#		EMSALT	(-29) M			EMS INTERFACE ALTITUDE			LEFT BY PAD LOAD
// P61-P67.agc:695
//#						ORBITAL REENTRY: 284843 FT., LUNAR REENTRY: 297431 FT.
// P61-P67.agc:696
//#
// P61-P67.agc:697
//# DEBRIS:	QPRET,
// P61-P67.agc:698
//#		ALL PDL LOCATIONS ABOVE 12D, INCLUDING X1,X2,S1,S2
// P61-P67.agc:699
//#		ALSO PDL+0 ... PDL+5, WHERE INITIAL PUSHLOC = PDL
// P61-P67.agc:700
//
// P61-P67.agc:701
//# Page 807
// P61-P67.agc:702
//# THE FOLLOWING PUSH LIST LOCATIONS HAVE BEEN RESERVED FOR TFF ROUTINES AND ARE REPEATED HERE FOR CONVENIENCE.
// P61-P67.agc:703
//# OF COURSE FOR S61.2 USAGE, EARTH ORIGIN SCALING IS USED.
// P61-P67.agc:704
//#
// P61-P67.agc:705
//#				BELOW	E:  IS USED FOR EARTH ORIGIN SCALE
// P61-P67.agc:706
//#					M:  IS USED FOR MOON ORIGIN SCALE
// P61-P67.agc:707
//#
// P61-P67.agc:708
//#	RTERM	= 	18D		TERMINAL RADIUS M	E:  (-29)	M:  (-27)
// P61-P67.agc:709
//#	NRTERM	=	16D		TERMINAL RADIUS M	E:  (-29+NR)
// P61-P67.agc:710
//#								M:  (-27+NR)
// P61-P67.agc:711
//#	RMAG1	=	12D		PRESENT RADIUS M	E:  (-29)	M:  (-27)
// P61-P67.agc:712
//#	NRMAG	=	32D		PRESENT RADIUS M	E:  (-29+NR)
// P61-P67.agc:713
//#								M:  (-27+NR)
// P61-P67.agc:714
//#	SDELF/2				SIN(THETA) / 2
// P61-P67.agc:715
//#	CDELF/2	=	14D		COS(THETA) / 2
// P61-P67.agc:716
//#	TFFX	=	34D		X, ARGUMENT OF SERIES T(X)
// P61-P67.agc:717
//#	TFFTEM	=	36D		ARG FOR TRANSFER ANGLE CALCULATION
// P61-P67.agc:718
//#	TFFNP	=	28D		LC P M 			E:  (-38+2NR)	M:  (-36+2NR)
// P61-P67.agc:719
//#	TFF/RTMU=	30D		1/SQRT(MU)		E:  (17)	M:  (14)
// P61-P67.agc:720
//#	TFFVSQ	=	20D		-(VN.VN/MU)	1/M	E:  (20)	M:  (18)
// P61-P67.agc:721
//
// P61-P67.agc:722
//# Page 808
// P61-P67.agc:723
//		BANK	34
// P61-P67.agc:724
//		SETLOC	P60S2
// P61-P67.agc:725
//		BANK
// P61-P67.agc:726
//
// P61-P67.agc:727
//		COUNT*	$$/S61.2
// P61-P67.agc:728
//					# PDL LEFT AT ZERO BY TARGETING
// P61-P67.agc:729
//
// P61-P67.agc:730
//S61.2		DLOAD	DSU
// slot 25001
    25001, 38346,
// P61-P67.agc:731
//			EMSALT
// slot 25002
    25002, 2080,
// P61-P67.agc:732
//			290KFT
// slot 25003
    25003, 13314,
// P61-P67.agc:733
//		BPL	DLOAD
// slot 25004
    25004, 58696,
// P61-P67.agc:734
//			LUNENT
// slot 25005
    25005, 46074,
// P61-P67.agc:735
//			1/RTMU		# ESTABLISH MU FOR ORBITAL ENTRIES
// slot 25006
    25006, 15832,
// P61-P67.agc:736
//CALLCON		CALL
// slot 25007
    25007, 65320,
// P61-P67.agc:737
//			TFFCONIC	# FILL VAC AREA WITH CONIC PARAMETERS
// slot 25008
    25008, 48094,
// P61-P67.agc:738
//
// P61-P67.agc:739
//		DLOAD	CALL
// slot 25009
    25009, 38090,
// P61-P67.agc:740
//			RTRIAL		# 1ST GUESS AT TERMINAL RADIUS	(-29)
// slot 25010
    25010, 13346,
// P61-P67.agc:741
//			CALCTFF		# SAVES MPAC IN RTERM		(18D)
// slot 25011
    25011, 48238,
// P61-P67.agc:742
//
// P61-P67.agc:743
//		CALL			# CALC SDELF/2, CDELF/2
// slot 25012
    25012, 65320,
// P61-P67.agc:744
//			TFF/TRIG	# RETURN WITH S(THETA) IN MPAC
// slot 25013
    25013, 47922,
// P61-P67.agc:745
//
// P61-P67.agc:746
//		CALL			# GET FISCHER RADIUS		(-29) M
// slot 25014
    25014, 65320,
// P61-P67.agc:747
//			FISHCALC	# ANS IN MPAC AND IN ERADM
// slot 25015
    25015, 46128,
// P61-P67.agc:748
//
// P61-P67.agc:749
//		DAD	CALL
// slot 25016
    25016, 37914,
// P61-P67.agc:750
//			EMSALT
// slot 25017
    25017, 2080,
// P61-P67.agc:751
//			CALCTFF		# SAVES MPAC IN RTERM		(18D)
// slot 25018
    25018, 48238,
// P61-P67.agc:752
//
// P61-P67.agc:753
//		DCOMP			# NEGATIVE AS IN COUNTDOWN
// slot 25019
    25019, 65404,
// P61-P67.agc:754
//		STORE	TTE1		# DECR TTE FROM BASB TTE1.  (RESTART)
// slot 25020
    25020, 4022,
// P61-P67.agc:755
//					# DNLIST AND DSKY WILL USE TTE.
// P61-P67.agc:756
//		STCALL	TTE		# LET MISS CONTRL DECR BY ELAPSED TIME
// slot 25021
    25021, 32686,
// P61-P67.agc:757
//					# TTE= TIME FROM NOW TO EMSALT +FISCHER
// P61-P67.agc:758
//
// P61-P67.agc:759
//			TFF/TRIG	# S(THETA) IN MPAC ON RETURNING
// slot 25022
    25022, 47922,
// P61-P67.agc:760
//					# AND THETA= RANGE FROM NOW TO EMSALT
// P61-P67.agc:761
//
// P61-P67.agc:762
//		CALL
// slot 25023
    25023, 65320,
// P61-P67.agc:763
//			FISHCALC
// slot 25024
    25024, 46128,
// P61-P67.agc:764
//		CALL
// slot 25025
    25025, 65320,
// P61-P67.agc:765
//			VRCALC
// slot 25026
    25026, 47976,
// P61-P67.agc:766
//		CALL
// slot 25027
    25027, 65320,
// P61-P67.agc:767
//			DISPTARG
// slot 25028
    25028, 47954,
// P61-P67.agc:768
//		CALL
// slot 25029
    25029, 65320
)).

agcAotInstallSourceRope(list(
// P61-P67.agc:769
//			DISPTARG
// slot 25030
    25030, 47954,
// P61-P67.agc:770
//		STCALL	RTGO
// slot 25031
    25031, 32664,
// P61-P67.agc:771
//# Page 809
// P61-P67.agc:772
//			VGAMCALC
// slot 25032
    25032, 46162,
// P61-P67.agc:773
//
// P61-P67.agc:774
//		DMP			# MPAC = GAMMA
// slot 25033
    25033, 65290,
// P61-P67.agc:775
//					# PDL0 HAS VGAM.
// P61-P67.agc:776
//		BDDV	DAD
// slot 25034
    25034, 36202,
// P61-P67.agc:777
//			VEMSCON		# -HS D 180/PI (-14)
// slot 25035
    25035, 13358,
// P61-P67.agc:778
//			0		# VGAM FROM PDL0
// slot 25036
    25036, 2,
// P61-P67.agc:779
//		STODL	VIO		# PREDICTED VELOCITY AT EMSALT.
// slot 25037
    25037, 16298,
// P61-P67.agc:780
//
// P61-P67.agc:781
//					# GAMMA AND VGAM AT 300K FT ARE REQUIRED BY GMAX
// P61-P67.agc:782
//					# ALGORITHM.
// P61-P67.agc:783
//
// P61-P67.agc:784
//			ERADM		# EARTH RADIUS FROM GETERAD (-29) M
// slot 25038
    25038, 2370,
// P61-P67.agc:785
//					# = FISCHER RADIUS (-29)
// P61-P67.agc:786
//
// P61-P67.agc:787
//		DAD
// slot 25039
    25039, 65306,
// P61-P67.agc:788
//			300KFT		# M (-29)
// slot 25040
    25040, 6756,
// P61-P67.agc:789
//		STCALL	RTERM		# TERMINAL RADIUS M (-29)
// slot 25041
    25041, 28710,
// P61-P67.agc:790
//
// P61-P67.agc:791
//			PREVGAM		# VGAMCALC WITH NEW RTERM
// slot 25042
    25042, 46156,
// P61-P67.agc:792
//
// P61-P67.agc:793
//					# VBAR = (V(FPS) - 36KF/S) / 20 F/S
// P61-P67.agc:794
//# GMAX = (4/(1 + 4.8 VBARSQ))(GAM - 6.05 - 2.4 VBARSQ) - 10(L/D - .3) + 10	ASSUME L/D = 0.3, BANK =0.
// P61-P67.agc:795
//
// P61-P67.agc:796
//# GMAXCALC
// P61-P67.agc:797
//		PDDL	DSU		# GAM TO PDL2
// slot 25043
    25043, 38314,
// P61-P67.agc:798
//			0		# VGAM IS IN PDL0 (-7)
// slot 25044
    25044, 2,
// P61-P67.agc:799
//			36KFT/S		# (-7) M/CS
// slot 25045
    25045, 13322,
// P61-P67.agc:800
//		DDV	DSQ
// slot 25046
    25046, 52850,
// P61-P67.agc:801
//			20KFT/S		# (-6) M/CS
// slot 25047
    25047, 13326,
// P61-P67.agc:802
//		STORE	0		# VBARSQ (-2) TO PDL0
// slot 25048
    25048, 2,
// P61-P67.agc:803
//
// P61-P67.agc:804
//		DMP	DAD
// slot 25049
    25049, 36106,
// P61-P67.agc:805
//			KR1
// slot 25050
    25050, 13330,
// P61-P67.agc:806
//					# GAM, POS DOWN, FROM PDL2
// P61-P67.agc:807
//		DAD	DMP
// slot 25051
    25051, 34074,
// P61-P67.agc:808
//			-6.05DEG
// slot 25052
    25052, 13334,
// P61-P67.agc:809
//			KR2
// slot 25053
    25053, 13338,
// P61-P67.agc:810
//		PDDL			# XCH PDL+0 FOR VBARSQ (-2)
// slot 25054
    25054, 65450,
// P61-P67.agc:811
//		DDV	DAD
// slot 25055
    25055, 36210,
// P61-P67.agc:812
//			KR4
// slot 25056
    25056, 13354,
// P61-P67.agc:813
//			DP2(-4)
// slot 25057
    25057, 15852,
// P61-P67.agc:814
//		BDDV
// slot 25058
    25058, 65386,
// P61-P67.agc:815
//					# NUM FROM PDL+0
// P61-P67.agc:816
//		DAD	BPL
// slot 25059
    25059, 42010,
// P61-P67.agc:817
//			KR3
// slot 25060
    25060, 13342,
// P61-P67.agc:818
//			+3
// slot 25061
    25061, 46032,
// P61-P67.agc:819
//		DLOAD
// slot 25062
    25062, 65482,
// P61-P67.agc:820
//			HI6ZEROS
// slot 25063
    25063, 13754,
// P61-P67.agc:821
//		STODL	GMAX		# 100 GMAX (-14)
// slot 25064
    25064, 16292,
// P61-P67.agc:822
//# Page 810
// P61-P67.agc:823
//# DISPLAY USES GMAX AS SP, SO LO WORD IS WRITTEN OVER BY VPRED.
// P61-P67.agc:824
//			ERADM		# = FISCHER RADIUS (-29) M
// slot 25065
    25065, 2370,
// P61-P67.agc:825
//		DAD	CALL		# 2 ND ITERATION FOR FISCHER RADIUS
// slot 25066
    25066, 37914,
// P61-P67.agc:826
//			400KFT
// slot 25067
    25067, 13350,
// P61-P67.agc:827
//			CALCTFF		# ESTABLISH TRANSFER ANGLE DATA.
// slot 25068
    25068, 48238,
// P61-P67.agc:828
//		CALL
// slot 25069
    25069, 65320,
// P61-P67.agc:829
//			TFF/TRIG	# GET SIN, COS DELF
// slot 25070
    25070, 47922,
// P61-P67.agc:830
//		CALL
// slot 25071
    25071, 65320,
// P61-P67.agc:831
//			FISHCALC	# GET CORRESPONDING FISCHER RADIUS.
// slot 25072
    25072, 46128,
// P61-P67.agc:832
//
// P61-P67.agc:833
//		DAD	LXA,2		# SAVE HI-WORD FOR DOWNLIST.
// slot 25073
    25073, 60442,
// P61-P67.agc:834
//			400KFT		# M (-29)
// slot 25074
    25074, 13350,
// P61-P67.agc:835
//			RTGO		# (RANGE ANGLE FROM EMSALT) / 360
// slot 25075
    25075, 3990,
// P61-P67.agc:836
//		STCALL	RTERM
// slot 25076
    25076, 28710,
// P61-P67.agc:837
//			PREVGAM		# VGAMCALC WITH NEW RTERM
// slot 25077
    25077, 46156,
// P61-P67.agc:838
//
// P61-P67.agc:839
//		DCOMP	SXA,2		# HI-WORD OF EACH ON DOWNLIST.
// slot 25078
    25078, 56444,
// P61-P67.agc:840
//			MPAC +1
// slot 25079
    25079, 218,
// P61-P67.agc:841
//		STODL	GAMMAEI		# CONIC GAMMA/360 AT 400K FT.	(HI-WORD)
// slot 25080
    25080, 16370,
// P61-P67.agc:842
//					# CONIC RTGO/360 FROM EMSALT   (LOW-WORD)
// P61-P67.agc:843
//					# FOR TM, DP(GAMMAEI) = (GAMMA, RTGO) / 360
// P61-P67.agc:844
//
// P61-P67.agc:845
//					# VGAM FROM PDL+0 (-7)
// P61-P67.agc:846
//		STADR
// slot 25081
    25081, 65324,
// P61-P67.agc:847
//		STORE	VPRED		# CONIC VELOCITY AT 400K FT
// slot 25082
    25082, 61456,
// P61-P67.agc:848
//
// P61-P67.agc:849
//		RTB
// slot 25083
    25083, 65336,
// P61-P67.agc:850
//			P61.1
// slot 25084
    25084, 45422,
// P61-P67.agc:851
//					# PDL BACK TO ZERO.
// P61-P67.agc:852
//
// P61-P67.agc:853
//LUNENT		DLOAD	GOTO
// slot 25085
    25085, 43210,
// P61-P67.agc:854
//			1/RTMUE		# ESTABLISH MU FOR LUNAR TYPE ENTRIES
// slot 25086
    25086, 6748,
// P61-P67.agc:855
//			CALLCON
// slot 25087
    25087, 45918,
// P61-P67.agc:856
//290KFT		2DEC	88392.0 B-29
// slot 25088 25089
    25088, 4, 25089, 22856,
// P61-P67.agc:857
//
// P61-P67.agc:858
//KTETA1		2DEC*	.421844723 E2 B-14* # 110 2PI/16384(163.84)
// slot 25090 25091
    25090, 84, 25091, 6044,
// P61-P67.agc:859
//
// P61-P67.agc:860
//36KFT/S		2DEC	109.728 B-7	# (-7) M/CS = 36 KFT/S (-7)
// slot 25092 25093
    25092, 28090, 25093, 6030,
// P61-P67.agc:861
//
// P61-P67.agc:862
//20KFT/S		2DEC	121.92 B-7	# (-6) M/CS = 2 20KFT/S (-7)
// slot 25094 25095
    25094, 31210, 25095, 24904,
// P61-P67.agc:863
//
// P61-P67.agc:864
//KR1		2DEC	-.026666667	# = -2.4 4 / 360
// slot 25096 25097
    25096, 64662, 25097, 35824,
// P61-P67.agc:865
//
// P61-P67.agc:866
//-6.05DEG	2DEC	-.016805556	# = -6.05 / 360
// slot 25098 25099
    25098, 64984, 25099, 54320,
// P61-P67.agc:867
//
// P61-P67.agc:868
//KR2		2DEC	.54931641	# = (360/4) 100 (-14) = 9000 B-14
// slot 25100 25101
    25100, 18000, 25101, 2,
// P61-P67.agc:869
//
// P61-P67.agc:870
//KR3		2DEC	1000 B-14	# = 100 (10.0) (-14) G,S
// slot 25102 25103
    25102, 2000, 25103, 0,
// P61-P67.agc:871
//# Page 811
// P61-P67.agc:872
//					# ASSUMES L/D = 0.3, BANK =0.
// P61-P67.agc:873
//RTRIAL		2DEC	6460097.18 B-29	# RPAD +264643 FT =21 194 545 FT
// slot 25104 25105
    25104, 394, 25105, 4802,
// P61-P67.agc:874
//					# RPAD DEFINED AS 20 909 901.57 FT =6 373 336 M
// P61-P67.agc:875
//400KFT		2DEC	121920 B-29	# METERS
// slot 25106 25107
    25106, 6, 25107, 23616,
// P61-P67.agc:876
//
// P61-P67.agc:877
//# 300KFT	2DEC	91440 B-29	# (-29) M
// P61-P67.agc:878
//
// P61-P67.agc:879
//# EMSALT	2DEC	86759.2	B-29	# 284643 FT (-29) M 	(ORBITAL REENTRY)
// P61-P67.agc:880
//
// P61-P67.agc:881
//# EMSALT	2DEC	90657 B-29	# 297431 FT (-29) M	(LUNAR REENTRY)
// P61-P67.agc:882
//
// P61-P67.agc:883
//KR4		2DEC	.833333333
// slot 25108 25109
    25108, 27306, 25109, 10922,
// P61-P67.agc:884
//
// P61-P67.agc:885
//300KFT		EQUALS	MINPERE
// P61-P67.agc:886
//VEMSCON		2DEC	-.0389676 B-14	# = -HS D / 2 PI (-14)	M SQ / CS SQ
// slot 25110 25111
    25110, 65534, 25111, 64258,
// P61-P67.agc:887
//
// P61-P67.agc:888
//					# = -16369	.05G	32.2	.3048	.3048/2 PI	(-14)
// P61-P67.agc:889
//
// P61-P67.agc:890
//# Page 812
// P61-P67.agc:891
//# SUBROUTINE NAME:  FISHCALC	(USED BY S61.2)		DATE:		01.21.67
// P61-P67.agc:892
//# MOD NO: 0						LOG SECTION:	P61-P67
// P61-P67.agc:893
//# MOD BY: MORTH / BAIRNSFATHER
// P61-P67.agc:894
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER			DATE:		11 MAY 67	INCLUDE GETERAD CALL
// P61-P67.agc:895
//#
// P61-P67.agc:896
//# FUNCTIONAL DESCRIPTION:  GIVEN THE PRESENT POSITION, UNITR, CALCULATE A NEW UNITR THAT IS ROTATED THROUGH
// P61-P67.agc:897
//#	TRANSFER ANGLE, THETA, ALONG THE TRAJECTORY.  THEN CALCULATE SIN(LAT) AND USE TO OBTAIN FISCHER RADIUS.
// P61-P67.agc:898
//#	SINCE FISHCALC USED UNI (LEFT BY ENTRY) EARTH SCALING IS ASSUMED.  (WILL IMPROVE FOR SUITABLE TENNANT)
// P61-P67.agc:899
//#
// P61-P67.agc:900
//# CALLING SEQUENCE:	CALL
// P61-P67.agc:901
//#				FISHCALC
// P61-P67.agc:902
//#	ENTER WITH .5 SIN(THETA) IN MPAC.
// P61-P67.agc:903
//#	PUSHLOC IS AT PDL+0, AN ARBITRARY BASE VALUE IF LEQ 8D
// P61-P67.agc:904
//#
// P61-P67.agc:905
//# SUBROUTINES CALLED:  GET ERAD
// P61-P67.agc:906
//#
// P61-P67.agc:907
//# NORMAL EXIT MODE:  RVQ
// P61-P67.agc:908
//#
// P61-P67.agc:909
//# EXIT MODES:	NONE
// P61-P67.agc:910
//#
// P61-P67.agc:911
//# OUTPUT:	ERADM (-29) M IN MPAC ON RETURNING
// P61-P67.agc:912
//#		NEW UNIT VECTOR NOT SAVED.
// P61-P67.agc:913
//#		SIN(LAT) NOT SAVED.
// P61-P67.agc:914
//#		PUSHLOC AT PDL+0
// P61-P67.agc:915
//#
// P61-P67.agc:916
//# ERASABLE INITIALIZATION REQUIRED:
// P61-P67.agc:917
//#		SDELF/2		=SIN(THETA) / 2, IN MPAC		LEFT BY TFF/TRIG
// P61-P67.agc:918
//#		CDELF/2		=COS(THETA) / 2, STORED IN PDL 14D	LEFT BY TFF/TRIG
// P61-P67.agc:919
//#		RONE		(-29) M					LEFT BY USER
// P61-P67.agc:920
//#		VONE		(-7) M/CS				LEFT BY USER
// P61-P67.agc:921
//#		URONE		UR/2					LEFT BY USER
// P61-P67.agc:922
//#		UNI		.5 UNIT(V*R)				LEFT BY ENTRY / P61
// P61-P67.agc:923
//#		UNITW		UNIT NORTH POLE				LEFT BY PAD LOAD
// P61-P67.agc:924
//#
// P61-P67.agc:925
//# DEBRIS:	QPRET, PDL+0 ... PDL+5
// P61-P67.agc:926
//					# _      _          _
// P61-P67.agc:927
//FISHCALC	PDVL	VXV		# URPR = UR CDELF + UHOR SDELF
// slot 25112
    25112, 40346
)).

agcAotInstallSourceRope(list(
// P61-P67.agc:928
//	 		URONE
// slot 25113
    25113, 2502,
// P61-P67.agc:929
//			UNI
// slot 25114
    25114, 3716,
// P61-P67.agc:930
//		VXSC	VSL1
// slot 25115
    25115, 64226,
// P61-P67.agc:931
//					# SIN(THETA) / 2 FROM PDL+0
// P61-P67.agc:932
//		PDVL	VXSC		# TO PDL+0, +5
// slot 25116
    25116, 61850,
// P61-P67.agc:933
//			URONE
// slot 25117
    25117, 2502,
// P61-P67.agc:934
//			CDELF/2		# COS(THETA) / 2
// slot 25118
    25118, 30,
// P61-P67.agc:935
//		VAD	STADR
// slot 25119
    25119, 38490,
// P61-P67.agc:936
//		STORE	URH		# FOR USE IN RTGO FROM EMS DISPLAY
// slot 25120
    25120, 61754,
// P61-P67.agc:937
//		DOT	SL1
// slot 25121
    25121, 59970,
// P61-P67.agc:938
//			UNITW		# PULL UNIT VECTOR	UNIT NORTH
// slot 25122
    25122, 1944,
// P61-P67.agc:939
//		STORE	ALPHAV +4	# = .5 SIN(LAT)
// slot 25123
    25123, 2268,
// P61-P67.agc:940
//DUMPFISH	GOTO
// slot 25124
    25124, 65360,
// P61-P67.agc:941
//			GETERAD		# SAVES FISCHER RAD (-29) M IN ERADM AND
// slot 25125
    25125, 23178,
// P61-P67.agc:942
//					# IN MPAC.  RETURNS TO CALLER VIO QPRET.
// P61-P67.agc:943
//
// P61-P67.agc:944
//# Page 813
// P61-P67.agc:945
//# SUBROUTINE NAME:  VGAMCALC	(USED BY S61.2)				DATE:		01.21.67
// P61-P67.agc:946
//# MOD NO: 0								LOG SECTION:	P61-P67
// P61-P67.agc:947
//# MOD BY: MORTH / BAIRNSFATHER
// P61-P67.agc:948
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 11 APR 67
// P61-P67.agc:949
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 21 NOV 67		VARIABLE MU ADDED.
// P61-P67.agc:950
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		ACCEPT DIFFERENT EARTH/MOON SCALE
// P61-P67.agc:951
//#
// P61-P67.agc:952
//# FUNCTIONAL DESCRIPTION:  EARTH CENTERED VIS VIVA CALCULATION OF TERMINAL VELOCITY AND GAMMA (REL TO
// P61-P67.agc:953
//#	HORIZONTAL) GIVEN THE SCALAR QUANTITIES:  PRESENT RADIUS AND VELOCITY AND THE TERMINAL RADIUS.
// P61-P67.agc:954
//#	THE USER MUST APPEND PROPER SIGN TO GAMMA, SINCE IT IS CALCULATED AS A POSITIVE NUMBER.
// P61-P67.agc:955
//#	THE EQUATIONS ARE
// P61-P67.agc:956
//#
// P61-P67.agc:957
//#		VGAM = SQRT(VN VN/MU + 2(RN-RTERM)/(RN RTERM) ) RTMU
// P61-P67.agc:958
//#
// P61-P67.agc:959
//#		COSGAM = H / RTERM VGAM = SQRT (LCP) / (RTERM VGAM/RTMU)
// P61-P67.agc:960
//#
// P61-P67.agc:961
//#	VGAMCALC ASSUMES THAT THE TERMINAL RADIUS IS LESS THAN THE PRESENT RADIUS.  BOTH CALCTFF AND CALCTPER
// P61-P67.agc:962
//#	MAKE THIS ASSUMPTION.
// P61-P67.agc:963
//#
// P61-P67.agc:964
//# CALLING SEQUENCE:	CALL			STCALL	RTERM
// P61-P67.agc:965
//#				VGAMCALC		PREVGAM
// P61-P67.agc:966
//#	PUSHLOC AT PDL+0, ARBITRARY IF LEQ 12D
// P61-P67.agc:967
//#	C(MPAC) UNSPECIFIED			C(MPAC)=NEW RTERM
// P61-P67.agc:968
//#
// P61-P67.agc:969
//# SUBROUTINES CALLED:  NONE
// P61-P67.agc:970
//#
// P61-P67.agc:971
//# NORMAL EXIT MODE:  RVQ
// P61-P67.agc:972
//#
// P61-P67.agc:973
//# ALARMS:	NONE
// P61-P67.agc:974
//#
// P61-P67.agc:975
//# OUTPUT:	GAMMA / 360 IN MPAC, POSITIVE NUMBER
// P61-P67.agc:976
//#		VGAM 	E: (-7)	  M: (-5)	M/CS IN PDL+0
// P61-P67.agc:977
//#		PUSHLOC AT PDL+2
// P61-P67.agc:978
//#
// P61-P67.agc:979
//# ERASABLE INITIALIZATION REQD:
// P61-P67.agc:980
//#	TFF/RTMU  E: (17)   M: (14)	1/SQRT(MU)				LEFT BY TFFCONIC
// P61-P67.agc:981
//#	RMAG1	  E: (-29)  M: (-27)	M  PRESENT RADIUS LENGTH		LEFT BY TFFCONIC
// P61-P67.agc:982
//#	NRMAG	  E: (-29+NR)		M  NORM LENGTH OF PRESENT POSITION	LEFT BY TFFCONIC
// P61-P67.agc:983
//#		  M: (-27+NR)
// P61-P67.agc:984
//#	RTERM	  E: (-29)  M: (-27)	M  TERMINAL RADIUS LENGTH		LEFT BY CALCTFF
// P61-P67.agc:985
//#	NRTERM    E: (-29+NR) 		M  NORM LENGTH OF TERMINAL RADIUS	LEFT BY CALCTFF
// P61-P67.agc:986
//#		  M: (-27+NR)
// P61-P67.agc:987
//#	TFFVSQ    E: (20)   M: (18)   1/M  -(V SQ/MU): PRESENT VELOCITY, NORM	LEFT BY TFFCONIC
// P61-P67.agc:988
//#	TFFNP	  E: (-38+2NR)		M  LCP, SEMI-LATUS RECTUM, WEIGHT NR	LEFT BY TFFCONIC
// P61-P67.agc:989
//#	  	  M: (-36+2NR)
// P61-P67.agc:990
//#
// P61-P67.agc:991
//# DEBRIS:	QPRET, PDL+0 ... PDL+3
// P61-P67.agc:992
//#		RTERM, NRTERM IF PREVGAM ENTERED.
// P61-P67.agc:993
//# Page 814
// P61-P67.agc:994
//
// P61-P67.agc:995
//PREVGAM		SL*			# ENTER WITH NEW RTERM IN MPAC
// slot 25126
    25126, 65374,
// P61-P67.agc:996
//					# E: (-29)  M: (-27)
// P61-P67.agc:997
//			0,1		# X1 = -NR
// slot 25127
    25127, 16642,
// P61-P67.agc:998
//		STORE	NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// slot 25128
    25128, 34,
// P61-P67.agc:999
//
// P61-P67.agc:1000
//VGAMCALC	DLOAD	DMP
// slot 25129
    25129, 34250,
// P61-P67.agc:1001
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// slot 25130
    25130, 66,
// P61-P67.agc:1002
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// slot 25131
    25131, 34,
// P61-P67.agc:1003
//		PDDL	DSU		# RMAG RTERM M		E: (-58+2NR)	M: (-54+2NR)
// slot 25132
    25132, 38314,
// P61-P67.agc:1004
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// slot 25133
    25133, 66,
// P61-P67.agc:1005
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// slot 25134
    25134, 34,
// P61-P67.agc:1006
//		SL*	DDV		# 2(RN-RTERM)		E: (-30+NR)	M: (-28+NR)
// slot 25135
    25135, 47454,
// P61-P67.agc:1007
//			0 -8D,1		# (-8+NR)
// slot 25136
    25136, 16626,
// P61-P67.agc:1008
//					# PUSH UP PRODUCT.
// P61-P67.agc:1009
//		DSU
// slot 25137
    25137, 65322,
// P61-P67.agc:1010
//			TFFVSQ		# -(V SQ/MU)		E: (20)		M: (18)
// slot 25138
    25138, 42,
// P61-P67.agc:1011
//		SQRT	PUSH		# SAVE VGAM/RT(MU) FOR NOW.	E: (10)	M: (9)
// slot 25139
    25139, 34540,
// P61-P67.agc:1012
//		DDV	PDDL		# XCH PDL+0, LEAVING VGAM FOR OUTPUT.
// slot 25140
    25140, 54642,
// P61-P67.agc:1013
//					# VGAM TO PDL M/CS	E: (-7)		M: (-2)
// P61-P67.agc:1014
//			TFF/RTMU	# 			E: (17)		M: (14)
// slot 25141
    25141, 62,
// P61-P67.agc:1015
//		DMP	PDDL		# RTERM VGAM/RTMU	E: (-19+NR)	M: (-18+NR)
// slot 25142
    25142, 54538,
// P61-P67.agc:1016
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// slot 25143
    25143, 34,
// P61-P67.agc:1017
//			TFFNP		# LC P =H.H/MU M	E: (-38+2NR)	M: (-36+2NR)
// slot 25144
    25144, 58,
// P61-P67.agc:1018
//		SQRT	DDV		#			E: (-19+NR)	M: (-18+NR)
// slot 25145
    25145, 47596,
// P61-P67.agc:1019
//					# PUSH UP DEN		E: (-19+NR)	M: (-18+NR)
// P61-P67.agc:1020
//					# USE DDV OVFL AS LIMITER (|COS| <1.0)
// P61-P67.agc:1021
//		SR1	ACOS
// slot 25146
    25146, 54980,
// P61-P67.agc:1022
//DUMPVGAM	RVQ
// slot 25147
    25147, 65308,
// P61-P67.agc:1023
//					# CALLER MUST SUPPLY OWN SIGN ...
// P61-P67.agc:1024
//					#			22W	27MS
// P61-P67.agc:1025
//
// P61-P67.agc:1026
//# Page 815
// P61-P67.agc:1027
//# SUBROUTINE NAME:	TFF/TRIG	(USED BY S61.2)		DATE:		01.17.67
// P61-P67.agc:1028
//# MOD NO: 0							LOG SECTION:	P61-P67
// P61-P67.agc:1029
//# MOD BY: RR BAIRNSFATHER
// P61-P67.agc:1030
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 14 APR 67
// P61-P67.agc:1031
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		ACCEPT DIFFERENT EARTH/MOON SCALE
// P61-P67.agc:1032
//#
// P61-P67.agc:1033
//# FUNCTIONAL DESCRIPTION:  USED BY ENTRY DISPLAY TO CALCULATE SIN(THETA), COS(THETA) FROM DATA LEFT IN
// P61-P67.agc:1034
//#	PDL BY TFF SUBROUTINES.  THE EQNS ARE
// P61-P67.agc:1035
//#
// P61-P67.agc:1036
//#		COS(THETA) = 1-2 ABS(ARG) / (RN RTERM (1+X) )
// P61-P67.agc:1037
//#						2
// P61-P67.agc:1038
//#		SIN(THETA) = SGN(ARG) SQRT(1-COS (THETA) )
// P61-P67.agc:1039
//#
// P61-P67.agc:1040
//# 	WHERE THETA = TRANSFER ANGLE
// P61-P67.agc:1041
//#	AND     ARG = P Z ABS(Z)			IF ALFA ZZ LEQ 1
// P61-P67.agc:1042
//#	        ARG = (P / ALFA) SGN(Q1 + R 1/Z)        IF ALFA Z Z G 1
// P61-P67.agc:1043
//#	AND  ARG  HAS BEEN AFFIXED WITH THE SIGN OF SIN(THETA)
// P61-P67.agc:1044
//#
// P61-P67.agc:1045
//# CALLING SEQUENCE:	CALL
// P61-P67.agc:1046
//#				TFF/TRIG
// P61-P67.agc:1047
//#		PUSHLOC AT PDL+0, ARBITRARY IF NOT EQ 14D
// P61-P67.agc:1048
//#		C(MPAC) UNSPECIFIED
// P61-P67.agc:1049
//#
// P61-P67.agc:1050
//# SUBROUTINES CALLED:  NONE
// P61-P67.agc:1051
//#
// P61-P67.agc:1052
//# NORMAL EXIT MODES:  RVQ
// P61-P67.agc:1053
//#
// P61-P67.agc:1054
//# ALARMS:	NONE
// P61-P67.agc:1055
//#
// P61-P67.agc:1056
//# OUTPUT:	C(MPAC) = .5 SIN(THETA)
// P61-P67.agc:1057
//#		CDELF/2 = .5 COS(THETA)		(IN PDL 14D)
// P61-P67.agc:1058
//#		PUSHLOC AT PDL+0
// P61-P67.agc:1059
//#
// P61-P67.agc:1060
//# ERASABLE INITIALIZATION REQUIRED:
// P61-P67.agc:1061
//#		TFFX			X					LEFT BY CALCTFF OR CALCTPER
// P61-P67.agc:1062
//#		TFFTEM  E: (-59+2NR)	ARG					LEFT BY CALCTFF OR CALCTPER
// P61-P67.agc:1063
//#			M: (-55+2NR)	WHERE ARG = LCF ZZ SGN(DELF) OR ARG = LCP/ALFA SGN(DELF)
// P61-P67.agc:1064
//#		NRTERM	E: (-29+NR)	M  NORM LENGTH OF TERMINAL RADIUS	LEFT BY CALCTFF OR CALCTPER
// P61-P67.agc:1065
//#			M: (-27+NR)
// P61-P67.agc:1066
//#		NRMAG	E: (-29+NR)	M  NORM LENGTH OF PRESENT POSITION	LEFT BY TFFCONIC
// P61-P67.agc:1067
//#			M: (-27+NR)
// P61-P67.agc:1068
//#
// P61-P67.agc:1069
//# DEBRIS:	QPRET, CDELF/2
// P61-P67.agc:1070
//
// P61-P67.agc:1071
//		BANK	27
// P61-P67.agc:1072
//		SETLOC	P60S5
// P61-P67.agc:1073
//		BANK
// P61-P67.agc:1074
//TFF/TRIG	DLOAD	SR1
// slot 26009
    26009, 58058
)).

agcAotInstallSourceRope(list(
// P61-P67.agc:1075
//			TFFX
// slot 26010
    26010, 70,
// P61-P67.agc:1076
//		DAD	DMP
// slot 26011
    26011, 34074,
// P61-P67.agc:1077
//			HIDPHALF
// slot 26012
    26012, 13750,
// P61-P67.agc:1078
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// slot 26013
    26013, 66,
// P61-P67.agc:1079
//		DMP	BDDV
// slot 26014
    26014, 46346,
// P61-P67.agc:1080
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// slot 26015
    26015, 34,
// P61-P67.agc:1081
//			TFFTEM		# P ZSQ OR P/ALFA	E: (-59+2NR)	M: (-55+2NR)
// slot 26016
    26016, 74,
// P61-P67.agc:1082
//		ABS	BDSU		# THE SIGN IS FOR SDELF.
// slot 26017
    26017, 37196,
// P61-P67.agc:1083
//			HIDPHALF
// slot 26018
    26018, 13750,
// P61-P67.agc:1084
//		STORE	CDELF/2		# .5 COS(THETA)
// slot 26019
    26019, 30,
// P61-P67.agc:1085
//		DSQ	DCOMP		# KEEP HONEST FOR SQRT.
// slot 26020
    26020, 48796,
// P61-P67.agc:1086
//# Page 816
// P61-P67.agc:1087
//		DAD	SQRT
// slot 26021
    26021, 63002,
// P61-P67.agc:1088
//			HIDP1/4
// slot 26022
    26022, 13738,
// P61-P67.agc:1089
//DUMPTRIG	SIGN	RVQ
// slot 26023
    26023, 36586,
// P61-P67.agc:1090
//			TFFTEM		# AFFIX SIGN(DELE/2)
// slot 26024
    26024, 74,
// P61-P67.agc:1091
//					# RETURN WITH .5 SIN(THETA) IN MPAC
// P61-P67.agc:1092
//
// P61-P67.agc:1093
//					#			16W	15MS
// P61-P67.agc:1094
//
// P61-P67.agc:1095
//DISPTARG	STQ			# C(MPAC = TRGO ESTIMATE
// slot 26025
    26025, 65312,
// P61-P67.agc:1096
//			60GENRET
// slot 26026
    26026, 3574,
// P61-P67.agc:1097
//		DMP	DSU
// slot 26027
    26027, 38154,
// P61-P67.agc:1098
//			KTETA1
// slot 26028
    26028, 13318,
// P61-P67.agc:1099
//			TTE1
// slot 26029
    26029, 4022,
// P61-P67.agc:1100
//		STCALL	DTEAROT
// slot 26030
    26030, 32524,
// P61-P67.agc:1101
//			EARROT2
// slot 26031
    26031, 39210,
// P61-P67.agc:1102
//		CALL
// slot 26032
    26032, 65320,
// P61-P67.agc:1103
//			VRCALC
// slot 26033
    26033, 47976,
// P61-P67.agc:1104
//		GOTO
// slot 26034
    26034, 65360,
// P61-P67.agc:1105
//			60GENRET
// slot 26035
    26035, 3574,
// P61-P67.agc:1106
//VRCALC		VLOAD	DOT
// slot 26036
    26036, 41466,
// P61-P67.agc:1107
//			URH
// slot 26037
    26037, 3780,
// P61-P67.agc:1108
//			RT
// slot 26038
    26038, 3704,
// P61-P67.agc:1109
//		SL2	ACOS
// slot 26039
    26039, 54932,
// P61-P67.agc:1110
//		RVQ
// slot 26040
    26040, 65308,
// P61-P67.agc:1111
//
// P61-P67.agc:1112
//# END OF PROGRAM S61.2
// P61-P67.agc:1113
//
// P61-P67.agc:1114
//# Page 817
// P61-P67.agc:1115
//# PROGRAM DESCRIPTION S62.3	DATE 10JAN67
// P61-P67.agc:1116
//# MOD NO 1:			LOG SECTION P60-P67
// P61-P67.agc:1117
//# MOD BY ZELDIN
// P61-P67.agc:1118
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 15 MAY 67		CHANGED TO REF COORDS.
// P61-P67.agc:1119
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 17 JAN 68		ALFAPAD CHANGES MADE.
// P61-P67.agc:1120
//#
// P61-P67.agc:1121
//# FUNCTIONAL DESCRIPTION
// P61-P67.agc:1122
//#
// P61-P67.agc:1123
//#	COMPUTE DESIRED GIMBAL ANGLES FOR ENTRY ATTITUDE
// P61-P67.agc:1124
//#	THE FOLLOWING TRAJECTORY TRIAD IS AVAILABLE IN MEMORY AND IS COMPUTED EACH 2 SECONDS BY CM/POSE IN
// P61-P67.agc:1125
//#	REFERENCE COORDINATES (V = VELOCITY RELATIVE TO EARTH):
// P61-P67.agc:1126
//#
// P61-P67.agc:1127
//#		UXA = -UNIT(V)
// P61-P67.agc:1128
//#		UYA =  UNIT(V*R)
// P61-P67.agc:1129
//#		UZA =  UXA*UYA
// P61-P67.agc:1130
//#
// P61-P67.agc:1131
//# 	GENERATE A DESIRED BODY TRIAD FOR TRIMMED FLIGHT WITH RESPECT TO THE RELATIVE VELOCITY VECTOR, USING
// P61-P67.agc:1132
//#	ROLL COMMAND AND TRIM ANGLE OF ATTACK:
// P61-P67.agc:1133
//#
// P61-P67.agc:1134
//#		UXD = UNIT(UYD*UXA) SIN(ALFATRIM) + UXA COS(ALFATRIM)
// P61-P67.agc:1135
//#		UYD = UYA COS(ROLLC) + UZA SIN(ROLLC)
// P61-P67.agc:1136
//#		UZD = UXD * UYD
// P61-P67.agc:1137
//#
// P61-P67.agc:1138
//#	USE THE DESIRED SET (IN REFERENCE COORDS) AND REFSMMAT TO CALL  CALCGA  AND OBTAIN GIMBAL ANGLES
// P61-P67.agc:1139
//#	IN 2S, C IN MPAC, +2 AND THETAD, +2.
// P61-P67.agc:1140
//#
// P61-P67.agc:1141
//# CALLING SEQUENCE
// P61-P67.agc:1142
//#
// P61-P67.agc:1143
//#	L	CALL
// P61-P67.agc:1144
//#	L+1		S62.3
// P61-P67.agc:1145
//#
// P61-P67.agc:1146
//# NORMAL EXIT MODE
// P61-P67.agc:1147
//#
// P61-P67.agc:1148
//#	RETURN VIA QPRET DIRECTLY FROM CALCGA.
// P61-P67.agc:1149
//#
// P61-P67.agc:1150
//# SUBROUTINES CALLED
// P61-P67.agc:1151
//#
// P61-P67.agc:1152
//#	CALCGA
// P61-P67.agc:1153
//#
// P61-P67.agc:1154
//# ALARM OR ABORT MODES
// P61-P67.agc:1155
//#
// P61-P67.agc:1156
//#	NONE
// P61-P67.agc:1157
//#
// P61-P67.agc:1158
//# ERASABLE INITIALIZATION REQUIRED
// P61-P67.agc:1159
//#
// P61-P67.agc:1160
//#	ROLLC	ROLL COMMAND		DP 1'S COMP AT 1REV
// P61-P67.agc:1161
//#	ALFAPAD	SP 1'S C / 180		LEFT BY PAD LOAD	ALFATRIM IS NEGATIVE.
// P61-P67.agc:1162
//#	UXA/2	REF COORDS		LEFT BY CM/POSE
// P61-P67.agc:1163
//#	UYA/2	REF COORDS		LEFT BY CM/POSE
// P61-P67.agc:1164
//#	UZA/2	REF COORDS		LEFT BY CM/POSE
// P61-P67.agc:1165
//#
// P61-P67.agc:1166
//# OUTPUT
// P61-P67.agc:1167
//#
// P61-P67.agc:1168
//#	CPHI	GIMBAL ANGLES (O,I,M) 2'S COMP TP (O,I,M)/180
// P61-P67.agc:1169
//#
// P61-P67.agc:1170
//# DEBRIS
// P61-P67.agc:1171
//#
// P61-P67.agc:1172
//#	QTEMP, QPRET, PUSHLIST
// P61-P67.agc:1173
//
// P61-P67.agc:1174
//		BANK	10
// P61-P67.agc:1175
//		SETLOC	P60S4
// P61-P67.agc:1176
//		BANK
// P61-P67.agc:1177
//# Page 818
// P61-P67.agc:1178
//		COUNT*	$$/S62.3
// P61-P67.agc:1179
//
// P61-P67.agc:1180
//S62.3		SETPD	SLOAD
// slot 10494
    10494, 56578,
// P61-P67.agc:1181
//			0
// slot 10495
    10495, 2,
// P61-P67.agc:1182
//			ALFAPAD		# ALFATRIM / 180, ALFA IS NEG.
// slot 10496
    10496, 3092,
// P61-P67.agc:1183
//		SR1	PUSH
// slot 10497
    10497, 34500,
// P61-P67.agc:1184
//		COS	PDDL		# XCH PDL, COS TO PDL0
// slot 10498
    10498, 54732,
// P61-P67.agc:1185
//		SIN	PDDL		# SIN TO PDL2
// slot 10499
    10499, 54748,
// P61-P67.agc:1186
//			ROLLC
// slot 10500
    10500, 3484,
// P61-P67.agc:1187
//		COS	VXSC
// slot 10501
    10501, 61900,
// P61-P67.agc:1188
//			UYA/2		#				REF COORDS
// slot 10502
    10502, 3792,
// P61-P67.agc:1189
//		PDDL	SIN		# PUSH VECTOR INTO PDL4...9
// slot 10503
    10503, 61098,
// P61-P67.agc:1190
//			ROLLC
// slot 10504
    10504, 3484,
// P61-P67.agc:1191
//		VXSC	VAD
// slot 10505
    10505, 44514,
// P61-P67.agc:1192
//			UZA/2		#				REF COORDS
// slot 10506
    10506, 3804,
// P61-P67.agc:1193
//					# VECTOR FROM PDL4...9
// P61-P67.agc:1194
//		VSL1
// slot 10507
    10507, 65524,
// P61-P67.agc:1195
//		STORE	YNB		# = UYD				REF COORDS
// slot 10508
    10508, 2980,
// P61-P67.agc:1196
//
// P61-P67.agc:1197
//		VXV	VSL1
// slot 10509
    10509, 64058,
// P61-P67.agc:1198
//			UXA/2		#				REF COORDS
// slot 10510
    10510, 3780,
// P61-P67.agc:1199
//		VXSC	PDDL
// slot 10511
    10511, 54754,
// P61-P67.agc:1200
//					# SIN TRIM FROM PDL2
// P61-P67.agc:1201
//					# XCH PDL0 FOR COS TRIM
// P61-P67.agc:1202
//		VXSC	VAD
// slot 10512
    10512, 44514
)).

agcAotInstallSourceRope(list(
// P61-P67.agc:1203
//			UXA/2		#				REF COORDS
// slot 10513
    10513, 3780,
// P61-P67.agc:1204
//					# FROM PDL0
// P61-P67.agc:1205
//		VSL1
// slot 10514
    10514, 65524,
// P61-P67.agc:1206
//		STORE	XNB		# X SC AXIS (.5 UNIT)		REF COORDS
// slot 10515
    10515, 2968,
// P61-P67.agc:1207
//
// P61-P67.agc:1208
//		VXV	VSL1
// slot 10516
    10516, 64058,
// P61-P67.agc:1209
//			YNB
// slot 10517
    10517, 2980,
// P61-P67.agc:1210
//		STOVL	ZNB		# Z SC IN REF COOR. SCALED AT 2
// slot 10518
    10518, 23472,
// P61-P67.agc:1211
//			REFSMMAT
// slot 10519
    10519, 1980,
// P61-P67.agc:1212
//		STOVL	XSM
// slot 10520
    10520, 23412,
// P61-P67.agc:1213
//			REFSMMAT +6
// slot 10521
    10521, 1992,
// P61-P67.agc:1214
//		STOVL	YSM
// slot 10522
    10522, 23424,
// P61-P67.agc:1215
//			REFSMMAT +12D
// slot 10523
    10523, 2004,
// P61-P67.agc:1216
//		STORE	ZSM
// slot 10524
    10524, 2956,
// P61-P67.agc:1217
//
// P61-P67.agc:1218
//		CLEAR	GOTO
// slot 10525
    10525, 43032,
// P61-P67.agc:1219
//			CPHIFLAG	# CAUSE CALCGA TO STORE ANS IN TP CPHI
// slot 10526
    10526, 352,
// P61-P67.agc:1220
//			CALCGA
// slot 10527
    10527, 40338
)).

// no code for the lines below
// P61-P67.agc:1221
//					# CALCGA WILL RETURN TO ORIGINAL CALLER
// P61-P67.agc:1222
//					# VIA QPRET WITH 2'S COMP. ANGLES IN CPHI
// P61-P67.agc:1223
//
// P61-P67.agc:1224
//
// P61-P67.agc:1225
//
