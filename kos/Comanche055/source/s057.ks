// PORT: Original source unit R60_62.agc.
// PORT: Physical bank 27. Shared continuation entries, slots 25600–25606.
function agcAotUnit1483 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25602 {
        if slot <= 25600 {
// PORT: SOURCE R60_62.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE R60_62.agc:2
//# Filename:	R60_62.agc
// PORT: SOURCE R60_62.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE R60_62.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE R60_62.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE R60_62.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE R60_62.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE R60_62.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE R60_62.agc:9
//# Pages:	390-398
// PORT: SOURCE R60_62.agc:10
//# Mod history:	2009-05-09 RSB	Adapted from the Colossus249/ file
// PORT: SOURCE R60_62.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE R60_62.agc:12
//#				images.
// PORT: SOURCE R60_62.agc:13
//#
// PORT: SOURCE R60_62.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE R60_62.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE R60_62.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE R60_62.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE R60_62.agc:18
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE R60_62.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE R60_62.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE R60_62.agc:21
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE R60_62.agc:22
//#
// PORT: SOURCE R60_62.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE R60_62.agc:24
//#
// PORT: SOURCE R60_62.agc:25
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE R60_62.agc:26
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE R60_62.agc:27
//#
// PORT: SOURCE R60_62.agc:28
//#	This AGC program shall also be referred to as
// PORT: SOURCE R60_62.agc:29
//#			Colossus 2A
// PORT: SOURCE R60_62.agc:30
//
// PORT: SOURCE R60_62.agc:31
//# Page 390
// PORT: SOURCE R60_62.agc:32
//		BANK	34
// PORT: SOURCE R60_62.agc:33
//		SETLOC	MANUVER
// PORT: SOURCE R60_62.agc:34
//		BANK
// PORT: SOURCE R60_62.agc:35
//
// PORT: SOURCE R60_62.agc:36
//		EBANK=	TEMPR60
// PORT: SOURCE R60_62.agc:37
//
// PORT: SOURCE R60_62.agc:38
//		COUNT	27/R60
// PORT: SOURCE R60_62.agc:39
//
// PORT: SOURCE R60_62.agc:40
//# CONFORMS TO GSOP CHAPTER FOUR REVISION LOGIC 09 JAN 18,1968
// PORT: SOURCE R60_62.agc:41
//
// PORT: SOURCE R60_62.agc:42
//R60CSM		TC	MAKECADR
// PORT: Fixed ROM slots 25600.
            if slot <> 25600 or instruction <> 2505 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2505, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25601 {
// PORT: SOURCE R60_62.agc:43
//		TS	TEMPR60
// PORT: Fixed ROM slots 25601.
                if slot <> 25601 or instruction <> 23142 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23142, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:44
//
// PORT: SOURCE R60_62.agc:45
//# INSERT PRIODSP CHECK WITH R22 (V06N49) WITH JENNINGS BRODEUR
// PORT: SOURCE R60_62.agc:46
//
// PORT: SOURCE R60_62.agc:47
//REDOMANN	CAF	BIT6
// PORT: Fixed ROM slots 25602.
                if slot <> 25602 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25604 {
            if slot <= 25603 {
// PORT: SOURCE R60_62.agc:48
//		MASK	FLAGWRD5	# IS 3-AXIS FLAG SET
// PORT: Fixed ROM slots 25603.
                if slot <> 25603 or instruction <> 28737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:49
//		CCS	A
// PORT: Fixed ROM slots 25604.
                if slot <> 25604 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25605 {
// PORT: SOURCE R60_62.agc:50
//		TCF	TOBALL		# YES
// PORT: Fixed ROM slots 25605.
                if slot <> 25605 or instruction <> 5131 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5131, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:51
//		TC	INTPRET
// PORT: Fixed ROM slots 25606.
                if slot <> 25606 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1483] to agcAotUnit1483@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:52
//		CALL
// PORT: Fixed ROM slots 25607.
    25607, 65320,
// PORT: SOURCE R60_62.agc:53
//			VECPOINT	# TO COMPUTE FINAL ANGLES
// PORT: Fixed ROM slots 25608.
    25608, 47276,
// PORT: SOURCE R60_62.agc:54
//		STORE	CPHI		# STORE FINAL ANGLES - CPHI,CTHETA,CPSI
// PORT: Fixed ROM slots 25609.
    25609, 1244,
// PORT: SOURCE R60_62.agc:55
//		EXIT
// PORT: Fixed ROM slots 25610.
    25610, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25611–25612.
function agcAotUnit1484 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25611 {
// PORT: SOURCE R60_62.agc:56
//
// PORT: SOURCE R60_62.agc:57
//TOBALL		CAF	V06N18
// PORT: Fixed ROM slots 25611.
        if slot <> 25611 or instruction <> 13397 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1109), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R60_62.agc:58
//		TC	BANKCALL
// PORT: Fixed ROM slots 25612.
        if slot <> 25612 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1484] to agcAotUnit1484@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:59
//		CADR	GOPERF2R	# DISPLAY PLEASE PERFORM AUTO MANEUVER
// PORT: Fixed ROM slots 25613.
    25613, 17588
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25614–25623.
function agcAotUnit1485 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25618 {
        if slot <= 25615 {
            if slot <= 25614 {
// PORT: SOURCE R60_62.agc:60
//		TC	R61TEST
// PORT: Fixed ROM slots 25614.
                if slot <> 25614 or instruction <> 1100 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1100, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:61
//		TC	REDOMANC	# PROCEED
// PORT: Fixed ROM slots 25615.
                if slot <> 25615 or instruction <> 1043 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1043, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25616 {
// PORT: SOURCE R60_62.agc:62
//		TCF	ENDMANU1	# ENTER I.E. FINISHED WITH R60
// PORT: Fixed ROM slots 25616.
                if slot <> 25616 or instruction <> 5162 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5162, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25617 {
// PORT: SOURCE R60_62.agc:63
//
// PORT: SOURCE R60_62.agc:64
//		TC	CHKLINUS	# TO CHECK FOR PRIORITY DISPLAYS
// PORT: Fixed ROM slots 25617.
                    if slot <> 25617 or instruction <> 1070 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1070, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:65
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 25618.
                    if slot <> 25618 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25620 {
            if slot <= 25619 {
// PORT: SOURCE R60_62.agc:66
//
// PORT: SOURCE R60_62.agc:67
//REDOMANC	CAF	BIT6
// PORT: Fixed ROM slots 25619.
                if slot <> 25619 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:68
//		MASK	FLAGWRD5	# IS 3-AXIS FLAG SET
// PORT: Fixed ROM slots 25620.
                if slot <> 25620 or instruction <> 28737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25621 {
// PORT: SOURCE R60_62.agc:69
//		CCS	A
// PORT: Fixed ROM slots 25621.
                if slot <> 25621 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25622 {
// PORT: SOURCE R60_62.agc:70
//		TCF	TOBALLC		# YES
// PORT: Fixed ROM slots 25622.
                    if slot <> 25622 or instruction <> 5148 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5148, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:71
//		TC	INTPRET
// PORT: Fixed ROM slots 25623.
                    if slot <> 25623 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1485] to agcAotUnit1485@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:72
//		CALL
// PORT: Fixed ROM slots 25624.
    25624, 65320,
// PORT: SOURCE R60_62.agc:73
//			VECPOINT	# TO COMPUTE FINAL ANGLES
// PORT: Fixed ROM slots 25625.
    25625, 47276,
// PORT: SOURCE R60_62.agc:74
//		STORE	CPHI		# STORE ANGLES
// PORT: Fixed ROM slots 25626.
    25626, 1244,
// PORT: SOURCE R60_62.agc:75
//		EXIT
// PORT: Fixed ROM slots 25627.
    25627, 65532
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25628–25636.
function agcAotUnit1486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25631 {
        if slot <= 25629 {
            if slot <= 25628 {
// PORT: SOURCE R60_62.agc:76
//
// PORT: SOURCE R60_62.agc:77
//TOBALLC		CAF	PRIO30		# IS MODE AUTO AND CTL GNC
// PORT: Fixed ROM slots 25628.
                if slot <> 25628 or instruction <> 14585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:78
//# Page 391
// PORT: SOURCE R60_62.agc:79
//		EXTEND
// PORT: Fixed ROM slots 25629.
                if slot <> 25629 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25630 {
// PORT: SOURCE R60_62.agc:80
//		RXOR	CHAN31
// PORT: Fixed ROM slots 25630.
                if slot <> 25630 or instruction <> 3097 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:81
//		MASK	13,14,15
// PORT: Fixed ROM slots 25631.
                if slot <> 25631 or instruction <> 32711 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                    if fixedOperand = 28672 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 8) * 4096).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25633 {
            if slot <= 25632 {
// PORT: SOURCE R60_62.agc:82
//		EXTEND
// PORT: Fixed ROM slots 25632.
                if slot <> 25632 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:83
//		BZF	+2		# AUTO, NON-FLASH N18
// PORT: Fixed ROM slots 25633.
                if slot <> 25633 or instruction <> 5155 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25634 {
// PORT: SOURCE R60_62.agc:84
//		TCF	TOBALL		# NOT AUTO
// PORT: Fixed ROM slots 25634.
                if slot <> 25634 or instruction <> 5131 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5131, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25635 {
// PORT: SOURCE R60_62.agc:85
//
// PORT: SOURCE R60_62.agc:86
//		CAF	V06N18		# SET UP NON-FLASHING V06 N18
// PORT: Fixed ROM slots 25635.
                    if slot <> 25635 or instruction <> 13397 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1109), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:87
//		TC	BANKCALL
// PORT: Fixed ROM slots 25636.
                    if slot <> 25636 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1486] to agcAotUnit1486@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:88
//		CADR	GODSPR
// PORT: Fixed ROM slots 25637.
    25637, 17276
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25638–25639.
function agcAotUnit1487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25638 {
// PORT: SOURCE R60_62.agc:89
//		TC	CHKLINUS
// PORT: Fixed ROM slots 25638.
        if slot <> 25638 or instruction <> 1070 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1070, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R60_62.agc:90
//
// PORT: SOURCE R60_62.agc:91
//STARTMNV	TC	BANKCALL
// PORT: Fixed ROM slots 25639.
        if slot <> 25639 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1487] to agcAotUnit1487@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:92
//		CADR	GOMANUR
// PORT: Fixed ROM slots 25640.
    25640, 16174
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25641–25642.
function agcAotUnit1488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25641 {
// PORT: SOURCE R60_62.agc:93
//ENDMANUV	TCF	TOBALL		# FINISHED MANEUVER
// PORT: Fixed ROM slots 25641.
        if slot <> 25641 or instruction <> 5131 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5131, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R60_62.agc:94
//
// PORT: SOURCE R60_62.agc:95
//ENDMANU1	TC	DOWNFLAG	# RESET 3-AXIS FLAG
// PORT: Fixed ROM slots 25642.
        if slot <> 25642 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1488] to agcAotUnit1488@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:96
//		ADRES	3AXISFLG	# BIT 6 FLAG 5
// PORT: Fixed ROM slots 25643.
    25643, 168
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25644–25655.
function agcAotUnit1489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25649 {
        if slot <= 25646 {
            if slot <= 25644 {
// PORT: SOURCE R60_62.agc:97
//		CAE	TEMPR60
// PORT: Fixed ROM slots 25644.
                if slot <> 25644 or instruction <> 12902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 614).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25645 {
// PORT: SOURCE R60_62.agc:98
//		TC	BANKJUMP
// PORT: Fixed ROM slots 25645.
                    if slot <> 25645 or instruction <> 2500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2500, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:99
//
// PORT: SOURCE R60_62.agc:100
//CHKLINUS	CS	FLAGWRD4
// PORT: Fixed ROM slots 25646.
                    if slot <> 25646 or instruction <> 16448 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 64).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25647 {
// PORT: SOURCE R60_62.agc:101
//		MASK	BIT12		# IS PRIORITY DISPLAY FLAG SET
// PORT: Fixed ROM slots 25647.
                if slot <> 25647 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
                if slot <= 25648 {
// PORT: SOURCE R60_62.agc:102
//		CCS	A
// PORT: Fixed ROM slots 25648.
                    if slot <> 25648 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:103
//		TC	Q		# NO - EXIT
// PORT: Fixed ROM slots 25649.
                    if slot <> 25649 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25652 {
            if slot <= 25650 {
// PORT: SOURCE R60_62.agc:104
//		CA	Q
// PORT: Fixed ROM slots 25650.
                if slot <> 25650 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25651 {
// PORT: SOURCE R60_62.agc:105
//		TS	MPAC +2		# SAVE RETURN
// PORT: Fixed ROM slots 25651.
                    if slot <> 25651 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:106
//		CS	THREE		# OBTAIN LOCATION FOR RESTART.
// PORT: Fixed ROM slots 25652.
                    if slot <> 25652 or instruction <> 19596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25653 {
// PORT: SOURCE R60_62.agc:107
//		AD	BUF2		# HOLDS Q OF LAST DISPLAY
// PORT: Fixed ROM slots 25653.
                if slot <> 25653 or instruction <> 24667 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 91).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25654 {
// PORT: SOURCE R60_62.agc:108
//		TS	TBASE1
// PORT: Fixed ROM slots 25654.
                    if slot <> 25654 or instruction <> 23083 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23083, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:109
//
// PORT: SOURCE R60_62.agc:110
//		TC	PHASCHNG
// PORT: Fixed ROM slots 25655.
                    if slot <> 25655 or instruction <> 2826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2826, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1489] to agcAotUnit1489@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:111
//		OCT	71		# 1.7SPOT FOR RELINUS
// PORT: Fixed ROM slots 25656.
    25656, 114
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25657–25664.
function agcAotUnit1490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25660 {
        if slot <= 25658 {
            if slot <= 25657 {
// PORT: SOURCE R60_62.agc:112
//
// PORT: SOURCE R60_62.agc:113
//		CAF	BIT7
// PORT: Fixed ROM slots 25657.
                if slot <> 25657 or instruction <> 14857 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:114
//		TC	LINUS		# GO SET BITS FOR PRIORITY DISPLAY
// PORT: Fixed ROM slots 25658.
                if slot <> 25658 or instruction <> 2902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2902, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25659 {
// PORT: SOURCE R60_62.agc:115
//		TC	MPAC +2
// PORT: Fixed ROM slots 25659.
                if slot <> 25659 or instruction <> 110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 110, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:116
//
// PORT: SOURCE R60_62.agc:117
//RELINUS		CAF	BIT5		# IS TRACK FLAG ON
// PORT: Fixed ROM slots 25660.
                if slot <> 25660 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25662 {
            if slot <= 25661 {
// PORT: SOURCE R60_62.agc:118
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 25661.
                if slot <> 25661 or instruction <> 28733 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:119
//		EXTEND
// PORT: Fixed ROM slots 25662.
                if slot <> 25662 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25663 {
// PORT: SOURCE R60_62.agc:120
//		BZF	GOREDO20	# NO
// PORT: Fixed ROM slots 25663.
                if slot <> 25663 or instruction <> 5193 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5193, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:121
//
// PORT: SOURCE R60_62.agc:122
//		TC	UPFLAG
// PORT: Fixed ROM slots 25664.
                if slot <> 25664 or instruction <> 2918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2918, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1490] to agcAotUnit1490@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:123
//		ADRES	PDSPFLAG	# R60 PRIODSP FLAG
// PORT: Fixed ROM slots 25665.
    25665, 126
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25666–25666.
function agcAotUnit1491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R60_62.agc:124
//
// PORT: SOURCE R60_62.agc:125
//		TC	UPFLAG
// PORT: Fixed ROM slots 25666.
    if slot <> 25666 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1491] to agcAotUnit1491@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:126
//		ADRES	TARG1FLG	# FOR R52
// PORT: Fixed ROM slots 25667.
    25667, 40
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25668–25673.
function agcAotUnit1492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25670 {
        if slot <= 25668 {
// PORT: SOURCE R60_62.agc:127
//
// PORT: SOURCE R60_62.agc:128
//		CAF	ZERO		# RESET TO ZERO, SINCE
// PORT: Fixed ROM slots 25668.
            if slot <> 25668 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25669 {
// PORT: SOURCE R60_62.agc:129
//# Page 392
// PORT: SOURCE R60_62.agc:130
//		TS	OPTIND		# OPTIND WAS SET TO -1 BY V379
// PORT: Fixed ROM slots 25669.
                if slot <> 25669 or instruction <> 23235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:131
//
// PORT: SOURCE R60_62.agc:132
//		CAF	PRIO14		# RESTORE ORIGINAL PRIORITY
// PORT: Fixed ROM slots 25670.
                if slot <> 25670 or instruction <> 14902 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25671 {
// PORT: SOURCE R60_62.agc:133
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 25671.
            if slot <> 25671 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25672 {
// PORT: SOURCE R60_62.agc:134
//
// PORT: SOURCE R60_62.agc:135
//		TC	TBASE1
// PORT: Fixed ROM slots 25672.
                if slot <> 25672 or instruction <> 555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 555, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:136
//
// PORT: SOURCE R60_62.agc:137
//GOREDO20	TC	PHASCHNG
// PORT: Fixed ROM slots 25673.
                if slot <> 25673 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1492] to agcAotUnit1492@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:138
//		OCT	111		# 1.11 FOR PIKUP20
// PORT: Fixed ROM slots 25674.
    25674, 146
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25675–25683.
function agcAotUnit1493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25678 {
        if slot <= 25676 {
            if slot <= 25675 {
// PORT: SOURCE R60_62.agc:139
//
// PORT: SOURCE R60_62.agc:140
//		TC 	ENDOFJOB
// PORT: Fixed ROM slots 25675.
                if slot <> 25675 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:141
//
// PORT: SOURCE R60_62.agc:142
//R61TEST		CA	MODREG		# ARE WE IN P00.  IF YES THIS MUST BE
// PORT: Fixed ROM slots 25676.
                if slot <> 25676 or instruction <> 12809 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25677 {
// PORT: SOURCE R60_62.agc:143
//		EXTEND			#	VERB49 OR VERB89 SO DO ENDEXT.
// PORT: Fixed ROM slots 25677.
                if slot <> 25677 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:144
//		BZF	ENDMANU1	# RESET 3-AXIS & RUTURN.  USER DOES ENDEXT
// PORT: Fixed ROM slots 25678.
                if slot <> 25678 or instruction <> 5162 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5162, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25680 {
            if slot <= 25679 {
// PORT: SOURCE R60_62.agc:145
//		CA	FLAGWRD4	# ARE WE IN R61 (P20)
// PORT: Fixed ROM slots 25679.
                if slot <> 25679 or instruction <> 12352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 64).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE R60_62.agc:146
//		MASK	BIT12
// PORT: Fixed ROM slots 25680.
                if slot <> 25680 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
            if slot <= 25681 {
// PORT: SOURCE R60_62.agc:147
//		EXTEND
// PORT: Fixed ROM slots 25681.
                if slot <> 25681 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25682 {
// PORT: SOURCE R60_62.agc:148
//		BZF	GOTOPOOH	# NO
// PORT: Fixed ROM slots 25682.
                    if slot <> 25682 or instruction <> 6214 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6214, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE R60_62.agc:149
//		TC	GOTOV56		# YES
// PORT: Fixed ROM slots 25683.
                    if slot <> 25683 or instruction <> 2450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2450, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1493] to agcAotUnit1493@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:150
//
// PORT: SOURCE R60_62.agc:151
//BIT14+7		OCT	20100
// PORT: Fixed ROM slots 25684.
    25684, 16512,
// PORT: SOURCE R60_62.agc:152
//V06N18		VN	0618
// PORT: Fixed ROM slots 25685.
    25685, 1572,
// PORT: SOURCE R60_62.agc:153
//
// PORT: SOURCE R60_62.agc:154
//# Page 393
// PORT: SOURCE R60_62.agc:155
//# PROGRAM DESCRIPTION - VECPOINT
// PORT: SOURCE R60_62.agc:156
//
// PORT: SOURCE R60_62.agc:157
//
// PORT: SOURCE R60_62.agc:158
//# 	THIS INTERPRETIVE SUBROUTINE MAY BE USED TO POINT A SPACECRAFT AXIS IN A DESIRED DIRECTION.  THE AXIS
// PORT: SOURCE R60_62.agc:159
//# TO BE POINTED MUST APPEAR AS A HALF UNIT DOUBLE PRECISION VECTOR IN SUCCESSIVE LOCATIONS OF ERASABLE MEMORY
// PORT: SOURCE R60_62.agc:160
//# BEGINNING WITH THE LOCATION CALLED SCAXIS.  THE COMPONENTS OF THIS VECTOR ARE GIVEN IN SPACECRAFT COORDINATES.
// PORT: SOURCE R60_62.agc:161
//# THE DIRECTION IN WHICH THIS AXIS IS TO BE POINTED MUST APPEAR AS A HALF UNIT DOUBLE PRECISION VECTOR IN
// PORT: SOURCE R60_62.agc:162
//# SUCCESSIVE LOCATIONS OF ERASABLE MEMORY BEGINNING WITH THE ADDRESS CALLED POINTVSM.  THE COMPONENTS OF THIS
// PORT: SOURCE R60_62.agc:163
//# VECTOR ARE GIVEN IN STABLE MEMBER COORDINATES.  WITH THIS INFORMATION VECPOINT COMPUTES A SET OF THREE GIMBAL
// PORT: SOURCE R60_62.agc:164
//# ANGLES (2S COMPLEMENT) CORRESPONDING TO THE CROSS-PRODUCT ROTATION BETWEEN SCAXIS AND POINTVSM AND STORES THEM
// PORT: SOURCE R60_62.agc:165
//# IN T(MPAC) BEFORE RETURNING TO THE CALLER.
// PORT: SOURCE R60_62.agc:166
//# 	THIS ROTATION, HOWEVER, MAY BRING THE S/C INTO GIMBAL LOCK.  WHEN POINTING A VECTOR IN THE Y-Z PLANE,
// PORT: SOURCE R60_62.agc:167
//# THE TRANSPONDER AXIS, OR THE AOT FOR THE LEM, THE PROGRAM WILL CORRECT THIS PROBLEM BY ROTATING THE CROSS-
// PORT: SOURCE R60_62.agc:168
//# PRODUCT ATTITUDE ABOUT POINTVSM BY A FIXED AMOUNT SUFFICIENT TO ROTATE THE DESIRED S/C ATTITUDE OUT OF GIMBAL
// PORT: SOURCE R60_62.agc:169
//# LOCK.  IF THE AXIS TO BE POINTED IS MORE THAN 40.6 DEGREES BUT LESS THAN 60.5 DEG FROM THE +X (OR-X) AXIS,
// PORT: SOURCE R60_62.agc:170
//# THE ADDITIONAL ROTATION TO AVOID GIMBAL LOCK IS 35 DEGREES.  IF THE AXIS IS MORE THAN 60.5 DEGREES FROM +X (OR -X)
// PORT: SOURCE R60_62.agc:171
//# THE ADDITIONAL ROTATION IS 35 DEGREES.  THE GIMBAL ANGLES CORRESPONDING TO THIS ATTITUDE ARE THEN COMPUTED AND
// PORT: SOURCE R60_62.agc:172
//# STORED AS 2S COMPLIMENT ANGLES IN T(MPAC) BEFORE RETURNING TO THE CALLER.
// PORT: SOURCE R60_62.agc:173
//#	WHEN POINTING THE X-AXIS, OR THE THRUST VECTOR, OR ANY VECTOR WITHIN 40.6 DEG OF THE X-AXIS, VECPOINT
// PORT: SOURCE R60_62.agc:174
//# CANNOT CORRECT FOR A CROSS-PRODUCT ROTATION INTO GIMBAL LOCK.  IN THIS CASE A PLATFORM REALIGNMENT WOULD BE
// PORT: SOURCE R60_62.agc:175
//# REQUIRED TO POINT THE VECTOR IN THE DESIRED DIRECTION.  AT PRESENT NO INDICATION IS GIVEN FOR THIS SITUATION
// PORT: SOURCE R60_62.agc:176
//# EXCEPT THAT THE FINAL MIDDLE GIMBAL ANGLE IN MPAC +2 IS GREATER THAN 59 DEGREES.
// PORT: SOURCE R60_62.agc:177
//
// PORT: SOURCE R60_62.agc:178
//# 	CALLING SEQUENCE -
// PORT: SOURCE R60_62.agc:179
//#		1) LOAD SCAXIS, POINTVSM
// PORT: SOURCE R60_62.agc:180
//#		2) CALL
// PORT: SOURCE R60_62.agc:181
//#			VECPOINT
// PORT: SOURCE R60_62.agc:182
//
// PORT: SOURCE R60_62.agc:183
//# 	RETURNS WITH
// PORT: SOURCE R60_62.agc:184
//
// PORT: SOURCE R60_62.agc:185
//#		1) DESIRED OUTER GIMBAL ANGLE IN MPAC
// PORT: SOURCE R60_62.agc:186
//#		2) DESIRED INNER GIMBAL ANGLE IN MPAC +1
// PORT: SOURCE R60_62.agc:187
//#		3) DESIRED MIDDLE GIMBAL ANGLE IN MPAC +2
// PORT: SOURCE R60_62.agc:188
//
// PORT: SOURCE R60_62.agc:189
//
// PORT: SOURCE R60_62.agc:190
//# 	ERASABLES USED -
// PORT: SOURCE R60_62.agc:191
//
// PORT: SOURCE R60_62.agc:192
//#		1) SCAXIS		6
// PORT: SOURCE R60_62.agc:193
//#		2) POINTVSM		6
// PORT: SOURCE R60_62.agc:194
//#		3) MIS			18
// PORT: SOURCE R60_62.agc:195
//#		4) DEL			18
// PORT: SOURCE R60_62.agc:196
//#		5) COF			6
// PORT: SOURCE R60_62.agc:197
//#		6) VECQTEMP		1
// PORT: SOURCE R60_62.agc:198
//#		7) ALL OF VAC AREA	43
// PORT: SOURCE R60_62.agc:199
//
// PORT: SOURCE R60_62.agc:200
//#				TOTAL	99
// PORT: SOURCE R60_62.agc:201
//
// PORT: SOURCE R60_62.agc:202
//		SETLOC	VECPT
// PORT: SOURCE R60_62.agc:203
//		BANK
// PORT: SOURCE R60_62.agc:204
//# Page 394
// PORT: SOURCE R60_62.agc:205
//		EBANK=	BCDU
// PORT: SOURCE R60_62.agc:206
//
// PORT: SOURCE R60_62.agc:207
//		COUNT	27/VECPT
// PORT: SOURCE R60_62.agc:208
//
// PORT: SOURCE R60_62.agc:209
//VECPOINT	STQ	BOV		# SAVE RETURN ADDRESS
// PORT: Fixed ROM slots 25686.
    25686, 32800,
// PORT: SOURCE R60_62.agc:210
//			VECQTEMP
// PORT: Fixed ROM slots 25687.
    25687, 3472,
// PORT: SOURCE R60_62.agc:211
//			VECLEAR		# AND CLEAR OVFIND
// PORT: Fixed ROM slots 25688.
    25688, 47282,
// PORT: SOURCE R60_62.agc:212
//VECLEAR		AXC,2	RTB
// PORT: Fixed ROM slots 25689.
    25689, 40168,
// PORT: SOURCE R60_62.agc:213
//			MIS		# READ THE PRESENT CDU ANGLES AND
// PORT: Fixed ROM slots 25690.
    25690, 3488,
// PORT: SOURCE R60_62.agc:214
//			READCDUK	# STORE THEM IN PD25, 26, 27
// PORT: Fixed ROM slots 25691.
    25691, 37372,
// PORT: SOURCE R60_62.agc:215
//		STCALL	25D
// PORT: Fixed ROM slots 25692.
    25692, 28724,
// PORT: SOURCE R60_62.agc:216
//			CDUTODCM	# S/C AXES TO STABLE MEMBER AXES (MIS)
// PORT: Fixed ROM slots 25693.
    25693, 37386,
// PORT: SOURCE R60_62.agc:217
//		VLOAD	VXM
// PORT: Fixed ROM slots 25694.
    25694, 50682,
// PORT: SOURCE R60_62.agc:218
//			POINTVSM	# RESOLVE THE POINTING DIRECTION VF INTO
// PORT: Fixed ROM slots 25695.
    25695, 3550,
// PORT: SOURCE R60_62.agc:219
//			MIS		# INITIAL S/C AXES ( VF = POINTVSM)
// PORT: Fixed ROM slots 25696.
    25696, 3490,
// PORT: SOURCE R60_62.agc:220
//		UNIT
// PORT: Fixed ROM slots 25697.
    25697, 65372,
// PORT: SOURCE R60_62.agc:221
//		STORE	28D
// PORT: Fixed ROM slots 25698.
    25698, 58,
// PORT: SOURCE R60_62.agc:222
//					# PD 28 29 30 31 32 33
// PORT: SOURCE R60_62.agc:223
//		VXV	UNIT		# TAKE THE CROSS PRODUCT VF X VI
// PORT: Fixed ROM slots 25699.
    25699, 44602,
// PORT: SOURCE R60_62.agc:224
//			SCAXIS		# WHERE VI = SCAXIS
// PORT: Fixed ROM slots 25700.
    25700, 3538,
// PORT: SOURCE R60_62.agc:225
//		BOV	VCOMP
// PORT: Fixed ROM slots 25701.
    25701, 48640,
// PORT: SOURCE R60_62.agc:226
//			PICKAXIS
// PORT: Fixed ROM slots 25702.
    25702, 47452,
// PORT: SOURCE R60_62.agc:227
//		STODL	COF		# CHECK MAGNITUDE
// PORT: Fixed ROM slots 25703.
    25703, 15814,
// PORT: SOURCE R60_62.agc:228
//			36D		# OF CROSS PRODUCT
// PORT: Fixed ROM slots 25704.
    25704, 74,
// PORT: SOURCE R60_62.agc:229
//		DSU	BMN		# VECTOR, IF LESS
// PORT: Fixed ROM slots 25705.
    25705, 41002,
// PORT: SOURCE R60_62.agc:230
//			DPB-14		# THAN B-14 ASSUME
// PORT: Fixed ROM slots 25706.
    25706, 14766,
// PORT: SOURCE R60_62.agc:231
//			PICKAXIS	# UNIT OPERATION
// PORT: Fixed ROM slots 25707.
    25707, 47452,
// PORT: SOURCE R60_62.agc:232
//		VLOAD	DOT		# 	INVALID.
// PORT: Fixed ROM slots 25708.
    25708, 41466,
// PORT: SOURCE R60_62.agc:233
//			SCAXIS
// PORT: Fixed ROM slots 25709.
    25709, 3538,
// PORT: SOURCE R60_62.agc:234
//			28D
// PORT: Fixed ROM slots 25710.
    25710, 58,
// PORT: SOURCE R60_62.agc:235
//		SL1	ARCCOS
// PORT: Fixed ROM slots 25711.
    25711, 54996,
// PORT: SOURCE R60_62.agc:236
//COMPMATX	CALL			# NOW COMPUTE THE TRANSFORMATION FROM
// PORT: Fixed ROM slots 25712.
    25712, 65320,
// PORT: SOURCE R60_62.agc:237
//			DELCOMP		# FINAL S/C AXES TO INITIAL S/C AXES MFI
// PORT: Fixed ROM slots 25713.
    25713, 37552,
// PORT: SOURCE R60_62.agc:238
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 25714.
    25714, 62688,
// PORT: SOURCE R60_62.agc:239
//			MIS		# COMPUTE THE TRANSFORMATION FROM FINAL
// PORT: Fixed ROM slots 25715.
    25715, 3488,
// PORT: SOURCE R60_62.agc:240
//			DEL		# S/C AXES TO STABLE MEMBER AXES
// PORT: Fixed ROM slots 25716.
    25716, 3626,
// PORT: SOURCE R60_62.agc:241
//		CALL			# MFS = MIS MFI
// PORT: Fixed ROM slots 25717.
    25717, 65320,
// PORT: SOURCE R60_62.agc:242
//			MXM3		# (IN PD LIST)
// PORT: Fixed ROM slots 25718.
    25718, 37256,
// PORT: SOURCE R60_62.agc:243
//
// PORT: SOURCE R60_62.agc:244
//		DLOAD	ABS
// PORT: Fixed ROM slots 25719.
    25719, 42698,
// PORT: SOURCE R60_62.agc:245
//			6		# MFS6 = SIN(CPSI)			$2
// PORT: Fixed ROM slots 25720.
    25720, 14,
// PORT: SOURCE R60_62.agc:246
//		DSU	BMN
// PORT: Fixed ROM slots 25721.
    25721, 41002,
// PORT: SOURCE R60_62.agc:247
//			SINGIMLC	# = SIN(59 DEGS)			$2
// PORT: Fixed ROM slots 25722.
    25722, 14744,
// PORT: SOURCE R60_62.agc:248
//			FINDGIMB	# /CPSI/ LESS THAN 59 DEGS
// PORT: Fixed ROM slots 25723.
    25723, 47436,
// PORT: SOURCE R60_62.agc:249
//					# I.E. DESIRED ATTITUDE NOT IN GIMBAL LOCK
// PORT: SOURCE R60_62.agc:250
//
// PORT: SOURCE R60_62.agc:251
//		DLOAD	ABS		# CHECK TO SEE IF WE ARE POINTING
// PORT: Fixed ROM slots 25724.
    25724, 42698,
// PORT: SOURCE R60_62.agc:252
//			SCAXIS		# THE THRUST AXIS
// PORT: Fixed ROM slots 25725.
    25725, 3538,
// PORT: SOURCE R60_62.agc:253
//		DSU	BPL
// PORT: Fixed ROM slots 25726.
    25726, 42026,
// PORT: SOURCE R60_62.agc:254
//			SINVEC1		# SIN 49.4 DEGS				$2
// PORT: Fixed ROM slots 25727.
    25727, 14748,
// PORT: SOURCE R60_62.agc:255
//# Page 395
// PORT: SOURCE R60_62.agc:256
//			FINDGIMB	# IF SO, WE ARE TRYING TO POINT IT INTO
// PORT: Fixed ROM slots 25728.
    25728, 47436,
// PORT: SOURCE R60_62.agc:257
//		VLOAD			# GIMBAL LOCK, ABORT COULD GO HERE
// PORT: Fixed ROM slots 25729.
    25729, 65530,
// PORT: SOURCE R60_62.agc:258
//		STADR
// PORT: Fixed ROM slots 25730.
    25730, 65324,
// PORT: SOURCE R60_62.agc:259
//		STOVL	MIS +12D
// PORT: Fixed ROM slots 25731.
    25731, 41540,
// PORT: SOURCE R60_62.agc:260
//		STADR			# STORE MFS (IN PD LIST) IN MIS
// PORT: Fixed ROM slots 25732.
    25732, 65324,
// PORT: SOURCE R60_62.agc:261
//		STOVL	MIS +6
// PORT: Fixed ROM slots 25733.
    25733, 41552,
// PORT: SOURCE R60_62.agc:262
//		STADR
// PORT: Fixed ROM slots 25734.
    25734, 65324,
// PORT: SOURCE R60_62.agc:263
//		STOVL	MIS
// PORT: Fixed ROM slots 25735.
    25735, 41564,
// PORT: SOURCE R60_62.agc:264
//			MIS +6		# INNER GIMBAL AXIS IN FINAL S/C AXES
// PORT: Fixed ROM slots 25736.
    25736, 3502,
// PORT: SOURCE R60_62.agc:265
//		BPL	VCOMP		# LOCATE THE IG AXIS DIRECTION CLOSEST TO
// PORT: Fixed ROM slots 25737.
    25737, 48712,
// PORT: SOURCE R60_62.agc:266
//			IGSAMEX		# FINAL X S/C AXIS
// PORT: Fixed ROM slots 25738.
    25738, 47382,
// PORT: SOURCE R60_62.agc:267
//
// PORT: SOURCE R60_62.agc:268
//IGSAMEX		VXV	BMN		# FIND THE SHORTEST WAY OF ROTATING THE
// PORT: Fixed ROM slots 25739.
    25739, 41018,
// PORT: SOURCE R60_62.agc:269
//			SCAXIS		# S/C OUT OF GIMBAL LOCK BY A ROTATION
// PORT: Fixed ROM slots 25740.
    25740, 3538,
// PORT: SOURCE R60_62.agc:270
//			U=SCAXIS	# ABOUT +- SCAXIS, I.E. IF (IG (SGN MFS3)
// PORT: Fixed ROM slots 25741.
    25741, 47396,
// PORT: SOURCE R60_62.agc:271
//					# X SCAXIS . XF) LESS THAN 0, U = SCAXIS
// PORT: SOURCE R60_62.agc:272
//					# OTHERWISE U = -SCAXIS.
// PORT: SOURCE R60_62.agc:273
//
// PORT: SOURCE R60_62.agc:274
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 25742.
    25742, 48890,
// PORT: SOURCE R60_62.agc:275
//			SCAXIS
// PORT: Fixed ROM slots 25743.
    25743, 3538,
// PORT: SOURCE R60_62.agc:276
//		STCALL	COF		# ROTATE ABOUT -SCAXIS
// PORT: Fixed ROM slots 25744.
    25744, 32198,
// PORT: SOURCE R60_62.agc:277
//			CHEKAXIS
// PORT: Fixed ROM slots 25745.
    25745, 47402
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:278
//U=SCAXIS	VLOAD
// PORT: Fixed ROM slots 25746.
    25746, 65530,
// PORT: SOURCE R60_62.agc:279
//			SCAXIS
// PORT: Fixed ROM slots 25747.
    25747, 3538,
// PORT: SOURCE R60_62.agc:280
//		STORE	COF		# ROTATE ABOUT + SCAXIS
// PORT: Fixed ROM slots 25748.
    25748, 3526,
// PORT: SOURCE R60_62.agc:281
//CHEKAXIS	DLOAD	ABS
// PORT: Fixed ROM slots 25749.
    25749, 42698,
// PORT: SOURCE R60_62.agc:282
//			SCAXIS		# SEE IF WE ARE POINTING THE AOT
// PORT: Fixed ROM slots 25750.
    25750, 3538,
// PORT: SOURCE R60_62.agc:283
//		DSU	BPL
// PORT: Fixed ROM slots 25751.
    25751, 42026,
// PORT: SOURCE R60_62.agc:284
//			SINVEC2		# SIN 29.5 DEGS				$2
// PORT: Fixed ROM slots 25752.
    25752, 14752,
// PORT: SOURCE R60_62.agc:285
//			PICKANG1	# IF SO, ROTATE 50 DEGS ABOUT +- SCAXIS
// PORT: Fixed ROM slots 25753.
    25753, 47418,
// PORT: SOURCE R60_62.agc:286
//		DLOAD	GOTO		# IF NOT, MUST BE POINTING THE TRANSPONDER
// PORT: Fixed ROM slots 25754.
    25754, 43210,
// PORT: SOURCE R60_62.agc:287
//			VECANG2		# OR SOME VECTOR IN THE Y, OR Z PLANE
// PORT: Fixed ROM slots 25755.
    25755, 14760,
// PORT: SOURCE R60_62.agc:288
//			COMPMFSN	# IN THIS CASE ROTATE 35 DEGS TO GET OUT
// PORT: Fixed ROM slots 25756.
    25756, 47422,
// PORT: SOURCE R60_62.agc:289
//					# OF GIMBAL LOCK (VECANG2 $360)
// PORT: SOURCE R60_62.agc:290
//PICKANG1	DLOAD
// PORT: Fixed ROM slots 25757.
    25757, 65482,
// PORT: SOURCE R60_62.agc:291
//			VECANG1		# = 50 DEGS			      $360
// PORT: Fixed ROM slots 25758.
    25758, 14756,
// PORT: SOURCE R60_62.agc:292
//COMPMFSN	CALL
// PORT: Fixed ROM slots 25759.
    25759, 65320,
// PORT: SOURCE R60_62.agc:293
//			DELCOMP		# COMPUTE THE ROTATION ABOUT SCAXIS TO
// PORT: Fixed ROM slots 25760.
    25760, 37552,
// PORT: SOURCE R60_62.agc:294
//		AXC,1	AXC,2		# BRING MFS OUT OF GIMBAL LOCK
// PORT: Fixed ROM slots 25761.
    25761, 62688,
// PORT: SOURCE R60_62.agc:295
//			MIS
// PORT: Fixed ROM slots 25762.
    25762, 3488,
// PORT: SOURCE R60_62.agc:296
//			DEL
// PORT: Fixed ROM slots 25763.
    25763, 3626,
// PORT: SOURCE R60_62.agc:297
//		CALL			# COMPUTE THE NEW TRANSFORMATION FROM
// PORT: Fixed ROM slots 25764.
    25764, 65320,
// PORT: SOURCE R60_62.agc:298
//			MXM3		# DESIRED S/C AXES TO STABLE MEMBER AXES
// PORT: Fixed ROM slots 25765.
    25765, 37256,
// PORT: SOURCE R60_62.agc:299
//					# WHICH WILL ALIGN VI WITH VF AND AVOID
// PORT: SOURCE R60_62.agc:300
//					# GIMBAL LOCK
// PORT: SOURCE R60_62.agc:301
//FINDGIMB	AXC,1	CALL
// PORT: Fixed ROM slots 25766.
    25766, 38112,
// PORT: SOURCE R60_62.agc:302
//			0		# EXTRACT THE COMMANDED CDU ANGLES FROM
// PORT: Fixed ROM slots 25767.
    25767, 0,
// PORT: SOURCE R60_62.agc:303
//			DCMTOCDU	# THIS MATRIX
// PORT: Fixed ROM slots 25768.
    25768, 37722,
// PORT: SOURCE R60_62.agc:304
//		RTB	SETPD
// PORT: Fixed ROM slots 25769.
    25769, 33080,
// PORT: SOURCE R60_62.agc:305
//			V1STO2S		# CONVERT TO 2:S COMPLEMENT
// PORT: Fixed ROM slots 25770.
    25770, 38612,
// PORT: SOURCE R60_62.agc:306
//# Page 396
// PORT: SOURCE R60_62.agc:307
//			0
// PORT: Fixed ROM slots 25771.
    25771, 2,
// PORT: SOURCE R60_62.agc:308
//		GOTO
// PORT: Fixed ROM slots 25772.
    25772, 65360,
// PORT: SOURCE R60_62.agc:309
//			VECQTEMP	# RETURN TO CALLER
// PORT: Fixed ROM slots 25773.
    25773, 3472,
// PORT: SOURCE R60_62.agc:310
//
// PORT: SOURCE R60_62.agc:311
//PICKAXIS	VLOAD	DOT		# IF VF X VI = 0, FIND VF . VI
// PORT: Fixed ROM slots 25774.
    25774, 41466,
// PORT: SOURCE R60_62.agc:312
//			28D
// PORT: Fixed ROM slots 25775.
    25775, 58,
// PORT: SOURCE R60_62.agc:313
//			SCAXIS
// PORT: Fixed ROM slots 25776.
    25776, 3538,
// PORT: SOURCE R60_62.agc:314
//		BMN	TLOAD
// PORT: Fixed ROM slots 25777.
    25777, 59712,
// PORT: SOURCE R60_62.agc:315
//			ROT180
// PORT: Fixed ROM slots 25778.
    25778, 47468,
// PORT: SOURCE R60_62.agc:316
//			25D
// PORT: Fixed ROM slots 25779.
    25779, 52,
// PORT: SOURCE R60_62.agc:317
//		GOTO			# IF VF = VI, CDU DESIRED = PRESENT CDU
// PORT: Fixed ROM slots 25780.
    25780, 65360,
// PORT: SOURCE R60_62.agc:318
//			VECQTEMP	# PRESENT CDU ANGLES
// PORT: Fixed ROM slots 25781.
    25781, 3472,
// PORT: SOURCE R60_62.agc:319
//
// PORT: SOURCE R60_62.agc:320
//ROT180		VLOAD	VXV		# IF VF, VI ANTI-PARALLEL, 180 DEG ROTATION
// PORT: Fixed ROM slots 25782.
    25782, 40442,
// PORT: SOURCE R60_62.agc:321
//			MIS +6		# IS REQUIRED.  Y STABLE MEMBER AXIS IN
// PORT: Fixed ROM slots 25783.
    25783, 3502,
// PORT: SOURCE R60_62.agc:322
//			HIUNITX		# INITIAL S/C AXIS.
// PORT: Fixed ROM slots 25784.
    25784, 13750,
// PORT: SOURCE R60_62.agc:323
//		UNIT	VXV		# FIND Y(SM) X X(I)
// PORT: Fixed ROM slots 25785.
    25785, 40284,
// PORT: SOURCE R60_62.agc:324
//			SCAXIS		# FIND UNIT(VI X UNIT(Y(SM) X X(I)))
// PORT: Fixed ROM slots 25786.
    25786, 3538,
// PORT: SOURCE R60_62.agc:325
//		UNIT	BOV		# I.E. PICK A VECTOR IN THE PLANE OF X(I),
// PORT: Fixed ROM slots 25787.
    25787, 32860,
// PORT: SOURCE R60_62.agc:326
//			PICKX		# Y(SM) PERPENDICULAR TO VI
// PORT: Fixed ROM slots 25788.
    25788, 47504,
// PORT: SOURCE R60_62.agc:327
//		STODL	COF
// PORT: Fixed ROM slots 25789.
    25789, 15814,
// PORT: SOURCE R60_62.agc:328
//			36D		# CHECK MAGNITUDE
// PORT: Fixed ROM slots 25790.
    25790, 74,
// PORT: SOURCE R60_62.agc:329
//		DSU	BMN		# OF THIS VECTOR.
// PORT: Fixed ROM slots 25791.
    25791, 41002,
// PORT: SOURCE R60_62.agc:330
//			DPB-14		# IF LESS THAN B-14,
// PORT: Fixed ROM slots 25792.
    25792, 14766,
// PORT: SOURCE R60_62.agc:331
//			PICKX		# PICK X-AXIS.
// PORT: Fixed ROM slots 25793.
    25793, 47504,
// PORT: SOURCE R60_62.agc:332
//		VLOAD
// PORT: Fixed ROM slots 25794.
    25794, 65530,
// PORT: SOURCE R60_62.agc:333
//			COF
// PORT: Fixed ROM slots 25795.
    25795, 3526,
// PORT: SOURCE R60_62.agc:334
//XROT		STODL	COF
// PORT: Fixed ROM slots 25796.
    25796, 15814,
// PORT: SOURCE R60_62.agc:335
//			HIDPHALF
// PORT: Fixed ROM slots 25797.
    25797, 13750,
// PORT: SOURCE R60_62.agc:336
//		GOTO
// PORT: Fixed ROM slots 25798.
    25798, 65360,
// PORT: SOURCE R60_62.agc:337
//			COMPMATX
// PORT: Fixed ROM slots 25799.
    25799, 47328,
// PORT: SOURCE R60_62.agc:338
//PICKX		VLOAD	GOTO		# PICK THE XAXIS IN THIS CASE
// PORT: Fixed ROM slots 25800.
    25800, 43258,
// PORT: SOURCE R60_62.agc:339
//			HIUNITX
// PORT: Fixed ROM slots 25801.
    25801, 13750,
// PORT: SOURCE R60_62.agc:340
//			XROT
// PORT: Fixed ROM slots 25802.
    25802, 47496,
// PORT: SOURCE R60_62.agc:341
//		BANK	35
// PORT: SOURCE R60_62.agc:342
//		SETLOC	MANUVER1
// PORT: SOURCE R60_62.agc:343
//		BANK
// PORT: SOURCE R60_62.agc:344
//
// PORT: SOURCE R60_62.agc:345
//SINGIMLC	2DEC	.4285836003	# =SIN(59)			$2
// PORT: Fixed ROM slots 25803 25804.
    25803, 14042, 25804, 29940,
// PORT: SOURCE R60_62.agc:346
//
// PORT: SOURCE R60_62.agc:347
//SINVEC1		2DEC	.3796356537	# =SIN(49.4)			$2
// PORT: Fixed ROM slots 25805 25806.
    25805, 12438, 25806, 31148,
// PORT: SOURCE R60_62.agc:348
//
// PORT: SOURCE R60_62.agc:349
//SINVEC2		2DEC	.2462117800	# =SIN(29.5)			$2
// PORT: Fixed ROM slots 25807 25808.
    25807, 8066, 25808, 30598,
// PORT: SOURCE R60_62.agc:350
//
// PORT: SOURCE R60_62.agc:351
//VECANG1		2DEC	.1388888889	# = 50 DEGREES			      $360
// PORT: Fixed ROM slots 25809 25810.
    25809, 4550, 25810, 18204,
// PORT: SOURCE R60_62.agc:352
//
// PORT: SOURCE R60_62.agc:353
//VECANG2		2DEC	.09722222222	# = 35 DEGREES			      $360
// PORT: Fixed ROM slots 25811 25812.
    25811, 3184, 25812, 29128,
// PORT: SOURCE R60_62.agc:354
//
// PORT: SOURCE R60_62.agc:355
//
// PORT: SOURCE R60_62.agc:356
//1BITDP		OCT	0		# KEEP THIS BEFORE DPB(-14)	  *********
// PORT: Fixed ROM slots 25813.
    25813, 0,
// PORT: SOURCE R60_62.agc:357
//DPB-14		OCT	00001
// PORT: Fixed ROM slots 25814.
    25814, 2,
// PORT: SOURCE R60_62.agc:358
//# Page 397
// PORT: SOURCE R60_62.agc:359
//		OCT	00000
// PORT: Fixed ROM slots 25815.
    25815, 0
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25816–25817.
function agcAotUnit1494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25816 {
// PORT: SOURCE R60_62.agc:360
//		BANK	34
// PORT: SOURCE R60_62.agc:361
//		SETLOC	MANUVER
// PORT: SOURCE R60_62.agc:362
//		BANK
// PORT: SOURCE R60_62.agc:363
//
// PORT: SOURCE R60_62.agc:364
//# Page 398
// PORT: SOURCE R60_62.agc:365
//# ROUTINE FOR INITIATING AUTOMATIC MANEUVER VIA KEYBOARD (V49)
// PORT: SOURCE R60_62.agc:366
//
// PORT: SOURCE R60_62.agc:367
//		EBANK=	CPHI
// PORT: SOURCE R60_62.agc:368
//
// PORT: SOURCE R60_62.agc:369
//		COUNT	27/R62
// PORT: SOURCE R60_62.agc:370
//
// PORT: SOURCE R60_62.agc:371
//R62DISP		CAF	V06N22		# DISPLAY COMMAND ICDUS CPHI, CTHETA, CPHI
// PORT: Fixed ROM slots 25816.
        if slot <> 25816 or instruction <> 14890 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2602), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE R60_62.agc:372
//		TC	BANKCALL
// PORT: Fixed ROM slots 25817.
        if slot <> 25817 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1494] to agcAotUnit1494@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:373
//		CADR	GOFLASH
// PORT: Fixed ROM slots 25818.
    25818, 17312
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25819–25822.
function agcAotUnit1495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25820 {
        if slot <= 25819 {
// PORT: SOURCE R60_62.agc:374
//		TCF	ENDEXT
// PORT: Fixed ROM slots 25819.
            if slot <> 25819 or instruction <> 7004 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7004, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R60_62.agc:375
//		TCF	GOMOVE		# PROCEED
// PORT: Fixed ROM slots 25820.
            if slot <> 25820 or instruction <> 5342 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5342, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25821 {
// PORT: SOURCE R60_62.agc:376
//		TCF	R62DISP		# ENTER
// PORT: Fixed ROM slots 25821.
            if slot <> 25821 or instruction <> 5336 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5336, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE R60_62.agc:377
//
// PORT: SOURCE R60_62.agc:378
//					# ASTRONAUT MAY LOAD NEW ICDUS AT THIS
// PORT: SOURCE R60_62.agc:379
//					# POINT
// PORT: SOURCE R60_62.agc:380
//GOMOVE		TC	UPFLAG		# SET 3-AXIS FLAG
// PORT: Fixed ROM slots 25822.
            if slot <> 25822 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1495] to agcAotUnit1495@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:381
//		ADRES	3AXISFLG	# BIT 6	FLAG 5
// PORT: Fixed ROM slots 25823.
    25823, 168
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25824–25824.
function agcAotUnit1496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R60_62.agc:382
//
// PORT: SOURCE R60_62.agc:383
//		TC	BANKCALL
// PORT: Fixed ROM slots 25824.
    if slot <> 25824 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1496] to agcAotUnit1496@.

agcAotInstallSourceRope(list(
// PORT: SOURCE R60_62.agc:384
//		CADR	R60CSM
// PORT: Fixed ROM slots 25825.
    25825, 47104
)).

// PORT: Physical bank 27. Shared continuation entries, slots 25826–25826.
function agcAotUnit1497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE R60_62.agc:385
//		TCF	ENDEXT
// PORT: Fixed ROM slots 25826.
    if slot <> 25826 or instruction <> 7004 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7004, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1497] to agcAotUnit1497@.

