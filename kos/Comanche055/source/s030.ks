// PORT: Original source unit JET_SELECTION_LOGIC.agc.
// PORT: Physical bank 17. Shared continuation entries, slots 17770–17818.
function agcAotUnit1027 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17793 {
        if slot <= 17781 {
            if slot <= 17775 {
                if slot <= 17772 {
                    if slot <= 17770 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:2
//# Filename:	JET_SELECTION_LOGIC.agc
// PORT: SOURCE JET_SELECTION_LOGIC.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE JET_SELECTION_LOGIC.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE JET_SELECTION_LOGIC.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:9
//# Pages:	1039-1062
// PORT: SOURCE JET_SELECTION_LOGIC.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE JET_SELECTION_LOGIC.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:12
//#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE JET_SELECTION_LOGIC.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE JET_SELECTION_LOGIC.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE JET_SELECTION_LOGIC.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE JET_SELECTION_LOGIC.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE JET_SELECTION_LOGIC.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE JET_SELECTION_LOGIC.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE JET_SELECTION_LOGIC.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:21
//#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE JET_SELECTION_LOGIC.agc:23
//#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE JET_SELECTION_LOGIC.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE JET_SELECTION_LOGIC.agc:26
//#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE JET_SELECTION_LOGIC.agc:28
//#			Colossus 2A
// PORT: SOURCE JET_SELECTION_LOGIC.agc:29
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:30
//# Page 1039
// PORT: SOURCE JET_SELECTION_LOGIC.agc:31
//		BANK	21
// PORT: SOURCE JET_SELECTION_LOGIC.agc:32
//		SETLOC	DAPS4
// PORT: SOURCE JET_SELECTION_LOGIC.agc:33
//		BANK
// PORT: SOURCE JET_SELECTION_LOGIC.agc:34
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:35
//		COUNT	17/DAPJS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:36
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:37
//		EBANK=	KMPAC
// PORT: SOURCE JET_SELECTION_LOGIC.agc:38
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:39
//# EXAMINE CHANNEL 31 FOR TRANSLATION COMMANDS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:40
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:41
//JETSLECT	LXCH	BANKRUPT
// PORT: Fixed ROM slots 17770.
                        if slot <> 17770 or instruction <> 9230 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 14, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17771 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:42
//		CAF	DELTATT3	# = 60 MS  RESET TO EXECUTE PHASE1
// PORT: Fixed ROM slots 17771.
                            if slot <> 17771 or instruction <> 13724 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1436), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:43
//		AD	T5TIME
// PORT: Fixed ROM slots 17772.
                            if slot <> 17772 or instruction <> 25500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 924).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17773 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:44
//		TS	TIME5
// PORT: Fixed ROM slots 17773.
                        if slot <> 17773 or instruction <> 22552 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22552, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17774 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:45
//		TCF	+3
// PORT: Fixed ROM slots 17774.
                            if slot <> 17774 or instruction <> 5489 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5489, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:46
//		CAF	DELATT20	# = 20 MS  TO ASSURE A T5RUPT
// PORT: Fixed ROM slots 17775.
                            if slot <> 17775 or instruction <> 13725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1437), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17778 {
                    if slot <= 17776 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:47
//		TS	TIME5
// PORT: Fixed ROM slots 17776.
                        if slot <> 17776 or instruction <> 22552 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22552, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17777 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:48
//		CAF	=14MS		# RESET T6 TO INITIALIZE THE JET CHANNELS
// PORT: Fixed ROM slots 17777.
                            if slot <> 17777 or instruction <> 14027 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:49
//		TS	TIME6		# IN 14 MS
// PORT: Fixed ROM slots 17778.
                            if slot <> 17778 or instruction <> 22553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22553, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17779 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:50
//		CAF	NEGMAX
// PORT: Fixed ROM slots 17779.
                        if slot <> 17779 or instruction <> 14849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17780 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:51
//		EXTEND
// PORT: Fixed ROM slots 17780.
                            if slot <> 17780 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:52
//		WOR	CHAN13
// PORT: Fixed ROM slots 17781.
                            if slot <> 17781 or instruction <> 2571 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17787 {
                if slot <= 17784 {
                    if slot <= 17782 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:53
//		EXTEND
// PORT: Fixed ROM slots 17782.
                        if slot <> 17782 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17783 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:54
//		QXCH	QRUPT
// PORT: Fixed ROM slots 17783.
                            if slot <> 17783 or instruction <> 9226 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 10, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:55
//		CAF	XLNMASK		# = 7700 OCT
// PORT: Fixed ROM slots 17784.
                            if slot <> 17784 or instruction <> 13723 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1435), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17785 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:56
//		EXTEND			# EXAMINE THE TRANSLATION
// PORT: Fixed ROM slots 17785.
                        if slot <> 17785 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17786 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:57
//		RXOR	CHAN31		# HAND CONTROLLER
// PORT: Fixed ROM slots 17786.
                            if slot <> 17786 or instruction <> 3097 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:58
//		MASK	XLNMASK
// PORT: Fixed ROM slots 17787.
                            if slot <> 17787 or instruction <> 30107 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1435), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17790 {
                    if slot <= 17788 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:59
//		EXTEND
// PORT: Fixed ROM slots 17788.
                        if slot <> 17788 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17789 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:60
//		BZF	NOXLNCMD
// PORT: Fixed ROM slots 17789.
                            if slot <> 17789 or instruction <> 5534 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5534, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:61
//		TS	T5TEMP
// PORT: Fixed ROM slots 17790.
                            if slot <> 17790 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17791 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:62
//		EXTEND
// PORT: Fixed ROM slots 17791.
                        if slot <> 17791 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17792 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:63
//		MP	BIT9
// PORT: Fixed ROM slots 17792.
                            if slot <> 17792 or instruction <> 31239 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2567, readEffective:call(words, 2567)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:64
//		MASK	THREE
// PORT: Fixed ROM slots 17793.
                            if slot <> 17793 or instruction <> 31884 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17805 {
            if slot <= 17799 {
                if slot <= 17796 {
                    if slot <= 17794 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:65
//		TS	XNDX1		# AC QUAD  X-TRANSLATION INDEX
// PORT: Fixed ROM slots 17794.
                        if slot <> 17794 or instruction <> 23371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23371, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17795 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:66
//		TS	XNDX2		# BD QUAD  X-TRANSLATION INDEX
// PORT: Fixed ROM slots 17795.
                            if slot <> 17795 or instruction <> 23372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:67
//		CA	T5TEMP
// PORT: Fixed ROM slots 17796.
                            if slot <> 17796 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17797 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:68
//		EXTEND			# 1 = + XLN
// PORT: Fixed ROM slots 17797.
                        if slot <> 17797 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17798 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:69
//		MP	BIT7		# 2 = - XLN
// PORT: Fixed ROM slots 17798.
                            if slot <> 17798 or instruction <> 31241 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:70
//		MASK	THREE		# 3 = NO XLN
// PORT: Fixed ROM slots 17799.
                            if slot <> 17799 or instruction <> 31884 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            } else {
                if slot <= 17802 {
                    if slot <= 17800 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:71
//		TS	YNDX		# Y-TRANSLATION INDEX
// PORT: Fixed ROM slots 17800.
                        if slot <> 17800 or instruction <> 23373 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23373, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17801 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:72
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:73
//		CA	T5TEMP
// PORT: Fixed ROM slots 17801.
                            if slot <> 17801 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:74
//		EXTEND
// PORT: Fixed ROM slots 17802.
                            if slot <> 17802 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17803 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:75
//		MP	BIT5
// PORT: Fixed ROM slots 17803.
                        if slot <> 17803 or instruction <> 31243 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2571, readEffective:call(words, 2571)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17804 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:76
//		MASK	THREE
// PORT: Fixed ROM slots 17804.
                            if slot <> 17804 or instruction <> 31884 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE JET_SELECTION_LOGIC.agc:77
//		TS	ZNDX		# Z-TRANSLATION INDEX
// PORT: Fixed ROM slots 17805.
                            if slot <> 17805 or instruction <> 23374 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23374, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17811 {
                if slot <= 17808 {
                    if slot <= 17806 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:78
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:79
//		CA	DAPDATR1	# SET ATTKALMN TO PICK UP FILTER GAINS FOR
// PORT: Fixed ROM slots 17806.
                        if slot <> 17806 or instruction <> 13110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17807 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:80
//		MASK	BIT14		# TRANSLATIONS.
// PORT: Fixed ROM slots 17807.
                            if slot <> 17807 or instruction <> 31234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                                if fixedOperand = 8192 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:81
//		EXTEND			# CHECK DAPDATR1 BIT 14 FOR LEM ATTACHED.
// PORT: Fixed ROM slots 17808.
                            if slot <> 17808 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17809 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:82
//# Page 1040
// PORT: SOURCE JET_SELECTION_LOGIC.agc:83
//		BZF	NOLEM
// PORT: Fixed ROM slots 17809.
                        if slot <> 17809 or instruction <> 5524 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17810 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:84
//		CS	THREE		# IF LEM IS ON, SET ATTKALMN = -3
// PORT: Fixed ROM slots 17810.
                            if slot <> 17810 or instruction <> 19596 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:85
//		TCF	+2
// PORT: Fixed ROM slots 17811.
                            if slot <> 17811 or instruction <> 5525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5525, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17814 {
                    if slot <= 17812 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:86
//NOLEM		CS	TWO		# IF LEM IS OFF, SET ATTKALMN = -2.
// PORT: Fixed ROM slots 17812.
                        if slot <> 17812 or instruction <> 18958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17813 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:87
//		TS	ATTKALMN
// PORT: Fixed ROM slots 17813.
                            if slot <> 17813 or instruction <> 23439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:88
//		CCS	XTRANS		# (+, -1, 0)
// PORT: Fixed ROM slots 17814.
                            if slot <> 17814 or instruction <> 5017 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 921).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17816 {
                        if slot <= 17815 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:89
//		TS	XNDX1		# USING BD-X  ZERO XNDX1
// PORT: Fixed ROM slots 17815.
                            if slot <> 17815 or instruction <> 23371 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23371, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:90
//		TCF	PWORD
// PORT: Fixed ROM slots 17816.
                            if slot <> 17816 or instruction <> 5538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17817 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:91
//		TS	XNDX2		# USING AC-X  ZERO XNDX2
// PORT: Fixed ROM slots 17817.
                            if slot <> 17817 or instruction <> 23372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:92
//		TCF	PWORD
// PORT: Fixed ROM slots 17818.
                            if slot <> 17818 or instruction <> 5538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1027] to agcAotUnit1027@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:93
//XLNMASK		OCT	7700
// PORT: Fixed ROM slots 17819.
    17819, 8064,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:94
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:95
//DELTATT3	DEC	16378		# = 60 MS
// PORT: Fixed ROM slots 17820.
    17820, 32756,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:96
//DELATT20	DEC	16382		# = 20 MS
// PORT: Fixed ROM slots 17821.
    17821, 32764
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17822–17839.
function agcAotUnit1028 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17830 {
        if slot <= 17825 {
            if slot <= 17823 {
                if slot <= 17822 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:97
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:98
//NOXLNCMD	TS	XNDX1		# ZERO ALL REQUESTS FOR TRANSLATION
// PORT: Fixed ROM slots 17822.
                    if slot <> 17822 or instruction <> 23371 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23371, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:99
//		TS	XNDX2
// PORT: Fixed ROM slots 17823.
                    if slot <> 17823 or instruction <> 23372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17824 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:100
//		TS	YNDX
// PORT: Fixed ROM slots 17824.
                    if slot <> 17824 or instruction <> 23373 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23373, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:101
//		TS	ZNDX
// PORT: Fixed ROM slots 17825.
                    if slot <> 17825 or instruction <> 23374 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23374, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17827 {
                if slot <= 17826 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:102
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:103
//# PITCH COMMANDS  TIMING(NO X-TRANS, NO QUAD FAILS) 32MCT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:104
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:105
//PWORD		CCS	TAU1		# CHECK FOR PITCH COMMANDS
// PORT: Fixed ROM slots 17826.
                    if slot <> 17826 or instruction <> 4978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 882).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:106
//		CAF	ONE
// PORT: Fixed ROM slots 17827.
                    if slot <> 17827 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                if slot <= 17828 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:107
//		TCF	+2		#  0 = NO PITCH
// PORT: Fixed ROM slots 17828.
                    if slot <> 17828 or instruction <> 5542 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5542, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17829 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:108
//		CAF	TWO		# +1 =  + PITCH
// PORT: Fixed ROM slots 17829.
                        if slot <> 17829 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:109
//		TS	PINDEX		# +2 =  - PITCH
// PORT: Fixed ROM slots 17830.
                        if slot <> 17830 or instruction <> 23376 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23376, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17834 {
            if slot <= 17832 {
                if slot <= 17831 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:110
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:111
//		CCS	RACFAIL		# FLAG FOR REAL AC QUAD FAILURES
// PORT: Fixed ROM slots 17831.
                    if slot <> 17831 or instruction <> 5014 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 918).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:112
//		TCF	AFAILP
// PORT: Fixed ROM slots 17832.
                    if slot <> 17832 or instruction <> 5548 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5548, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17833 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:113
//		TCF	TABPCOM		# 0 = NO REAL AC FAILURES
// PORT: Fixed ROM slots 17833.
                    if slot <> 17833 or instruction <> 5556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5556, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:114
//		TCF	CFAILP		# + = A QUAD FAILED
// PORT: Fixed ROM slots 17834.
                    if slot <> 17834 or instruction <> 5550 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5550, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17836 {
                if slot <= 17835 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:115
//		TCF	TABPCOM		# - = C QUAD FAILED
// PORT: Fixed ROM slots 17835.
                    if slot <> 17835 or instruction <> 5556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5556, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:116
//					# IF FAILURES ARE PRESENT IGNORE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:117
//					# X-TRANSLATIONS ON THIS AXIS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:118
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:119
//AFAILP		CAF	NINE		# IF FAILURE IS PRESENT 1JET OPERATION
// PORT: Fixed ROM slots 17836.
                    if slot <> 17836 or instruction <> 14556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17837 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:120
//		TCF	TABPCOM +2	# IS ASSUMED.  IGNORE X-TRANSLATION
// PORT: Fixed ROM slots 17837.
                    if slot <> 17837 or instruction <> 5558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5558, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17838 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:121
//CFAILP		CAF	TWELVE
// PORT: Fixed ROM slots 17838.
                        if slot <> 17838 or instruction <> 15353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:122
//		TCF	TABPCOM +2
// PORT: Fixed ROM slots 17839.
                        if slot <> 17839 or instruction <> 5558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5558, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1028] to agcAotUnit1028@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:123
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:124
//XLNNDX		DEC	0		# INDICES FOR TRANSLATION COMMANDS
// PORT: Fixed ROM slots 17840.
    17840, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:125
//		DEC	3		# FOR USE IN TABLE LOOK UP
// PORT: Fixed ROM slots 17841.
    17841, 6,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:126
//		DEC	6
// PORT: Fixed ROM slots 17842.
    17842, 12,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:127
//		DEC	0
// PORT: Fixed ROM slots 17843.
    17843, 0
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17844–17844.
function agcAotUnit1029 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:128
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:129
//TWELVE		=	OCT14
// PORT: SOURCE JET_SELECTION_LOGIC.agc:130
//# TABLE LOOK UP FOR PITCH COMMANDS WITH AND WITHOUT X-TRANSLATION AND AC QUAD FAILURES PRESENT.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:131
//# BITS 9, 10 CONTAIN THE NUMBER OF PITCH JETS USED TO PERFORM THE PITCH ROTATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:132
//# Page 1041
// PORT: SOURCE JET_SELECTION_LOGIC.agc:133
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:134
//TABPCOM		INDEX	XNDX1
// PORT: Fixed ROM slots 17844.
    if slot <> 17844 or instruction <> 21323 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21323, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21323, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1029] to agcAotUnit1029@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:135
//		CA	XLNNDX
// PORT: Fixed ROM slots 17845.
    17845, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17846–17847.
function agcAotUnit1030 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17846 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:136
//		AD	PINDEX
// PORT: Fixed ROM slots 17846.
        if slot <> 17846 or instruction <> 25424 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 848).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:137
//		INDEX	A
// PORT: Fixed ROM slots 17847.
        if slot <> 17847 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1030] to agcAotUnit1030@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:138
//		CA	PYTABLE
// PORT: Fixed ROM slots 17848.
    17848, 27544
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17849–17867.
function agcAotUnit1031 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17857 {
        if slot <= 17852 {
            if slot <= 17850 {
                if slot <= 17849 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:139
//		MASK	PJETS		# =1417 OCT
// PORT: Fixed ROM slots 17849.
                    if slot <> 17849 or instruction <> 30171 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1499), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:140
//		TS	PWORD1
// PORT: Fixed ROM slots 17850.
                    if slot <> 17850 or instruction <> 23339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23339, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17851 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:141
//		EXTEND
// PORT: Fixed ROM slots 17851.
                    if slot <> 17851 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:142
//		MP	BIT7
// PORT: Fixed ROM slots 17852.
                    if slot <> 17852 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17854 {
                if slot <= 17853 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:143
//		TS	NPJETS		# = NO. OF PITCH JETS
// PORT: Fixed ROM slots 17853.
                    if slot <> 17853 or instruction <> 23379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23379, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:144
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:145
//# YAW JET COMMANDS  TIMING(NO X-TRANS, NO QUAD FAILURES)  32MCT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:146
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:147
//YWORD		CCS	TAU2		# CHECK FOR YAW COMMANDS
// PORT: Fixed ROM slots 17854.
                    if slot <> 17854 or instruction <> 4979 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 883).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17855 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:148
//		CAF	ONE
// PORT: Fixed ROM slots 17855.
                    if slot <> 17855 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17856 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:149
//		TCF	+2
// PORT: Fixed ROM slots 17856.
                        if slot <> 17856 or instruction <> 5570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5570, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:150
//		CAF	TWO
// PORT: Fixed ROM slots 17857.
                        if slot <> 17857 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17862 {
            if slot <= 17859 {
                if slot <= 17858 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:151
//		TS	YINDEX		# YAW ROTATION INDEX
// PORT: Fixed ROM slots 17858.
                    if slot <> 17858 or instruction <> 23377 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23377, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:152
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:153
//		CCS	RBDFAIL		# FLAG FOR B OR D QUAD FAILURES
// PORT: Fixed ROM slots 17859.
                    if slot <> 17859 or instruction <> 5015 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 919).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17860 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:154
//		TCF	BFAILY		# 0 = NO BD FAILURE
// PORT: Fixed ROM slots 17860.
                    if slot <> 17860 or instruction <> 5576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5576, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17861 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:155
//		TCF	TABYCOM		# + = B QUAD FAILED
// PORT: Fixed ROM slots 17861.
                        if slot <> 17861 or instruction <> 5597 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5597, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:156
//		TCF	DFAILY		# - = D QUAD FAILED
// PORT: Fixed ROM slots 17862.
                        if slot <> 17862 or instruction <> 5578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17864 {
                if slot <= 17863 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:157
//		TCF	TABYCOM
// PORT: Fixed ROM slots 17863.
                    if slot <> 17863 or instruction <> 5597 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5597, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:158
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:159
//BFAILY		CAF	NINE
// PORT: Fixed ROM slots 17864.
                    if slot <> 17864 or instruction <> 14556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17865 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:160
//		TCF	TABYCOM +2
// PORT: Fixed ROM slots 17865.
                    if slot <> 17865 or instruction <> 5599 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5599, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17866 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:161
//DFAILY		CAF	TWELVE
// PORT: Fixed ROM slots 17866.
                        if slot <> 17866 or instruction <> 15353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:162
//		TCF	TABYCOM +2
// PORT: Fixed ROM slots 17867.
                        if slot <> 17867 or instruction <> 5599 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5599, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1031] to agcAotUnit1031@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:163
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:164
//# Page 1042
// PORT: SOURCE JET_SELECTION_LOGIC.agc:165
//# TABLE FOR PITCH(YAW) COMMANDS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:166
//# BITS 4,3,2,1 = PITCH, X-TRANSLATION JETS SELECTED
// PORT: SOURCE JET_SELECTION_LOGIC.agc:167
//# BITS     10,9 = NO. PITCH JETS USED TO PERFORM ROTATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:168
//# BITS 8,7,6,5 = YAW, X-TRANSLATION JETS SELECTED
// PORT: SOURCE JET_SELECTION_LOGIC.agc:169
//# BITS 12,11 : NO. YAW JETS USED TO PERFORM ROTATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:170
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:171
//					# ROT	TRANS	QUAD	BIAS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:172
//PYTABLE		OCT	0		# 0	0		0
// PORT: Fixed ROM slots 17868.
    17868, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:173
//		OCT	5125		# +	0		0
// PORT: Fixed ROM slots 17869.
    17869, 5290,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:174
//		OCT	5252		# -	0		0
// PORT: Fixed ROM slots 17870.
    17870, 5460,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:175
//		OCT	0231		# 0	+		3
// PORT: Fixed ROM slots 17871.
    17871, 306,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:176
//		OCT	2421		# +	+		3
// PORT: Fixed ROM slots 17872.
    17872, 2594,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:177
//		OCT	2610		# -	+		3
// PORT: Fixed ROM slots 17873.
    17873, 2832,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:178
//		OCT	0146		# 0	-		6
// PORT: Fixed ROM slots 17874.
    17874, 204,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:179
//		OCT	2504		# +	-		6
// PORT: Fixed ROM slots 17875.
    17875, 2696,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:180
//		OCT	2442		# -	-		6
// PORT: Fixed ROM slots 17876.
    17876, 2628,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:181
//		OCT	0		# 0		A(B)	9
// PORT: Fixed ROM slots 17877.
    17877, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:182
//		OCT	2421		# +		A(B)	9
// PORT: Fixed ROM slots 17878.
    17878, 2594,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:183
//		OCT	2442		# -		A(B)	9
// PORT: Fixed ROM slots 17879.
    17879, 2628,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:184
//		OCT	0		# 0		C(D)	12
// PORT: Fixed ROM slots 17880.
    17880, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:185
//		OCT	2504		# +		C(D)	12
// PORT: Fixed ROM slots 17881.
    17881, 2696,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:186
//		OCT	2610		# -		C(D)	12
// PORT: Fixed ROM slots 17882.
    17882, 2832,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:187
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:188
//# MASKS FOR PITCH AND YAW COMMANDS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:189
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:190
//PJETS		OCT	1417
// PORT: Fixed ROM slots 17883.
    17883, 1566,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:191
//YJETS		OCT	6360
// PORT: Fixed ROM slots 17884.
    17884, 6624
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17885–17885.
function agcAotUnit1032 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:192
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:193
//# TABLE LOOK UP FOR YAW COMMANDS WITH AND WITHOUT X-TRANSLATION AND AC QUAD FAILURES PRESENT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:194
//# BITS 11, 12 CONTAIN THE NUMBER OF YAW JETS USED TO PERFORM THE YAW ROTATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:195
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:196
//TABYCOM		INDEX	XNDX2
// PORT: Fixed ROM slots 17885.
    if slot <> 17885 or instruction <> 21324 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21324, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21324, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1032] to agcAotUnit1032@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:197
//		CA	XLNNDX
// PORT: Fixed ROM slots 17886.
    17886, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17887–17888.
function agcAotUnit1033 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17887 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:198
//		AD	YINDEX
// PORT: Fixed ROM slots 17887.
        if slot <> 17887 or instruction <> 25425 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 849).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:199
//		INDEX	A
// PORT: Fixed ROM slots 17888.
        if slot <> 17888 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1033] to agcAotUnit1033@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:200
//		CA	PYTABLE
// PORT: Fixed ROM slots 17889.
    17889, 27544
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17890–17912.
function agcAotUnit1034 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17900 {
        if slot <= 17894 {
            if slot <= 17891 {
                if slot <= 17890 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:201
//		MASK	YJETS		# = 6360 OCT
// PORT: Fixed ROM slots 17890.
                    if slot <> 17890 or instruction <> 30172 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1500), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:202
//		TS	YWORD1
// PORT: Fixed ROM slots 17891.
                    if slot <> 17891 or instruction <> 23341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23341, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17892 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:203
//		EXTEND
// PORT: Fixed ROM slots 17892.
                    if slot <> 17892 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17893 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:204
//		MP	BIT5
// PORT: Fixed ROM slots 17893.
                        if slot <> 17893 or instruction <> 31243 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2571, readEffective:call(words, 2571)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:205
//		TS	NYJETS		# NO. OF YAW JETS USED TO PERFORM ROTATION
// PORT: Fixed ROM slots 17894.
                        if slot <> 17894 or instruction <> 23380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23380, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17897 {
                if slot <= 17895 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:206
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:207
//# Page 1043
// PORT: SOURCE JET_SELECTION_LOGIC.agc:208
//# ROLL COMMANDS  TIMING(NO Y,Z TRANS, NO QUAD FAILS)  45MCT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:209
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:210
//RWORD		CCS	TAU		# CHECK FOR ROLL COMMANDS
// PORT: Fixed ROM slots 17895.
                    if slot <> 17895 or instruction <> 4977 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 881).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17896 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:211
//		CAF	ONE
// PORT: Fixed ROM slots 17896.
                        if slot <> 17896 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:212
//		TCF	+2
// PORT: Fixed ROM slots 17897.
                        if slot <> 17897 or instruction <> 5611 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5611, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17898 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:213
//		CAF	TWO
// PORT: Fixed ROM slots 17898.
                    if slot <> 17898 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17899 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:214
//		TS	RINDEX
// PORT: Fixed ROM slots 17899.
                        if slot <> 17899 or instruction <> 23375 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23375, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:215
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:216
//		CCS	ACORBD		# FLAG FOR AC OR BD QUAD SELECTION FOR
// PORT: Fixed ROM slots 17900.
                        if slot <> 17900 or instruction <> 5016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 920).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17906 {
            if slot <= 17903 {
                if slot <= 17901 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:217
//		TCF	BDROLL		# ROLL COMMANDS
// PORT: Fixed ROM slots 17901.
                    if slot <> 17901 or instruction <> 5670 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5670, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17902 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:218
//		TCF	BDROLL		# +, +0 = BD ROLL
// PORT: Fixed ROM slots 17902.
                        if slot <> 17902 or instruction <> 5670 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5670, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:219
//		TCF	+1		# -, -0 = AC ROLL
// PORT: Fixed ROM slots 17903.
                        if slot <> 17903 or instruction <> 5616 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5616, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17904 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:220
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:221
//ACROLL		CCS	RACFAIL		# CHECK FOR REAL FAILURES
// PORT: Fixed ROM slots 17904.
                    if slot <> 17904 or instruction <> 5014 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 918).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17905 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:222
//		TCF	RAFAIL		# ON AC QUADS
// PORT: Fixed ROM slots 17905.
                        if slot <> 17905 or instruction <> 5621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5621, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:223
//		TCF	RXLNS
// PORT: Fixed ROM slots 17906.
                        if slot <> 17906 or instruction <> 5629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5629, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17909 {
                if slot <= 17907 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:224
//		TCF	RCFAIL
// PORT: Fixed ROM slots 17907.
                    if slot <> 17907 or instruction <> 5623 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5623, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17908 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:225
//		TCF	RXLNS
// PORT: Fixed ROM slots 17908.
                        if slot <> 17908 or instruction <> 5629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5629, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:226
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:227
//RAFAIL		CAF	NINE		# QUAD FAILURE WILL GET
// PORT: Fixed ROM slots 17909.
                        if slot <> 17909 or instruction <> 14556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17910 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:228
//		TCF	TABRCOM		# 1-JET OPERATION
// PORT: Fixed ROM slots 17910.
                    if slot <> 17910 or instruction <> 5631 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5631, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17911 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:229
//RCFAIL		CAF	TWELVE
// PORT: Fixed ROM slots 17911.
                        if slot <> 17911 or instruction <> 15353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:230
//		TCF	TABRCOM
// PORT: Fixed ROM slots 17912.
                        if slot <> 17912 or instruction <> 5631 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5631, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1034] to agcAotUnit1034@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:231
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:232
//XLN1NDX		DEC	0
// PORT: Fixed ROM slots 17913.
    17913, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:233
//		DEC	1		# INDECES FOR TRANSLATION
// PORT: Fixed ROM slots 17914.
    17914, 2,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:234
//		DEC	2
// PORT: Fixed ROM slots 17915.
    17915, 4,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:235
//		DEC	0
// PORT: Fixed ROM slots 17916.
    17916, 0
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17917–17917.
function agcAotUnit1035 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:236
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:237
//# TABLE LOOK UP FOR AC-ROLL COMMANDS WITH AND WITHOUT Y-TRANSLATION AND ACQUAD FAILURES PRESENT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:238
//# BITS 9,10,11 CONTAIN THE MAGNITUDE AND DIRECTION OF THE ROLL
// PORT: SOURCE JET_SELECTION_LOGIC.agc:239
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:240
//RXLNS		INDEX	YNDX		# NO AC QUAD FAILURES
// PORT: Fixed ROM slots 17917.
    if slot <> 17917 or instruction <> 21325 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21325, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21325, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1035] to agcAotUnit1035@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:241
//		CA	XLNNDX		# INCLUDE +,-,0, Y-TRANSLATION
// PORT: Fixed ROM slots 17918.
    17918, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17919–17920.
function agcAotUnit1036 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17919 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:242
//TABRCOM		AD	RINDEX
// PORT: Fixed ROM slots 17919.
        if slot <> 17919 or instruction <> 25423 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 847).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:243
//		INDEX	A
// PORT: Fixed ROM slots 17920.
        if slot <> 17920 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1036] to agcAotUnit1036@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:244
//		CA	RTABLE
// PORT: Fixed ROM slots 17921.
    17921, 27824
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17922–17931.
function agcAotUnit1037 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17926 {
        if slot <= 17923 {
            if slot <= 17922 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:245
//		MASK	ACRJETS		# = 3760 OCT
// PORT: Fixed ROM slots 17922.
                if slot <> 17922 or instruction <> 30311 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1639), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:246
//		TS	RWORD1
// PORT: Fixed ROM slots 17923.
                if slot <> 17923 or instruction <> 23337 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23337, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17924 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:247
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:248
//# CHECK FOR Z-TRANSLATIONS ON BD
// PORT: SOURCE JET_SELECTION_LOGIC.agc:249
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:250
//BDZCHECK	CA	ZNDX
// PORT: Fixed ROM slots 17924.
                if slot <> 17924 or instruction <> 13134 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 846).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17925 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:251
//		EXTEND
// PORT: Fixed ROM slots 17925.
                    if slot <> 17925 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:252
//		BZMF	NOBDZ		# NO Z-TRANSLATION
// PORT: Fixed ROM slots 17926.
                    if slot <> 17926 or instruction <> 26144 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26144, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17928 {
            if slot <= 17927 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:253
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:254
//# Page 1044
// PORT: SOURCE JET_SELECTION_LOGIC.agc:255
//# 	TABLE LOOK UP FOR BD Z-TRANSLATION WITH AND WITHOUT REAL BD QUAD FAILURES.  Z-TRANSLATION WILL BE POSS-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:256
//# IBLE AS LONG AS ROLL COMMANDS CAN BE SATISFIED WITH THE AC ROLL JETS.  CRITERION..  IF THE RESULTANT NET ROLL
// PORT: SOURCE JET_SELECTION_LOGIC.agc:257
//# COMMANDS = 0 (WITH Z-TRANSLATION) AND IF TAU = 0, THEN INCLUDE THE BD Z-TRANSLATION COMMANDS.  IF THE RESULTANT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:258
//# ROLL COMMAND = 0, AND IF TAU NZ, THEN IGNORE THE BD Z-TRANSLATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:259
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:260
//		CCS	RBDFAIL
// PORT: Fixed ROM slots 17927.
                if slot <> 17927 or instruction <> 5015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 919).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:261
//		CAF	THREE
// PORT: Fixed ROM slots 17928.
                if slot <> 17928 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17929 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:262
//		TCF	+2
// PORT: Fixed ROM slots 17929.
                if slot <> 17929 or instruction <> 5643 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5643, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17930 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:263
//		CAF	SIX
// PORT: Fixed ROM slots 17930.
                    if slot <> 17930 or instruction <> 15497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:264
//		INDEX	ZNDX
// PORT: Fixed ROM slots 17931.
                    if slot <> 17931 or instruction <> 21326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21326, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21326, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1037] to agcAotUnit1037@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:265
//		AD	XLN1NDX
// PORT: Fixed ROM slots 17932.
    17932, 52210
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17933–17933.
function agcAotUnit1038 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:266
//		INDEX	A
// PORT: Fixed ROM slots 17933.
    if slot <> 17933 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1038] to agcAotUnit1038@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:267
//		CA	YZTABLE
// PORT: Fixed ROM slots 17934.
    17934, 27858
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17935–17967.
function agcAotUnit1039 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17950 {
        if slot <= 17942 {
            if slot <= 17938 {
                if slot <= 17936 {
                    if slot <= 17935 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:268
//		MASK	BDZJETS		# = 3417 OCT
// PORT: Fixed ROM slots 17935.
                        if slot <> 17935 or instruction <> 30322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1650), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:269
//		AD	RWORD1		# ADD TO ROLL COMMANDS
// PORT: Fixed ROM slots 17936.
                        if slot <> 17936 or instruction <> 25385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 809).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17937 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:270
//		TS	T5TEMP		# IF POSSIBLE.  MUST CHECK TAU FIRST
// PORT: Fixed ROM slots 17937.
                        if slot <> 17937 or instruction <> 23362 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23362, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:271
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:272
//		EXTEND
// PORT: Fixed ROM slots 17938.
                        if slot <> 17938 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17940 {
                    if slot <= 17939 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:273
//		MP	BIT7		# DETERMINE THE NET ROLL COMMAND WITH
// PORT: Fixed ROM slots 17939.
                        if slot <> 17939 or instruction <> 31241 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:274
//		AD	=-4		# Z-TRANSLATION ADDED ON
// PORT: Fixed ROM slots 17940.
                        if slot <> 17940 or instruction <> 27697 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 3121), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17941 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:275
//		TS	NRJETS		# NET NO. OF +,- ROLL JETS ON
// PORT: Fixed ROM slots 17941.
                        if slot <> 17941 or instruction <> 23378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23378, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:276
//		EXTEND
// PORT: Fixed ROM slots 17942.
                        if slot <> 17942 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17946 {
                if slot <= 17944 {
                    if slot <= 17943 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:277
//		BZF	TAUCHECK
// PORT: Fixed ROM slots 17943.
                        if slot <> 17943 or instruction <> 5659 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5659, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:278
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:279
//ACRBDZ		CA	T5TEMP		# Z-TRANSLATION ACCEPTED EVEN THO WE MAY
// PORT: Fixed ROM slots 17944.
                        if slot <> 17944 or instruction <> 13122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 834).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17945 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:280
//		TS	RWORD1		# HAVE INTRODUCED AN UNDESIREABLE ROLL
// PORT: Fixed ROM slots 17945.
                        if slot <> 17945 or instruction <> 23337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:281
//		TCF	ROLLTIME	# BRANCH TO JET ON-TIME CALCULATIONS
// PORT: Fixed ROM slots 17946.
                        if slot <> 17946 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17948 {
                    if slot <= 17947 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:282
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:283
//TAUCHECK	CCS	TAU
// PORT: Fixed ROM slots 17947.
                        if slot <> 17947 or instruction <> 4977 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 881).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:284
//		TCF	NOBDZ
// PORT: Fixed ROM slots 17948.
                        if slot <> 17948 or instruction <> 5664 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5664, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17949 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:285
//		TCF	ACRBDZ
// PORT: Fixed ROM slots 17949.
                        if slot <> 17949 or instruction <> 5656 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5656, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:286
//		TCF	NOBDZ
// PORT: Fixed ROM slots 17950.
                        if slot <> 17950 or instruction <> 5664 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5664, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17958 {
            if slot <= 17954 {
                if slot <= 17952 {
                    if slot <= 17951 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:287
//		TCF	ACRBDZ
// PORT: Fixed ROM slots 17951.
                        if slot <> 17951 or instruction <> 5656 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5656, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:288
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:289
//NOBDZ		CA	RWORD1		# Z-TRANSLATION NOT ACCEPTED
// PORT: Fixed ROM slots 17952.
                        if slot <> 17952 or instruction <> 13097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 809).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17953 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:290
//		EXTEND
// PORT: Fixed ROM slots 17953.
                        if slot <> 17953 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:291
//		MP	BIT7
// PORT: Fixed ROM slots 17954.
                        if slot <> 17954 or instruction <> 31241 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17956 {
                    if slot <= 17955 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:292
//		AD	=-2
// PORT: Fixed ROM slots 17955.
                        if slot <> 17955 or instruction <> 28621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:293
//		TS	NRJETS
// PORT: Fixed ROM slots 17956.
                        if slot <> 17956 or instruction <> 23378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23378, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17957 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:294
//		TCF	ROLLTIME	# BRANCH TO JET ON-TIME CALCULATION
// PORT: Fixed ROM slots 17957.
                        if slot <> 17957 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:295
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:296
//# Page 1045
// PORT: SOURCE JET_SELECTION_LOGIC.agc:297
//# BD QUAD SELECTION FOR ROLL COMMANDS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:298
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:299
//BDROLL		CCS	RBDFAIL
// PORT: Fixed ROM slots 17958.
                        if slot <> 17958 or instruction <> 5015 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 919).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17962 {
                if slot <= 17960 {
                    if slot <= 17959 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:300
//		TCF	RBFAIL
// PORT: Fixed ROM slots 17959.
                        if slot <> 17959 or instruction <> 5675 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5675, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:301
//		TCF	RZXLNS
// PORT: Fixed ROM slots 17960.
                        if slot <> 17960 or instruction <> 5679 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5679, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17961 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:302
//		TCF	RDFAIL
// PORT: Fixed ROM slots 17961.
                        if slot <> 17961 or instruction <> 5677 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5677, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:303
//		TCF	RZXLNS
// PORT: Fixed ROM slots 17962.
                        if slot <> 17962 or instruction <> 5679 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5679, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17964 {
                    if slot <= 17963 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:304
//RBFAIL		CAF	NINE
// PORT: Fixed ROM slots 17963.
                        if slot <> 17963 or instruction <> 14556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:305
//		TCF	TABRZCMD
// PORT: Fixed ROM slots 17964.
                        if slot <> 17964 or instruction <> 5681 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5681, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17965 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:306
//RDFAIL		CAF	TWELVE
// PORT: Fixed ROM slots 17965.
                        if slot <> 17965 or instruction <> 15353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17966 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:307
//		TCF	TABRZCMD
// PORT: Fixed ROM slots 17966.
                            if slot <> 17966 or instruction <> 5681 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5681, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:308
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:309
//RZXLNS		INDEX	ZNDX		# NO BD FAILURES
// PORT: Fixed ROM slots 17967.
                            if slot <> 17967 or instruction <> 21326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21326, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1039] to agcAotUnit1039@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:310
//		CA	XLNNDX		# +,-,0 Z-TRANSLATION PRESENT
// PORT: Fixed ROM slots 17968.
    17968, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17969–17970.
function agcAotUnit1040 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17969 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:311
//TABRZCMD	AD	RINDEX
// PORT: Fixed ROM slots 17969.
        if slot <> 17969 or instruction <> 25423 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 847).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:312
//		INDEX	A
// PORT: Fixed ROM slots 17970.
        if slot <> 17970 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1040] to agcAotUnit1040@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:313
//		CA	RTABLE
// PORT: Fixed ROM slots 17971.
    17971, 27824
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17972–17981.
function agcAotUnit1041 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17976 {
        if slot <= 17973 {
            if slot <= 17972 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:314
//		MASK	BDRJETS		# = 34017 OCT
// PORT: Fixed ROM slots 17972.
                if slot <> 17972 or instruction <> 30312 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1640), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:315
//		TS	RWORD1
// PORT: Fixed ROM slots 17973.
                if slot <> 17973 or instruction <> 23337 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23337, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17974 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:316
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:317
//ACYCHECK	CA	YNDX		# ANY Y-TRANSLATION
// PORT: Fixed ROM slots 17974.
                if slot <> 17974 or instruction <> 13133 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 845).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17975 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:318
//		EXTEND
// PORT: Fixed ROM slots 17975.
                    if slot <> 17975 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:319
//		BZF	NOACY		# NO Y-TRANSLATION
// PORT: Fixed ROM slots 17976.
                    if slot <> 17976 or instruction <> 5714 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5714, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17978 {
            if slot <= 17977 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:320
//		CCS	RACFAIL
// PORT: Fixed ROM slots 17977.
                if slot <> 17977 or instruction <> 5014 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 918).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:321
//		CAF	THREE
// PORT: Fixed ROM slots 17978.
                if slot <> 17978 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17979 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:322
//		TCF	+2
// PORT: Fixed ROM slots 17979.
                if slot <> 17979 or instruction <> 5693 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5693, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17980 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:323
//		CAF	SIX
// PORT: Fixed ROM slots 17980.
                    if slot <> 17980 or instruction <> 15497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:324
//		INDEX	YNDX
// PORT: Fixed ROM slots 17981.
                    if slot <> 17981 or instruction <> 21325 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21325, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21325, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1041] to agcAotUnit1041@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:325
//		AD	XLN1NDX
// PORT: Fixed ROM slots 17982.
    17982, 52210
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17983–17983.
function agcAotUnit1042 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:326
//		INDEX	A
// PORT: Fixed ROM slots 17983.
    if slot <> 17983 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1042] to agcAotUnit1042@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:327
//		CA	YZTABLE
// PORT: Fixed ROM slots 17984.
    17984, 27858
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17985–18007.
function agcAotUnit1043 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17995 {
        if slot <= 17989 {
            if slot <= 17986 {
                if slot <= 17985 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:328
//		MASK	ACYJETS		# = 34360 OCT
// PORT: Fixed ROM slots 17985.
                    if slot <> 17985 or instruction <> 30323 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1651), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:329
//		AD	RWORD1
// PORT: Fixed ROM slots 17986.
                    if slot <> 17986 or instruction <> 25385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 809).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17987 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:330
//		TS	T5TEMP
// PORT: Fixed ROM slots 17987.
                    if slot <> 17987 or instruction <> 23362 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23362, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17988 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:331
//		EXTEND			# FOR EXPLANATION SEE CODING ON RTABLE
// PORT: Fixed ROM slots 17988.
                        if slot <> 17988 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:332
//		MP	BIT4
// PORT: Fixed ROM slots 17989.
                        if slot <> 17989 or instruction <> 31244 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17992 {
                if slot <= 17990 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:333
//		AD	=-4
// PORT: Fixed ROM slots 17990.
                    if slot <> 17990 or instruction <> 27697 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 3121), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17991 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:334
//		TS	NRJETS		# NO. OF NET ROLL JETS
// PORT: Fixed ROM slots 17991.
                        if slot <> 17991 or instruction <> 23378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23378, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:335
//		EXTEND
// PORT: Fixed ROM slots 17992.
                        if slot <> 17992 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17993 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:336
//		BZF	TAUCHCK		# IF NRJETS = 0
// PORT: Fixed ROM slots 17993.
                    if slot <> 17993 or instruction <> 5709 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5709, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17994 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:337
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:338
//BDRACZ		CA	T5TEMP		# Y-TRANSLATION ACCEPTED
// PORT: Fixed ROM slots 17994.
                        if slot <> 17994 or instruction <> 13122 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 834).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:339
//		TS	RWORD1
// PORT: Fixed ROM slots 17995.
                        if slot <> 17995 or instruction <> 23337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23337, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18001 {
            if slot <= 17998 {
                if slot <= 17996 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:340
//		TCF	ROLLTIME	# BRANCH TO JET ON-TIME CALCULATIONS
// PORT: Fixed ROM slots 17996.
                    if slot <> 17996 or instruction <> 5820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5820, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17997 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:341
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:342
//TAUCHCK		CCS	TAU
// PORT: Fixed ROM slots 17997.
                        if slot <> 17997 or instruction <> 4977 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 881).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:343
//		TCF	NOACY
// PORT: Fixed ROM slots 17998.
                        if slot <> 17998 or instruction <> 5714 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5714, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17999 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:344
//		TCF	BDRACZ
// PORT: Fixed ROM slots 17999.
                    if slot <> 17999 or instruction <> 5706 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5706, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18000 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:345
//		TCF	NOACY
// PORT: Fixed ROM slots 18000.
                        if slot <> 18000 or instruction <> 5714 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5714, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:346
//		TCF	BDRACZ
// PORT: Fixed ROM slots 18001.
                        if slot <> 18001 or instruction <> 5706 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5706, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18004 {
                if slot <= 18002 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:347
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:348
//# Page 1046
// PORT: SOURCE JET_SELECTION_LOGIC.agc:349
//NOACY		CA	RWORD1		# Y-TRANSLATION NOT ACCEPTED
// PORT: Fixed ROM slots 18002.
                    if slot <> 18002 or instruction <> 13097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 809).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18003 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:350
//		EXTEND
// PORT: Fixed ROM slots 18003.
                        if slot <> 18003 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:351
//		MP	BIT4
// PORT: Fixed ROM slots 18004.
                        if slot <> 18004 or instruction <> 31244 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18005 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:352
//		AD	=-2
// PORT: Fixed ROM slots 18005.
                    if slot <> 18005 or instruction <> 28621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18006 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:353
//		TS	NRJETS
// PORT: Fixed ROM slots 18006.
                        if slot <> 18006 or instruction <> 23378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23378, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:354
//		TCF	ROLLTIME
// PORT: Fixed ROM slots 18007.
                        if slot <> 18007 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1043] to agcAotUnit1043@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:355
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:356
//# Page 1047
// PORT: SOURCE JET_SELECTION_LOGIC.agc:357
//# 		TABLE FOR ROLL, Y AND Z-TRANSLATION COMMANDS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:358
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:359
//# 	EITHER AC OR BD ROLL MAY BE SELECTED.  IF AC ROLL IS SELECTED, Y-TRANSLATIONS MAY BE SATISFIED SIMULTANEOUSLY
// PORT: SOURCE JET_SELECTION_LOGIC.agc:360
//# PROVIDED THAT THERE ARE NO AC QUAD FAILURES.  IF THERE ARE AC FAILURES, Y-TRANSLATION COMMANDS WILL BE IGNORED,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:361
//# IN WHICH CASE THE ASTRONAUT SHOULD SWITCH TO BD ROLL.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:362
//# 	IF BDROLL IS SELECTED, Z-TRANSLATIONS MAY BE SATISFIED SIMULTANEOUSLY PROVIDED THAT THERE ARE NO BD QUAD
// PORT: SOURCE JET_SELECTION_LOGIC.agc:363
//# FAILURES.  IF THERE ARE BD FAILURES, Z-TRANSLATION COMMANDS WILL BE IGNORED, IN WHICH CASE THE ASTRONAUT SHOULD
// PORT: SOURCE JET_SELECTION_LOGIC.agc:364
//# SWITCH TO AC ROLL.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:365
//# 	NOTE THAT IF ONE QUAD FAILS (E.G. B FAILED), Z-TRANSLATION IS STILL POSSIBLE AND THAT THE UNDESIRABLE ROLL
// PORT: SOURCE JET_SELECTION_LOGIC.agc:366
//# INTRODUCED BY THIS TRANSLATION WILL BE COMPENSATED BY THE TWO AC ROLL JETS ACTUATED BY THE AUTOPILOT LOGIC.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:367
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:368
//# 		WORD MAKE UP....RTABLE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:369
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:370
//# 	TWO WORDS, CORRESPONDING TO AC OR BD ROLL SELECTION, HAVE BEEN COMBINED INTO ONE TABLE.  THE WORD CORRESPOND-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:371
//# ING TO AC ROLL HAS THE FOLLOWING INTERPRETATION..
// PORT: SOURCE JET_SELECTION_LOGIC.agc:372
//#	BITS 9,10,11 ARE CODED TO GIVE THE NET ROLL TORQUE FOR THE WORD SELECTED.  THE CODING IS..
// PORT: SOURCE JET_SELECTION_LOGIC.agc:373
//#			BIT NO. 11  10   9		NO. OF ROLL JETS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:374
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:375
//#				 0   0   0			-2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:376
//#				 0   0   1			-1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:377
//#				 0   1   0			 0
// PORT: SOURCE JET_SELECTION_LOGIC.agc:378
//#				 0   1   1			+1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:379
//#				 1   0   0			+2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:380
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:381
//# 	THIS WORD MAY THEN BE ADDED TO THE WORD SELECTED FROM THE YZ-TRANSLATION TABLE, WHICH HAS THE SAME TYPE OF
// PORT: SOURCE JET_SELECTION_LOGIC.agc:382
//# CODING AS ABOVE, AND THE NET ROLL DETERMINED BY SHIFTING THE RESULTANT WORD RIGHT 8 PLACES AND SUBTRACTING FOUR.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:383
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:384
//# 	THE WORD CORRESPONDING TO THE BD ROLL HAS A SIMILAR INTERPRETATION, EXCEPT THAT BITS 12, 13, 14 ARE CODED
// PORT: SOURCE JET_SELECTION_LOGIC.agc:385
//# (AS ABOVE) TO GIVE THE NET ROLL TORQUE.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:386
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:387
//					# ROLL 		TRANS		QUADFAIL	BIAS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:388
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:389
//RTABLE		OCT	11000		#   0						  0
// PORT: Fixed ROM slots 18008.
    18008, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:390
//		OCT	22125		#   +						  0
// PORT: Fixed ROM slots 18009.
    18009, 18602,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:391
//		OCT	00252		#   -						  0
// PORT: Fixed ROM slots 18010.
    18010, 340,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:392
//		OCT	11231		#   0		+Y(+Z)				  3
// PORT: Fixed ROM slots 18011.
    18011, 9522,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:393
//		OCT	15421		#   +		+Y(+Z)				  3
// PORT: Fixed ROM slots 18012.
    18012, 13858,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:394
//		OCT	04610		#   -		+Y(+Z)				  3
// PORT: Fixed ROM slots 18013.
    18013, 4880,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:395
//		OCT	11146		#   0		-Y(-Z)				  6
// PORT: Fixed ROM slots 18014.
    18014, 9420,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:396
//		OCT	15504		#   +		-Y(-Z)				  6
// PORT: Fixed ROM slots 18015.
    18015, 13960,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:397
//		OCT	04442		#   -		-Y(-Z)				  6
// PORT: Fixed ROM slots 18016.
    18016, 4676,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:398
//		OCT	11000		#   0				  A(B)		  9
// PORT: Fixed ROM slots 18017.
    18017, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:399
//		OCT	15504		#   +				  A(B)		  9
// PORT: Fixed ROM slots 18018.
    18018, 13960,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:400
//		OCT	04610		#   -				  A(B)		  9
// PORT: Fixed ROM slots 18019.
    18019, 4880,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:401
//		OCT	11000		#   0				  C(D)		 12
// PORT: Fixed ROM slots 18020.
    18020, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:402
//		OCT	15421		#   +				  C(D)           12
// PORT: Fixed ROM slots 18021.
    18021, 13858,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:403
//		OCT	04442		#   -				  C(D)		 12
// PORT: Fixed ROM slots 18022.
    18022, 4676,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:404
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:405
//# Page 1048
// PORT: SOURCE JET_SELECTION_LOGIC.agc:406
//# RTABLE MASKS -
// PORT: SOURCE JET_SELECTION_LOGIC.agc:407
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:408
//ACRJETS		OCT	03760
// PORT: Fixed ROM slots 18023.
    18023, 4064,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:409
//BDRJETS		OCT	34017
// PORT: Fixed ROM slots 18024.
    18024, 28702,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:410
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:411
//# Page 1049
// PORT: SOURCE JET_SELECTION_LOGIC.agc:412
//#		Y, Z TRANSLATION TABLE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:413
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:414
//# 	ONCE AC OR BD ROLL IS SELECTED THE QUAD PAIR WHICH IS NOT BEING USED TO SATISFY THE ROLL COMMANDS MAY BE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:415
//# USED TO SATISFY THE REMAINING TRANSLATION COMMANDS.  HOWEVER, WE MUST MAKE SURE THAT ROLL COMMANDS ARE SATISFIED
// PORT: SOURCE JET_SELECTION_LOGIC.agc:416
//# WHEN THEY OCCUR.  THEREFORE, THE Y-Z TRANSLATIONS FROM THIS TABLE WILL BE IGNORED IF THE NET ROLL TORQUE OF THE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:417
//# COMBINED WORD IS ZERO AND THE ROLL COMMANDS ARE NON-ZERO.  THIS SITUATION WOULD OCCUR, FOR EXAMPLE, IF WE EN-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:418
//# COUNTER SIMULTANEOUS +R +Y -Z COMMANDS AND A QUAD D FAILURE WHILE USING AC FOR ROLL.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:419
//# 	TO FACILITATE THE LOGIC, THE Y-Z TRANSLATION TABLE HAS BEEN CODED IN A MANNER SIMILAR TO THE ROLL TABLE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:420
//# ABOVE.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:421
//# 	BITS 9,10,11 ARE CODED TO GIVE THE NET ROLL TORQUE INCURRED BY Z-TRANSLATIONS.  THE WORD SELECTED CAN THEN BE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:422
//# ADDED TO THE AC-ROLL WORD AND THE RESULTANT ROLL TORQUE DETERMINED FROM THE COMBINED WORD.  SIMILIARLY BITS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:423
//# 12,13,14 ARE CODED TO GIVE THE NET ROLL TORQUE INCURRED BY Y-TRANSLATIONS WHEN BD-ROLL IS SELECTED.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:424
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:425
//					# TRANSLATION	QUADFAIL	BIAS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:426
//					#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:427
//YZTABLE		OCT	11000		# 	0			0
// PORT: Fixed ROM slots 18025.
    18025, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:428
//		OCT	11231		#    +Z(+Y)			0
// PORT: Fixed ROM slots 18026.
    18026, 9522,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:429
//		OCT	11146		#    -Z(-Y)			0
// PORT: Fixed ROM slots 18027.
    18027, 9420,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:430
//		OCT	11000		#	0	  B(A)		3
// PORT: Fixed ROM slots 18028.
    18028, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:431
//		OCT	04610		#    +Z(+Y)	  B(A)		3
// PORT: Fixed ROM slots 18029.
    18029, 4880,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:432
//		OCT	15504		#    -Z(-Y)	  B(A)		3
// PORT: Fixed ROM slots 18030.
    18030, 13960,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:433
//		OCT	11000		#  	0	  D(C)		6
// PORT: Fixed ROM slots 18031.
    18031, 9216,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:434
//		OCT	15421		#    +Z(+Y)	  D(C)		6
// PORT: Fixed ROM slots 18032.
    18032, 13858,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:435
//		OCT	04442		#    -Z(-Y)	  D(C)		6
// PORT: Fixed ROM slots 18033.
    18033, 4676,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:436
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:437
//# YZ-TABLE MASKS-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:438
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:439
//BDZJETS		OCT	03417
// PORT: Fixed ROM slots 18034.
    18034, 3614,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:440
//ACYJETS		OCT	34360
// PORT: Fixed ROM slots 18035.
    18035, 29152
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18036–18046.
function agcAotUnit1044 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18040 {
        if slot <= 18037 {
            if slot <= 18036 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:441
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:442
//# ADDITIONAL CONSTANTS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:443
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:444
//=-2		=	NEG2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:445
//=-4		=	NEG4
// PORT: SOURCE JET_SELECTION_LOGIC.agc:446
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:447
//# Page 1050
// PORT: SOURCE JET_SELECTION_LOGIC.agc:448
//# 		CALCULATION OF JET ON-TIMES
// PORT: SOURCE JET_SELECTION_LOGIC.agc:449
//#
// PORT: SOURCE JET_SELECTION_LOGIC.agc:450
//# 	THE ROTATION COMMANDS (TAU:S), WHICH WERE DETERMINED FROM THE JET SWITCHING LOGIC ON THE BASIS OF SINGLE JET
// PORT: SOURCE JET_SELECTION_LOGIC.agc:451
//# OPERATION, MUST NOW BE UPDATED BY THE ACTUAL NUMBER OF JETS TO BE USED IN SATISFYING THESE COMMANDS.  TAU MUST
// PORT: SOURCE JET_SELECTION_LOGIC.agc:452
//# ALSO BE DECREMENTED ACCORDING TO THE EXPECTED TORQUE GENERATED BY THE NEW COMMANDS ACTING OVER THE NEXT T5 INT-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:453
//# ERVAL.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:454
//# 	IN ORDER TO MAINTAIN ACCURATE KNOWLEDGE OF VEHICLE ANGULAR RATES, WE MUST ALSO PROVIDE EXPECTED FIRING TIMES
// PORT: SOURCE JET_SELECTION_LOGIC.agc:455
//# (DFT:S, ALSO IN TERMS OF 1-JET OPERATION) FOR THE RATE FILTER.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:456
//# 	NOTE THAT TRANSLATIONS CAN PRODUCE ROTATIONS EVEN THOUGH NO ROTATIONS WERE CALLED FOR.  NEVERTHELESS, WE MUST
// PORT: SOURCE JET_SELECTION_LOGIC.agc:457
//# UPDATE DFT.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:458
//# 	WHEN THE ROTATIONS HAVE FINISHED, WE MUST PROVIDE CHANNEL INFORMATION TO THE T6 PROGRAM TO CONTINUE ON WITH
// PORT: SOURCE JET_SELECTION_LOGIC.agc:459
//# THE TRANSLATIONS.  THIS WILL BE DONE IN THE NEXT SECTION.  HOWEVER, TO INSURE THAT JETS ARE NOT FIRED FOR LESS
// PORT: SOURCE JET_SELECTION_LOGIC.agc:460
//# THAN A MINIMUM IMPULSE (14MS), ALL JET CHANNEL COMMANDS WILL BE HELD FIXED FROM THE START OF THE T5 PROGRAM FOR
// PORT: SOURCE JET_SELECTION_LOGIC.agc:461
//# ATLEAST 14MS UNTIL THE INITIALIZATION OF NEW COMMANDS.  MOREOVER, A 14MS ON-TIME WILL BE ADDED TO ANY ROTATIONAL
// PORT: SOURCE JET_SELECTION_LOGIC.agc:462
//# COMMANDS GENERATED BY THE MANUAL CONTROLS OR THE JET SWITCHING LOGIC, AND ALL TRANSLATION COMMANDS WILL BE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:463
//# ACTIVE FOR ATLEAST ONE CYCLE OF THE T5 PROGRAM (.1SEC)
// PORT: SOURCE JET_SELECTION_LOGIC.agc:464
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:465
//# 		PITCH JET ON-TIME CALCULATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:466
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:467
//PITCHTIM	CCS	TAU1
// PORT: Fixed ROM slots 18036.
                if slot <> 18036 or instruction <> 4978 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 882).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:468
//		TCF	PTAUPOS
// PORT: Fixed ROM slots 18037.
                if slot <> 18037 or instruction <> 5756 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5756, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18038 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:469
//		TCF	+2
// PORT: Fixed ROM slots 18038.
                if slot <> 18038 or instruction <> 5752 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5752, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18039 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:470
//		TCF	PTAUNEG
// PORT: Fixed ROM slots 18039.
                    if slot <> 18039 or instruction <> 5754 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5754, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:471
//		TS	DFT1		# NO PITCH ROTATION
// PORT: Fixed ROM slots 18040.
                    if slot <> 18040 or instruction <> 23400 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23400, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18043 {
            if slot <= 18041 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:472
//		TCF	PBYPASS		# COMMANDS
// PORT: Fixed ROM slots 18041.
                if slot <> 18041 or instruction <> 5882 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5882, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18042 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:473
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:474
//PTAUNEG		CS	NPJETS
// PORT: Fixed ROM slots 18042.
                    if slot <> 18042 or instruction <> 17235 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 851).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:475
//		TS	NPJETS
// PORT: Fixed ROM slots 18043.
                    if slot <> 18043 or instruction <> 23379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23379, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18044 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:476
//PTAUPOS		CA	TAU1
// PORT: Fixed ROM slots 18044.
                if slot <> 18044 or instruction <> 13170 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 882).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18045 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:477
//		EXTEND
// PORT: Fixed ROM slots 18045.
                    if slot <> 18045 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:478
//		INDEX	NPJETS
// PORT: Fixed ROM slots 18046.
                    if slot <> 18046 or instruction <> 21331 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21331, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21331, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1044] to agcAotUnit1044@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:479
//		MP	NJET
// PORT: Fixed ROM slots 18047.
    18047, 60886
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18048–18052.
function agcAotUnit1045 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18049 {
        if slot <= 18048 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:480
//		TS	BLAST1
// PORT: Fixed ROM slots 18048.
            if slot <> 18048 or instruction <> 23345 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23345, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:481
//		AD	=-.1SEC
// PORT: Fixed ROM slots 18049.
            if slot <> 18049 or instruction <> 26310 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1734), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18050 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:482
//		EXTEND
// PORT: Fixed ROM slots 18050.
            if slot <> 18050 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18051 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:483
//		BZMF	AD14MSP
// PORT: Fixed ROM slots 18051.
                if slot <> 18051 or instruction <> 26252 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26252, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:484
//		INDEX	NPJETS
// PORT: Fixed ROM slots 18052.
                if slot <> 18052 or instruction <> 21331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21331, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21331, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1045] to agcAotUnit1045@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:485
//		CA	DFTMAX		# THE PITCH ON-TIME IS GREATER THAN .1 SEC
// PORT: Fixed ROM slots 18053.
    18053, 28046
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18054–18082.
function agcAotUnit1046 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18067 {
        if slot <= 18060 {
            if slot <= 18056 {
                if slot <= 18054 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:486
//		TS	DFT1
// PORT: Fixed ROM slots 18054.
                    if slot <> 18054 or instruction <> 23400 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23400, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18055 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:487
//		COM
// PORT: Fixed ROM slots 18055.
                        if slot <> 18055 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:488
//		ADS	TAU1		# UPDATE TAU1
// PORT: Fixed ROM slots 18056.
                        if slot <> 18056 or instruction <> 12146 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 882).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18058 {
                    if slot <= 18057 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:489
//		CAF	=+.1SEC		# LIMIT THE LENGTH OF PITCH ROTATION
// PORT: Fixed ROM slots 18057.
                        if slot <> 18057 or instruction <> 14024 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1736), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:490
//		TS	BLAST1		# COMMANDS TO 0.1 SEC SO THAT ONLY
// PORT: Fixed ROM slots 18058.
                        if slot <> 18058 or instruction <> 23345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23345, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18059 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:491
//		TCF	ASMBLWP		# X-TRANSLATIONS WILL CONTINUE ON SWITCH
// PORT: Fixed ROM slots 18059.
                        if slot <> 18059 or instruction <> 5871 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5871, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:492
//					# OVER TO TVC
// PORT: SOURCE JET_SELECTION_LOGIC.agc:493
//AD14MSP		CS	BLAST1		# SEE IF JET ON TIME IS LESS THAN
// PORT: Fixed ROM slots 18060.
                        if slot <> 18060 or instruction <> 17201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 817).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18063 {
                if slot <= 18061 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:494
//		AD	=14MS		# MINIMUM IMPULSE TIME
// PORT: Fixed ROM slots 18061.
                    if slot <> 18061 or instruction <> 26315 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18062 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:495
//		EXTEND
// PORT: Fixed ROM slots 18062.
                        if slot <> 18062 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:496
//		BZMF	PBLASTOK	# IF SO LIMIT MINIMUM ON TIME TO 14 MS
// PORT: Fixed ROM slots 18063.
                        if slot <> 18063 or instruction <> 26258 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18065 {
                    if slot <= 18064 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:497
//		CAF	=14MS
// PORT: Fixed ROM slots 18064.
                        if slot <> 18064 or instruction <> 14027 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:498
//# Page 1051
// PORT: SOURCE JET_SELECTION_LOGIC.agc:499
//		TS	BLAST1
// PORT: Fixed ROM slots 18065.
                        if slot <> 18065 or instruction <> 23345 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23345, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18066 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:500
//PBLASTOK	CA	BLAST1
// PORT: Fixed ROM slots 18066.
                        if slot <> 18066 or instruction <> 13105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 817).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:501
//		EXTEND			# THE PITCH COMMANDS WILL BE COMPLETED
// PORT: Fixed ROM slots 18067.
                        if slot <> 18067 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18074 {
            if slot <= 18070 {
                if slot <= 18068 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:502
//		MP	NPJETS		# WITHIN THE TS-CYCLE TIME
// PORT: Fixed ROM slots 18068.
                    if slot <> 18068 or instruction <> 29523 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 851, readEffective:call(words, 851)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18069 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:503
//		LXCH	DFT1		# FOR USE IN UPDATING RATE FILTER
// PORT: Fixed ROM slots 18069.
                        if slot <> 18069 or instruction <> 10088 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 872, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:504
//		TS	TAU1		# ZERO TAU1 (ACC CONTAINS ZERO)
// PORT: Fixed ROM slots 18070.
                        if slot <> 18070 or instruction <> 23410 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23410, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18072 {
                    if slot <= 18071 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:505
//		TCF	ASMBLWP
// PORT: Fixed ROM slots 18071.
                        if slot <> 18071 or instruction <> 5871 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5871, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:506
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:507
//# Page 1052
// PORT: SOURCE JET_SELECTION_LOGIC.agc:508
//# YAW JET ON-TIME CALCULATION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:509
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:510
//YAWTIME		CCS	TAU2
// PORT: Fixed ROM slots 18072.
                        if slot <> 18072 or instruction <> 4979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 883).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18073 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:511
//		TCF	YTAUPOS
// PORT: Fixed ROM slots 18073.
                        if slot <> 18073 or instruction <> 5792 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5792, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:512
//		TCF	+2
// PORT: Fixed ROM slots 18074.
                        if slot <> 18074 or instruction <> 5788 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5788, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18078 {
                if slot <= 18076 {
                    if slot <= 18075 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:513
//		TCF	YTAUNEG
// PORT: Fixed ROM slots 18075.
                        if slot <> 18075 or instruction <> 5790 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5790, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:514
//		TS	DFT2		# NO YAW ROTATION COMMANDS
// PORT: Fixed ROM slots 18076.
                        if slot <> 18076 or instruction <> 23401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23401, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18077 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:515
//		TCF	YBYPASS
// PORT: Fixed ROM slots 18077.
                        if slot <> 18077 or instruction <> 5982 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5982, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:516
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:517
//YTAUNEG		CS	NYJETS
// PORT: Fixed ROM slots 18078.
                        if slot <> 18078 or instruction <> 17236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 852).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18080 {
                    if slot <= 18079 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:518
//		TS	NYJETS
// PORT: Fixed ROM slots 18079.
                        if slot <> 18079 or instruction <> 23380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23380, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:519
//YTAUPOS		CA	TAU2
// PORT: Fixed ROM slots 18080.
                        if slot <> 18080 or instruction <> 13171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 883).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18081 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:520
//		EXTEND
// PORT: Fixed ROM slots 18081.
                        if slot <> 18081 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:521
//		INDEX	NYJETS
// PORT: Fixed ROM slots 18082.
                        if slot <> 18082 or instruction <> 21332 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21332, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21332, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1046] to agcAotUnit1046@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:522
//		MP	NJET
// PORT: Fixed ROM slots 18083.
    18083, 60886
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18084–18088.
function agcAotUnit1047 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18085 {
        if slot <= 18084 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:523
//		TS	BLAST2
// PORT: Fixed ROM slots 18084.
            if slot <> 18084 or instruction <> 23347 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23347, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:524
//		AD	=-.1SEC
// PORT: Fixed ROM slots 18085.
            if slot <> 18085 or instruction <> 26310 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1734), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18086 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:525
//		EXTEND
// PORT: Fixed ROM slots 18086.
            if slot <> 18086 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18087 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:526
//		BZMF	AD14MSY
// PORT: Fixed ROM slots 18087.
                if slot <> 18087 or instruction <> 26288 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26288, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:527
//		INDEX	NYJETS
// PORT: Fixed ROM slots 18088.
                if slot <> 18088 or instruction <> 21332 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21332, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21332, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1047] to agcAotUnit1047@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:528
//		CA	DFTMAX		# YAW COMMANDS WILL LAST LONGER THAN .1SEC
// PORT: Fixed ROM slots 18089.
    18089, 28046
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18090–18097.
function agcAotUnit1048 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18093 {
        if slot <= 18091 {
            if slot <= 18090 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:529
//		TS	DFT2
// PORT: Fixed ROM slots 18090.
                if slot <> 18090 or instruction <> 23401 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23401, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:530
//		COM
// PORT: Fixed ROM slots 18091.
                if slot <> 18091 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18092 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:531
//		ADS	TAU2		# DECREMENT TAU2
// PORT: Fixed ROM slots 18092.
                if slot <> 18092 or instruction <> 12147 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 883).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:532
//		CAF	=+.1SEC		# LIMIT THE LENGTH OF YAW ROTATION COMMAND
// PORT: Fixed ROM slots 18093.
                if slot <> 18093 or instruction <> 14024 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1736), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18095 {
            if slot <= 18094 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:533
//		TS	BLAST2		# TO 0.1 SEC SO THAT ONLY X-TRANSLATION
// PORT: Fixed ROM slots 18094.
                if slot <> 18094 or instruction <> 23347 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23347, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:534
//		TCF	ASMBLWY		# WILL CONTINUE ON SWITCH OVER TO TVC
// PORT: Fixed ROM slots 18095.
                if slot <> 18095 or instruction <> 5971 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5971, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18096 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:535
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:536
//AD14MSY		CS	BLAST2		# SEE IF JET ON-TIME LESS THAN
// PORT: Fixed ROM slots 18096.
                if slot <> 18096 or instruction <> 17203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 819).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:537
//		AD	=14MS		# MINIMUM IMPULSE TIME
// PORT: Fixed ROM slots 18097.
                if slot <> 18097 or instruction <> 26315 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1048] to agcAotUnit1048@.

// PORT: Physical bank 17. Shared continuation entries, slots 18098–18112.
function agcAotUnit1049 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18104 {
        if slot <= 18100 {
            if slot <= 18098 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:538
//		EXTEND
// PORT: Fixed ROM slots 18098.
                if slot <> 18098 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18099 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:539
//		BZMF	YBLASTOK	# IF SO, LIMIT MINIMUM ON-TIME TO 14 MS
// PORT: Fixed ROM slots 18099.
                    if slot <> 18099 or instruction <> 26294 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26294, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:540
//		CAF	=14MS
// PORT: Fixed ROM slots 18100.
                    if slot <> 18100 or instruction <> 14027 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18102 {
                if slot <= 18101 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:541
//		TS	BLAST2
// PORT: Fixed ROM slots 18101.
                    if slot <> 18101 or instruction <> 23347 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23347, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:542
//YBLASTOK	CA	BLAST2		# YAW COMMANDS WILL BE COMPLETED WITHIN
// PORT: Fixed ROM slots 18102.
                    if slot <> 18102 or instruction <> 13107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 819).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18103 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:543
//		EXTEND			# THE T5CYCLE TIME
// PORT: Fixed ROM slots 18103.
                    if slot <> 18103 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:544
//		MP	NYJETS
// PORT: Fixed ROM slots 18104.
                    if slot <> 18104 or instruction <> 29524 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 852, readEffective:call(words, 852)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18108 {
            if slot <= 18106 {
                if slot <= 18105 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:545
//		LXCH	DFT2
// PORT: Fixed ROM slots 18105.
                    if slot <> 18105 or instruction <> 10089 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 873, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:546
//		TS	TAU2		# ZERO TAU2
// PORT: Fixed ROM slots 18106.
                    if slot <> 18106 or instruction <> 23411 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23411, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18107 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:547
//		TCF	ASMBLWY
// PORT: Fixed ROM slots 18107.
                    if slot <> 18107 or instruction <> 5971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5971, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:548
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:549
//# Page 1053
// PORT: SOURCE JET_SELECTION_LOGIC.agc:550
//# ROLL ON-TIME CALCULATION-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:551
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:552
//ROLLTIME	CCS	TAU
// PORT: Fixed ROM slots 18108.
                    if slot <> 18108 or instruction <> 4977 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 881).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18110 {
                if slot <= 18109 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:553
//		TCF	RBLAST
// PORT: Fixed ROM slots 18109.
                    if slot <> 18109 or instruction <> 5836 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5836, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:554
//		TCF	+2
// PORT: Fixed ROM slots 18110.
                    if slot <> 18110 or instruction <> 5824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5824, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18111 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:555
//		TCF	RBLAST
// PORT: Fixed ROM slots 18111.
                    if slot <> 18111 or instruction <> 5836 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5836, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:556
//		INDEX	NRJETS
// PORT: Fixed ROM slots 18112.
                    if slot <> 18112 or instruction <> 21330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21330, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21330, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1049] to agcAotUnit1049@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:557
//		CA	DFTMAX		# UPDATE DFT EVEN THO NO ROLL COMMANDS ARE
// PORT: Fixed ROM slots 18113.
    18113, 28046
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18114–18115.
function agcAotUnit1050 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18114 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:558
//		TS	DFT		# PRESENT
// PORT: Fixed ROM slots 18114.
        if slot <> 18114 or instruction <> 23399 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23399, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:559
//		TCF	RBYPASS
// PORT: Fixed ROM slots 18115.
        if slot <> 18115 or instruction <> 5966 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5966, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1050] to agcAotUnit1050@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:560
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:561
//		DEC	-480		# = -.3SEC
// PORT: Fixed ROM slots 18116.
    18116, 64574,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:562
//		DEC	-320		# = -.2SEC
// PORT: Fixed ROM slots 18117.
    18117, 64894,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:563
//=-.1SEC		DEC	-160		# = -.1SEC
// PORT: Fixed ROM slots 18118.
    18118, 65214,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:564
//DFTMAX		DEC	0		#     0
// PORT: Fixed ROM slots 18119.
    18119, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:565
//=+.1SEC		DEC	160		# = +.1SEC
// PORT: Fixed ROM slots 18120.
    18120, 320,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:566
//		DEC	320		# = +.2SEC
// PORT: Fixed ROM slots 18121.
    18121, 640,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:567
//		DEC	480		# = +.3SEC
// PORT: Fixed ROM slots 18122.
    18122, 960,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:568
//=14MS		DEC	23		# =14MS
// PORT: Fixed ROM slots 18123.
    18123, 46
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18124–18126.
function agcAotUnit1051 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18124 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:569
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:570
//RBLAST		CA	TAU
// PORT: Fixed ROM slots 18124.
        if slot <> 18124 or instruction <> 13169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 881).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18125 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:571
//		EXTEND
// PORT: Fixed ROM slots 18125.
            if slot <> 18125 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:572
//		INDEX	NRJETS
// PORT: Fixed ROM slots 18126.
            if slot <> 18126 or instruction <> 21330 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21330, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21330, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1051] to agcAotUnit1051@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:573
//		MP	NJET
// PORT: Fixed ROM slots 18127.
    18127, 60886
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18128–18132.
function agcAotUnit1052 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18129 {
        if slot <= 18128 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:574
//		TS	BLAST		# BLAST IS AN INTERMEDIATE VARIABLE
// PORT: Fixed ROM slots 18128.
            if slot <> 18128 or instruction <> 23343 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23343, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:575
//					# USED IN DETERMINING THE JET ON-TIMES
// PORT: SOURCE JET_SELECTION_LOGIC.agc:576
//		AD	=-.1SEC
// PORT: Fixed ROM slots 18129.
            if slot <> 18129 or instruction <> 26310 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1734), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18130 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:577
//		EXTEND
// PORT: Fixed ROM slots 18130.
            if slot <> 18130 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18131 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:578
//		BZMF	AD14MSR
// PORT: Fixed ROM slots 18131.
                if slot <> 18131 or instruction <> 26332 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26332, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:579
//		INDEX	NRJETS		# THE ROLL ROTATION WILL LAST LONGER
// PORT: Fixed ROM slots 18132.
                if slot <> 18132 or instruction <> 21330 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21330, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21330, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1052] to agcAotUnit1052@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:580
//		CA	DFTMAX		# THAN THE T5 CYCLE TIME
// PORT: Fixed ROM slots 18133.
    18133, 28046
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18134–18151.
function agcAotUnit1053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18142 {
        if slot <= 18137 {
            if slot <= 18135 {
                if slot <= 18134 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:581
//		TS	DFT
// PORT: Fixed ROM slots 18134.
                    if slot <> 18134 or instruction <> 23399 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23399, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:582
//		COM
// PORT: Fixed ROM slots 18135.
                    if slot <> 18135 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18136 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:583
//		ADS	TAU
// PORT: Fixed ROM slots 18136.
                    if slot <> 18136 or instruction <> 12145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 881).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:584
//		CAF	=+.1SEC		# LIMIT THE LENGTH OF ROLL ROTATION
// PORT: Fixed ROM slots 18137.
                    if slot <> 18137 or instruction <> 14024 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1736), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18139 {
                if slot <= 18138 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:585
//		TS	BLAST		# COMMANDS TO 0.1 SEC SO THAT ONLY Y-Z
// PORT: Fixed ROM slots 18138.
                    if slot <> 18138 or instruction <> 23343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23343, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:586
//		TCF	ASMBLWR		# TRANSLATION COMMANDS CONTINUE
// PORT: Fixed ROM slots 18139.
                    if slot <> 18139 or instruction <> 5887 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5887, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18140 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:587
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:588
//AD14MSR		CS	BLAST		# SEE IF THE JET ON-TIME LESS THAN
// PORT: Fixed ROM slots 18140.
                    if slot <> 18140 or instruction <> 17199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 815).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18141 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:589
//		AD	=14MS		# MINIMUM IMPULSE TIME
// PORT: Fixed ROM slots 18141.
                        if slot <> 18141 or instruction <> 26315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:590
//		EXTEND
// PORT: Fixed ROM slots 18142.
                        if slot <> 18142 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18146 {
            if slot <= 18144 {
                if slot <= 18143 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:591
//		BZMF	RBLASTOK
// PORT: Fixed ROM slots 18143.
                    if slot <> 18143 or instruction <> 26338 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26338, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:592
//		CAF	=14MS		# IF SO, LIMIT MINIMUM ON-TIME TO 14 MS
// PORT: Fixed ROM slots 18144.
                    if slot <> 18144 or instruction <> 14027 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1739), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18145 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:593
//		TS	BLAST
// PORT: Fixed ROM slots 18145.
                    if slot <> 18145 or instruction <> 23343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23343, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:594
//RBLASTOK	CA	BLAST
// PORT: Fixed ROM slots 18146.
                    if slot <> 18146 or instruction <> 13103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 815).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18148 {
                if slot <= 18147 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:595
//		EXTEND
// PORT: Fixed ROM slots 18147.
                    if slot <> 18147 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:596
//		MP	NRJETS
// PORT: Fixed ROM slots 18148.
                    if slot <> 18148 or instruction <> 29522 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 850, readEffective:call(words, 850)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18149 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:597
//		LXCH	DFT
// PORT: Fixed ROM slots 18149.
                    if slot <> 18149 or instruction <> 10087 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 871, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18150 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:598
//		TS	TAU		# ZERO TAU
// PORT: Fixed ROM slots 18150.
                        if slot <> 18150 or instruction <> 23409 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23409, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:599
//		TCF	ASMBLWR
// PORT: Fixed ROM slots 18151.
                        if slot <> 18151 or instruction <> 5887 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5887, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1053] to agcAotUnit1053@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:600
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:601
//# Page 1054
// PORT: SOURCE JET_SELECTION_LOGIC.agc:602
//		DEC	-.333333	# = -1/3
// PORT: Fixed ROM slots 18152.
    18152, 54612,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:603
//		DEC	-.500000	# = -1/2
// PORT: Fixed ROM slots 18153.
    18153, 49150,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:604
//		DEC	-.999999	# = -1 (NEGMAX)
// PORT: Fixed ROM slots 18154.
    18154, 32768,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:605
//NJET		DEC	0
// PORT: Fixed ROM slots 18155.
    18155, 0,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:606
//		DEC	.999999		# = +1 (POSMAX)
// PORT: Fixed ROM slots 18156.
    18156, 32766,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:607
//		DEC	.500000		# = +1/2
// PORT: Fixed ROM slots 18157.
    18157, 16384,
// PORT: SOURCE JET_SELECTION_LOGIC.agc:608
//		DEC	.333333		# = +1/3
// PORT: Fixed ROM slots 18158.
    18158, 10922
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18159–18163.
function agcAotUnit1054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18160 {
        if slot <= 18159 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:609
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:610
//# Page 1055
// PORT: SOURCE JET_SELECTION_LOGIC.agc:611
//# 	WHEN THE ROTATION COMMANDS ARE COMPLETED, IT IS NECESSARY TO REPLACE THESE COMMANDS BY NEW COMMANDS WHICH
// PORT: SOURCE JET_SELECTION_LOGIC.agc:612
//# CONTINUE ON WITH THE TRANSLATIONS IF ANY ARE PRESENT.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:613
//# 	IN THIS SECTION THESE NEW COMMANDS ARE GENERATED AND STORED FOR REPLACEMENT OF THE CHANNEL COMMANDS WHEN THE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:614
//# CORRESPONDING ROTATIONS ARE COMPLETED.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:615
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:616
//# GENERATION OF THE SECOND PITCH(X-TRANS) WORD...PWORD2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:617
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:618
//ASMBLWP		CCS	RACFAIL
// PORT: Fixed ROM slots 18159.
            if slot <> 18159 or instruction <> 5014 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 918).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:619
//		TCF	FPX2		# IF FAILURE ON AC IGNORE X-TRANSLATION
// PORT: Fixed ROM slots 18160.
            if slot <> 18160 or instruction <> 5878 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5878, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18161 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:620
//		TCF	+2
// PORT: Fixed ROM slots 18161.
            if slot <> 18161 or instruction <> 5875 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5875, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18162 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:621
//		TCF	FPX2
// PORT: Fixed ROM slots 18162.
                if slot <> 18162 or instruction <> 5878 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5878, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:622
//		INDEX	XNDX1
// PORT: Fixed ROM slots 18163.
                if slot <> 18163 or instruction <> 21323 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21323, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21323, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1054] to agcAotUnit1054@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:623
//		CA	XLNNDX
// PORT: Fixed ROM slots 18164.
    18164, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18165–18165.
function agcAotUnit1055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:624
//		INDEX	A
// PORT: Fixed ROM slots 18165.
    if slot <> 18165 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1055] to agcAotUnit1055@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:625
//FPX2		CA	PYTABLE
// PORT: Fixed ROM slots 18166.
    18166, 27544
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18167–18192.
function agcAotUnit1056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18179 {
        if slot <= 18172 {
            if slot <= 18169 {
                if slot <= 18167 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:626
//		MASK	PJETS
// PORT: Fixed ROM slots 18167.
                    if slot <> 18167 or instruction <> 30171 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1499), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18168 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:627
//		TS	PWORD2
// PORT: Fixed ROM slots 18168.
                        if slot <> 18168 or instruction <> 23340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23340, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:628
//		TCF	YAWTIME
// PORT: Fixed ROM slots 18169.
                        if slot <> 18169 or instruction <> 5784 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5784, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18170 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:629
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:630
//PBYPASS		CA	PWORD1		# THE T6 PROGRAM WILL LOAD PWORD2
// PORT: Fixed ROM slots 18170.
                    if slot <> 18170 or instruction <> 13099 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 811).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18171 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:631
//		TS	PWORD2		# UPON ENTRY
// PORT: Fixed ROM slots 18171.
                        if slot <> 18171 or instruction <> 23340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23340, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:632
//		CAF	ZERO
// PORT: Fixed ROM slots 18172.
                        if slot <> 18172 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 18175 {
                if slot <= 18173 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:633
//		TS	BLAST1		# THERE IS NO PWORD2
// PORT: Fixed ROM slots 18173.
                    if slot <> 18173 or instruction <> 23345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18174 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:634
//		TCF	YAWTIME
// PORT: Fixed ROM slots 18174.
                        if slot <> 18174 or instruction <> 5784 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5784, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:635
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:636
//# Page 1056
// PORT: SOURCE JET_SELECTION_LOGIC.agc:637
//# GENERATION OF THE SECOND ROLL (Y,Z) WORD (RWORD2)
// PORT: SOURCE JET_SELECTION_LOGIC.agc:638
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:639
//ASMBLWR		CCS	YNDX		# CHECK FOR Y-TRANS
// PORT: Fixed ROM slots 18175.
                        if slot <> 18175 or instruction <> 4941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 845).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18177 {
                    if slot <= 18176 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:640
//		TCF	ACBD2Y
// PORT: Fixed ROM slots 18176.
                        if slot <> 18176 or instruction <> 5896 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5896, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:641
//NO2Y		CAF	ZERO
// PORT: Fixed ROM slots 18177.
                        if slot <> 18177 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    if slot <= 18178 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:642
//		TS	RWORD2
// PORT: Fixed ROM slots 18178.
                        if slot <> 18178 or instruction <> 23338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:643
//		CCS	ZNDX		# CHECK FOR Z-TRANS
// PORT: Fixed ROM slots 18179.
                        if slot <> 18179 or instruction <> 4942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 846).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18185 {
            if slot <= 18182 {
                if slot <= 18180 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:644
//		TCF	ACBD2Z
// PORT: Fixed ROM slots 18180.
                    if slot <> 18180 or instruction <> 5931 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18181 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:645
//NO2Z		CAF	ZERO
// PORT: Fixed ROM slots 18181.
                        if slot <> 18181 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:646
//		ADS	RWORD2
// PORT: Fixed ROM slots 18182.
                        if slot <> 18182 or instruction <> 12074 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 810).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18183 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:647
//		TCF	PITCHTIM	# RWORD2 ASSEMBLED
// PORT: Fixed ROM slots 18183.
                    if slot <> 18183 or instruction <> 5748 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5748, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18184 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:648
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:649
//ACBD2Y		CCS	ACORBD
// PORT: Fixed ROM slots 18184.
                        if slot <> 18184 or instruction <> 5016 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 920).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:650
//		TCF	AC2Y		# CAN DO Y-TRANS
// PORT: Fixed ROM slots 18185.
                        if slot <> 18185 or instruction <> 5910 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5910, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18188 {
                if slot <= 18186 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:651
//		TCF	AC2Y
// PORT: Fixed ROM slots 18186.
                    if slot <> 18186 or instruction <> 5910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5910, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18187 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:652
//		TCF	+1		# USING AC FOR ROLL
// PORT: Fixed ROM slots 18187.
                        if slot <> 18187 or instruction <> 5900 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5900, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:653
//		CCS	RACFAIL
// PORT: Fixed ROM slots 18188.
                        if slot <> 18188 or instruction <> 5014 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 918).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18190 {
                    if slot <= 18189 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:654
//		TCF	NO2Y		# USING AC AND AC HAS FAILED
// PORT: Fixed ROM slots 18189.
                        if slot <> 18189 or instruction <> 5889 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5889, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:655
//		TCF	+2
// PORT: Fixed ROM slots 18190.
                        if slot <> 18190 or instruction <> 5904 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5904, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18191 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:656
//		TCF	NO2Y		# DITTO
// PORT: Fixed ROM slots 18191.
                        if slot <> 18191 or instruction <> 5889 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5889, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:657
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:658
//		INDEX	YNDX		# NO FAILURES, CAN DO Y
// PORT: Fixed ROM slots 18192.
                        if slot <> 18192 or instruction <> 21325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21325, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21325, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1056] to agcAotUnit1056@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:659
//		CA	XLNNDX
// PORT: Fixed ROM slots 18193.
    18193, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18194–18194.
function agcAotUnit1057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:660
//		INDEX	A
// PORT: Fixed ROM slots 18194.
    if slot <> 18194 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1057] to agcAotUnit1057@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:661
//		CA	RTABLE
// PORT: Fixed ROM slots 18195.
    18195, 27824
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18196–18202.
function agcAotUnit1058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18198 {
        if slot <= 18196 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:662
//		MASK	ACRJETS
// PORT: Fixed ROM slots 18196.
            if slot <> 18196 or instruction <> 30311 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 1639), 32768).
                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18197 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:663
//		TCF	NO2Y +1
// PORT: Fixed ROM slots 18197.
                if slot <> 18197 or instruction <> 5890 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5890, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:664
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:665
//AC2Y		CCS	RACFAIL
// PORT: Fixed ROM slots 18198.
                if slot <> 18198 or instruction <> 5014 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 918).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18200 {
            if slot <= 18199 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:666
//		CAF	THREE
// PORT: Fixed ROM slots 18199.
                if slot <> 18199 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:667
//		TCF	+2
// PORT: Fixed ROM slots 18200.
                if slot <> 18200 or instruction <> 5914 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5914, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18201 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:668
//		CAF	SIX
// PORT: Fixed ROM slots 18201.
                if slot <> 18201 or instruction <> 15497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:669
//		INDEX	YNDX
// PORT: Fixed ROM slots 18202.
                if slot <> 18202 or instruction <> 21325 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21325, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21325, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1058] to agcAotUnit1058@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:670
//		AD	XLN1NDX
// PORT: Fixed ROM slots 18203.
    18203, 52210
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18204–18204.
function agcAotUnit1059 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:671
//		INDEX	A
// PORT: Fixed ROM slots 18204.
    if slot <> 18204 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1059] to agcAotUnit1059@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:672
//		CA	YZTABLE
// PORT: Fixed ROM slots 18205.
    18205, 27858
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18206–18227.
function agcAotUnit1060 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18216 {
        if slot <= 18210 {
            if slot <= 18207 {
                if slot <= 18206 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:673
//		MASK	ACYJETS
// PORT: Fixed ROM slots 18206.
                    if slot <> 18206 or instruction <> 30323 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1651), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:674
//		TS	RWORD2
// PORT: Fixed ROM slots 18207.
                    if slot <> 18207 or instruction <> 23338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23338, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18208 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:675
//		EXTEND
// PORT: Fixed ROM slots 18208.
                    if slot <> 18208 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18209 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:676
//		MP	BIT4
// PORT: Fixed ROM slots 18209.
                        if slot <> 18209 or instruction <> 31244 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2572, readEffective:call(words, 2572)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:677
//		AD	=-2
// PORT: Fixed ROM slots 18210.
                        if slot <> 18210 or instruction <> 28621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18213 {
                if slot <= 18211 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:678
//		TS	NRJETS
// PORT: Fixed ROM slots 18211.
                    if slot <> 18211 or instruction <> 23378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23378, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18212 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:679
//		CS	BLAST
// PORT: Fixed ROM slots 18212.
                        if slot <> 18212 or instruction <> 17199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 815).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:680
//		AD	=+.1SEC
// PORT: Fixed ROM slots 18213.
                        if slot <> 18213 or instruction <> 26312 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1736), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18214 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:681
//		EXTEND
// PORT: Fixed ROM slots 18214.
                    if slot <> 18214 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18215 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:682
//		MP	NRJETS
// PORT: Fixed ROM slots 18215.
                        if slot <> 18215 or instruction <> 29522 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 850, readEffective:call(words, 850)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:683
//		CA	L
// PORT: Fixed ROM slots 18216.
                        if slot <> 18216 or instruction <> 12289 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 18221 {
            if slot <= 18218 {
                if slot <= 18217 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:684
//		ADS	DFT
// PORT: Fixed ROM slots 18217.
                    if slot <> 18217 or instruction <> 12135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 871).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:685
//		TCF	NO2Y +2
// PORT: Fixed ROM slots 18218.
                    if slot <> 18218 or instruction <> 5891 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5891, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18219 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:686
//# Page 1057
// PORT: SOURCE JET_SELECTION_LOGIC.agc:687
//ACBD2Z		CCS	ACORBD
// PORT: Fixed ROM slots 18219.
                    if slot <> 18219 or instruction <> 5016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 920).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18220 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:688
//		TCF	BDF2Z		# USING BD-ROLL
// PORT: Fixed ROM slots 18220.
                        if slot <> 18220 or instruction <> 5956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5956, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:689
//		TCF	BDF2Z		# MUST CHECK FOR BD FAILURES
// PORT: Fixed ROM slots 18221.
                        if slot <> 18221 or instruction <> 5956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5956, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18224 {
                if slot <= 18222 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:690
//		TCF	+1
// PORT: Fixed ROM slots 18222.
                    if slot <> 18222 or instruction <> 5935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18223 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:691
//		CCS	RBDFAIL		# USING AC FOR ROLL, CAN DO Z-TRANS
// PORT: Fixed ROM slots 18223.
                        if slot <> 18223 or instruction <> 5015 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 919).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:692
//		CAF	THREE
// PORT: Fixed ROM slots 18224.
                        if slot <> 18224 or instruction <> 15500 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18225 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:693
//		TCF	+2
// PORT: Fixed ROM slots 18225.
                    if slot <> 18225 or instruction <> 5939 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5939, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18226 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:694
//		CAF	SIX
// PORT: Fixed ROM slots 18226.
                        if slot <> 18226 or instruction <> 15497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:695
//		INDEX	ZNDX
// PORT: Fixed ROM slots 18227.
                        if slot <> 18227 or instruction <> 21326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21326, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21326, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1060] to agcAotUnit1060@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:696
//		AD	XLN1NDX
// PORT: Fixed ROM slots 18228.
    18228, 52210
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18229–18229.
function agcAotUnit1061 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:697
//		INDEX	A
// PORT: Fixed ROM slots 18229.
    if slot <> 18229 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1061] to agcAotUnit1061@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:698
//		CA	YZTABLE
// PORT: Fixed ROM slots 18230.
    18230, 27858
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18231–18248.
function agcAotUnit1062 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18239 {
        if slot <= 18234 {
            if slot <= 18232 {
                if slot <= 18231 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:699
//		MASK	BDZJETS
// PORT: Fixed ROM slots 18231.
                    if slot <> 18231 or instruction <> 30322 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1650), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:700
//		ADS	RWORD2
// PORT: Fixed ROM slots 18232.
                    if slot <> 18232 or instruction <> 12074 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 810).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18233 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:701
//		EXTEND
// PORT: Fixed ROM slots 18233.
                    if slot <> 18233 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:702
//		MP	BIT7
// PORT: Fixed ROM slots 18234.
                    if slot <> 18234 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18236 {
                if slot <= 18235 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:703
//		AD	=-2
// PORT: Fixed ROM slots 18235.
                    if slot <> 18235 or instruction <> 28621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:704
//		TS	NRJETS
// PORT: Fixed ROM slots 18236.
                    if slot <> 18236 or instruction <> 23378 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23378, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18237 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:705
//		CS	BLAST
// PORT: Fixed ROM slots 18237.
                    if slot <> 18237 or instruction <> 17199 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 815).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18238 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:706
//		AD	=+.1SEC
// PORT: Fixed ROM slots 18238.
                        if slot <> 18238 or instruction <> 26312 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1736), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:707
//		EXTEND
// PORT: Fixed ROM slots 18239.
                        if slot <> 18239 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18243 {
            if slot <= 18241 {
                if slot <= 18240 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:708
//		MP	NRJETS
// PORT: Fixed ROM slots 18240.
                    if slot <> 18240 or instruction <> 29522 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 850, readEffective:call(words, 850)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:709
//		CA	L
// PORT: Fixed ROM slots 18241.
                    if slot <> 18241 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18242 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:710
//		ADS	DFT
// PORT: Fixed ROM slots 18242.
                    if slot <> 18242 or instruction <> 12135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 871).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:711
//		TCF	PITCHTIM
// PORT: Fixed ROM slots 18243.
                    if slot <> 18243 or instruction <> 5748 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5748, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18245 {
                if slot <= 18244 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:712
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:713
//BDF2Z		CCS	RBDFAIL
// PORT: Fixed ROM slots 18244.
                    if slot <> 18244 or instruction <> 5015 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 919).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:714
//		TCF	NO2Z		# USING BD-ROLL AND BD HAS FAILED
// PORT: Fixed ROM slots 18245.
                    if slot <> 18245 or instruction <> 5893 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5893, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18246 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:715
//		TCF	+2
// PORT: Fixed ROM slots 18246.
                    if slot <> 18246 or instruction <> 5960 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5960, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18247 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:716
//		TCF	NO2Z		# DITTO
// PORT: Fixed ROM slots 18247.
                        if slot <> 18247 or instruction <> 5893 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5893, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:717
//		INDEX	ZNDX
// PORT: Fixed ROM slots 18248.
                        if slot <> 18248 or instruction <> 21326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21326, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21326, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1062] to agcAotUnit1062@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:718
//		CA	XLNNDX
// PORT: Fixed ROM slots 18249.
    18249, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18250–18250.
function agcAotUnit1063 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:719
//		INDEX	A
// PORT: Fixed ROM slots 18250.
    if slot <> 18250 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1063] to agcAotUnit1063@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:720
//		CA	RTABLE
// PORT: Fixed ROM slots 18251.
    18251, 27824
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18252–18253.
function agcAotUnit1064 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18252 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:721
//		MASK	BDRJETS
// PORT: Fixed ROM slots 18252.
        if slot <> 18252 or instruction <> 30312 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            set words[0] to agcOverflowCorrected(words[0]).
            local fixedOperand is mod(readEffective:call(words, 1640), 32768).
            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:722
//		TCF	NO2Z +1
// PORT: Fixed ROM slots 18253.
        if slot <> 18253 or instruction <> 5894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1064] to agcAotUnit1064@.

// PORT: Physical bank 17. Shared continuation entries, slots 18254–18263.
function agcAotUnit1065 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18258 {
        if slot <= 18255 {
            if slot <= 18254 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:723
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:724
//RBYPASS		CA	RWORD1
// PORT: Fixed ROM slots 18254.
                if slot <> 18254 or instruction <> 13097 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 809).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:725
//		TS	RWORD2
// PORT: Fixed ROM slots 18255.
                if slot <> 18255 or instruction <> 23338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23338, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18256 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:726
//		CAF	ZERO
// PORT: Fixed ROM slots 18256.
                if slot <> 18256 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18257 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:727
//		TS	BLAST
// PORT: Fixed ROM slots 18257.
                    if slot <> 18257 or instruction <> 23343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23343, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:728
//		TCF	PITCHTIM
// PORT: Fixed ROM slots 18258.
                    if slot <> 18258 or instruction <> 5748 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5748, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18260 {
            if slot <= 18259 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:729
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:730
//# Page 1058
// PORT: SOURCE JET_SELECTION_LOGIC.agc:731
//# GENERATION OF THE SECOND YAW (X-TRANS) WORD...YWORD2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:732
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:733
//ASMBLWY		CCS	RBDFAIL
// PORT: Fixed ROM slots 18259.
                if slot <> 18259 or instruction <> 5015 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 919).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:734
//		TCF	FYX2		# IF FAILURE ON BD IGNORE X-TRANSLATION
// PORT: Fixed ROM slots 18260.
                if slot <> 18260 or instruction <> 5978 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5978, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18261 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:735
//		TCF	+2
// PORT: Fixed ROM slots 18261.
                if slot <> 18261 or instruction <> 5975 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5975, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18262 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:736
//		TCF	FYX2
// PORT: Fixed ROM slots 18262.
                    if slot <> 18262 or instruction <> 5978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5978, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:737
//		INDEX	XNDX2
// PORT: Fixed ROM slots 18263.
                    if slot <> 18263 or instruction <> 21324 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21324, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21324, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1065] to agcAotUnit1065@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:738
//		CA	XLNNDX
// PORT: Fixed ROM slots 18264.
    18264, 27488
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18265–18265.
function agcAotUnit1066 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:739
//		INDEX	A
// PORT: Fixed ROM slots 18265.
    if slot <> 18265 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1066] to agcAotUnit1066@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:740
//FYX2		CA	PYTABLE
// PORT: Fixed ROM slots 18266.
    18266, 27544
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18267–18300.
function agcAotUnit1067 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18283 {
        if slot <= 18274 {
            if slot <= 18270 {
                if slot <= 18268 {
                    if slot <= 18267 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:741
//		MASK	YJETS
// PORT: Fixed ROM slots 18267.
                        if slot <> 18267 or instruction <> 30172 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1500), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:742
//		TS	YWORD2
// PORT: Fixed ROM slots 18268.
                        if slot <> 18268 or instruction <> 23342 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23342, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18269 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:743
//		TCF	T6SETUP
// PORT: Fixed ROM slots 18269.
                        if slot <> 18269 or instruction <> 5986 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5986, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:744
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:745
//YBYPASS		CA	YWORD1
// PORT: Fixed ROM slots 18270.
                        if slot <> 18270 or instruction <> 13101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 813).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18272 {
                    if slot <= 18271 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:746
//		TS	YWORD2
// PORT: Fixed ROM slots 18271.
                        if slot <> 18271 or instruction <> 23342 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23342, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:747
//		CAF	ZERO
// PORT: Fixed ROM slots 18272.
                        if slot <> 18272 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    if slot <= 18273 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:748
//		TS	BLAST2
// PORT: Fixed ROM slots 18273.
                        if slot <> 18273 or instruction <> 23347 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23347, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:749
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:750
//# Page 1059
// PORT: SOURCE JET_SELECTION_LOGIC.agc:751
//#		SORT THE JET ON-TIMES
// PORT: SOURCE JET_SELECTION_LOGIC.agc:752
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:753
//# 	AT THIS POINT ALL THE CHANNEL COMMANDS AND JET ON-TIMES HAVE BEEN DETERMINED.  IN SUMMARY THESE ARE-
// PORT: SOURCE JET_SELECTION_LOGIC.agc:754
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:755
//#		RWORD1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:756
//#		RWORD2		BLAST
// PORT: SOURCE JET_SELECTION_LOGIC.agc:757
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:758
//#		PWORD1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:759
//#		PWORD2		BLAST1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:760
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:761
//#		YWORD1
// PORT: SOURCE JET_SELECTION_LOGIC.agc:762
//#		YWORD2		BLAST2
// PORT: SOURCE JET_SELECTION_LOGIC.agc:763
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:764
//# 	IN THIS SECTION THE JET ON-TIMES ARE SORTED AND THE SEQUENCE OF T6 INTERRUPTS IS DETERMINED.  TO FACILITATE
// PORT: SOURCE JET_SELECTION_LOGIC.agc:765
//# THE SORTING PROCESS AND THE T6 PROGRAM, THE VARIABLES BLAST, BLAST1, BLAST2, ARE RESERVED AS DOUBLE PRECISION
// PORT: SOURCE JET_SELECTION_LOGIC.agc:766
//# WORDS.  THE LOWER PART OF THESE WORDS CONTAIN A BRANCH INDEX ASSOCIATED WITH THE ROTATION AXIS OF THE HIGHER
// PORT: SOURCE JET_SELECTION_LOGIC.agc:767
//# ORDER WORD.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:768
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:769
//T6SETUP		CAF	ZERO		# BRANCH INDEX FOR ROLL
// PORT: Fixed ROM slots 18274.
                        if slot <> 18274 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 18278 {
                if slot <= 18276 {
                    if slot <= 18275 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:770
//		TS	BLAST +1
// PORT: Fixed ROM slots 18275.
                        if slot <> 18275 or instruction <> 23344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23344, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:771
//		CAF	FOUR		# BRANCH INDEX FOR PITCH
// PORT: Fixed ROM slots 18276.
                        if slot <> 18276 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18277 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:772
//		TS	BLAST1 +1
// PORT: Fixed ROM slots 18277.
                        if slot <> 18277 or instruction <> 23346 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23346, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:773
//		CAF	ELEVEN		# BRANCH INDEX FOR YAW
// PORT: Fixed ROM slots 18278.
                        if slot <> 18278 or instruction <> 14868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18280 {
                    if slot <= 18279 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:774
//		TS	BLAST2 +1
// PORT: Fixed ROM slots 18279.
                        if slot <> 18279 or instruction <> 23348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23348, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:775
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:776
//		CS	BLAST
// PORT: Fixed ROM slots 18280.
                        if slot <> 18280 or instruction <> 17199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 815).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18281 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:777
//		AD	BLAST1
// PORT: Fixed ROM slots 18281.
                        if slot <> 18281 or instruction <> 25393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 817).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18282 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:778
//		EXTEND
// PORT: Fixed ROM slots 18282.
                            if slot <> 18282 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:779
//		BZMF	DXCHT12		# T1 GR T2
// PORT: Fixed ROM slots 18283.
                            if slot <> 18283 or instruction <> 26495 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26495, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18291 {
            if slot <= 18287 {
                if slot <= 18285 {
                    if slot <= 18284 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:780
//CHECKT23	CS	BLAST1
// PORT: Fixed ROM slots 18284.
                        if slot <> 18284 or instruction <> 17201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 817).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:781
//		AD	BLAST2
// PORT: Fixed ROM slots 18285.
                        if slot <> 18285 or instruction <> 25395 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 819).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18286 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:782
//		EXTEND
// PORT: Fixed ROM slots 18286.
                        if slot <> 18286 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:783
//		BZMF	DXCHT23
// PORT: Fixed ROM slots 18287.
                        if slot <> 18287 or instruction <> 26499 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26499, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18289 {
                    if slot <= 18288 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:784
//CALCDT6		CS	BLAST1
// PORT: Fixed ROM slots 18288.
                        if slot <> 18288 or instruction <> 17201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 817).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:785
//		ADS	BLAST2
// PORT: Fixed ROM slots 18289.
                        if slot <> 18289 or instruction <> 12083 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 819).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18290 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:786
//		CS	BLAST
// PORT: Fixed ROM slots 18290.
                        if slot <> 18290 or instruction <> 17199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 815).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:787
//		ADS	BLAST1		# END OF SORTING PROCEDURE
// PORT: Fixed ROM slots 18291.
                        if slot <> 18291 or instruction <> 12081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 817).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18295 {
                if slot <= 18293 {
                    if slot <= 18292 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:788
//		EXTEND			# RESET T5LOC TO BEGIN PHASE1
// PORT: Fixed ROM slots 18292.
                        if slot <> 18292 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:789
//		DCA	RCS2CADR
// PORT: Fixed ROM slots 18293.
                        if slot <> 18293 or instruction <> 14206 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1918, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18294 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:790
//		DXCH	T5LOC
// PORT: Fixed ROM slots 18294.
                        if slot <> 18294 or instruction <> 22219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:791
//ENDJETS		CS	BIT1		# RESET BIT1 FOR INITIALIZATION OF
// PORT: Fixed ROM slots 18295.
                        if slot <> 18295 or instruction <> 18959 { return choose false if checkOnly else -1. }
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
                if slot <= 18297 {
                    if slot <= 18296 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:792
//		MASK	RCSFLAGS	# T6 PROGRAM
// PORT: Fixed ROM slots 18296.
                        if slot <> 18296 or instruction <> 29505 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:793
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 18297.
                        if slot <> 18297 or instruction <> 23361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23361, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18298 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:794
//		CS	ZERO		# RESET T5PHASE FOR PHASE1
// PORT: Fixed ROM slots 18298.
                        if slot <> 18298 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18299 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:795
//		TS	T5PHASE
// PORT: Fixed ROM slots 18299.
                            if slot <> 18299 or instruction <> 23349 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23349, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:796
//		TCF	RESUME		# RESUME INTERRUPTED PROGRAM
// PORT: Fixed ROM slots 18300.
                            if slot <> 18300 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1067] to agcAotUnit1067@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:797
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:798
//		EBANK=	KMPAC
// PORT: SOURCE JET_SELECTION_LOGIC.agc:799
//RCS2CADR	2CADR	RCSATT
// PORT: Fixed ROM slots 18301 18302.
    18301, 2212, 18302, 34924
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18303–18353.
function agcAotUnit1068 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18327 {
        if slot <= 18314 {
            if slot <= 18308 {
                if slot <= 18305 {
                    if slot <= 18303 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:800
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:801
//# Page 1060
// PORT: SOURCE JET_SELECTION_LOGIC.agc:802
//DXCHT12		DXCH	BLAST
// PORT: Fixed ROM slots 18303.
                        if slot <> 18303 or instruction <> 22320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18304 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:803
//		DXCH	BLAST1
// PORT: Fixed ROM slots 18304.
                            if slot <> 18304 or instruction <> 22322 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 818, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:804
//		DXCH	BLAST
// PORT: Fixed ROM slots 18305.
                            if slot <> 18305 or instruction <> 22320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18306 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:805
//		TCF	CHECKT23
// PORT: Fixed ROM slots 18306.
                        if slot <> 18306 or instruction <> 5996 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5996, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18307 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:806
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:807
//DXCHT23		DXCH	BLAST1
// PORT: Fixed ROM slots 18307.
                            if slot <> 18307 or instruction <> 22322 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 818, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:808
//		DXCH	BLAST2
// PORT: Fixed ROM slots 18308.
                            if slot <> 18308 or instruction <> 22324 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 820, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18311 {
                    if slot <= 18309 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:809
//		DXCH	BLAST1
// PORT: Fixed ROM slots 18309.
                        if slot <> 18309 or instruction <> 22322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 818, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18310 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:810
//		CS	BLAST
// PORT: Fixed ROM slots 18310.
                            if slot <> 18310 or instruction <> 17199 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 815).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:811
//		AD	BLAST1
// PORT: Fixed ROM slots 18311.
                            if slot <> 18311 or instruction <> 25393 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 817).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18312 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:812
//		EXTEND
// PORT: Fixed ROM slots 18312.
                        if slot <> 18312 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18313 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:813
//		BZMF	+2
// PORT: Fixed ROM slots 18313.
                            if slot <> 18313 or instruction <> 26507 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26507, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:814
//		TCF	CALCDT6
// PORT: Fixed ROM slots 18314.
                            if slot <> 18314 or instruction <> 6000 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6000, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18320 {
                if slot <= 18317 {
                    if slot <= 18315 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:815
//		DXCH	BLAST
// PORT: Fixed ROM slots 18315.
                        if slot <> 18315 or instruction <> 22320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18316 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:816
//		DXCH	BLAST1
// PORT: Fixed ROM slots 18316.
                            if slot <> 18316 or instruction <> 22322 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 818, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:817
//		DXCH	BLAST
// PORT: Fixed ROM slots 18317.
                            if slot <> 18317 or instruction <> 22320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18318 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:818
//		TCF	CALCDT6
// PORT: Fixed ROM slots 18318.
                        if slot <> 18318 or instruction <> 6000 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6000, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18319 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:819
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:820
//# Page 1061
// PORT: SOURCE JET_SELECTION_LOGIC.agc:821
//# T6 PROGRAM AND CHANNEL SETUP
// PORT: SOURCE JET_SELECTION_LOGIC.agc:822
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:823
//		BANK	21
// PORT: SOURCE JET_SELECTION_LOGIC.agc:824
//		SETLOC	DAPS5
// PORT: SOURCE JET_SELECTION_LOGIC.agc:825
//		BANK
// PORT: SOURCE JET_SELECTION_LOGIC.agc:826
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:827
//T6START		LXCH	BANKRUPT
// PORT: Fixed ROM slots 18319.
                            if slot <> 18319 or instruction <> 9230 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 14, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:828
//		EXTEND
// PORT: Fixed ROM slots 18320.
                            if slot <> 18320 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18323 {
                    if slot <= 18321 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:829
//		QXCH	QRUPT
// PORT: Fixed ROM slots 18321.
                        if slot <> 18321 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18322 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:830
//		CCS	TIME6		# CHECK TO SEE IF TIME6 WAS RESET
// PORT: Fixed ROM slots 18322.
                            if slot <> 18322 or instruction <> 4121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 25).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:831
//		TCF	RESUME		# AFTER T6RUPT OCCURED(IN T5RUPT)
// PORT: Fixed ROM slots 18323.
                            if slot <> 18323 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18325 {
                        if slot <= 18324 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:832
//		TCF	+2		# IF SO WAIT FOR NEXT T6RUPT BEFORE
// PORT: Fixed ROM slots 18324.
                            if slot <> 18324 or instruction <> 6038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:833
//		TCF	RESUME		# TAKING ACTION
// PORT: Fixed ROM slots 18325.
                            if slot <> 18325 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18326 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:834
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:835
//		CS	RCSFLAGS
// PORT: Fixed ROM slots 18326.
                            if slot <> 18326 or instruction <> 17217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 833).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:836
//		MASK	BIT1		# IF BIT1 IS 0 RESET TO 1
// PORT: Fixed ROM slots 18327.
                            if slot <> 18327 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18340 {
            if slot <= 18333 {
                if slot <= 18330 {
                    if slot <= 18328 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:837
//		EXTEND			# AND INITIALIZE CHANNEL
// PORT: Fixed ROM slots 18328.
                        if slot <> 18328 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18329 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:838
//		BZF	T6RUPTOR
// PORT: Fixed ROM slots 18329.
                            if slot <> 18329 or instruction <> 6050 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6050, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:839
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 18330.
                            if slot <> 18330 or instruction <> 12097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18331 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:840
//		CA	RWORD1
// PORT: Fixed ROM slots 18331.
                        if slot <> 18331 or instruction <> 13097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 809).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18332 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:841
//		EXTEND			# INITIALIZE CHANNELS 5,6 WITH WORD1
// PORT: Fixed ROM slots 18332.
                            if slot <> 18332 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:842
//		WRITE	CHAN6
// PORT: Fixed ROM slots 18333.
                            if slot <> 18333 or instruction <> 518 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18336 {
                    if slot <= 18334 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:843
//		CA	PWORD1
// PORT: Fixed ROM slots 18334.
                        if slot <> 18334 or instruction <> 13099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 811).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18335 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:844
//		AD	YWORD1
// PORT: Fixed ROM slots 18335.
                            if slot <> 18335 or instruction <> 25389 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 813).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:845
//		EXTEND
// PORT: Fixed ROM slots 18336.
                            if slot <> 18336 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18338 {
                        if slot <= 18337 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:846
//		WRITE	CHAN5
// PORT: Fixed ROM slots 18337.
                            if slot <> 18337 or instruction <> 517 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:847
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:848
//T6RUPTOR	CCS	BLAST
// PORT: Fixed ROM slots 18338.
                            if slot <> 18338 or instruction <> 4911 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 815).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18339 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:849
//		TCF	ZBLAST		# ZERO BLAST1
// PORT: Fixed ROM slots 18339.
                            if slot <> 18339 or instruction <> 6098 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6098, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:850
//		TCF	REPLACE		# REPLACE WORD1
// PORT: Fixed ROM slots 18340.
                            if slot <> 18340 or instruction <> 6065 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6065, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18346 {
                if slot <= 18343 {
                    if slot <= 18341 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:851
//		TCF	+2
// PORT: Fixed ROM slots 18341.
                        if slot <> 18341 or instruction <> 6055 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6055, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18342 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:852
//		TCF	REPLACE
// PORT: Fixed ROM slots 18342.
                            if slot <> 18342 or instruction <> 6065 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6065, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:853
//T6L1		CCS	BLAST1
// PORT: Fixed ROM slots 18343.
                            if slot <> 18343 or instruction <> 4913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 817).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18344 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:854
//		TCF	ZBLAST1
// PORT: Fixed ROM slots 18344.
                        if slot <> 18344 or instruction <> 6101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6101, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18345 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:855
//		TCF	REPLACE1
// PORT: Fixed ROM slots 18345.
                            if slot <> 18345 or instruction <> 6070 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6070, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:856
//		TCF	+2
// PORT: Fixed ROM slots 18346.
                            if slot <> 18346 or instruction <> 6060 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6060, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18349 {
                    if slot <= 18347 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:857
//		TCF	REPLACE1
// PORT: Fixed ROM slots 18347.
                        if slot <> 18347 or instruction <> 6070 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6070, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18348 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:858
//T6L2		CCS	BLAST2
// PORT: Fixed ROM slots 18348.
                            if slot <> 18348 or instruction <> 4915 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 819).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:859
//		TCF	ZBLAST2
// PORT: Fixed ROM slots 18349.
                            if slot <> 18349 or instruction <> 6104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18351 {
                        if slot <= 18350 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:860
//		TCF	REPLACE2
// PORT: Fixed ROM slots 18350.
                            if slot <> 18350 or instruction <> 6075 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6075, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:861
//		TCF	RESUME
// PORT: Fixed ROM slots 18351.
                            if slot <> 18351 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18352 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:862
//		TCF	REPLACE2
// PORT: Fixed ROM slots 18352.
                            if slot <> 18352 or instruction <> 6075 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6075, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:863
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:864
//REPLACE		INDEX	BLAST +1
// PORT: Fixed ROM slots 18353.
                            if slot <> 18353 or instruction <> 21296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21296, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21296, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1068] to agcAotUnit1068@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:865
//		TC	REPLACER
// PORT: Fixed ROM slots 18354.
    18354, 3968
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18355–18358.
function agcAotUnit1069 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18356 {
        if slot <= 18355 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:866
//		CS	ONE
// PORT: Fixed ROM slots 18355.
            if slot <> 18355 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:867
//		TS	BLAST
// PORT: Fixed ROM slots 18356.
            if slot <> 18356 or instruction <> 23343 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23343, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18357 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:868
//		TCF	T6L1
// PORT: Fixed ROM slots 18357.
            if slot <> 18357 or instruction <> 6055 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6055, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:869
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:870
//REPLACE1	INDEX	BLAST1 +1
// PORT: Fixed ROM slots 18358.
            if slot <> 18358 or instruction <> 21298 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21298, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21298, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1069] to agcAotUnit1069@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:871
//# Page 1062
// PORT: SOURCE JET_SELECTION_LOGIC.agc:872
//		TC	REPLACER
// PORT: Fixed ROM slots 18359.
    18359, 3968
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18360–18363.
function agcAotUnit1070 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18361 {
        if slot <= 18360 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:873
//		CS	ONE
// PORT: Fixed ROM slots 18360.
            if slot <> 18360 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:874
//		TS	BLAST1
// PORT: Fixed ROM slots 18361.
            if slot <> 18361 or instruction <> 23345 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23345, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18362 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:875
//		TCF	T6L2
// PORT: Fixed ROM slots 18362.
            if slot <> 18362 or instruction <> 6060 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6060, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:876
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:877
//REPLACE2	INDEX	BLAST2 +1
// PORT: Fixed ROM slots 18363.
            if slot <> 18363 or instruction <> 21300 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21300, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21300, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1070] to agcAotUnit1070@.

agcAotInstallSourceRope(list(
// PORT: SOURCE JET_SELECTION_LOGIC.agc:878
//		TC	REPLACER
// PORT: Fixed ROM slots 18364.
    18364, 3968
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18365–18388.
function agcAotUnit1071 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18376 {
        if slot <= 18370 {
            if slot <= 18367 {
                if slot <= 18365 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:879
//		CS	ONE
// PORT: Fixed ROM slots 18365.
                    if slot <> 18365 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18366 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:880
//		TS	BLAST2
// PORT: Fixed ROM slots 18366.
                        if slot <> 18366 or instruction <> 23347 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23347, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:881
//		TCF	RESUME
// PORT: Fixed ROM slots 18367.
                        if slot <> 18367 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18368 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:882
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:883
//REPLACER	CA	RWORD2
// PORT: Fixed ROM slots 18368.
                    if slot <> 18368 or instruction <> 13098 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 810).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18369 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:884
//		EXTEND			# INITIALIZE CHANNELS 5,6 WITH WORD2
// PORT: Fixed ROM slots 18369.
                        if slot <> 18369 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:885
//		WRITE	CHAN6
// PORT: Fixed ROM slots 18370.
                        if slot <> 18370 or instruction <> 518 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18373 {
                if slot <= 18371 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:886
//		TC	Q
// PORT: Fixed ROM slots 18371.
                    if slot <> 18371 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18372 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:887
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:888
//REPLACEP	CA	YJETS
// PORT: Fixed ROM slots 18372.
                        if slot <> 18372 or instruction <> 13788 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1500), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:889
//		EXTEND
// PORT: Fixed ROM slots 18373.
                        if slot <> 18373 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18374 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:890
//		RAND	CHAN5
// PORT: Fixed ROM slots 18374.
                    if slot <> 18374 or instruction <> 1029 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18375 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:891
//		AD	PWORD2
// PORT: Fixed ROM slots 18375.
                        if slot <> 18375 or instruction <> 25388 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 812).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:892
//		EXTEND
// PORT: Fixed ROM slots 18376.
                        if slot <> 18376 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18382 {
            if slot <= 18379 {
                if slot <= 18377 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:893
//		WRITE	CHAN5
// PORT: Fixed ROM slots 18377.
                    if slot <> 18377 or instruction <> 517 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18378 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:894
//		TC	Q
// PORT: Fixed ROM slots 18378.
                        if slot <> 18378 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:895
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:896
//REPLACEY	CA	PJETS
// PORT: Fixed ROM slots 18379.
                        if slot <> 18379 or instruction <> 13787 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1499), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18380 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:897
//		EXTEND
// PORT: Fixed ROM slots 18380.
                    if slot <> 18380 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18381 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:898
//		RAND	CHAN5
// PORT: Fixed ROM slots 18381.
                        if slot <> 18381 or instruction <> 1029 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 5, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:899
//		AD	YWORD2
// PORT: Fixed ROM slots 18382.
                        if slot <> 18382 or instruction <> 25390 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 814).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18385 {
                if slot <= 18383 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:900
//		EXTEND
// PORT: Fixed ROM slots 18383.
                    if slot <> 18383 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18384 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:901
//		WRITE	CHAN5
// PORT: Fixed ROM slots 18384.
                        if slot <> 18384 or instruction <> 517 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:902
//		TC	Q
// PORT: Fixed ROM slots 18385.
                        if slot <> 18385 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18386 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:903
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:904
//ZBLAST		CAF	ZERO
// PORT: Fixed ROM slots 18386.
                    if slot <> 18386 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18387 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:905
//		XCH	BLAST
// PORT: Fixed ROM slots 18387.
                        if slot <> 18387 or instruction <> 24367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 815, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:906
//		TCF	ENABT6
// PORT: Fixed ROM slots 18388.
                        if slot <> 18388 or instruction <> 6106 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6106, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1071] to agcAotUnit1071@.

// PORT: Physical bank 17. Shared continuation entries, slots 18389–18398.
function agcAotUnit1072 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18393 {
        if slot <= 18390 {
            if slot <= 18389 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:907
//ZBLAST1		CAF	ZERO
// PORT: Fixed ROM slots 18389.
                if slot <> 18389 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:908
//		XCH	BLAST1
// PORT: Fixed ROM slots 18390.
                if slot <> 18390 or instruction <> 24369 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 817, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18391 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:909
//		TCF	ENABT6
// PORT: Fixed ROM slots 18391.
                if slot <> 18391 or instruction <> 6106 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6106, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18392 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:910
//ZBLAST2		CAF	ZERO
// PORT: Fixed ROM slots 18392.
                    if slot <> 18392 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:911
//		XCH	BLAST2
// PORT: Fixed ROM slots 18393.
                    if slot <> 18393 or instruction <> 24371 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 819, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18395 {
            if slot <= 18394 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:912
//ENABT6		TS	TIME6
// PORT: Fixed ROM slots 18394.
                if slot <> 18394 or instruction <> 22553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:913
//		CAF	NEGMAX
// PORT: Fixed ROM slots 18395.
                if slot <> 18395 or instruction <> 14849 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18396 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:914
//		EXTEND
// PORT: Fixed ROM slots 18396.
                if slot <> 18396 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18397 {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:915
//		WOR	CHAN13		# ENABLE T6RUPT
// PORT: Fixed ROM slots 18397.
                    if slot <> 18397 or instruction <> 2571 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE JET_SELECTION_LOGIC.agc:916
//		TCF	RESUME
// PORT: Fixed ROM slots 18398.
                    if slot <> 18398 or instruction <> 6875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1072] to agcAotUnit1072@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE JET_SELECTION_LOGIC.agc:917
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:918
//# END OF T6 INTERRUPT
// PORT: SOURCE JET_SELECTION_LOGIC.agc:919
//
// PORT: SOURCE JET_SELECTION_LOGIC.agc:920
//ENDSLECT	EQUALS
