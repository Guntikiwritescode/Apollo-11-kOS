// PORT: Original source unit R31.agc.
// PORT: Physical bank 31. Shared continuation entries, slots 27648–27649.
function agcAotUnit1581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27648 {
// PORT: SOURCE R31.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE R31.agc:2
//# Filename:	R31.agc
// PORT: SOURCE R31.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE R31.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE R31.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE R31.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE R31.agc:7
//# Reference:    pp. 505-510
// PORT: SOURCE R31.agc:8
//# Contact:      Onno Hommes <ohommes@cmu.edu>
// PORT: SOURCE R31.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE R31.agc:10
//# Mod history:  2009-05-11 OH	Batch 2 Assignment Comanche Transcription
// PORT: SOURCE R31.agc:11
//#		2009-05-20 RSB	Corrected INSTALL -> INTSTALL
// PORT: SOURCE R31.agc:12
//#
// PORT: SOURCE R31.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE R31.agc:14
//# from scanned documents.
// PORT: SOURCE R31.agc:15
//#
// PORT: SOURCE R31.agc:16
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE R31.agc:17
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE R31.agc:18
//#
// PORT: SOURCE R31.agc:19
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE R31.agc:20
//#
// PORT: SOURCE R31.agc:21
//#       Prepared by
// PORT: SOURCE R31.agc:22
//#                       Massachusetts Institute of Technology
// PORT: SOURCE R31.agc:23
//#                       75 Cambridge Parkway
// PORT: SOURCE R31.agc:24
//#                       Cambridge, Massachusetts
// PORT: SOURCE R31.agc:25
//#
// PORT: SOURCE R31.agc:26
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE R31.agc:27
//#
// PORT: SOURCE R31.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE R31.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE R31.agc:30
//
// PORT: SOURCE R31.agc:31
//
// PORT: SOURCE R31.agc:32
//# Page 505
// PORT: SOURCE R31.agc:33
//		BANK	34
// PORT: SOURCE R31.agc:34
//		SETLOC	R31
// PORT: SOURCE R31.agc:35
//		BANK
// PORT: SOURCE R31.agc:36
//
// PORT: SOURCE R31.agc:37
//		COUNT*	$$/R31
// PORT: SOURCE R31.agc:38
//
// PORT: SOURCE R31.agc:39
//R31CALL		CAF	PRIO3
// PORT: Fixed ROM slots 27648.
        if slot <> 27648 or instruction <> 14895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2607), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R31.agc:40
//		TC	FINDVAC
// PORT: Fixed ROM slots 27649.
        if slot <> 27649 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1581] to agcAotUnit1581@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:41
//		EBANK=	SUBEXIT
// PORT: SOURCE R31.agc:42
//		2CADR	V83CALL
// PORT: Fixed ROM slots 27650 27651.
    27650, 2100, 27651, 51304
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27652–27653.
function agcAotUnit1582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27652 {
// PORT: SOURCE R31.agc:43
//
// PORT: SOURCE R31.agc:44
//DSPDELAY	CAF	1SEC
// PORT: Fixed ROM slots 27652.
        if slot <> 27652 or instruction <> 14881 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2593), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R31.agc:45
