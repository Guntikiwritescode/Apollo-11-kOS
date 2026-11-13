// CM_ENTRY_DIGITAL_AUTOPILOT.agc
// bank 15, slots 15644-15672
function agcAotUnit912 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15657 {
        if slot <= 15650 {
            if slot <= 15646 {
                if slot <= 15644 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:2
//# Filename:	CM_ENTRY_DIGITAL_AUTOPILOT.agc
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:4
//#		It is part of the source code for the Command Module's (CM)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:9
//# Pages:	1063-1092
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:11
//#				same name, using Comanche055 page images.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:12
//#		2009-05-20 RSB	Corrections: Removed an extraneous label
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:13
//#				EXDAPIN, added a missing instruction in
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:14
//#				COMPAT.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:15
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:16
//# This source code has been transcribed or otherwise adapted from digitized
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:17
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:18
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:19
//# thanks to both.  The images (with suitable reduction in storage size and
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:20
//# consequent reduction in image quality as well) are available online at
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:21
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:22
//# illegible, contact me at info@sandroid.org about getting access to the
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:23
//# (much) higher-quality images which Paul actually created.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:24
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:25
//# Notations on the hardcopy document read, in part:
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:26
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:27
//#	Assemble revision 055 of AGC program Comanche by NASA
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:28
//#	2021113-051.  10:28 APR. 1, 1969
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:29
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:30
//#	This AGC program shall also be referred to as
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:31
//#			Colossus 2A
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:32
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:33
//# Page 1063
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:34
//# SUBROUTINE TO READ GIMBAL ANGLES AND FORM DIFFERENCES.  GIMBAL ANGLES ARE SAVED IN 2S COMPLEMENT, BUT THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:35
//# DIFFERENCES ARE IN 1S COMP.  ENTER AND READ ANGLES EACH .1 SEC.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:36
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:37
//#	CM/DSTBY = 1 FOR DAP OPERATION
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:38
//#	CM/DSTBY = 0 TO TERMINATE DAP OPERATION.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:39
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:40
//		BANK	15
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:41
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:42
//		SETLOC	ETRYDAP
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:43
//		BANK
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:44
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:45
//		COUNT	15/DAPEN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:46
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:47
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:48
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:49
//READGYMB	CA	TEN		# KEEP RESTART DT GOING RELATIVE TO
// slot 15644
                    if slot <> 15644 or instruction <> 14591 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2303), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15645 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:50
//		ADS	CM/GYMDT	# PIPTIME. (GROUP 6)
// slot 15645
                        if slot <> 15645 or instruction <> 12245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 981).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:51
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:52
//					# IF A RESTART OCCURS, SKIP PRESENT CYCLE. THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:53
//					# PHASCHNG PROTECTION IS IN CM/DAPIC.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:54
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:55
//		CA	BIT6		# CHECK FOR FINE ALIGN MODE OF CDU.
// slot 15646
                        if slot <> 15646 or instruction <> 14858 { return choose false if checkOnly else -1. }
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
                if slot <= 15648 {
                    if slot <= 15647 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:56
//		MASK	IMODES33	# ( PROTECT AOG/PIP ETC AS WELL AS
// slot 15647
                        if slot <> 15647 or instruction <> 29393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:57
//		EXTEND			#  GIMBAL DIFFERENCES)
// slot 15648
                        if slot <> 15648 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15649 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:58
//		BZF	READGYM1	# OK
// slot 15649
                        if slot <> 15649 or instruction <> 5415 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5415, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:59
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:60
//		CS	BIT1		# NOT IN FINE ALIGN, SO IDLE.
// slot 15650
                        if slot <> 15650 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15653 {
                if slot <= 15651 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:61
//		MASK	CM/FLAGS	# SET GYMDIFSW = 0
// slot 15651
                    if slot <> 15651 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15652 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:62
//		TS	CM/FLAGS
// slot 15652
                        if slot <> 15652 or instruction <> 22594 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22594, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:63
//		TC	FLUSHJET	# QUENCH JETS, SINCE MAY BE A WHILE.
// slot 15653
                        if slot <> 15653 or instruction <> 3072 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3072, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15655 {
                    if slot <= 15654 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:64
//		TC	CM/GYMIC +2
// slot 15654
                        if slot <> 15654 or instruction <> 1356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1356, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:65
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:66
//READGYM1	CA	CDUX
// slot 15655
                        if slot <> 15655 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15656 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:67
//		XCH	AOG
// slot 15656
                        if slot <> 15656 or instruction <> 24497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 945, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:68
//		EXTEND
// slot 15657
                        if slot <> 15657 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 15664 {
            if slot <= 15660 {
                if slot <= 15658 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:69
//		MSU	AOG		# -DELAOG=AOG(N-1) - AOG(N)
// slot 15658
                    if slot <> 15658 or instruction <> 9137 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMSU(words, 945).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15659 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:70
//		TS	-DELAOG
// slot 15659
                        if slot <> 15659 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:71
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:72
//		CA	CDUY
// slot 15660
                        if slot <> 15660 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15662 {
                    if slot <= 15661 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:73
//		XCH	AIG
// slot 15661
                        if slot <> 15661 or instruction <> 24498 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 946, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:74
//		EXTEND
// slot 15662
                        if slot <> 15662 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15663 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:75
//		MSU	AIG
// slot 15663
                        if slot <> 15663 or instruction <> 9138 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 946).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:76
//		TS	-DELAIG
// slot 15664
                        if slot <> 15664 or instruction <> 23486 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23486, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15668 {
                if slot <= 15666 {
                    if slot <= 15665 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:77
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:78
//		CA	CDUZ
// slot 15665
                        if slot <> 15665 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 28).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:79
//		XCH	AMG
// slot 15666
                        if slot <> 15666 or instruction <> 24499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 947, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15667 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:80
//		EXTEND
// slot 15667
                        if slot <> 15667 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:81
//		MSU	AMG
// slot 15668
                        if slot <> 15668 or instruction <> 9139 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 947).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15670 {
                    if slot <= 15669 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:82
//		TS	-DELAMG
// slot 15669
                        if slot <> 15669 or instruction <> 23487 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23487, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:83
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:84
//# Page 1064
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:85
//DOBRATE?	CS	CM/FLAGS	# CM/DSTBY=103D BIT2  GYMDIFSW=104D BIT1
// slot 15670
                        if slot <> 15670 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15671 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:86
//		MASK	THREE
// slot 15671
                        if slot <> 15671 or instruction <> 31884 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                            if fixedOperand = 3 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:87
//		INDEX	A
// slot 15672
                        if slot <> 15672 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[912] to agcAotUnit912@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:88
//		TC	+1
// slot 15673
    15673, 2676
)).

// bank 15, slots 15674-15678
function agcAotUnit913 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15675 {
        if slot <= 15674 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:89
//		TC	DOBRATE		# OK, GO ON
// slot 15674
            if slot <> 15674 or instruction <> 1345 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1345, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:90
//		TC	CM/GYMIC	# DONT CALC BODYRATE ON FIRST PASS.
// slot 15675
            if slot <> 15675 or instruction <> 1354 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1354, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15676 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:91
//		NOOP
// slot 15676
            if slot <> 15676 or instruction <> 5437 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5437, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15677 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:92
//		TC	FLUSHJET	# TURN OFF ALL JETS
// slot 15677
                if slot <> 15677 or instruction <> 3072 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3072, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:93
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:94
//		TC	PHASCHNG
// slot 15678
                if slot <> 15678 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[913] to agcAotUnit913@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:95
//		OCT	00006		# DEACTIVATE DAP GROUP 6.
// slot 15679
    15679, 12
)).

// bank 15, slots 15680-15684
function agcAotUnit914 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15681 {
        if slot <= 15680 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:96
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:97
//		TC	TASKOVER
// slot 15680
            if slot <> 15680 or instruction <> 2772 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2772, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:98
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:99
//DOBRATE		CA	ONE		# DO BODYRATE
// slot 15681
            if slot <> 15681 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15682 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:100
//DOBRATE1	TS	JETEM		# SKIP BODYRATE.
// slot 15682
            if slot <> 15682 or instruction <> 23504 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23504, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15683 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:101
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:102
//		CA	TEN		# KEEP CDU READ GOING.
// slot 15683
                if slot <> 15683 or instruction <> 14591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2303), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:103
//		TC	WAITLIST
// slot 15684
                if slot <> 15684 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[914] to agcAotUnit914@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:104
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:105
//		2CADR	READGYMB
// slot 15685 15686
    15685, 2616, 15686, 26732
)).

// bank 15, slots 15687-15700
function agcAotUnit915 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15693 {
        if slot <= 15689 {
            if slot <= 15687 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:106
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:107
//					# DOES NOT PROTECT TEMK, SQ IN SPSIN/COS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:108
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:109
//		CCS	JETEM
// slot 15687
                if slot <> 15687 or instruction <> 5072 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 976).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15688 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:110
//		TC	BODYRATE
// slot 15688
                    if slot <> 15688 or instruction <> 1374 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1374, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:111
//		TC	TASKOVER	# SKIP CALC ON INITIAL PASS. (PASSES)
// slot 15689
                    if slot <> 15689 or instruction <> 2772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2772, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15691 {
                if slot <= 15690 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:112
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:113
//CM/GYMIC	ADS	CM/FLAGS	# GYMDIFSW: C(A)=1, KNOW BIT IS 0
// slot 15690
                    if slot <> 15690 or instruction <> 11330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:114
//		CAF	ZERO
// slot 15691
                    if slot <> 15691 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15692 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:115
//		TS	JETAG
// slot 15692
                    if slot <> 15692 or instruction <> 23497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:116
//		TS	OLDELP
// slot 15693
                    if slot <> 15693 or instruction <> 23494 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23494, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15696 {
            if slot <= 15694 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:117
//		TS	OLDELQ
// slot 15694
                if slot <> 15694 or instruction <> 23495 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23495, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15695 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:118
//		TS	OLDELR
// slot 15695
                    if slot <> 15695 or instruction <> 23496 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23496, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:119
//		TS	GAMDOT		# NO GYM DIF, PROB NO GAM DIF.
// slot 15696
                    if slot <> 15696 or instruction <> 23507 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23507, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15698 {
                if slot <= 15697 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:120
//		TC	DOBRATE1
// slot 15697
                    if slot <> 15697 or instruction <> 1346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1346, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:121
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:122
//# Page 1065
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:123
//# COME HERE TO CORRECT FOR OVERFLOW IN ANGULAR CALCULATIONS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:124
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:125
//ANGOVCOR	TS	L		# THIS COSTS 2 MCT TO USE.
// slot 15698
                    if slot <> 15698 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15699 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:126
//		TC	Q		# NO OVFL
// slot 15699
                    if slot <> 15699 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:127
//		INDEX	A
// slot 15700
                    if slot <> 15700 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[915] to agcAotUnit915@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:128
//		CAF	LIMITS
// slot 15701
    15701, 29696
)).

// bank 15, slots 15702-15703
function agcAotUnit916 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15702 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:129
//		ADS	L
// slot 15702
        if slot <> 15702 or instruction <> 11265 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:130
//		TC	Q
// slot 15703
        if slot <> 15703 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[916] to agcAotUnit916@.

// bank 03, slots 5120-5125
function agcAotUnit245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5122 {
        if slot <= 5120 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:131
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:132
//		BLOCK	3
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:133
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:134
//		COUNT	03/DAPEN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:135
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:136
//FLUSHJET	CA	7		# COME HERE TO TURN OFF ALL JETS.
// slot 5120
            if slot <> 5120 or instruction <> 12295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 7).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5121 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:137
//		EXTEND
// slot 5121
                if slot <> 5121 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:138
//		WRITE	ROLLJETS	# ZERO CHANNEL 6
// slot 5122
                if slot <> 5122 or instruction <> 518 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 5123 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:139
//		EXTEND
// slot 5123
            if slot <> 5123 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5124 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:140
//		WRITE	PYJETS		# ZERO CHANNEL 5
// slot 5124
                if slot <> 5124 or instruction <> 517 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:141
//		TC	Q
// slot 5125
                if slot <> 5125 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[245] to agcAotUnit245@.

// bank 15, slots 15704-15709
function agcAotUnit917 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15706 {
        if slot <= 15704 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:142
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:143
//		BANK	15
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:144
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:145
//		COUNT	15/DAPEN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:146
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:147
//		SETLOC	ETRYDAP
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:148
//		BANK
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:149
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:150
//RATEAVG		COM			# SUBROUTINE TO ESTIMATE RATES IN PRESENCE
// slot 15704
            if slot <> 15704 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15705 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:151
//		AD	JETEM		# OF CONSTANT ACCELERATION.
// slot 15705
                if slot <> 15705 or instruction <> 25552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 976).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:152
//		EXTEND
// slot 15706
                if slot <> 15706 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15707 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:153
//		MP	HALF		# DELV (EST) = DELV +(DELV-OLDELV)/2
// slot 15707
            if slot <> 15707 or instruction <> 31234 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 15708 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:154
//		AD	JETEM
// slot 15708
                if slot <> 15708 or instruction <> 25552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 976).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:155
//		TC	Q
// slot 15709
                if slot <> 15709 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[917] to agcAotUnit917@.

// bank 20, slots 19338-19340
function agcAotUnit1111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19338 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:156
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:157
//# Page 1066
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:158
//# THESE ARE CALLED FOR THE VARIOUS INITIALIZATIONS NEEDED.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:159
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:160
//		BANK	20
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:161
//		SETLOC	DAPS1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:162
//		BANK
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:163
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:164
//		COUNT	20/DAPEN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:165
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:166
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:167
//CM/DAPON	CA	EBAOG
// slot 19338
        if slot <> 19338 or instruction <> 14895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2607), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19339 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:168
//		TS	EBANK
// slot 19339
            if slot <> 19339 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:169
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:170
//		TC	DOWNFLAG	# RESET DAPBIT1.  T5 RESTART IDENTIFIER.
// slot 19340
            if slot <> 19340 or instruction <> 2928 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2928, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1111] to agcAotUnit1111@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:171
//		ADRES	DAPBIT1		# BIT 15 FLAG 6		CM FLAGS.
// slot 19341
    19341, 180
)).

// bank 20, slots 19342-19342
function agcAotUnit1112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:172
//		TC	DOWNFLAG	# RESET DAPBIT2
// slot 19342
    if slot <> 19342 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1112] to agcAotUnit1112@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:173
//		ADRES	DAPBIT2		# BIT 14 FLAG 6
// slot 19343
    19343, 182
)).

