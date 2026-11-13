// PORT: Original source unit P61-P67.agc.
// PORT: Physical bank 26. Shared continuation entries, slots 24719–24725.
function agcAotUnit1424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24721 {
        if slot <= 24719 {
// PORT: SOURCE P61-P67.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE P61-P67.agc:2
//# Filename:     P61-P67.agc
// PORT: SOURCE P61-P67.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE P61-P67.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE P61-P67.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE P61-P67.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE P61-P67.agc:7
//# Reference:    pp. 789-818
// PORT: SOURCE P61-P67.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE P61-P67.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE P61-P67.agc:10
//# Mod history:  2009-05-12 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE P61-P67.agc:11
//#				name and Comanche 055 page images.
// PORT: SOURCE P61-P67.agc:12
//#		2009-05-20 RSB	Corrections:  V06N68 -> V06N74, added missing
// PORT: SOURCE P61-P67.agc:13
//#				definition of V06N74, in several
// PORT: SOURCE P61-P67.agc:14
//#				interpreter operands fixed stuff like
// PORT: SOURCE P61-P67.agc:15
//#				N-M,1 to N -M,1
// PORT: SOURCE P61-P67.agc:16
//#
// PORT: SOURCE P61-P67.agc:17
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE P61-P67.agc:18
//# from scanned documents.
// PORT: SOURCE P61-P67.agc:19
//#
// PORT: SOURCE P61-P67.agc:20
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P61-P67.agc:21
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE P61-P67.agc:22
//#
// PORT: SOURCE P61-P67.agc:23
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE P61-P67.agc:24
//#
// PORT: SOURCE P61-P67.agc:25
//#       Prepared by
// PORT: SOURCE P61-P67.agc:26
//#                       Massachusetts Institute of Technology
// PORT: SOURCE P61-P67.agc:27
//#                       75 Cambridge Parkway
// PORT: SOURCE P61-P67.agc:28
//#                       Cambridge, Massachusetts
// PORT: SOURCE P61-P67.agc:29
//#
// PORT: SOURCE P61-P67.agc:30
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE P61-P67.agc:31
//#
// PORT: SOURCE P61-P67.agc:32
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE P61-P67.agc:33
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE P61-P67.agc:34
//
// PORT: SOURCE P61-P67.agc:35
//# Page 789
// PORT: SOURCE P61-P67.agc:36
//# PROGRAM:	P61
// PORT: SOURCE P61-P67.agc:37
//# MOD NO.:	0	MAR. 13, 1967
// PORT: SOURCE P61-P67.agc:38
//# MOD BY:	R. HIRSCHKOP
// PORT: SOURCE P61-P67.agc:39
//# MOD NO: 1	MOD BY:  RR BAIRNSFATHER	DATE: 22 JUN 67		RESTARTS
// PORT: SOURCE P61-P67.agc:40
//# MOD NO: 2	MOD BY:  RR BAIRNSFATHER	DATE: 17 JAN 68		COLOSSUS GSOP CHANGES
// PORT: SOURCE P61-P67.agc:41
//# MOD NO: 3	MOD BY:  RR BAIRNSFATHER	DATE:  8 MAY 68		DELETE CMSM MANEUVER (PCR 50)
// PORT: SOURCE P61-P67.agc:42
//# FUNCTION:	TO CALCULATE AND DISPLAY EMS INITIALIZATION DATA
// PORT: SOURCE P61-P67.agc:43
//# CALLING SEQUENCE:  BY V37
// PORT: SOURCE P61-P67.agc:44
//# EXIT:		TO P62
// PORT: SOURCE P61-P67.agc:45
//# SUBROUTINE CALLS:  S61.1, S61.3, GOFLASH, FLAGUP, R02BOTH
// PORT: SOURCE P61-P67.agc:46
//# ERASABLE INITIALIZATION:
// PORT: SOURCE P61-P67.agc:47
//#	EMSALT (-29) M		.05G ALTITUDE ABOVE FISCHER ELLIPSOID	PAD LOADED.
// PORT: SOURCE P61-P67.agc:48
//#	ALFAPAD /180		HYPERSONIC CM TRIM ANGLE OF ATTACK	PAD LOADED
// PORT: SOURCE P61-P67.agc:49
//# OUTPUT:	THE FOLLOWING REGISTERS ARE WRITTEN IN FOR USE BY DISPLAYS
// PORT: SOURCE P61-P67.agc:50
//#		GMAX	100 GMAX (-14) G,S	MAXIMUM ACCELERATION
// PORT: SOURCE P61-P67.agc:51
//#		VPRED	(-7) M/CS		PREDICTED VELOCITY AT 400K FT
// PORT: SOURCE P61-P67.agc:52
//#		GAMMAEI	(GAMMA/360		PREDICTED GAMMA    AT 400K FT
// PORT: SOURCE P61-P67.agc:53
//#		RTGO	THETAH/360		RANGE ANGLE TO SPLASH FROM EMSALT	EMSALT IS PAD LOADED
// PORT: SOURCE P61-P67.agc:54
//#		VIO	(-7) M/CS		INERTIAL VELOCITY AT	   EMSALT	EMSALT IS PAD LOADED
// PORT: SOURCE P61-P67.agc:55
//#		TTE	(-28) CS		TIME TO			   EMSALT	EMSALT IS PAD LOADED
// PORT: SOURCE P61-P67.agc:56
//#		LAT(SPL) /360			TARGET LOCATION				LEFT BY DSKY
// PORT: SOURCE P61-P67.agc:57
//#		LNG(SPL) /360			TARGET LOCATION				LEFT BY DSKY
// PORT: SOURCE P61-P67.agc:58
//#		HEADSUP	(0)			+1 = LIFT DOWN, -1 = LIFT UP		LEFT BY DSKY
// PORT: SOURCE P61-P67.agc:59
//# DEBRIS:	SEE SUBROUTINES.
// PORT: SOURCE P61-P67.agc:60
//
// PORT: SOURCE P61-P67.agc:61
//		BANK	26
// PORT: SOURCE P61-P67.agc:62
//		SETLOC	P60S
// PORT: SOURCE P61-P67.agc:63
//		BANK
// PORT: SOURCE P61-P67.agc:64
//
// PORT: SOURCE P61-P67.agc:65
//		EBANK=	AOG
// PORT: SOURCE P61-P67.agc:66
//
// PORT: SOURCE P61-P67.agc:67
//		COUNT*	$$/P61
// PORT: SOURCE P61-P67.agc:68
//
// PORT: SOURCE P61-P67.agc:69
//P61		CA	BIT14		# EXTENDED VERB SHOULD BE FREE THIS CLOSE
// PORT: Fixed ROM slots 24719.
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
// PORT: SOURCE P61-P67.agc:70
//		TS	EXTVBACT	# TO V37
// PORT: Fixed ROM slots 24720.
                if slot <> 24720 or instruction <> 23076 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:71
//					# LOCK OUT EXTENDED VERBS SO CAN USE TFF
// PORT: SOURCE P61-P67.agc:72
//					# ROUTINES.  EXT VERB ERASE IS USED
// PORT: SOURCE P61-P67.agc:73
//
// PORT: SOURCE P61-P67.agc:74
//		CS	ONE		# REMOVE IF HEADSUP EVER ON UPLINK DATA
// PORT: Fixed ROM slots 24721.
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
// PORT: SOURCE P61-P67.agc:75
//		TS	HEADSUP		# PRELOAD
// PORT: Fixed ROM slots 24722.
                if slot <> 24722 or instruction <> 23510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23510, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:76
//
// PORT: SOURCE P61-P67.agc:77
//		TC	S61.1		# CHECK STATE VECTOR AND IMU ORIENTATION
// PORT: Fixed ROM slots 24723.
                if slot <> 24723 or instruction <> 1380 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1380, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24724 {
// PORT: SOURCE P61-P67.agc:78
//					# RV 60GENRET. DOES PHASCHNG, GROUP 4.
// PORT: SOURCE P61-P67.agc:79
//
// PORT: SOURCE P61-P67.agc:80
//		CA	V06N61		# LAT(SPL)	LNG(SPL)	HEADSUP
// PORT: Fixed ROM slots 24724.
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
// PORT: SOURCE P61-P67.agc:81
//					# XXX.XX DEG	XXX.XX DEG	XXXXX.
// PORT: SOURCE P61-P67.agc:82
//		TC	BANKCALL
// PORT: Fixed ROM slots 24725.
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
// PORT: SOURCE P61-P67.agc:83
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 24726.
    24726, 17502
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24727–24730.
function agcAotUnit1425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24728 {
        if slot <= 24727 {
// PORT: SOURCE P61-P67.agc:84
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 24727.
            if slot <> 24727 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:85
//# Page 790
// PORT: SOURCE P61-P67.agc:86
//		TC	P61.4
// PORT: Fixed ROM slots 24728.
            if slot <> 24728 or instruction <> 1181 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1181, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24729 {
// PORT: SOURCE P61-P67.agc:87
//		TC	-5
// PORT: Fixed ROM slots 24729.
            if slot <> 24729 or instruction <> 1172 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1172, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:88
//
// PORT: SOURCE P61-P67.agc:89
//P61.3		TC	PHASCHNG
// PORT: Fixed ROM slots 24730.
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
// PORT: SOURCE P61-P67.agc:90
//		OCT	00014
// PORT: Fixed ROM slots 24731.
    24731, 24
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24732–24738.
function agcAotUnit1426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24734 {
        if slot <= 24732 {
// PORT: SOURCE P61-P67.agc:91
//
// PORT: SOURCE P61-P67.agc:92
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 24732.
            if slot <> 24732 or instruction <> 2703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24733 {
// PORT: SOURCE P61-P67.agc:93
//
// PORT: SOURCE P61-P67.agc:94
//P61.4		ZL
// PORT: Fixed ROM slots 24733.
                if slot <> 24733 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:95
//		CCS	HEADSUP		# C(HEADSUP)= +1/-1
// PORT: Fixed ROM slots 24734.
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
// PORT: SOURCE P61-P67.agc:96
//		CA	BIT14		# IF HEADSUP POS,ROLLC =180 DEG.(LIFT DWN)
// PORT: Fixed ROM slots 24735.
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
// PORT: SOURCE P61-P67.agc:97
//		NOOP			# IF HEADSUP NEG,ROLLC =0 (LIFT UP)
// PORT: Fixed ROM slots 24736.
                if slot <> 24736 or instruction <> 5281 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5281, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24737 {
// PORT: SOURCE P61-P67.agc:98
//		DXCH	ROLLC		# ROLLC IS USED BY S62.3: GIM ANG AT .05G
// PORT: Fixed ROM slots 24737.
                if slot <> 24737 or instruction <> 22478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 974, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:99
//
// PORT: SOURCE P61-P67.agc:100
//		TC	INTPRET
// PORT: Fixed ROM slots 24738.
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
// PORT: SOURCE P61-P67.agc:101
//NEWRNVN		DLOAD
// PORT: Fixed ROM slots 24739.
    24739, 65482,
// PORT: SOURCE P61-P67.agc:102
//			PIPTIME		# SAVE TIME OF RN,VN TO DETERMINE IF AN
// PORT: Fixed ROM slots 24740.
    24740, 1290,
// PORT: SOURCE P61-P67.agc:103
//		STCALL	MM		# UPDATE HAS OCCURRED.
// PORT: Fixed ROM slots 24741.
    24741, 32594,
// PORT: SOURCE P61-P67.agc:104
//			STARTEN1	# INITIALIZE
// PORT: Fixed ROM slots 24742.
    24742, 43110,
// PORT: SOURCE P61-P67.agc:105
//		VLOAD
// PORT: Fixed ROM slots 24743.
    24743, 65530,
// PORT: SOURCE P61-P67.agc:106
//			RN
// PORT: Fixed ROM slots 24744.
    24744, 1266,
// PORT: SOURCE P61-P67.agc:107
//		STORE	RONE
// PORT: Fixed ROM slots 24745.
    24745, 2478,
// PORT: SOURCE P61-P67.agc:108
//		UNIT
// PORT: Fixed ROM slots 24746.
    24746, 65372,
// PORT: SOURCE P61-P67.agc:109
//		STOVL	URONE
// PORT: Fixed ROM slots 24747.
    24747, 22982,
// PORT: SOURCE P61-P67.agc:110
//			VN
// PORT: Fixed ROM slots 24748.
    24748, 1278,
// PORT: SOURCE P61-P67.agc:111
//		STORE	VONE
// PORT: Fixed ROM slots 24749.
    24749, 2490,
// PORT: SOURCE P61-P67.agc:112
//		VXV	UNIT
// PORT: Fixed ROM slots 24750.
    24750, 44602,
// PORT: SOURCE P61-P67.agc:113
//			URONE
// PORT: Fixed ROM slots 24751.
    24751, 2502,
// PORT: SOURCE P61-P67.agc:114
//		STORE	UNI
// PORT: Fixed ROM slots 24752.
    24752, 3716,
// PORT: SOURCE P61-P67.agc:115
//DUMPP61		DLOAD	DSU
// PORT: Fixed ROM slots 24753.
    24753, 38346,
// PORT: SOURCE P61-P67.agc:116
//			MM		# INITIAL VALUE OF PIPTIME
// PORT: Fixed ROM slots 24754.
    24754, 3922,
// PORT: SOURCE P61-P67.agc:117
//			PIPTIME
// PORT: Fixed ROM slots 24755.
    24755, 1290,
// PORT: SOURCE P61-P67.agc:118
//		BMN	CALRB
// PORT: Fixed ROM slots 24756.
    24756, 37952,
// PORT: SOURCE P61-P67.agc:119
//			NEWRNVN		# UPDATED... GO TRY AGAIN
// PORT: Fixed ROM slots 24757.
    24757, 45382,
// PORT: SOURCE P61-P67.agc:120
//			S61.2		# GET DISPLAY DATA FOR N60 AND N63
// PORT: Fixed ROM slots 24758.
    24758, 45906
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24759–24761.
function agcAotUnit1427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24759 {
// PORT: SOURCE P61-P67.agc:121
//					# AND RETURN IN BASIC, BELOW.
// PORT: SOURCE P61-P67.agc:122
//P61.1		TC	CLEARMRK
// PORT: Fixed ROM slots 24759.
        if slot <> 24759 or instruction <> 2910 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2910, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24760 {
// PORT: SOURCE P61-P67.agc:123
//		CA	V06N60		# GMAX		VPRED		GAMMAEI
// PORT: Fixed ROM slots 24760.
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
// PORT: SOURCE P61-P67.agc:124
//					# XXX.XX G	XXXXX. FPS	XXX.XX DEG
// PORT: SOURCE P61-P67.agc:125
//		TC	BANKCALL
// PORT: Fixed ROM slots 24761.
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
// PORT: SOURCE P61-P67.agc:126
//		CADR	GOFLASH
// PORT: Fixed ROM slots 24762.
    24762, 17312
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24763–24766.
function agcAotUnit1428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24764 {
        if slot <= 24763 {
// PORT: SOURCE P61-P67.agc:127
//
// PORT: SOURCE P61-P67.agc:128
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 24763.
            if slot <> 24763 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:129
//		TC	P61.2		# PROCEED
// PORT: Fixed ROM slots 24764.
            if slot <> 24764 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24765 {
// PORT: SOURCE P61-P67.agc:130
//		TC	-5
// PORT: Fixed ROM slots 24765.
            if slot <> 24765 or instruction <> 1208 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1208, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:131
//
// PORT: SOURCE P61-P67.agc:132
//P61.2		TC	INTPRET		# CORRECT TTE FOR TIME LAPSE DURING
// PORT: Fixed ROM slots 24766.
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
// PORT: SOURCE P61-P67.agc:133
//					# ABOVE DISPLAY.
// PORT: SOURCE P61-P67.agc:134
//		RTB	DSU
// PORT: Fixed ROM slots 24767.
    24767, 38200,
// PORT: SOURCE P61-P67.agc:135
//			LOADTIME	# CURRENT TIME.
// PORT: Fixed ROM slots 24768.
    24768, 38544,
// PORT: SOURCE P61-P67.agc:136
//# Page 791
// PORT: SOURCE P61-P67.agc:137
//			MM		# PIPTIME FOR RONE & VONE.
// PORT: Fixed ROM slots 24769.
    24769, 3922,
// PORT: SOURCE P61-P67.agc:138
//		DAD
// PORT: Fixed ROM slots 24770.
    24770, 65306,
// PORT: SOURCE P61-P67.agc:139
//			TTE1		# NEGATIVE OF FREE FALL TIME.
// PORT: Fixed ROM slots 24771.
    24771, 4022,
// PORT: SOURCE P61-P67.agc:140
//		STORE	TTE		# DECREMENTED
// PORT: Fixed ROM slots 24772.
    24772, 4014,
// PORT: SOURCE P61-P67.agc:141
//
// PORT: SOURCE P61-P67.agc:142
//		EXIT
// PORT: Fixed ROM slots 24773.
    24773, 65532
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24774–24775.
function agcAotUnit1429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24774 {
// PORT: SOURCE P61-P67.agc:143
//
// PORT: SOURCE P61-P67.agc:144
//		CA	V06N63		# RTGO		VIO		TTE
// PORT: Fixed ROM slots 24774.
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
// PORT: SOURCE P61-P67.agc:145
//					# XXXX.X NM	XXXXX. FPS	XXBXX M,S
// PORT: SOURCE P61-P67.agc:146
//		TC	BANKCALL
// PORT: Fixed ROM slots 24775.
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
// PORT: SOURCE P61-P67.agc:147
//		CADR	GOFLASH
// PORT: Fixed ROM slots 24776.
    24776, 17312
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24777–24780.
function agcAotUnit1430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24778 {
        if slot <= 24777 {
// PORT: SOURCE P61-P67.agc:148
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 24777.
            if slot <> 24777 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:149
//		TC	+2
// PORT: Fixed ROM slots 24778.
            if slot <> 24778 or instruction <> 1228 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1228, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24779 {
// PORT: SOURCE P61-P67.agc:150
//		TC	P61.2		# REDO
// PORT: Fixed ROM slots 24779.
            if slot <> 24779 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:151
//
// PORT: SOURCE P61-P67.agc:152
//#		.... THEN FALL INTO P62
// PORT: SOURCE P61-P67.agc:153
//# Page 792
// PORT: SOURCE P61-P67.agc:154
//
// PORT: SOURCE P61-P67.agc:155
//# PROGRAM:	P62
// PORT: SOURCE P61-P67.agc:156
//# MOD NO.:	0	MAR. 13, 1967
// PORT: SOURCE P61-P67.agc:157
//# MOD BY:	R. HIRSCHKOP
// PORT: SOURCE P61-P67.agc:158
//# MOD NO:  1	MOD BY:  RR BAIRNSFATHER	DATE: 21 MAR 67
// PORT: SOURCE P61-P67.agc:159
//# MOD NO:  2	MOD BY:  RR BAIRNSFATHER	DATE: 22 JUN 67		RESTARTS.
// PORT: SOURCE P61-P67.agc:160
//# MOD NO:  3	MOD BY:  RR BAIRNSFATHER	DATE: 17 JAN 68		COLOSSUS GSOP CHANGES.
// PORT: SOURCE P61-P67.agc:161
//# MOD NO:  4	MOD BY:  RR BAIRNSFATHER	DATE:  8 MAY 68		MOVE START OF DESIRED GIMBAL CALC.
// PORT: SOURCE P61-P67.agc:162
//# FUNCTION:	1) TO NOTIFY CREW WHEN GNC SYSTEM IS PREPARED FOR CM/SM SEPARATION.
// PORT: SOURCE P61-P67.agc:163
//#		2) TO ORIENT THE CM TO THE CORRECT ATTITUDE FOR ATMOSPHERIC ENTRY.
// PORT: SOURCE P61-P67.agc:164
//# CALLING SEQUENCE:  BY V37 OR DIRECTLY FROM P61
// PORT: SOURCE P61-P67.agc:165
//# EXIT:		TO P63
// PORT: SOURCE P61-P67.agc:166
//# ERASABLE INITIALIZATION:
// PORT: SOURCE P61-P67.agc:167
//#	ALFAPAD					 	LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:168
//#	LADPAD						LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:169
//#	LODPAD						LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:170
//#	LAT(SPL)	(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// PORT: SOURCE P61-P67.agc:171
//#	LNG(SPL)	(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// PORT: SOURCE P61-P67.agc:172
//#	HEADSUP		(MAY BE CHANGED BELOW)		LEFT BY DSKY, VIA P61
// PORT: SOURCE P61-P67.agc:173
//# SUBROUTINE CALLS:  NEWMODEX, S61.1, CM/DAPIC, CM/DAPON, R02BOTH, GOPERF1, GOFLASH, GODSPR.
// PORT: SOURCE P61-P67.agc:174
//
// PORT: SOURCE P61-P67.agc:175
//		COUNT*	$$/P62
// PORT: SOURCE P61-P67.agc:176
//
// PORT: SOURCE P61-P67.agc:177
//		TC	NEWMODEX		# MODE CHANGE IF CAME FROM P61.
// PORT: Fixed ROM slots 24780.
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
// PORT: SOURCE P61-P67.agc:178
//		MM	62			# MODE CHANGE AUTOMATIC VIA V 37.
// PORT: Fixed ROM slots 24781.
    24781, 124
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24782–24785.
function agcAotUnit1431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24783 {
        if slot <= 24782 {
// PORT: SOURCE P61-P67.agc:179
//		CA	ONE
// PORT: Fixed ROM slots 24782.
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
// PORT: SOURCE P61-P67.agc:180
//		TS	DNLSTCOD
// PORT: Fixed ROM slots 24783.
            if slot <> 24783 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24784 {
// PORT: SOURCE P61-P67.agc:181
//
// PORT: SOURCE P61-P67.agc:182
//P62		TC	S61.1			# CHECK STATE VECTOR AND IMU ORIENTATION.
// PORT: Fixed ROM slots 24784.
            if slot <> 24784 or instruction <> 1380 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1380, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:183
//
// PORT: SOURCE P61-P67.agc:184
//		TC	INTPRET
// PORT: Fixed ROM slots 24785.
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
// PORT: SOURCE P61-P67.agc:185
//		SSP	RTB
// PORT: Fixed ROM slots 24786.
    24786, 40114,
// PORT: SOURCE P61-P67.agc:186
//			POSEXIT
// PORT: Fixed ROM slots 24787.
    24787, 3498,
// PORT: SOURCE P61-P67.agc:187
//			P62.3			# CALCULATE DESIRED .05G GIMBAL ANGLES.
// PORT: Fixed ROM slots 24788.
    24788, 45570,
// PORT: SOURCE P61-P67.agc:188
//						# WITHOUT DISPLAY.
// PORT: SOURCE P61-P67.agc:189
//			CM/DAPIC		# START CM/POSE AND BODY RATE CALC
// PORT: Fixed ROM slots 24789.
    24789, 34676
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24790–24794.
function agcAotUnit1432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24791 {
        if slot <= 24790 {
// PORT: SOURCE P61-P67.agc:190
//
// PORT: SOURCE P61-P67.agc:191
//						# DOES 2PHSCHNG, OCT 40116, OCT 05024, OCT 13000.
// PORT: SOURCE P61-P67.agc:192
//						# CM/DAPIC SETS EBANK = EBAOG
// PORT: SOURCE P61-P67.agc:193
//						# AND RETURNS IN BASIC TO P62.2.
// PORT: SOURCE P61-P67.agc:194
//P62.2		EXTEND
// PORT: Fixed ROM slots 24790.
            if slot <> 24790 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:195
//		DCA	POSECADR		# CONTINUE WITH CM/POSE AFTER AV G.
// PORT: Fixed ROM slots 24791.
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
// PORT: SOURCE P61-P67.agc:196
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 24792.
            if slot <> 24792 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24793 {
// PORT: SOURCE P61-P67.agc:197
//
// PORT: SOURCE P61-P67.agc:198
//		CAF	OCT41			# REQUEST SEPARATION
// PORT: Fixed ROM slots 24793.
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
// PORT: SOURCE P61-P67.agc:199
//		TC	BANKCALL
// PORT: Fixed ROM slots 24794.
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
// PORT: SOURCE P61-P67.agc:200
//		CADR	GOPERF1R
// PORT: Fixed ROM slots 24795.
    24795, 17578
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24796–24800.
function agcAotUnit1433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24797 {
        if slot <= 24796 {
// PORT: SOURCE P61-P67.agc:201
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 24796.
            if slot <> 24796 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:202
//		TC	+3			# PROCEED
// PORT: Fixed ROM slots 24797.
            if slot <> 24797 or instruction <> 1248 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1248, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24798 {
// PORT: SOURCE P61-P67.agc:203
//# Page 793
// PORT: SOURCE P61-P67.agc:204
//						# NOTE:  NODOFLAG WILL BE SET IN CM/DAPON. ***
// PORT: SOURCE P61-P67.agc:205
//		TC	-5			# ENTER
// PORT: Fixed ROM slots 24798.
            if slot <> 24798 or instruction <> 1241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1241, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24799 {
// PORT: SOURCE P61-P67.agc:206
//		TC	P61.3			# FOR PHASCHNG AND ENDOFJOB
// PORT: Fixed ROM slots 24799.
                if slot <> 24799 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:207
//
// PORT: SOURCE P61-P67.agc:208
//	+3	TC	POSTJUMP
// PORT: Fixed ROM slots 24800.
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
// PORT: SOURCE P61-P67.agc:209
//		CADR	CM/DAPON		# DISABLE RCS DAP, ENABLE ENTRY DAP AND
// PORT: Fixed ROM slots 24801.
    24801, 34580
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24802–24803.
function agcAotUnit1434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24802 {
// PORT: SOURCE P61-P67.agc:210
//						# DO ATTITUDE HOLD.
// PORT: SOURCE P61-P67.agc:211
//
// PORT: SOURCE P61-P67.agc:212
//						# WILL IDLE UNTIL CM/POSE DOES ONE UPDATE.
// PORT: SOURCE P61-P67.agc:213
//						# CM/DAPON DOES NO PHASCHNG.
// PORT: SOURCE P61-P67.agc:214
//
// PORT: SOURCE P61-P67.agc:215
//P62.1		CA	V06N61			# LAT(SPL)	LNG(SPL)	HEADSUP
// PORT: Fixed ROM slots 24802.
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
// PORT: SOURCE P61-P67.agc:216
//						# XXX.XX DEG	XXX.XX DEG	0000X.
// PORT: SOURCE P61-P67.agc:217
//
// PORT: SOURCE P61-P67.agc:218
//						# TERMINATE ATTITUDE HOLD.  SET UP COMMANDS:
// PORT: SOURCE P61-P67.agc:219
//						# ROLLC, ALFACOM, BETACOM.  BEGIN MANEUVER TO
// PORT: SOURCE P61-P67.agc:220
//						# ENTRY ATTITUDE.
// PORT: SOURCE P61-P67.agc:221
//
// PORT: SOURCE P61-P67.agc:222
//		TC	BANKCALL
// PORT: Fixed ROM slots 24803.
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
// PORT: SOURCE P61-P67.agc:223
//		CADR	GOFLASH
// PORT: Fixed ROM slots 24804.
    24804, 17312
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24805–24808.
function agcAotUnit1435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24806 {
        if slot <= 24805 {
// PORT: SOURCE P61-P67.agc:224
//		TC	-3
// PORT: Fixed ROM slots 24805.
            if slot <> 24805 or instruction <> 1250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1250, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:225
//		TC	+2
// PORT: Fixed ROM slots 24806.
            if slot <> 24806 or instruction <> 1256 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1256, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24807 {
// PORT: SOURCE P61-P67.agc:226
//		TC	-5
// PORT: Fixed ROM slots 24807.
            if slot <> 24807 or instruction <> 1250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1250, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:227
//
// PORT: SOURCE P61-P67.agc:228
//		TC	PHASCHNG
// PORT: Fixed ROM slots 24808.
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
// PORT: SOURCE P61-P67.agc:229
//		OCT	04024			# USE ENTRYVN FOR DISPLAY BELOW.
// PORT: Fixed ROM slots 24809.
    24809, 4136
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24810–24821.
function agcAotUnit1436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24815 {
        if slot <= 24812 {
            if slot <= 24810 {
// PORT: SOURCE P61-P67.agc:230
//						# EBANK WAS SET IN CM/DAPON TO EBAOG
// PORT: SOURCE P61-P67.agc:231
//
// PORT: SOURCE P61-P67.agc:232
//		CCS	HEADSUP			# C(HEADSUP) = +/- 1
// PORT: Fixed ROM slots 24810.
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
// PORT: SOURCE P61-P67.agc:233
//		CA	BIT14			# IF HEADSUP POS, ROLLC=180 DEG (LIFT DWN)
// PORT: Fixed ROM slots 24811.
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
// PORT: SOURCE P61-P67.agc:234
//		NOOP				# IF HEADSUP NEG, ROLLC=0 DEG (LIFT UP)
// PORT: Fixed ROM slots 24812.
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
// PORT: SOURCE P61-P67.agc:235
//		TS	ROLLC
// PORT: Fixed ROM slots 24813.
                if slot <> 24813 or instruction <> 23501 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23501, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24814 {
// PORT: SOURCE P61-P67.agc:236
//		CA	ALFAPAD			# NOMINAL ALFATRIM PAD LOADED, NEG. NO.
// PORT: Fixed ROM slots 24814.
                    if slot <> 24814 or instruction <> 13065 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 777).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:237
//		ZL
// PORT: Fixed ROM slots 24815.
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
// PORT: SOURCE P61-P67.agc:238
//		DXCH	ALFACOM			# SET ALFACOM = ALFA TRIM, BETACOM=0
// PORT: Fixed ROM slots 24816.
                if slot <> 24816 or instruction <> 22404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 900, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24817 {
// PORT: SOURCE P61-P67.agc:239
//
// PORT: SOURCE P61-P67.agc:240
//		CA	ONE			# PERMITS EXDAP2 TO CHANGE FLAG TO +0
// PORT: Fixed ROM slots 24817.
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
// PORT: SOURCE P61-P67.agc:241
//		TS	P63FLAG			# AS INDICATOR.  STARTS UP P63.
// PORT: Fixed ROM slots 24818.
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
// PORT: SOURCE P61-P67.agc:242
//
// PORT: SOURCE P61-P67.agc:243
//		CA	V06N22			# SET UP DISPLAY FOR CDU DESIRED VALUES
// PORT: Fixed ROM slots 24819.
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
// PORT: SOURCE P61-P67.agc:244
//		TS	ENTRYVN			# FROM ENTRY ATTITUDE CALC, THAT IS
// PORT: Fixed ROM slots 24820.
                    if slot <> 24820 or instruction <> 23219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23219, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:245
//						# ALREADY GOING.
// PORT: SOURCE P61-P67.agc:246
//		TC	UPFLAG			# TURN ON ENTRY DISPLAY
// PORT: Fixed ROM slots 24821.
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
// PORT: SOURCE P61-P67.agc:247
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// PORT: Fixed ROM slots 24822.
    24822, 184
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24823–24829.
function agcAotUnit1437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24825 {
        if slot <= 24823 {
// PORT: SOURCE P61-P67.agc:248
//SKIP
// PORT: SOURCE P61-P67.agc:249
//# Page 794
// PORT: SOURCE P61-P67.agc:250
//		CS	CMDAPMOD		# GO DIRECTLY TO P63 IF BODY ATTITUDE
// PORT: Fixed ROM slots 24823.
            if slot <> 24823 or instruction <> 17344 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 960).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24824 {
// PORT: SOURCE P61-P67.agc:251
//		MASK	ONE			# IS SUCH THAT THE DELAY TASK: WAKEP62
// PORT: Fixed ROM slots 24824.
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
// PORT: SOURCE P61-P67.agc:252
//		EXTEND				# WILL BE OMITTED.
// PORT: Fixed ROM slots 24825.
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
// PORT: SOURCE P61-P67.agc:253
//		BZF	P63.1			# DISABLE GRP 4, GO TO ENDOFJOB.
// PORT: Fixed ROM slots 24826.
                if slot <> 24826 or instruction <> 5393 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:254
//						# (I.E., CONTINUE IF CMDAPMOD = -1, OR +0)
// PORT: SOURCE P61-P67.agc:255
//		TC	P63
// PORT: Fixed ROM slots 24827.
                if slot <> 24827 or instruction <> 1285 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1285, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24828 {
// PORT: SOURCE P61-P67.agc:256
//
// PORT: SOURCE P61-P67.agc:257
//						# PUT JOB TO SLEEP UNTIL VEHICLE MANEUVER HAS
// PORT: SOURCE P61-P67.agc:258
//						# REDUCED ALFA TO +/-45 DEG. CONSIDER REMAINING
// PORT: SOURCE P61-P67.agc:259
//						# 65 DEG (25 DEG IF ALFA NEG) TO ALFA TRIM TO
// PORT: SOURCE P61-P67.agc:260
//						# OCCUR AT 3 DEG/SEC, AND TERMINATE P62 AT THAT
// PORT: SOURCE P61-P67.agc:261
//						# TIME.
// PORT: SOURCE P61-P67.agc:262
//
// PORT: SOURCE P61-P67.agc:263
//						# TASK WAKEP62 IS CALLED FROM ENTRY DAP.
// PORT: SOURCE P61-P67.agc:264
//WAKEP62		CA	PRIO13
// PORT: Fixed ROM slots 24828.
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
// PORT: SOURCE P61-P67.agc:265
//		TC	NOVAC
// PORT: Fixed ROM slots 24829.
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
// PORT: SOURCE P61-P67.agc:266
//		EBANK=	AOG
// PORT: SOURCE P61-P67.agc:267
//		2CADR	P63
// PORT: Fixed ROM slots 24830 24831.
    24830, 2570, 24831, 45164
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24832–24832.
function agcAotUnit1438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:268
//
// PORT: SOURCE P61-P67.agc:269
//		TC	TASKOVER
// PORT: Fixed ROM slots 24832.
    if slot <> 24832 or instruction <> 2772 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2772, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1438] to agcAotUnit1438@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:270
//
// PORT: SOURCE P61-P67.agc:271
//						# EACH 2 SEC, CALCULATE GIMBAL ANGLES FOR ENTRY CON-
// PORT: SOURCE P61-P67.agc:272
//						# DITIONS THAT WILL HOLD IF REORIENTATION WERE MADE
// PORT: SOURCE P61-P67.agc:273
//						# AT PRESENT RN, VN.  COME HERE FROM CM/POSE AND ALSO
// PORT: SOURCE P61-P67.agc:274
//						# IN KEPLER PHASE OF ENTRY.
// PORT: SOURCE P61-P67.agc:275
//
// PORT: SOURCE P61-P67.agc:276
//P62.3		SSP	GOTO			# SET RETURN ADDRESS SO THAT ROUTINE
// PORT: Fixed ROM slots 24833.
    24833, 43186,
// PORT: SOURCE P61-P67.agc:277
//			QPRET			# GOES DIRECTLY TO ENTRY GUIDANCE EXIT
// PORT: Fixed ROM slots 24834.
    24834, 86,
// PORT: SOURCE P61-P67.agc:278
//			ENDEXIT			# THAT DOES ENTRY DISPLAY, GRP 5.
// PORT: Fixed ROM slots 24835.
    24835, 44796,
// PORT: SOURCE P61-P67.agc:279
//			S62.3			# PUT DESIRED CDU VALUES IN CPHI'S FOR
// PORT: Fixed ROM slots 24836.
    24836, 16892
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24837–24837.
function agcAotUnit1439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:280
//						# N22 DISPLAY.
// PORT: SOURCE P61-P67.agc:281
//
// PORT: SOURCE P61-P67.agc:282
//# Page 795
// PORT: SOURCE P61-P67.agc:283
//#	P63
// PORT: SOURCE P61-P67.agc:284
//# PROGRAM:	P63
// PORT: SOURCE P61-P67.agc:285
//# MOD NO:	0	MAR. 13, 1967
// PORT: SOURCE P61-P67.agc:286
//# MOD BY:	R. HIRSCHKOP
// PORT: SOURCE P61-P67.agc:287
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 22 JUN 67		RESTARTS
// PORT: SOURCE P61-P67.agc:288
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 14 JUL 67		REVISED RESTARTS
// PORT: SOURCE P61-P67.agc:289
//# FUNCTION:	1) TO INITIALIZE THE ENTRY EQUATIONS.
// PORT: SOURCE P61-P67.agc:290
//#		2) TO CONTINUE TO HOLD THE CM TO THE CORRECT ATTITUDE WITH RESPECT TO THE ATMOSPHERE FOR
// PORT: SOURCE P61-P67.agc:291
//#		   THE ONSET OF ENTRY DECELERATION.  ROLL ANGLE IS LIFT UP/DOWN AS SPECIFIED BY HEADSUP.
// PORT: SOURCE P61-P67.agc:292
//#		3) TO SENSE .05G.
// PORT: SOURCE P61-P67.agc:293
//# CALLING SEQUENCE:  DIRECTLY FROM P62
// PORT: SOURCE P61-P67.agc:294
//# EXIT:		TO ENDOFJOB
// PORT: SOURCE P61-P67.agc:295
//# SUBROUTINE CALLS:  NEWMODEX, GODSPR
// PORT: SOURCE P61-P67.agc:296
//
// PORT: SOURCE P61-P67.agc:297
//		COUNT*	$$/P63
// PORT: SOURCE P61-P67.agc:298
//
// PORT: SOURCE P61-P67.agc:299
//P63		TC	NEWMODEX
// PORT: Fixed ROM slots 24837.
    if slot <> 24837 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1439] to agcAotUnit1439@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:300
//		MM	63
// PORT: Fixed ROM slots 24838.
    24838, 126
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24839–24845.
function agcAotUnit1440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24841 {
        if slot <= 24839 {
// PORT: SOURCE P61-P67.agc:301
//
// PORT: SOURCE P61-P67.agc:302
//						# ARRIVE WITH EBANK = AOG.
// PORT: SOURCE P61-P67.agc:303
//
// PORT: SOURCE P61-P67.agc:304
//		CA	ENTCADR			# CONTINUE AT STARTENT AFTER CM/POSE.
// PORT: Fixed ROM slots 24839.
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
// PORT: SOURCE P61-P67.agc:305
//
// PORT: SOURCE P61-P67.agc:306
//						# AT END OF STATEMENT, CHANGE ADDRESS IN GOTOADDR
// PORT: SOURCE P61-P67.agc:307
//						# TO CONTINUE AT SCALEPOP THEREAFTER.
// PORT: SOURCE P61-P67.agc:308
//
// PORT: SOURCE P61-P67.agc:309
//		TS	POSEXIT
// PORT: Fixed ROM slots 24840.
                if slot <> 24840 or instruction <> 23508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23508, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:310
//
// PORT: SOURCE P61-P67.agc:311
//		CA	V06N64			# G		VI		R TO SPLSH
// PORT: Fixed ROM slots 24841.
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
// PORT: SOURCE P61-P67.agc:312
//						# XXX.XX G	XXXX. FPS	XXXX.X NM
// PORT: SOURCE P61-P67.agc:313
//		TS	ENTRYVN			# FOR DISPLAY CALL IN OVERNOUT
// PORT: Fixed ROM slots 24842.
                if slot <> 24842 or instruction <> 23219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23219, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:314
//
// PORT: SOURCE P61-P67.agc:315
//		CS	ONE			# IN CASE FLAG IS LEFT AT +1 BY DAP.  THE
// PORT: Fixed ROM slots 24843.
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
// PORT: SOURCE P61-P67.agc:316
//		TS	P63FLAG			# -1 ASSURES THAT EXO-ATM DAP WILL NOT
// PORT: Fixed ROM slots 24844.
                if slot <> 24844 or instruction <> 23511 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:317
//						# CALL P63 OUT OF SEQUENCE IN P66.
// PORT: SOURCE P61-P67.agc:318
//
// PORT: SOURCE P61-P67.agc:319
//		TC	PHASCHNG		# THIS IS REQUIRED TO PRESERVE CLEANDSP
// PORT: Fixed ROM slots 24845.
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
// PORT: SOURCE P61-P67.agc:320
//		OCT	00004			# RETURN IN EVENT OF AN EXTENDED VERB
// PORT: Fixed ROM slots 24846.
    24846, 8
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24847–24847.
function agcAotUnit1441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:321
//
// PORT: SOURCE P61-P67.agc:322
//		TC	BANKCALL		# FLUSH 'N22' DISPLAY, IF ON, (OMIT
// PORT: Fixed ROM slots 24847.
    if slot <> 24847 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1441] to agcAotUnit1441@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:323
//		CADR	CLEANDSP		# DISPLAY DURING 'STARTENT' PASS.)
// PORT: Fixed ROM slots 24848.
    24848, 17286
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24849–24849.
function agcAotUnit1442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:324
//
// PORT: SOURCE P61-P67.agc:325
//P63.1		TC	PHASCHNG
// PORT: Fixed ROM slots 24849.
    if slot <> 24849 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1442] to agcAotUnit1442@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:326
//		OCT	00004			# DISABLE.  DISPLAY RESTARTED VIA ENTRY.
// PORT: Fixed ROM slots 24850.
    24850, 8
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24851–24851.
function agcAotUnit1443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:327
//
// PORT: SOURCE P61-P67.agc:328
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 24851.
    if slot <> 24851 or instruction <> 2703 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2703, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1443] to agcAotUnit1443@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:329
//
// PORT: SOURCE P61-P67.agc:330
//V06N60		VN	0660
// PORT: Fixed ROM slots 24852.
    24852, 1656,
// PORT: SOURCE P61-P67.agc:331
//V06N61		VN	0661
// PORT: Fixed ROM slots 24853.
    24853, 1658,
// PORT: SOURCE P61-P67.agc:332
//V06N63		VN	0663
// PORT: Fixed ROM slots 24854.
    24854, 1662,
// PORT: SOURCE P61-P67.agc:333
//# Page 796
// PORT: SOURCE P61-P67.agc:334
//V06N64		VN	0664
// PORT: Fixed ROM slots 24855.
    24855, 1664,
// PORT: SOURCE P61-P67.agc:335
//ENTCADR		CADR	STARTENT
// PORT: Fixed ROM slots 24856.
    24856, 43008,
// PORT: SOURCE P61-P67.agc:336
//
// PORT: SOURCE P61-P67.agc:337
//		EBANK=	RTINIT			# TO CARRY OVER INTO ENTRY STEERING.
// PORT: SOURCE P61-P67.agc:338
//POSECADR	2CADR	CM/POSE
// PORT: Fixed ROM slots 24857 24858.
    24857, 3696, 24858, 63598
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24859–24859.
function agcAotUnit1444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:339
//
// PORT: SOURCE P61-P67.agc:340
//# Page 797
// PORT: SOURCE P61-P67.agc:341
//# PROGRAM:	P64
// PORT: SOURCE P61-P67.agc:342
//# MOD NO:	1	SEPT. 19, 1967
// PORT: SOURCE P61-P67.agc:343
//# MOD BY:	R. HIRSCHKOP
// PORT: SOURCE P61-P67.agc:344
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 8 MAY 68		REVISED COMMENTS FOR COLOSSUS
// PORT: SOURCE P61-P67.agc:345
//# FUNCTION:	1.  TO START ENTRY GUIDANCE AT .05G SELECTING ROLL ATTITUDE, CONSTANT DRAG LEVEL, AND
// PORT: SOURCE P61-P67.agc:346
//#		    DRAG THRESHOLD, KA, WHICH ARE KEYED TO THE .05G POINT.
// PORT: SOURCE P61-P67.agc:347
//#		2.  SELECT FINAL PHASE P67 IF V < 27000 FPS WHEN .2G OCCURS.
// PORT: SOURCE P61-P67.agc:348
//#		3.  ITERATE FOR UP-CONTROL SOLUTION P65 IF V > 27000 FPS AND IF ALTITUDE RATE AND DRAG
// PORT: SOURCE P61-P67.agc:349
//#		    LEVEL CONDITIONS ARE SATISFIED.  ENTER P65 WHEN CONSTANT DRAG CONTROLLER HAS BROUGHT RANGE
// PORT: SOURCE P61-P67.agc:350
//#		    AS PREDICTED TO WITHIN 25 NM OF DESIRED RANGE.
// PORT: SOURCE P61-P67.agc:351
//#		4.  SELECT FINAL PHASE  P67  IF NO UP-CONTROL SOLUTION EXISTS WITH VL > 18000 FPS.
// PORT: SOURCE P61-P67.agc:352
//# CALLING SEQUENCE:  BY RTB FROM REENTRY CONTROL
// PORT: SOURCE P61-P67.agc:353
//# EXIT:		BACK TO REENTRY CONTROL.
// PORT: SOURCE P61-P67.agc:354
//# SUBROUTINE CALLS:  NEWMODEX
// PORT: SOURCE P61-P67.agc:355
//
// PORT: SOURCE P61-P67.agc:356
//		BANK	25
// PORT: SOURCE P61-P67.agc:357
//		SETLOC	P60S1
// PORT: SOURCE P61-P67.agc:358
//		BANK
// PORT: SOURCE P61-P67.agc:359
//
// PORT: SOURCE P61-P67.agc:360
//# THIS DISPLAY IS CALLED EACH PASS THROUGH STEERING.  RESTART PROTECTION IS VIA STEERING.
// PORT: SOURCE P61-P67.agc:361
//
// PORT: SOURCE P61-P67.agc:362
//		COUNT*	$$/P64
// PORT: SOURCE P61-P67.agc:363
//
// PORT: SOURCE P61-P67.agc:364
//P64		TC	NEWMODEX		# ENTER VIA RTB WHEN .05G IS EXCEEDED.
// PORT: Fixed ROM slots 24859.
    if slot <> 24859 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1444] to agcAotUnit1444@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:365
//		MM	64
// PORT: Fixed ROM slots 24860.
    24860, 128
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24861–24863.
function agcAotUnit1445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24861 {
// PORT: SOURCE P61-P67.agc:366
//		CA	V06N74			# ROLLC		VI		D
// PORT: Fixed ROM slots 24861.
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
// PORT: SOURCE P61-P67.agc:367
//						# XXX.XX DEG	XXXXX. FPS	XXX.XX G
// PORT: SOURCE P61-P67.agc:368
//		TS	ENTRYVN			# DISPLAY VIA OVERNOUT.
// PORT: Fixed ROM slots 24862.
            if slot <> 24862 or instruction <> 23219 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23219, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:369
//
// PORT: SOURCE P61-P67.agc:370
//		TC	DANZIG			# ... AND CONTINUE IN INITROLL ...
// PORT: Fixed ROM slots 24863.
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
// PORT: SOURCE P61-P67.agc:371
//
// PORT: SOURCE P61-P67.agc:372
//V06N74		VN	0674
// PORT: Fixed ROM slots 24864.
    24864, 1684
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24865–24865.
function agcAotUnit1446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:373
//
// PORT: SOURCE P61-P67.agc:374
//# Page 798
// PORT: SOURCE P61-P67.agc:375
//# PROGRAM:	P65
// PORT: SOURCE P61-P67.agc:376
//# MOD NO:  0	MOD BY:  RR BAIRNSFATHER	DATE:  17 JAN 68	COLOSSUS GSOP ADDITION.
// PORT: SOURCE P61-P67.agc:377
//# FUNCTION:	TO CONTINUE ENTRY GUIDANCE, USING THE UP-CONTROL PHASE TO STEER TO A CONTROLLED EXIT
// PORT: SOURCE P61-P67.agc:378
//#		CONDITION.  THIS PHASE TERMINATES  A) IF D < Q7 FPSS, GOTO TO P66.
// PORT: SOURCE P61-P67.agc:379
//#						   B) IF RDOT NEG, AND IF V < VL +500 FPS, GO TO P67.
// PORT: SOURCE P61-P67.agc:380
//# CALLING SEQUENCE:  BY RTB FROM REENTRY CONTROL
// PORT: SOURCE P61-P67.agc:381
//# EXIT:		BACK TO REENTRY CONTROL, OR TO ENDOFJOB.
// PORT: SOURCE P61-P67.agc:382
//# SUBROUTINE CALLS:  NEWMODEX
// PORT: SOURCE P61-P67.agc:383
//
// PORT: SOURCE P61-P67.agc:384
//		COUNT*	$$/P65
// PORT: SOURCE P61-P67.agc:385
//
// PORT: SOURCE P61-P67.agc:386
//P65		TC	NEWMODEX		# ENTER VIA RTB WHEN RANGE < 25 N M OF
// PORT: Fixed ROM slots 24865.
    if slot <> 24865 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1446] to agcAotUnit1446@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:387
//		MM	65			# TARGET.
// PORT: Fixed ROM slots 24866.
    24866, 130
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24867–24868.
function agcAotUnit1447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24867 {
// PORT: SOURCE P61-P67.agc:388
//
// PORT: SOURCE P61-P67.agc:389
//		CA	PRIO13
// PORT: Fixed ROM slots 24867.
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
// PORT: SOURCE P61-P67.agc:390
//		TC	NOVAC
// PORT: Fixed ROM slots 24868.
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
// PORT: SOURCE P61-P67.agc:391
//		EBANK=	ENTRYVN
// PORT: SOURCE P61-P67.agc:392
//		2CADR	P65.1
// PORT: Fixed ROM slots 24869 24870.
    24869, 2654, 24870, 45156
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24871–24871.
function agcAotUnit1448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:393
//
// PORT: SOURCE P61-P67.agc:394
//		TC	2PHSCHNG		# 2 PHASE CHG REQUIRED TO PREVENT RE-
// PORT: Fixed ROM slots 24871.
    if slot <> 24871 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1448] to agcAotUnit1448@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:395
//		OCT	00554			# STARTING FLASHING DISPLAY TWICE.
// PORT: Fixed ROM slots 24872.
    24872, 728,
// PORT: SOURCE P61-P67.agc:396
//		OCT	10035			# 4.55 SPOT AND SERVICER, HERE.
// PORT: Fixed ROM slots 24873.
    24873, 8250
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24874–24874.
function agcAotUnit1449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:397
//		TC	INTPRET
// PORT: Fixed ROM slots 24874.
    if slot <> 24874 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1449] to agcAotUnit1449@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:398
//		SSP	RTB
// PORT: Fixed ROM slots 24875.
    24875, 40114,
// PORT: SOURCE P61-P67.agc:399
//			GOTOADDR		# CHANGE ENTRY MODE TO UPCONTRL.
// PORT: Fixed ROM slots 24876.
    24876, 3916,
// PORT: SOURCE P61-P67.agc:400
//			UPCONTRL
// PORT: Fixed ROM slots 24877.
    24877, 44090,
// PORT: SOURCE P61-P67.agc:401
//			REFAZE10		# GO HERE TO REESTABLISH ENTRY SEQUENCER.
// PORT: Fixed ROM slots 24878.
    24878, 43168
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24879–24879.
function agcAotUnit1450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:402
//						# AND CONTINUE AT UPCONTRL...
// PORT: SOURCE P61-P67.agc:403
//
// PORT: SOURCE P61-P67.agc:404
//P65.1		TC	DOWNFLAG
// PORT: Fixed ROM slots 24879.
    if slot <> 24879 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1450] to agcAotUnit1450@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:405
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// PORT: Fixed ROM slots 24880.
    24880, 184
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24881–24882.
function agcAotUnit1451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24881 {
// PORT: SOURCE P61-P67.agc:406
//
// PORT: SOURCE P61-P67.agc:407
//		CA	V16N69			# ROLLC		DL (Q7)		VL
// PORT: Fixed ROM slots 24881.
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
// PORT: SOURCE P61-P67.agc:408
//		TC	BANKCALL		# XXX.XX DEG	XXX.XX G	XXXXX. FPS
// PORT: Fixed ROM slots 24882.
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
// PORT: SOURCE P61-P67.agc:409
//		CADR	GOFLASHR
// PORT: Fixed ROM slots 24883.
    24883, 17502
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24884–24888.
function agcAotUnit1452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24885 {
        if slot <= 24884 {
// PORT: SOURCE P61-P67.agc:410
//		TC	-3			# NODOFLAG IS SET ...
// PORT: Fixed ROM slots 24884.
            if slot <> 24884 or instruction <> 1329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1329, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:411
//		TC	+3
// PORT: Fixed ROM slots 24885.
            if slot <> 24885 or instruction <> 1336 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1336, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24886 {
// PORT: SOURCE P61-P67.agc:412
//		TC	-5
// PORT: Fixed ROM slots 24886.
            if slot <> 24886 or instruction <> 1329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1329, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24887 {
// PORT: SOURCE P61-P67.agc:413
//		TC	P61.3			# EST. GRP 4 FOR DISPLAY AND DO ENDOFJOB
// PORT: Fixed ROM slots 24887.
                if slot <> 24887 or instruction <> 1178 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1178, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P61-P67.agc:414
//						# IF PROCEED, CONTINUE
// PORT: SOURCE P61-P67.agc:415
//		TC	UPFLAG
// PORT: Fixed ROM slots 24888.
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
// PORT: SOURCE P61-P67.agc:416
//		ADRES	ENTRYDSP		# ENTRYDSP = 92D BIT 13 FLAG 6
// PORT: Fixed ROM slots 24889.
    24889, 184
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24890–24890.
function agcAotUnit1453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:417
//
// PORT: SOURCE P61-P67.agc:418
//		TC	P63.1			# DISABLE GRP 4, START UP ENTRY DISPLAY
// PORT: Fixed ROM slots 24890.
    if slot <> 24890 or instruction <> 1297 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1297, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1453] to agcAotUnit1453@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:419
//						# N06V68 VIA OVERNOUT, AS USED IN P64
// PORT: SOURCE P61-P67.agc:420
//V16N69		VN	1669
// PORT: Fixed ROM slots 24891.
    24891, 4234
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24892–24892.
function agcAotUnit1454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:421
//
// PORT: SOURCE P61-P67.agc:422
//# Page 799
// PORT: SOURCE P61-P67.agc:423
//# PROGRAM:	P66
// PORT: SOURCE P61-P67.agc:424
//# MOD NO: 0	MOD BY: RR BAIRNSFATHER		DATE: 17 JAN 68		COLOSSUS GSOP ADDITIONS
// PORT: SOURCE P61-P67.agc:425
//# FUNCTION:	KEEP CM ATTITUDE IN TRIM TO THE RELATIVE VELOCITY VECTOR.  ENTRY GUIDANCE STOPS GENERATING
// PORT: SOURCE P61-P67.agc:426
//#		ROLL COMMANDS UNTIL DRAG BUILDS UP TO Q7+0.5 FPSS.
// PORT: SOURCE P61-P67.agc:427
//# CALLING SEQUENCE:  VIA RTB FROM REENTRY CONTROL.
// PORT: SOURCE P61-P67.agc:428
//# EXIT:		BACK TO REENTRY CONTROL.
// PORT: SOURCE P61-P67.agc:429
//# SUBROUTINE CALLS:  NEWMODEX
// PORT: SOURCE P61-P67.agc:430
//
// PORT: SOURCE P61-P67.agc:431
//		COUNT*	$$/P66
// PORT: SOURCE P61-P67.agc:432
//
// PORT: SOURCE P61-P67.agc:433
//P66		TC	NEWMODEX		# ENTER VIA RTB WHEN D < Q7 FPSS
// PORT: Fixed ROM slots 24892.
    if slot <> 24892 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1454] to agcAotUnit1454@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:434
//		MM	66
// PORT: Fixed ROM slots 24893.
    24893, 132
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24894–24896.
function agcAotUnit1455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24894 {
// PORT: SOURCE P61-P67.agc:435
//
// PORT: SOURCE P61-P67.agc:436
//		CA	V06N22			# OGA		IGA		MGA
// PORT: Fixed ROM slots 24894.
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
// PORT: SOURCE P61-P67.agc:437
//						# XXX.XX DEG	XXX.XX DEG	XXX.XX DEG
// PORT: SOURCE P61-P67.agc:438
//		TC	P66END			# IN CASE CAME FROM P65, GO TO DISABLE GRP 4,
// PORT: Fixed ROM slots 24895.
            if slot <> 24895 or instruction <> 1347 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1347, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:439
//						# AND SET ENTRYDSP TO DO DISPLAY VIA
// PORT: SOURCE P61-P67.agc:440
//						# OVERNOUT.
// PORT: SOURCE P61-P67.agc:441
//
// PORT: SOURCE P61-P67.agc:442
//						# ... AND CONTINUE AT KEP2
// PORT: SOURCE P61-P67.agc:443
//
// PORT: SOURCE P61-P67.agc:444
//# Page 800
// PORT: SOURCE P61-P67.agc:445
//# PROGRAM:	P67
// PORT: SOURCE P61-P67.agc:446
//# MOD NO:	0	MAR. 16, 1967
// PORT: SOURCE P61-P67.agc:447
//# MOD BY:	R. HIRSCHKOP
// PORT: SOURCE P61-P67.agc:448
//# FUNCTION:	TO TERMINATE STEERING WHEN THE CM VELOCITY WRT EARTH = 1000 FT/SEC
// PORT: SOURCE P61-P67.agc:449
//# CALLING SEQUENCE:
// PORT: SOURCE P61-P67.agc:450
//# EXIT:		TO POOH
// PORT: SOURCE P61-P67.agc:451
//# SUBROUTINE CALLS:  GOFLASH
// PORT: SOURCE P61-P67.agc:452
//
// PORT: SOURCE P61-P67.agc:453
//# THIS DISPLAY IS CALLED EACH PASS THROUGH STEERING.  RESTART PROTECTION IS VIA STEERING.
// PORT: SOURCE P61-P67.agc:454
//
// PORT: SOURCE P61-P67.agc:455
//		COUNT*	$$/P67
// PORT: SOURCE P61-P67.agc:456
//
// PORT: SOURCE P61-P67.agc:457
//P67		TC	NEWMODEX		# ENTER VIA RTB
// PORT: Fixed ROM slots 24896.
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
// PORT: SOURCE P61-P67.agc:458
//		MM	67
// PORT: Fixed ROM slots 24897.
    24897, 134
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24898–24900.
function agcAotUnit1456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24898 {
// PORT: SOURCE P61-P67.agc:459
//		CA	V06N66			# ROLLC		XRNGERR		DNRNGERR
// PORT: Fixed ROM slots 24898.
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
// PORT: SOURCE P61-P67.agc:460
//						# XXX.XX DEG	XXXX.X NM	XXXX.X NM
// PORT: SOURCE P61-P67.agc:461
//P66END		TS	ENTRYVN			# DISPLAY VIA OVERNOUT.
// PORT: Fixed ROM slots 24899.
            if slot <> 24899 or instruction <> 23219 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23219, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:462
//
// PORT: SOURCE P61-P67.agc:463
//		TC	UPFLAG			# (IN CASE CAME FROM P65.  ENTRY DISPLAY
// PORT: Fixed ROM slots 24900.
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
// PORT: SOURCE P61-P67.agc:464
//		ADRES	ENTRYDSP		# WILL FLUSH FLASHING DISP.  IF STILL ON)
// PORT: Fixed ROM slots 24901.
    24901, 184
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24902–24902.
function agcAotUnit1457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:465
//						# BIT 13 FLAG 6
// PORT: SOURCE P61-P67.agc:466
//KILLGRP4	TC	PHASCHNG		# DISABLE GRP4, IN CASE CAME FROM HUNTEST.
// PORT: Fixed ROM slots 24902.
    if slot <> 24902 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1457] to agcAotUnit1457@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:467
//		OCT	00004			# (COME TO KILLGRP4 VIA RTB, RET TO CALLER)
// PORT: Fixed ROM slots 24903.
    24903, 8
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24904–24904.
function agcAotUnit1458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:468
//
// PORT: SOURCE P61-P67.agc:469
//		TC	DANZIG			# ... AND CONTINUE AT PREDICT3 ...
// PORT: Fixed ROM slots 24904.
    if slot <> 24904 or instruction <> 3096 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3096, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1458] to agcAotUnit1458@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:470
//
// PORT: SOURCE P61-P67.agc:471
//V06N66		VN	0666
// PORT: Fixed ROM slots 24905.
    24905, 1668
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24906–24907.
function agcAotUnit1459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24906 {
// PORT: SOURCE P61-P67.agc:472
//
// PORT: SOURCE P61-P67.agc:473
//		BANK	26
// PORT: SOURCE P61-P67.agc:474
//		SETLOC	P60S2
// PORT: SOURCE P61-P67.agc:475
//		BANK
// PORT: SOURCE P61-P67.agc:476
//
// PORT: SOURCE P61-P67.agc:477
//P67.1		CA	V16N67			# RTOGO		LAT		LONG
// PORT: Fixed ROM slots 24906.
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
// PORT: SOURCE P61-P67.agc:478
//						# XXXX.X NM	XXX.XX DEG	XXX.XX DEG
// PORT: SOURCE P61-P67.agc:479
//		TC	BANKCALL
// PORT: Fixed ROM slots 24907.
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
// PORT: SOURCE P61-P67.agc:480
//		CADR	GOFLASH
// PORT: Fixed ROM slots 24908.
    24908, 17312
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24909–24920.
function agcAotUnit1460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24914 {
        if slot <= 24911 {
            if slot <= 24909 {
// PORT: SOURCE P61-P67.agc:481
//		TC	+3			# EFFECTIVE GOTOPOOH
// PORT: Fixed ROM slots 24909.
                if slot <> 24909 or instruction <> 1360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1360, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24910 {
// PORT: SOURCE P61-P67.agc:482
//		TC	+2
// PORT: Fixed ROM slots 24910.
                    if slot <> 24910 or instruction <> 1360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1360, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:483
//		TC	P67.1			# REDO
// PORT: Fixed ROM slots 24911.
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
// PORT: SOURCE P61-P67.agc:484
//
// PORT: SOURCE P61-P67.agc:485
//		CS	THREE			# TURN OFF ENTRY DAP
// PORT: Fixed ROM slots 24912.
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
// PORT: SOURCE P61-P67.agc:486
//		INHINT
// PORT: Fixed ROM slots 24913.
                    if slot <> 24913 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:487
//		MASK	CM/FLAGS		# CM/DSTBY, GAMDIFSW
// PORT: Fixed ROM slots 24914.
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
// PORT: SOURCE P61-P67.agc:488
//		TS	CM/FLAGS
// PORT: Fixed ROM slots 24915.
                if slot <> 24915 or instruction <> 22594 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22594, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24916 {
// PORT: SOURCE P61-P67.agc:489
//		RELINT
// PORT: Fixed ROM slots 24916.
                    if slot <> 24916 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:490
//		EXTEND
// PORT: Fixed ROM slots 24917.
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
// PORT: SOURCE P61-P67.agc:491
//		DCA	SERVCAD2
// PORT: Fixed ROM slots 24918.
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
// PORT: SOURCE P61-P67.agc:492
//
// PORT: SOURCE P61-P67.agc:493
//# Page 801
// PORT: SOURCE P61-P67.agc:494
//		DXCH	AVEGEXIT
// PORT: Fixed ROM slots 24919.
                    if slot <> 24919 or instruction <> 22163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P61-P67.agc:495
//
// PORT: SOURCE P61-P67.agc:496
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 24920.
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
// PORT: SOURCE P61-P67.agc:497
//
// PORT: SOURCE P61-P67.agc:498
//# Page 802
// PORT: SOURCE P61-P67.agc:499
//P67.2		VLOAD	CLEAR			# CALC PRESENT LAT, LONG, ALT.
// PORT: Fixed ROM slots 24921.
    24921, 36090,
// PORT: SOURCE P61-P67.agc:500
//			RN
// PORT: Fixed ROM slots 24922.
    24922, 1266,
// PORT: SOURCE P61-P67.agc:501
//			ERADFLAG		# USE PAD RAD FOR ALT. (NOT SEEN ANYWAY)
// PORT: Fixed ROM slots 24923.
    24923, 868,
// PORT: SOURCE P61-P67.agc:502
//		STODL	ALPHAV
// PORT: Fixed ROM slots 24924.
    24924, 14548,
// PORT: SOURCE P61-P67.agc:503
//			PIPTIME			# USE TIME OF RN
// PORT: Fixed ROM slots 24925.
    24925, 1290,
// PORT: SOURCE P61-P67.agc:504
//		CLEAR	CALL
// PORT: Fixed ROM slots 24926.
    24926, 37912,
// PORT: SOURCE P61-P67.agc:505
//			LUNAFLAG
// PORT: Fixed ROM slots 24927.
    24927, 1894,
// PORT: SOURCE P61-P67.agc:506
//			LAT-LONG
// PORT: Fixed ROM slots 24928.
    24928, 23024,
// PORT: SOURCE P61-P67.agc:507
//P67.3		RTB				# ENTRY EXIT THAT OMITS DISPLAY.
// PORT: Fixed ROM slots 24929.
    24929, 65336,
// PORT: SOURCE P61-P67.agc:508
//			SERVNOUT
// PORT: Fixed ROM slots 24930.
    24930, 44818,
// PORT: SOURCE P61-P67.agc:509
//
// PORT: SOURCE P61-P67.agc:510
//V16N67		VN	1667
// PORT: Fixed ROM slots 24931.
    24931, 4230
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24932–24934.
function agcAotUnit1461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24932 {
// PORT: SOURCE P61-P67.agc:511
//OCT41		=	33DEC
// PORT: SOURCE P61-P67.agc:512
//SERVCAD2	=	SERVCAD1
// PORT: SOURCE P61-P67.agc:513
//
// PORT: SOURCE P61-P67.agc:514
//# Page 803
// PORT: SOURCE P61-P67.agc:515
//# SUBROUTINE NAME:	S61.1
// PORT: SOURCE P61-P67.agc:516
//# MOD NO:	0					DATE:		21 FEB 67
// PORT: SOURCE P61-P67.agc:517
//# MOD BY:	RR BAIRNSFATHER				LOG SECTION:	P61-P67
// PORT: SOURCE P61-P67.agc:518
//# MOD NO:	1	MOD BY:	RR BAIRNSFATHER		DATE:		22 JUN 67	RESTARTS.
// PORT: SOURCE P61-P67.agc:519
//# FUNCTIONAL DESCRIPTION:	CALLED BY BOTH P61 AND P62
// PORT: SOURCE P61-P67.agc:520
//#	FIRST, TEST TO SEE IF  AVERAGEG  IS ON.  IF NOT, UPDATE THE STATE VECTOR TO PRESENT TIME + TOLERANCE
// PORT: SOURCE P61-P67.agc:521
//#	AND TURN ON  AVERAGEG  AT THAT TIME, AND CONTINUE.  OTHERWISE CONTINUE:  SEE IF IMU Y AXIS IS
// PORT: SOURCE P61-P67.agc:522
//#	WITHIN 30 DEG OF VAR.  IF YES, EXIT SUBROUTINE S61.1.  IF SO, SEE IF -Y AXIS OF IMU IS WITHIN
// PORT: SOURCE P61-P67.agc:523
//#	30 DEG OF VAR.	IF YES, DISPLAY ALARM:	01427	IMU REVERSED.
// PORT: SOURCE P61-P67.agc:524
//#			IF NO, DISPLAY ALARM:	01426	IMU UNSATISFACTORY.
// PORT: SOURCE P61-P67.agc:525
//#	IN EITHER OF THESE LAST 2 CASES, WAIT 10 SEC AND THEN EXIT SUBROUTINE S61.1.
// PORT: SOURCE P61-P67.agc:526
//#
// PORT: SOURCE P61-P67.agc:527
//# REMARK:	THERE WILL BE A SHORT 10 SEC DELAY IF AN ALARM EXIT IS TAKEN.  THE DELAY FOR INTEGRATION IS
// PORT: SOURCE P61-P67.agc:528
//#		AS SHORT AS CAN BE MADE, BUT IS ARBITRARY SINCE IT DEPENDS ON THE AGE OF THE STATE VECTOR.
// PORT: SOURCE P61-P67.agc:529
//#
// PORT: SOURCE P61-P67.agc:530
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE P61-P67.agc:531
//#				S61.1
// PORT: SOURCE P61-P67.agc:532
//#
// PORT: SOURCE P61-P67.agc:533
//#			C(MPAC) UNSPECIFIED
// PORT: SOURCE P61-P67.agc:534
//#			PUSHLOC UNSPECIFIED
// PORT: SOURCE P61-P67.agc:535
//#
// PORT: SOURCE P61-P67.agc:536
//# SUBROUTINES CALLED: 	LOADTIME, CSMPREC, TPAGTREE,
// PORT: SOURCE P61-P67.agc:537
//#			WAITLIST, JOBSLEEP, JOBWAKE, PREREAD, ALARM, GODSPR, BANKCALL, DELAYJOB
// PORT: SOURCE P61-P67.agc:538
//#
// PORT: SOURCE P61-P67.agc:539
//# NORMAL EXIT MODES:	RVQ
// PORT: SOURCE P61-P67.agc:540
//#
// PORT: SOURCE P61-P67.agc:541
//# ALARMS:	01426	IMU UNSATISFACTORY
// PORT: SOURCE P61-P67.agc:542
//#		01427	IMU REVERSED
// PORT: SOURCE P61-P67.agc:543
//#
// PORT: SOURCE P61-P67.agc:544
//# OUTPUT:	POSSIBLE ALARMS
// PORT: SOURCE P61-P67.agc:545
//#		POSSIBLY TDEC1, RATT, VATT, RN, VN
// PORT: SOURCE P61-P67.agc:546
//#
// PORT: SOURCE P61-P67.agc:547
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P61-P67.agc:548
//#	AVEGFLAG		AVERAGEG ON OR OFF				LEFT BY SERVICER
// PORT: SOURCE P61-P67.agc:549
//#	PIPTIME   (-28) CS	TIME OF PIPA UPDATE				LEFT BY READACCS
// PORT: SOURCE P61-P67.agc:550
//#	RN        (-29) M	STATE VECTOR					LEFT BY AVERAGEG
// PORT: SOURCE P61-P67.agc:551
//#	VN	  (-7) M/CS	STATE VECTOR					LEFT BY AVERAGEG
// PORT: SOURCE P61-P67.agc:552
//#	REFSMMAT  (-1)		.5 REF TO SM MATRIX				LEFT BY LAST IMU ALIGNMENT
// PORT: SOURCE P61-P67.agc:553
//#
// PORT: SOURCE P61-P67.agc:554
//# DEBRIS:	QPRET
// PORT: SOURCE P61-P67.agc:555
//#		POSSIBLY PIPTIME1, RATT, VATT, TDEC1, RN1, VN1, QTEMP, X1	IF UPDATED
// PORT: SOURCE P61-P67.agc:556
//#		PUSH LIST LOCS USED BY CSMPREC
// PORT: SOURCE P61-P67.agc:557
//
// PORT: SOURCE P61-P67.agc:558
//		EBANK=	AOG		# FOR 60GENRET, S61DT
// PORT: SOURCE P61-P67.agc:559
//		BANK	26
// PORT: SOURCE P61-P67.agc:560
//		SETLOC	P60S3
// PORT: SOURCE P61-P67.agc:561
//		BANK
// PORT: SOURCE P61-P67.agc:562
//
// PORT: SOURCE P61-P67.agc:563
//		COUNT*	$$/S61.1
// PORT: SOURCE P61-P67.agc:564
//
// PORT: SOURCE P61-P67.agc:565
//S61.1		EXTEND
// PORT: Fixed ROM slots 24932.
        if slot <> 24932 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24933 {
// PORT: SOURCE P61-P67.agc:566
//		QXCH	60GENRET	# SAVE RET ADDR IN EB 6
// PORT: Fixed ROM slots 24933.
            if slot <> 24933 or instruction <> 10235 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1019, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:567
//		TC	BANKCALL
// PORT: Fixed ROM slots 24934.
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
// PORT: SOURCE P61-P67.agc:568
//		CADR	R02BOTH
// PORT: Fixed ROM slots 24935.
    24935, 16214
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24936–24936.
function agcAotUnit1462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:569
//		TC	INTPRET
// PORT: Fixed ROM slots 24936.
    if slot <> 24936 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1462] to agcAotUnit1462@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:570
//# Page 804
// PORT: SOURCE P61-P67.agc:571
//		BON	CALRB
// PORT: Fixed ROM slots 24937.
    24937, 37912,
// PORT: SOURCE P61-P67.agc:572
//			AVEGFLAG	# IS AVERAGEG ON
// PORT: Fixed ROM slots 24938.
    24938, 924,
// PORT: SOURCE P61-P67.agc:573
//			S61.1A		# YES
// PORT: Fixed ROM slots 24939.
    24939, 45832,
// PORT: SOURCE P61-P67.agc:574
//			MIDTOAV2	# GET FUTURE STATE VECTOR SOON AS CAN
// PORT: Fixed ROM slots 24940.
    24940, 24262
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24941–24941.
function agcAotUnit1463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:575
//
// PORT: SOURCE P61-P67.agc:576
//		CA	MPAC +1		# RETURN INHINTED ***
// PORT: Fixed ROM slots 24941.
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

// PORT: Physical bank 26. Shared continuation entries, slots 24942–24943.
function agcAotUnit1464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24942 {
// PORT: SOURCE P61-P67.agc:577
//		TS	S61DT		# FOR RESTART.
// PORT: Fixed ROM slots 24942.
        if slot <> 24942 or instruction <> 23548 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23548, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P61-P67.agc:578
//		TC	WAITLIST
// PORT: Fixed ROM slots 24943.
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
// PORT: SOURCE P61-P67.agc:579
//		EBANK=	DVCNTR
// PORT: SOURCE P61-P67.agc:580
//		2CADR	S61.1C
// PORT: Fixed ROM slots 24944 24945.
    24944, 2794, 24945, 45166
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24946–24946.
function agcAotUnit1465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:581
//
// PORT: SOURCE P61-P67.agc:582
//		TC	PHASCHNG
// PORT: Fixed ROM slots 24946.
    if slot <> 24946 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1465] to agcAotUnit1465@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:583
//		OCT	40434
// PORT: Fixed ROM slots 24947.
    24947, 33336
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24948–24950.
function agcAotUnit1466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24948 {
// PORT: SOURCE P61-P67.agc:584
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 24948.
        if slot <> 24948 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24949 {
// PORT: SOURCE P61-P67.agc:585
//
// PORT: SOURCE P61-P67.agc:586
//S61.1C		CA	PRIO13
// PORT: Fixed ROM slots 24949.
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
// PORT: SOURCE P61-P67.agc:587
//		TC	FINDVAC
// PORT: Fixed ROM slots 24950.
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
// PORT: SOURCE P61-P67.agc:588
//		EBANK=	AOG
// PORT: SOURCE P61-P67.agc:589
//		2CADR	S61.1A 	-1
// PORT: Fixed ROM slots 24951 24952.
    24951, 2822, 24952, 45164
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24953–24956.
function agcAotUnit1467 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24954 {
        if slot <= 24953 {
// PORT: SOURCE P61-P67.agc:590
//
// PORT: SOURCE P61-P67.agc:591
//		EXTEND
// PORT: Fixed ROM slots 24953.
            if slot <> 24953 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:592
//		DCA	SERVCAD1	# HE WHO START AVERAGEG MUST SERVICE
// PORT: Fixed ROM slots 24954.
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
// PORT: SOURCE P61-P67.agc:593
//		DXCH	AVEGEXIT	# THE EXIT.
// PORT: Fixed ROM slots 24955.
            if slot <> 24955 or instruction <> 22163 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:594
//
// PORT: SOURCE P61-P67.agc:595
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 24956.
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
// PORT: SOURCE P61-P67.agc:596
//		OCT	00454
// PORT: Fixed ROM slots 24957.
    24957, 600,
// PORT: SOURCE P61-P67.agc:597
//		OCT	00415
// PORT: Fixed ROM slots 24958.
    24958, 538
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24959–24961.
function agcAotUnit1468 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24959 {
// PORT: SOURCE P61-P67.agc:598
//
// PORT: SOURCE P61-P67.agc:599
//		CA	EBENTRY		# SET EB= 7 FOR PREREAD.
// PORT: Fixed ROM slots 24959.
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
// PORT: SOURCE P61-P67.agc:600
//		TS	EBANK
// PORT: Fixed ROM slots 24960.
            if slot <> 24960 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P61-P67.agc:601
//
// PORT: SOURCE P61-P67.agc:602
//		TC	POSTJUMP
// PORT: Fixed ROM slots 24961.
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
// PORT: SOURCE P61-P67.agc:603
//		CADR	PREREAD		# PREREAD DOES TC TASKOVER.
// PORT: Fixed ROM slots 24962.
    24962, 64386
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24963–24963.
function agcAotUnit1469 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:604
//
// PORT: SOURCE P61-P67.agc:605
//		TC	INTPRET
// PORT: Fixed ROM slots 24963.
    if slot <> 24963 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1469] to agcAotUnit1469@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:606
//S61.1A		BOVB	VLOAD
// PORT: Fixed ROM slots 24964.
    24964, 64776,
// PORT: SOURCE P61-P67.agc:607
//			TCDANZIG	# TURN OFF OVFIND, IF ON
// PORT: Fixed ROM slots 24965.
    24965, 48596,
// PORT: SOURCE P61-P67.agc:608
//			VN		# VN	(-7) M/CS
// PORT: Fixed ROM slots 24966.
    24966, 1278,
// PORT: SOURCE P61-P67.agc:609
//		VXV	MXV
// PORT: Fixed ROM slots 24967.
    24967, 53562,
// PORT: SOURCE P61-P67.agc:610
//			RN		# RN	(-29) M
// PORT: Fixed ROM slots 24968.
    24968, 1266,
// PORT: SOURCE P61-P67.agc:611
//			REFSMMAT	# .5 UNIT MATRIX
// PORT: Fixed ROM slots 24969.
    24969, 1980,
// PORT: SOURCE P61-P67.agc:612
//		UNIT	DLOAD
// PORT: Fixed ROM slots 24970.
    24970, 58716,
// PORT: SOURCE P61-P67.agc:613
//			MPAC +3		# GET COS(THETA)/2
// PORT: Fixed ROM slots 24971.
    24971, 224,
// PORT: SOURCE P61-P67.agc:614
//		BMN	DAD
// PORT: Fixed ROM slots 24972.
    24972, 36160,
// PORT: SOURCE P61-P67.agc:615
//			S61.1B		# DO TEST ON -YSM
// PORT: Fixed ROM slots 24973.
    24973, 45860,
// PORT: SOURCE P61-P67.agc:616
//			C(30)LIM	# = 1.0 -.5 COS(30)
// PORT: Fixed ROM slots 24974.
    24974, 13130,
// PORT: SOURCE P61-P67.agc:617
//		BOVB	RTB
// PORT: Fixed ROM slots 24975.
    24975, 39944,
// PORT: SOURCE P61-P67.agc:618
//			RETRN1
// PORT: Fixed ROM slots 24976.
    24976, 45890,
// PORT: SOURCE P61-P67.agc:619
//			RETRN3
// PORT: Fixed ROM slots 24977.
    24977, 45868,
// PORT: SOURCE P61-P67.agc:620
//# Page 805
// PORT: SOURCE P61-P67.agc:621
//S61.1B		DCOMP	DAD
// PORT: Fixed ROM slots 24978.
    24978, 36220,
// PORT: SOURCE P61-P67.agc:622
//			C(30)LIM	# = 1.0 - .5 COS(30)
// PORT: Fixed ROM slots 24979.
    24979, 13130,
// PORT: SOURCE P61-P67.agc:623
//		BOVB	EXIT
// PORT: Fixed ROM slots 24980.
    24980, 65032,
// PORT: SOURCE P61-P67.agc:624
//			RETRN2
// PORT: Fixed ROM slots 24981.
    24981, 45874
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24982–24982.
function agcAotUnit1470 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:625
//
// PORT: SOURCE P61-P67.agc:626
//RETRN3		TC	ALARM
// PORT: Fixed ROM slots 24982.
    if slot <> 24982 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1470] to agcAotUnit1470@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:627
//		OCT	01426		# IMU UNSATISFACTORY
// PORT: Fixed ROM slots 24983.
    24983, 1580
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24984–24985.
function agcAotUnit1471 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24984 {
// PORT: SOURCE P61-P67.agc:628
//		TC	RETRN2 +2
// PORT: Fixed ROM slots 24984.
        if slot <> 24984 or instruction <> 1435 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1435, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P61-P67.agc:629
//
// PORT: SOURCE P61-P67.agc:630
//RETRN2		TC	ALARM
// PORT: Fixed ROM slots 24985.
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
// PORT: SOURCE P61-P67.agc:631
//		OCT	01427		# IMU REVERSED
// PORT: Fixed ROM slots 24986.
    24986, 1582
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24987–24988.
function agcAotUnit1472 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24987 {
// PORT: SOURCE P61-P67.agc:632
//
// PORT: SOURCE P61-P67.agc:633
//	+2	CAF	V05N09
// PORT: Fixed ROM slots 24987.
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
// PORT: SOURCE P61-P67.agc:634
//		TC	BANKCALL
// PORT: Fixed ROM slots 24988.
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
// PORT: SOURCE P61-P67.agc:635
//		CADR	GODSPR		# DO DISPLAY
// PORT: Fixed ROM slots 24989.
    24989, 17276
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24990–24991.
function agcAotUnit1473 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24990 {
// PORT: SOURCE P61-P67.agc:636
//		CA	10SECS
// PORT: Fixed ROM slots 24990.
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
// PORT: SOURCE P61-P67.agc:637
//		TC	BANKCALL
// PORT: Fixed ROM slots 24991.
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
// PORT: SOURCE P61-P67.agc:638
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 24992.
    24992, 1972
)).

// PORT: Physical bank 26. Shared continuation entries, slots 24993–24993.
function agcAotUnit1474 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P61-P67.agc:639
//
// PORT: SOURCE P61-P67.agc:640
//RETRN1		TC	60GENRET
// PORT: Fixed ROM slots 24993.
    if slot <> 24993 or instruction <> 1019 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1019, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1474] to agcAotUnit1474@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:641
//
// PORT: SOURCE P61-P67.agc:642
//		EBANK=	DVCNTR
// PORT: SOURCE P61-P67.agc:643
//SERVCAD1	2CADR	SERVEXIT
// PORT: Fixed ROM slots 24994 24995.
    24994, 3374, 24995, 63598,
// PORT: SOURCE P61-P67.agc:644
//
// PORT: SOURCE P61-P67.agc:645
//C(30)LIM	2DEC	.566985		# = 1.0 - .5 COS(30)
// PORT: Fixed ROM slots 24996 24997.
    24996, 18578, 24997, 15802,
// PORT: SOURCE P61-P67.agc:646
//
// PORT: SOURCE P61-P67.agc:647
//10SECS		DEC	1000		# 1000 CS
// PORT: Fixed ROM slots 24998.
    24998, 2000,
// PORT: SOURCE P61-P67.agc:648
//60SECDP		2DEC	6000 B-28	# 6000 CS
// PORT: Fixed ROM slots 24999 25000.
    24999, 0, 25000, 12000,
// PORT: SOURCE P61-P67.agc:649
//
// PORT: SOURCE P61-P67.agc:650
//# Page 806
// PORT: SOURCE P61-P67.agc:651
//# PROGRAM NAME:		S61.2			DATE:		14 FEB 67
// PORT: SOURCE P61-P67.agc:652
//# MOD NO:  	1				LOG SECTION:	P61-P67
// PORT: SOURCE P61-P67.agc:653
//# MOD BY:	NORTH / BAIRNSFATHER
// PORT: SOURCE P61-P67.agc:654
//# MOD NO: 2	MOD BY: NORTH/BAIRNSFATHER	DATE: 11 MAY 67		ADD 2ND ITER FOR ERAD AT 400K FT.
// PORT: SOURCE P61-P67.agc:655
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 21 NOV 67		VARIABLE MU ADDED.
// PORT: SOURCE P61-P67.agc:656
//# MOD NO: 4	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		DIFFERENT EARTH/MOON SCALES IN TFF'S
// PORT: SOURCE P61-P67.agc:657
//#
// PORT: SOURCE P61-P67.agc:658
//# FUNCTIONAL DESCRIPTION:  CALLED IN P61.  PROVIDES DISPLAYS FOR NOUNS  N60  AND  N63 .
// PORT: SOURCE P61-P67.agc:659
//#	PROGRAM CALCULATES ENTRY DISPLAY OF MAXIMUM ACCELERATION EXPECTED  (GMAX)  AND ALSO THE EXPECTED
// PORT: SOURCE P61-P67.agc:660
//#	INERTIAL VELOCITY (VPRED) AND ENTRY ANGLE  (GAMMAEI)  THAT WILL OBTAIN AT 400K FT ABOVE THE FISCHER
// PORT: SOURCE P61-P67.agc:661
//#	ELLIPSOID.  PROGRAM ALSO CALCULATES A SECOND DISPLAY RELATIVE TO THE  EMSALT  ABOVE FISCHER ELLIPSOID
// PORT: SOURCE P61-P67.agc:662
//#	AND CONSISTS OF RANGE TO SPLASH FROM NOW  (RTGO) , PREDICTED INERTIAL VELOCITY  (VIO) , AND THE TIME TO
// PORT: SOURCE P61-P67.agc:663
//#	GO FROM NOW  (TTE) .
// PORT: SOURCE P61-P67.agc:664
//#
// PORT: SOURCE P61-P67.agc:665
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE P61-P67.agc:666
//#				S61.2
// PORT: SOURCE P61-P67.agc:667
//#			C(MPAC) UNSPECIFIED
// PORT: SOURCE P61-P67.agc:668
//#			PUSHLOC WILL BE SET TO ZERO.
// PORT: SOURCE P61-P67.agc:669
//#
// PORT: SOURCE P61-P67.agc:670
//# SUBROUTINES CALLED:	TFFCONIC, CALCTFF, TFF/TRIG, FISHCALC, GETERAD, VGAMCALC
// PORT: SOURCE P61-P67.agc:671
//#
// PORT: SOURCE P61-P67.agc:672
//# NORMAL EXIT MODES:	RTB, P61.1
// PORT: SOURCE P61-P67.agc:673
//#
// PORT: SOURCE P61-P67.agc:674
//# ALARMS:  	NONE
// PORT: SOURCE P61-P67.agc:675
//#
// PORT: SOURCE P61-P67.agc:676
//# OUTPUT:	THE FOLLOWING REGISTERS ARE WRITTEN IN FOR USE BY DISPLAYS
// PORT: SOURCE P61-P67.agc:677
//#		GMAX	100 GMAX (-14) G,S	MAXIMUM ACCELERATION
// PORT: SOURCE P61-P67.agc:678
//#		VPRED	(-7) M/CS		PREDICTED VELOCITY AT 400K FT
// PORT: SOURCE P61-P67.agc:679
//#		GAMMAEI	GAMMA/360		PREDICTED GAMMA    AT 400K FT
// PORT: SOURCE P61-P67.agc:680
//#						FOR TM, DP(GAMMAEI) = (GAMMAEI, RTGO) / 360
// PORT: SOURCE P61-P67.agc:681
//#		RTGO	THETAH/360		RANGE ANGLE TO SPLASH FROM EMSALT	EMSALT IS PAD LOADED.
// PORT: SOURCE P61-P67.agc:682
//#		VIO	(-7) M/CS		INTERTIAL VELOCITY AT      EMSALT	EMSALT IS PAD LOADED.
// PORT: SOURCE P61-P67.agc:683
//#		TTE	(-28) CS		TIME TO                    EMSALT	EMSALT IS PAD LOADED.
// PORT: SOURCE P61-P67.agc:684
//#		PUSHLOC	= 0
// PORT: SOURCE P61-P67.agc:685
//#		CONIC PARAMETERS STORED IN VAC AREA (SEE TFF SUBROUTINES)
// PORT: SOURCE P61-P67.agc:686
//#
// PORT: SOURCE P61-P67.agc:687
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P61-P67.agc:688
//#		RONE	(-29) M			STATE VECTOR				LEFT BY USER
// PORT: SOURCE P61-P67.agc:689
//#		VONE	(-7) M/CS		STATE VECTOR				LEFT BY USER
// PORT: SOURCE P61-P67.agc:690
//#		URONE	UR/2								LEFT BY USER
// PORT: SOURCE P61-P67.agc:691
//#		UNI	(-1)			UNIT NORMAL V*R				LEFT BY ENTRY / P61
// PORT: SOURCE P61-P67.agc:692
//#		THETAH	THETAH/360		RANGE ANGLE				LEFT BY ENTRY / P61
// PORT: SOURCE P61-P67.agc:693
//#		UNITW	(0)			UNIT POLAR VECTOR			LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:694
//#		EMSALT	(-29) M			EMS INTERFACE ALTITUDE			LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:695
//#						ORBITAL REENTRY: 284843 FT., LUNAR REENTRY: 297431 FT.
// PORT: SOURCE P61-P67.agc:696
//#
// PORT: SOURCE P61-P67.agc:697
//# DEBRIS:	QPRET,
// PORT: SOURCE P61-P67.agc:698
//#		ALL PDL LOCATIONS ABOVE 12D, INCLUDING X1,X2,S1,S2
// PORT: SOURCE P61-P67.agc:699
//#		ALSO PDL+0 ... PDL+5, WHERE INITIAL PUSHLOC = PDL
// PORT: SOURCE P61-P67.agc:700
//
// PORT: SOURCE P61-P67.agc:701
//# Page 807
// PORT: SOURCE P61-P67.agc:702
//# THE FOLLOWING PUSH LIST LOCATIONS HAVE BEEN RESERVED FOR TFF ROUTINES AND ARE REPEATED HERE FOR CONVENIENCE.
// PORT: SOURCE P61-P67.agc:703
//# OF COURSE FOR S61.2 USAGE, EARTH ORIGIN SCALING IS USED.
// PORT: SOURCE P61-P67.agc:704
//#
// PORT: SOURCE P61-P67.agc:705
//#				BELOW	E:  IS USED FOR EARTH ORIGIN SCALE
// PORT: SOURCE P61-P67.agc:706
//#					M:  IS USED FOR MOON ORIGIN SCALE
// PORT: SOURCE P61-P67.agc:707
//#
// PORT: SOURCE P61-P67.agc:708
//#	RTERM	= 	18D		TERMINAL RADIUS M	E:  (-29)	M:  (-27)
// PORT: SOURCE P61-P67.agc:709
//#	NRTERM	=	16D		TERMINAL RADIUS M	E:  (-29+NR)
// PORT: SOURCE P61-P67.agc:710
//#								M:  (-27+NR)
// PORT: SOURCE P61-P67.agc:711
//#	RMAG1	=	12D		PRESENT RADIUS M	E:  (-29)	M:  (-27)
// PORT: SOURCE P61-P67.agc:712
//#	NRMAG	=	32D		PRESENT RADIUS M	E:  (-29+NR)
// PORT: SOURCE P61-P67.agc:713
//#								M:  (-27+NR)
// PORT: SOURCE P61-P67.agc:714
//#	SDELF/2				SIN(THETA) / 2
// PORT: SOURCE P61-P67.agc:715
//#	CDELF/2	=	14D		COS(THETA) / 2
// PORT: SOURCE P61-P67.agc:716
//#	TFFX	=	34D		X, ARGUMENT OF SERIES T(X)
// PORT: SOURCE P61-P67.agc:717
//#	TFFTEM	=	36D		ARG FOR TRANSFER ANGLE CALCULATION
// PORT: SOURCE P61-P67.agc:718
//#	TFFNP	=	28D		LC P M 			E:  (-38+2NR)	M:  (-36+2NR)
// PORT: SOURCE P61-P67.agc:719
//#	TFF/RTMU=	30D		1/SQRT(MU)		E:  (17)	M:  (14)
// PORT: SOURCE P61-P67.agc:720
//#	TFFVSQ	=	20D		-(VN.VN/MU)	1/M	E:  (20)	M:  (18)
// PORT: SOURCE P61-P67.agc:721
//
// PORT: SOURCE P61-P67.agc:722
//# Page 808
// PORT: SOURCE P61-P67.agc:723
//		BANK	34
// PORT: SOURCE P61-P67.agc:724
//		SETLOC	P60S2
// PORT: SOURCE P61-P67.agc:725
//		BANK
// PORT: SOURCE P61-P67.agc:726
//
// PORT: SOURCE P61-P67.agc:727
//		COUNT*	$$/S61.2
// PORT: SOURCE P61-P67.agc:728
//					# PDL LEFT AT ZERO BY TARGETING
// PORT: SOURCE P61-P67.agc:729
//
// PORT: SOURCE P61-P67.agc:730
//S61.2		DLOAD	DSU
// PORT: Fixed ROM slots 25001.
    25001, 38346,
// PORT: SOURCE P61-P67.agc:731
//			EMSALT
// PORT: Fixed ROM slots 25002.
    25002, 2080,
// PORT: SOURCE P61-P67.agc:732
//			290KFT
// PORT: Fixed ROM slots 25003.
    25003, 13314,
// PORT: SOURCE P61-P67.agc:733
//		BPL	DLOAD
// PORT: Fixed ROM slots 25004.
    25004, 58696,
// PORT: SOURCE P61-P67.agc:734
//			LUNENT
// PORT: Fixed ROM slots 25005.
    25005, 46074,
// PORT: SOURCE P61-P67.agc:735
//			1/RTMU		# ESTABLISH MU FOR ORBITAL ENTRIES
// PORT: Fixed ROM slots 25006.
    25006, 15832,
// PORT: SOURCE P61-P67.agc:736
//CALLCON		CALL
// PORT: Fixed ROM slots 25007.
    25007, 65320,
// PORT: SOURCE P61-P67.agc:737
//			TFFCONIC	# FILL VAC AREA WITH CONIC PARAMETERS
// PORT: Fixed ROM slots 25008.
    25008, 48094,
// PORT: SOURCE P61-P67.agc:738
//
// PORT: SOURCE P61-P67.agc:739
//		DLOAD	CALL
// PORT: Fixed ROM slots 25009.
    25009, 38090,
// PORT: SOURCE P61-P67.agc:740
//			RTRIAL		# 1ST GUESS AT TERMINAL RADIUS	(-29)
// PORT: Fixed ROM slots 25010.
    25010, 13346,
// PORT: SOURCE P61-P67.agc:741
//			CALCTFF		# SAVES MPAC IN RTERM		(18D)
// PORT: Fixed ROM slots 25011.
    25011, 48238,
// PORT: SOURCE P61-P67.agc:742
//
// PORT: SOURCE P61-P67.agc:743
//		CALL			# CALC SDELF/2, CDELF/2
// PORT: Fixed ROM slots 25012.
    25012, 65320,
// PORT: SOURCE P61-P67.agc:744
//			TFF/TRIG	# RETURN WITH S(THETA) IN MPAC
// PORT: Fixed ROM slots 25013.
    25013, 47922,
// PORT: SOURCE P61-P67.agc:745
//
// PORT: SOURCE P61-P67.agc:746
//		CALL			# GET FISCHER RADIUS		(-29) M
// PORT: Fixed ROM slots 25014.
    25014, 65320,
// PORT: SOURCE P61-P67.agc:747
//			FISHCALC	# ANS IN MPAC AND IN ERADM
// PORT: Fixed ROM slots 25015.
    25015, 46128,
// PORT: SOURCE P61-P67.agc:748
//
// PORT: SOURCE P61-P67.agc:749
//		DAD	CALL
// PORT: Fixed ROM slots 25016.
    25016, 37914,
// PORT: SOURCE P61-P67.agc:750
//			EMSALT
// PORT: Fixed ROM slots 25017.
    25017, 2080,
// PORT: SOURCE P61-P67.agc:751
//			CALCTFF		# SAVES MPAC IN RTERM		(18D)
// PORT: Fixed ROM slots 25018.
    25018, 48238,
// PORT: SOURCE P61-P67.agc:752
//
// PORT: SOURCE P61-P67.agc:753
//		DCOMP			# NEGATIVE AS IN COUNTDOWN
// PORT: Fixed ROM slots 25019.
    25019, 65404,
// PORT: SOURCE P61-P67.agc:754
//		STORE	TTE1		# DECR TTE FROM BASB TTE1.  (RESTART)
// PORT: Fixed ROM slots 25020.
    25020, 4022,
// PORT: SOURCE P61-P67.agc:755
//					# DNLIST AND DSKY WILL USE TTE.
// PORT: SOURCE P61-P67.agc:756
//		STCALL	TTE		# LET MISS CONTRL DECR BY ELAPSED TIME
// PORT: Fixed ROM slots 25021.
    25021, 32686,
// PORT: SOURCE P61-P67.agc:757
//					# TTE= TIME FROM NOW TO EMSALT +FISCHER
// PORT: SOURCE P61-P67.agc:758
//
// PORT: SOURCE P61-P67.agc:759
//			TFF/TRIG	# S(THETA) IN MPAC ON RETURNING
// PORT: Fixed ROM slots 25022.
    25022, 47922,
// PORT: SOURCE P61-P67.agc:760
//					# AND THETA= RANGE FROM NOW TO EMSALT
// PORT: SOURCE P61-P67.agc:761
//
// PORT: SOURCE P61-P67.agc:762
//		CALL
// PORT: Fixed ROM slots 25023.
    25023, 65320,
// PORT: SOURCE P61-P67.agc:763
//			FISHCALC
// PORT: Fixed ROM slots 25024.
    25024, 46128,
// PORT: SOURCE P61-P67.agc:764
//		CALL
// PORT: Fixed ROM slots 25025.
    25025, 65320,
// PORT: SOURCE P61-P67.agc:765
//			VRCALC
// PORT: Fixed ROM slots 25026.
    25026, 47976,
// PORT: SOURCE P61-P67.agc:766
//		CALL
// PORT: Fixed ROM slots 25027.
    25027, 65320,
// PORT: SOURCE P61-P67.agc:767
//			DISPTARG
// PORT: Fixed ROM slots 25028.
    25028, 47954,
// PORT: SOURCE P61-P67.agc:768
//		CALL
// PORT: Fixed ROM slots 25029.
    25029, 65320
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:769
//			DISPTARG
// PORT: Fixed ROM slots 25030.
    25030, 47954,
// PORT: SOURCE P61-P67.agc:770
//		STCALL	RTGO
// PORT: Fixed ROM slots 25031.
    25031, 32664,
// PORT: SOURCE P61-P67.agc:771
//# Page 809
// PORT: SOURCE P61-P67.agc:772
//			VGAMCALC
// PORT: Fixed ROM slots 25032.
    25032, 46162,
// PORT: SOURCE P61-P67.agc:773
//
// PORT: SOURCE P61-P67.agc:774
//		DMP			# MPAC = GAMMA
// PORT: Fixed ROM slots 25033.
    25033, 65290,
// PORT: SOURCE P61-P67.agc:775
//					# PDL0 HAS VGAM.
// PORT: SOURCE P61-P67.agc:776
//		BDDV	DAD
// PORT: Fixed ROM slots 25034.
    25034, 36202,
// PORT: SOURCE P61-P67.agc:777
//			VEMSCON		# -HS D 180/PI (-14)
// PORT: Fixed ROM slots 25035.
    25035, 13358,
// PORT: SOURCE P61-P67.agc:778
//			0		# VGAM FROM PDL0
// PORT: Fixed ROM slots 25036.
    25036, 2,
// PORT: SOURCE P61-P67.agc:779
//		STODL	VIO		# PREDICTED VELOCITY AT EMSALT.
// PORT: Fixed ROM slots 25037.
    25037, 16298,
// PORT: SOURCE P61-P67.agc:780
//
// PORT: SOURCE P61-P67.agc:781
//					# GAMMA AND VGAM AT 300K FT ARE REQUIRED BY GMAX
// PORT: SOURCE P61-P67.agc:782
//					# ALGORITHM.
// PORT: SOURCE P61-P67.agc:783
//
// PORT: SOURCE P61-P67.agc:784
//			ERADM		# EARTH RADIUS FROM GETERAD (-29) M
// PORT: Fixed ROM slots 25038.
    25038, 2370,
// PORT: SOURCE P61-P67.agc:785
//					# = FISCHER RADIUS (-29)
// PORT: SOURCE P61-P67.agc:786
//
// PORT: SOURCE P61-P67.agc:787
//		DAD
// PORT: Fixed ROM slots 25039.
    25039, 65306,
// PORT: SOURCE P61-P67.agc:788
//			300KFT		# M (-29)
// PORT: Fixed ROM slots 25040.
    25040, 6756,
// PORT: SOURCE P61-P67.agc:789
//		STCALL	RTERM		# TERMINAL RADIUS M (-29)
// PORT: Fixed ROM slots 25041.
    25041, 28710,
// PORT: SOURCE P61-P67.agc:790
//
// PORT: SOURCE P61-P67.agc:791
//			PREVGAM		# VGAMCALC WITH NEW RTERM
// PORT: Fixed ROM slots 25042.
    25042, 46156,
// PORT: SOURCE P61-P67.agc:792
//
// PORT: SOURCE P61-P67.agc:793
//					# VBAR = (V(FPS) - 36KF/S) / 20 F/S
// PORT: SOURCE P61-P67.agc:794
//# GMAX = (4/(1 + 4.8 VBARSQ))(GAM - 6.05 - 2.4 VBARSQ) - 10(L/D - .3) + 10	ASSUME L/D = 0.3, BANK =0.
// PORT: SOURCE P61-P67.agc:795
//
// PORT: SOURCE P61-P67.agc:796
//# GMAXCALC
// PORT: SOURCE P61-P67.agc:797
//		PDDL	DSU		# GAM TO PDL2
// PORT: Fixed ROM slots 25043.
    25043, 38314,
// PORT: SOURCE P61-P67.agc:798
//			0		# VGAM IS IN PDL0 (-7)
// PORT: Fixed ROM slots 25044.
    25044, 2,
// PORT: SOURCE P61-P67.agc:799
//			36KFT/S		# (-7) M/CS
// PORT: Fixed ROM slots 25045.
    25045, 13322,
// PORT: SOURCE P61-P67.agc:800
//		DDV	DSQ
// PORT: Fixed ROM slots 25046.
    25046, 52850,
// PORT: SOURCE P61-P67.agc:801
//			20KFT/S		# (-6) M/CS
// PORT: Fixed ROM slots 25047.
    25047, 13326,
// PORT: SOURCE P61-P67.agc:802
//		STORE	0		# VBARSQ (-2) TO PDL0
// PORT: Fixed ROM slots 25048.
    25048, 2,
// PORT: SOURCE P61-P67.agc:803
//
// PORT: SOURCE P61-P67.agc:804
//		DMP	DAD
// PORT: Fixed ROM slots 25049.
    25049, 36106,
// PORT: SOURCE P61-P67.agc:805
//			KR1
// PORT: Fixed ROM slots 25050.
    25050, 13330,
// PORT: SOURCE P61-P67.agc:806
//					# GAM, POS DOWN, FROM PDL2
// PORT: SOURCE P61-P67.agc:807
//		DAD	DMP
// PORT: Fixed ROM slots 25051.
    25051, 34074,
// PORT: SOURCE P61-P67.agc:808
//			-6.05DEG
// PORT: Fixed ROM slots 25052.
    25052, 13334,
// PORT: SOURCE P61-P67.agc:809
//			KR2
// PORT: Fixed ROM slots 25053.
    25053, 13338,
// PORT: SOURCE P61-P67.agc:810
//		PDDL			# XCH PDL+0 FOR VBARSQ (-2)
// PORT: Fixed ROM slots 25054.
    25054, 65450,
// PORT: SOURCE P61-P67.agc:811
//		DDV	DAD
// PORT: Fixed ROM slots 25055.
    25055, 36210,
// PORT: SOURCE P61-P67.agc:812
//			KR4
// PORT: Fixed ROM slots 25056.
    25056, 13354,
// PORT: SOURCE P61-P67.agc:813
//			DP2(-4)
// PORT: Fixed ROM slots 25057.
    25057, 15852,
// PORT: SOURCE P61-P67.agc:814
//		BDDV
// PORT: Fixed ROM slots 25058.
    25058, 65386,
// PORT: SOURCE P61-P67.agc:815
//					# NUM FROM PDL+0
// PORT: SOURCE P61-P67.agc:816
//		DAD	BPL
// PORT: Fixed ROM slots 25059.
    25059, 42010,
// PORT: SOURCE P61-P67.agc:817
//			KR3
// PORT: Fixed ROM slots 25060.
    25060, 13342,
// PORT: SOURCE P61-P67.agc:818
//			+3
// PORT: Fixed ROM slots 25061.
    25061, 46032,
// PORT: SOURCE P61-P67.agc:819
//		DLOAD
// PORT: Fixed ROM slots 25062.
    25062, 65482,
// PORT: SOURCE P61-P67.agc:820
//			HI6ZEROS
// PORT: Fixed ROM slots 25063.
    25063, 13754,
// PORT: SOURCE P61-P67.agc:821
//		STODL	GMAX		# 100 GMAX (-14)
// PORT: Fixed ROM slots 25064.
    25064, 16292,
// PORT: SOURCE P61-P67.agc:822
//# Page 810
// PORT: SOURCE P61-P67.agc:823
//# DISPLAY USES GMAX AS SP, SO LO WORD IS WRITTEN OVER BY VPRED.
// PORT: SOURCE P61-P67.agc:824
//			ERADM		# = FISCHER RADIUS (-29) M
// PORT: Fixed ROM slots 25065.
    25065, 2370,
// PORT: SOURCE P61-P67.agc:825
//		DAD	CALL		# 2 ND ITERATION FOR FISCHER RADIUS
// PORT: Fixed ROM slots 25066.
    25066, 37914,
// PORT: SOURCE P61-P67.agc:826
//			400KFT
// PORT: Fixed ROM slots 25067.
    25067, 13350,
// PORT: SOURCE P61-P67.agc:827
//			CALCTFF		# ESTABLISH TRANSFER ANGLE DATA.
// PORT: Fixed ROM slots 25068.
    25068, 48238,
// PORT: SOURCE P61-P67.agc:828
//		CALL
// PORT: Fixed ROM slots 25069.
    25069, 65320,
// PORT: SOURCE P61-P67.agc:829
//			TFF/TRIG	# GET SIN, COS DELF
// PORT: Fixed ROM slots 25070.
    25070, 47922,
// PORT: SOURCE P61-P67.agc:830
//		CALL
// PORT: Fixed ROM slots 25071.
    25071, 65320,
// PORT: SOURCE P61-P67.agc:831
//			FISHCALC	# GET CORRESPONDING FISCHER RADIUS.
// PORT: Fixed ROM slots 25072.
    25072, 46128,
// PORT: SOURCE P61-P67.agc:832
//
// PORT: SOURCE P61-P67.agc:833
//		DAD	LXA,2		# SAVE HI-WORD FOR DOWNLIST.
// PORT: Fixed ROM slots 25073.
    25073, 60442,
// PORT: SOURCE P61-P67.agc:834
//			400KFT		# M (-29)
// PORT: Fixed ROM slots 25074.
    25074, 13350,
// PORT: SOURCE P61-P67.agc:835
//			RTGO		# (RANGE ANGLE FROM EMSALT) / 360
// PORT: Fixed ROM slots 25075.
    25075, 3990,
// PORT: SOURCE P61-P67.agc:836
//		STCALL	RTERM
// PORT: Fixed ROM slots 25076.
    25076, 28710,
// PORT: SOURCE P61-P67.agc:837
//			PREVGAM		# VGAMCALC WITH NEW RTERM
// PORT: Fixed ROM slots 25077.
    25077, 46156,
// PORT: SOURCE P61-P67.agc:838
//
// PORT: SOURCE P61-P67.agc:839
//		DCOMP	SXA,2		# HI-WORD OF EACH ON DOWNLIST.
// PORT: Fixed ROM slots 25078.
    25078, 56444,
// PORT: SOURCE P61-P67.agc:840
//			MPAC +1
// PORT: Fixed ROM slots 25079.
    25079, 218,
// PORT: SOURCE P61-P67.agc:841
//		STODL	GAMMAEI		# CONIC GAMMA/360 AT 400K FT.	(HI-WORD)
// PORT: Fixed ROM slots 25080.
    25080, 16370,
// PORT: SOURCE P61-P67.agc:842
//					# CONIC RTGO/360 FROM EMSALT   (LOW-WORD)
// PORT: SOURCE P61-P67.agc:843
//					# FOR TM, DP(GAMMAEI) = (GAMMA, RTGO) / 360
// PORT: SOURCE P61-P67.agc:844
//
// PORT: SOURCE P61-P67.agc:845
//					# VGAM FROM PDL+0 (-7)
// PORT: SOURCE P61-P67.agc:846
//		STADR
// PORT: Fixed ROM slots 25081.
    25081, 65324,
// PORT: SOURCE P61-P67.agc:847
//		STORE	VPRED		# CONIC VELOCITY AT 400K FT
// PORT: Fixed ROM slots 25082.
    25082, 61456,
// PORT: SOURCE P61-P67.agc:848
//
// PORT: SOURCE P61-P67.agc:849
//		RTB
// PORT: Fixed ROM slots 25083.
    25083, 65336,
// PORT: SOURCE P61-P67.agc:850
//			P61.1
// PORT: Fixed ROM slots 25084.
    25084, 45422,
// PORT: SOURCE P61-P67.agc:851
//					# PDL BACK TO ZERO.
// PORT: SOURCE P61-P67.agc:852
//
// PORT: SOURCE P61-P67.agc:853
//LUNENT		DLOAD	GOTO
// PORT: Fixed ROM slots 25085.
    25085, 43210,
// PORT: SOURCE P61-P67.agc:854
//			1/RTMUE		# ESTABLISH MU FOR LUNAR TYPE ENTRIES
// PORT: Fixed ROM slots 25086.
    25086, 6748,
// PORT: SOURCE P61-P67.agc:855
//			CALLCON
// PORT: Fixed ROM slots 25087.
    25087, 45918,
// PORT: SOURCE P61-P67.agc:856
//290KFT		2DEC	88392.0 B-29
// PORT: Fixed ROM slots 25088 25089.
    25088, 4, 25089, 22856,
// PORT: SOURCE P61-P67.agc:857
//
// PORT: SOURCE P61-P67.agc:858
//KTETA1		2DEC*	.421844723 E2 B-14* # 110 2PI/16384(163.84)
// PORT: Fixed ROM slots 25090 25091.
    25090, 84, 25091, 6044,
// PORT: SOURCE P61-P67.agc:859
//
// PORT: SOURCE P61-P67.agc:860
//36KFT/S		2DEC	109.728 B-7	# (-7) M/CS = 36 KFT/S (-7)
// PORT: Fixed ROM slots 25092 25093.
    25092, 28090, 25093, 6030,
// PORT: SOURCE P61-P67.agc:861
//
// PORT: SOURCE P61-P67.agc:862
//20KFT/S		2DEC	121.92 B-7	# (-6) M/CS = 2 20KFT/S (-7)
// PORT: Fixed ROM slots 25094 25095.
    25094, 31210, 25095, 24904,
// PORT: SOURCE P61-P67.agc:863
//
// PORT: SOURCE P61-P67.agc:864
//KR1		2DEC	-.026666667	# = -2.4 4 / 360
// PORT: Fixed ROM slots 25096 25097.
    25096, 64662, 25097, 35824,
// PORT: SOURCE P61-P67.agc:865
//
// PORT: SOURCE P61-P67.agc:866
//-6.05DEG	2DEC	-.016805556	# = -6.05 / 360
// PORT: Fixed ROM slots 25098 25099.
    25098, 64984, 25099, 54320,
// PORT: SOURCE P61-P67.agc:867
//
// PORT: SOURCE P61-P67.agc:868
//KR2		2DEC	.54931641	# = (360/4) 100 (-14) = 9000 B-14
// PORT: Fixed ROM slots 25100 25101.
    25100, 18000, 25101, 2,
// PORT: SOURCE P61-P67.agc:869
//
// PORT: SOURCE P61-P67.agc:870
//KR3		2DEC	1000 B-14	# = 100 (10.0) (-14) G,S
// PORT: Fixed ROM slots 25102 25103.
    25102, 2000, 25103, 0,
// PORT: SOURCE P61-P67.agc:871
//# Page 811
// PORT: SOURCE P61-P67.agc:872
//					# ASSUMES L/D = 0.3, BANK =0.
// PORT: SOURCE P61-P67.agc:873
//RTRIAL		2DEC	6460097.18 B-29	# RPAD +264643 FT =21 194 545 FT
// PORT: Fixed ROM slots 25104 25105.
    25104, 394, 25105, 4802,
// PORT: SOURCE P61-P67.agc:874
//					# RPAD DEFINED AS 20 909 901.57 FT =6 373 336 M
// PORT: SOURCE P61-P67.agc:875
//400KFT		2DEC	121920 B-29	# METERS
// PORT: Fixed ROM slots 25106 25107.
    25106, 6, 25107, 23616,
// PORT: SOURCE P61-P67.agc:876
//
// PORT: SOURCE P61-P67.agc:877
//# 300KFT	2DEC	91440 B-29	# (-29) M
// PORT: SOURCE P61-P67.agc:878
//
// PORT: SOURCE P61-P67.agc:879
//# EMSALT	2DEC	86759.2	B-29	# 284643 FT (-29) M 	(ORBITAL REENTRY)
// PORT: SOURCE P61-P67.agc:880
//
// PORT: SOURCE P61-P67.agc:881
//# EMSALT	2DEC	90657 B-29	# 297431 FT (-29) M	(LUNAR REENTRY)
// PORT: SOURCE P61-P67.agc:882
//
// PORT: SOURCE P61-P67.agc:883
//KR4		2DEC	.833333333
// PORT: Fixed ROM slots 25108 25109.
    25108, 27306, 25109, 10922,
// PORT: SOURCE P61-P67.agc:884
//
// PORT: SOURCE P61-P67.agc:885
//300KFT		EQUALS	MINPERE
// PORT: SOURCE P61-P67.agc:886
//VEMSCON		2DEC	-.0389676 B-14	# = -HS D / 2 PI (-14)	M SQ / CS SQ
// PORT: Fixed ROM slots 25110 25111.
    25110, 65534, 25111, 64258,
// PORT: SOURCE P61-P67.agc:887
//
// PORT: SOURCE P61-P67.agc:888
//					# = -16369	.05G	32.2	.3048	.3048/2 PI	(-14)
// PORT: SOURCE P61-P67.agc:889
//
// PORT: SOURCE P61-P67.agc:890
//# Page 812
// PORT: SOURCE P61-P67.agc:891
//# SUBROUTINE NAME:  FISHCALC	(USED BY S61.2)		DATE:		01.21.67
// PORT: SOURCE P61-P67.agc:892
//# MOD NO: 0						LOG SECTION:	P61-P67
// PORT: SOURCE P61-P67.agc:893
//# MOD BY: MORTH / BAIRNSFATHER
// PORT: SOURCE P61-P67.agc:894
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER			DATE:		11 MAY 67	INCLUDE GETERAD CALL
// PORT: SOURCE P61-P67.agc:895
//#
// PORT: SOURCE P61-P67.agc:896
//# FUNCTIONAL DESCRIPTION:  GIVEN THE PRESENT POSITION, UNITR, CALCULATE A NEW UNITR THAT IS ROTATED THROUGH
// PORT: SOURCE P61-P67.agc:897
//#	TRANSFER ANGLE, THETA, ALONG THE TRAJECTORY.  THEN CALCULATE SIN(LAT) AND USE TO OBTAIN FISCHER RADIUS.
// PORT: SOURCE P61-P67.agc:898
//#	SINCE FISHCALC USED UNI (LEFT BY ENTRY) EARTH SCALING IS ASSUMED.  (WILL IMPROVE FOR SUITABLE TENNANT)
// PORT: SOURCE P61-P67.agc:899
//#
// PORT: SOURCE P61-P67.agc:900
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE P61-P67.agc:901
//#				FISHCALC
// PORT: SOURCE P61-P67.agc:902
//#	ENTER WITH .5 SIN(THETA) IN MPAC.
// PORT: SOURCE P61-P67.agc:903
//#	PUSHLOC IS AT PDL+0, AN ARBITRARY BASE VALUE IF LEQ 8D
// PORT: SOURCE P61-P67.agc:904
//#
// PORT: SOURCE P61-P67.agc:905
//# SUBROUTINES CALLED:  GET ERAD
// PORT: SOURCE P61-P67.agc:906
//#
// PORT: SOURCE P61-P67.agc:907
//# NORMAL EXIT MODE:  RVQ
// PORT: SOURCE P61-P67.agc:908
//#
// PORT: SOURCE P61-P67.agc:909
//# EXIT MODES:	NONE
// PORT: SOURCE P61-P67.agc:910
//#
// PORT: SOURCE P61-P67.agc:911
//# OUTPUT:	ERADM (-29) M IN MPAC ON RETURNING
// PORT: SOURCE P61-P67.agc:912
//#		NEW UNIT VECTOR NOT SAVED.
// PORT: SOURCE P61-P67.agc:913
//#		SIN(LAT) NOT SAVED.
// PORT: SOURCE P61-P67.agc:914
//#		PUSHLOC AT PDL+0
// PORT: SOURCE P61-P67.agc:915
//#
// PORT: SOURCE P61-P67.agc:916
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P61-P67.agc:917
//#		SDELF/2		=SIN(THETA) / 2, IN MPAC		LEFT BY TFF/TRIG
// PORT: SOURCE P61-P67.agc:918
//#		CDELF/2		=COS(THETA) / 2, STORED IN PDL 14D	LEFT BY TFF/TRIG
// PORT: SOURCE P61-P67.agc:919
//#		RONE		(-29) M					LEFT BY USER
// PORT: SOURCE P61-P67.agc:920
//#		VONE		(-7) M/CS				LEFT BY USER
// PORT: SOURCE P61-P67.agc:921
//#		URONE		UR/2					LEFT BY USER
// PORT: SOURCE P61-P67.agc:922
//#		UNI		.5 UNIT(V*R)				LEFT BY ENTRY / P61
// PORT: SOURCE P61-P67.agc:923
//#		UNITW		UNIT NORTH POLE				LEFT BY PAD LOAD
// PORT: SOURCE P61-P67.agc:924
//#
// PORT: SOURCE P61-P67.agc:925
//# DEBRIS:	QPRET, PDL+0 ... PDL+5
// PORT: SOURCE P61-P67.agc:926
//					# _      _          _
// PORT: SOURCE P61-P67.agc:927
//FISHCALC	PDVL	VXV		# URPR = UR CDELF + UHOR SDELF
// PORT: Fixed ROM slots 25112.
    25112, 40346
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:928
//	 		URONE
// PORT: Fixed ROM slots 25113.
    25113, 2502,
// PORT: SOURCE P61-P67.agc:929
//			UNI
// PORT: Fixed ROM slots 25114.
    25114, 3716,
// PORT: SOURCE P61-P67.agc:930
//		VXSC	VSL1
// PORT: Fixed ROM slots 25115.
    25115, 64226,
// PORT: SOURCE P61-P67.agc:931
//					# SIN(THETA) / 2 FROM PDL+0
// PORT: SOURCE P61-P67.agc:932
//		PDVL	VXSC		# TO PDL+0, +5
// PORT: Fixed ROM slots 25116.
    25116, 61850,
// PORT: SOURCE P61-P67.agc:933
//			URONE
// PORT: Fixed ROM slots 25117.
    25117, 2502,
// PORT: SOURCE P61-P67.agc:934
//			CDELF/2		# COS(THETA) / 2
// PORT: Fixed ROM slots 25118.
    25118, 30,
// PORT: SOURCE P61-P67.agc:935
//		VAD	STADR
// PORT: Fixed ROM slots 25119.
    25119, 38490,
// PORT: SOURCE P61-P67.agc:936
//		STORE	URH		# FOR USE IN RTGO FROM EMS DISPLAY
// PORT: Fixed ROM slots 25120.
    25120, 61754,
// PORT: SOURCE P61-P67.agc:937
//		DOT	SL1
// PORT: Fixed ROM slots 25121.
    25121, 59970,
// PORT: SOURCE P61-P67.agc:938
//			UNITW		# PULL UNIT VECTOR	UNIT NORTH
// PORT: Fixed ROM slots 25122.
    25122, 1944,
// PORT: SOURCE P61-P67.agc:939
//		STORE	ALPHAV +4	# = .5 SIN(LAT)
// PORT: Fixed ROM slots 25123.
    25123, 2268,
// PORT: SOURCE P61-P67.agc:940
//DUMPFISH	GOTO
// PORT: Fixed ROM slots 25124.
    25124, 65360,
// PORT: SOURCE P61-P67.agc:941
//			GETERAD		# SAVES FISCHER RAD (-29) M IN ERADM AND
// PORT: Fixed ROM slots 25125.
    25125, 23178,
// PORT: SOURCE P61-P67.agc:942
//					# IN MPAC.  RETURNS TO CALLER VIO QPRET.
// PORT: SOURCE P61-P67.agc:943
//
// PORT: SOURCE P61-P67.agc:944
//# Page 813
// PORT: SOURCE P61-P67.agc:945
//# SUBROUTINE NAME:  VGAMCALC	(USED BY S61.2)				DATE:		01.21.67
// PORT: SOURCE P61-P67.agc:946
//# MOD NO: 0								LOG SECTION:	P61-P67
// PORT: SOURCE P61-P67.agc:947
//# MOD BY: MORTH / BAIRNSFATHER
// PORT: SOURCE P61-P67.agc:948
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 11 APR 67
// PORT: SOURCE P61-P67.agc:949
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 21 NOV 67		VARIABLE MU ADDED.
// PORT: SOURCE P61-P67.agc:950
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		ACCEPT DIFFERENT EARTH/MOON SCALE
// PORT: SOURCE P61-P67.agc:951
//#
// PORT: SOURCE P61-P67.agc:952
//# FUNCTIONAL DESCRIPTION:  EARTH CENTERED VIS VIVA CALCULATION OF TERMINAL VELOCITY AND GAMMA (REL TO
// PORT: SOURCE P61-P67.agc:953
//#	HORIZONTAL) GIVEN THE SCALAR QUANTITIES:  PRESENT RADIUS AND VELOCITY AND THE TERMINAL RADIUS.
// PORT: SOURCE P61-P67.agc:954
//#	THE USER MUST APPEND PROPER SIGN TO GAMMA, SINCE IT IS CALCULATED AS A POSITIVE NUMBER.
// PORT: SOURCE P61-P67.agc:955
//#	THE EQUATIONS ARE
// PORT: SOURCE P61-P67.agc:956
//#
// PORT: SOURCE P61-P67.agc:957
//#		VGAM = SQRT(VN VN/MU + 2(RN-RTERM)/(RN RTERM) ) RTMU
// PORT: SOURCE P61-P67.agc:958
//#
// PORT: SOURCE P61-P67.agc:959
//#		COSGAM = H / RTERM VGAM = SQRT (LCP) / (RTERM VGAM/RTMU)
// PORT: SOURCE P61-P67.agc:960
//#
// PORT: SOURCE P61-P67.agc:961
//#	VGAMCALC ASSUMES THAT THE TERMINAL RADIUS IS LESS THAN THE PRESENT RADIUS.  BOTH CALCTFF AND CALCTPER
// PORT: SOURCE P61-P67.agc:962
//#	MAKE THIS ASSUMPTION.
// PORT: SOURCE P61-P67.agc:963
//#
// PORT: SOURCE P61-P67.agc:964
//# CALLING SEQUENCE:	CALL			STCALL	RTERM
// PORT: SOURCE P61-P67.agc:965
//#				VGAMCALC		PREVGAM
// PORT: SOURCE P61-P67.agc:966
//#	PUSHLOC AT PDL+0, ARBITRARY IF LEQ 12D
// PORT: SOURCE P61-P67.agc:967
//#	C(MPAC) UNSPECIFIED			C(MPAC)=NEW RTERM
// PORT: SOURCE P61-P67.agc:968
//#
// PORT: SOURCE P61-P67.agc:969
//# SUBROUTINES CALLED:  NONE
// PORT: SOURCE P61-P67.agc:970
//#
// PORT: SOURCE P61-P67.agc:971
//# NORMAL EXIT MODE:  RVQ
// PORT: SOURCE P61-P67.agc:972
//#
// PORT: SOURCE P61-P67.agc:973
//# ALARMS:	NONE
// PORT: SOURCE P61-P67.agc:974
//#
// PORT: SOURCE P61-P67.agc:975
//# OUTPUT:	GAMMA / 360 IN MPAC, POSITIVE NUMBER
// PORT: SOURCE P61-P67.agc:976
//#		VGAM 	E: (-7)	  M: (-5)	M/CS IN PDL+0
// PORT: SOURCE P61-P67.agc:977
//#		PUSHLOC AT PDL+2
// PORT: SOURCE P61-P67.agc:978
//#
// PORT: SOURCE P61-P67.agc:979
//# ERASABLE INITIALIZATION REQD:
// PORT: SOURCE P61-P67.agc:980
//#	TFF/RTMU  E: (17)   M: (14)	1/SQRT(MU)				LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:981
//#	RMAG1	  E: (-29)  M: (-27)	M  PRESENT RADIUS LENGTH		LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:982
//#	NRMAG	  E: (-29+NR)		M  NORM LENGTH OF PRESENT POSITION	LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:983
//#		  M: (-27+NR)
// PORT: SOURCE P61-P67.agc:984
//#	RTERM	  E: (-29)  M: (-27)	M  TERMINAL RADIUS LENGTH		LEFT BY CALCTFF
// PORT: SOURCE P61-P67.agc:985
//#	NRTERM    E: (-29+NR) 		M  NORM LENGTH OF TERMINAL RADIUS	LEFT BY CALCTFF
// PORT: SOURCE P61-P67.agc:986
//#		  M: (-27+NR)
// PORT: SOURCE P61-P67.agc:987
//#	TFFVSQ    E: (20)   M: (18)   1/M  -(V SQ/MU): PRESENT VELOCITY, NORM	LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:988
//#	TFFNP	  E: (-38+2NR)		M  LCP, SEMI-LATUS RECTUM, WEIGHT NR	LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:989
//#	  	  M: (-36+2NR)
// PORT: SOURCE P61-P67.agc:990
//#
// PORT: SOURCE P61-P67.agc:991
//# DEBRIS:	QPRET, PDL+0 ... PDL+3
// PORT: SOURCE P61-P67.agc:992
//#		RTERM, NRTERM IF PREVGAM ENTERED.
// PORT: SOURCE P61-P67.agc:993
//# Page 814
// PORT: SOURCE P61-P67.agc:994
//
// PORT: SOURCE P61-P67.agc:995
//PREVGAM		SL*			# ENTER WITH NEW RTERM IN MPAC
// PORT: Fixed ROM slots 25126.
    25126, 65374,
// PORT: SOURCE P61-P67.agc:996
//					# E: (-29)  M: (-27)
// PORT: SOURCE P61-P67.agc:997
//			0,1		# X1 = -NR
// PORT: Fixed ROM slots 25127.
    25127, 16642,
// PORT: SOURCE P61-P67.agc:998
//		STORE	NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25128.
    25128, 34,
// PORT: SOURCE P61-P67.agc:999
//
// PORT: SOURCE P61-P67.agc:1000
//VGAMCALC	DLOAD	DMP
// PORT: Fixed ROM slots 25129.
    25129, 34250,
// PORT: SOURCE P61-P67.agc:1001
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25130.
    25130, 66,
// PORT: SOURCE P61-P67.agc:1002
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25131.
    25131, 34,
// PORT: SOURCE P61-P67.agc:1003
//		PDDL	DSU		# RMAG RTERM M		E: (-58+2NR)	M: (-54+2NR)
// PORT: Fixed ROM slots 25132.
    25132, 38314,
// PORT: SOURCE P61-P67.agc:1004
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25133.
    25133, 66,
// PORT: SOURCE P61-P67.agc:1005
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25134.
    25134, 34,
// PORT: SOURCE P61-P67.agc:1006
//		SL*	DDV		# 2(RN-RTERM)		E: (-30+NR)	M: (-28+NR)
// PORT: Fixed ROM slots 25135.
    25135, 47454,
// PORT: SOURCE P61-P67.agc:1007
//			0 -8D,1		# (-8+NR)
// PORT: Fixed ROM slots 25136.
    25136, 16626,
// PORT: SOURCE P61-P67.agc:1008
//					# PUSH UP PRODUCT.
// PORT: SOURCE P61-P67.agc:1009
//		DSU
// PORT: Fixed ROM slots 25137.
    25137, 65322,
// PORT: SOURCE P61-P67.agc:1010
//			TFFVSQ		# -(V SQ/MU)		E: (20)		M: (18)
// PORT: Fixed ROM slots 25138.
    25138, 42,
// PORT: SOURCE P61-P67.agc:1011
//		SQRT	PUSH		# SAVE VGAM/RT(MU) FOR NOW.	E: (10)	M: (9)
// PORT: Fixed ROM slots 25139.
    25139, 34540,
// PORT: SOURCE P61-P67.agc:1012
//		DDV	PDDL		# XCH PDL+0, LEAVING VGAM FOR OUTPUT.
// PORT: Fixed ROM slots 25140.
    25140, 54642,
// PORT: SOURCE P61-P67.agc:1013
//					# VGAM TO PDL M/CS	E: (-7)		M: (-2)
// PORT: SOURCE P61-P67.agc:1014
//			TFF/RTMU	# 			E: (17)		M: (14)
// PORT: Fixed ROM slots 25141.
    25141, 62,
// PORT: SOURCE P61-P67.agc:1015
//		DMP	PDDL		# RTERM VGAM/RTMU	E: (-19+NR)	M: (-18+NR)
// PORT: Fixed ROM slots 25142.
    25142, 54538,
// PORT: SOURCE P61-P67.agc:1016
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 25143.
    25143, 34,
// PORT: SOURCE P61-P67.agc:1017
//			TFFNP		# LC P =H.H/MU M	E: (-38+2NR)	M: (-36+2NR)
// PORT: Fixed ROM slots 25144.
    25144, 58,
// PORT: SOURCE P61-P67.agc:1018
//		SQRT	DDV		#			E: (-19+NR)	M: (-18+NR)
// PORT: Fixed ROM slots 25145.
    25145, 47596,
// PORT: SOURCE P61-P67.agc:1019
//					# PUSH UP DEN		E: (-19+NR)	M: (-18+NR)
// PORT: SOURCE P61-P67.agc:1020
//					# USE DDV OVFL AS LIMITER (|COS| <1.0)
// PORT: SOURCE P61-P67.agc:1021
//		SR1	ACOS
// PORT: Fixed ROM slots 25146.
    25146, 54980,
// PORT: SOURCE P61-P67.agc:1022
//DUMPVGAM	RVQ
// PORT: Fixed ROM slots 25147.
    25147, 65308,
// PORT: SOURCE P61-P67.agc:1023
//					# CALLER MUST SUPPLY OWN SIGN ...
// PORT: SOURCE P61-P67.agc:1024
//					#			22W	27MS
// PORT: SOURCE P61-P67.agc:1025
//
// PORT: SOURCE P61-P67.agc:1026
//# Page 815
// PORT: SOURCE P61-P67.agc:1027
//# SUBROUTINE NAME:	TFF/TRIG	(USED BY S61.2)		DATE:		01.17.67
// PORT: SOURCE P61-P67.agc:1028
//# MOD NO: 0							LOG SECTION:	P61-P67
// PORT: SOURCE P61-P67.agc:1029
//# MOD BY: RR BAIRNSFATHER
// PORT: SOURCE P61-P67.agc:1030
//# MOD NO: 1	MOD BY: RR BAIRNSFATHER		DATE: 14 APR 67
// PORT: SOURCE P61-P67.agc:1031
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 21 MAR 68		ACCEPT DIFFERENT EARTH/MOON SCALE
// PORT: SOURCE P61-P67.agc:1032
//#
// PORT: SOURCE P61-P67.agc:1033
//# FUNCTIONAL DESCRIPTION:  USED BY ENTRY DISPLAY TO CALCULATE SIN(THETA), COS(THETA) FROM DATA LEFT IN
// PORT: SOURCE P61-P67.agc:1034
//#	PDL BY TFF SUBROUTINES.  THE EQNS ARE
// PORT: SOURCE P61-P67.agc:1035
//#
// PORT: SOURCE P61-P67.agc:1036
//#		COS(THETA) = 1-2 ABS(ARG) / (RN RTERM (1+X) )
// PORT: SOURCE P61-P67.agc:1037
//#						2
// PORT: SOURCE P61-P67.agc:1038
//#		SIN(THETA) = SGN(ARG) SQRT(1-COS (THETA) )
// PORT: SOURCE P61-P67.agc:1039
//#
// PORT: SOURCE P61-P67.agc:1040
//# 	WHERE THETA = TRANSFER ANGLE
// PORT: SOURCE P61-P67.agc:1041
//#	AND     ARG = P Z ABS(Z)			IF ALFA ZZ LEQ 1
// PORT: SOURCE P61-P67.agc:1042
//#	        ARG = (P / ALFA) SGN(Q1 + R 1/Z)        IF ALFA Z Z G 1
// PORT: SOURCE P61-P67.agc:1043
//#	AND  ARG  HAS BEEN AFFIXED WITH THE SIGN OF SIN(THETA)
// PORT: SOURCE P61-P67.agc:1044
//#
// PORT: SOURCE P61-P67.agc:1045
//# CALLING SEQUENCE:	CALL
// PORT: SOURCE P61-P67.agc:1046
//#				TFF/TRIG
// PORT: SOURCE P61-P67.agc:1047
//#		PUSHLOC AT PDL+0, ARBITRARY IF NOT EQ 14D
// PORT: SOURCE P61-P67.agc:1048
//#		C(MPAC) UNSPECIFIED
// PORT: SOURCE P61-P67.agc:1049
//#
// PORT: SOURCE P61-P67.agc:1050
//# SUBROUTINES CALLED:  NONE
// PORT: SOURCE P61-P67.agc:1051
//#
// PORT: SOURCE P61-P67.agc:1052
//# NORMAL EXIT MODES:  RVQ
// PORT: SOURCE P61-P67.agc:1053
//#
// PORT: SOURCE P61-P67.agc:1054
//# ALARMS:	NONE
// PORT: SOURCE P61-P67.agc:1055
//#
// PORT: SOURCE P61-P67.agc:1056
//# OUTPUT:	C(MPAC) = .5 SIN(THETA)
// PORT: SOURCE P61-P67.agc:1057
//#		CDELF/2 = .5 COS(THETA)		(IN PDL 14D)
// PORT: SOURCE P61-P67.agc:1058
//#		PUSHLOC AT PDL+0
// PORT: SOURCE P61-P67.agc:1059
//#
// PORT: SOURCE P61-P67.agc:1060
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE P61-P67.agc:1061
//#		TFFX			X					LEFT BY CALCTFF OR CALCTPER
// PORT: SOURCE P61-P67.agc:1062
//#		TFFTEM  E: (-59+2NR)	ARG					LEFT BY CALCTFF OR CALCTPER
// PORT: SOURCE P61-P67.agc:1063
//#			M: (-55+2NR)	WHERE ARG = LCF ZZ SGN(DELF) OR ARG = LCP/ALFA SGN(DELF)
// PORT: SOURCE P61-P67.agc:1064
//#		NRTERM	E: (-29+NR)	M  NORM LENGTH OF TERMINAL RADIUS	LEFT BY CALCTFF OR CALCTPER
// PORT: SOURCE P61-P67.agc:1065
//#			M: (-27+NR)
// PORT: SOURCE P61-P67.agc:1066
//#		NRMAG	E: (-29+NR)	M  NORM LENGTH OF PRESENT POSITION	LEFT BY TFFCONIC
// PORT: SOURCE P61-P67.agc:1067
//#			M: (-27+NR)
// PORT: SOURCE P61-P67.agc:1068
//#
// PORT: SOURCE P61-P67.agc:1069
//# DEBRIS:	QPRET, CDELF/2
// PORT: SOURCE P61-P67.agc:1070
//
// PORT: SOURCE P61-P67.agc:1071
//		BANK	27
// PORT: SOURCE P61-P67.agc:1072
//		SETLOC	P60S5
// PORT: SOURCE P61-P67.agc:1073
//		BANK
// PORT: SOURCE P61-P67.agc:1074
//TFF/TRIG	DLOAD	SR1
// PORT: Fixed ROM slots 26009.
    26009, 58058
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:1075
//			TFFX
// PORT: Fixed ROM slots 26010.
    26010, 70,
// PORT: SOURCE P61-P67.agc:1076
//		DAD	DMP
// PORT: Fixed ROM slots 26011.
    26011, 34074,
// PORT: SOURCE P61-P67.agc:1077
//			HIDPHALF
// PORT: Fixed ROM slots 26012.
    26012, 13750,
// PORT: SOURCE P61-P67.agc:1078
//			NRMAG		# RMAG M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 26013.
    26013, 66,
// PORT: SOURCE P61-P67.agc:1079
//		DMP	BDDV
// PORT: Fixed ROM slots 26014.
    26014, 46346,
// PORT: SOURCE P61-P67.agc:1080
//			NRTERM		# RTERM M		E: (-29+NR)	M: (-27+NR)
// PORT: Fixed ROM slots 26015.
    26015, 34,
// PORT: SOURCE P61-P67.agc:1081
//			TFFTEM		# P ZSQ OR P/ALFA	E: (-59+2NR)	M: (-55+2NR)
// PORT: Fixed ROM slots 26016.
    26016, 74,
// PORT: SOURCE P61-P67.agc:1082
//		ABS	BDSU		# THE SIGN IS FOR SDELF.
// PORT: Fixed ROM slots 26017.
    26017, 37196,
// PORT: SOURCE P61-P67.agc:1083
//			HIDPHALF
// PORT: Fixed ROM slots 26018.
    26018, 13750,
// PORT: SOURCE P61-P67.agc:1084
//		STORE	CDELF/2		# .5 COS(THETA)
// PORT: Fixed ROM slots 26019.
    26019, 30,
// PORT: SOURCE P61-P67.agc:1085
//		DSQ	DCOMP		# KEEP HONEST FOR SQRT.
// PORT: Fixed ROM slots 26020.
    26020, 48796,
// PORT: SOURCE P61-P67.agc:1086
//# Page 816
// PORT: SOURCE P61-P67.agc:1087
//		DAD	SQRT
// PORT: Fixed ROM slots 26021.
    26021, 63002,
// PORT: SOURCE P61-P67.agc:1088
//			HIDP1/4
// PORT: Fixed ROM slots 26022.
    26022, 13738,
// PORT: SOURCE P61-P67.agc:1089
//DUMPTRIG	SIGN	RVQ
// PORT: Fixed ROM slots 26023.
    26023, 36586,
// PORT: SOURCE P61-P67.agc:1090
//			TFFTEM		# AFFIX SIGN(DELE/2)
// PORT: Fixed ROM slots 26024.
    26024, 74,
// PORT: SOURCE P61-P67.agc:1091
//					# RETURN WITH .5 SIN(THETA) IN MPAC
// PORT: SOURCE P61-P67.agc:1092
//
// PORT: SOURCE P61-P67.agc:1093
//					#			16W	15MS
// PORT: SOURCE P61-P67.agc:1094
//
// PORT: SOURCE P61-P67.agc:1095
//DISPTARG	STQ			# C(MPAC = TRGO ESTIMATE
// PORT: Fixed ROM slots 26025.
    26025, 65312,
// PORT: SOURCE P61-P67.agc:1096
//			60GENRET
// PORT: Fixed ROM slots 26026.
    26026, 3574,
// PORT: SOURCE P61-P67.agc:1097
//		DMP	DSU
// PORT: Fixed ROM slots 26027.
    26027, 38154,
// PORT: SOURCE P61-P67.agc:1098
//			KTETA1
// PORT: Fixed ROM slots 26028.
    26028, 13318,
// PORT: SOURCE P61-P67.agc:1099
//			TTE1
// PORT: Fixed ROM slots 26029.
    26029, 4022,
// PORT: SOURCE P61-P67.agc:1100
//		STCALL	DTEAROT
// PORT: Fixed ROM slots 26030.
    26030, 32524,
// PORT: SOURCE P61-P67.agc:1101
//			EARROT2
// PORT: Fixed ROM slots 26031.
    26031, 39210,
// PORT: SOURCE P61-P67.agc:1102
//		CALL
// PORT: Fixed ROM slots 26032.
    26032, 65320,
// PORT: SOURCE P61-P67.agc:1103
//			VRCALC
// PORT: Fixed ROM slots 26033.
    26033, 47976,
// PORT: SOURCE P61-P67.agc:1104
//		GOTO
// PORT: Fixed ROM slots 26034.
    26034, 65360,
// PORT: SOURCE P61-P67.agc:1105
//			60GENRET
// PORT: Fixed ROM slots 26035.
    26035, 3574,
// PORT: SOURCE P61-P67.agc:1106
//VRCALC		VLOAD	DOT
// PORT: Fixed ROM slots 26036.
    26036, 41466,
// PORT: SOURCE P61-P67.agc:1107
//			URH
// PORT: Fixed ROM slots 26037.
    26037, 3780,
// PORT: SOURCE P61-P67.agc:1108
//			RT
// PORT: Fixed ROM slots 26038.
    26038, 3704,
// PORT: SOURCE P61-P67.agc:1109
//		SL2	ACOS
// PORT: Fixed ROM slots 26039.
    26039, 54932,
// PORT: SOURCE P61-P67.agc:1110
//		RVQ
// PORT: Fixed ROM slots 26040.
    26040, 65308,
// PORT: SOURCE P61-P67.agc:1111
//
// PORT: SOURCE P61-P67.agc:1112
//# END OF PROGRAM S61.2
// PORT: SOURCE P61-P67.agc:1113
//
// PORT: SOURCE P61-P67.agc:1114
//# Page 817
// PORT: SOURCE P61-P67.agc:1115
//# PROGRAM DESCRIPTION S62.3	DATE 10JAN67
// PORT: SOURCE P61-P67.agc:1116
//# MOD NO 1:			LOG SECTION P60-P67
// PORT: SOURCE P61-P67.agc:1117
//# MOD BY ZELDIN
// PORT: SOURCE P61-P67.agc:1118
//# MOD NO: 2	MOD BY: RR BAIRNSFATHER		DATE: 15 MAY 67		CHANGED TO REF COORDS.
// PORT: SOURCE P61-P67.agc:1119
//# MOD NO: 3	MOD BY: RR BAIRNSFATHER		DATE: 17 JAN 68		ALFAPAD CHANGES MADE.
// PORT: SOURCE P61-P67.agc:1120
//#
// PORT: SOURCE P61-P67.agc:1121
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P61-P67.agc:1122
//#
// PORT: SOURCE P61-P67.agc:1123
//#	COMPUTE DESIRED GIMBAL ANGLES FOR ENTRY ATTITUDE
// PORT: SOURCE P61-P67.agc:1124
//#	THE FOLLOWING TRAJECTORY TRIAD IS AVAILABLE IN MEMORY AND IS COMPUTED EACH 2 SECONDS BY CM/POSE IN
// PORT: SOURCE P61-P67.agc:1125
//#	REFERENCE COORDINATES (V = VELOCITY RELATIVE TO EARTH):
// PORT: SOURCE P61-P67.agc:1126
//#
// PORT: SOURCE P61-P67.agc:1127
//#		UXA = -UNIT(V)
// PORT: SOURCE P61-P67.agc:1128
//#		UYA =  UNIT(V*R)
// PORT: SOURCE P61-P67.agc:1129
//#		UZA =  UXA*UYA
// PORT: SOURCE P61-P67.agc:1130
//#
// PORT: SOURCE P61-P67.agc:1131
//# 	GENERATE A DESIRED BODY TRIAD FOR TRIMMED FLIGHT WITH RESPECT TO THE RELATIVE VELOCITY VECTOR, USING
// PORT: SOURCE P61-P67.agc:1132
//#	ROLL COMMAND AND TRIM ANGLE OF ATTACK:
// PORT: SOURCE P61-P67.agc:1133
//#
// PORT: SOURCE P61-P67.agc:1134
//#		UXD = UNIT(UYD*UXA) SIN(ALFATRIM) + UXA COS(ALFATRIM)
// PORT: SOURCE P61-P67.agc:1135
//#		UYD = UYA COS(ROLLC) + UZA SIN(ROLLC)
// PORT: SOURCE P61-P67.agc:1136
//#		UZD = UXD * UYD
// PORT: SOURCE P61-P67.agc:1137
//#
// PORT: SOURCE P61-P67.agc:1138
//#	USE THE DESIRED SET (IN REFERENCE COORDS) AND REFSMMAT TO CALL  CALCGA  AND OBTAIN GIMBAL ANGLES
// PORT: SOURCE P61-P67.agc:1139
//#	IN 2S, C IN MPAC, +2 AND THETAD, +2.
// PORT: SOURCE P61-P67.agc:1140
//#
// PORT: SOURCE P61-P67.agc:1141
//# CALLING SEQUENCE
// PORT: SOURCE P61-P67.agc:1142
//#
// PORT: SOURCE P61-P67.agc:1143
//#	L	CALL
// PORT: SOURCE P61-P67.agc:1144
//#	L+1		S62.3
// PORT: SOURCE P61-P67.agc:1145
//#
// PORT: SOURCE P61-P67.agc:1146
//# NORMAL EXIT MODE
// PORT: SOURCE P61-P67.agc:1147
//#
// PORT: SOURCE P61-P67.agc:1148
//#	RETURN VIA QPRET DIRECTLY FROM CALCGA.
// PORT: SOURCE P61-P67.agc:1149
//#
// PORT: SOURCE P61-P67.agc:1150
//# SUBROUTINES CALLED
// PORT: SOURCE P61-P67.agc:1151
//#
// PORT: SOURCE P61-P67.agc:1152
//#	CALCGA
// PORT: SOURCE P61-P67.agc:1153
//#
// PORT: SOURCE P61-P67.agc:1154
//# ALARM OR ABORT MODES
// PORT: SOURCE P61-P67.agc:1155
//#
// PORT: SOURCE P61-P67.agc:1156
//#	NONE
// PORT: SOURCE P61-P67.agc:1157
//#
// PORT: SOURCE P61-P67.agc:1158
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P61-P67.agc:1159
//#
// PORT: SOURCE P61-P67.agc:1160
//#	ROLLC	ROLL COMMAND		DP 1'S COMP AT 1REV
// PORT: SOURCE P61-P67.agc:1161
//#	ALFAPAD	SP 1'S C / 180		LEFT BY PAD LOAD	ALFATRIM IS NEGATIVE.
// PORT: SOURCE P61-P67.agc:1162
//#	UXA/2	REF COORDS		LEFT BY CM/POSE
// PORT: SOURCE P61-P67.agc:1163
//#	UYA/2	REF COORDS		LEFT BY CM/POSE
// PORT: SOURCE P61-P67.agc:1164
//#	UZA/2	REF COORDS		LEFT BY CM/POSE
// PORT: SOURCE P61-P67.agc:1165
//#
// PORT: SOURCE P61-P67.agc:1166
//# OUTPUT
// PORT: SOURCE P61-P67.agc:1167
//#
// PORT: SOURCE P61-P67.agc:1168
//#	CPHI	GIMBAL ANGLES (O,I,M) 2'S COMP TP (O,I,M)/180
// PORT: SOURCE P61-P67.agc:1169
//#
// PORT: SOURCE P61-P67.agc:1170
//# DEBRIS
// PORT: SOURCE P61-P67.agc:1171
//#
// PORT: SOURCE P61-P67.agc:1172
//#	QTEMP, QPRET, PUSHLIST
// PORT: SOURCE P61-P67.agc:1173
//
// PORT: SOURCE P61-P67.agc:1174
//		BANK	10
// PORT: SOURCE P61-P67.agc:1175
//		SETLOC	P60S4
// PORT: SOURCE P61-P67.agc:1176
//		BANK
// PORT: SOURCE P61-P67.agc:1177
//# Page 818
// PORT: SOURCE P61-P67.agc:1178
//		COUNT*	$$/S62.3
// PORT: SOURCE P61-P67.agc:1179
//
// PORT: SOURCE P61-P67.agc:1180
//S62.3		SETPD	SLOAD
// PORT: Fixed ROM slots 10494.
    10494, 56578,
// PORT: SOURCE P61-P67.agc:1181
//			0
// PORT: Fixed ROM slots 10495.
    10495, 2,
// PORT: SOURCE P61-P67.agc:1182
//			ALFAPAD		# ALFATRIM / 180, ALFA IS NEG.
// PORT: Fixed ROM slots 10496.
    10496, 3092,
// PORT: SOURCE P61-P67.agc:1183
//		SR1	PUSH
// PORT: Fixed ROM slots 10497.
    10497, 34500,
// PORT: SOURCE P61-P67.agc:1184
//		COS	PDDL		# XCH PDL, COS TO PDL0
// PORT: Fixed ROM slots 10498.
    10498, 54732,
// PORT: SOURCE P61-P67.agc:1185
//		SIN	PDDL		# SIN TO PDL2
// PORT: Fixed ROM slots 10499.
    10499, 54748,
// PORT: SOURCE P61-P67.agc:1186
//			ROLLC
// PORT: Fixed ROM slots 10500.
    10500, 3484,
// PORT: SOURCE P61-P67.agc:1187
//		COS	VXSC
// PORT: Fixed ROM slots 10501.
    10501, 61900,
// PORT: SOURCE P61-P67.agc:1188
//			UYA/2		#				REF COORDS
// PORT: Fixed ROM slots 10502.
    10502, 3792,
// PORT: SOURCE P61-P67.agc:1189
//		PDDL	SIN		# PUSH VECTOR INTO PDL4...9
// PORT: Fixed ROM slots 10503.
    10503, 61098,
// PORT: SOURCE P61-P67.agc:1190
//			ROLLC
// PORT: Fixed ROM slots 10504.
    10504, 3484,
// PORT: SOURCE P61-P67.agc:1191
//		VXSC	VAD
// PORT: Fixed ROM slots 10505.
    10505, 44514,
// PORT: SOURCE P61-P67.agc:1192
//			UZA/2		#				REF COORDS
// PORT: Fixed ROM slots 10506.
    10506, 3804,
// PORT: SOURCE P61-P67.agc:1193
//					# VECTOR FROM PDL4...9
// PORT: SOURCE P61-P67.agc:1194
//		VSL1
// PORT: Fixed ROM slots 10507.
    10507, 65524,
// PORT: SOURCE P61-P67.agc:1195
//		STORE	YNB		# = UYD				REF COORDS
// PORT: Fixed ROM slots 10508.
    10508, 2980,
// PORT: SOURCE P61-P67.agc:1196
//
// PORT: SOURCE P61-P67.agc:1197
//		VXV	VSL1
// PORT: Fixed ROM slots 10509.
    10509, 64058,
// PORT: SOURCE P61-P67.agc:1198
//			UXA/2		#				REF COORDS
// PORT: Fixed ROM slots 10510.
    10510, 3780,
// PORT: SOURCE P61-P67.agc:1199
//		VXSC	PDDL
// PORT: Fixed ROM slots 10511.
    10511, 54754,
// PORT: SOURCE P61-P67.agc:1200
//					# SIN TRIM FROM PDL2
// PORT: SOURCE P61-P67.agc:1201
//					# XCH PDL0 FOR COS TRIM
// PORT: SOURCE P61-P67.agc:1202
//		VXSC	VAD
// PORT: Fixed ROM slots 10512.
    10512, 44514
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P61-P67.agc:1203
//			UXA/2		#				REF COORDS
// PORT: Fixed ROM slots 10513.
    10513, 3780,
// PORT: SOURCE P61-P67.agc:1204
//					# FROM PDL0
// PORT: SOURCE P61-P67.agc:1205
//		VSL1
// PORT: Fixed ROM slots 10514.
    10514, 65524,
// PORT: SOURCE P61-P67.agc:1206
//		STORE	XNB		# X SC AXIS (.5 UNIT)		REF COORDS
// PORT: Fixed ROM slots 10515.
    10515, 2968,
// PORT: SOURCE P61-P67.agc:1207
//
// PORT: SOURCE P61-P67.agc:1208
//		VXV	VSL1
// PORT: Fixed ROM slots 10516.
    10516, 64058,
// PORT: SOURCE P61-P67.agc:1209
//			YNB
// PORT: Fixed ROM slots 10517.
    10517, 2980,
// PORT: SOURCE P61-P67.agc:1210
//		STOVL	ZNB		# Z SC IN REF COOR. SCALED AT 2
// PORT: Fixed ROM slots 10518.
    10518, 23472,
// PORT: SOURCE P61-P67.agc:1211
//			REFSMMAT
// PORT: Fixed ROM slots 10519.
    10519, 1980,
// PORT: SOURCE P61-P67.agc:1212
//		STOVL	XSM
// PORT: Fixed ROM slots 10520.
    10520, 23412,
// PORT: SOURCE P61-P67.agc:1213
//			REFSMMAT +6
// PORT: Fixed ROM slots 10521.
    10521, 1992,
// PORT: SOURCE P61-P67.agc:1214
//		STOVL	YSM
// PORT: Fixed ROM slots 10522.
    10522, 23424,
// PORT: SOURCE P61-P67.agc:1215
//			REFSMMAT +12D
// PORT: Fixed ROM slots 10523.
    10523, 2004,
// PORT: SOURCE P61-P67.agc:1216
//		STORE	ZSM
// PORT: Fixed ROM slots 10524.
    10524, 2956,
// PORT: SOURCE P61-P67.agc:1217
//
// PORT: SOURCE P61-P67.agc:1218
//		CLEAR	GOTO
// PORT: Fixed ROM slots 10525.
    10525, 43032,
// PORT: SOURCE P61-P67.agc:1219
//			CPHIFLAG	# CAUSE CALCGA TO STORE ANS IN TP CPHI
// PORT: Fixed ROM slots 10526.
    10526, 352,
// PORT: SOURCE P61-P67.agc:1220
//			CALCGA
// PORT: Fixed ROM slots 10527.
    10527, 40338
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P61-P67.agc:1221
//					# CALCGA WILL RETURN TO ORIGINAL CALLER
// PORT: SOURCE P61-P67.agc:1222
//					# VIA QPRET WITH 2'S COMP. ANGLES IN CPHI
// PORT: SOURCE P61-P67.agc:1223
//
// PORT: SOURCE P61-P67.agc:1224
//
// PORT: SOURCE P61-P67.agc:1225
//
