// R31.agc
// bank 31, slots 27648-27649
function agcAotUnit1581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27648 {
// R31.agc:1
//# Copyright:	Public domain.
// R31.agc:2
//# Filename:	R31.agc
// R31.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// R31.agc:4
//#               is part of the source code for the Command Module's
// R31.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// R31.agc:6
//# Assembler:    yaYUL
// R31.agc:7
//# Reference:    pp. 505-510
// R31.agc:8
//# Contact:      Onno Hommes <ohommes@cmu.edu>
// R31.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// R31.agc:10
//# Mod history:  2009-05-11 OH	Batch 2 Assignment Comanche Transcription
// R31.agc:11
//#		2009-05-20 RSB	Corrected INSTALL -> INTSTALL
// R31.agc:12
//#
// R31.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// R31.agc:14
//# from scanned documents.
// R31.agc:15
//#
// R31.agc:16
//#       Assemble revision 055 of AGC program Comanche by NASA
// R31.agc:17
//#       2021113-051.  April 1, 1969.
// R31.agc:18
//#
// R31.agc:19
//#       This AGC program shall also be referred to as Colossus 2A
// R31.agc:20
//#
// R31.agc:21
//#       Prepared by
// R31.agc:22
//#                       Massachusetts Institute of Technology
// R31.agc:23
//#                       75 Cambridge Parkway
// R31.agc:24
//#                       Cambridge, Massachusetts
// R31.agc:25
//#
// R31.agc:26
//#       under NASA contract NAS 9-4065.
// R31.agc:27
//#
// R31.agc:28
//# Refer directly to the online document mentioned above for further
// R31.agc:29
//# information.  Please report any errors to info@sandroid.org.
// R31.agc:30
//
// R31.agc:31
//
// R31.agc:32
//# Page 505
// R31.agc:33
//		BANK	34
// R31.agc:34
//		SETLOC	R31
// R31.agc:35
//		BANK
// R31.agc:36
//
// R31.agc:37
//		COUNT*	$$/R31
// R31.agc:38
//
// R31.agc:39
//R31CALL		CAF	PRIO3
// slot 27648
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
// R31.agc:40
//		TC	FINDVAC
// slot 27649
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
// R31.agc:41
//		EBANK=	SUBEXIT
// R31.agc:42
//		2CADR	V83CALL
// slot 27650 27651
    27650, 2100, 27651, 51304
)).

// bank 31, slots 27652-27653
function agcAotUnit1582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27652 {
// R31.agc:43
//
// R31.agc:44
//DSPDELAY	CAF	1SEC
// slot 27652
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
// R31.agc:45
//		TC	BANKCALL
// slot 27653
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
// R31.agc:46
//		CADR	DELAYJOB
// slot 27654
    27654, 1972
)).

