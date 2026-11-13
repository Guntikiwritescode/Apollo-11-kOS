// EXECUTIVE.agc
// bank 02, slots 4700-4704
function agcAotUnit186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4701 {
        if slot <= 4700 {
// EXECUTIVE.agc:1
//# Copyright:	Public domain.
// EXECUTIVE.agc:2
//# Filename:	EXECUTIVE.agc
// EXECUTIVE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// EXECUTIVE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// EXECUTIVE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// EXECUTIVE.agc:6
//# Assembler:	yaYUL
// EXECUTIVE.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// EXECUTIVE.agc:8
//# Website:	www.ibiblio.org/apollo.
// EXECUTIVE.agc:9
//# Pages:	1208-1220
// EXECUTIVE.agc:10
//# Mod history:	2009-05-14 RSB	Adapted from the Colossus249/ file of the
// EXECUTIVE.agc:11
//#				same name, using Comanche055 page images.
// EXECUTIVE.agc:12
//#
// EXECUTIVE.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// EXECUTIVE.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// EXECUTIVE.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// EXECUTIVE.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// EXECUTIVE.agc:17
//# consequent reduction in image quality as well) are available online at
// EXECUTIVE.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// EXECUTIVE.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// EXECUTIVE.agc:20
//# (much) higher-quality images which Paul actually created.
// EXECUTIVE.agc:21
//#
// EXECUTIVE.agc:22
//# Notations on the hardcopy document read, in part:
// EXECUTIVE.agc:23
//#
// EXECUTIVE.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// EXECUTIVE.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// EXECUTIVE.agc:26
//#
// EXECUTIVE.agc:27
//#	This AGC program shall also be referred to as
// EXECUTIVE.agc:28
//#			Colossus 2A
// EXECUTIVE.agc:29
//
// EXECUTIVE.agc:30
//# Page 1208
// EXECUTIVE.agc:31
//		BLOCK	02
// EXECUTIVE.agc:32
//
// EXECUTIVE.agc:33
//# TO ENTER A JOB REQUEST REQUIRING NO VAC AREA:
// EXECUTIVE.agc:34
//
// EXECUTIVE.agc:35
//		COUNT	02/EXEC
// EXECUTIVE.agc:36
//
// EXECUTIVE.agc:37
//NOVAC		INHINT
// slot 4700
            if slot <> 4700 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:38
//		AD	FAKEPRET	# LOC(MPAC +6) - LOC(QPRET)
// slot 4701
            if slot <> 4701 or instruction <> 27286 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2710), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4702 {
// EXECUTIVE.agc:39
//		TS	NEWPRIO		# PRIORITY OF NEW JOB + NOVAC C(FIXLOC)
// slot 4702
            if slot <> 4702 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4703 {
// EXECUTIVE.agc:40
//
// EXECUTIVE.agc:41
//		EXTEND
// slot 4703
                if slot <> 4703 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:42
//		INDEX	Q		# Q WILL BE UNDISTURBED THROUGHOUT.
// slot 4704
                if slot <> 4704 or instruction <> 20482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[186] to agcAotUnit186@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:43
//		DCA	0		# 2CADR OF JOB ENTERED.
// slot 4705
    4705, 24578
)).

// bank 02, slots 4706-4714
function agcAotUnit187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4709 {
        if slot <= 4707 {
            if slot <= 4706 {
// EXECUTIVE.agc:44
//		DXCH	NEWLOC
// slot 4706
                if slot <> 4706 or instruction <> 21558 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:45
//		CAF	EXECBANK
// slot 4707
                if slot <> 4707 or instruction <> 14997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4708 {
// EXECUTIVE.agc:46
//		XCH	FBANK
// slot 4708
                if slot <> 4708 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:47
//		TS	EXECTEM1
// slot 4709
                if slot <> 4709 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4711 {
            if slot <= 4710 {
// EXECUTIVE.agc:48
//		TCF	NOVAC2		# ENTER EXECUTIVE BANK.
// slot 4710
                if slot <> 4710 or instruction <> 5544 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5544, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:49
//
// EXECUTIVE.agc:50
//# TO ENTER A JOB REQUEST REQUIRING A VAC AREA - E.G., ALL (PARTIALLY) INTERPRETIVE JOBS.
// EXECUTIVE.agc:51
//
// EXECUTIVE.agc:52
//FINDVAC		INHINT
// slot 4711
                if slot <> 4711 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4712 {
// EXECUTIVE.agc:53
//		TS	NEWPRIO
// slot 4712
                if slot <> 4712 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4713 {
// EXECUTIVE.agc:54
//		EXTEND
// slot 4713
                    if slot <> 4713 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:55
//		INDEX	Q
// slot 4714
                    if slot <> 4714 or instruction <> 20482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[187] to agcAotUnit187@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:56
//		DCA	0
// slot 4715
    4715, 24578
)).

// bank 02, slots 4716-4756
function agcAotUnit188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4735 {
        if slot <= 4725 {
            if slot <= 4720 {
                if slot <= 4717 {
                    if slot <= 4716 {
// EXECUTIVE.agc:57
//SPVACIN		DXCH	NEWLOC
// slot 4716
                        if slot <> 4716 or instruction <> 21558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:58
//		CAF	EXECBANK
// slot 4717
                        if slot <> 4717 or instruction <> 14997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4718 {
// EXECUTIVE.agc:59
//		XCH	FBANK
// slot 4718
                        if slot <> 4718 or instruction <> 23556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 4, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4719 {
// EXECUTIVE.agc:60
//		TCF	FINDVAC2	# OFF TO EXECUTIVE SWITCHED-BANK.
// slot 4719
                            if slot <> 4719 or instruction <> 5526 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5526, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:61
//
// EXECUTIVE.agc:62
//# TO ENTER A FINDVAC WITH THE PRIORITY IN NEWPRIO TO THE 2CADR ARRIVING IN A AND L:
// EXECUTIVE.agc:63
//# USERS OF SPVAC MUST INHINT BEFORE STORING IN NEWPRIO.
// EXECUTIVE.agc:64
//
// EXECUTIVE.agc:65
//SPVAC		XCH	Q
// slot 4720
                            if slot <> 4720 or instruction <> 23554 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 2, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4722 {
                    if slot <= 4721 {
// EXECUTIVE.agc:66
//		AD	NEG2
// slot 4721
                        if slot <> 4721 or instruction <> 28621 { return choose false if checkOnly else -1. }
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
// EXECUTIVE.agc:67
//		XCH	Q
// slot 4722
                        if slot <> 4722 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4723 {
// EXECUTIVE.agc:68
//		TCF	SPVACIN
// slot 4723
                        if slot <> 4723 or instruction <> 6764 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6764, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4724 {
// EXECUTIVE.agc:69
//
// EXECUTIVE.agc:70
//# TO SUSPEND A BASIC JOB SO A HIGHER PRIORITY JOB MAY BE SERVICED:
// EXECUTIVE.agc:71
//
// EXECUTIVE.agc:72
//CHANG1		LXCH	Q
// slot 4724
                            if slot <> 4724 or instruction <> 9218 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 2, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:73
//		CAF	EXECBANK
// slot 4725
                            if slot <> 4725 or instruction <> 14997 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 4730 {
                if slot <= 4727 {
                    if slot <= 4726 {
// EXECUTIVE.agc:74
//		XCH	BBANK
// slot 4726
                        if slot <> 4726 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:75
//		TCF	CHANJOB
// slot 4727
                        if slot <> 4727 or instruction <> 5591 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5591, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4728 {
// EXECUTIVE.agc:76
//
// EXECUTIVE.agc:77
//# TO SUSPEND AN INTERPRETIVE JOB:
// EXECUTIVE.agc:78
//
// EXECUTIVE.agc:79
//CHANG2		CS	LOC		# NEGATIVE LOC SHOWS JOB = INTERPRETIVE.
// slot 4728
                        if slot <> 4728 or instruction <> 16500 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 116).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4729 {
// EXECUTIVE.agc:80
//# ITRACE (4) REFERS TO "CHANG2".
// EXECUTIVE.agc:81
//# Page 1209
// EXECUTIVE.agc:82
//		TS	L
// slot 4729
                            if slot <> 4729 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:83
//	+2	CAF	EXECBANK
// slot 4730
                            if slot <> 4730 or instruction <> 14997 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4732 {
                    if slot <= 4731 {
// EXECUTIVE.agc:84
// 		TS	BBANK
// slot 4731
                        if slot <> 4731 or instruction <> 22534 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22534, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:85
//		TCF	CHANJOB -1
// slot 4732
                        if slot <> 4732 or instruction <> 5590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4733 {
// EXECUTIVE.agc:86
//
// EXECUTIVE.agc:87
//# Page 1210
// EXECUTIVE.agc:88
//# TO VOLUNTARILY SUSPEND A JOB UNTIL THE COMPLETION OF SOME ANTICIPATED EVENT (I/O EVENT ETC.):
// EXECUTIVE.agc:89
//
// EXECUTIVE.agc:90
//JOBSLEEP	TS	LOC
// slot 4733
                        if slot <> 4733 or instruction <> 22644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4734 {
// EXECUTIVE.agc:91
//		CAF	EXECBANK
// slot 4734
                            if slot <> 4734 or instruction <> 14997 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:92
//		TS	FBANK
// slot 4735
                            if slot <> 4735 or instruction <> 22532 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22532, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 4745 {
            if slot <= 4740 {
                if slot <= 4737 {
                    if slot <= 4736 {
// EXECUTIVE.agc:93
//		TCF	JOBSLP1
// slot 4736
                        if slot <> 4736 or instruction <> 5647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:94
//
// EXECUTIVE.agc:95
//# TO AWAKEN A JOB PUT TO SLEEP IN THE ABOVE FASHION:
// EXECUTIVE.agc:96
//
// EXECUTIVE.agc:97
//JOBWAKE		INHINT
// slot 4737
                        if slot <> 4737 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4738 {
// EXECUTIVE.agc:98
//		TS	NEWLOC
// slot 4738
                        if slot <> 4738 or instruction <> 22581 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22581, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4739 {
// EXECUTIVE.agc:99
//		CS	TWO		# EXIT IS VIA FINDVAC/NOVAC PROCEDURES.
// slot 4739
                            if slot <> 4739 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:100
//		ADS	Q
// slot 4740
                            if slot <> 4740 or instruction <> 11266 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4742 {
                    if slot <= 4741 {
// EXECUTIVE.agc:101
//		CAF	EXECBANK
// slot 4741
                        if slot <> 4741 or instruction <> 14997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:102
//		XCH	FBANK
// slot 4742
                        if slot <> 4742 or instruction <> 23556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 4, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4743 {
// EXECUTIVE.agc:103
//		TCF	JOBWAKE2
// slot 4743
                        if slot <> 4743 or instruction <> 5668 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5668, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4744 {
// EXECUTIVE.agc:104
//
// EXECUTIVE.agc:105
//# TO CHANGE THE PRIORITY OF A JOB CURRENTLY UNDER EXECUTION:
// EXECUTIVE.agc:106
//
// EXECUTIVE.agc:107
//PRIOCHNG	INHINT			# NEW PRIORITY ARRIVES IN A. RETURNS TO
// slot 4744
                            if slot <> 4744 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:108
//		TS	NEWPRIO		# CALLER AS SOON AS NEW JOB PRIORITY IS
// slot 4745
                            if slot <> 4745 or instruction <> 22579 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22579, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 4750 {
                if slot <= 4747 {
                    if slot <= 4746 {
// EXECUTIVE.agc:109
//		CAF	EXECBANK	# HIGHEST. PREPARE FOR POSSIBLE BASIC-
// slot 4746
                        if slot <> 4746 or instruction <> 14997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:110
//		XCH	BBANK		# STYLE CHANGE-JOB.
// slot 4747
                        if slot <> 4747 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4748 {
// EXECUTIVE.agc:111
//		TS	BANKSET
// slot 4748
                        if slot <> 4748 or instruction <> 22645 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22645, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4749 {
// EXECUTIVE.agc:112
//		CA	Q
// slot 4749
                            if slot <> 4749 or instruction <> 12290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:113
//		TCF	PRIOCH2
// slot 4750
                            if slot <> 4750 or instruction <> 5707 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5707, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4753 {
                    if slot <= 4751 {
// EXECUTIVE.agc:114
//
// EXECUTIVE.agc:115
//# TO REMOVE A JOB FROM EXECUTIVE CONSIDERATIONS:
// EXECUTIVE.agc:116
//
// EXECUTIVE.agc:117
//ENDOFJOB	CAF	EXECBANK
// slot 4751
                        if slot <> 4751 or instruction <> 14997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2709), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4752 {
// EXECUTIVE.agc:118
//		TS	FBANK
// slot 4752
                            if slot <> 4752 or instruction <> 22532 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22532, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:119
//		TCF	ENDJOB1
// slot 4753
                            if slot <> 4753 or instruction <> 5716 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5716, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4754 {
// EXECUTIVE.agc:120
//
// EXECUTIVE.agc:121
//ENDFIND		CA	EXECTEM1	# RETURN TO CALLER AFTER JOB ENTRY
// slot 4754
                        if slot <> 4754 or instruction <> 12337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 49).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4755 {
// EXECUTIVE.agc:122
//		TS	FBANK		# COMPLETE.
// slot 4755
                            if slot <> 4755 or instruction <> 22532 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22532, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:123
//		TCF	Q+2
// slot 4756
                            if slot <> 4756 or instruction <> 7624 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7624, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[188] to agcAotUnit188@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:124
//EXECBANK	CADR	FINDVAC2
// slot 4757
    4757, 2860,
// EXECUTIVE.agc:125
//
// EXECUTIVE.agc:126
//FAKEPRET	ADRES	MPAC -36D	# LOC(MPAC +6) - LOC(QPRET)
// slot 4758
    4758, 144
)).

// bank 01, slots 3478-3489
function agcAotUnit75 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3483 {
        if slot <= 3480 {
            if slot <= 3478 {
// EXECUTIVE.agc:127
//
// EXECUTIVE.agc:128
//# Page 1211
// EXECUTIVE.agc:129
//# LOCATE AN AVAILABLE VAC AREA.
// EXECUTIVE.agc:130
//
// EXECUTIVE.agc:131
//		BANK	01
// EXECUTIVE.agc:132
//		COUNT	01/EXEC
// EXECUTIVE.agc:133
//
// EXECUTIVE.agc:134
//FINDVAC2	TS	EXECTEM1	# (SAVE CALLER'S BANK FIRST.)
// slot 3478
                if slot <> 3478 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3479 {
// EXECUTIVE.agc:135
//		CCS	VAC1USE
// slot 3479
                    if slot <> 3479 or instruction <> 4352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 256).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:136
//		TCF	VACFOUND
// slot 3480
                    if slot <> 3480 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3481 {
// EXECUTIVE.agc:137
//		CCS	VAC2USE
// slot 3481
                if slot <> 3481 or instruction <> 4396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 300).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3482 {
// EXECUTIVE.agc:138
//		TCF	VACFOUND
// slot 3482
                    if slot <> 3482 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:139
//		CCS	VAC3USE
// slot 3483
                    if slot <> 3483 or instruction <> 4440 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 344).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3486 {
            if slot <= 3484 {
// EXECUTIVE.agc:140
//		TCF	VACFOUND
// slot 3484
                if slot <> 3484 or instruction <> 5539 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5539, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3485 {
// EXECUTIVE.agc:141
//		CCS	VAC4USE
// slot 3485
                    if slot <> 3485 or instruction <> 4484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 388).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:142
//		TCF	VACFOUND
// slot 3486
                    if slot <> 3486 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3487 {
// EXECUTIVE.agc:143
//		CCS	VAC5USE
// slot 3487
                if slot <> 3487 or instruction <> 4528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 432).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3488 {
// EXECUTIVE.agc:144
//		TCF	VACFOUND
// slot 3488
                    if slot <> 3488 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:145
//		TC	BAILOUT
// slot 3489
                    if slot <> 3489 or instruction <> 4077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[75] to agcAotUnit75@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:146
//		OCT	1201		# NO VAC AREAS.
// slot 3490
    3490, 1282
)).

// bank 01, slots 3491-3493
function agcAotUnit76 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3491 {
// EXECUTIVE.agc:147
//
// EXECUTIVE.agc:148
//VACFOUND	AD	TWO		# RESERVE THIS VAC AREA BY STORING A ZERO
// slot 3491
        if slot <> 3491 or instruction <> 27150 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3492 {
// EXECUTIVE.agc:149
//		ZL			# IN ITS VAC USE REGISTER AND STORE THE
// slot 3492
            if slot <> 3492 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:150
//		INDEX	A		# ADDRESS OF THE FIRST WORD OF IT IN THE
// slot 3493
            if slot <> 3493 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[76] to agcAotUnit76@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:151
//		LXCH	0 -1		# LOW NINE BITS OF THE PRIORITY WORD.
// slot 3494
    3494, 18430
)).

// bank 01, slots 3495-3500
function agcAotUnit77 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3497 {
        if slot <= 3495 {
// EXECUTIVE.agc:152
//		ADS	NEWPRIO
// slot 3495
            if slot <> 3495 or instruction <> 11315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 51).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3496 {
// EXECUTIVE.agc:153
//
// EXECUTIVE.agc:154
//NOVAC2		CAF	ZERO		# NOVAC ENTERS HERE. FIND A CORE SET.
// slot 3496
                if slot <> 3496 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:155
//		TS	LOCCTR
// slot 3497
                if slot <> 3497 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3498 {
// EXECUTIVE.agc:156
//		CAF	NO.CORES	# SEVEN SETS OF ELEVEN REGISTERS EACH.
// slot 3498
            if slot <> 3498 or instruction <> 13743 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1455), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3499 {
// EXECUTIVE.agc:157
//NOVAC3		TS	EXECTEM2
// slot 3499
                if slot <> 3499 or instruction <> 22578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:158
//		INDEX	LOCCTR
// slot 3500
                if slot <> 3500 or instruction <> 20532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[77] to agcAotUnit77@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:159
//		CCS	PRIORITY	# EACH PRIORITY REGISTER CONTAINS -0 IF
// slot 3501
    3501, 8430
)).

// bank 01, slots 3502-3502
function agcAotUnit78 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXECUTIVE.agc:160
//		TCF	NEXTCORE	# THE CORRESPONDING CORE SET IS AVAILABLE.
// slot 3502
    if slot <> 3502 or instruction <> 5583 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5583, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[78] to agcAotUnit78@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:161
//NO.CORES	DEC	6
// slot 3503
    3503, 12
)).

// bank 01, slots 3504-3506
function agcAotUnit79 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3504 {
// EXECUTIVE.agc:162
//		TCF	NEXTCORE	# AN ACTIVE JOB HAS A POSITIVE PRIORITY
// slot 3504
        if slot <> 3504 or instruction <> 5583 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5583, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3505 {
// EXECUTIVE.agc:163
//					# BUT A DORMANT JOB'S PRIORITY IS NEGATIVE
// EXECUTIVE.agc:164
//
// EXECUTIVE.agc:165
//# Page 1212
// EXECUTIVE.agc:166
//CORFOUND	CA	NEWPRIO		# SET THE PRIORITY OF THIS JOB IN THE CORE
// slot 3505
            if slot <> 3505 or instruction <> 12339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 51).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:167
//		INDEX	LOCCTR		# SET'S PRIORITY REGISTER AND SET THE
// slot 3506
            if slot <> 3506 or instruction <> 20532 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[79] to agcAotUnit79@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:168
//		TS	PRIORITY	# JOB'S PUSH-DOWN POINTER AT THE BEGINNING
// slot 3507
    3507, 45294
)).

// bank 01, slots 3508-3509
function agcAotUnit80 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3508 {
// EXECUTIVE.agc:169
//		MASK	LOW9		# OF THE WORK AREA AND OVERFLOW INDICATOR
// slot 3508
        if slot <> 3508 or instruction <> 31270 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            set words[0] to agcOverflowCorrected(words[0]).
            local fixedOperand is mod(readEffective:call(words, 2598), 32768).
            if fixedOperand = 511 {
                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
            } else {
                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
            }
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXECUTIVE.agc:170
//		INDEX	LOCCTR
// slot 3509
        if slot <> 3509 or instruction <> 20532 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[80] to agcAotUnit80@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:171
//		TS	PUSHLOC		# OFF TO PREPARE FOR INTERPRETIVE PROGRAMS
// slot 3510
    3510, 45292
)).

// bank 01, slots 3511-3525
function agcAotUnit81 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3517 {
        if slot <= 3513 {
            if slot <= 3511 {
// EXECUTIVE.agc:172
//
// EXECUTIVE.agc:173
//		CCS	LOCCTR		# IF CORE SET ZERO IS BEING LOADED, SET UP
// slot 3511
                if slot <> 3511 or instruction <> 4148 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3512 {
// EXECUTIVE.agc:174
//		TCF	SETLOC		# OVFIND AND FIXLOC IMMEDIATELY.
// slot 3512
                    if slot <> 3512 or instruction <> 5572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5572, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:175
//		TS	OVFIND
// slot 3513
                    if slot <> 3513 or instruction <> 22609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22609, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3515 {
                if slot <= 3514 {
// EXECUTIVE.agc:176
//		CA	PUSHLOC
// slot 3514
                    if slot <> 3514 or instruction <> 12406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 118).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:177
//		TS	FIXLOC
// slot 3515
                    if slot <> 3515 or instruction <> 22608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22608, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3516 {
// EXECUTIVE.agc:178
//
// EXECUTIVE.agc:179
//SPECTEST	CCS	NEWJOB		# SEE IF ANY ACTIVE JOBS WAITING (RARE).
// slot 3516
                    if slot <> 3516 or instruction <> 4151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:180
//		TCF	SETLOC		# MUST BE AWAKENED BUT UNCHANGED JOB.
// slot 3517
                    if slot <> 3517 or instruction <> 5572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5572, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3521 {
            if slot <= 3519 {
                if slot <= 3518 {
// EXECUTIVE.agc:181
//		TC	CCSHOLE
// slot 3518
                    if slot <> 3518 or instruction <> 3047 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3047, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:182
//		TC	CCSHOLE
// slot 3519
                    if slot <> 3519 or instruction <> 3047 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3047, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3520 {
// EXECUTIVE.agc:183
//		TS	NEWJOB		# +0 SHOWS ACTIVE JOB ALREADY SET.
// slot 3520
                    if slot <> 3520 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:184
//		DXCH	NEWLOC
// slot 3521
                    if slot <> 3521 or instruction <> 21558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3523 {
                if slot <= 3522 {
// EXECUTIVE.agc:185
//		DXCH	LOC
// slot 3522
                    if slot <> 3522 or instruction <> 21621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:186
//		TCF	ENDFIND
// slot 3523
                    if slot <> 3523 or instruction <> 6802 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6802, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3524 {
// EXECUTIVE.agc:187
//
// EXECUTIVE.agc:188
//SETLOC		DXCH	NEWLOC		# SET UP THE LOCATION REGISTERS FOR THIS
// slot 3524
                    if slot <> 3524 or instruction <> 21558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:189
//		INDEX	LOCCTR
// slot 3525
                    if slot <> 3525 or instruction <> 20532 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20532, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20532, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[81] to agcAotUnit81@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:190
//		DXCH	LOC
// slot 3526
    3526, 43242
)).

// bank 01, slots 3527-3527
function agcAotUnit82 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXECUTIVE.agc:191
//		INDEX	NEWJOB		# THIS INDEX INSTRUCTION INSURES THAT THE
// slot 3527
    if slot <> 3527 or instruction <> 20535 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20535, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20535, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[82] to agcAotUnit82@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:192
//		CS	PRIORITY	# HIGHEST ACTIVE PRIORITY WILL BE COMPARED
// slot 3528
    3528, 33006
)).

// bank 01, slots 3529-3539
function agcAotUnit83 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3533 {
        if slot <= 3530 {
            if slot <= 3529 {
// EXECUTIVE.agc:193
//		AD	NEWPRIO		# WITH THE NEW PRIORITY TO SEE IF NEWJOB
// slot 3529
                if slot <> 3529 or instruction <> 24627 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 51).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:194
//		EXTEND			# SHOULD BE SET TO SIGNAL A SWITCH.
// slot 3530
                if slot <> 3530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3531 {
// EXECUTIVE.agc:195
//		BZMF	ENDFIND
// slot 3531
                if slot <> 3531 or instruction <> 27282 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 27282, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3532 {
// EXECUTIVE.agc:196
//		CA	LOCCTR		# LOCCTR IS LEFT SET AT THIS CORE SET IF
// slot 3532
                    if slot <> 3532 or instruction <> 12340 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 52).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:197
//		TS	NEWJOB		# THE CALLER WANTS TO LOAD ANY MPAC
// slot 3533
                    if slot <> 3533 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3536 {
            if slot <= 3534 {
// EXECUTIVE.agc:198
//		TCF	ENDFIND		# REGISTERS, ETC.
// slot 3534
                if slot <> 3534 or instruction <> 6802 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6802, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3535 {
// EXECUTIVE.agc:199
//
// EXECUTIVE.agc:200
//NEXTCORE	CAF	COREINC
// slot 3535
                    if slot <> 3535 or instruction <> 13868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1580), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:201
//		ADS	LOCCTR
// slot 3536
                    if slot <> 3536 or instruction <> 11316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 52).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3537 {
// EXECUTIVE.agc:202
//		CCS	EXECTEM2
// slot 3537
                if slot <> 3537 or instruction <> 4146 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3538 {
// EXECUTIVE.agc:203
//		TCF	NOVAC3
// slot 3538
                    if slot <> 3538 or instruction <> 5547 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5547, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:204
//		TC	BAILOUT		# NO CORE SETS.
// slot 3539
                    if slot <> 3539 or instruction <> 4077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[83] to agcAotUnit83@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:205
//		OCT	1202
// slot 3540
    3540, 1284
)).

// bank 01, slots 3541-3547
function agcAotUnit84 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3543 {
        if slot <= 3541 {
// EXECUTIVE.agc:206
//# Page 1213
// EXECUTIVE.agc:207
//# THE FOLLOWING ROUTINE SWAPS CORE SET 0 WITH THAT WHOSE RELATIVE ADDRESS IS IN NEWJOB.
// EXECUTIVE.agc:208
//
// EXECUTIVE.agc:209
//	-2	LXCH	LOC
// slot 3541
            if slot <> 3541 or instruction <> 9332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 116, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3542 {
// EXECUTIVE.agc:210
//	-1	CAE	BANKSET		# BANKSET, NOT BBANK, HAS RIGHT CONTENTS.
// slot 3542
                if slot <> 3542 or instruction <> 12405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 117).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:211
//CHANJOB		INHINT
// slot 3543
                if slot <> 3543 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3545 {
            if slot <= 3544 {
// EXECUTIVE.agc:212
//		EXTEND
// slot 3544
                if slot <> 3544 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:213
//		ROR	SUPERBNK	# PICK UP CURRENT SBANK FOR BBCON
// slot 3545
                if slot <> 3545 or instruction <> 2055 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3546 {
// EXECUTIVE.agc:214
//		XCH	L		# LOC IN A AND BBCON IN L.
// slot 3546
                if slot <> 3546 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:215
//	+4	INDEX	NEWJOB		# SWAP LOC AND BANKSET.
// slot 3547
                if slot <> 3547 or instruction <> 20535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20535, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20535, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[84] to agcAotUnit84@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:216
//		DXCH	LOC
// slot 3548
    3548, 43242
)).

// bank 01, slots 3549-3554
function agcAotUnit85 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3551 {
        if slot <= 3549 {
// EXECUTIVE.agc:217
//		DXCH	LOC
// slot 3549
            if slot <> 3549 or instruction <> 21621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3550 {
// EXECUTIVE.agc:218
//
// EXECUTIVE.agc:219
//		CAE	BANKSET
// slot 3550
                if slot <> 3550 or instruction <> 12405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 117).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:220
//		EXTEND
// slot 3551
                if slot <> 3551 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3552 {
// EXECUTIVE.agc:221
//		WRITE	SUPERBNK	# SET SBANK FOR NEW JOB.
// slot 3552
            if slot <> 3552 or instruction <> 519 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3553 {
// EXECUTIVE.agc:222
//		DXCH	MPAC		# SWAP MULTI-PURPOSE ACCUMULATOR AREAS.
// slot 3553
                if slot <> 3553 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:223
//		INDEX	NEWJOB
// slot 3554
                if slot <> 3554 or instruction <> 20535 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20535, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20535, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[85] to agcAotUnit85@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:224
//		DXCH	MPAC
// slot 3555
    3555, 43226
)).

// bank 01, slots 3556-3558
function agcAotUnit86 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3556 {
// EXECUTIVE.agc:225
//		DXCH	MPAC
// slot 3556
        if slot <> 3556 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3557 {
// EXECUTIVE.agc:226
//		DXCH	MPAC +2
// slot 3557
            if slot <> 3557 or instruction <> 21615 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:227
//		INDEX	NEWJOB
// slot 3558
            if slot <> 3558 or instruction <> 20535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[86] to agcAotUnit86@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:228
//		DXCH	MPAC +2
// slot 3559
    3559, 43230
)).

// bank 01, slots 3560-3562
function agcAotUnit87 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3560 {
// EXECUTIVE.agc:229
//		DXCH	MPAC +2
// slot 3560
        if slot <> 3560 or instruction <> 21615 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3561 {
// EXECUTIVE.agc:230
//		DXCH	MPAC +4
// slot 3561
            if slot <> 3561 or instruction <> 21617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:231
//		INDEX	NEWJOB
// slot 3562
            if slot <> 3562 or instruction <> 20535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[87] to agcAotUnit87@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:232
//		DXCH	MPAC +4
// slot 3563
    3563, 43234
)).

// bank 01, slots 3564-3566
function agcAotUnit88 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3564 {
// EXECUTIVE.agc:233
//		DXCH	MPAC +4
// slot 3564
        if slot <> 3564 or instruction <> 21617 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3565 {
// EXECUTIVE.agc:234
//		DXCH	MPAC +6
// slot 3565
            if slot <> 3565 or instruction <> 21619 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 115, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:235
//		INDEX	NEWJOB
// slot 3566
            if slot <> 3566 or instruction <> 20535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[88] to agcAotUnit88@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:236
//		DXCH	MPAC +6
// slot 3567
    3567, 43238
)).

// bank 01, slots 3568-3576
function agcAotUnit89 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3571 {
        if slot <= 3569 {
            if slot <= 3568 {
// EXECUTIVE.agc:237
//		DXCH	MPAC +6
// slot 3568
                if slot <> 3568 or instruction <> 21619 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 115, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:238
//
// EXECUTIVE.agc:239
//		CAF	ZERO
// slot 3569
                if slot <> 3569 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 3570 {
// EXECUTIVE.agc:240
//		XCH	OVFIND		# MAKE PUSHLOC NEGATIVE IF OVFIND NZ.
// slot 3570
                if slot <> 3570 or instruction <> 23633 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 81, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:241
//		EXTEND
// slot 3571
                if slot <> 3571 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3573 {
            if slot <= 3572 {
// EXECUTIVE.agc:242
//		BZF	+3
// slot 3572
                if slot <> 3572 or instruction <> 5623 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5623, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:243
//		CS	PUSHLOC
// slot 3573
                if slot <> 3573 or instruction <> 16502 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 118).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3574 {
// EXECUTIVE.agc:244
//		TS	PUSHLOC
// slot 3574
                if slot <> 3574 or instruction <> 22646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3575 {
// EXECUTIVE.agc:245
//
// EXECUTIVE.agc:246
//		DXCH	PUSHLOC
// slot 3575
                    if slot <> 3575 or instruction <> 21623 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 119, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:247
//		INDEX	NEWJOB
// slot 3576
                    if slot <> 3576 or instruction <> 20535 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20535, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20535, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[89] to agcAotUnit89@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:248
//		DXCH	PUSHLOC
// slot 3577
    3577, 43246
)).

// bank 01, slots 3578-3620
function agcAotUnit90 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3598 {
        if slot <= 3587 {
            if slot <= 3582 {
                if slot <= 3579 {
                    if slot <= 3578 {
// EXECUTIVE.agc:249
//		DXCH	PUSHLOC		# SWAPS PUSHLOC AND PRIORITY.
// slot 3578
                        if slot <> 3578 or instruction <> 21623 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 119, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:250
//		CAF	LOW9		# SET FIXLOC TO BASE OF VAC AREA.
// slot 3579
                        if slot <> 3579 or instruction <> 14886 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3580 {
// EXECUTIVE.agc:251
//		MASK	PRIORITY
// slot 3580
                        if slot <> 3580 or instruction <> 28791 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 119).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3581 {
// EXECUTIVE.agc:252
//		TS	FIXLOC
// slot 3581
                            if slot <> 3581 or instruction <> 22608 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22608, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:253
//
// EXECUTIVE.agc:254
//		CCS	PUSHLOC		# SET OVERFLOW INDICATOR ACCORDING TO
// slot 3582
                            if slot <> 3582 or instruction <> 4214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 118).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3584 {
                    if slot <= 3583 {
// EXECUTIVE.agc:255
//		CAF	ZERO
// slot 3583
                        if slot <> 3583 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:256
//		TCF	ENDPRCHG -1
// slot 3584
                        if slot <> 3584 or instruction <> 5637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3585 {
// EXECUTIVE.agc:257
//
// EXECUTIVE.agc:258
//# Page 1214
// EXECUTIVE.agc:259
//		CS	PUSHLOC
// slot 3585
                        if slot <> 3585 or instruction <> 16502 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 118).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3586 {
// EXECUTIVE.agc:260
//		TS	PUSHLOC
// slot 3586
                            if slot <> 3586 or instruction <> 22646 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22646, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:261
//		CAF	ONE
// slot 3587
                            if slot <> 3587 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 3592 {
                if slot <= 3589 {
                    if slot <= 3588 {
// EXECUTIVE.agc:262
//		XCH	OVFIND
// slot 3588
                        if slot <> 3588 or instruction <> 23633 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 81, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:263
//		TS	NEWJOB
// slot 3589
                        if slot <> 3589 or instruction <> 22583 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22583, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3590 {
// EXECUTIVE.agc:264
//
// EXECUTIVE.agc:265
//ENDPRCHG	RELINT
// slot 3590
                        if slot <> 3590 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3591 {
// EXECUTIVE.agc:266
//		DXCH	LOC		# BASIC JOBS HAVE POSITIVE ADDRESSES, SO
// slot 3591
                            if slot <> 3591 or instruction <> 21621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:267
//		EXTEND			# DISPATCH WITH A DTCB.
// slot 3592
                            if slot <> 3592 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3595 {
                    if slot <= 3593 {
// EXECUTIVE.agc:268
//		BZMF	+2		# IF INTERPRETIVE, SET UP EBANK, ETC.
// slot 3593
                        if slot <> 3593 or instruction <> 26123 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26123, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3594 {
// EXECUTIVE.agc:269
//		DTCB
// slot 3594
                            if slot <> 3594 or instruction <> 21510 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:270
//# Page 1215
// EXECUTIVE.agc:271
//		COM			# EPILOGUE TO JOB CHANGE FOR INTERPRETIVE
// slot 3595
                            if slot <> 3595 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 3596 {
// EXECUTIVE.agc:272
//		AD	ONE
// slot 3596
                        if slot <> 3596 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                        if slot <= 3597 {
// EXECUTIVE.agc:273
//		TS	LOC		# RESUME.
// slot 3597
                            if slot <> 3597 or instruction <> 22644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:274
//		TCF	INTRSM
// slot 3598
                            if slot <> 3598 or instruction <> 7183 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7183, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 3609 {
            if slot <= 3603 {
                if slot <= 3600 {
                    if slot <= 3599 {
// EXECUTIVE.agc:275
//
// EXECUTIVE.agc:276
//# COMPLETE JOBSLEEP PREPARATIONS.
// EXECUTIVE.agc:277
//
// EXECUTIVE.agc:278
//JOBSLP1		INHINT
// slot 3599
                        if slot <> 3599 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:279
//		CS	PRIORITY	# NNZ PRIORITY SHOWS JOB ASLEEP.
// slot 3600
                        if slot <> 3600 or instruction <> 16503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 119).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3601 {
// EXECUTIVE.agc:280
//		TS	PRIORITY
// slot 3601
                        if slot <> 3601 or instruction <> 22647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3602 {
// EXECUTIVE.agc:281
//		CAF	LOW7
// slot 3602
                            if slot <> 3602 or instruction <> 15395 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 3107), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:282
//		MASK	BBANK
// slot 3603
                            if slot <> 3603 or instruction <> 28678 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 6).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3606 {
                    if slot <= 3604 {
// EXECUTIVE.agc:283
//		EXTEND
// slot 3604
                        if slot <> 3604 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3605 {
// EXECUTIVE.agc:284
//		ROR	SUPERBNK	# SAVE OLD SUPERBANK VALUE.
// slot 3605
                            if slot <> 3605 or instruction <> 2055 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:285
//		TS	BANKSET
// slot 3606
                            if slot <> 3606 or instruction <> 22645 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22645, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 3607 {
// EXECUTIVE.agc:286
//		CS	ZERO
// slot 3607
                        if slot <> 3607 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3608 {
// EXECUTIVE.agc:287
//JOBSLP2		TS	BUF +1		# HOLDS - HIGHEST PRIORITY.
// slot 3608
                            if slot <> 3608 or instruction <> 22617 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22617, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:288
//		TCF	EJSCAN		# SCAN FOR HIGHEST PRIORITY ALA ENDOFJOB.
// slot 3609
                            if slot <> 3609 or instruction <> 5729 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5729, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 3614 {
                if slot <= 3611 {
                    if slot <= 3610 {
// EXECUTIVE.agc:289
//
// EXECUTIVE.agc:290
//NUCHANG2	INHINT			# QUICK... DONT LET NEWJOB CHANGE TO +0 .
// slot 3610
                        if slot <> 3610 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:291
//		CCS	NEWJOB
// slot 3611
                        if slot <> 3611 or instruction <> 4151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 55).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3612 {
// EXECUTIVE.agc:292
//		TCF	+3		# NEWJOB STILL PNZ
// slot 3612
                        if slot <> 3612 or instruction <> 5663 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5663, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3613 {
// EXECUTIVE.agc:293
//		RELINT			# NEWJOB HAS CHANGED TO +0. WAKE UP JOB
// slot 3613
                            if slot <> 3613 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:294
//		TCF	ADVAN +2	# VIA NUDIRECT.  (VERY RARE CASE.)
// slot 3614
                            if slot <> 3614 or instruction <> 5787 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5787, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3617 {
                    if slot <= 3615 {
// EXECUTIVE.agc:295
//
// EXECUTIVE.agc:296
//		CAF	TWO
// slot 3615
                        if slot <> 3615 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3616 {
// EXECUTIVE.agc:297
//		EXTEND
// slot 3616
                            if slot <> 3616 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:298
//		WOR	DSALMOUT	# TURN ON ACTIVITY LIGHT
// slot 3617
                            if slot <> 3617 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 3618 {
// EXECUTIVE.agc:299
//		DXCH	LOC		# AND SAVE ADDRESS INFO FOR BENEFIT OF
// slot 3618
                        if slot <> 3618 or instruction <> 21621 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3619 {
// EXECUTIVE.agc:300
//		TCF	CHANJOB + 4	#  POSSIBLE SLEEPING JOB.
// slot 3619
                            if slot <> 3619 or instruction <> 5595 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5595, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXECUTIVE.agc:301
//
// EXECUTIVE.agc:302
//# Page 1216
// EXECUTIVE.agc:303
//# TO WAKE UP A JOB, EACH CORE SET IS FOUND TO LOCATE ALL JOBS WHICH ARE ASLEEP.  IF THE FCADR IN THE
// EXECUTIVE.agc:304
//# LOC REGISTER OF ANY SUCH JOB MATCHES THAT SUPPLIED BY THE CALLER, THAT JOB IS AWAKENED.  IF NO JOB IS FOUND,
// EXECUTIVE.agc:305
//# LOCCTR IS SET TO -1 AND NO FURTHER ACTION TAKES PLACE.
// EXECUTIVE.agc:306
//
// EXECUTIVE.agc:307
//JOBWAKE2	TS	EXECTEM1
// slot 3620
                            if slot <> 3620 or instruction <> 22577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22577, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[90] to agcAotUnit90@.

// bank 01, slots 3621-3625
function agcAotUnit91 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3622 {
        if slot <= 3621 {
// EXECUTIVE.agc:308
//		CAF	ZERO		# BEGIN CORE SET SCAN.
// slot 3621
            if slot <> 3621 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:309
//		TS	LOCCTR
// slot 3622
            if slot <> 3622 or instruction <> 22580 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22580, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3623 {
// EXECUTIVE.agc:310
//		CAF	NO.CORES
// slot 3623
            if slot <> 3623 or instruction <> 13743 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1455), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3624 {
// EXECUTIVE.agc:311
//JOBWAKE4	TS	EXECTEM2
// slot 3624
                if slot <> 3624 or instruction <> 22578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:312
//		INDEX	LOCCTR
// slot 3625
                if slot <> 3625 or instruction <> 20532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[91] to agcAotUnit91@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:313
//		CCS	PRIORITY
// slot 3626
    3626, 8430
)).

// bank 01, slots 3627-3627
function agcAotUnit92 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXECUTIVE.agc:314
//		TCF	JOBWAKE3	# ACTIVE JOB - CHECK NEXT CORE SET.
// slot 3627
    if slot <> 3627 or instruction <> 5678 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5678, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[92] to agcAotUnit92@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:315
//COREINC		DEC	12		# 12 REGISTERS PER CORE SET.
// slot 3628
    3628, 24
)).

// bank 01, slots 3629-3638
function agcAotUnit93 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3633 {
        if slot <= 3630 {
            if slot <= 3629 {
// EXECUTIVE.agc:316
//		TCF	WAKETEST	# SLEEPING JOB - SEE IF CADR MATCHES.
// slot 3629
                if slot <> 3629 or instruction <> 5685 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5685, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:317
//
// EXECUTIVE.agc:318
//JOBWAKE3	CAF	COREINC
// slot 3630
                if slot <> 3630 or instruction <> 13868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1580), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3631 {
// EXECUTIVE.agc:319
//		ADS	LOCCTR
// slot 3631
                if slot <> 3631 or instruction <> 11316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3632 {
// EXECUTIVE.agc:320
//		CCS	EXECTEM2
// slot 3632
                    if slot <> 3632 or instruction <> 4146 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:321
//		TCF	JOBWAKE4
// slot 3633
                    if slot <> 3633 or instruction <> 5672 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5672, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3635 {
            if slot <= 3634 {
// EXECUTIVE.agc:322
//		CS	ONE		# EXIT IF SLEEPING JOB NOT FOUND.
// slot 3634
                if slot <> 3634 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:323
//		TS	LOCCTR
// slot 3635
                if slot <> 3635 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3636 {
// EXECUTIVE.agc:324
//		TCF	ENDFIND
// slot 3636
                if slot <> 3636 or instruction <> 6802 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6802, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3637 {
// EXECUTIVE.agc:325
//
// EXECUTIVE.agc:326
//WAKETEST	CS	NEWLOC
// slot 3637
                    if slot <> 3637 or instruction <> 16437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 53).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:327
//		INDEX	LOCCTR
// slot 3638
                    if slot <> 3638 or instruction <> 20532 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20532, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20532, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[93] to agcAotUnit93@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:328
//		AD	LOC
// slot 3639
    3639, 49384
)).

// bank 01, slots 3640-3643
function agcAotUnit94 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3641 {
        if slot <= 3640 {
// EXECUTIVE.agc:329
//		EXTEND
// slot 3640
            if slot <> 3640 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:330
//		BZF	+2		# IF MATCH.
// slot 3641
            if slot <> 3641 or instruction <> 5691 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3642 {
// EXECUTIVE.agc:331
//		TCF 	JOBWAKE3	# EXAMINE NEXT CORE SET IF NO MATCH.
// slot 3642
            if slot <> 3642 or instruction <> 5678 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5678, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:332
//
// EXECUTIVE.agc:333
//		INDEX	LOCCTR		# RE-COMPLEMENT PRIORITY TO SHOW JOB AWAKE
// slot 3643
            if slot <> 3643 or instruction <> 20532 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20532, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[94] to agcAotUnit94@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:334
//		CS	PRIORITY
// slot 3644
    3644, 33006
)).

// bank 01, slots 3645-3646
function agcAotUnit95 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3645 {
// EXECUTIVE.agc:335
//		TS	NEWPRIO
// slot 3645
        if slot <> 3645 or instruction <> 22579 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22579, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXECUTIVE.agc:336
//		INDEX	LOCCTR
// slot 3646
        if slot <> 3646 or instruction <> 20532 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20532, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[95] to agcAotUnit95@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:337
//		TS	PRIORITY
// slot 3647
    3647, 45294
)).

// bank 01, slots 3648-3653
function agcAotUnit96 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3650 {
        if slot <= 3648 {
// EXECUTIVE.agc:338
//
// EXECUTIVE.agc:339
//		CS	FBANKMSK	# MAKE UP THE 2CADR OF THE WAKE ADDRESS
// slot 3648
            if slot <> 3648 or instruction <> 18676 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3649 {
// EXECUTIVE.agc:340
//		MASK	NEWLOC		# USING THE CADR IN NEWLOC AND THE EBANK
// slot 3649
                if slot <> 3649 or instruction <> 28725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 53).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:341
//		AD	2K		# HALF OF BBANK SAVED IN BANKSET.
// slot 3650
                if slot <> 3650 or instruction <> 27141 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3651 {
// EXECUTIVE.agc:342
//		XCH	NEWLOC
// slot 3651
            if slot <> 3651 or instruction <> 23605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 53, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3652 {
// EXECUTIVE.agc:343
//		MASK	FBANKMSK
// slot 3652
                if slot <> 3652 or instruction <> 30964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                    if fixedOperand = 31744 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:344
//		INDEX	LOCCTR
// slot 3653
                if slot <> 3653 or instruction <> 20532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[96] to agcAotUnit96@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:345
//		AD	BANKSET
// slot 3654
    3654, 49386
)).

// bank 01, slots 3655-3679
function agcAotUnit97 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3666 {
        if slot <= 3660 {
            if slot <= 3657 {
                if slot <= 3655 {
// EXECUTIVE.agc:346
//		TS	NEWLOC +1
// slot 3655
                    if slot <> 3655 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3656 {
// EXECUTIVE.agc:347
//
// EXECUTIVE.agc:348
//		CCS	LOCCTR		# SPECIAL TREATMENT IF THIS JOB WAS
// slot 3656
                        if slot <> 3656 or instruction <> 4148 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:349
//		TCF	SETLOC		# ALREADY IN THE RUN (0) POSITION.
// slot 3657
                        if slot <> 3657 or instruction <> 5572 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5572, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3658 {
// EXECUTIVE.agc:350
//		TCF	SPECTEST
// slot 3658
                    if slot <> 3658 or instruction <> 5564 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5564, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3659 {
// EXECUTIVE.agc:351
//
// EXECUTIVE.agc:352
//# Page 1217
// EXECUTIVE.agc:353
//# PRIORITY CHANGE. CHANGE THE CONTENTS OF PRIORITY AND SCAN FOR THE JOB OF HIGHEST PRIORITY.
// EXECUTIVE.agc:354
//
// EXECUTIVE.agc:355
//PRIOCH2		TS	LOC
// slot 3659
                        if slot <> 3659 or instruction <> 22644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:356
//		CAF	ZERO		# SET FLAG TO TELL ENDJOB SCANNER IF THIS
// slot 3660
                        if slot <> 3660 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 3663 {
                if slot <= 3661 {
// EXECUTIVE.agc:357
//		TS	BUF		# JOB IS STILL HIGHEST PRIORITY.
// slot 3661
                    if slot <> 3661 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3662 {
// EXECUTIVE.agc:358
//		CAF	LOW9
// slot 3662
                        if slot <> 3662 or instruction <> 14886 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:359
//		MASK	PRIORITY
// slot 3663
                        if slot <> 3663 or instruction <> 28791 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 119).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3664 {
// EXECUTIVE.agc:360
//		AD	NEWPRIO
// slot 3664
                    if slot <> 3664 or instruction <> 24627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 51).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3665 {
// EXECUTIVE.agc:361
//		TS	PRIORITY
// slot 3665
                        if slot <> 3665 or instruction <> 22647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:362
//		COM
// slot 3666
                        if slot <> 3666 or instruction <> 16384 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 3672 {
            if slot <= 3669 {
                if slot <= 3667 {
// EXECUTIVE.agc:363
//		TCF	JOBSLP2		# AND TO EJSCAN.
// slot 3667
                    if slot <> 3667 or instruction <> 5656 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5656, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3668 {
// EXECUTIVE.agc:364
//
// EXECUTIVE.agc:365
//# Page 1218
// EXECUTIVE.agc:366
//# RELEASE THIS CORE SET AND VAC AREA AND SCAN FOR THE JOB OF HIGHEST ACTIVE PRIORITY.
// EXECUTIVE.agc:367
//
// EXECUTIVE.agc:368
//ENDJOB1		INHINT
// slot 3668
                        if slot <> 3668 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:369
//		CS	ZERO
// slot 3669
                        if slot <> 3669 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3670 {
// EXECUTIVE.agc:370
//		TS	BUF +1
// slot 3670
                    if slot <> 3670 or instruction <> 22617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22617, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3671 {
// EXECUTIVE.agc:371
//		XCH	PRIORITY
// slot 3671
                        if slot <> 3671 or instruction <> 23671 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 119, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:372
//		MASK	LOW9
// slot 3672
                        if slot <> 3672 or instruction <> 31270 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2598), 32768).
                            if fixedOperand = 511 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
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
            if slot <= 3675 {
                if slot <= 3673 {
// EXECUTIVE.agc:373
//		TS	L
// slot 3673
                    if slot <> 3673 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3674 {
// EXECUTIVE.agc:374
//
// EXECUTIVE.agc:375
//		CS	FAKEPRET
// slot 3674
                        if slot <> 3674 or instruction <> 19094 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2710), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:376
//		AD	L
// slot 3675
                        if slot <> 3675 or instruction <> 24577 { return choose false if checkOnly else -1. }
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
                if slot <= 3677 {
                    if slot <= 3676 {
// EXECUTIVE.agc:377
//
// EXECUTIVE.agc:378
//		EXTEND
// slot 3676
                        if slot <> 3676 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:379
//		BZMF	EJSCAN		# NOVAC ENDOFJOB
// slot 3677
                        if slot <> 3677 or instruction <> 26209 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26209, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3678 {
// EXECUTIVE.agc:380
//
// EXECUTIVE.agc:381
//		CCS	L
// slot 3678
                        if slot <> 3678 or instruction <> 4097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:382
//		INDEX	A
// slot 3679
                        if slot <> 3679 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[97] to agcAotUnit97@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:383
//		TS	0
// slot 3680
    3680, 45056
)).

// bank 01, slots 3681-3690
function agcAotUnit98 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3685 {
        if slot <= 3682 {
            if slot <= 3681 {
// EXECUTIVE.agc:384
//
// EXECUTIVE.agc:385
//EJSCAN		CCS	PRIORITY +12D
// slot 3681
                if slot <> 3681 or instruction <> 4227 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 131).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:386
//		TC	EJ1
// slot 3682
                if slot <> 3682 or instruction <> 1670 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1670, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3683 {
// EXECUTIVE.agc:387
//		TC	CCSHOLE
// slot 3683
                if slot <> 3683 or instruction <> 3047 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3047, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3684 {
// EXECUTIVE.agc:388
//		TCF	+1
// slot 3684
                    if slot <> 3684 or instruction <> 5733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5733, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:389
//
// EXECUTIVE.agc:390
//		CCS	PRIORITY +24D	# EXAMINE EACH PRIORITY REGISTER TO FIND
// slot 3685
                    if slot <> 3685 or instruction <> 4239 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 143).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3687 {
            if slot <= 3686 {
// EXECUTIVE.agc:391
//		TC	EJ1		# THE JOB OF HIGHEST ACTIVE PRIORITY.
// slot 3686
                if slot <> 3686 or instruction <> 1670 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1670, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:392
//		TC	CCSHOLE
// slot 3687
                if slot <> 3687 or instruction <> 3047 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3047, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3688 {
// EXECUTIVE.agc:393
//		TCF	+1
// slot 3688
                if slot <> 3688 or instruction <> 5737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5737, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3689 {
// EXECUTIVE.agc:394
//
// EXECUTIVE.agc:395
//		CCS	PRIORITY +36D
// slot 3689
                    if slot <> 3689 or instruction <> 4251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 155).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:396
//		TC	EJ1
// slot 3690
                    if slot <> 3690 or instruction <> 1670 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1670, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[98] to agcAotUnit98@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:397
//-CCSPR		-CCS	PRIORITY
// slot 3691
    3691, 57104
)).

// bank 01, slots 3692-3713
function agcAotUnit99 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3702 {
        if slot <= 3696 {
            if slot <= 3693 {
                if slot <= 3692 {
// EXECUTIVE.agc:398
//		TCF	+1
// slot 3692
                    if slot <> 3692 or instruction <> 5741 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5741, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:399
//
// EXECUTIVE.agc:400
//		CCS	PRIORITY +48D
// slot 3693
                    if slot <> 3693 or instruction <> 4263 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 167).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3694 {
// EXECUTIVE.agc:401
//		TC	EJ1
// slot 3694
                    if slot <> 3694 or instruction <> 1670 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1670, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3695 {
// EXECUTIVE.agc:402
//		TC	CCSHOLE
// slot 3695
                        if slot <> 3695 or instruction <> 3047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:403
//		TCF	+1
// slot 3696
                        if slot <> 3696 or instruction <> 5745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5745, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3699 {
                if slot <= 3697 {
// EXECUTIVE.agc:404
//
// EXECUTIVE.agc:405
//		CCS	PRIORITY +60D
// slot 3697
                    if slot <> 3697 or instruction <> 4275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 179).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3698 {
// EXECUTIVE.agc:406
//		TC	EJ1
// slot 3698
                        if slot <> 3698 or instruction <> 1670 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1670, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:407
//		TC	CCSHOLE
// slot 3699
                        if slot <> 3699 or instruction <> 3047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3700 {
// EXECUTIVE.agc:408
//		TCF	+1
// slot 3700
                    if slot <> 3700 or instruction <> 5749 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5749, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3701 {
// EXECUTIVE.agc:409
//
// EXECUTIVE.agc:410
//		CCS	PRIORITY +72D
// slot 3701
                        if slot <> 3701 or instruction <> 4287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 191).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:411
//		TC	EJ1
// slot 3702
                        if slot <> 3702 or instruction <> 1670 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1670, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3707 {
            if slot <= 3704 {
                if slot <= 3703 {
// EXECUTIVE.agc:412
//		TC	CCSHOLE
// slot 3703
                    if slot <> 3703 or instruction <> 3047 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3047, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:413
//		TCF	+1
// slot 3704
                    if slot <> 3704 or instruction <> 5753 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5753, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3705 {
// EXECUTIVE.agc:414
//
// EXECUTIVE.agc:415
//# Page 1219
// EXECUTIVE.agc:416
//# EVALUATE THE RESULTS OF THE SCAN.
// EXECUTIVE.agc:417
//
// EXECUTIVE.agc:418
//		CCS	BUF +1		# SEE IF THERE ARE ANY ACTIVE JOBS WAITING
// slot 3705
                    if slot <> 3705 or instruction <> 4185 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 89).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3706 {
// EXECUTIVE.agc:419
//		TC	CCSHOLE
// slot 3706
                        if slot <> 3706 or instruction <> 3047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:420
//		TC	CCSHOLE
// slot 3707
                        if slot <> 3707 or instruction <> 3047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3047, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3710 {
                if slot <= 3708 {
// EXECUTIVE.agc:421
//
// EXECUTIVE.agc:422
//		TCF	+2
// slot 3708
                    if slot <> 3708 or instruction <> 5758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5758, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3709 {
// EXECUTIVE.agc:423
//		TCF	DUMMYJOB
// slot 3709
                        if slot <> 3709 or instruction <> 5779 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5779, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:424
//		CCS	BUF		# BUF IS ZERO IF THIS IS A PRIOCHNG AND
// slot 3710
                        if slot <> 3710 or instruction <> 4184 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 88).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3711 {
// EXECUTIVE.agc:425
//		TCF	+2		# CHANGED PRIORITY IS STILL HIGHEST.
// slot 3711
                    if slot <> 3711 or instruction <> 5761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3712 {
// EXECUTIVE.agc:426
//		TCF	ENDPRCHG -1
// slot 3712
                        if slot <> 3712 or instruction <> 5637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXECUTIVE.agc:427
//
// EXECUTIVE.agc:428
//		INDEX	A		# OTHERWISE, SET NEWJOB TO THE RELATIVE
// slot 3713
                        if slot <> 3713 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[99] to agcAotUnit99@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:429
//		CAF	0 -1		# ADDRESS OF THE NEW JOB'S CORE SET.
// slot 3714
    3714, 24574
)).

// bank 01, slots 3715-3724
function agcAotUnit100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3719 {
        if slot <= 3716 {
            if slot <= 3715 {
// EXECUTIVE.agc:430
//		AD	-CCSPR
// slot 3715
                if slot <> 3715 or instruction <> 26219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1643), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:431
//		TS	NEWJOB
// slot 3716
                if slot <> 3716 or instruction <> 22583 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22583, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3717 {
// EXECUTIVE.agc:432
//		TCF	CHANJOB -2
// slot 3717
                if slot <> 3717 or instruction <> 5589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3718 {
// EXECUTIVE.agc:433
//
// EXECUTIVE.agc:434
//EJ1		TS	BUF +2
// slot 3718
                    if slot <> 3718 or instruction <> 22618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:435
//		AD	BUF +1		# - OLD HIGH PRIORITY.
// slot 3719
                    if slot <> 3719 or instruction <> 24665 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 89).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3721 {
            if slot <= 3720 {
// EXECUTIVE.agc:436
//		CCS	A
// slot 3720
                if slot <> 3720 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:437
//		CS	BUF 	+2
// slot 3721
                if slot <> 3721 or instruction <> 16474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 90).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3722 {
// EXECUTIVE.agc:438
//		TCF	EJ2		# NEW HIGH PRIORITY.
// slot 3722
                if slot <> 3722 or instruction <> 5774 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5774, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3723 {
// EXECUTIVE.agc:439
//		NOOP
// slot 3723
                    if slot <> 3723 or instruction <> 5772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5772, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:440
//		INDEX	Q
// slot 3724
                    if slot <> 3724 or instruction <> 20482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[100] to agcAotUnit100@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:441
//		TC	2		# PROCEED WITH SEARCH.
// slot 3725
    3725, 4
)).

// bank 01, slots 3726-3729
function agcAotUnit101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3727 {
        if slot <= 3726 {
// EXECUTIVE.agc:442
//
// EXECUTIVE.agc:443
//EJ2		TS	BUF +1
// slot 3726
            if slot <> 3726 or instruction <> 22617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22617, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:444
//		EXTEND
// slot 3727
            if slot <> 3727 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3728 {
// EXECUTIVE.agc:445
//		QXCH	BUF		# FOR LOCATING CCS PRIORITY + X INSTR.
// slot 3728
            if slot <> 3728 or instruction <> 9304 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 88, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:446
//		INDEX	BUF
// slot 3729
            if slot <> 3729 or instruction <> 20568 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20568, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[101] to agcAotUnit101@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:447
//		TC	2
// slot 3730
    3730, 4
)).

// bank 01, slots 3731-3744
function agcAotUnit102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3737 {
        if slot <= 3733 {
            if slot <= 3731 {
// EXECUTIVE.agc:448
//
// EXECUTIVE.agc:449
//# Page 1220
// EXECUTIVE.agc:450
//# IDLING AND COMPUTER ACTIVITY (GREEN) LIGHT MAINTENANCE. THE IDLING ROUTINE IS NOT A JOB IN ITSELF,
// EXECUTIVE.agc:451
//# BUT RATHER A SUBROUTINE OF THE EXECUTIVE.
// EXECUTIVE.agc:452
//
// EXECUTIVE.agc:453
//		EBANK=	SELFRET		# SELF-CHECK STORAGE IN EBANK.
// EXECUTIVE.agc:454
//
// EXECUTIVE.agc:455
//DUMMYJOB	CS	ZERO		# SET NEWJOB TO -0 FOR IDLING.
// slot 3731
                if slot <> 3731 or instruction <> 18961 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3732 {
// EXECUTIVE.agc:456
//		TS	NEWJOB
// slot 3732
                    if slot <> 3732 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:457
//		RELINT
// slot 3733
                    if slot <> 3733 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3735 {
                if slot <= 3734 {
// EXECUTIVE.agc:458
//		CS	TWO		# TURN OFF THE ACTIVITY LIGHT.
// slot 3734
                    if slot <> 3734 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:459
//		EXTEND
// slot 3735
                    if slot <> 3735 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3736 {
// EXECUTIVE.agc:460
//		WAND	DSALMOUT
// slot 3736
                    if slot <> 3736 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:461
//ADVAN		CCS	NEWJOB		# IS A NEWJOB ACTIVE ?
// slot 3737
                    if slot <> 3737 or instruction <> 4151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3740 {
            if slot <= 3738 {
// EXECUTIVE.agc:462
//		TCF	NUCHANG2	# YES... ONE REQUIRING A CHANGE JOB.
// slot 3738
                if slot <> 3738 or instruction <> 5658 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5658, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3739 {
// EXECUTIVE.agc:463
//		CAF	TWO		# NEW JOB ALREADY IN POSITION FOR
// slot 3739
                    if slot <> 3739 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:464
//		TCF	NUDIRECT	# EXECUTION.
// slot 3740
                    if slot <> 3740 or instruction <> 5794 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5794, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3742 {
                if slot <= 3741 {
// EXECUTIVE.agc:465
//
// EXECUTIVE.agc:466
//		CA	SELFRET
// slot 3741
                    if slot <> 3741 or instruction <> 13041 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 753).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:467
//		TS	L		# PUT RETURN ADDRESS IN L.
// slot 3742
                    if slot <> 3742 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3743 {
// EXECUTIVE.agc:468
//		CAF	SELFBANK
// slot 3743
                    if slot <> 3743 or instruction <> 13985 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1697), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXECUTIVE.agc:469
//		TCF	SUPDXCHZ + 1	# AND DISPATCH JOB.
// slot 3744
                    if slot <> 3744 or instruction <> 6808 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6808, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[102] to agcAotUnit102@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:470
//
// EXECUTIVE.agc:471
//		EBANK=	SELFRET
// EXECUTIVE.agc:472
//SELFBANK	BBCON	SELFCHK
// slot 3745
    3745, 55428
)).

// bank 01, slots 3746-3749
function agcAotUnit103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3747 {
        if slot <= 3746 {
// EXECUTIVE.agc:473
//
// EXECUTIVE.agc:474
//NUDIRECT	EXTEND			# TURN THE GREEN LIGHT BACK ON.
// slot 3746
            if slot <> 3746 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:475
//		WOR	DSALMOUT
// slot 3747
            if slot <> 3747 or instruction <> 2569 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3748 {
// EXECUTIVE.agc:476
//		DXCH	LOC		# JOBS STARTED IN THIS FASHION MUST BE
// slot 3748
            if slot <> 3748 or instruction <> 21621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:477
//		TCF	SUPDXCHZ
// slot 3749
            if slot <> 3749 or instruction <> 6807 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6807, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[103] to agcAotUnit103@.

// bank 02, slots 4759-4763
function agcAotUnit189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4760 {
        if slot <= 4759 {
// EXECUTIVE.agc:478
//
// EXECUTIVE.agc:479
//		BLOCK	2		# IN FIXED-FIXED SO OTHERS MAY USE.
// EXECUTIVE.agc:480
//
// EXECUTIVE.agc:481
//		COUNT	02/EXEC
// EXECUTIVE.agc:482
//
// EXECUTIVE.agc:483
//# SUPDXCHZ - ROUTINE TO TRANSFER TO SUPERBANK.
// EXECUTIVE.agc:484
//# CALLING SEQUENCE
// EXECUTIVE.agc:485
//#		TCF	SUPDXCHZ	# WITH 2CADR OF DESIRED LOCATION IN A + L.
// EXECUTIVE.agc:486
//
// EXECUTIVE.agc:487
//SUPDXCHZ	XCH	L		# BASIC.
// slot 4759
            if slot <> 4759 or instruction <> 23553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 1, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXECUTIVE.agc:488
//+1		EXTEND
// slot 4760
            if slot <> 4760 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4761 {
// EXECUTIVE.agc:489
//		WRITE	SUPERBNK
// slot 4761
            if slot <> 4761 or instruction <> 519 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4762 {
// EXECUTIVE.agc:490
//		TS	BBANK
// slot 4762
                if slot <> 4762 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXECUTIVE.agc:491
//		TC	L
// slot 4763
                if slot <> 4763 or instruction <> 1 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[189] to agcAotUnit189@.

agcAotInstallSourceRope(list(
// EXECUTIVE.agc:492
//
// EXECUTIVE.agc:493
//NEG100		OCT	77677
// slot 4764
    4764, 65406
)).

// no code for the lines below
// EXECUTIVE.agc:494
//
// EXECUTIVE.agc:495
//
// EXECUTIVE.agc:496
//