//		TC	BANKCALL
// PORT: Fixed ROM slots 27653.
        if slot <> 27653 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1582] to agcAotUnit1582@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:46
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 27654.
    27654, 1972
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27655–27666.
function agcAotUnit1583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27660 {
        if slot <= 27657 {
            if slot <= 27655 {
// PORT: SOURCE R31.agc:47
//		CA	EXTVBACT
// PORT: Fixed ROM slots 27655.
                if slot <> 27655 or instruction <> 12836 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27656 {
// PORT: SOURCE R31.agc:48
//		MASK	BIT12
// PORT: Fixed ROM slots 27656.
                    if slot <> 27656 or instruction <> 31236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                        if fixedOperand = 2048 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R31.agc:49
//		EXTEND
// PORT: Fixed ROM slots 27657.
                    if slot <> 27657 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27658 {
// PORT: SOURCE R31.agc:50
//		BZF	DSPDELAY
// PORT: Fixed ROM slots 27658.
                if slot <> 27658 or instruction <> 5124 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5124, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27659 {
// PORT: SOURCE R31.agc:51
//
// PORT: SOURCE R31.agc:52
//DISPN5X		CA	FLAGWRD9	# TEST R31FLAG (IN SUNDANCE R31FLAG WILL
// PORT: Fixed ROM slots 27659.
                    if slot <> 27659 or instruction <> 12357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 69).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R31.agc:53
//		MASK	BIT4		#     ALWAYS BE SET AS R34 DOES NOT EXIST)
// PORT: Fixed ROM slots 27660.
                    if slot <> 27660 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        if fixedOperand = 8 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
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
        if slot <= 27663 {
            if slot <= 27661 {
// PORT: SOURCE R31.agc:54
//		EXTEND
// PORT: Fixed ROM slots 27661.
                if slot <> 27661 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27662 {
// PORT: SOURCE R31.agc:55
//		BZF	+3
// PORT: Fixed ROM slots 27662.
                    if slot <> 27662 or instruction <> 5137 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5137, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R31.agc:56
//		CAF	V16N54		# R31	USE NOUN 54
// PORT: Fixed ROM slots 27663.
                    if slot <> 27663 or instruction <> 13406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1118), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27664 {
// PORT: SOURCE R31.agc:57
//		TC	+2
// PORT: Fixed ROM slots 27664.
                if slot <> 27664 or instruction <> 1042 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1042, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27665 {
// PORT: SOURCE R31.agc:58
//		CAF	V16N53		# R34	USE NOUN 53
// PORT: Fixed ROM slots 27665.
                    if slot <> 27665 or instruction <> 13407 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1119), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R31.agc:59
//		TC	BANKCALL
// PORT: Fixed ROM slots 27666.
                    if slot <> 27666 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1583] to agcAotUnit1583@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:60
//		CADR	GOMARKF
// PORT: Fixed ROM slots 27667.
    27667, 17122
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27668–27671.
function agcAotUnit1584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27669 {
        if slot <= 27668 {
// PORT: SOURCE R31.agc:61
//		TC	B5OFF
// PORT: Fixed ROM slots 27668.
            if slot <> 27668 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R31.agc:62
//		TC	B5OFF
// PORT: Fixed ROM slots 27669.
            if slot <> 27669 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27670 {
// PORT: SOURCE R31.agc:63
//		TCF	DISPN5X
// PORT: Fixed ROM slots 27670.
            if slot <> 27670 or instruction <> 5131 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5131, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R31.agc:64
//
// PORT: SOURCE R31.agc:65
//V83		TC	INTPRET
// PORT: Fixed ROM slots 27671.
            if slot <> 27671 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1584] to agcAotUnit1584@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:66
//		GOTO
// PORT: Fixed ROM slots 27672.
    27672, 65360,
// PORT: SOURCE R31.agc:67
//			HAVEBASE	# INTEG STATE VECTORS
// PORT: Fixed ROM slots 27673.
    27673, 51442
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27674–27674.
function agcAotUnit1585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R31.agc:68
//V83CALL		TC	INTPRET
// PORT: Fixed ROM slots 27674.
    if slot <> 27674 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1585] to agcAotUnit1585@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:69
//		GOTO
// PORT: Fixed ROM slots 27675.
    27675, 65360,
// PORT: SOURCE R31.agc:70
//			STATEXTP	# EXTRAPOLATE STATE VECTORS
// PORT: Fixed ROM slots 27676.
    27676, 51392,
// PORT: SOURCE R31.agc:71
//COMPDISP	VLOAD	VSU
// PORT: Fixed ROM slots 27677.
    27677, 43514,
// PORT: SOURCE R31.agc:72
//			RATT
// PORT: Fixed ROM slots 27678.
    27678, 2,
// PORT: SOURCE R31.agc:73
//			RONE
// PORT: Fixed ROM slots 27679.
    27679, 2478,
// PORT: SOURCE R31.agc:74
//		PUSH	ABVAL		# RATT-RONE TO 0D	PD= 6
// PORT: Fixed ROM slots 27680.
    27680, 42508,
// PORT: SOURCE R31.agc:75
//		STORE	RANGE		# METERS B-29
// PORT: Fixed ROM slots 27681.
    27681, 2466,
// PORT: SOURCE R31.agc:76
//		NORM	VLOAD
// PORT: Fixed ROM slots 27682.
    27682, 64898,
// PORT: SOURCE R31.agc:77
//			X1		# RATT-RONE		PD= 0
// PORT: Fixed ROM slots 27683.
    27683, 78,
// PORT: SOURCE R31.agc:78
//		VSR1
// PORT: Fixed ROM slots 27684.
    27684, 65508,
// PORT: SOURCE R31.agc:79
//		VSL*	UNIT
// PORT: Fixed ROM slots 27685.
    27685, 44638,
// PORT: SOURCE R31.agc:80
//			0,1
// PORT: Fixed ROM slots 27686.
    27686, 16642,
// PORT: SOURCE R31.agc:81
//		PDVL	VSU		# UNIT(LOS) TO 0D	PD= 6
// PORT: Fixed ROM slots 27687.
    27687, 43418,
// PORT: SOURCE R31.agc:82
//# Page 506
// PORT: SOURCE R31.agc:83
//			VATT
// PORT: Fixed ROM slots 27688.
    27688, 14,
// PORT: SOURCE R31.agc:84
//			VONE
// PORT: Fixed ROM slots 27689.
    27689, 2490,
// PORT: SOURCE R31.agc:85
//		DOT			# (VATT-VONE).UNIT(LOS)	PD= 0
// PORT: Fixed ROM slots 27690.
    27690, 65346,
// PORT: SOURCE R31.agc:86
//		SL1
// PORT: Fixed ROM slots 27691.
    27691, 65492,
// PORT: SOURCE R31.agc:87
//		STCALL	RRATE		# RANGE RATE M/CS B-7
// PORT: Fixed ROM slots 27692.
    27692, 31142,
// PORT: SOURCE R31.agc:88
//			CDUTRIG		# TO INITIALIZE FOR *NBSM*
// PORT: Fixed ROM slots 27693.
    27693, 40574,
// PORT: SOURCE R31.agc:89
//		CALL
// PORT: Fixed ROM slots 27694.
    27694, 65320,
// PORT: SOURCE R31.agc:90
//			R34LOS		# NOTE.  PDL MUST = 0.
// PORT: Fixed ROM slots 27695.
    27695, 51602,
// PORT: SOURCE R31.agc:91
//R34ANG		VLOAD	UNIT
// PORT: Fixed ROM slots 27696.
    27696, 44794,
// PORT: SOURCE R31.agc:92
//			RONE
// PORT: Fixed ROM slots 27697.
    27697, 2478,
// PORT: SOURCE R31.agc:93
//		PDVL			# UR TO 0D		PD= 6
// PORT: Fixed ROM slots 27698.
    27698, 65434,
// PORT: SOURCE R31.agc:94
//			THISAXIS	# UNITX FOR CM, UNITZ FOR LM
// PORT: Fixed ROM slots 27699.
    27699, 13750,
// PORT: SOURCE R31.agc:95
//		BON	VLOAD		# CHK R31FLAG.  ON=R31 THETA, OFF=R34 PHI
// PORT: Fixed ROM slots 27700.
    27700, 64792,
// PORT: SOURCE R31.agc:96
//			R31FLAG
// PORT: Fixed ROM slots 27701.
    27701, 5014,
// PORT: SOURCE R31.agc:97
//			+2		# R31-THETA
// PORT: Fixed ROM slots 27702.
    27702, 51312,
// PORT: SOURCE R31.agc:98
//			12D
// PORT: Fixed ROM slots 27703.
    27703, 26,
// PORT: SOURCE R31.agc:99
//		CALL
// PORT: Fixed ROM slots 27704.
    27704, 65320,
// PORT: SOURCE R31.agc:100
//			*NBSM*
// PORT: Fixed ROM slots 27705.
    27705, 40780,
// PORT: SOURCE R31.agc:101
//		VXM	PUSH		# UXORZ TO 6D		PD=12D
// PORT: Fixed ROM slots 27706.
    27706, 34442,
// PORT: SOURCE R31.agc:102
//			REFSMMAT
// PORT: Fixed ROM slots 27707.
    27707, 1980,
// PORT: SOURCE R31.agc:103
//		VPROJ	VSL2
// PORT: Fixed ROM slots 27708.
    27708, 59954,
// PORT: SOURCE R31.agc:104
//			0D
// PORT: Fixed ROM slots 27709.
    27709, 2,
// PORT: SOURCE R31.agc:105
//		BVSU	UNIT
// PORT: Fixed ROM slots 27710.
    27710, 44618,
// PORT: SOURCE R31.agc:106
//			6D
// PORT: Fixed ROM slots 27711.
    27711, 14,
// PORT: SOURCE R31.agc:107
//		PDVL	VXV		# UP/2 TO 12D		PD=18D
// PORT: Fixed ROM slots 27712.
    27712, 40346,
// PORT: SOURCE R31.agc:108
//			RONE
// PORT: Fixed ROM slots 27713.
    27713, 2478,
// PORT: SOURCE R31.agc:109
//			VONE
// PORT: Fixed ROM slots 27714.
    27714, 2490,
// PORT: SOURCE R31.agc:110
//		UNIT	VXV
// PORT: Fixed ROM slots 27715.
    27715, 40284,
// PORT: SOURCE R31.agc:111
//			RONE
// PORT: Fixed ROM slots 27716.
    27716, 2478,
// PORT: SOURCE R31.agc:112
//		DOT	PDVL		# SIGN TO 12D, UP/2 TO MPAC	PD=18D
// PORT: Fixed ROM slots 27717.
    27717, 52546,
// PORT: SOURCE R31.agc:113
//			12D
// PORT: Fixed ROM slots 27718.
    27718, 26,
// PORT: SOURCE R31.agc:114
//		VSL1	DOT		# UP.UXORZ
// PORT: Fixed ROM slots 27719.
    27719, 41460,
// PORT: SOURCE R31.agc:115
//			6D
// PORT: Fixed ROM slots 27720.
    27720, 14,
// PORT: SOURCE R31.agc:116
//		SIGN	SL1
// PORT: Fixed ROM slots 27721.
    27721, 60138,
// PORT: SOURCE R31.agc:117
//			12D
// PORT: Fixed ROM slots 27722.
    27722, 26,
// PORT: SOURCE R31.agc:118
//		ACOS
// PORT: Fixed ROM slots 27723.
    27723, 65452,
// PORT: SOURCE R31.agc:119
//		STOVL	RTHETA
// PORT: Fixed ROM slots 27724.
    27724, 22954,
// PORT: SOURCE R31.agc:120
//			RONE
// PORT: Fixed ROM slots 27725.
    27725, 2478,
// PORT: SOURCE R31.agc:121
//		DOT	BPL
// PORT: Fixed ROM slots 27726.
    27726, 42050,
// PORT: SOURCE R31.agc:122
//			6D
// PORT: Fixed ROM slots 27727.
    27727, 14,
// PORT: SOURCE R31.agc:123
//			+5
// PORT: Fixed ROM slots 27728.
    27728, 51370,
// PORT: SOURCE R31.agc:124
//		DLOAD	BDSU		# IF UXORZ.R NEG, RTHETA = 1 - RTHETA
// PORT: Fixed ROM slots 27729.
    27729, 37322,
// PORT: SOURCE R31.agc:125
//			RTHETA
// PORT: Fixed ROM slots 27730.
    27730, 2474,
// PORT: SOURCE R31.agc:126
//			DPPOSMAX
// PORT: Fixed ROM slots 27731.
    27731, 13766,
// PORT: SOURCE R31.agc:127
//		STORE	RTHETA		# RTHETA BETWEEN 0 AND 1 REV.
// PORT: Fixed ROM slots 27732.
    27732, 2474,
// PORT: SOURCE R31.agc:128
//		EXIT
// PORT: Fixed ROM slots 27733.
    27733, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27734–27741.
function agcAotUnit1586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27737 {
        if slot <= 27735 {
            if slot <= 27734 {
// PORT: SOURCE R31.agc:129
//		CAF	BIT5		# HAVE WE BEEN ANSWERED
// PORT: Fixed ROM slots 27734.
                if slot <> 27734 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R31.agc:130
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 27735.
                if slot <> 27735 or instruction <> 29220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27736 {
// PORT: SOURCE R31.agc:131
//		EXTEND
// PORT: Fixed ROM slots 27736.
                if slot <> 27736 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R31.agc:132
//		BZF	ENDEXT		# YES, DIE
// PORT: Fixed ROM slots 27737.
                if slot <> 27737 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27739 {
            if slot <= 27738 {
// PORT: SOURCE R31.agc:133
//# Page 507
// PORT: SOURCE R31.agc:134
//		CS	EXTVBACT
// PORT: Fixed ROM slots 27738.
                if slot <> 27738 or instruction <> 16932 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 548).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R31.agc:135
//		MASK	BIT12
// PORT: Fixed ROM slots 27739.
                if slot <> 27739 or instruction <> 31236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27740 {
// PORT: SOURCE R31.agc:136
//		ADS	EXTVBACT
// PORT: Fixed ROM slots 27740.
                if slot <> 27740 or instruction <> 11812 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R31.agc:137
//
// PORT: SOURCE R31.agc:138
//		TCF	V83
// PORT: Fixed ROM slots 27741.
                if slot <> 27741 or instruction <> 5143 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5143, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1586] to agcAotUnit1586@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:139
//V16N54		VN	1654
// PORT: Fixed ROM slots 27742.
    27742, 4204,
// PORT: SOURCE R31.agc:140
//V16N53		VN	1653
// PORT: Fixed ROM slots 27743.
    27743, 4202,
// PORT: SOURCE R31.agc:141
//
// PORT: SOURCE R31.agc:142
//# Page 508
// PORT: SOURCE R31.agc:143
//# STATEXTP DOES AN INITIAL PRECISION EXTRAPOLATION OF THE
// PORT: SOURCE R31.agc:144
//# LEM STATE VECTOR TO PRESENT TIME OR TO PIPTIME IF AV G
// PORT: SOURCE R31.agc:145
//# IS ON AND SAVES AS BASE VECTOR. IF AV G IS ON RN + VN
// PORT: SOURCE R31.agc:146
//# ARE USED AS THE CM STATE VECTOR AND THE INITIAL R RDOT
// PORT: SOURCE R31.agc:147
//# RTHETA ARE COMPUTED WITH NO FURTHER INTEGRATION. IF AV
// PORT: SOURCE R31.agc:148
//# G IS OFF A PRECISION EXTRAPOLATION IS MADE OF THE CM
// PORT: SOURCE R31.agc:149
//# STATE VECTOR TO PRESENT TIME AND.....
// PORT: SOURCE R31.agc:150
//#
// PORT: SOURCE R31.agc:151
//#   THE CM + LM STATE VECTORS ARE INTEGRATED TO PRES TIME
// PORT: SOURCE R31.agc:152
//#   USING PRECISION OR CONIC AS SURFFLAG IS SET OR CLEAR.
// PORT: SOURCE R31.agc:153
//#
// PORT: SOURCE R31.agc:154
//#   IF AV G IS ON THEN
// PORT: SOURCE R31.agc:155
//#     SUBSEQUENT PASSES WILL PROVIDE
// PORT: SOURCE R31.agc:156
//#     USE OF RN + VN AS CM STATE VECTOR AND THE LM STATE
// PORT: SOURCE R31.agc:157
//#     VECTOR WILL BE PRECISION INTEGRATED USING LEMPREC
// PORT: SOURCE R31.agc:158
//#
// PORT: SOURCE R31.agc:159
//#   IF SURFFLAG IS SET.
// PORT: SOURCE R31.agc:160
//#     CM STATE VECTOR RONE VONE + LM STATE VECTOR RATT
// PORT: SOURCE R31.agc:161
//#     VATT ARE USED IN COMPUTING R RDOT RTHETA.
// PORT: SOURCE R31.agc:162
//#
// PORT: SOURCE R31.agc:163
//
// PORT: SOURCE R31.agc:164
//STATEXTP	RTB	BOF		# INITIAL INTEGRATION
// PORT: Fixed ROM slots 27744.
    27744, 35896,
// PORT: SOURCE R31.agc:165
//			LOADTIME
// PORT: Fixed ROM slots 27745.
    27745, 38544,
// PORT: SOURCE R31.agc:166
//			V37FLAG
// PORT: Fixed ROM slots 27746.
    27746, 4050,
// PORT: SOURCE R31.agc:167
//			+3		# AV G OFF, USE PRES TIME
// PORT: Fixed ROM slots 27747.
    27747, 51404,
// PORT: SOURCE R31.agc:168
//		CALL
// PORT: Fixed ROM slots 27748.
    27748, 65320,
// PORT: SOURCE R31.agc:169
//			GETRVN		#      ON,  USE RN VN PIPTIME
// PORT: Fixed ROM slots 27749.
    27749, 51574,
// PORT: SOURCE R31.agc:170
//		STORE	BASETIME	# PRES TIME OR PIPTIME
// PORT: Fixed ROM slots 27750.
    27750, 2502,
// PORT: SOURCE R31.agc:171
//		STCALL	TDEC1
// PORT: Fixed ROM slots 27751.
    27751, 28738,
// PORT: SOURCE R31.agc:172
//			LEMPREC
// PORT: Fixed ROM slots 27752.
    27752, 23690,
// PORT: SOURCE R31.agc:173
//		VLOAD			# BASE VECTOR, LM
// PORT: Fixed ROM slots 27753.
    27753, 65530,
// PORT: SOURCE R31.agc:174
//			RATT1
// PORT: Fixed ROM slots 27754.
    27754, 30,
// PORT: SOURCE R31.agc:175
//		STOVL	BASEOTP		#   POS.
// PORT: Fixed ROM slots 27755.
    27755, 22826,
// PORT: SOURCE R31.agc:176
//			VATT1
// PORT: Fixed ROM slots 27756.
    27756, 42,
// PORT: SOURCE R31.agc:177
//		STORE	BASEOTV		#   VEL.
// PORT: Fixed ROM slots 27757.
    27757, 2370,
// PORT: SOURCE R31.agc:178
//		BON	DLOAD
// PORT: Fixed ROM slots 27758.
    27758, 58648,
// PORT: SOURCE R31.agc:179
//			V37FLAG
// PORT: Fixed ROM slots 27759.
    27759, 3986,
// PORT: SOURCE R31.agc:180
//			COMPDISP	# COMPUTE R RDOT RTHETA FROM
// PORT: Fixed ROM slots 27760.
    27760, 51258,
// PORT: SOURCE R31.agc:181
//					# RONE(RN) VONE(VN) RATT+VATT(LEMPREC)
// PORT: SOURCE R31.agc:182
//			TAT
// PORT: Fixed ROM slots 27761.
    27761, 26,
// PORT: SOURCE R31.agc:183
//		STCALL	TDEC1
// PORT: Fixed ROM slots 27762.
    27762, 28738,
// PORT: SOURCE R31.agc:184
//			CSMPREC
// PORT: Fixed ROM slots 27763.
    27763, 23666,
// PORT: SOURCE R31.agc:185
//		VLOAD			# BASE VECTOR, CM
// PORT: Fixed ROM slots 27764.
    27764, 65530,
// PORT: SOURCE R31.agc:186
//			RATT1
// PORT: Fixed ROM slots 27765.
    27765, 30,
// PORT: SOURCE R31.agc:187
//		STOVL	BASETHP		#  POS.
// PORT: Fixed ROM slots 27766.
    27766, 22874,
// PORT: SOURCE R31.agc:188
//			VATT1
// PORT: Fixed ROM slots 27767.
    27767, 42,
// PORT: SOURCE R31.agc:189
//		STORE	BASETHV		#  VEL.
// PORT: Fixed ROM slots 27768.
    27768, 2406,
// PORT: SOURCE R31.agc:190
//HAVEBASE	BON	RTB		# SUBSEQUENT INTEGRATIONS
// PORT: Fixed ROM slots 27769.
    27769, 39960,
// PORT: SOURCE R31.agc:191
//			V37FLAG
// PORT: Fixed ROM slots 27770.
    27770, 3986,
// PORT: SOURCE R31.agc:192
//			GETRVN5
// PORT: Fixed ROM slots 27771.
    27771, 51548,
// PORT: SOURCE R31.agc:193
//			LOADTIME
// PORT: Fixed ROM slots 27772.
    27772, 38544,
// PORT: SOURCE R31.agc:194
//		STCALL	TDEC1		# AV G OFF. SET INTEG. OF CM
// PORT: Fixed ROM slots 27773.
    27773, 28738,
// PORT: SOURCE R31.agc:195
//			INTSTALL
// PORT: Fixed ROM slots 27774.
    27774, 24132,
// PORT: SOURCE R31.agc:196
//		VLOAD	CLEAR
// PORT: Fixed ROM slots 27775.
    27775, 36090,
// PORT: SOURCE R31.agc:197
//			BASETHP
// PORT: Fixed ROM slots 27776.
    27776, 2394,
// PORT: SOURCE R31.agc:198
//# Page 509
// PORT: SOURCE R31.agc:199
//			MOONFLAG
// PORT: Fixed ROM slots 27777.
    27777, 358,
// PORT: SOURCE R31.agc:200
//		STOVL	RCV
// PORT: Fixed ROM slots 27778.
    27778, 22202,
// PORT: SOURCE R31.agc:201
//			BASETHV
// PORT: Fixed ROM slots 27779.
    27779, 2406,
// PORT: SOURCE R31.agc:202
//		STODL	VCV
// PORT: Fixed ROM slots 27780.
    27780, 14022,
// PORT: SOURCE R31.agc:203
//			BASETIME
// PORT: Fixed ROM slots 27781.
    27781, 2502,
// PORT: SOURCE R31.agc:204
//		BOF	SET		# GET APPROPRIATE MOONFLAG SETTING
// PORT: Fixed ROM slots 27782.
    27782, 35864,
// PORT: SOURCE R31.agc:205
//			MOONTHIS
// PORT: Fixed ROM slots 27783.
    27783, 4550,
// PORT: SOURCE R31.agc:206
//			+2
// PORT: Fixed ROM slots 27784.
    27784, 51476,
// PORT: SOURCE R31.agc:207
//			MOONFLAG
// PORT: Fixed ROM slots 27785.
    27785, 102,
// PORT: SOURCE R31.agc:208
//		CLEAR
// PORT: Fixed ROM slots 27786.
    27786, 65304,
// PORT: SOURCE R31.agc:209
//			INTYPFLG
// PORT: Fixed ROM slots 27787.
    27787, 1910,
// PORT: SOURCE R31.agc:210
//		BON	SET
// PORT: Fixed ROM slots 27788.
    27788, 35864,
// PORT: SOURCE R31.agc:211
//			SURFFLAG
// PORT: Fixed ROM slots 27789.
    27789, 4494,
// PORT: SOURCE R31.agc:212
//			+2		# PREC. IF LM DOWN
// PORT: Fixed ROM slots 27790.
    27790, 51488,
// PORT: SOURCE R31.agc:213
//			INTYPFLG	# CONIC IF LM NOT DOWN
// PORT: Fixed ROM slots 27791.
    27791, 1654,
// PORT: SOURCE R31.agc:214
//		STCALL	TET
// PORT: Fixed ROM slots 27792.
    27792, 30366,
// PORT: SOURCE R31.agc:215
//			INTEGRVS	# INTEGRATION --- AT LAST---
// PORT: Fixed ROM slots 27793.
    27793, 23738,
// PORT: SOURCE R31.agc:216
//		VLOAD
// PORT: Fixed ROM slots 27794.
    27794, 65530,
// PORT: SOURCE R31.agc:217
//			RATT
// PORT: Fixed ROM slots 27795.
    27795, 2,
// PORT: SOURCE R31.agc:218
//		STOVL	RONE
// PORT: Fixed ROM slots 27796.
    27796, 22958,
// PORT: SOURCE R31.agc:219
//			VATT
// PORT: Fixed ROM slots 27797.
    27797, 14,
// PORT: SOURCE R31.agc:220
//		STODL	VONE		# GET SET FOR CONIC EXTRAP.,OTHER
// PORT: Fixed ROM slots 27798.
    27798, 14778,
// PORT: SOURCE R31.agc:221
//			TAT
// PORT: Fixed ROM slots 27799.
    27799, 26,
// PORT: SOURCE R31.agc:222
//		BON	CALL
// PORT: Fixed ROM slots 27800.
    27800, 37912,
// PORT: SOURCE R31.agc:223
//			SURFFLAG
// PORT: Fixed ROM slots 27801.
    27801, 4494,
// PORT: SOURCE R31.agc:224
//			GETRVN6		# LEMPREC IF LM DOWN
// PORT: Fixed ROM slots 27802.
    27802, 51566,
// PORT: SOURCE R31.agc:225
//			INTSTALL	# ..CONIC IF NOT DOWN
// PORT: Fixed ROM slots 27803.
    27803, 24132,
// PORT: SOURCE R31.agc:226
//		SET
// PORT: Fixed ROM slots 27804.
    27804, 65304,
// PORT: SOURCE R31.agc:227
//			INTYPFLG
// PORT: Fixed ROM slots 27805.
    27805, 1654,
// PORT: SOURCE R31.agc:228
//OTHINT		STORE	TDEC1		# ENTERED IF AV G ON TO INTEG LM
// PORT: Fixed ROM slots 27806.
    27806, 66,
// PORT: SOURCE R31.agc:229
//		VLOAD	CLEAR
// PORT: Fixed ROM slots 27807.
    27807, 36090,
// PORT: SOURCE R31.agc:230
//			BASEOTP
// PORT: Fixed ROM slots 27808.
    27808, 2346,
// PORT: SOURCE R31.agc:231
//			MOONFLAG
// PORT: Fixed ROM slots 27809.
    27809, 358,
// PORT: SOURCE R31.agc:232
//		STOVL	RCV
// PORT: Fixed ROM slots 27810.
    27810, 22202,
// PORT: SOURCE R31.agc:233
//			BASEOTV
// PORT: Fixed ROM slots 27811.
    27811, 2370,
// PORT: SOURCE R31.agc:234
//		STODL	VCV
// PORT: Fixed ROM slots 27812.
    27812, 14022,
// PORT: SOURCE R31.agc:235
//			BASETIME
// PORT: Fixed ROM slots 27813.
    27813, 2502,
// PORT: SOURCE R31.agc:236
//		BOF	SET
// PORT: Fixed ROM slots 27814.
    27814, 35864,
// PORT: SOURCE R31.agc:237
//			MOONTHIS
// PORT: Fixed ROM slots 27815.
    27815, 4550,
// PORT: SOURCE R31.agc:238
//			+2
// PORT: Fixed ROM slots 27816.
    27816, 51540,
// PORT: SOURCE R31.agc:239
//			MOONFLAG
// PORT: Fixed ROM slots 27817.
    27817, 102,
// PORT: SOURCE R31.agc:240
//		STCALL	TET
// PORT: Fixed ROM slots 27818.
    27818, 30366,
// PORT: SOURCE R31.agc:241
//			INTEGRVS
// PORT: Fixed ROM slots 27819.
    27819, 23738,
// PORT: SOURCE R31.agc:242
//		GOTO
// PORT: Fixed ROM slots 27820.
    27820, 65360,
// PORT: SOURCE R31.agc:243
//			COMPDISP	# COMPUTE R RDOT RTHETA
// PORT: Fixed ROM slots 27821.
    27821, 51258,
// PORT: SOURCE R31.agc:244
//GETRVN5		CALL			# AV G ON
// PORT: Fixed ROM slots 27822.
    27822, 65320,
// PORT: SOURCE R31.agc:245
//			GETRVN
// PORT: Fixed ROM slots 27823.
    27823, 51574,
// PORT: SOURCE R31.agc:246
//		BON	CALL
// PORT: Fixed ROM slots 27824.
    27824, 37912,
// PORT: SOURCE R31.agc:247
//			SURFFLAG
// PORT: Fixed ROM slots 27825.
    27825, 4494,
// PORT: SOURCE R31.agc:248
//			GETRVN6		# LM DOWN, LMPREC
// PORT: Fixed ROM slots 27826.
    27826, 51566,
// PORT: SOURCE R31.agc:249
//# Page 510
// PORT: SOURCE R31.agc:250
//			INTSTALL
// PORT: Fixed ROM slots 27827.
    27827, 24132,
// PORT: SOURCE R31.agc:251
//		CLEAR	GOTO
// PORT: Fixed ROM slots 27828.
    27828, 43032,
// PORT: SOURCE R31.agc:252
//			INTYPFLG
// PORT: Fixed ROM slots 27829.
    27829, 1910,
// PORT: SOURCE R31.agc:253
//			OTHINT
// PORT: Fixed ROM slots 27830.
    27830, 51516,
// PORT: SOURCE R31.agc:254
//GETRVN6		STCALL	TDEC1
// PORT: Fixed ROM slots 27831.
    27831, 28738,
// PORT: SOURCE R31.agc:255
//			LEMPREC
// PORT: Fixed ROM slots 27832.
    27832, 23690,
// PORT: SOURCE R31.agc:256
//		GOTO
// PORT: Fixed ROM slots 27833.
    27833, 65360,
// PORT: SOURCE R31.agc:257
//			COMPDISP	# COMPUTE R RDOT RTHETA
// PORT: Fixed ROM slots 27834.
    27834, 51258,
// PORT: SOURCE R31.agc:258
//GETRVN		STQ
// PORT: Fixed ROM slots 27835.
    27835, 65312,
// PORT: SOURCE R31.agc:259
//			0D
// PORT: Fixed ROM slots 27836.
    27836, 0,
// PORT: SOURCE R31.agc:260
//		VLOAD	GOTO		# AV G ON, RONE = RN VONE = VN
// PORT: Fixed ROM slots 27837.
    27837, 43258,
// PORT: SOURCE R31.agc:261
//			RN		#  AND USE PIPTIME
// PORT: Fixed ROM slots 27838.
    27838, 1266,
// PORT: SOURCE R31.agc:262
//			+1
// PORT: Fixed ROM slots 27839.
    27839, 51584,
// PORT: SOURCE R31.agc:263
//		STCALL	RONE
// PORT: Fixed ROM slots 27840.
    27840, 31150,
// PORT: SOURCE R31.agc:264
//			+1
// PORT: Fixed ROM slots 27841.
    27841, 51588,
// PORT: SOURCE R31.agc:265
//		VLOAD	GOTO
// PORT: Fixed ROM slots 27842.
    27842, 43258,
// PORT: SOURCE R31.agc:266
//			VN
// PORT: Fixed ROM slots 27843.
    27843, 1278
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:267
//			+1
// PORT: Fixed ROM slots 27844.
    27844, 51594,
// PORT: SOURCE R31.agc:268
//		STODL	VONE
// PORT: Fixed ROM slots 27845.
    27845, 14778,
// PORT: SOURCE R31.agc:269
//			PIPTIME
// PORT: Fixed ROM slots 27846.
    27846, 1290,
// PORT: SOURCE R31.agc:270
//		GOTO
// PORT: Fixed ROM slots 27847.
    27847, 65360,
// PORT: SOURCE R31.agc:271
//			0D
// PORT: Fixed ROM slots 27848.
    27848, 0,
// PORT: SOURCE R31.agc:272
//		SETLOC	R34
// PORT: SOURCE R31.agc:273
//		BANK
// PORT: SOURCE R31.agc:274
//R34LOS		EXIT
// PORT: Fixed ROM slots 27849.
    27849, 65532
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27850–27851.
function agcAotUnit1587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27850 {
// PORT: SOURCE R31.agc:275
//		CA	CDUS
// PORT: Fixed ROM slots 27850.
        if slot <> 27850 or instruction <> 12318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 30).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R31.agc:276
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 27851.
        if slot <> 27851 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1587] to agcAotUnit1587@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:277
//		TS	9D
// PORT: Fixed ROM slots 27852.
    27852, 45074
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27853–27854.
function agcAotUnit1588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27853 {
// PORT: SOURCE R31.agc:278
//		CA	CDUT
// PORT: Fixed ROM slots 27853.
        if slot <> 27853 or instruction <> 12317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 29).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R31.agc:279
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 27854.
        if slot <> 27854 or instruction <> 20560 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20560, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1588] to agcAotUnit1588@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:280
//		TS	11D
// PORT: Fixed ROM slots 27855.
    27855, 45078
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27856–27859.
function agcAotUnit1589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27857 {
        if slot <= 27856 {
// PORT: SOURCE R31.agc:281
//		CA	FIXLOC
// PORT: Fixed ROM slots 27856.
            if slot <> 27856 or instruction <> 12368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 80).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R31.agc:282
//		AD	SIX
// PORT: Fixed ROM slots 27857.
            if slot <> 27857 or instruction <> 27785 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27858 {
// PORT: SOURCE R31.agc:283
//		COM
// PORT: Fixed ROM slots 27858.
            if slot <> 27858 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R31.agc:284
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 27859.
            if slot <> 27859 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1589] to agcAotUnit1589@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:285
//		TS	X1
// PORT: Fixed ROM slots 27860.
    27860, 45132
)).

// PORT: Physical bank 31. Shared continuation entries, slots 27861–27861.
function agcAotUnit1590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R31.agc:286
//		TC	INTPRET
// PORT: Fixed ROM slots 27861.
    if slot <> 27861 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1590] to agcAotUnit1590@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R31.agc:287
//		CALL
// PORT: Fixed ROM slots 27862.
    27862, 65320,
// PORT: SOURCE R31.agc:288
//			SXTNB
// PORT: Fixed ROM slots 27863.
    27863, 38912,
// PORT: SOURCE R31.agc:289
//		STCALL	12D
// PORT: Fixed ROM slots 27864.
    27864, 28698,
// PORT: SOURCE R31.agc:290
//			R34ANG
// PORT: Fixed ROM slots 27865.
    27865, 51296
)).