// bank 20, slots 19344-19356
function agcAotUnit1113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19349 {
        if slot <= 19346 {
            if slot <= 19344 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:174
//		EXTEND
// slot 19344
                if slot <> 19344 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19345 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:175
//		DCA	T5IDLER1	# DISABLE RCS CALCULATION
// slot 19345
                    if slot <> 19345 or instruction <> 14303 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2015, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:176
//		DXCH	T5LOC
// slot 19346
                    if slot <> 19346 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19347 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:177
//		EXTEND
// slot 19347
                if slot <> 19347 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19348 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:178
//		DCA	T5IDLER1	# DISABLE RCS JET CALLS
// slot 19348
                    if slot <> 19348 or instruction <> 14303 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2015, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:179
//		DXCH	T6LOC
// slot 19349
                    if slot <> 19349 or instruction <> 22217 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 713, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19352 {
            if slot <= 19350 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:180
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:181
//		TC	FLUSHJET	# JETS DEPARTED ON SM. ZERO JET BITS.
// slot 19350
                if slot <> 19350 or instruction <> 3072 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3072, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19351 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:182
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:183
//		CS	13,14,15
// slot 19351
                    if slot <> 19351 or instruction <> 20423 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:184
//		MASK	DAPDATR1	# SET CONFIG BITS =0 FOR ENTRY
// slot 19352
                    if slot <> 19352 or instruction <> 29494 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19354 {
                if slot <= 19353 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:185
//		TS	DAPDATR1
// slot 19353
                    if slot <> 19353 or instruction <> 23350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23350, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:186
//		TC	+4
// slot 19354
                    if slot <> 19354 or instruction <> 1950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19355 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:187
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:188
//NOTYET		CA	.5SEC
// slot 19355
                    if slot <> 19355 or instruction <> 14878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:189
//		TC	BANKCALL
// slot 19356
                    if slot <> 19356 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1113] to agcAotUnit1113@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:190
//		CADR	DELAYJOB	# (DELAYJOB DOES INHINT)
// slot 19357
    19357, 1972
)).

// bank 20, slots 19358-19384
function agcAotUnit1114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19370 {
        if slot <= 19363 {
            if slot <= 19360 {
                if slot <= 19358 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:191
//	+4	CA	BIT11		# GAMDIFSW = 94D BIT11, INITLY=0
// slot 19358
                    if slot <> 19358 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19359 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:192
//		MASK	CM/FLAGS	# IF ZERO, WAIT UNTIL CM/POSE UPDATE.
// slot 19359
                        if slot <> 19359 or instruction <> 28738 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:193
//		EXTEND
// slot 19360
                        if slot <> 19360 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19361 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:194
//		BZF	NOTYET
// slot 19361
                    if slot <> 19361 or instruction <> 6043 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6043, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19362 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:195
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:196
//		CS	ONE		# ACTIVATE CM/DAP
// slot 19362
                        if slot <> 19362 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:197
//		TS	RCSFLAGS	# USE BIT3 TO INITIALIZE NEEDLER ON
// slot 19363
                        if slot <> 19363 or instruction <> 23361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23361, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19366 {
                if slot <= 19364 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:198
//					# NEXT PASS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:199
//		TS	P63FLAG		# SO WAKEP62 WILL NOT BE INITIATED UNTIL
// slot 19364
                    if slot <> 19364 or instruction <> 23511 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23511, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19365 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:200
//					# HEADSUP IS SET IN P62.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:201
//					# FLAG TO PREVENT MULTIPLE CALLS TO WAKEP62.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:202
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:203
//		CA	7
// slot 19365
                        if slot <> 19365 or instruction <> 12295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 7).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:204
//		TS	JETAG
// slot 19366
                        if slot <> 19366 or instruction <> 23497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19368 {
                    if slot <= 19367 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:205
//		TS	PAXERR1		# KEEP NEEDLES ZERO UNTIL DAP UPDATE
// slot 19367
                        if slot <> 19367 or instruction <> 23499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23499, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:206
//					# IN CASE CMDAPMOD IS NOT +1.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:207
//# Page 1067
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:208
//		INHINT
// slot 19368
                        if slot <> 19368 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19369 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:209
//		EXTEND
// slot 19369
                        if slot <> 19369 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:210
//		DCA	ALFA/180	# DO ATTITUDE HOLD UNTIL KEYBOARD
// slot 19370
                        if slot <> 19370 or instruction <> 13238 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 950, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19377 {
            if slot <= 19373 {
                if slot <= 19371 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:211
//		DXCH	ALFACOM		# ESTABLISHES HEADSUP.
// slot 19371
                    if slot <> 19371 or instruction <> 22404 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 900, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19372 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:212
//		CA	ROLL/180
// slot 19372
                        if slot <> 19372 or instruction <> 13236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 948).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:213
//		TS	ROLLHOLD	# FOR ATTITUDE HOLD IN MODE +1.
// slot 19373
                        if slot <> 19373 or instruction <> 23503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23503, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19375 {
                    if slot <= 19374 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:214
//		EXTEND
// slot 19374
                        if slot <> 19374 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:215
//		MP	HALF
// slot 19375
                        if slot <> 19375 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19376 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:216
//		TS	ROLLC		# NOT INTERESTED IN LO WORD.
// slot 19376
                        if slot <> 19376 or instruction <> 23501 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23501, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:217
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:218
//		CS	CM/FLAGS
// slot 19377
                        if slot <> 19377 or instruction <> 16450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 66).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19380 {
                if slot <= 19378 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:219
//		MASK	BIT12		# CMDAPARM =93D BIT12  INITLY=0
// slot 19378
                    if slot <> 19378 or instruction <> 31236 { return choose false if checkOnly else -1. }
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
                    if slot <= 19379 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:220
//		ADS	CM/FLAGS	# SET BIT TO 1.
// slot 19379
                        if slot <> 19379 or instruction <> 11330 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:221
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:222
//		CS	FLAGWRD2	# SET  NODOFLAG  TO PREVENT FURTHER
// slot 19380
                        if slot <> 19380 or instruction <> 16446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 62).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19382 {
                    if slot <= 19381 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:223
//		MASK	BIT1		# V 37 ENTRIES.
// slot 19381
                        if slot <> 19381 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:224
//		ADS	FLAGWRD2
// slot 19382
                        if slot <> 19382 or instruction <> 11326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19383 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:225
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:226
//		RELINT
// slot 19383
                        if slot <> 19383 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:227
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:228
//		TC	POSTJUMP
// slot 19384
                        if slot <> 19384 or instruction <> 2497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1114] to agcAotUnit1114@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:229
//		CADR	P62.1
// slot 19385
    19385, 45508
)).

// bank 20, slots 19386-19403
function agcAotUnit1115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19394 {
        if slot <= 19389 {
            if slot <= 19387 {
                if slot <= 19386 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:230
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:231
//# Page 1068
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:232
//# INITIALIZE CM/DAP.  WAITLIST CALL FOR READGYMB.  SET SWITCH CM/DSTBY =1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:233
//# SO READACCS WILL ENTER A WTLST CALL FOR  SETJTAG .
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:234
//#  CMDAPARM  = 0, SO ONLY BODY RATE AND ATTITUDE CALCULATIONS ARE DONE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:235
//# SET AVEGEXIT TO CONTINUE AT CM/POSE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:236
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:237
//CM/DAPIC	CA	EBAOG
// slot 19386
                    if slot <> 19386 or instruction <> 14895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:238
//		TS	EBANK
// slot 19387
                    if slot <> 19387 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19388 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:239
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:240
//		INHINT
// slot 19388
                    if slot <> 19388 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:241
//CM/DAP2C	CS	PIPTIME +1
// slot 19389
                    if slot <> 19389 or instruction <> 17029 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 645).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19391 {
                if slot <= 19390 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:242
//					# PRIO OF P62 L PRIO AVG.:PIPTM=PIPTM1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:243
//		TS	JETEM
// slot 19390
                    if slot <> 19390 or instruction <> 23504 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23504, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:244
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:245
//		CA	POS1/2
// slot 19391
                    if slot <> 19391 or instruction <> 14850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19392 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:246
//		AD	POS1/2
// slot 19392
                    if slot <> 19392 or instruction <> 27138 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19393 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:247
//		AD	TIME1		# OVFL GUARANTEED
// slot 19393
                        if slot <> 19393 or instruction <> 24597 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:248
//		ADS	JETEM		# C(A) = DELTA TIME SINCE PIPUP
// slot 19394
                        if slot <> 19394 or instruction <> 12240 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 976).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19398 {
            if slot <= 19396 {
                if slot <= 19395 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:249
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:250
//		CS	FIVE
// slot 19395
                    if slot <> 19395 or instruction <> 18962 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:251
//		AD	JETEM
// slot 19396
                    if slot <> 19396 or instruction <> 25552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 976).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19397 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:252
//		CCS	A
// slot 19397
                    if slot <> 19397 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:253
//		AD	-CDUT+1
// slot 19398
                    if slot <> 19398 or instruction <> 26589 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2013), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19400 {
                if slot <= 19399 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:254
//		TCF	-2
// slot 19399
                    if slot <> 19399 or instruction <> 6085 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6085, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:255
//		NOOP
// slot 19400
                    if slot <> 19400 or instruction <> 6089 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6089, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19401 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:256
//		AD	ONE		# SEND NO ZERO TO WTLST
// slot 19401
                    if slot <> 19401 or instruction <> 27151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19402 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:257
//		TS	CM/GYMDT	# FOR RESTART
// slot 19402
                        if slot <> 19402 or instruction <> 23509 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23509, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:258
//		TC	WAITLIST
// slot 19403
                        if slot <> 19403 or instruction <> 2725 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2725, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1115] to agcAotUnit1115@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:259
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:260
//		2CADR	READGYMB
// slot 19404 19405
    19404, 2616, 19405, 26732
)).

// bank 20, slots 19406-19414
function agcAotUnit1116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19409 {
        if slot <= 19407 {
            if slot <= 19406 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:261
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:262
//		CS	CM/SWIC1	# GAMDIFSW, GYMDIFSW, CM/DSTBY
// slot 19406
                if slot <> 19406 or instruction <> 18396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2012), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:263
//		MASK	CM/FLAGS	# DAPARM, .05GSW, LATSW, ENTRYDSP
// slot 19407
                if slot <> 19407 or instruction <> 28738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19408 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:264
//		AD	CM/SWIC2	# SET CM/DSTBY, LATSW
// slot 19408
                if slot <> 19408 or instruction <> 26879 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2303), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:265
//					# DISABLE ENTRY DISPLAY, SINCE DES. GIMB.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:266
//					# CALC. (P62.3) GOES TO ENDEXIT.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:267
//		TS	CM/FLAGS
// slot 19409
                if slot <> 19409 or instruction <> 22594 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22594, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19411 {
            if slot <= 19410 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:268
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:269
//		CA	7
// slot 19410
                if slot <> 19410 or instruction <> 12295 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 7).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:270
//		TS	BETA/180	# NECESSARY:  NO OVFL CORRECTION
// slot 19411
                if slot <> 19411 or instruction <> 23478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23478, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19412 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:271
//		CA	ONE		# INITIALIZE THE TM OF BODY RATES VIA
// slot 19412
                if slot <> 19412 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19413 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:272
//		TS	SW/NDX		#   UPBUFF.
// slot 19413
                    if slot <> 19413 or instruction <> 22725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:273
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:274
//		TC	2PHSCHNG	# DOES INHINT/RELINT
// slot 19414
                    if slot <> 19414 or instruction <> 2810 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2810, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1116] to agcAotUnit1116@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:275
//		OCT	40116		# SAVE TBASE6
// slot 19415
    19415, 32924,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:276
//		OCT	05024
// slot 19416
    19416, 5160,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:277
//		OCT	13000
// slot 19417
    19417, 11264
)).

// bank 20, slots 19418-19418
function agcAotUnit1117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:278
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:279
//		TC	POSTJUMP
// slot 19418
    if slot <> 19418 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1117] to agcAotUnit1117@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:280
//# Page 1069
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:281
//		CADR	P62.2
// slot 19419
    19419, 45484,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:282
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:283
//CM/SWIC1	OCT	16017
// slot 19420
    19420, 14366,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:284
//CM/SWIC2	=	TEN		# 00012 : CM/DSTBY, LATSW
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:285
//-CDUT+1		OCT	77766
// slot 19421
    19421, 65516,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:286
//		EBANK=	T5LOC
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:287
//T5IDLER1	2CADR	T5IDLOC
// slot 19422 19423
    19422, 3286, 19423, 10340
)).