// bank 31, slots 27655-27666
function agcAotUnit1583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27660 {
        if slot <= 27657 {
            if slot <= 27655 {
// R31.agc:47
//		CA	EXTVBACT
// slot 27655
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
// R31.agc:48
//		MASK	BIT12
// slot 27656
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
// R31.agc:49
//		EXTEND
// slot 27657
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
// R31.agc:50
//		BZF	DSPDELAY
// slot 27658
                if slot <> 27658 or instruction <> 5124 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5124, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27659 {
// R31.agc:51
//
// R31.agc:52
//DISPN5X		CA	FLAGWRD9	# TEST R31FLAG (IN SUNDANCE R31FLAG WILL
// slot 27659
                    if slot <> 27659 or instruction <> 12357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 69).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:53
//		MASK	BIT4		#     ALWAYS BE SET AS R34 DOES NOT EXIST)
// slot 27660
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
// R31.agc:54
//		EXTEND
// slot 27661
                if slot <> 27661 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27662 {
// R31.agc:55
//		BZF	+3
// slot 27662
                    if slot <> 27662 or instruction <> 5137 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5137, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// R31.agc:56
//		CAF	V16N54		# R31	USE NOUN 54
// slot 27663
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
// R31.agc:57
//		TC	+2
// slot 27664
                if slot <> 27664 or instruction <> 1042 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1042, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27665 {
// R31.agc:58
//		CAF	V16N53		# R34	USE NOUN 53
// slot 27665
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
// R31.agc:59
//		TC	BANKCALL
// slot 27666
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
// R31.agc:60
//		CADR	GOMARKF
// slot 27667
    27667, 17122
)).

// bank 31, slots 27668-27671
function agcAotUnit1584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27669 {
        if slot <= 27668 {
// R31.agc:61
//		TC	B5OFF
// slot 27668
            if slot <> 27668 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:62
//		TC	B5OFF
// slot 27669
            if slot <> 27669 or instruction <> 2965 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2965, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27670 {
// R31.agc:63
//		TCF	DISPN5X
// slot 27670
            if slot <> 27670 or instruction <> 5131 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5131, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:64
//
// R31.agc:65
//V83		TC	INTPRET
// slot 27671
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
// R31.agc:66
//		GOTO
// slot 27672
    27672, 65360,
// R31.agc:67
//			HAVEBASE	# INTEG STATE VECTORS
// slot 27673
    27673, 51442
)).

// bank 31, slots 27674-27674
function agcAotUnit1585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R31.agc:68
//V83CALL		TC	INTPRET
// slot 27674
    if slot <> 27674 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1585] to agcAotUnit1585@.

agcAotInstallSourceRope(list(
// R31.agc:69
//		GOTO
// slot 27675
    27675, 65360,
// R31.agc:70
//			STATEXTP	# EXTRAPOLATE STATE VECTORS
// slot 27676
    27676, 51392,
// R31.agc:71
//COMPDISP	VLOAD	VSU
// slot 27677
    27677, 43514,
// R31.agc:72
//			RATT
// slot 27678
    27678, 2,
// R31.agc:73
//			RONE
// slot 27679
    27679, 2478,
// R31.agc:74
//		PUSH	ABVAL		# RATT-RONE TO 0D	PD= 6
// slot 27680
    27680, 42508,
// R31.agc:75
//		STORE	RANGE		# METERS B-29
// slot 27681
    27681, 2466,
// R31.agc:76
//		NORM	VLOAD
// slot 27682
    27682, 64898,
// R31.agc:77
//			X1		# RATT-RONE		PD= 0
// slot 27683
    27683, 78,
// R31.agc:78
//		VSR1
// slot 27684
    27684, 65508,
// R31.agc:79
//		VSL*	UNIT
// slot 27685
    27685, 44638,
// R31.agc:80
//			0,1
// slot 27686
    27686, 16642,
// R31.agc:81
//		PDVL	VSU		# UNIT(LOS) TO 0D	PD= 6
// slot 27687
    27687, 43418,
// R31.agc:82
//# Page 506
// R31.agc:83
//			VATT
// slot 27688
    27688, 14,
// R31.agc:84
//			VONE
// slot 27689
    27689, 2490,
// R31.agc:85
//		DOT			# (VATT-VONE).UNIT(LOS)	PD= 0
// slot 27690
    27690, 65346,
// R31.agc:86
//		SL1
// slot 27691
    27691, 65492,
// R31.agc:87
//		STCALL	RRATE		# RANGE RATE M/CS B-7
// slot 27692
    27692, 31142,
// R31.agc:88
//			CDUTRIG		# TO INITIALIZE FOR *NBSM*
// slot 27693
    27693, 40574,
// R31.agc:89
//		CALL
// slot 27694
    27694, 65320,
// R31.agc:90
//			R34LOS		# NOTE.  PDL MUST = 0.
// slot 27695
    27695, 51602,
// R31.agc:91
//R34ANG		VLOAD	UNIT
// slot 27696
    27696, 44794,
// R31.agc:92
//			RONE
// slot 27697
    27697, 2478,
// R31.agc:93
//		PDVL			# UR TO 0D		PD= 6
// slot 27698
    27698, 65434,
// R31.agc:94
//			THISAXIS	# UNITX FOR CM, UNITZ FOR LM
// slot 27699
    27699, 13750,
// R31.agc:95
//		BON	VLOAD		# CHK R31FLAG.  ON=R31 THETA, OFF=R34 PHI
// slot 27700
    27700, 64792,
// R31.agc:96
//			R31FLAG
// slot 27701
    27701, 5014,
// R31.agc:97
//			+2		# R31-THETA
// slot 27702
    27702, 51312,
// R31.agc:98
//			12D
// slot 27703
    27703, 26,
// R31.agc:99
//		CALL
// slot 27704
    27704, 65320,
// R31.agc:100
//			*NBSM*
// slot 27705
    27705, 40780,
// R31.agc:101
//		VXM	PUSH		# UXORZ TO 6D		PD=12D
// slot 27706
    27706, 34442,
// R31.agc:102
//			REFSMMAT
// slot 27707
    27707, 1980,
// R31.agc:103
//		VPROJ	VSL2
// slot 27708
    27708, 59954,
// R31.agc:104
//			0D
// slot 27709
    27709, 2,
// R31.agc:105
//		BVSU	UNIT
// slot 27710
    27710, 44618,
// R31.agc:106
//			6D
// slot 27711
    27711, 14,
// R31.agc:107
//		PDVL	VXV		# UP/2 TO 12D		PD=18D
// slot 27712
    27712, 40346,
// R31.agc:108
//			RONE
// slot 27713
    27713, 2478,
// R31.agc:109
//			VONE
// slot 27714
    27714, 2490,
// R31.agc:110
//		UNIT	VXV
// slot 27715
    27715, 40284,
// R31.agc:111
//			RONE
// slot 27716
    27716, 2478,
// R31.agc:112
//		DOT	PDVL		# SIGN TO 12D, UP/2 TO MPAC	PD=18D
// slot 27717
    27717, 52546,
// R31.agc:113
//			12D
// slot 27718
    27718, 26,
// R31.agc:114
//		VSL1	DOT		# UP.UXORZ
// slot 27719
    27719, 41460,
// R31.agc:115
//			6D
// slot 27720
    27720, 14,
// R31.agc:116
//		SIGN	SL1
// slot 27721
    27721, 60138,
// R31.agc:117
//			12D
// slot 27722
    27722, 26,
// R31.agc:118
//		ACOS
// slot 27723
    27723, 65452,
// R31.agc:119
//		STOVL	RTHETA
// slot 27724
    27724, 22954,
// R31.agc:120
//			RONE
// slot 27725
    27725, 2478,
// R31.agc:121
//		DOT	BPL
// slot 27726
    27726, 42050,
// R31.agc:122
//			6D
// slot 27727
    27727, 14,
// R31.agc:123
//			+5
// slot 27728
    27728, 51370,
// R31.agc:124
//		DLOAD	BDSU		# IF UXORZ.R NEG, RTHETA = 1 - RTHETA
// slot 27729
    27729, 37322,
// R31.agc:125
//			RTHETA
// slot 27730
    27730, 2474,
// R31.agc:126
//			DPPOSMAX
// slot 27731
    27731, 13766,
// R31.agc:127
//		STORE	RTHETA		# RTHETA BETWEEN 0 AND 1 REV.
// slot 27732
    27732, 2474,
// R31.agc:128
//		EXIT
// slot 27733
    27733, 65532
)).

// bank 31, slots 27734-27741
function agcAotUnit1586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27737 {
        if slot <= 27735 {
            if slot <= 27734 {
// R31.agc:129
//		CAF	BIT5		# HAVE WE BEEN ANSWERED
// slot 27734
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
// R31.agc:130
//		MASK	EXTVBACT
// slot 27735
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
// R31.agc:131
//		EXTEND
// slot 27736
                if slot <> 27736 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:132
//		BZF	ENDEXT		# YES, DIE
// slot 27737
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
// R31.agc:133
//# Page 507
// R31.agc:134
//		CS	EXTVBACT
// slot 27738
                if slot <> 27738 or instruction <> 16932 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 548).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:135
//		MASK	BIT12
// slot 27739
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
// R31.agc:136
//		ADS	EXTVBACT
// slot 27740
                if slot <> 27740 or instruction <> 11812 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// R31.agc:137
//
// R31.agc:138
//		TCF	V83
// slot 27741
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
// R31.agc:139
//V16N54		VN	1654
// slot 27742
    27742, 4204,
// R31.agc:140
//V16N53		VN	1653
// slot 27743
    27743, 4202,
// R31.agc:141
//
// R31.agc:142
//# Page 508
// R31.agc:143
//# STATEXTP DOES AN INITIAL PRECISION EXTRAPOLATION OF THE
// R31.agc:144
//# LEM STATE VECTOR TO PRESENT TIME OR TO PIPTIME IF AV G
// R31.agc:145
//# IS ON AND SAVES AS BASE VECTOR. IF AV G IS ON RN + VN
// R31.agc:146
//# ARE USED AS THE CM STATE VECTOR AND THE INITIAL R RDOT
// R31.agc:147
//# RTHETA ARE COMPUTED WITH NO FURTHER INTEGRATION. IF AV
// R31.agc:148
//# G IS OFF A PRECISION EXTRAPOLATION IS MADE OF THE CM
// R31.agc:149
//# STATE VECTOR TO PRESENT TIME AND.....
// R31.agc:150
//#
// R31.agc:151
//#   THE CM + LM STATE VECTORS ARE INTEGRATED TO PRES TIME
// R31.agc:152
//#   USING PRECISION OR CONIC AS SURFFLAG IS SET OR CLEAR.
// R31.agc:153
//#
// R31.agc:154
//#   IF AV G IS ON THEN
// R31.agc:155
//#     SUBSEQUENT PASSES WILL PROVIDE
// R31.agc:156
//#     USE OF RN + VN AS CM STATE VECTOR AND THE LM STATE
// R31.agc:157
//#     VECTOR WILL BE PRECISION INTEGRATED USING LEMPREC
// R31.agc:158
//#
// R31.agc:159
//#   IF SURFFLAG IS SET.
// R31.agc:160
//#     CM STATE VECTOR RONE VONE + LM STATE VECTOR RATT
// R31.agc:161
//#     VATT ARE USED IN COMPUTING R RDOT RTHETA.
// R31.agc:162
//#
// R31.agc:163
//
// R31.agc:164
//STATEXTP	RTB	BOF		# INITIAL INTEGRATION
// slot 27744
    27744, 35896,
// R31.agc:165
//			LOADTIME
// slot 27745
    27745, 38544,
// R31.agc:166
//			V37FLAG
// slot 27746
    27746, 4050,
// R31.agc:167
//			+3		# AV G OFF, USE PRES TIME
// slot 27747
    27747, 51404,
// R31.agc:168
//		CALL
// slot 27748
    27748, 65320,
// R31.agc:169
//			GETRVN		#      ON,  USE RN VN PIPTIME
// slot 27749
    27749, 51574,
// R31.agc:170
//		STORE	BASETIME	# PRES TIME OR PIPTIME
// slot 27750
    27750, 2502,
// R31.agc:171
//		STCALL	TDEC1
// slot 27751
    27751, 28738,
// R31.agc:172
//			LEMPREC
// slot 27752
    27752, 23690,
// R31.agc:173
//		VLOAD			# BASE VECTOR, LM
// slot 27753
    27753, 65530,
// R31.agc:174
//			RATT1
// slot 27754
    27754, 30,
// R31.agc:175
//		STOVL	BASEOTP		#   POS.
// slot 27755
    27755, 22826,
// R31.agc:176
//			VATT1
// slot 27756
    27756, 42,
// R31.agc:177
//		STORE	BASEOTV		#   VEL.
// slot 27757
    27757, 2370,
// R31.agc:178
//		BON	DLOAD
// slot 27758
    27758, 58648,
// R31.agc:179
//			V37FLAG
// slot 27759
    27759, 3986,
// R31.agc:180
//			COMPDISP	# COMPUTE R RDOT RTHETA FROM
// slot 27760
    27760, 51258,
// R31.agc:181
//					# RONE(RN) VONE(VN) RATT+VATT(LEMPREC)
// R31.agc:182
//			TAT
// slot 27761
    27761, 26,
// R31.agc:183
//		STCALL	TDEC1
// slot 27762
    27762, 28738,
// R31.agc:184
//			CSMPREC
// slot 27763
    27763, 23666,
// R31.agc:185
//		VLOAD			# BASE VECTOR, CM
// slot 27764
    27764, 65530,
// R31.agc:186
//			RATT1
// slot 27765
    27765, 30,
// R31.agc:187
//		STOVL	BASETHP		#  POS.
// slot 27766
    27766, 22874,
// R31.agc:188
//			VATT1
// slot 27767
    27767, 42,
// R31.agc:189
//		STORE	BASETHV		#  VEL.
// slot 27768
    27768, 2406,
// R31.agc:190
//HAVEBASE	BON	RTB		# SUBSEQUENT INTEGRATIONS
// slot 27769
    27769, 39960,
// R31.agc:191
//			V37FLAG
// slot 27770
    27770, 3986,
// R31.agc:192
//			GETRVN5
// slot 27771
    27771, 51548,
// R31.agc:193
//			LOADTIME
// slot 27772
    27772, 38544,
// R31.agc:194
//		STCALL	TDEC1		# AV G OFF. SET INTEG. OF CM
// slot 27773
    27773, 28738,
// R31.agc:195
//			INTSTALL
// slot 27774
    27774, 24132,
// R31.agc:196
//		VLOAD	CLEAR
// slot 27775
    27775, 36090,
// R31.agc:197
//			BASETHP
// slot 27776
    27776, 2394,
// R31.agc:198
//# Page 509
// R31.agc:199
//			MOONFLAG
// slot 27777
    27777, 358,
// R31.agc:200
//		STOVL	RCV
// slot 27778
    27778, 22202,
// R31.agc:201
//			BASETHV
// slot 27779
    27779, 2406,
// R31.agc:202
//		STODL	VCV
// slot 27780
    27780, 14022,
// R31.agc:203
//			BASETIME
// slot 27781
    27781, 2502,
// R31.agc:204
//		BOF	SET		# GET APPROPRIATE MOONFLAG SETTING
// slot 27782
    27782, 35864,
// R31.agc:205
//			MOONTHIS
// slot 27783
    27783, 4550,
// R31.agc:206
//			+2
// slot 27784
    27784, 51476,
// R31.agc:207
//			MOONFLAG
// slot 27785
    27785, 102,
// R31.agc:208
//		CLEAR
// slot 27786
    27786, 65304,
// R31.agc:209
//			INTYPFLG
// slot 27787
    27787, 1910,
// R31.agc:210
//		BON	SET
// slot 27788
    27788, 35864,
// R31.agc:211
//			SURFFLAG
// slot 27789
    27789, 4494,
// R31.agc:212
//			+2		# PREC. IF LM DOWN
// slot 27790
    27790, 51488,
// R31.agc:213
//			INTYPFLG	# CONIC IF LM NOT DOWN
// slot 27791
    27791, 1654,
// R31.agc:214
//		STCALL	TET
// slot 27792
    27792, 30366,
// R31.agc:215
//			INTEGRVS	# INTEGRATION --- AT LAST---
// slot 27793
    27793, 23738,
// R31.agc:216
//		VLOAD
// slot 27794
    27794, 65530,
// R31.agc:217
//			RATT
// slot 27795
    27795, 2,
// R31.agc:218
//		STOVL	RONE
// slot 27796
    27796, 22958,
// R31.agc:219
//			VATT
// slot 27797
    27797, 14,
// R31.agc:220
//		STODL	VONE		# GET SET FOR CONIC EXTRAP.,OTHER
// slot 27798
    27798, 14778,
// R31.agc:221
//			TAT
// slot 27799
    27799, 26,
// R31.agc:222
//		BON	CALL
// slot 27800
    27800, 37912,
// R31.agc:223
//			SURFFLAG
// slot 27801
    27801, 4494,
// R31.agc:224
//			GETRVN6		# LEMPREC IF LM DOWN
// slot 27802
    27802, 51566,
// R31.agc:225
//			INTSTALL	# ..CONIC IF NOT DOWN
// slot 27803
    27803, 24132,
// R31.agc:226
//		SET
// slot 27804
    27804, 65304,
// R31.agc:227
//			INTYPFLG
// slot 27805
    27805, 1654,
// R31.agc:228
//OTHINT		STORE	TDEC1		# ENTERED IF AV G ON TO INTEG LM
// slot 27806
    27806, 66,
// R31.agc:229
//		VLOAD	CLEAR
// slot 27807
    27807, 36090,
// R31.agc:230
//			BASEOTP
// slot 27808
    27808, 2346,
// R31.agc:231
//			MOONFLAG
// slot 27809
    27809, 358,
// R31.agc:232
//		STOVL	RCV
// slot 27810
    27810, 22202,
// R31.agc:233
//			BASEOTV
// slot 27811
    27811, 2370,
// R31.agc:234
//		STODL	VCV
// slot 27812
    27812, 14022,
// R31.agc:235
//			BASETIME
// slot 27813
    27813, 2502,
// R31.agc:236
//		BOF	SET
// slot 27814
    27814, 35864,
// R31.agc:237
//			MOONTHIS
// slot 27815
    27815, 4550,
// R31.agc:238
//			+2
// slot 27816
    27816, 51540,
// R31.agc:239
//			MOONFLAG
// slot 27817
    27817, 102,
// R31.agc:240
//		STCALL	TET
// slot 27818
    27818, 30366,
// R31.agc:241
//			INTEGRVS
// slot 27819
    27819, 23738,
// R31.agc:242
//		GOTO
// slot 27820
    27820, 65360,
// R31.agc:243
//			COMPDISP	# COMPUTE R RDOT RTHETA
// slot 27821
    27821, 51258,
// R31.agc:244
//GETRVN5		CALL			# AV G ON
// slot 27822
    27822, 65320,
// R31.agc:245
//			GETRVN
// slot 27823
    27823, 51574,
// R31.agc:246
//		BON	CALL
// slot 27824
    27824, 37912,
// R31.agc:247
//			SURFFLAG
// slot 27825
    27825, 4494,
// R31.agc:248
//			GETRVN6		# LM DOWN, LMPREC
// slot 27826
    27826, 51566,
// R31.agc:249
//# Page 510
// R31.agc:250
//			INTSTALL
// slot 27827
    27827, 24132,
// R31.agc:251
//		CLEAR	GOTO
// slot 27828
    27828, 43032,
// R31.agc:252
//			INTYPFLG
// slot 27829
    27829, 1910,
// R31.agc:253
//			OTHINT
// slot 27830
    27830, 51516,
// R31.agc:254
//GETRVN6		STCALL	TDEC1
// slot 27831
    27831, 28738,
// R31.agc:255
//			LEMPREC
// slot 27832
    27832, 23690,
// R31.agc:256
//		GOTO
// slot 27833
    27833, 65360,
// R31.agc:257
//			COMPDISP	# COMPUTE R RDOT RTHETA
// slot 27834
    27834, 51258,
// R31.agc:258
//GETRVN		STQ
// slot 27835
    27835, 65312,
// R31.agc:259
//			0D
// slot 27836
    27836, 0,
// R31.agc:260
//		VLOAD	GOTO		# AV G ON, RONE = RN VONE = VN
// slot 27837
    27837, 43258,
// R31.agc:261
//			RN		#  AND USE PIPTIME
// slot 27838
    27838, 1266,
// R31.agc:262
//			+1
// slot 27839
    27839, 51584,
// R31.agc:263
//		STCALL	RONE
// slot 27840
    27840, 31150,
// R31.agc:264
//			+1
// slot 27841
    27841, 51588,
// R31.agc:265
//		VLOAD	GOTO
// slot 27842
    27842, 43258,
// R31.agc:266
//			VN
// slot 27843
    27843, 1278
)).

agcAotInstallSourceRope(list(
// R31.agc:267
//			+1
// slot 27844
    27844, 51594,
// R31.agc:268
//		STODL	VONE
// slot 27845
    27845, 14778,
// R31.agc:269
//			PIPTIME
// slot 27846
    27846, 1290,
// R31.agc:270
//		GOTO
// slot 27847
    27847, 65360,
// R31.agc:271
//			0D
// slot 27848
    27848, 0,
// R31.agc:272
//		SETLOC	R34
// R31.agc:273
//		BANK
// R31.agc:274
//R34LOS		EXIT
// slot 27849
    27849, 65532
)).

// bank 31, slots 27850-27851
function agcAotUnit1587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27850 {
// R31.agc:275
//		CA	CDUS
// slot 27850
        if slot <> 27850 or instruction <> 12318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 30).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R31.agc:276
//		INDEX	FIXLOC
// slot 27851
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
// R31.agc:277
//		TS	9D
// slot 27852
    27852, 45074
)).

// bank 31, slots 27853-27854
function agcAotUnit1588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27853 {
// R31.agc:278
//		CA	CDUT
// slot 27853
        if slot <> 27853 or instruction <> 12317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 29).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// R31.agc:279
//		INDEX	FIXLOC
// slot 27854
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
// R31.agc:280
//		TS	11D
// slot 27855
    27855, 45078
)).

// bank 31, slots 27856-27859
function agcAotUnit1589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27857 {
        if slot <= 27856 {
// R31.agc:281
//		CA	FIXLOC
// slot 27856
            if slot <> 27856 or instruction <> 12368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 80).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:282
//		AD	SIX
// slot 27857
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
// R31.agc:283
//		COM
// slot 27858
            if slot <> 27858 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// R31.agc:284
//		INDEX	FIXLOC
// slot 27859
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
// R31.agc:285
//		TS	X1
// slot 27860
    27860, 45132
)).

// bank 31, slots 27861-27861
function agcAotUnit1590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// R31.agc:286
//		TC	INTPRET
// slot 27861
    if slot <> 27861 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1590] to agcAotUnit1590@.

agcAotInstallSourceRope(list(
// R31.agc:287
//		CALL
// slot 27862
    27862, 65320,
// R31.agc:288
//			SXTNB
// slot 27863
    27863, 38912,
// R31.agc:289
//		STCALL	12D
// slot 27864
    27864, 28698,
// R31.agc:290
//			R34ANG
// slot 27865
    27865, 51296
)).