// bank 15, slots 15710-15776
function agcAotUnit918 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15742 {
        if slot <= 15725 {
            if slot <= 15717 {
                if slot <= 15713 {
                    if slot <= 15711 {
                        if slot <= 15710 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:288
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:289
//# Page 1070
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:290
//# THIS SECTION CALCULATES THE ANGULAR BODY RATES EACH .1 SEC.  THE ANGULAR RATES ARE THOSE ALONG THE BODY AXES
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:291
//# XB, YB, ZB, AND ARE NORMALLY DESIGNATED  P, Q, R.	REQUIREMENT:  TEMPORARY ERASE. JETEM, JETEM +1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:292
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:293
//# 	   SINCE RESTARTS ZERO THE JET OUTPUT CHANNELS, NO ATTEMPT IS MADE TO RESTART THE  ENTRY DAPS. THAT IS,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:294
//# THE 0.1 SEC DAPS WILL MISS A CYCLE, AND WILL PICK UP AT THE NEXT 0.1 SEC UPDATE. MOST OF THE TIME THE 2 SEC
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:295
//# ROLL SYSTEM WILL MISS ONLY 0.1 SEC OF CONTROL. HOWEVER, IF THE RESTART OCCURS AFTER THE SECTION TIMETST HAS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:296
//# STARTED, THEN THE ROLL SYSTEM WILL MISS ONE CYCLE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:297
//# THIS IS NECESSARY UNDER THE GROUNDRULE THAT NO JET COMMANDS SHALL BE LESS THAN 14 MS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:298
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:299
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:300
//		BANK	15
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:301
//		SETLOC	ETRYDAP
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:302
//		BANK
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:303
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:304
//		COUNT	15/DAPEN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:305
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:306
//BODYRATE	CA	AMG		# THESE ARE 2S COMPL NOS, BUT USE ANYWAY.
// slot 15710
                            if slot <> 15710 or instruction <> 13235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 947).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:307
//		TC	SPCOS
// slot 15711
                            if slot <> 15711 or instruction <> 2620 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2620, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15712 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:308
//		TS	COSM
// slot 15712
                            if slot <> 15712 or instruction <> 23369 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23369, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:309
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:310
//		CA	AOG		# C(AOG) = AOG/180
// slot 15713
                            if slot <> 15713 or instruction <> 13233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 945).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15715 {
                        if slot <= 15714 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:311
//		TC	SPSIN		# SINO
// slot 15714
                            if slot <> 15714 or instruction <> 2621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:312
//		TS	SINO		# SINO = SIN(AOG)
// slot 15715
                            if slot <> 15715 or instruction <> 23370 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23370, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15716 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:313
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:314
//		EXTEND
// slot 15716
                            if slot <> 15716 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:315
//		MP	COSM
// slot 15717
                            if slot <> 15717 or instruction <> 29513 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 841, readEffective:call(words, 841)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15721 {
                    if slot <= 15719 {
                        if slot <= 15718 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:316
//		TS	SINOCOSM	# SO CM
// slot 15718
                            if slot <> 15718 or instruction <> 23372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:317
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:318
//		CA	AOG
// slot 15719
                            if slot <> 15719 or instruction <> 13233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 945).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15720 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:319
//		TC	SPCOS		# COSO
// slot 15720
                            if slot <> 15720 or instruction <> 2620 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2620, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:320
//		TS	COSO
// slot 15721
                            if slot <> 15721 or instruction <> 23371 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23371, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15723 {
                        if slot <= 15722 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:321
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:322
//		EXTEND
// slot 15722
                            if slot <> 15722 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:323
//		MP	COSM
// slot 15723
                            if slot <> 15723 or instruction <> 29513 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 841, readEffective:call(words, 841)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15724 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:324
//		TS	COSOCOSM	# CO CM
// slot 15724
                            if slot <> 15724 or instruction <> 23373 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23373, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:325
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:326
//# PITCHDOT:  Q TCDU/180 = IDOT TCDU/180 COSO COSM + MDOT TCDU/180 SINO
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:327
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:328
//		CS	-DELAMG
// slot 15725
                            if slot <> 15725 or instruction <> 17343 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 959).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 15733 {
                if slot <= 15729 {
                    if slot <= 15727 {
                        if slot <= 15726 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:329
//		EXTEND
// slot 15726
                            if slot <> 15726 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:330
//		MP	SINO
// slot 15727
                            if slot <> 15727 or instruction <> 29514 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 842, readEffective:call(words, 842)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15728 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:331
//		DXCH	JETEM		# 2 LOCS
// slot 15728
                            if slot <> 15728 or instruction <> 22481 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 977, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:332
//		CS	-DELAIG
// slot 15729
                            if slot <> 15729 or instruction <> 17342 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 958).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15731 {
                        if slot <= 15730 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:333
//		EXTEND
// slot 15730
                            if slot <> 15730 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:334
//		MP	COSOCOSM
// slot 15731
                            if slot <> 15731 or instruction <> 29517 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 845, readEffective:call(words, 845)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15732 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:335
//		DAS	JETEM
// slot 15732
                            if slot <> 15732 or instruction <> 9169 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 977) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:336
//		CA	JETEM
// slot 15733
                            if slot <> 15733 or instruction <> 13264 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 976).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15737 {
                    if slot <= 15735 {
                        if slot <= 15734 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:337
//		XCH	OLDELQ
// slot 15734
                            if slot <> 15734 or instruction <> 24519 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 967, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:338
//		TC	RATEAVG
// slot 15735
                            if slot <> 15735 or instruction <> 1368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15736 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:339
//		TS	QREL		# PITCHDOT = Q TCDU/180
// slot 15736
                            if slot <> 15736 or instruction <> 23490 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23490, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:340
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:341
//# Page 1071
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:342
//# YAWDOT:  R TCDU/180 = -IDOT TCDU/180 COSM SINO + MDOT TCDU/180 COSO
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:343
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:344
//		CS	-DELAMG
// slot 15737
                            if slot <> 15737 or instruction <> 17343 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 959).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15739 {
                        if slot <= 15738 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:345
//		EXTEND
// slot 15738
                            if slot <> 15738 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:346
//		MP	COSO
// slot 15739
                            if slot <> 15739 or instruction <> 29515 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 843, readEffective:call(words, 843)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15740 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:347
//		DXCH	JETEM
// slot 15740
                            if slot <> 15740 or instruction <> 22481 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 977, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 15741 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:348
//		CA	-DELAIG
// slot 15741
                                if slot <> 15741 or instruction <> 13246 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 958).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:349
//		EXTEND
// slot 15742
                                if slot <> 15742 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 15759 {
            if slot <= 15750 {
                if slot <= 15746 {
                    if slot <= 15744 {
                        if slot <= 15743 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:350
//		MP	SINOCOSM
// slot 15743
                            if slot <> 15743 or instruction <> 29516 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 844, readEffective:call(words, 844)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:351
//		DAS	JETEM
// slot 15744
                            if slot <> 15744 or instruction <> 9169 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 977) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15745 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:352
//		CA	JETEM
// slot 15745
                            if slot <> 15745 or instruction <> 13264 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 976).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:353
//		XCH	OLDELR
// slot 15746
                            if slot <> 15746 or instruction <> 24520 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 968, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15748 {
                        if slot <= 15747 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:354
//		TC	RATEAVG
// slot 15747
                            if slot <> 15747 or instruction <> 1368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:355
//		TS	RREL		# YAWDOT = R TCDU/180
// slot 15748
                            if slot <> 15748 or instruction <> 23491 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23491, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15749 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:356
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:357
//# ROLLDOT:  P TCDU/180 = ODOT TCDU/180 + IDOT TCDU/180 SINM
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:358
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:359
//		CA	AMG
// slot 15749
                            if slot <> 15749 or instruction <> 13235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 947).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:360
//		TC	SPSIN
// slot 15750
                            if slot <> 15750 or instruction <> 2621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15754 {
                    if slot <= 15752 {
                        if slot <= 15751 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:361
//		TS	SINM
// slot 15751
                            if slot <> 15751 or instruction <> 23368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:362
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:363
//		EXTEND
// slot 15752
                            if slot <> 15752 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15753 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:364
//		MP	-DELAIG
// slot 15753
                            if slot <> 15753 or instruction <> 29630 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 958, readEffective:call(words, 958)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:365
//		TS	JETEM
// slot 15754
                            if slot <> 15754 or instruction <> 23504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23504, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15756 {
                        if slot <= 15755 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:366
//		CA	ZERO
// slot 15755
                            if slot <> 15755 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:367
//		DDOUBL			# ROUND L INTO A
// slot 15756
                            if slot <> 15756 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15757 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:368
//		AD	-DELAOG
// slot 15757
                            if slot <> 15757 or instruction <> 25533 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 957).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 15758 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:369
//		AD	JETEM
// slot 15758
                                if slot <> 15758 or instruction <> 25552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 976).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:370
//		CS	A
// slot 15759
                                if slot <> 15759 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 15767 {
                if slot <= 15763 {
                    if slot <= 15761 {
                        if slot <= 15760 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:371
//		TS	JETEM
// slot 15760
                            if slot <> 15760 or instruction <> 23504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23504, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:372
//		XCH	OLDELP
// slot 15761
                            if slot <> 15761 or instruction <> 24518 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 966, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15762 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:373
//		TC	RATEAVG
// slot 15762
                            if slot <> 15762 or instruction <> 1368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:374
//		TS	PREL		# ROLLDOT = P TCDU/180
// slot 15763
                            if slot <> 15763 or instruction <> 23489 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23489, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15765 {
                        if slot <= 15764 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:375
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:376
//					# IF GAMDOT < 0.5 DEG/SEC, THEN GAMDOT =0
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:377
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:378
//		CCS	GAMDOT
// slot 15764
                            if slot <> 15764 or instruction <> 5075 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 979).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:379
//		TC	+2
// slot 15765
                            if slot <> 15765 or instruction <> 1431 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1431, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15766 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:380
//		TC	NOGAMDUT
// slot 15766
                            if slot <> 15766 or instruction <> 1449 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1449, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:381
//		CS	ROLL/180
// slot 15767
                            if slot <> 15767 or instruction <> 17332 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 948).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15771 {
                    if slot <= 15769 {
                        if slot <= 15768 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:382
//		TC	SPSIN
// slot 15768
                            if slot <> 15768 or instruction <> 2621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:383
//		EXTEND
// slot 15769
                            if slot <> 15769 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15770 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:384
//		MP	GAMDOT
// slot 15770
                            if slot <> 15770 or instruction <> 29651 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 979, readEffective:call(words, 979)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:385
//		TS	JETEM +1	# -SR GAMDOT
// slot 15771
                            if slot <> 15771 or instruction <> 23505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23505, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15773 {
                        if slot <= 15772 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:386
//		EXTEND
// slot 15772
                            if slot <> 15772 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:387
//		MP	SINTRIM		# SIN(-20)	(FOR NOMINAL L/D = .3)
// slot 15773
                            if slot <> 15773 or instruction <> 30335 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1663, readEffective:call(words, 1663)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15774 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:388
//		ADS	PREL		# PREL TCDU/180=(P-SALF SR GAMDOT)TCDU/180
// slot 15774
                            if slot <> 15774 or instruction <> 12225 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 961).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 15775 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:389
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:390
//		CA	ROLL/180
// slot 15775
                                if slot <> 15775 or instruction <> 13236 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 948).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:391
//		TC	SPCOS
// slot 15776
                                if slot <> 15776 or instruction <> 2620 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2620, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[918] to agcAotUnit918@.

// bank 15, slots 15777-15794
function agcAotUnit919 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15785 {
        if slot <= 15780 {
            if slot <= 15778 {
                if slot <= 15777 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:392
//# Page 1072
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:393
//		COM
// slot 15777
                    if slot <> 15777 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:394
//		EXTEND
// slot 15778
                    if slot <> 15778 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15779 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:395
//		MP	GAMDOT
// slot 15779
                    if slot <> 15779 or instruction <> 29651 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 979, readEffective:call(words, 979)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:396
//		ADS	QREL		# QREL TCDU/180=(Q-CR GAMDOT) TCDU/180
// slot 15780
                    if slot <> 15780 or instruction <> 12226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 962).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15782 {
                if slot <= 15781 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:397
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:398
//		CS	JETEM +1	# B( ) = -SR GAMDOT
// slot 15781
                    if slot <> 15781 or instruction <> 17361 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 977).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:399
//		EXTEND
// slot 15782
                    if slot <> 15782 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15783 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:400
//		MP	COSTRIM		# COS(-20)	(FOR NOMINAL L/D = .3)
// slot 15783
                    if slot <> 15783 or instruction <> 30336 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1664, readEffective:call(words, 1664)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15784 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:401
//		ADS	RREL		# RREL TCDU/180=(R+CALF SR GAMDOT)TCDU/180
// slot 15784
                        if slot <> 15784 or instruction <> 12227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 963).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:402
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:403
//NOGAMDUT	CA	BIT12		# CMDAPARM = 93D BIT 12
// slot 15785
                        if slot <> 15785 or instruction <> 14852 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 15789 {
            if slot <= 15787 {
                if slot <= 15786 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:404
//		MASK	CM/FLAGS
// slot 15786
                    if slot <> 15786 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:405
//		EXTEND
// slot 15787
                    if slot <> 15787 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15788 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:406
//STBYDUMP	BZF	TASKOVER	# DAP NOT ARMED.
// slot 15788
                    if slot <> 15788 or instruction <> 6868 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:407
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:408
//		CA	POSMAX		# PICK UP AT ATTRATES IN 10 MS OR SO.
// slot 15789
                    if slot <> 15789 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15791 {
                if slot <= 15790 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:409
//		TS	TIME5
// slot 15790
                    if slot <> 15790 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:410
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:411
//		EXTEND
// slot 15791
                    if slot <> 15791 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15792 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:412
//		DCA	ATDOTCAD
// slot 15792
                    if slot <> 15792 or instruction <> 13748 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1460, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15793 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:413
//		DXCH	T5LOC
// slot 15793
                        if slot <> 15793 or instruction <> 22219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:414
//					# DOES NOT PROTECT TEMK, SQ IN SPSIN/COS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:415
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:416
//		TC	TASKOVER
// slot 15794
                        if slot <> 15794 or instruction <> 2772 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2772, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[919] to agcAotUnit919@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:417
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:418
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:419
//ATDOTCAD	2CADR	ATTRATES
// slot 15795 15796
    15795, 2922, 15796, 26732
)).

// bank 15, slots 15797-15859
function agcAotUnit920 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15827 {
        if slot <= 15811 {
            if slot <= 15803 {
                if slot <= 15799 {
                    if slot <= 15797 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:420
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:421
//# Page 1073
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:422
//# CALCULATE BODY ATTITUDE RATES AND INTEGRATE TO OBTAIN ATTITUDE ANGLES.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:423
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:424
//#	CB PHIDOT TCDU/180 = (CA PREL + SA RREL) TCDU/180
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:425
//#	BETADOT TCDU/180 = (-SA PREL + CA RREL) TCDU/180
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:426
//#	ALFADOT TCDU = (QREL + SB PHIDOT) TCDU/180
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:427
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:428
//ATTRATES	LXCH	BANKRUPT	# CONTINUE HERE VIA T5
// slot 15797
                        if slot <> 15797 or instruction <> 9230 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 14, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15798 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:429
//		EXTEND			# TASK MAY BE SKIPPED AT RESTART.
// slot 15798
                            if slot <> 15798 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:430
//		QXCH	QRUPT
// slot 15799
                            if slot <> 15799 or instruction <> 9226 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 10, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15801 {
                        if slot <= 15800 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:431
//		CA	SR
// slot 15800
                            if slot <> 15800 or instruction <> 12305 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 17).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:432
//		DOUBLE
// slot 15801
                            if slot <> 15801 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15802 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:433
//		TS	CM/SAVE
// slot 15802
                            if slot <> 15802 or instruction <> 23443 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23443, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:434
//					# DOES NOT PROTECT TEMK, SQ IN SPSIN/COS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:435
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:436
//		CA	QREL
// slot 15803
                            if slot <> 15803 or instruction <> 13250 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 962).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15807 {
                    if slot <= 15805 {
                        if slot <= 15804 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:437
//		AD	ALFA/180
// slot 15804
                            if slot <> 15804 or instruction <> 25525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 949).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:438
//		TC	ANGOVCOR
// slot 15805
                            if slot <> 15805 or instruction <> 1362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15806 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:439
//		TS	ALFA/180
// slot 15806
                            if slot <> 15806 or instruction <> 23477 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23477, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:440
//		TC	SPCOS
// slot 15807
                            if slot <> 15807 or instruction <> 2620 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2620, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15809 {
                        if slot <= 15808 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:441
//		TS	CALFA		# CALFA
// slot 15808
                            if slot <> 15808 or instruction <> 23366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:442
//		TS	PHIDOT
// slot 15809
                            if slot <> 15809 or instruction <> 23493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23493, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15810 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:443
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:444
//		EXTEND
// slot 15810
                            if slot <> 15810 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:445
//		MP	PREL
// slot 15811
                            if slot <> 15811 or instruction <> 29633 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 961, readEffective:call(words, 961)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 15819 {
                if slot <= 15815 {
                    if slot <= 15813 {
                        if slot <= 15812 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:446
//		XCH	PHIDOT		# CA PREL
// slot 15812
                            if slot <> 15812 or instruction <> 24517 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 965, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:447
//		EXTEND
// slot 15813
                            if slot <> 15813 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15814 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:448
//		MP	RREL		# CA RREL
// slot 15814
                            if slot <> 15814 or instruction <> 29635 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 963, readEffective:call(words, 963)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:449
//		TS	BETADOT
// slot 15815
                            if slot <> 15815 or instruction <> 23492 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23492, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15817 {
                        if slot <= 15816 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:450
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:451
//		CA	ALFA/180
// slot 15816
                            if slot <> 15816 or instruction <> 13237 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 949).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:452
//		TC	SPSIN
// slot 15817
                            if slot <> 15817 or instruction <> 2621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15818 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:453
//		TS	SALFA		# SIN(ALFA)
// slot 15818
                            if slot <> 15818 or instruction <> 23367 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23367, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:454
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:455
//		EXTEND
// slot 15819
                            if slot <> 15819 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15823 {
                    if slot <= 15821 {
                        if slot <= 15820 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:456
//		MP	RREL		# SA RREL
// slot 15820
                            if slot <> 15820 or instruction <> 29635 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 963, readEffective:call(words, 963)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:457
//		ADS	PHIDOT		# CB PHIDOT, SAVED.
// slot 15821
                            if slot <> 15821 or instruction <> 12229 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 965).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15822 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:458
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:459
//		CS	SALFA
// slot 15822
                            if slot <> 15822 or instruction <> 17223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 839).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:460
//		EXTEND
// slot 15823
                            if slot <> 15823 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15825 {
                        if slot <= 15824 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:461
//		MP	PREL
// slot 15824
                            if slot <> 15824 or instruction <> 29633 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 961, readEffective:call(words, 961)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:462
//		ADS	BETADOT		# SAVE BETADOT TCDU/180
// slot 15825
                            if slot <> 15825 or instruction <> 12228 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 964).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15826 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:463
//		ADS	BETA/180	# BETA DONE.
// slot 15826
                            if slot <> 15826 or instruction <> 12214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 950).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:464
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:465
//		TC	SPSIN
// slot 15827
                            if slot <> 15827 or instruction <> 2621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2621, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 15843 {
            if slot <= 15835 {
                if slot <= 15831 {
                    if slot <= 15829 {
                        if slot <= 15828 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:466
//		EXTEND
// slot 15828
                            if slot <> 15828 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:467
//		MP	PHIDOT		# NEGLECT CB IN CB PHIDOT
// slot 15829
                            if slot <> 15829 or instruction <> 29637 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 965, readEffective:call(words, 965)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15830 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:468
//		AD	ALFA/180
// slot 15830
                            if slot <> 15830 or instruction <> 25525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 949).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:469
//		TC	ANGOVCOR
// slot 15831
                            if slot <> 15831 or instruction <> 1362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15833 {
                        if slot <= 15832 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:470
//		TS	ALFA/180	# ALFA DONE.
// slot 15832
                            if slot <> 15832 or instruction <> 23477 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23477, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:471
//# Page 1074
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:472
//		COM
// slot 15833
                            if slot <> 15833 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15834 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:473
//		AD	ALFACOM
// slot 15834
                            if slot <> 15834 or instruction <> 25475 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 899).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:474
//		TC	ANGOVCOR	# JUST IN CASE ...
// slot 15835
                            if slot <> 15835 or instruction <> 1362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15839 {
                    if slot <= 15837 {
                        if slot <= 15836 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:475
//		TS	AK1
// slot 15836
                            if slot <> 15836 or instruction <> 23359 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23359, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:476
//		TS	QAXERR		# FOR PITCH FDAI AND EDIT.
// slot 15837
                            if slot <> 15837 or instruction <> 23418 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23418, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15838 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:477
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:478
//		CA	PHIDOT		# PHIDOT TCDU/180, NEGLECTING CB
// slot 15838
                            if slot <> 15838 or instruction <> 13253 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 965).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:479
//		AD	ROLL/180
// slot 15839
                            if slot <> 15839 or instruction <> 25524 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 948).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15841 {
                        if slot <= 15840 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:480
//		TC	ANGOVCOR
// slot 15840
                            if slot <> 15840 or instruction <> 1362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:481
//		TS	ROLLTM		# ROLL/180 FOR TM.
// slot 15841
                            if slot <> 15841 or instruction <> 23500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23500, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15842 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:482
//		TS	ROLL/180	# ROLL DONE.
// slot 15842
                            if slot <> 15842 or instruction <> 23476 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23476, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:483
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:484
//# START YAW AUTOPILOT HERE.  RATE DAMPING WITH ENFORCED COORDINATED ROLL MANEUVER.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:485
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:486
//		CS	BETA/180	# IF IN ATM, SAVE 'RAXERR' FOR TM DNLST.
// slot 15843
                            if slot <> 15843 or instruction <> 17334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 950).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 15851 {
                if slot <= 15847 {
                    if slot <= 15845 {
                        if slot <= 15844 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:487
//		AD	BETACOM
// slot 15844
                            if slot <> 15844 or instruction <> 25476 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 900).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:488
//		TS	RAXERR		# IF OUTSIDE ATM, USE TM REGISTER 'RAXERR'
// slot 15845
                            if slot <> 15845 or instruction <> 23419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23419, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15846 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:489
//					# AS A TEMPORARY.  (DAP OPERATION IS IN INTERRUPT, SO
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:490
//					# IS OK.)  FINAL C(RAXERR) AT END OF DAP CYCLE WILL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:491
//					# BE R-AXIS ERROR.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:492
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:493
//		CA	BIT3		# .05GSW = 102D BIT3	SW=0, LESS .05G
// slot 15846
                            if slot <> 15846 or instruction <> 14861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:494
//		MASK	CM/FLAGS	# SWITCH =1, GREATER THAN .05 G
// slot 15847
                            if slot <> 15847 or instruction <> 28738 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 66).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15849 {
                        if slot <= 15848 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:495
//		EXTEND
// slot 15848
                            if slot <> 15848 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:496
//		BZF	EXDAP		# IF G LESS THAN .05
// slot 15849
                            if slot <> 15849 or instruction <> 5663 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5663, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15850 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:497
//		CS	ONE		# IF G GEQ  THAN .05
// slot 15850
                            if slot <> 15850 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:498
//		TS	CMDAPMOD	# SAVE -1 FOR USE IN CM/RCS
// slot 15851
                            if slot <> 15851 or instruction <> 23488 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23488, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15855 {
                    if slot <= 15853 {
                        if slot <= 15852 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:499
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:500
//		TS	AK1		# TO ZERO PITCH AND YAW FDAI NEEDLES
// slot 15852
                            if slot <> 15852 or instruction <> 23359 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23359, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:501
//		TS	AK2		# IN ATM.  (MODE =-1)
// slot 15853
                            if slot <> 15853 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15854 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:502
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:503
//		CS	PREL		# YAW ERROR = RREL - PREL TAN(ALFA)
// slot 15854
                            if slot <> 15854 or instruction <> 17345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 961).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:504
//		EXTEND
// slot 15855
                            if slot <> 15855 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15857 {
                        if slot <= 15856 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:505
//		MP	SINTRIM		# LET SIN(-20) BE APPROX FOR TAN(-20)
// slot 15856
                            if slot <> 15856 or instruction <> 30335 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1663, readEffective:call(words, 1663)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:506
//		AD	RREL
// slot 15857
                            if slot <> 15857 or instruction <> 25539 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 963).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 15858 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:507
//		TC	2D/SDZ		# GO TEST DZ.  GET TAG: +0 IF IN DZ
// slot 15858
                            if slot <> 15858 or instruction <> 1559 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1559, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:508
//		INDEX	A		# +/- 1 IF NOT
// slot 15859
                            if slot <> 15859 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
            }
        }
    }
}
set agcAotRoutes[920] to agcAotUnit920@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:509
//		CAF	YJETCODE
// slot 15860
    15860, 27908
)).

// bank 15, slots 15861-15864
function agcAotUnit921 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15862 {
        if slot <= 15861 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:510
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:511
//		TS	JETEM
// slot 15861
            if slot <> 15861 or instruction <> 23504 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23504, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:512
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:513
//# START PITCH AUTOPILOT HERE.  RATE DAMPING ONLY.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:514
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:515
//		CA	QREL
// slot 15862
            if slot <> 15862 or instruction <> 13250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 962).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15863 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:516
//		TC	2D/SDZ
// slot 15863
            if slot <> 15863 or instruction <> 1559 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1559, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:517
//EXDAPIN		INDEX	A		# COME HERE FROM EX ATM DAP
// slot 15864
            if slot <> 15864 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[921] to agcAotUnit921@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:518
//		CAF	P/RJCODE
// slot 15865
    15865, 27914
)).

// bank 15, slots 15866-15908
function agcAotUnit922 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15886 {
        if slot <= 15875 {
            if slot <= 15870 {
                if slot <= 15867 {
                    if slot <= 15866 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:519
//		ADS	JETEM		# COMBINE ALL NEW BITS.
// slot 15866
                        if slot <> 15866 or instruction <> 12240 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 976).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:520
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:521
//		EXTEND			# DOES NOT REQUIRE SAVING OLD CODES.
// slot 15867
                        if slot <> 15867 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15868 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:522
//# Page 1075
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:523
//		WRITE	PYJETS		# SET PYCHAN TO DESIRED BIT CONFIG.
// slot 15868
                        if slot <> 15868 or instruction <> 517 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15869 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:524
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:525
//		CCS	JETAG
// slot 15869
                            if slot <> 15869 or instruction <> 5065 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 969).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:526
//		TC	CM/RCS
// slot 15870
                            if slot <> 15870 or instruction <> 1678 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1678, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15872 {
                    if slot <= 15871 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:527
//		TC	CM/FDAI
// slot 15871
                        if slot <> 15871 or instruction <> 1983 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1983, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:528
//		TC	CM/FDAIR -1 	# (JETAG=-1 EQUIVALENT TO CMDAPMOD=+1)
// slot 15872
                        if slot <> 15872 or instruction <> 1988 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1988, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15873 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:529
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:530
//# Page 1076
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:531
//# DEAD ZONE LOGIC USED BY ENTRY DIGITAL AUTOPILOTS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:532
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:533
//3DDZ		CCS	A		# YAWLIM=1.0-3/180=16384-273=16111
// slot 15873
                        if slot <> 15873 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15874 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:534
//		AD	YAWLIM
// slot 15874
                            if slot <> 15874 or instruction <> 26237 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1661), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:535
//		TCF	DZCOM
// slot 15875
                            if slot <> 15875 or instruction <> 5659 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5659, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 15880 {
                if slot <= 15877 {
                    if slot <= 15876 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:536
//		AD	YAWLIM
// slot 15876
                        if slot <> 15876 or instruction <> 26237 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1661), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:537
//		TCF	DZNOCOM
// slot 15877
                        if slot <> 15877 or instruction <> 5660 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5660, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15878 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:538
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:539
//					# BIASED DZ FOR EXT ATM DAP.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:540
//BIASEDZ		TS	JETEM2		# SAVE RATE/180.  ERROR/180 IS IN L.
// slot 15878
                        if slot <> 15878 or instruction <> 23444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23444, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15879 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:541
//		CCS	A		# START ERROR DZ.
// slot 15879
                            if slot <> 15879 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:542
//		CS	CM/BIAS		# = .6/180
// slot 15880
                            if slot <> 15880 or instruction <> 18044 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1660), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15883 {
                    if slot <= 15881 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:543
//		TCF	+2
// slot 15881
                        if slot <> 15881 or instruction <> 5643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15882 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:544
//		CA	CM/BIAS
// slot 15882
                            if slot <> 15882 or instruction <> 13948 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1660), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:545
//		AD	L		# BIAS THE ERROR.
// slot 15883
                            if slot <> 15883 or instruction <> 24577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15884 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:546
//		LXCH	Q		# SAVE CALLERS RETURN ADDRESS.
// slot 15884
                        if slot <> 15884 or instruction <> 9218 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 2, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15885 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:547
//		TC	3DDZ		# GO GENERATE THE ERROR BIT.
// slot 15885
                            if slot <> 15885 or instruction <> 1537 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1537, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:548
//		DXCH	L		# BIT TO L, RESTORE CALLERS Q.
// slot 15886
                            if slot <> 15886 or instruction <> 21506 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 2, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 15897 {
            if slot <= 15891 {
                if slot <= 15888 {
                    if slot <= 15887 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:549
//4D/SDZ		CCS	JETEM2		# CAME HERE IN EXT ATM. C(L) = ERROR BIT
// slot 15887
                        if slot <> 15887 or instruction <> 5012 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 916).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:550
//		AD	4D/SLIM		# IF RATE GEQ 4D/S, SET L=0 AND TAKE
// slot 15888
                        if slot <> 15888 or instruction <> 26234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1658), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15889 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:551
//		TCF	+2		# JET BITS ACCORDING TO SGN OF RATE.
// slot 15889
                        if slot <> 15889 or instruction <> 5651 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5651, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15890 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:552
//		AD	4D/SLIM
// slot 15890
                            if slot <> 15890 or instruction <> 26234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1658), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:553
//		TS	A
// slot 15891
                            if slot <> 15891 or instruction <> 22528 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22528, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15894 {
                    if slot <= 15892 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:554
//		TCF	+2		# RATE OK. CONTINUE
// slot 15892
                        if slot <> 15892 or instruction <> 5654 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5654, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15893 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:555
//		ZL			# RATE GEQ 4 D/S.  OVER RIDE ERROR BIT
// slot 15893
                            if slot <> 15893 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:556
//		XCH	JETEM2		# AND CONTINUE TO GET SIGN.
// slot 15894
                            if slot <> 15894 or instruction <> 24468 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 916, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15895 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:557
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:558
//2D/SDZ		CCS	A		# COME HERE TO TEST IF A WITHIN 2DEG/S DZ
// slot 15895
                        if slot <> 15895 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15896 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:559
//		AD	YDOTLIM		# 1.0 - YDOT DZ		(OR PDOT)
// slot 15896
                            if slot <> 15896 or instruction <> 26235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1659), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:560
//		TCF	+3
// slot 15897
                            if slot <> 15897 or instruction <> 5660 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5660, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 15902 {
                if slot <= 15899 {
                    if slot <= 15898 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:561
//		AD	YDOTLIM		# YDOT DZ = 2 DEG/SEC
// slot 15898
                        if slot <> 15898 or instruction <> 26235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1659), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:562
//DZCOM		COM
// slot 15899
                        if slot <> 15899 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15900 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:563
//DZNOCOM		TS	JETEM +1	# GENERATE TAG, SET C(A)= -+1 OUTSIDE DZ
// slot 15900
                        if slot <> 15900 or instruction <> 23505 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23505, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15901 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:564
//		CA	ZERO		# SET C(A) = +0 INSIDE
// slot 15901
                            if slot <> 15901 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:565
//		TC	Q
// slot 15902
                            if slot <> 15902 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 15905 {
                    if slot <= 15903 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:566
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:567
//# Page 1077
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:568
//# EXTRA ATMOSPHERIC DIGITAL AUTOPILOT
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:569
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:570
//# 1.	IF ABS(CALF) -C(45) POS, USE			IF CALFA POS, CMDAPMOD= +0
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:571
//#	BETA:	YAW ERROR = SGN(CALF) (BETACOM -BETA)	IF CALFA NEG, CMDAPMOD= -0
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:572
//#		     RATE = BETADOT			IF CMDAPMOD = -0, RATE = RREL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:573
//#		   R-AXIS = CONTROL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:574
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:575
//#	ROLL:  ROLL ERROR = SGN(CALF) (ROLLC - ROLL)	IF CMDAPMOD = -0, RATE DAMP ONLY.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:576
//#		     RATE = PREL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:577
//#		   P-AXIS = CONTROL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:578
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:579
//# 2.	IF C(45) GEQ CALFA GEQ -C(45), USE		CMDAPMOD = +1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:580
//#	BETA:  ROLL ERROR = SGN(-SALF) (BETACOM -BETA)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:581
//#		     RATE = BETADOT
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:582
//#		   P-AXIS = CONTROL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:583
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:584
//#	ROLL:	YAW ERROR = SGN(SALF) (ROLLC - ROLL)	RATE DAMP ONLY.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:585
//#		     RATE = RREL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:586
//#		   R-AXIS = CONTROL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:587
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:588
//# 3.	FOR ALL CASES, USE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:589
//#	ALFA: PITCH ERROR = (ALFACOM - ALFA)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:590
//#		     RATE = QREL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:591
//#		   Q-AXIS = CONTROL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:592
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:593
//EXDAP		TS	CMDAPMOD	# +0 FOR NOW
// slot 15903
                        if slot <> 15903 or instruction <> 23488 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23488, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15904 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:594
//		CCS	CALFA
// slot 15904
                            if slot <> 15904 or instruction <> 4934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 838).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:595
//		AD	C45LIM		# =1.0-COS(45)
// slot 15905
                            if slot <> 15905 or instruction <> 26238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1662), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 15906 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:596
//		TCF	+2
// slot 15906
                        if slot <> 15906 or instruction <> 5668 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5668, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 15907 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:597
//		AD	C45LIM
// slot 15907
                            if slot <> 15907 or instruction <> 26238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1662), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:598
//		TS	A
// slot 15908
                            if slot <> 15908 or instruction <> 22528 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22528, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[922] to agcAotUnit922@.

// bank 15, slots 15909-15916
function agcAotUnit923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15912 {
        if slot <= 15910 {
            if slot <= 15909 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:599
//		TCF	EXDAP2		# HERE IF ABS(CALFA) L COS(45)
// slot 15909
                if slot <> 15909 or instruction <> 5718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5718, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:600
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:601
//		CCS	CALFA		# |CALFA| > 0.707
// slot 15910
                if slot <> 15910 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15911 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:602
//		TCF	+1		# CONTINUE IF POS; GO TO EXDAP4 IF NEG.
// slot 15911
                if slot <> 15911 or instruction <> 5672 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5672, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:603
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:604
//		CCS	P63FLAG		# VALID VALUES ARE:  -1, +1, +0.
// slot 15912
                if slot <> 15912 or instruction <> 5079 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 983).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 15914 {
            if slot <= 15913 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:605
//		TC	EXDAP4
// slot 15913
                if slot <> 15913 or instruction <> 1588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:606
//		TC	+2
// slot 15914
                if slot <> 15914 or instruction <> 1580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15915 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:607
//		TC	EXDAP4
// slot 15915
                if slot <> 15915 or instruction <> 1588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:608
//		TC	PHASCHNG	# SINGLE PASS THROUGH HERE.
// slot 15916
                if slot <> 15916 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[923] to agcAotUnit923@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:609
//		OCT	40334
// slot 15917
    15917, 33208
)).

// bank 15, slots 15918-15921
function agcAotUnit924 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15919 {
        if slot <= 15918 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:610
//		CS	ONE
// slot 15918
            if slot <> 15918 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:611
//		TS	P63FLAG		# SET FLAG TO ASSURE SINGLE PASS.
// slot 15919
            if slot <> 15919 or instruction <> 23511 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23511, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15920 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:612
//		CA	NSEC
// slot 15920
            if slot <> 15920 or instruction <> 13945 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1657), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:613
//		TC	WAITLIST
// slot 15921
            if slot <> 15921 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[924] to agcAotUnit924@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:614
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:615
//		2CADR	WAKEP62		# CALL TO TERMINATE P62 IN N SEC.
// slot 15922 15923
    15922, 2552, 15923, 45164
)).

// bank 15, slots 15924-15943
function agcAotUnit925 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15933 {
        if slot <= 15928 {
            if slot <= 15925 {
                if slot <= 15924 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:616
//# Page 1078
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:617
//					# 65 DEG/ 3DEG/SEC = 21 SEC NOMINAL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:618
//					# TRANSIT TIME FROM ALFA=45 TO ALFA TRIM.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:619
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:620
//EXDAP4		CCS	JETAG		# ROLLJET INTERFACE TEST BETWEEN .1 SEC
// slot 15924
                    if slot <> 15924 or instruction <> 5065 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 969).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:621
//		TCF	EXDAP3		# DAP AND THE 2 SEC CM/RCS DAP
// slot 15925
                    if slot <> 15925 or instruction <> 5691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15926 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:622
//		TCF	EXDAP3
// slot 15926
                    if slot <> 15926 or instruction <> 5691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15927 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:623
//		CA	ZERO
// slot 15927
                        if slot <> 15927 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:624
//		EXTEND			# TURN OFF ROLL JETS IF ON AND WAIT
// slot 15928
                        if slot <> 15928 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15930 {
                if slot <= 15929 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:625
//		WRITE	ROLLJETS	# UNTIL START OF 2 SEC CM/RCS CYCLE
// slot 15929
                    if slot <> 15929 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:626
//		TS	JETAG		# RESTORE PROPER VALUE +0
// slot 15930
                    if slot <> 15930 or instruction <> 23497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15931 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:627
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:628
//					# ROLL FDAI WILL BE IN ERROR UNTIL NEXT CM/RCS CALL.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:629
//EXDAP3		CCS	CALFA		# HERE IF ABS(CALFA) GEQ COS(45)
// slot 15931
                    if slot <> 15931 or instruction <> 4934 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 838).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15932 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:630
//		CA	RAXERR		# C()= BETACOM - BETA/180
// slot 15932
                        if slot <> 15932 or instruction <> 13179 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 891).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:631
//		TCF	EXDAP1
// slot 15933
                        if slot <> 15933 or instruction <> 5697 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5697, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 15938 {
            if slot <= 15935 {
                if slot <= 15934 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:632
//		CS	ZERO
// slot 15934
                    if slot <> 15934 or instruction <> 18961 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:633
//		TS	CMDAPMOD	# FOR CM/RCS
// slot 15935
                    if slot <> 15935 or instruction <> 23488 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23488, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15936 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:634
//		CS	RAXERR		# COMPLEMENT OF YAW ERROR.
// slot 15936
                    if slot <> 15936 or instruction <> 17275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 891).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15937 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:635
//EXDAP1		TS	RAXERR		# FOR YAW FDAI
// slot 15937
                        if slot <> 15937 or instruction <> 23419 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23419, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:636
//		TS	AK2		# WANT RAXERR FOR TM.
// slot 15938
                        if slot <> 15938 or instruction <> 23360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23360, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15940 {
                if slot <= 15939 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:637
//		TS	L
// slot 15939
                    if slot <> 15939 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:638
//		CCS	CMDAPMOD	# COORDINATE BETA CONTROL.
// slot 15940
                    if slot <> 15940 or instruction <> 5056 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 960).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 15941 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:639
//		TC	+3		# C(CMDAPMOD) CAN BE +1, +0, OR -0.
// slot 15941
                    if slot <> 15941 or instruction <> 1608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1608, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15942 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:640
//		CA	ONE		# USE BETADOT TO COORD IN MODE +0
// slot 15942
                        if slot <> 15942 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:641
//		INDEX	A		# OTHERWISE USE RREL.
// slot 15943
                        if slot <> 15943 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[925] to agcAotUnit925@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:642
//		CA	RREL
// slot 15944
    15944, 26502
)).

// bank 15, slots 15945-15948
function agcAotUnit926 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15946 {
        if slot <= 15945 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:643
//		TC	BIASEDZ		# GO TEST DZ. +0 IF IN DZ, +-1 OTHERWISE
// slot 15945
            if slot <> 15945 or instruction <> 1542 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1542, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:644
//					# IF GEQ 4D/S, SET ERROR BIT IN L=0
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:645
//		EXTEND
// slot 15946
            if slot <> 15946 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 15947 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:646
//		ROR	LCHAN		# L HAS BETA BIT
// slot 15947
            if slot <> 15947 or instruction <> 2049 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:647
//		INDEX	A
// slot 15948
            if slot <> 15948 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[926] to agcAotUnit926@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:648
//		CAF	YJETCODE
// slot 15949
    15949, 27908
)).

// bank 15, slots 15950-15980
function agcAotUnit927 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15964 {
        if slot <= 15956 {
            if slot <= 15952 {
                if slot <= 15950 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:649
//		TS	JETEM
// slot 15950
                    if slot <> 15950 or instruction <> 23504 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23504, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 15951 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:650
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:651
//		CA	QAXERR		# ALFA ERROR.
// slot 15951
                        if slot <> 15951 or instruction <> 13178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 890).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:652
//		TS	L
// slot 15952
                        if slot <> 15952 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15954 {
                    if slot <= 15953 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:653
//		CA	QREL		# FOR ALPHADOT USE QREL
// slot 15953
                        if slot <> 15953 or instruction <> 13250 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 962).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:654
//		TC	BIASEDZ
// slot 15954
                        if slot <> 15954 or instruction <> 1542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15955 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:655
//		EXTEND
// slot 15955
                        if slot <> 15955 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:656
//		ROR	LCHAN
// slot 15956
                        if slot <> 15956 or instruction <> 2049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15960 {
                if slot <= 15958 {
                    if slot <= 15957 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:657
//		TCF	EXDAPIN		# CONTINUE ON IN DAP
// slot 15957
                        if slot <> 15957 or instruction <> 5624 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5624, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:658
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:659
//EXDAP2		INCR	CMDAPMOD	# SET CMDAPMOD TO +1
// slot 15958
                        if slot <> 15958 or instruction <> 11200 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 960).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15959 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:660
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:661
//		CS	ONE		# INDICATE CHANGE FROM .1 SEC UPDATE TO
// slot 15959
                        if slot <> 15959 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:662
//		TS	JETAG		# TO 2 SEC FOR ROLL JETS. (IF CMDAPMOD
// slot 15960
                        if slot <> 15960 or instruction <> 23497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15962 {
                    if slot <= 15961 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:663
//					# =0 AND JETAG =-1, QUENCHES JETS IF ON)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:664
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:665
//		CCS	P63FLAG		# IF FLAG WAS +1, SET =0.
// slot 15961
                        if slot <> 15961 or instruction <> 5079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 983).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:666
//		TS	P63FLAG
// slot 15962
                        if slot <> 15962 or instruction <> 23511 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23511, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15963 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:667
//# Page 1079
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:668
//		NOOP
// slot 15963
                        if slot <> 15963 or instruction <> 5724 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5724, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:669
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:670
//		CCS	SALFA		# BETA CONTROL WITH P JETS
// slot 15964
                        if slot <> 15964 or instruction <> 4935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 839).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 15972 {
            if slot <= 15968 {
                if slot <= 15966 {
                    if slot <= 15965 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:671
//		CS	RAXERR		# B()= BETACOM - BETA/180
// slot 15965
                        if slot <> 15965 or instruction <> 17275 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 891).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:672
//		TCF	+2
// slot 15966
                        if slot <> 15966 or instruction <> 5728 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5728, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15967 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:673
//		CA	RAXERR
// slot 15967
                        if slot <> 15967 or instruction <> 13179 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 891).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:674
//		TS	PAXERR1		# TEMP SAVE.  ERROR/180
// slot 15968
                        if slot <> 15968 or instruction <> 23499 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23499, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15970 {
                    if slot <= 15969 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:675
//		EXTEND
// slot 15969
                        if slot <> 15969 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:676
//		MP	HALF		# CM/FDAI EXPECTS ERROR/360.
// slot 15970
                        if slot <> 15970 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15971 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:677
//		XCH	PAXERR1		# ERROR/360 FOR FDAI, GET ERROR/180.
// slot 15971
                        if slot <> 15971 or instruction <> 24523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 971, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:678
//		TS	L
// slot 15972
                        if slot <> 15972 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 15976 {
                if slot <= 15974 {
                    if slot <= 15973 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:679
//		CCS	SALFA
// slot 15973
                        if slot <> 15973 or instruction <> 4935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 839).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:680
//		CS	BETADOT		# USE BETADOT TO COORD IN MODE +1
// slot 15974
                        if slot <> 15974 or instruction <> 17348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 964).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15975 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:681
//		TC	+2
// slot 15975
                        if slot <> 15975 or instruction <> 1641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1641, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:682
//		CA	BETADOT
// slot 15976
                        if slot <> 15976 or instruction <> 13252 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 964).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 15978 {
                    if slot <= 15977 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:683
//		TC	BIASEDZ
// slot 15977
                        if slot <> 15977 or instruction <> 1542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:684
//		EXTEND
// slot 15978
                        if slot <> 15978 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 15979 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:685
//		ROR	LCHAN
// slot 15979
                        if slot <> 15979 or instruction <> 2049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:686
//		INDEX	A
// slot 15980
                        if slot <> 15980 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[927] to agcAotUnit927@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:687
//		CAF	P/RJCODE	# GET ROLL CODE
// slot 15981
    15981, 27914
)).

// bank 15, slots 15982-15992
function agcAotUnit928 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 15986 {
        if slot <= 15983 {
            if slot <= 15982 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:688
//		EXTEND			# ROLL CONTROL WITH YAW JETS.
// slot 15982
                if slot <> 15982 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:689
//		WRITE	ROLLJETS	# WE,LL SKIP REGULAR ROLL SYST
// slot 15983
                if slot <> 15983 or instruction <> 518 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 15984 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:690
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:691
//		CA	ROLLHOLD	# ROLL/180 AT CM/DAPON TIME.
// slot 15984
                if slot <> 15984 or instruction <> 13263 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 975).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15985 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:692
//		EXTEND
// slot 15985
                    if slot <> 15985 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:693
//		MSU	ROLL/180	# 1,S COMPL, BUT SO WHATS A BIT.?
// slot 15986
                    if slot <> 15986 or instruction <> 9140 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMSU(words, 948).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 15989 {
            if slot <= 15987 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:694
//		TS	L		# FORCE A LIMIT CYCLE IN YAW RATE.
// slot 15987
                if slot <> 15987 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15988 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:695
//		CCS	SALFA
// slot 15988
                    if slot <> 15988 or instruction <> 4935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 839).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:696
//		CA	L		# TO REMOVE ITS BIASING EFFECT ON M DOT.
// slot 15989
                    if slot <> 15989 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 15990 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:697
//		TC	EXDAP1
// slot 15990
                if slot <> 15990 or instruction <> 1601 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1601, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 15991 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:698
//		CS	L
// slot 15991
                    if slot <> 15991 or instruction <> 16385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 1).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:699
//		TC	EXDAP1
// slot 15992
                    if slot <> 15992 or instruction <> 1601 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1601, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[928] to agcAotUnit928@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:700
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:701
//NSEC		DEC	2100		# 65 DEG/ 3 DEG/SEC
// slot 15993
    15993, 4200,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:702
//					# IF NSEC IS CHANGED, REMEMBER TO CHANGE 4.33SPOT.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:703
//4D/SLIM		DEC	16348		# 1.0 -4/180 D/S = 4/1800 EXP 14
// slot 15994
    15994, 32696,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:704
//YDOTLIM		DEC	16366		# =1.0 - YDOT DZ= 16384 -18
// slot 15995
    15995, 32732,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:705
//					# YDOT DZ = YDOT TCDU/180 = 2/1800 EXP 14
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:706
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:707
//CM/BIAS		DEC	55		# =.6/180 B14 = 55
// slot 15996
    15996, 110,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:708
//YAWLIM		DEC	16055		# YAWLIM=1.0-3.6/180=16384-329=16055
// slot 15997
    15997, 32110,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:709
//C45LIM		DEC	.29289		# =1.0-COS(45)
// slot 15998
    15998, 9598,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:710
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:711
//SINTRIM		DEC	-.34202		# SIN(-20)	(FOR NOMINAL L/D = .3)
// slot 15999
    15999, 54326,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:712
//COSTRIM		DEC	.93969		# COS(-20)	(FOR NOMINAL L/D = .3)
// slot 16000
    16000, 30792,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:713
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:714
//# TO MAKE DAP INSENSITIVE TO PITCH ERRORS DUE TO ACCUMULATED NAV ERRORS, USE NOMINAL VALUE (-20 DEG) FOR TRIM ALFA
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:715
//# USED DURING ATMOSPHERIC COORDINATION. OUTSIDE ATMOSPHERE, NAV ERRORS WILL BE SLIGHT, BUT ALFA CAN DIFFER GREATLY
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:716
//# FROM TRIM, SO USE ON-BOARD ESTIMATES.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:717
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:718
//# Page 1080
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:719
//# JET CODE TABLES FOLLOW _
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:720
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:721
//		OCTAL	00120		# POS Y
// slot 16001
    16001, 160,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:722
//YJETCODE	OCTAL	00000		# RCS JET BITS
// slot 16002
    16002, 0,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:723
//		OCTAL	00240		# NEG Y
// slot 16003
    16003, 320,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:724
//		OCTAL	00005		# POS R JET BITS	ALSO POS P JET BITS
// slot 16004
    16004, 10,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:725
//P/RJCODE	OCTAL	00000
// slot 16005
    16005, 0,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:726
//		OCTAL	00012		# NEG R			ALSO NEG P
// slot 16006
    16006, 20
)).

// bank 15, slots 16007-16011
function agcAotUnit929 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16008 {
        if slot <= 16007 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:727
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:728
//# Page 1081
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:729
//# RCS		THIS SECTION IS ENTERED EACH 2 SEC BY WAITLIST CALL FOLLOWING A DELAY OF 1.2 SEC AFTER PIPUP.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:730
//# THE TASK  SETJTAG  SETS A FLAG IN  JETAG  TO SIGNIFY THAT ROLL UPDATE IS DUE.  IN ROUGHLY 5 CS  BPDYRATE  WILL BE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:731
//# EXECUTED AND JETAG WILL CAUSE  CM/RCS  TO ACT ON ROLLC IMMEDIATELY THEREAFTER.  THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:732
//# TASK SAVES THE CALL TIME SO THAT CM/RCS CAN DETERMINE HOW MUCH OF THE 2 SEC INTERVAL REMAINS BEFORE THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:733
//# NEXT UPDATE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:734
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:735
//SETJTAG		CS	TIME1		# SAVE NOMINAL UPDATE TIME FOR SYNCH
// slot 16007
            if slot <> 16007 or instruction <> 16405 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 21).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:736
//		TS	TUSED
// slot 16008
            if slot <> 16008 or instruction <> 23498 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23498, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16009 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:737
//					# THE 5 CS APPEARS IN TIMETST.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:738
//		CA	ONE		# RATHER THAN INCR, FOR SAFETY
// slot 16009
            if slot <> 16009 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16010 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:739
//		TS	JETAG		# SET JETAG=1 TO CAUSE CM/RCS TO BE
// slot 16010
                if slot <> 16010 or instruction <> 23497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:740
//		TC	PHASCHNG
// slot 16011
                if slot <> 16011 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[929] to agcAotUnit929@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:741
//		OCT	00001
// slot 16012
    16012, 2
)).

// bank 15, slots 16013-16057
function agcAotUnit930 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16034 {
        if slot <= 16023 {
            if slot <= 16017 {
                if slot <= 16014 {
                    if slot <= 16013 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:742
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:743
//		TC	TASKOVER	# EXECUTED AFTER NEXT BODYRATE UPDATE
// slot 16013
                        if slot <> 16013 or instruction <> 2772 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2772, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:744
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:745
//# PREDICTIVE ROLL SYSTEM	ENTRY STEERING PROVIDES ROLL COMMAND IN LOC ROLLC.  THE FOLLOWING CALCULATES THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:746
//# TRAJECTORY TO THE ORIGIN IN PHASE PLANE (X,V).  PROGRAM ENTERS JET ON AND OFF CALLS INTO WTLST TO PRODUCE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:747
//# THE DESIRED TRAJECTORY.  ONLY THOSE CALLS WHICH CAN BE EXECUTED WITHIN THE INTERVAL  T  (2 SEC) ARE ENTERED IN
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:748
//# WTLST, THE REMAINDER ARE RECONSIDERED AT NEXT UPDATE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:749
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:750
//HALFPR		EQUALS	NEG1/2 +1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:751
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:752
//					# CLEAR JETAG BEFORE TIMETST.  SET TO +0 TO SHOW
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:753
//					# ROLL DAP CALLED.  IN EVENT OF RESTART, BODYRATE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:754
//					# MAY MISS A CYCLE.  CM/RCS WILL MISS A CYCLE ONLY
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:755
//					# IF A RESTART OCCURS AFTER TIMETST COMMENCES.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:756
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:757
//CM/RCS		CS	ONE
// slot 16014
                        if slot <> 16014 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16015 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:758
//		TS	JNDX		# SET NDX FOR POS ROLL, AND CHANGE LATER
// slot 16015
                        if slot <> 16015 or instruction <> 23439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16016 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:759
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:760
//		CS	2T/TCDU		# ROLLDOT = DELAOG + DELAIG SINM =DELR
// slot 16016
                            if slot <> 16016 or instruction <> 18971 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:761
//		EXTEND
// slot 16017
                            if slot <> 16017 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16020 {
                    if slot <= 16018 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:762
//		MP	PREL		# DELR/180 = RDOT TCDU/180 = RDOT/1800
// slot 16018
                        if slot <> 16018 or instruction <> 29633 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 961, readEffective:call(words, 961)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16019 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:763
//		AD	L		# -2 RDOT T/180 IN L
// slot 16019
                            if slot <> 16019 or instruction <> 24577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:764
//		TS	-VT/180		# SAVE -2VT/180 HERE
// slot 16020
                            if slot <> 16020 or instruction <> 23435 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23435, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16021 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:765
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:766
//		CS	ROLL/180
// slot 16021
                        if slot <> 16021 or instruction <> 17332 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 948).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16022 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:767
//		TS	SR		# SAVE (-R/180) /2
// slot 16022
                            if slot <> 16022 or instruction <> 22545 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22545, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:768
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:769
//		CS	CM/FLAGS
// slot 16023
                            if slot <> 16023 or instruction <> 16450 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 66).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16028 {
                if slot <= 16025 {
                    if slot <= 16024 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:770
//		MASK	BIT4		# LATSW = 101D BIT4
// slot 16024
                        if slot <> 16024 or instruction <> 31244 { return choose false if checkOnly else -1. }
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
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:771
//		EXTEND			# ROLL OVER TOP $
// slot 16025
                        if slot <> 16025 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16026 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:772
//		BZF	GETLCX		# NO, TAKE SHORTEST PATH
// slot 16026
                        if slot <> 16026 or instruction <> 5792 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5792, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16027 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:773
//		ADS	CM/FLAGS	# YES, ENFORCE ROLL OVER TOP.. (BIT =0)
// slot 16027
                            if slot <> 16027 or instruction <> 11330 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 66).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:774
//		CA	ROLLC		# (ROLLC/180) /2
// slot 16028
                            if slot <> 16028 or instruction <> 13261 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 973).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16031 {
                    if slot <= 16029 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:775
//		AD	SR		# -(R/180) /2
// slot 16029
                        if slot <> 16029 or instruction <> 24593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 17).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16030 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:776
//		XCH	LCX/360		# DIFFERENT X REQD HERE.  DISCONT AT 180.
// slot 16030
                            if slot <> 16030 or instruction <> 24460 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 908, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:777
//		TCF	COMPAT		# POSSIBLE OVFL ABOVE.
// slot 16031
                            if slot <> 16031 or instruction <> 5824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5824, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16032 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:778
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:779
//# Page 1082
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:780
//GETLCX		CA	POS1/2		# FORM RCOM/360
// slot 16032
                        if slot <> 16032 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16033 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:781
//		DOUBLE
// slot 16033
                            if slot <> 16033 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:782
//		AD	ROLLC
// slot 16034
                            if slot <> 16034 or instruction <> 25549 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 973).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16045 {
            if slot <= 16039 {
                if slot <= 16036 {
                    if slot <= 16035 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:783
//		XCH	LCX/360		# IGNORE POSSIBLE OVFL.
// slot 16035
                        if slot <> 16035 or instruction <> 24460 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 908, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:784
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:785
//		CA	SR		# FORM -R/360
// slot 16036
                        if slot <> 16036 or instruction <> 12305 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 17).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16037 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:786
//		AD	NEG1/2
// slot 16037
                        if slot <> 16037 or instruction <> 27136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16038 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:787
//		AD	NEG1/2		# IGNORE OVFL
// slot 16038
                            if slot <> 16038 or instruction <> 27136 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:788
//		XCH	LCX/360		# -R/360
// slot 16039
                            if slot <> 16039 or instruction <> 24460 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 908, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16042 {
                    if slot <= 16040 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:789
//		ADS	LCX/360		# LCX/360 = RCOM/360 -R/360  RANGE (-1,1)
// slot 16040
                        if slot <> 16040 or instruction <> 12172 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 908).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16041 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:790
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:791
//# DOES SGN(-VT) (VT/180) (VT/180) (180/(4 A1 TT COSALFA)) + X/360 + SGN(X) / 2	  OVFL ?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:792
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:793
//		CCS	-VT/180		# TAKE SHORTEST ANGULAR PATH
// slot 16041
                            if slot <> 16041 or instruction <> 5003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 907).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:794
//		AD	ONE		# (BASED ON SINGLE JET ACCELERATION)
// slot 16042
                            if slot <> 16042 or instruction <> 27151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16043 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:795
//		TCF	+2
// slot 16043
                        if slot <> 16043 or instruction <> 5805 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5805, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16044 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:796
//		AD	ONE
// slot 16044
                            if slot <> 16044 or instruction <> 27151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:797
//		EXTEND
// slot 16045
                            if slot <> 16045 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 16051 {
                if slot <= 16048 {
                    if slot <= 16046 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:798
//		MP	-VT/180		# C(-VT/180) = -2 VT/180
// slot 16046
                        if slot <> 16046 or instruction <> 29579 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 907, readEffective:call(words, 907)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16047 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:799
//		EXTEND
// slot 16047
                            if slot <> 16047 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:800
//		MP	1/16A1		# = 180/(16 A1 TT)
// slot 16048
                            if slot <> 16048 or instruction <> 30696 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2024, readEffective:call(words, 2024)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16049 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:801
//		EXTEND
// slot 16049
                        if slot <> 16049 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16050 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:802
//		DV	CALFA
// slot 16050
                            if slot <> 16050 or instruction <> 4934 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 838, readEffective:call(words, 838)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:803
//		TS	L
// slot 16051
                            if slot <> 16051 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16054 {
                    if slot <= 16052 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:804
//		CCS	LCX/360
// slot 16052
                        if slot <> 16052 or instruction <> 5004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 908).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16053 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:805
//		CAF	POS1/2
// slot 16053
                            if slot <> 16053 or instruction <> 14850 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:806
//		TCF	+2
// slot 16054
                            if slot <> 16054 or instruction <> 5816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5816, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16055 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:807
//		CS	POS1/2
// slot 16055
                        if slot <> 16055 or instruction <> 18946 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16056 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:808
//		AD	LCX/360		# IS LCX/360 LESS THAN 180 DEGS  $
// slot 16056
                            if slot <> 16056 or instruction <> 25484 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 908).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:809
//		AD	L
// slot 16057
                            if slot <> 16057 or instruction <> 24577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[930] to agcAotUnit930@.

// bank 15, slots 16058-16060
function agcAotUnit931 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16058 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:810
//		TS	L
// slot 16058
        if slot <> 16058 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16059 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:811
//		TCF	COMPAT		# YES, GO ON.
// slot 16059
            if slot <> 16059 or instruction <> 5824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:812
//TRTAGXPI	INDEX	A		# NO, SHIFT X BY - SGN(X) 2 PI
// slot 16060
            if slot <> 16060 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[931] to agcAotUnit931@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:813
//		CS	HALFPR		# +A YIELDS -1/2
// slot 16061
    16061, 37890
)).

// bank 15, slots 16062-16186
function agcAotUnit932 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16123 {
        if slot <= 16092 {
            if slot <= 16076 {
                if slot <= 16068 {
                    if slot <= 16064 {
                        if slot <= 16062 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:814
//		DOUBLE
// slot 16062
                            if slot <> 16062 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16063 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:815
//		ADS	LCX/360
// slot 16063
                                if slot <> 16063 or instruction <> 12172 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:816
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:817
//COMPAT		CA	LCX/360		# CORRECT FOR ASSUMED COORD TURN.
// slot 16064
                                if slot <> 16064 or instruction <> 13196 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16066 {
                            if slot <= 16065 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:818
//		EXTEND
// slot 16065
                                if slot <> 16065 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:819
//		MP	CALFA		# COS ALFA
// slot 16066
                                if slot <> 16066 or instruction <> 29510 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 838, readEffective:call(words, 838)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16067 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:820
//		TS	LCX/360		# SCALED LCX OK HERE.
// slot 16067
                                if slot <> 16067 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:821
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:822
//		CCS	CMDAPMOD	# FOUR POSSIBILITIES HERE
// slot 16068
                                if slot <> 16068 or instruction <> 5056 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 960).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16072 {
                        if slot <= 16070 {
                            if slot <= 16069 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:823
//		TC	DZCALL1		# EXIT, SETTING JETAG=0. (C(A)=0)
// slot 16069
                                if slot <> 16069 or instruction <> 1981 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1981, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:824
//					# ALL 3 AXES ALREADY DONE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:825
//		TC	+1		# G LESS THAN .05.  CA POS. CONTINUE
// slot 16070
                                if slot <> 16070 or instruction <> 1735 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1735, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16071 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:826
//		CA	LCX/360		# G GEQ .05.  CONTINUE IN CM/RCS
// slot 16071
                                if slot <> 16071 or instruction <> 13196 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:827
//		TS	LCX/360		# CMDAPMOD=-0.  DAMPING ONLY. SET LCX=0
// slot 16072
                                if slot <> 16072 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16074 {
                            if slot <= 16073 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:828
//		TS	ERRORZ		# INITIAL ROLL ERROR (UNREFLECTED) FOR TM.
// slot 16073
                                if slot <> 16073 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:829
//		TS	PAXERR1		# SAVE LCX FOR FDAI AND EDIT.  (/360)
// slot 16074
                                if slot <> 16074 or instruction <> 23499 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23499, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16075 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:830
//# Page 1083
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:831
//		CA	-VT/180		# GET - 2 VT/180
// slot 16075
                                if slot <> 16075 or instruction <> 13195 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 907).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:832
//		TS	SR
// slot 16076
                                if slot <> 16076 or instruction <> 22545 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22545, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16084 {
                    if slot <= 16080 {
                        if slot <= 16078 {
                            if slot <= 16077 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:833
//		CA	SR		# GET -VT/180, LEAVE -VT/360 IN SR FOR DZ
// slot 16077
                                if slot <> 16077 or instruction <> 12305 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 17).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:834
//		TS	-VT/180E	#			DIAGNOSTIC ****
// slot 16078
                                if slot <> 16078 or instruction <> 23416 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23416, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16079 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:835
//		XCH	-VT/180		# NOW CONTENTS OF -VT/180 AS LABELED
// slot 16079
                                if slot <> 16079 or instruction <> 24459 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 907, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:836
//		EXTEND
// slot 16080
                                if slot <> 16080 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16082 {
                            if slot <= 16081 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:837
//		MP	-VT/180		# B(A) = -ZVT/180
// slot 16081
                                if slot <> 16081 or instruction <> 29579 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 907, readEffective:call(words, 907)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:838
//		EXTEND
// slot 16082
                                if slot <> 16082 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16083 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:839
//		MP	180/8ATT
// slot 16083
                                if slot <> 16083 or instruction <> 30696 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2024, readEffective:call(words, 2024)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:840
//		TS	VSQ/4API
// slot 16084
                                if slot <> 16084 or instruction <> 23438 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23438, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16088 {
                        if slot <= 16086 {
                            if slot <= 16085 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:841
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:842
//# IS SGN(VT) ( (180/4A1 TT) VT/180 VT/180 - .5 BUFLIM/360 ) -X/360 - .5 BUFLIM/360  POS?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:843
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:844
//WHICHALF	DOUBLE			# FOR SECOND BURN, A1
// slot 16085
                                if slot <> 16085 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:845
//		COM
// slot 16086
                                if slot <> 16086 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16087 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:846
//		AD	BUFLIM		# =BUFLIM/(2 360)
// slot 16087
                                if slot <> 16087 or instruction <> 26604 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:847
//		TS	L
// slot 16088
                                if slot <> 16088 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16090 {
                            if slot <= 16089 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:848
//		CCS	-VT/180
// slot 16089
                                if slot <> 16089 or instruction <> 5003 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 907).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:849
//		CS	L
// slot 16090
                                if slot <> 16090 or instruction <> 16385 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 1).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16091 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:850
//		TCF	+2
// slot 16091
                                if slot <> 16091 or instruction <> 5853 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5853, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:851
//		CA	L
// slot 16092
                                if slot <> 16092 or instruction <> 12289 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16107 {
                if slot <= 16099 {
                    if slot <= 16095 {
                        if slot <= 16093 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:852
//		AD	LCX/360
// slot 16093
                            if slot <> 16093 or instruction <> 25484 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 908).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16094 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:853
//		AD	BUFLIM
// slot 16094
                                if slot <> 16094 or instruction <> 26604 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:854
//		EXTEND
// slot 16095
                                if slot <> 16095 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16097 {
                            if slot <= 16096 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:855
//		BZMF	REFLECT		# POINT (X,V) IN LHP.
// slot 16096
                                if slot <> 16096 or instruction <> 26349 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26349, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:856
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:857
//# IS SGN(VT) ( (180/4A1 TT) VT/180 VT/180 - .5 BUFLIM/360 ) -X/360 + .5 BUFLIM/360  NEG?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:858
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:859
//		COM
// slot 16097
                                if slot <> 16097 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16098 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:860
//		AD	BUFLIM
// slot 16098
                                if slot <> 16098 or instruction <> 26604 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:861
//		AD	BUFLIM
// slot 16099
                                if slot <> 16099 or instruction <> 26604 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16103 {
                        if slot <= 16101 {
                            if slot <= 16100 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:862
//		EXTEND
// slot 16100
                                if slot <> 16100 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:863
//		BZMF	DZ1		# POINT (X,V) IN RHP.
// slot 16101
                                if slot <> 16101 or instruction <> 26356 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26356, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16102 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:864
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:865
//# IS POINT WITHIN VELOCITY DZ?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:866
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:867
//		CS	VSQMIN		# IS VSQ/4API - (VSQ/4API) MIN NEG?
// slot 16102
                                if slot <> 16102 or instruction <> 18407 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2023), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:868
//		AD	VSQ/4API
// slot 16103
                                if slot <> 16103 or instruction <> 25486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 910).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16105 {
                            if slot <= 16104 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:869
//		EXTEND
// slot 16104
                                if slot <> 16104 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:870
//		BZMF	DZCALL		# YES.
// slot 16105
                                if slot <> 16105 or instruction <> 26543 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26543, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16106 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:871
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:872
//# POINT IS IN BUFFER ZONE.  THRUST TO X AXIS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:873
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:874
//		CS	JNDX
// slot 16106
                                if slot <> 16106 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:875
//		TS	JNDX1
// slot 16107
                                if slot <> 16107 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16115 {
                    if slot <= 16111 {
                        if slot <= 16109 {
                            if slot <= 16108 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:876
//		TC	OVRLINE1
// slot 16108
                                if slot <> 16108 or instruction <> 1823 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1823, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:877
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:878
//REFLECT		CS	-VT/180		# RELFECT LHP INTO RHP REL TO TERM CONTR
// slot 16109
                                if slot <> 16109 or instruction <> 17291 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 907).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16110 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:879
//		TS	-VT/180
// slot 16110
                                if slot <> 16110 or instruction <> 23435 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23435, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:880
//		TS	SR		# -VT/360 SAVED FOR DZ.
// slot 16111
                                if slot <> 16111 or instruction <> 22545 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22545, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16113 {
                            if slot <= 16112 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:881
//# Page 1084
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:882
//		CS	LCX/360
// slot 16112
                                if slot <> 16112 or instruction <> 17292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 908).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:883
//		TS	LCX/360
// slot 16113
                                if slot <> 16113 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16114 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:884
//		CS	JNDX
// slot 16114
                                if slot <> 16114 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:885
//		TS	JNDX
// slot 16115
                                if slot <> 16115 or instruction <> 23439 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23439, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16119 {
                        if slot <= 16117 {
                            if slot <= 16116 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:886
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:887
//# IS VSQ/4API - (VSQ/4API) MIN NEG?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:888
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:889
//DZ1		CS	VSQMIN		# IS VSQ/4API - (VSQ/4API) MIN NEG  $
// slot 16116
                                if slot <> 16116 or instruction <> 18407 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2023), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:890
//		AD	VSQ/4API
// slot 16117
                                if slot <> 16117 or instruction <> 25486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 910).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16118 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:891
//		EXTEND
// slot 16118
                                if slot <> 16118 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:892
//		BZMF	DZ2		# YES, GO TEST FURTHER.
// slot 16119
                                if slot <> 16119 or instruction <> 26361 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16121 {
                            if slot <= 16120 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:893
//		TCF	MAXVTEST	# NO
// slot 16120
                                if slot <> 16120 or instruction <> 5886 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5886, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:894
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:895
//# IS X/360 - XMIN/360 -VT/360 NEG?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:896
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:897
//DZ2		CS	XMIN/360	# XMIN/360 = 4/360
// slot 16121
                                if slot <> 16121 or instruction <> 18410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2026), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16122 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:898
//		AD	LCX/360
// slot 16122
                                if slot <> 16122 or instruction <> 25484 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:899
//		AD	SR		# C(SR) = -VT/360
// slot 16123
                                if slot <> 16123 or instruction <> 24593 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 17).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16154 {
            if slot <= 16138 {
                if slot <= 16130 {
                    if slot <= 16126 {
                        if slot <= 16124 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:900
//		EXTEND			# IS X/360 - XMIN/360 -VT/360 NEG  $
// slot 16124
                            if slot <> 16124 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16125 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:901
//		BZMF	DZCALL		# YES, IN DZ. EXIT SETTING JETAG=0.
// slot 16125
                                if slot <> 16125 or instruction <> 26543 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26543, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:902
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:903
//# IS XD/360 - VM/360K - XS/360 POS?
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:904
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:905
//MAXVTEST	CS	JNDX
// slot 16126
                                if slot <> 16126 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16128 {
                            if slot <= 16127 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:906
//		TS	JNDX1		# NOW CAN SET JNDX1 FOR TON2 JETS.
// slot 16127
                                if slot <> 16127 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:907
//		CS	XS/360		# XS/360 = (XMIN -YMIN/K) /360
// slot 16128
                                if slot <> 16128 or instruction <> 18412 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2028), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16129 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:908
//		AD	VSQ/4API
// slot 16129
                                if slot <> 16129 or instruction <> 25486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 910).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:909
//		AD	LCX/360
// slot 16130
                                if slot <> 16130 or instruction <> 25484 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16134 {
                        if slot <= 16132 {
                            if slot <= 16131 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:910
//		TS	XD/360		# XD/360= X/360 +VSQ/4API   X INTERCEPT
// slot 16131
                                if slot <> 16131 or instruction <> 23437 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23437, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:911
//					# BUT C(XD/360) = (XD - XS) /360
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:912
//		AD	-VM/360K	# X INTERCEPT FOR MAX V (VM)
// slot 16132
                                if slot <> 16132 or instruction <> 26603 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2027), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16133 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:913
//		COM
// slot 16133
                                if slot <> 16133 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:914
//		EXTEND
// slot 16134
                                if slot <> 16134 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16136 {
                            if slot <= 16135 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:915
//		BZMF	MAXVTIM1	# YES, THRUST TO VM
// slot 16135
                                if slot <> 16135 or instruction <> 26381 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26381, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:916
//		CA	XD/360
// slot 16136
                                if slot <> 16136 or instruction <> 13197 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 909).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16137 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:917
//		EXTEND
// slot 16137
                                if slot <> 16137 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:918
//		MP	KTRCS
// slot 16138
                                if slot <> 16138 or instruction <> 31234 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16146 {
                    if slot <= 16142 {
                        if slot <= 16140 {
                            if slot <= 16139 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:919
//		DDOUBL			# GO SAVE PREDICTED DRIFTING VELOCITY.
// slot 16139
                                if slot <> 16139 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:920
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:921
//		TC	GETON1		# INSURE THAT Q IS POS AS TAG.
// slot 16140
                                if slot <> 16140 or instruction <> 1808 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1808, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16141 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:922
//MAXVTIM1	EXTEND
// slot 16141
                                if slot <> 16141 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:923
//		ZQ			# SET +Q AS TAG
// slot 16142
                                if slot <> 16142 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16144 {
                            if slot <= 16143 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:924
//		CS	-VMT/180
// slot 16143
                                if slot <> 16143 or instruction <> 18411 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2027), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:925
//GETON1		TS	VDT/180		# VDT/180 OR VMT/180
// slot 16144
                                if slot <> 16144 or instruction <> 23415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16145 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:926
//		AD	-VT/180
// slot 16145
                                if slot <> 16145 or instruction <> 25483 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 907).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:927
//		DOUBLE
// slot 16146
                                if slot <> 16146 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16150 {
                        if slot <= 16148 {
                            if slot <= 16147 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:928
//		EXTEND
// slot 16147
                                if slot <> 16147 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:929
//		MP	180/8ATT
// slot 16148
                                if slot <> 16148 or instruction <> 30696 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2024, readEffective:call(words, 2024)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16149 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:930
//		TS	TON1		# TON1 / 4T
// slot 16149
                                if slot <> 16149 or instruction <> 23441 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23441, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:931
//# Page 1085
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:932
//		EXTEND
// slot 16150
                                if slot <> 16150 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16152 {
                            if slot <= 16151 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:933
//		BZMF	OVRLINE
// slot 16151
                                if slot <> 16151 or instruction <> 26393 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26393, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:934
//		TC	GETON2		# RESET Q POS IF CAME FROM MAXVTIM1
// slot 16152
                                if slot <> 16152 or instruction <> 1827 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1827, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16153 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:935
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:936
//OVRLINE		CCS	Q
// slot 16153
                                if slot <> 16153 or instruction <> 4098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 2).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:937
//		TCF	OVRLINE1
// slot 16154
                                if slot <> 16154 or instruction <> 5919 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5919, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16170 {
                if slot <= 16162 {
                    if slot <= 16158 {
                        if slot <= 16156 {
                            if slot <= 16155 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:938
//MAXVTIM2	CA	JNDX1		# ABOVE VM, SO THRUST DOWN
// slot 16155
                                if slot <> 16155 or instruction <> 13200 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 912).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:939
//		TS	JNDX
// slot 16156
                                if slot <> 16156 or instruction <> 23439 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23439, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16157 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:940
//		CS	TON1
// slot 16157
                                if slot <> 16157 or instruction <> 17297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 913).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:941
//		TCF	OVRLINE2 +1
// slot 16158
                                if slot <> 16158 or instruction <> 5922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5922, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16160 {
                            if slot <= 16159 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:942
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:943
//OVRLINE1	CS	-VT/180		# DRIFT AT V
// slot 16159
                                if slot <> 16159 or instruction <> 17291 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 907).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:944
//		TS	VDT/180
// slot 16160
                                if slot <> 16160 or instruction <> 23415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16161 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:945
//OVRLINE2	CA	ZERO
// slot 16161
                                if slot <> 16161 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:946
//		TS	TON1
// slot 16162
                                if slot <> 16162 or instruction <> 23441 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23441, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16166 {
                        if slot <= 16164 {
                            if slot <= 16163 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:947
//GETON2		CA	VDT/180		# VDT/180, OR VMT/180 OR VT/180
// slot 16163
                                if slot <> 16163 or instruction <> 13175 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 887).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:948
//		DOUBLE
// slot 16164
                                if slot <> 16164 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16165 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:949
//		EXTEND
// slot 16165
                                if slot <> 16165 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:950
//		MP	180/8ATT
// slot 16166
                                if slot <> 16166 or instruction <> 30696 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2024, readEffective:call(words, 2024)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16168 {
                            if slot <= 16167 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:951
//		DOUBLE			# FOR SECOND BURN, A1
// slot 16167
                                if slot <> 16167 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:952
//		TS	TON2		# = TON2 / 4T
// slot 16168
                                if slot <> 16168 or instruction <> 23431 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23431, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16169 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:953
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:954
//		COM
// slot 16169
                                if slot <> 16169 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:955
//		EXTEND
// slot 16170
                                if slot <> 16170 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 16178 {
                    if slot <= 16174 {
                        if slot <= 16172 {
                            if slot <= 16171 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:956
//		BZMF	GETOFF
// slot 16171
                                if slot <> 16171 or instruction <> 26415 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:957
//		TS	TON2
// slot 16172
                                if slot <> 16172 or instruction <> 23431 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23431, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16173 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:958
//		CA	JNDX
// slot 16173
                                if slot <> 16173 or instruction <> 13199 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:959
//		TS	JNDX1
// slot 16174
                                if slot <> 16174 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16176 {
                            if slot <= 16175 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:960
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:961
//GETOFF		CS	TON2		# TON2 / 4T
// slot 16175
                                if slot <> 16175 or instruction <> 17287 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 903).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:962
//		EXTEND
// slot 16176
                                if slot <> 16176 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16177 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:963
//		MP	VDT/180		# VDT/180, OR VT/180, OR VMT/180.
// slot 16177
                                if slot <> 16177 or instruction <> 29559 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 887, readEffective:call(words, 887)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:964
//		TS	XD/360		# USE AS TEMP
// slot 16178
                                if slot <> 16178 or instruction <> 23437 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23437, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16182 {
                        if slot <= 16180 {
                            if slot <= 16179 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:965
//		CS	VDT/180
// slot 16179
                                if slot <> 16179 or instruction <> 17271 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 887).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:966
//		EXTEND
// slot 16180
                                if slot <> 16180 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16181 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:967
//		BZF	TOFFOVFL	# OMIT THE DIVIDE IF DEN = 0.
// slot 16181
                                if slot <> 16181 or instruction <> 5953 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5953, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:968
//		AD	-VT/180
// slot 16182
                                if slot <> 16182 or instruction <> 25483 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 907).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16184 {
                            if slot <= 16183 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:969
//		EXTEND
// slot 16183
                                if slot <> 16183 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:970
//		MP	TON1		# TON1 /4T
// slot 16184
                                if slot <> 16184 or instruction <> 29585 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 913, readEffective:call(words, 913)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16185 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:971
//		AD	XD/360		# TEMP = -VDT/180 / 2 TON2
// slot 16185
                                if slot <> 16185 or instruction <> 25485 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 909).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:972
//		AD	LCX/360
// slot 16186
                                if slot <> 16186 or instruction <> 25484 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 908).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[932] to agcAotUnit932@.

// bank 15, slots 16187-16223
function agcAotUnit933 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16204 {
        if slot <= 16195 {
            if slot <= 16190 {
                if slot <= 16188 {
                    if slot <= 16187 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:973
//		ZL
// slot 16187
                        if slot <> 16187 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:974
//		XCH	L		# TEST THE DIVIDE
// slot 16188
                        if slot <> 16188 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16189 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:975
//		EXTEND
// slot 16189
                        if slot <> 16189 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:976
//		DV	VDT/180
// slot 16190
                        if slot <> 16190 or instruction <> 4983 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 887, readEffective:call(words, 887)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16192 {
                    if slot <= 16191 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:977
//		EXTEND
// slot 16191
                        if slot <> 16191 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:978
//		BZF	GETOFF2		# DIVIDE OK
// slot 16192
                        if slot <> 16192 or instruction <> 5955 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5955, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16193 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:979
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:980
//TOFFOVFL	CA	2JETT		# OVFL, USE  2T  FOR CONVENIENCE.
// slot 16193
                        if slot <> 16193 or instruction <> 14885 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2597), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16194 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:981
//		TCF	TIMSCAL
// slot 16194
                            if slot <> 16194 or instruction <> 5960 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5960, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:982
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:983
//# Page 1086
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:984
//GETOFF2		XCH	L		# GET NUMERATOR.
// slot 16195
                            if slot <> 16195 or instruction <> 23553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 1, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16199 {
                if slot <= 16197 {
                    if slot <= 16196 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:985
//		EXTEND
// slot 16196
                        if slot <> 16196 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:986
//		DV	VDT/180		# C(A) = TOFF / 2T
// slot 16197
                        if slot <> 16197 or instruction <> 4983 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 887, readEffective:call(words, 887)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16198 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:987
//		EXTEND
// slot 16198
                        if slot <> 16198 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:988
//		MP	2JETT
// slot 16199
                        if slot <> 16199 or instruction <> 31269 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2597, readEffective:call(words, 2597)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16201 {
                    if slot <= 16200 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:989
//TIMSCAL		TS	TOFF		# IN CS
// slot 16200
                        if slot <> 16200 or instruction <> 23429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23429, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:990
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:991
//		CAF	4JETT
// slot 16201
                        if slot <> 16201 or instruction <> 14313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2025), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16202 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:992
//		EXTEND
// slot 16202
                        if slot <> 16202 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16203 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:993
//		MP	TON1		# C(TON1) = TON1 / 4T
// slot 16203
                            if slot <> 16203 or instruction <> 29585 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 913, readEffective:call(words, 913)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:994
//		TS	TON1		# IN CS
// slot 16204
                            if slot <> 16204 or instruction <> 23441 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23441, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16213 {
            if slot <= 16208 {
                if slot <= 16206 {
                    if slot <= 16205 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:995
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:996
//		CAF	4JETT
// slot 16205
                        if slot <> 16205 or instruction <> 14313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2025), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:997
//		EXTEND
// slot 16206
                        if slot <> 16206 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16207 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:998
//		MP	TON2		# C(TON2) = TON2 / 4T
// slot 16207
                        if slot <> 16207 or instruction <> 29575 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 903, readEffective:call(words, 903)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:999
//		TS	TON2		# IN CS
// slot 16208
                        if slot <> 16208 or instruction <> 23431 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23431, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16210 {
                    if slot <= 16209 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1000
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1001
//		CA	ZERO		# CANNOT REDO AFTER TIMETST.  TUSED GONE
// slot 16209
                        if slot <> 16209 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1002
//		TS	JETAG		# SET +0 TO SHOW ROLL DAP CALLED.
// slot 16210
                        if slot <> 16210 or instruction <> 23497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16211 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1003
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1004
//					# CAUSE THE TM OF BODY RATES VIA UPBUFF TO BE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1005
//					# INITIALIZED. ALSO CAUSE NEEDLES TO BE DONE ON EXIT
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1006
//					# AND ON ALTERNATE PASSES THROUGH CM/DUMPR.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1007
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1008
//		CA	ONE
// slot 16211
                        if slot <> 16211 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16212 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1009
//		TS	SW/NDX
// slot 16212
                            if slot <> 16212 or instruction <> 22725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22725, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1010
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1011
//# Page 1087
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1012
//# TIMETEST SECTION FOR RCS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1013
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1014
//# ENTER WITH THREE TIME INTERVALS AND THE CORRESPONDING JET CODE INDEXES IN ERASABLE LOCS TON1, TOFF, TON2, JNDX
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1015
//# JNDX1.  SECTION PROCESSES TIME INTERVALS FOR WTLST CALLS AND ASSURES THAT WTLST CALLS ARE MADE ONLY
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1016
//# (1) FOR POS INTERVALS GREATER THAN A SPECIFIED MINIMUM (HERE CHOSEN AS 2 CS) AND
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1017
//# (2) FOR THE INTERVALS THAT WILL BE EXECUTED WITHIN THE TIME REMAINING IN THE SAMPLE INTERVAL T (2 SEC).
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1018
//# TIMETST ESTABLISHES 6 LOCS CONTAINING JET CODES AND CORRESPONDING TIME INTERVALS.  THUS:  TON1, T1BITS,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1019
//# TOFF, TBITS, TON2, T2BITS.  OF THESE THE FIRST 2 LOCS ARE TEMPORARY, FOR IMMEDIATE ACTION, IN GENERAL.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1020
//# SECTION JETCALL BELOW PROCESSES THIS LIST.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1021
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1022
//TIMETST		CA	TIME1		# CORRECT FOR POSSIBLE TIME1 OVFL.
// slot 16213
                            if slot <> 16213 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 21).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16218 {
                if slot <= 16215 {
                    if slot <= 16214 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1023
//		AD	POS1/2
// slot 16214
                        if slot <> 16214 or instruction <> 27138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1024
//		AD	POS1/2		# OVFL GUARANTEED.
// slot 16215
                        if slot <> 16215 or instruction <> 27138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16216 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1025
//		ADS	TUSED		# B(TUSED) =-TUSED =-OLTIME1
// slot 16216
                        if slot <> 16216 or instruction <> 12234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 970).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16217 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1026
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1027
//		CA	-T-3		# =-T +2 -5 (SEE SETJTAG)
// slot 16217
                            if slot <> 16217 or instruction <> 14310 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2022), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1028
//					# THE +2 REQUIRED FOR PROPER BRANCH.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1029
//		ADS	TUSED		# TUSED = TIME(K)-TIME(K-1)-T+2
// slot 16218
                            if slot <> 16218 or instruction <> 12234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 970).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16220 {
                    if slot <= 16219 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1030
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1031
//		CS	TWO		# USE 2 SINCE TIME3 UNCERTAIN TO 1
// slot 16219
                        if slot <> 16219 or instruction <> 18958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1032
//		AD	TON1
// slot 16220
                        if slot <> 16220 or instruction <> 25489 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 913).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16221 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1033
//		EXTEND
// slot 16221
                        if slot <> 16221 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16222 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1034
//		BZMF	TIMETST1
// slot 16222
                            if slot <> 16222 or instruction <> 26472 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26472, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1035
//		INDEX	JNDX
// slot 16223
                            if slot <> 16223 or instruction <> 21391 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21391, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21391, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[933] to agcAotUnit933@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1036
//		CAF	P/RJCODE
// slot 16224
    16224, 27914
)).

// bank 15, slots 16225-16250
function agcAotUnit934 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16237 {
        if slot <= 16230 {
            if slot <= 16227 {
                if slot <= 16225 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1037
//		TS	T1BITS
// slot 16225
                    if slot <> 16225 or instruction <> 23442 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23442, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16226 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1038
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1039
//		CA	TON1
// slot 16226
                        if slot <> 16226 or instruction <> 13201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 913).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1040
//		ADS	TUSED
// slot 16227
                        if slot <> 16227 or instruction <> 12234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 970).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16228 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1041
//		EXTEND
// slot 16228
                    if slot <> 16228 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16229 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1042
//		BZMF	TOFFTEST
// slot 16229
                        if slot <> 16229 or instruction <> 26474 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26474, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1043
//		CA	ZERO
// slot 16230
                        if slot <> 16230 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16233 {
                if slot <= 16231 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1044
//		TCF	TIMETST3
// slot 16231
                    if slot <> 16231 or instruction <> 6019 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6019, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16232 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1045
//TIMETST1	CS	ONE
// slot 16232
                        if slot <> 16232 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1046
//		TS	TON1
// slot 16233
                        if slot <> 16233 or instruction <> 23441 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23441, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16235 {
                    if slot <= 16234 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1047
//TOFFTEST	CS	TWO
// slot 16234
                        if slot <> 16234 or instruction <> 18958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1048
//		AD	TOFF
// slot 16235
                        if slot <> 16235 or instruction <> 25477 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 901).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16236 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1049
//		EXTEND
// slot 16236
                        if slot <> 16236 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1050
//		BZMF	TIMETST2
// slot 16237
                        if slot <> 16237 or instruction <> 26484 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26484, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 16243 {
            if slot <= 16240 {
                if slot <= 16238 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1051
//		CA	TOFF
// slot 16238
                    if slot <> 16238 or instruction <> 13189 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 901).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16239 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1052
//		ADS	TUSED
// slot 16239
                        if slot <> 16239 or instruction <> 12234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 970).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1053
//		EXTEND
// slot 16240
                        if slot <> 16240 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16241 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1054
//		BZMF	TON2TEST
// slot 16241
                    if slot <> 16241 or instruction <> 26486 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26486, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16242 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1055
//		CA	ZERO
// slot 16242
                        if slot <> 16242 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1056
//		TCF	TIMETST4
// slot 16243
                        if slot <> 16243 or instruction <> 6021 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6021, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16246 {
                if slot <= 16244 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1057
//TIMETST2	CS	ONE
// slot 16244
                    if slot <> 16244 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16245 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1058
//		TS	TOFF
// slot 16245
                        if slot <> 16245 or instruction <> 23429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23429, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1059
//TON2TEST	CS	TWO
// slot 16246
                        if slot <> 16246 or instruction <> 18958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16248 {
                    if slot <= 16247 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1060
//		AD	TON2
// slot 16247
                        if slot <> 16247 or instruction <> 25479 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 903).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1061
//		EXTEND
// slot 16248
                        if slot <> 16248 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16249 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1062
//		BZMF	TIMETST5
// slot 16249
                        if slot <> 16249 or instruction <> 26502 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26502, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1063
//# Page 1088
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1064
//		INDEX	JNDX1
// slot 16250
                        if slot <> 16250 or instruction <> 21392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21392, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21392, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[934] to agcAotUnit934@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1065
//		CAF	P/RJCODE
// slot 16251
    16251, 27914
)).

// bank 15, slots 16252-16287
function agcAotUnit935 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16269 {
        if slot <= 16260 {
            if slot <= 16255 {
                if slot <= 16253 {
                    if slot <= 16252 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1066
//		TS	T2BITS
// slot 16252
                        if slot <> 16252 or instruction <> 23432 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23432, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1067
//		CA	TON2
// slot 16253
                        if slot <> 16253 or instruction <> 13191 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 903).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16254 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1068
//		ADS	TUSED
// slot 16254
                        if slot <> 16254 or instruction <> 12234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 970).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1069
//		EXTEND
// slot 16255
                        if slot <> 16255 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16257 {
                    if slot <= 16256 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1070
//		BZMF	JETCALL1
// slot 16256
                        if slot <> 16256 or instruction <> 26504 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26504, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1071
//		CA	ZERO
// slot 16257
                        if slot <> 16257 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16258 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1072
//		TCF	TIMETST5 +1
// slot 16258
                        if slot <> 16258 or instruction <> 6023 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6023, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16259 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1073
//TIMETST3	TS	TON1
// slot 16259
                            if slot <> 16259 or instruction <> 23441 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23441, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1074
//		CS	ONE
// slot 16260
                            if slot <> 16260 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16264 {
                if slot <= 16262 {
                    if slot <= 16261 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1075
//TIMETST4	TS	TOFF
// slot 16261
                        if slot <> 16261 or instruction <> 23429 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23429, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1076
//TIMETST5	CS	ONE
// slot 16262
                        if slot <> 16262 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16263 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1077
//		TS	TON2
// slot 16263
                        if slot <> 16263 or instruction <> 23431 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23431, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1078
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1079
//# SECTION  JETCALL  EXAMINES CONTENTS OF JET TIMES IN LIST, ESTABLISHES WTLST ENTRIES, AND EXECUTES CORRESPONDING
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1080
//# JET CODES.  A POSITIVE NZ NUMBER IN A TIME REGISTER INDICATES THAT A WTLST CALL IS TO BE MADE, AND ITS JET BITS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1081
//# EXECUTED.  A +0 INDICATES THAT THE TIME INTERVAL DOES NOT APPLY, BUT THE CORRESPONDING JET BITS ARE TO BE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1082
//# EXECUTED.  A NEG NUMBER INDICATES THAT THE TIME INTERVAL HAS BEEN PROCESSED.  IN EVENT OF +0 OR -1, THE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1083
//# SUBSEQUENT TIME REGISTER IS EXAMINED FOR POSSIBLE ACTION.  THUS JET BITS TO BE EXECUTED MAY COME FROM MORE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1084
//# THAN ONE REGISTER.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1085
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1086
//JETCALL1	CA	ZERO
// slot 16264
                        if slot <> 16264 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16266 {
                    if slot <= 16265 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1087
//		TS	OUTTAG
// slot 16265
                        if slot <> 16265 or instruction <> 23433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23433, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1088
//		TS	NUJET
// slot 16266
                        if slot <> 16266 or instruction <> 23434 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23434, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16267 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1089
//		TS	TBITS
// slot 16267
                        if slot <> 16267 or instruction <> 23430 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23430, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16268 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1090
//		DXCH	TON1
// slot 16268
                            if slot <> 16268 or instruction <> 22418 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 914, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1091
//		CCS	A
// slot 16269
                            if slot <> 16269 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 16278 {
            if slot <= 16273 {
                if slot <= 16271 {
                    if slot <= 16270 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1092
//		TCF	JETCALL2	# CALL WTLST
// slot 16270
                        if slot <> 16270 or instruction <> 6043 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6043, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1093
//JETCALL3	LXCH	NUJET		# WTLST ENTRIES COME HERE FROM JETCALL
// slot 16271
                        if slot <> 16271 or instruction <> 10122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 906, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16272 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1094
//		CS	ONE
// slot 16272
                        if slot <> 16272 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1095
//		DXCH	TOFF
// slot 16273
                        if slot <> 16273 or instruction <> 22406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 902, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16275 {
                    if slot <= 16274 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1096
//		CCS	A
// slot 16274
                        if slot <> 16274 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1097
//		TCF	JETCALL2	# CALL WTLST
// slot 16275
                        if slot <> 16275 or instruction <> 6043 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6043, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16276 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1098
//		LXCH	NUJET
// slot 16276
                        if slot <> 16276 or instruction <> 10122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 906, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16277 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1099
//		CS	ONE
// slot 16277
                            if slot <> 16277 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1100
//		DXCH	TON2
// slot 16278
                            if slot <> 16278 or instruction <> 22408 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 904, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16282 {
                if slot <= 16280 {
                    if slot <= 16279 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1101
//		CCS	A
// slot 16279
                        if slot <> 16279 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1102
//		TCF	JETCALL2	# CALL WTLST
// slot 16280
                        if slot <> 16280 or instruction <> 6043 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6043, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16281 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1103
//		LXCH	NUJET
// slot 16281
                        if slot <> 16281 or instruction <> 10122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 906, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1104
//		TC	JETACTN		# C(A) = +0
// slot 16282
                        if slot <> 16282 or instruction <> 1954 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1954, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16284 {
                    if slot <= 16283 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1105
//JETCALL2	XCH	L		# SAVE JET BITS FOR AFTER WTLST CALL
// slot 16283
                        if slot <> 16283 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1106
//		ADS	NUJET
// slot 16284
                        if slot <> 16284 or instruction <> 12170 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 906).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16285 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1107
//		XCH	L
// slot 16285
                        if slot <> 16285 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16286 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1108
//		AD	ONE		# RESTORE FOR CCS
// slot 16286
                            if slot <> 16286 or instruction <> 27151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1109
//		TC	WAITLIST
// slot 16287
                            if slot <> 16287 or instruction <> 2725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2725, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[935] to agcAotUnit935@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1110
//		EBANK=	AOG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1111
//		2CADR	JETCALL
// slot 16288 16289
    16288, 3920, 16289, 26732
)).

// bank 15, slots 16290-16306
function agcAotUnit936 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16297 {
        if slot <= 16293 {
            if slot <= 16291 {
                if slot <= 16290 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1112
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1113
//JETACTN		CA	NUJET		# COME HERE WHEN DESIRED JET CODE IS KNOWN
// slot 16290
                    if slot <> 16290 or instruction <> 13194 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 906).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1114
//# Page 1089
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1115
//		EXTEND			# NO NEED TO SAVE OLD CODES
// slot 16291
                    if slot <> 16291 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16292 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1116
//		WRITE	ROLLJETS	# SET RCHAN TO NEW BIT CONFIG.
// slot 16292
                    if slot <> 16292 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1117
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1118
//		CCS	OUTTAG
// slot 16293
                    if slot <> 16293 or instruction <> 5001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 905).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16295 {
                if slot <= 16294 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1119
//		TC	TASKOVER
// slot 16294
                    if slot <> 16294 or instruction <> 2772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2772, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1120
//ROLLDUMP	TC	CM/FDAIR
// slot 16295
                    if slot <> 16295 or instruction <> 1989 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1989, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16296 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1121
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1122
//					# EDIT DUMP AT ABOVE LOCATION.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1123
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1124
//# WAITLIST ENTRIES COME HERE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1125
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1126
//JETCALL		CAF	BIT2		# CM/DSTBY =103D BIT2
// slot 16296
                    if slot <> 16296 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1127
//		TS	OUTTAG		# SIGNIFY WTLST ENTRY
// slot 16297
                    if slot <> 16297 or instruction <> 23433 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23433, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16301 {
            if slot <= 16299 {
                if slot <= 16298 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1128
//		MASK	CM/FLAGS	# IS SYSTEM DISABLED  $
// slot 16298
                    if slot <> 16298 or instruction <> 28738 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1129
//		EXTEND
// slot 16299
                    if slot <> 16299 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16300 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1130
//		BZF	JETACTN +1	# YES, QUENCH ROLL JETS, IF ON AND EXIT.
// slot 16300
                    if slot <> 16300 or instruction <> 6051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6051, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1131
//		ZL			# NO, CONTINUE.
// slot 16301
                    if slot <> 16301 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16303 {
                if slot <= 16302 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1132
//		TCF	JETCALL3	# C(A) POS, C(L) = +0
// slot 16302
                    if slot <> 16302 or instruction <> 6031 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6031, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1133
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1134
//# DEAD ZONE ENTRIES COME HERE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1135
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1136
//DZCALL		CS	CMDAPMOD	# POSSIBLE VALUES OF CMDAPMOD: -1, +0, -0.
// slot 16303
                    if slot <> 16303 or instruction <> 17344 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 960).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16304 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1137
//		MASK	BIT1
// slot 16304
                    if slot <> 16304 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
                    if slot <= 16305 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1138
//		TS	L		# C(L)=0 FOR -0: C(L)=1 FOR -1 OR +0.
// slot 16305
                        if slot <> 16305 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1139
//		INDEX	A		# ERASABLE ORDER:  ROLLTM, ROLLC, ROLLC +1.
// slot 16306
                        if slot <> 16306 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[936] to agcAotUnit936@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1140
//		CA	ROLLTM		# GET ROLL/180 OR ROLLC (/360).
// slot 16307
    16307, 26520
)).

// bank 15, slots 16308-16308
function agcAotUnit937 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1141
//		INDEX	L
// slot 16308
    if slot <> 16308 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[937] to agcAotUnit937@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1142
//		TS	A		# IF C(L)=1, STORE 'ROLLC' IN 'L'.
// slot 16309
    16309, 45056
)).

// bank 15, slots 16310-16320
function agcAotUnit938 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16314 {
        if slot <= 16311 {
            if slot <= 16310 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1143
//		AD	L		# (BOTH MUST BE SCALED DEG/180)
// slot 16310
                if slot <> 16310 or instruction <> 24577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1144
//		TC	ANGOVCOR	# C(A)=ROLL/180 OR 2 ROLLC.
// slot 16311
                if slot <> 16311 or instruction <> 1362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16312 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1145
//		TS	ROLLHOLD	# IF CMDAPMOD =-0, SAVE ROLL ANGLE.
// slot 16312
                if slot <> 16312 or instruction <> 23503 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23503, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16313 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1146
//					#	OTHERWISE, SAVE ROLL COMMAND.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1147
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1148
//		CA	ZERO		# COME HERE IF IN DZ, AND CANCEL JETS.
// slot 16313
                    if slot <> 16313 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1149
//		EXTEND			# INHINT NOT NEEDED HERE.
// slot 16314
                    if slot <> 16314 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16317 {
            if slot <= 16315 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1150
//		WRITE	ROLLJETS	# TURN OFF ALL ROLL JETS.
// slot 16315
                if slot <> 16315 or instruction <> 518 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16316 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1151
//		TS	VDT/180		# SET =0 TO SHOW IN DEAD ZONE.
// slot 16316
                    if slot <> 16316 or instruction <> 23415 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23415, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1152
//DZCALL1		TS	JETAG		# COME HERE WITH C(A)=0.
// slot 16317
                    if slot <> 16317 or instruction <> 23497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16318 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1153
//		TC	ROLLDUMP
// slot 16318
                if slot <> 16318 or instruction <> 1959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1959, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16319 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1154
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1155
//# Page 1090
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1156
//# CM ENTRY FDAI DISPLAY
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1157
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1158
//# CALCULATE BY INTEGRATION THE ROLL ERROR BETWEEN THE 2 SEC CM/RCS UPDATES.  DISPLAY ATTITUDE ERRORS AS FOLLOWS:
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1159
//#	ATM DAP:	DISPLAY ONLY ROLL ATTITUDE ERROR.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1160
//#	EXT ATM DAP:	PRESENT 3 ATTITUDE ERRORS RELATIVE TO THE APPROPRIATE BODY AXES EACH .1 SEC.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1161
//#				ROLL	ROLLC-ROLL
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1162
//#				PITCH	ALFAC-ALFA
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1163
//#				YAW	BETAC-BETA
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1164
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1165
//# DURING ENTRY, THE FDAI NEEDLES HAVE FULL SCALE OF 67.5 DEG IN ROLL AND 16.875 DEG IN PITCH AND YAW.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1166
//# THE SUBROUTINE  NEEDLER  EXPECTS (ANGLE/180) AND SCALES TO 16.875 DEG FULL SCALE.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1167
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1168
//					# COME HERE EACH .1 SEC.  (CMDAPMOD=+1 COMES BELOW)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1169
//CM/FDAI		CS	PHIDOT		# INTEGRATE ROLL ERROR 'TWEEN 2SEC UPDATES
// slot 16319
                    if slot <> 16319 or instruction <> 17349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 965).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1170
//		EXTEND
// slot 16320
                    if slot <> 16320 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[938] to agcAotUnit938@.

// bank 15, slots 16321-16333
function agcAotUnit939 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16326 {
        if slot <= 16323 {
            if slot <= 16321 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1171
//		MP	CALFA		# FOR ASSUMED COORDINATION.
// slot 16321
                if slot <> 16321 or instruction <> 29510 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 838, readEffective:call(words, 838)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16322 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1172
//		EXTEND
// slot 16322
                    if slot <> 16322 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1173
//		MP	HALF
// slot 16323
                    if slot <> 16323 or instruction <> 31234 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16324 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1174
//		ADS	PAXERR1		# ROLL ERROR/360.  OVFL OK.
// slot 16324
                if slot <> 16324 or instruction <> 12235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 971).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16325 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1175
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1176
//					# EDIT DUMP AT ABOVE LOCATION.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1177
//CM/FDAIR	CA	HALF
// slot 16325
                    if slot <> 16325 or instruction <> 14850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1178
//		EXTEND
// slot 16326
                    if slot <> 16326 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16329 {
            if slot <= 16327 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1179
//		MP	PAXERR1		# FULL SCALE FOR FDAI (ROLL) IS 67.5 D
// slot 16327
                if slot <> 16327 or instruction <> 29643 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 971, readEffective:call(words, 971)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16328 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1180
//		TS	PAXERR		# .25 (ROLL ERROR/180) FOR FDAI NEEDLE.
// slot 16328
                    if slot <> 16328 or instruction <> 23358 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23358, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1181
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1182
//					# PROGRAM TO FILE BODY RATES FOR TM ON ONE PASS AND
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1183
//					# TO UPDATE THE NEEDLE DISPLAY ON THE NEXT.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1184
//					# SYNCHRONIZATION WITH CM/RCS IS USED SO THAT THE TM
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1185
//					# IS DONE WITH THE ROLL SYSTEM AND NEEDLES START ON
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1186
//					# THE SUBSEQUENT PASS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1187
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1188
//CM/DUMPR	CS	SW/NDX		# COMBINED ALTERNATION SWITCH AND FILE
// slot 16329
                    if slot <> 16329 or instruction <> 16581 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 197).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16331 {
                if slot <= 16330 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1189
//		TS	SW/NDX
// slot 16330
                    if slot <> 16330 or instruction <> 22725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1190
//		EXTEND			# INDEX.
// slot 16331
                    if slot <> 16331 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16332 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1191
//		BZMF	CMTMFILE	# FILE STARTS WITH SW/NDX +1 AND GOES TO
// slot 16332
                    if slot <> 16332 or instruction <> 26576 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26576, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1192
//					# ENDBUF.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1193
//					# INDEX IS POS FOR NEEDLES.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1194
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1195
//		TC	IBNKCALL
// slot 16333
                    if slot <> 16333 or instruction <> 2528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[939] to agcAotUnit939@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1196
//		CADR	NEEDLER
// slot 16334
    16334, 35360
)).

// bank 15, slots 16335-16345
function agcAotUnit940 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16339 {
        if slot <= 16336 {
            if slot <= 16335 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1197
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1198
//		TC	CM/END
// slot 16335
                if slot <> 16335 or instruction <> 2014 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2014, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1199
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1200
//					# INDEX IS NEG FOR TM FILE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1201
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1202
//CMTMFILE	AD	THREE
// slot 16336
                if slot <> 16336 or instruction <> 27788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16337 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1203
//		EXTEND
// slot 16337
                if slot <> 16337 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16338 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1204
//		BZMF	SAVENDX
// slot 16338
                    if slot <> 16338 or instruction <> 26582 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1205
//# Page 1091
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1206
//		CA	TIME1		# INITIALIZE THE TM LIST IN UPBUFF.
// slot 16339
                    if slot <> 16339 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 21).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16342 {
            if slot <= 16340 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1207
//		TS	CMTMTIME
// slot 16340
                if slot <> 16340 or instruction <> 22724 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22724, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16341 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1208
//		CS	THIRTEEN	# INITIALIZE COUNTER
// slot 16341
                    if slot <> 16341 or instruction <> 18965 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1209
//SAVENDX		TS	SW/NDX		# A NEGATIVE NUMBER.
// slot 16342
                    if slot <> 16342 or instruction <> 22725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16343 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1210
//		EXTEND
// slot 16343
                if slot <> 16343 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16344 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1211
//		DCA	PREL
// slot 16344
                    if slot <> 16344 or instruction <> 13250 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 962, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1212
//		INDEX	SW/NDX
// slot 16345
                    if slot <> 16345 or instruction <> 20677 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20677, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20677, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[940] to agcAotUnit940@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1213
//		DXCH	ENDBUF -1
// slot 16346
    16346, 43432
)).

// bank 15, slots 16347-16348
function agcAotUnit941 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16347 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1214
//		CA	RREL
// slot 16347
        if slot <> 16347 or instruction <> 13251 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 963).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1215
//		INDEX	SW/NDX
// slot 16348
        if slot <> 16348 or instruction <> 20677 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20677, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20677, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[941] to agcAotUnit941@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1216
//		TS	ENDBUF +1
// slot 16349
    16349, 45482
)).

// bank 15, slots 16350-16355
function agcAotUnit942 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16352 {
        if slot <= 16350 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1217
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1218
//CM/END		CA	CM/SAVE
// slot 16350
            if slot <> 16350 or instruction <> 13203 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 915).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16351 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1219
//		TS	SR
// slot 16351
                if slot <> 16351 or instruction <> 22545 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22545, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1220
//					# DOES NOT PROTECT TEMK, SQ IN SPSIN/COS
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1221
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1222
//		EXTEND
// slot 16352
                if slot <> 16352 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16353 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1223
//		DCA	T5IDLER2
// slot 16353
            if slot <> 16353 or instruction <> 14309 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2021, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16354 {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1224
//		DXCH	T5LOC
// slot 16354
                if slot <> 16354 or instruction <> 22219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1225
//		TC	RESUME
// slot 16355
                if slot <> 16355 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[942] to agcAotUnit942@.

agcAotInstallSourceRope(list(
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1226
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1227
//		EBANK=	T5LOC
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1228
//T5IDLER2	2CADR	T5IDLOC
// slot 16356 16357
    16356, 3286, 16357, 10340,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1229
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1230
//					# DEFINE THE FOLLOWING 17D REGISTERS IN UPBUFF TO BE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1231
//					# USED TO TELEMETER CM VEHICLE BODY RATE INFORMATION.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1232
//					# THE INFORMATION IS FILED EACH 0.2 SEC, GIVING 15D
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1233
//					# DATA POINTS EACH 1 SEC.  TM LIST IS READ TWICE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1234
//					# EACH 2 SECONDS.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1235
//					#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1236
//					# THE SEQUENCE IS:	SP TIME		INITIAL TIME
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1237
//					#			SWITCH		ALSO INDEX.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1238
//					#			P		ROLL RATE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1239
//					#			Q		PITCH RATE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1240
//					#			R		YAW RATE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1241
//					#			ETC.
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1242
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1243
//#CMTMTIME	=	UPBUFF
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1244
//#SW/NDX		=	UPBUFF +1
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1245
//#ENDBUF		=	UPBUFF +16D
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1246
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1247
//# Page 1092
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1248
//# SPACER
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1249
//#
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1250
//# CONSTANTS USED IN THE ROLL CONTROL SYSTEM:
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1251
//# CONSTANTS ARE THE FOLLOWING:  A = 9.1 DEG/SECSQ, VM = 20 DEG/SEC, 	T = 2 SEC, TCDU = .1 SEC,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1252
//# XMIN = 4 DEG, VMIN = 2 DEG/SEC, K = .25, A1 = 4.55 DEG/SECSQ, 	VI = 1 DEG/SEC, INTERCEPT WITH DZ SIDE
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1253
//# XBUF = 4 DEG
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1254
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1255
//-T-3		DEC	-203		# CS
// slot 16358
    16358, 65128,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1256
//VSQMIN		DEC	.61050061 E-3	# VSQ MIN/4 A PI = 4/(4 (9.1) 180)
// slot 16359
    16359, 20,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1257
//2T/TCDU		=	OCT50		# T/TCDU EXP-14	   TCDU = .1SEC
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1258
//180/8ATT	DEC	.61813187	# 180/(8 (9.1) 4)=(180/ATT)	EXP -3
// slot 16360
    16360, 20254,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1259
//-VMT/180	=	-VM/360K	# = 20 (2) / 180
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1260
//2JETT		=	4SECS		# CS		2 (2) 100	INTEGER
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1261
//4JETT		DEC	800		# CS		4 (2) 100	INTEGER
// slot 16361
    16361, 1600,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1262
//XMIN/360	DEC	182		# XMIN/360 = 4/ 360  EXP 14  = 182 INTEGER
// slot 16362
    16362, 364,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1263
//-VM/360K	DEC	-.22222222	# =-20/( 360 (.25))
// slot 16363
    16363, 58252,
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1264
//1/16A1		=	180/8ATT
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1265
//					# 1/16A1   = 180/(16 A1 TT)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1266
//					#          = 180/(16 4.55 4)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1267
//XS/360		DEC	91		# =(XMIN +VI (T-1/K))/360 = 2/360 EXP 14
// slot 16364
    16364, 182
)).

// no code for the lines below
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1268
//BUFLIM		=	XS/360		# 4/(2 360)
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1269
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1270
//KTRCS		=	HALF		# KT = (.25) 2 = .5
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1271
//
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1272
//# *** END OF TVCDAPS .011 ***
// CM_ENTRY_DIGITAL_AUTOPILOT.agc:1273
//
