// PORT: Original source unit EXECUTIVE.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4666–4670.
function agcAotUnit186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4667 {
        if slot <= 4666 {
// PORT: SOURCE EXECUTIVE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE EXECUTIVE.agc:2
//# Filename:	EXECUTIVE.agc
// PORT: SOURCE EXECUTIVE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE EXECUTIVE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE EXECUTIVE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE EXECUTIVE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE EXECUTIVE.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE EXECUTIVE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE EXECUTIVE.agc:9
//# Pages:	1103-1114
// PORT: SOURCE EXECUTIVE.agc:10
//# Mod history:	2009-05-25 RSB	Adapted from the corresponding
// PORT: SOURCE EXECUTIVE.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE EXECUTIVE.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE EXECUTIVE.agc:13
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE EXECUTIVE.agc:14
//#		2011-05-08 JL	Removed workaround.
// PORT: SOURCE EXECUTIVE.agc:15
//
// PORT: SOURCE EXECUTIVE.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE EXECUTIVE.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE EXECUTIVE.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE EXECUTIVE.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE EXECUTIVE.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE EXECUTIVE.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE EXECUTIVE.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE EXECUTIVE.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE EXECUTIVE.agc:24
//# actually created.
// PORT: SOURCE EXECUTIVE.agc:25
//#
// PORT: SOURCE EXECUTIVE.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE EXECUTIVE.agc:27
//#
// PORT: SOURCE EXECUTIVE.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE EXECUTIVE.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE EXECUTIVE.agc:30
//
// PORT: SOURCE EXECUTIVE.agc:31
//# Page 1103
// PORT: SOURCE EXECUTIVE.agc:32
//		BLOCK	02
// PORT: SOURCE EXECUTIVE.agc:33
//
// PORT: SOURCE EXECUTIVE.agc:34
//# TO ENTER A JOB REQUEST REQUIRING NO VAC AREA:
// PORT: SOURCE EXECUTIVE.agc:35
//
// PORT: SOURCE EXECUTIVE.agc:36
//		COUNT*	$$/EXEC
// PORT: SOURCE EXECUTIVE.agc:37
//NOVAC		INHINT
// PORT: Fixed ROM slots 4666.
            if slot <> 4666 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:38
//		AD	FAKEPRET	# LOC(MPAC +6) - LOC(QPRET)
// PORT: Fixed ROM slots 4667.
            if slot <> 4667 or instruction <> 27252 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2676), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4668 {
// PORT: SOURCE EXECUTIVE.agc:39
//		TS	NEWPRIO		# PRIORITY OF NEW JOB + NOVAC C(FIXLOC)
// PORT: Fixed ROM slots 4668.
            if slot <> 4668 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4669 {
// PORT: SOURCE EXECUTIVE.agc:40
//
// PORT: SOURCE EXECUTIVE.agc:41
//		EXTEND
// PORT: Fixed ROM slots 4669.
                if slot <> 4669 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:42
//		INDEX	Q		# Q WILL BE UNDISTURBED THROUGHOUT.
// PORT: Fixed ROM slots 4670.
                if slot <> 4670 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE EXECUTIVE.agc:43
//		DCA	0		# 2CADR OF JOB ENTERED.
// PORT: Fixed ROM slots 4671.
    4671, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4672–4680.
function agcAotUnit187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4675 {
        if slot <= 4673 {
            if slot <= 4672 {
// PORT: SOURCE EXECUTIVE.agc:44
//		DXCH	NEWLOC
// PORT: Fixed ROM slots 4672.
                if slot <> 4672 or instruction <> 21558 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:45
//		CAF	EXECBANK
// PORT: Fixed ROM slots 4673.
                if slot <> 4673 or instruction <> 14963 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4674 {
// PORT: SOURCE EXECUTIVE.agc:46
//		XCH	FBANK
// PORT: Fixed ROM slots 4674.
                if slot <> 4674 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:47
//		TS	EXECTEM1
// PORT: Fixed ROM slots 4675.
                if slot <> 4675 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4677 {
            if slot <= 4676 {
// PORT: SOURCE EXECUTIVE.agc:48
//		TCF	NOVAC2		# ENTER EXECUTIVE BANK.
// PORT: Fixed ROM slots 4676.
                if slot <> 4676 or instruction <> 5525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5525, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:49
//
// PORT: SOURCE EXECUTIVE.agc:50
//# TO ENTER A JOB REQUEST REQUIREING A VAC AREA -- E.G., ALL (PARTIALLY) INTERPRETIVE JOBS.
// PORT: SOURCE EXECUTIVE.agc:51
//
// PORT: SOURCE EXECUTIVE.agc:52
//FINDVAC		INHINT
// PORT: Fixed ROM slots 4677.
                if slot <> 4677 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4678 {
// PORT: SOURCE EXECUTIVE.agc:53
//		TS	NEWPRIO
// PORT: Fixed ROM slots 4678.
                if slot <> 4678 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4679 {
// PORT: SOURCE EXECUTIVE.agc:54
//		EXTEND
// PORT: Fixed ROM slots 4679.
                    if slot <> 4679 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:55
//		INDEX	Q
// PORT: Fixed ROM slots 4680.
                    if slot <> 4680 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE EXECUTIVE.agc:56
//		DCA	0
// PORT: Fixed ROM slots 4681.
    4681, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4682–4722.
function agcAotUnit188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4701 {
        if slot <= 4691 {
            if slot <= 4686 {
                if slot <= 4683 {
                    if slot <= 4682 {
// PORT: SOURCE EXECUTIVE.agc:57
//SPVACIN		DXCH	NEWLOC
// PORT: Fixed ROM slots 4682.
                        if slot <> 4682 or instruction <> 21558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:58
//		CAF	EXECBANK
// PORT: Fixed ROM slots 4683.
                        if slot <> 4683 or instruction <> 14963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4684 {
// PORT: SOURCE EXECUTIVE.agc:59
//		XCH	FBANK
// PORT: Fixed ROM slots 4684.
                        if slot <> 4684 or instruction <> 23556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 4, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4685 {
// PORT: SOURCE EXECUTIVE.agc:60
//		TCF	FINDVAC2	# OFF TO EXECUTIVE SWITCHED-BANK.
// PORT: Fixed ROM slots 4685.
                            if slot <> 4685 or instruction <> 5505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5505, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:61
//
// PORT: SOURCE EXECUTIVE.agc:62
//# TO ENTER A FINDVAC WITH THE PRIORITY IN NEWPRIO TO THE 2CADR ARRIVING IN A AND L:
// PORT: SOURCE EXECUTIVE.agc:63
//# USERS OF SPVAC MUST INHINT BEFORE STORING IN NEWPRIO.
// PORT: SOURCE EXECUTIVE.agc:64
//
// PORT: SOURCE EXECUTIVE.agc:65
//SPVAC		XCH	Q
// PORT: Fixed ROM slots 4686.
                            if slot <> 4686 or instruction <> 23554 { return choose false if checkOnly else -1. }
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
                if slot <= 4688 {
                    if slot <= 4687 {
// PORT: SOURCE EXECUTIVE.agc:66
//		AD	NEG2
// PORT: Fixed ROM slots 4687.
                        if slot <> 4687 or instruction <> 28646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:67
//		XCH	Q
// PORT: Fixed ROM slots 4688.
                        if slot <> 4688 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4689 {
// PORT: SOURCE EXECUTIVE.agc:68
//		TCF	SPVACIN
// PORT: Fixed ROM slots 4689.
                        if slot <> 4689 or instruction <> 6730 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6730, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4690 {
// PORT: SOURCE EXECUTIVE.agc:69
//
// PORT: SOURCE EXECUTIVE.agc:70
//# TO SUSPEND A BASIC JOB SO A HIGHER PRIORITY JOB MAY BE SERVICED:
// PORT: SOURCE EXECUTIVE.agc:71
//
// PORT: SOURCE EXECUTIVE.agc:72
//CHANG1		LXCH	Q
// PORT: Fixed ROM slots 4690.
                            if slot <> 4690 or instruction <> 9218 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 2, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:73
//		CAF	EXECBANK
// PORT: Fixed ROM slots 4691.
                            if slot <> 4691 or instruction <> 14963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 4696 {
                if slot <= 4693 {
                    if slot <= 4692 {
// PORT: SOURCE EXECUTIVE.agc:74
//		XCH	BBANK
// PORT: Fixed ROM slots 4692.
                        if slot <> 4692 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:75
//		TCF	CHANJOB
// PORT: Fixed ROM slots 4693.
                        if slot <> 4693 or instruction <> 5574 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5574, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4694 {
// PORT: SOURCE EXECUTIVE.agc:76
//
// PORT: SOURCE EXECUTIVE.agc:77
//# TO SUSPEND AN INTERPRETIVE JOB:
// PORT: SOURCE EXECUTIVE.agc:78
//
// PORT: SOURCE EXECUTIVE.agc:79
//CHANG2		CS	LOC		# NEGATIVE LOC SHOWS JOB = INTERPRETIVE.
// PORT: Fixed ROM slots 4694.
                        if slot <> 4694 or instruction <> 16500 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 116).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4695 {
// PORT: SOURCE EXECUTIVE.agc:80
//# ITRACE (4) REFERS TO "CHANG2"
// PORT: SOURCE EXECUTIVE.agc:81
//		TS	L
// PORT: Fixed ROM slots 4695.
                            if slot <> 4695 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:82
//# Page 1104
// PORT: SOURCE EXECUTIVE.agc:83
// +2		CAF	EXECBANK
// PORT: Fixed ROM slots 4696.
                            if slot <> 4696 or instruction <> 14963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4698 {
                    if slot <= 4697 {
// PORT: SOURCE EXECUTIVE.agc:84
//		TS	BBANK
// PORT: Fixed ROM slots 4697.
                        if slot <> 4697 or instruction <> 22534 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22534, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:85
//		TCF	CHANJOB -1
// PORT: Fixed ROM slots 4698.
                        if slot <> 4698 or instruction <> 5573 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5573, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4699 {
// PORT: SOURCE EXECUTIVE.agc:86
//
// PORT: SOURCE EXECUTIVE.agc:87
//# Page 1105
// PORT: SOURCE EXECUTIVE.agc:88
//# TO VOLUNTARILY SUSPEND A JOB UNTIL THE COMPLETION OF SOME ANTICIPATED EVENT (I/O EVENT ETC.):
// PORT: SOURCE EXECUTIVE.agc:89
//
// PORT: SOURCE EXECUTIVE.agc:90
//JOBSLEEP	TS	LOC
// PORT: Fixed ROM slots 4699.
                        if slot <> 4699 or instruction <> 22644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4700 {
// PORT: SOURCE EXECUTIVE.agc:91
//		CAF	EXECBANK
// PORT: Fixed ROM slots 4700.
                            if slot <> 4700 or instruction <> 14963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:92
//		TS	FBANK
// PORT: Fixed ROM slots 4701.
                            if slot <> 4701 or instruction <> 22532 { return choose false if checkOnly else -1. }
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
        if slot <= 4711 {
            if slot <= 4706 {
                if slot <= 4703 {
                    if slot <= 4702 {
// PORT: SOURCE EXECUTIVE.agc:93
//		TCF	JOBSLP1
// PORT: Fixed ROM slots 4702.
                        if slot <> 4702 or instruction <> 5630 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5630, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:94
//
// PORT: SOURCE EXECUTIVE.agc:95
//# TO AWAKEN A JOB PUT TO SLEEP IN THE ABOVE FASHION:
// PORT: SOURCE EXECUTIVE.agc:96
//
// PORT: SOURCE EXECUTIVE.agc:97
//JOBWAKE		INHINT
// PORT: Fixed ROM slots 4703.
                        if slot <> 4703 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4704 {
// PORT: SOURCE EXECUTIVE.agc:98
//		TS	NEWLOC
// PORT: Fixed ROM slots 4704.
                        if slot <> 4704 or instruction <> 22581 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22581, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4705 {
// PORT: SOURCE EXECUTIVE.agc:99
//		CS	TWO		# EXIT IS VIA FINDVAC/NOVAC PROCEDURES.
// PORT: Fixed ROM slots 4705.
                            if slot <> 4705 or instruction <> 18922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:100
//		ADS	Q
// PORT: Fixed ROM slots 4706.
                            if slot <> 4706 or instruction <> 11266 { return choose false if checkOnly else -1. }
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
                if slot <= 4708 {
                    if slot <= 4707 {
// PORT: SOURCE EXECUTIVE.agc:101
//		CAF	EXECBANK
// PORT: Fixed ROM slots 4707.
                        if slot <> 4707 or instruction <> 14963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:102
//		XCH	FBANK
// PORT: Fixed ROM slots 4708.
                        if slot <> 4708 or instruction <> 23556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 4, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4709 {
// PORT: SOURCE EXECUTIVE.agc:103
//		TCF	JOBWAKE2
// PORT: Fixed ROM slots 4709.
                        if slot <> 4709 or instruction <> 5651 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5651, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4710 {
// PORT: SOURCE EXECUTIVE.agc:104
//
// PORT: SOURCE EXECUTIVE.agc:105
//# TO CHANGE THE PRIORITY OF A JOB CURRENTLY UNDER EXECUTION:
// PORT: SOURCE EXECUTIVE.agc:106
//
// PORT: SOURCE EXECUTIVE.agc:107
//PRIOCHNG	INHINT			# NEW PRIORITY ARRIVES IN A.  RETURNS TO
// PORT: Fixed ROM slots 4710.
                            if slot <> 4710 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:108
//		TS	NEWPRIO		# CALLER AS SOON AS NEW JOB PRIORITY IS
// PORT: Fixed ROM slots 4711.
                            if slot <> 4711 or instruction <> 22579 { return choose false if checkOnly else -1. }
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
            if slot <= 4716 {
                if slot <= 4713 {
                    if slot <= 4712 {
// PORT: SOURCE EXECUTIVE.agc:109
//		CAF	EXECBANK	# HIGHEST.  PREPARE FOR POSSIBLE BASIC-
// PORT: Fixed ROM slots 4712.
                        if slot <> 4712 or instruction <> 14963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:110
//		XCH	BBANK		# STYLE CHANGE-JOB.
// PORT: Fixed ROM slots 4713.
                        if slot <> 4713 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4714 {
// PORT: SOURCE EXECUTIVE.agc:111
//		TS	BANKSET
// PORT: Fixed ROM slots 4714.
                        if slot <> 4714 or instruction <> 22645 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22645, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4715 {
// PORT: SOURCE EXECUTIVE.agc:112
//		CA	Q
// PORT: Fixed ROM slots 4715.
                            if slot <> 4715 or instruction <> 12290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 2).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:113
//		TCF	PRIOCH2
// PORT: Fixed ROM slots 4716.
                            if slot <> 4716 or instruction <> 5690 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5690, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4719 {
                    if slot <= 4717 {
// PORT: SOURCE EXECUTIVE.agc:114
//
// PORT: SOURCE EXECUTIVE.agc:115
//# TO REMOVE A JOB FROM EXECUTIVE CONSIDERATIONS:
// PORT: SOURCE EXECUTIVE.agc:116
//
// PORT: SOURCE EXECUTIVE.agc:117
//ENDOFJOB	CAF	EXECBANK
// PORT: Fixed ROM slots 4717.
                        if slot <> 4717 or instruction <> 14963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2675), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4718 {
// PORT: SOURCE EXECUTIVE.agc:118
//		TS	FBANK
// PORT: Fixed ROM slots 4718.
                            if slot <> 4718 or instruction <> 22532 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22532, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:119
//		TCF	ENDJOB1
// PORT: Fixed ROM slots 4719.
                            if slot <> 4719 or instruction <> 5699 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5699, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4720 {
// PORT: SOURCE EXECUTIVE.agc:120
//
// PORT: SOURCE EXECUTIVE.agc:121
//ENDFIND		CA	EXECTEM1	# RETURN TO CALLER AFTER JOB ENTRY
// PORT: Fixed ROM slots 4720.
                        if slot <> 4720 or instruction <> 12337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 49).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4721 {
// PORT: SOURCE EXECUTIVE.agc:122
//		TS	FBANK		# COMPLETE.
// PORT: Fixed ROM slots 4721.
                            if slot <> 4721 or instruction <> 22532 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22532, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:123
//		TCF	Q+2
// PORT: Fixed ROM slots 4722.
                            if slot <> 4722 or instruction <> 7649 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7649, words[0], readEffective).
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
// PORT: SOURCE EXECUTIVE.agc:124
//EXECBANK	CADR	FINDVAC2
// PORT: Fixed ROM slots 4723.
    4723, 2818,
// PORT: SOURCE EXECUTIVE.agc:125
//
// PORT: SOURCE EXECUTIVE.agc:126
//FAKEPRET	ADRES	MPAC -36D	# LOC(MPAC +6) - LOC(QPRET)
// PORT: Fixed ROM slots 4724.
    4724, 144
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3457–3470.
function agcAotUnit82 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3463 {
        if slot <= 3459 {
            if slot <= 3457 {
// PORT: SOURCE EXECUTIVE.agc:127
//
// PORT: SOURCE EXECUTIVE.agc:128
//# Page 1106
// PORT: SOURCE EXECUTIVE.agc:129
//# LOCATE AN AVAILABLE VAC AREA
// PORT: SOURCE EXECUTIVE.agc:130
//
// PORT: SOURCE EXECUTIVE.agc:131
//		BANK	01
// PORT: SOURCE EXECUTIVE.agc:132
//		COUNT*	$$/EXEC
// PORT: SOURCE EXECUTIVE.agc:133
//FINDVAC2	TS	EXECTEM1	# (SAVE CALLER'S BANK FIRST.)
// PORT: Fixed ROM slots 3457.
                if slot <> 3457 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3458 {
// PORT: SOURCE EXECUTIVE.agc:134
//		CCS	VAC1USE
// PORT: Fixed ROM slots 3458.
                    if slot <> 3458 or instruction <> 4352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 256).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:135
//		TCF	VACFOUND
// PORT: Fixed ROM slots 3459.
                    if slot <> 3459 or instruction <> 5520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3461 {
                if slot <= 3460 {
// PORT: SOURCE EXECUTIVE.agc:136
//		CCS	VAC2USE
// PORT: Fixed ROM slots 3460.
                    if slot <> 3460 or instruction <> 4396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 300).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:137
//		TCF	VACFOUND
// PORT: Fixed ROM slots 3461.
                    if slot <> 3461 or instruction <> 5520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3462 {
// PORT: SOURCE EXECUTIVE.agc:138
//		CCS	VAC3USE
// PORT: Fixed ROM slots 3462.
                    if slot <> 3462 or instruction <> 4440 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 344).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:139
//		TCF	VACFOUND
// PORT: Fixed ROM slots 3463.
                    if slot <> 3463 or instruction <> 5520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3466 {
            if slot <= 3464 {
// PORT: SOURCE EXECUTIVE.agc:140
//		CCS	VAC4USE
// PORT: Fixed ROM slots 3464.
                if slot <> 3464 or instruction <> 4484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 388).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3465 {
// PORT: SOURCE EXECUTIVE.agc:141
//		TCF	VACFOUND
// PORT: Fixed ROM slots 3465.
                    if slot <> 3465 or instruction <> 5520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:142
//		CCS	VAC5USE
// PORT: Fixed ROM slots 3466.
                    if slot <> 3466 or instruction <> 4528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 432).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3468 {
                if slot <= 3467 {
// PORT: SOURCE EXECUTIVE.agc:143
//		TCF	VACFOUND
// PORT: Fixed ROM slots 3467.
                    if slot <> 3467 or instruction <> 5520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:144
//		LXCH	EXECTEM1
// PORT: Fixed ROM slots 3468.
                    if slot <> 3468 or instruction <> 9265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 49, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3469 {
// PORT: SOURCE EXECUTIVE.agc:145
//		CA	Q
// PORT: Fixed ROM slots 3469.
                    if slot <> 3469 or instruction <> 12290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:146
//		TC	BAILOUT1
// PORT: Fixed ROM slots 3470.
                    if slot <> 3470 or instruction <> 3022 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3022, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[82] to agcAotUnit82@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:147
//		OCT	1201		# NO VAC AREAS.
// PORT: Fixed ROM slots 3471.
    3471, 1282
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3472–3474.
function agcAotUnit83 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3472 {
// PORT: SOURCE EXECUTIVE.agc:148
//
// PORT: SOURCE EXECUTIVE.agc:149
//VACFOUND	AD	TWO		# RESERVE THIS VAC AREA BY STORING A ZERO
// PORT: Fixed ROM slots 3472.
        if slot <> 3472 or instruction <> 27114 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3473 {
// PORT: SOURCE EXECUTIVE.agc:150
//		ZL			# IN ITS VAC USE REGISTER AND STORE THE
// PORT: Fixed ROM slots 3473.
            if slot <> 3473 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:151
//		INDEX	A		# ADDRESS OF THE FIRST WORD OF IT IN THE
// PORT: Fixed ROM slots 3474.
            if slot <> 3474 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[83] to agcAotUnit83@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:152
//		LXCH	0 	-1	# LOW NINE BITS OF THE PRIORITY WORD.
// PORT: Fixed ROM slots 3475.
    3475, 18430
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3476–3481.
function agcAotUnit84 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3478 {
        if slot <= 3476 {
// PORT: SOURCE EXECUTIVE.agc:153
//		ADS	NEWPRIO
// PORT: Fixed ROM slots 3476.
            if slot <> 3476 or instruction <> 11315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 51).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3477 {
// PORT: SOURCE EXECUTIVE.agc:154
//
// PORT: SOURCE EXECUTIVE.agc:155
//NOVAC2		CAF	ZERO		# NOVAC ENTERS HERE.  FIND A CORE SET.
// PORT: Fixed ROM slots 3477.
                if slot <> 3477 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:156
//		TS	LOCCTR
// PORT: Fixed ROM slots 3478.
                if slot <> 3478 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3479 {
// PORT: SOURCE EXECUTIVE.agc:157
//		CAF	NO.CORES	# SEVEN SETS OF ELEVEN REGISTERS EACH.
// PORT: Fixed ROM slots 3479.
            if slot <> 3479 or instruction <> 13724 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1436), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3480 {
// PORT: SOURCE EXECUTIVE.agc:158
//NOVAC3		TS	EXECTEM2
// PORT: Fixed ROM slots 3480.
                if slot <> 3480 or instruction <> 22578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:159
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3481.
                if slot <> 3481 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[84] to agcAotUnit84@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:160
//		CCS	PRIORITY	# EACH PRIORITY REGISTER CONTAINS -0 IF
// PORT: Fixed ROM slots 3482.
    3482, 8430
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3483–3483.
function agcAotUnit85 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXECUTIVE.agc:161
//		TCF	NEXTCORE	# THE CORESPONDING CORE SET IS AVAILABLE.
// PORT: Fixed ROM slots 3483.
    if slot <> 3483 or instruction <> 5564 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5564, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[85] to agcAotUnit85@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:162
//NO.CORES	DEC	7
// PORT: Fixed ROM slots 3484.
    3484, 14
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3485–3487.
function agcAotUnit86 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3485 {
// PORT: SOURCE EXECUTIVE.agc:163
//		TCF	NEXTCORE	# AN ACTIVE JOB HAS A POSITIVE PRIORITY
// PORT: Fixed ROM slots 3485.
        if slot <> 3485 or instruction <> 5564 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5564, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3486 {
// PORT: SOURCE EXECUTIVE.agc:164
//					# BUT A DORMANT JOB'S PRIORITY IS NEGATIVE
// PORT: SOURCE EXECUTIVE.agc:165
//
// PORT: SOURCE EXECUTIVE.agc:166
//# Page 1107
// PORT: SOURCE EXECUTIVE.agc:167
//CORFOUND	CA	NEWPRIO		# SET THE PRIORITY OF THIS JOB IN THE CORE
// PORT: Fixed ROM slots 3486.
            if slot <> 3486 or instruction <> 12339 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 51).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:168
//		INDEX	LOCCTR		# SET'S PRIORITY REGISTER AND SET THE
// PORT: Fixed ROM slots 3487.
            if slot <> 3487 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[86] to agcAotUnit86@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:169
//		TS	PRIORITY	# JOB'S PUSH-DOWN POINTER AT THE BEGINNING
// PORT: Fixed ROM slots 3488.
    3488, 45294
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3489–3490.
function agcAotUnit87 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3489 {
// PORT: SOURCE EXECUTIVE.agc:170
//		MASK	LOW9		# OF THE WORK AREA AND OVERFLOW INDICATOR.
// PORT: Fixed ROM slots 3489.
        if slot <> 3489 or instruction <> 31236 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            set words[0] to agcOverflowCorrected(words[0]).
            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
            if fixedOperand = 511 {
                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
            } else {
                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
            }
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXECUTIVE.agc:171
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3490.
        if slot <> 3490 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[87] to agcAotUnit87@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:172
//		TS	PUSHLOC		# OFF TO PREPARE FOR INTERPRETIVE PROGRAMS.
// PORT: Fixed ROM slots 3491.
    3491, 45292
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3492–3506.
function agcAotUnit88 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3498 {
        if slot <= 3494 {
            if slot <= 3492 {
// PORT: SOURCE EXECUTIVE.agc:173
//
// PORT: SOURCE EXECUTIVE.agc:174
//		CCS	LOCCTR		# IF CORE SET ZERO IS BEING LOADED, SET UP
// PORT: Fixed ROM slots 3492.
                if slot <> 3492 or instruction <> 4148 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3493 {
// PORT: SOURCE EXECUTIVE.agc:175
//		TCF	SETLOC		# OVFIND AND FIXLOC IMMEDIATELY.
// PORT: Fixed ROM slots 3493.
                    if slot <> 3493 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:176
//		TS	OVFIND
// PORT: Fixed ROM slots 3494.
                    if slot <> 3494 or instruction <> 22609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22609, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3496 {
                if slot <= 3495 {
// PORT: SOURCE EXECUTIVE.agc:177
//		CA	PUSHLOC
// PORT: Fixed ROM slots 3495.
                    if slot <> 3495 or instruction <> 12406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 118).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:178
//		TS	FIXLOC
// PORT: Fixed ROM slots 3496.
                    if slot <> 3496 or instruction <> 22608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22608, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3497 {
// PORT: SOURCE EXECUTIVE.agc:179
//
// PORT: SOURCE EXECUTIVE.agc:180
//SPECTEST	CCS	NEWJOB		# SEE IF ANY ACTIVE JOBS WAITING (RARE).
// PORT: Fixed ROM slots 3497.
                    if slot <> 3497 or instruction <> 4151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:181
//		TCF	SETLOC		# MUST BE AWAKENED OUT UNCHANGED JOB.
// PORT: Fixed ROM slots 3498.
                    if slot <> 3498 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3502 {
            if slot <= 3500 {
                if slot <= 3499 {
// PORT: SOURCE EXECUTIVE.agc:182
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3499.
                    if slot <> 3499 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:183
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3500.
                    if slot <> 3500 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3501 {
// PORT: SOURCE EXECUTIVE.agc:184
//		TS	NEWJOB		# +0 SHOWS ACTIVE JOB ALREADY SET.
// PORT: Fixed ROM slots 3501.
                    if slot <> 3501 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:185
//		DXCH	NEWLOC
// PORT: Fixed ROM slots 3502.
                    if slot <> 3502 or instruction <> 21558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3504 {
                if slot <= 3503 {
// PORT: SOURCE EXECUTIVE.agc:186
//		DXCH	LOC
// PORT: Fixed ROM slots 3503.
                    if slot <> 3503 or instruction <> 21621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:187
//		TCF	ENDFIND
// PORT: Fixed ROM slots 3504.
                    if slot <> 3504 or instruction <> 6768 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6768, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3505 {
// PORT: SOURCE EXECUTIVE.agc:188
//
// PORT: SOURCE EXECUTIVE.agc:189
//SETLOC		DXCH	NEWLOC		# SET UP THE LOCATION REGISTERS FOR THIS
// PORT: Fixed ROM slots 3505.
                    if slot <> 3505 or instruction <> 21558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:190
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3506.
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
    }
}
set agcAotRoutes[88] to agcAotUnit88@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:191
//		DXCH	LOC
// PORT: Fixed ROM slots 3507.
    3507, 43242
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3508–3508.
function agcAotUnit89 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXECUTIVE.agc:192
//		INDEX	NEWJOB		# THIS INDEX INSTRUCTION INSURES THAT THE
// PORT: Fixed ROM slots 3508.
    if slot <> 3508 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[89] to agcAotUnit89@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:193
//		CS	PRIORITY	# HIGHEST ACTIVE PRIORITY WILL BE COMPARED
// PORT: Fixed ROM slots 3509.
    3509, 33006
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3510–3522.
function agcAotUnit90 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3515 {
        if slot <= 3512 {
            if slot <= 3510 {
// PORT: SOURCE EXECUTIVE.agc:194
//		AD	NEWPRIO		# WITH THE NEW PRIORITY TO SEE IF NEWJOB
// PORT: Fixed ROM slots 3510.
                if slot <> 3510 or instruction <> 24627 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 51).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3511 {
// PORT: SOURCE EXECUTIVE.agc:195
//		EXTEND			# SHOULD BE SET TO SIGNAL A SWITCH.
// PORT: Fixed ROM slots 3511.
                    if slot <> 3511 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:196
//		BZMF	ENDFIND
// PORT: Fixed ROM slots 3512.
                    if slot <> 3512 or instruction <> 27248 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 27248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3513 {
// PORT: SOURCE EXECUTIVE.agc:197
//		CA	LOCCTR		# LOCCTR IS LEFT SET AT THIS CORE SET IF
// PORT: Fixed ROM slots 3513.
                if slot <> 3513 or instruction <> 12340 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3514 {
// PORT: SOURCE EXECUTIVE.agc:198
//		TS	NEWJOB		# THE CALLER WANTS TO LOAD ANY MPAC
// PORT: Fixed ROM slots 3514.
                    if slot <> 3514 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:199
//		TCF	ENDFIND		# REGISTERS, ETC.
// PORT: Fixed ROM slots 3515.
                    if slot <> 3515 or instruction <> 6768 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6768, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3518 {
            if slot <= 3516 {
// PORT: SOURCE EXECUTIVE.agc:200
//
// PORT: SOURCE EXECUTIVE.agc:201
//NEXTCORE	CAF	COREINC
// PORT: Fixed ROM slots 3516.
                if slot <> 3516 or instruction <> 13851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3517 {
// PORT: SOURCE EXECUTIVE.agc:202
//		ADS	LOCCTR
// PORT: Fixed ROM slots 3517.
                    if slot <> 3517 or instruction <> 11316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 52).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:203
//		CCS	EXECTEM2
// PORT: Fixed ROM slots 3518.
                    if slot <> 3518 or instruction <> 4146 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3520 {
                if slot <= 3519 {
// PORT: SOURCE EXECUTIVE.agc:204
//		TCF	NOVAC3
// PORT: Fixed ROM slots 3519.
                    if slot <> 3519 or instruction <> 5528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:205
//		LXCH	EXECTEM1
// PORT: Fixed ROM slots 3520.
                    if slot <> 3520 or instruction <> 9265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 49, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3521 {
// PORT: SOURCE EXECUTIVE.agc:206
//		CA	Q
// PORT: Fixed ROM slots 3521.
                    if slot <> 3521 or instruction <> 12290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:207
//		TC	BAILOUT1	# NO CORE SETS AVAILABLE.
// PORT: Fixed ROM slots 3522.
                    if slot <> 3522 or instruction <> 3022 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3022, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[90] to agcAotUnit90@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:208
//		OCT	1202
// PORT: Fixed ROM slots 3523.
    3523, 1284
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3524–3530.
function agcAotUnit91 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3526 {
        if slot <= 3524 {
// PORT: SOURCE EXECUTIVE.agc:209
//# Page 1108
// PORT: SOURCE EXECUTIVE.agc:210
//# THE FOLLOWING ROUTINE SWAPS CORE SET 0 WITH THAT WHOSE RELATIVE ADDRESS IS IN NEWJOB.
// PORT: SOURCE EXECUTIVE.agc:211
//
// PORT: SOURCE EXECUTIVE.agc:212
// -2		LXCH	LOC
// PORT: Fixed ROM slots 3524.
            if slot <> 3524 or instruction <> 9332 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 116, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3525 {
// PORT: SOURCE EXECUTIVE.agc:213
// -1		CAE	BANKSET		# BANKSET, NOT BBANK, HAS RIGHT CONTENTS.
// PORT: Fixed ROM slots 3525.
                if slot <> 3525 or instruction <> 12405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 117).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:214
//CHANJOB		INHINT
// PORT: Fixed ROM slots 3526.
                if slot <> 3526 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3528 {
            if slot <= 3527 {
// PORT: SOURCE EXECUTIVE.agc:215
//		EXTEND
// PORT: Fixed ROM slots 3527.
                if slot <> 3527 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:216
//		ROR	SUPERBNK	# PICK UP CURRENT SBANK FOR BBCON
// PORT: Fixed ROM slots 3528.
                if slot <> 3528 or instruction <> 2055 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3529 {
// PORT: SOURCE EXECUTIVE.agc:217
//		XCH	L		# LOC IN A AND BBCON IN L.
// PORT: Fixed ROM slots 3529.
                if slot <> 3529 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:218
// +4		INDEX	NEWJOB		# SWAP LOC AND BANKSET.
// PORT: Fixed ROM slots 3530.
                if slot <> 3530 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[91] to agcAotUnit91@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:219
//		DXCH	LOC
// PORT: Fixed ROM slots 3531.
    3531, 43242
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3532–3537.
function agcAotUnit92 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3534 {
        if slot <= 3532 {
// PORT: SOURCE EXECUTIVE.agc:220
//		DXCH	LOC
// PORT: Fixed ROM slots 3532.
            if slot <> 3532 or instruction <> 21621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3533 {
// PORT: SOURCE EXECUTIVE.agc:221
//
// PORT: SOURCE EXECUTIVE.agc:222
//		CAE	BANKSET
// PORT: Fixed ROM slots 3533.
                if slot <> 3533 or instruction <> 12405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 117).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:223
//		EXTEND
// PORT: Fixed ROM slots 3534.
                if slot <> 3534 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3535 {
// PORT: SOURCE EXECUTIVE.agc:224
//		WRITE	SUPERBNK	# SET SBANK FOR NEW JOB.
// PORT: Fixed ROM slots 3535.
            if slot <> 3535 or instruction <> 519 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3536 {
// PORT: SOURCE EXECUTIVE.agc:225
//		DXCH	MPAC		# SWAP MULTI-PURPOSE ACCUMULATOR AREAS.
// PORT: Fixed ROM slots 3536.
                if slot <> 3536 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:226
//		INDEX	NEWJOB
// PORT: Fixed ROM slots 3537.
                if slot <> 3537 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[92] to agcAotUnit92@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:227
//		DXCH	MPAC
// PORT: Fixed ROM slots 3538.
    3538, 43226
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3539–3541.
function agcAotUnit93 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3539 {
// PORT: SOURCE EXECUTIVE.agc:228
//		DXCH	MPAC
// PORT: Fixed ROM slots 3539.
        if slot <> 3539 or instruction <> 21613 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3540 {
// PORT: SOURCE EXECUTIVE.agc:229
//		DXCH	MPAC 	+2
// PORT: Fixed ROM slots 3540.
            if slot <> 3540 or instruction <> 21615 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:230
//		INDEX	NEWJOB
// PORT: Fixed ROM slots 3541.
            if slot <> 3541 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[93] to agcAotUnit93@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:231
//		DXCH	MPAC 	+2
// PORT: Fixed ROM slots 3542.
    3542, 43230
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3543–3545.
function agcAotUnit94 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3543 {
// PORT: SOURCE EXECUTIVE.agc:232
//		DXCH	MPAC	+2
// PORT: Fixed ROM slots 3543.
        if slot <> 3543 or instruction <> 21615 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3544 {
// PORT: SOURCE EXECUTIVE.agc:233
//		DXCH	MPAC 	+4
// PORT: Fixed ROM slots 3544.
            if slot <> 3544 or instruction <> 21617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:234
//		INDEX	NEWJOB
// PORT: Fixed ROM slots 3545.
            if slot <> 3545 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[94] to agcAotUnit94@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:235
//		DXCH	MPAC 	+4
// PORT: Fixed ROM slots 3546.
    3546, 43234
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3547–3549.
function agcAotUnit95 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3547 {
// PORT: SOURCE EXECUTIVE.agc:236
//		DXCH	MPAC 	+4
// PORT: Fixed ROM slots 3547.
        if slot <> 3547 or instruction <> 21617 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3548 {
// PORT: SOURCE EXECUTIVE.agc:237
//		DXCH	MPAC 	+6
// PORT: Fixed ROM slots 3548.
            if slot <> 3548 or instruction <> 21619 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 115, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:238
//		INDEX	NEWJOB
// PORT: Fixed ROM slots 3549.
            if slot <> 3549 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[95] to agcAotUnit95@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:239
//		DXCH	MPAC 	+6
// PORT: Fixed ROM slots 3550.
    3550, 43238
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3551–3559.
function agcAotUnit96 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3554 {
        if slot <= 3552 {
            if slot <= 3551 {
// PORT: SOURCE EXECUTIVE.agc:240
//		DXCH	MPAC 	+6
// PORT: Fixed ROM slots 3551.
                if slot <> 3551 or instruction <> 21619 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 115, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:241
//
// PORT: SOURCE EXECUTIVE.agc:242
//		CAF	ZERO
// PORT: Fixed ROM slots 3552.
                if slot <> 3552 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3553 {
// PORT: SOURCE EXECUTIVE.agc:243
//		XCH	OVFIND		# MAKE PUSHLOC NEGATIVE IF OVFIND NZ.
// PORT: Fixed ROM slots 3553.
                if slot <> 3553 or instruction <> 23633 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 81, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:244
//		EXTEND
// PORT: Fixed ROM slots 3554.
                if slot <> 3554 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3556 {
            if slot <= 3555 {
// PORT: SOURCE EXECUTIVE.agc:245
//		BZF	+3
// PORT: Fixed ROM slots 3555.
                if slot <> 3555 or instruction <> 5606 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5606, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:246
//		CS	PUSHLOC
// PORT: Fixed ROM slots 3556.
                if slot <> 3556 or instruction <> 16502 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 118).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3557 {
// PORT: SOURCE EXECUTIVE.agc:247
//		TS	PUSHLOC
// PORT: Fixed ROM slots 3557.
                if slot <> 3557 or instruction <> 22646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22646, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3558 {
// PORT: SOURCE EXECUTIVE.agc:248
//
// PORT: SOURCE EXECUTIVE.agc:249
//		DXCH	PUSHLOC
// PORT: Fixed ROM slots 3558.
                    if slot <> 3558 or instruction <> 21623 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 119, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:250
//		INDEX	NEWJOB
// PORT: Fixed ROM slots 3559.
                    if slot <> 3559 or instruction <> 20535 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[96] to agcAotUnit96@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:251
//		DXCH	PUSHLOC
// PORT: Fixed ROM slots 3560.
    3560, 43246
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3561–3599.
function agcAotUnit97 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3579 {
        if slot <= 3569 {
            if slot <= 3564 {
                if slot <= 3562 {
                    if slot <= 3561 {
// PORT: SOURCE EXECUTIVE.agc:252
//		DXCH	PUSHLOC		# SWAPS PUSHLOC AND PRIORITY.
// PORT: Fixed ROM slots 3561.
                        if slot <> 3561 or instruction <> 21623 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 119, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:253
//		CAF	LOW9		# SET FIXLOC TO BASE OF VAC AREA.
// PORT: Fixed ROM slots 3562.
                        if slot <> 3562 or instruction <> 14852 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3563 {
// PORT: SOURCE EXECUTIVE.agc:254
//		MASK	PRIORITY
// PORT: Fixed ROM slots 3563.
                        if slot <> 3563 or instruction <> 28791 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 119).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:255
//		TS	FIXLOC
// PORT: Fixed ROM slots 3564.
                        if slot <> 3564 or instruction <> 22608 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22608, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3566 {
                    if slot <= 3565 {
// PORT: SOURCE EXECUTIVE.agc:256
//
// PORT: SOURCE EXECUTIVE.agc:257
//		CCS	PUSHLOC		# SET OVERFLOW INDICATOR ACCORDING TO
// PORT: Fixed ROM slots 3565.
                        if slot <> 3565 or instruction <> 4214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 118).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:258
//		CAF	ZERO
// PORT: Fixed ROM slots 3566.
                        if slot <> 3566 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3567 {
// PORT: SOURCE EXECUTIVE.agc:259
//		TCF	ENDPRCHG -1
// PORT: Fixed ROM slots 3567.
                        if slot <> 3567 or instruction <> 5620 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5620, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3568 {
// PORT: SOURCE EXECUTIVE.agc:260
//
// PORT: SOURCE EXECUTIVE.agc:261
//# Page 1109
// PORT: SOURCE EXECUTIVE.agc:262
//		CS	PUSHLOC
// PORT: Fixed ROM slots 3568.
                            if slot <> 3568 or instruction <> 16502 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 118).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:263
//		TS	PUSHLOC
// PORT: Fixed ROM slots 3569.
                            if slot <> 3569 or instruction <> 22646 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22646, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 3574 {
                if slot <= 3571 {
                    if slot <= 3570 {
// PORT: SOURCE EXECUTIVE.agc:264
//		CAF	ONE
// PORT: Fixed ROM slots 3570.
                        if slot <> 3570 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:265
//		XCH	OVFIND
// PORT: Fixed ROM slots 3571.
                        if slot <> 3571 or instruction <> 23633 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 81, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3572 {
// PORT: SOURCE EXECUTIVE.agc:266
//		TS	NEWJOB
// PORT: Fixed ROM slots 3572.
                        if slot <> 3572 or instruction <> 22583 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22583, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3573 {
// PORT: SOURCE EXECUTIVE.agc:267
//
// PORT: SOURCE EXECUTIVE.agc:268
//ENDPRCHG	RELINT
// PORT: Fixed ROM slots 3573.
                            if slot <> 3573 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:269
//		DXCH	LOC		# BASIC JOBS HAVE POSITIVE ADDRESSES, SO
// PORT: Fixed ROM slots 3574.
                            if slot <> 3574 or instruction <> 21621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3576 {
                    if slot <= 3575 {
// PORT: SOURCE EXECUTIVE.agc:270
//		EXTEND			# DISPATCH WITH A DTCB.
// PORT: Fixed ROM slots 3575.
                        if slot <> 3575 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:271
//		BZMF	+2		# IF INTERPRETIVE, SET UP EBANK, ETC.
// PORT: Fixed ROM slots 3576.
                        if slot <> 3576 or instruction <> 26106 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26106, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3577 {
// PORT: SOURCE EXECUTIVE.agc:272
//		DTCB
// PORT: Fixed ROM slots 3577.
                        if slot <> 3577 or instruction <> 21510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3578 {
// PORT: SOURCE EXECUTIVE.agc:273
//# Page 1110
// PORT: SOURCE EXECUTIVE.agc:274
//		COM			# EPILOGUE TO JOB CHANGE FOR INTERPRETIVE
// PORT: Fixed ROM slots 3578.
                            if slot <> 3578 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:275
//		AD	ONE
// PORT: Fixed ROM slots 3579.
                            if slot <> 3579 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        }
    } else {
        if slot <= 3589 {
            if slot <= 3584 {
                if slot <= 3581 {
                    if slot <= 3580 {
// PORT: SOURCE EXECUTIVE.agc:276
//		TS	LOC		# RESUME
// PORT: Fixed ROM slots 3580.
                        if slot <> 3580 or instruction <> 22644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:277
//		TCF	INTRSM
// PORT: Fixed ROM slots 3581.
                        if slot <> 3581 or instruction <> 7208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7208, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3582 {
// PORT: SOURCE EXECUTIVE.agc:278
//
// PORT: SOURCE EXECUTIVE.agc:279
//# COMPLETE JOBSLEEP PREPARATIONS.
// PORT: SOURCE EXECUTIVE.agc:280
//
// PORT: SOURCE EXECUTIVE.agc:281
//JOBSLP1		INHINT
// PORT: Fixed ROM slots 3582.
                        if slot <> 3582 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3583 {
// PORT: SOURCE EXECUTIVE.agc:282
//		CS	PRIORITY	# NNZ PRIORITY SHOWS JOB ASLEEP.
// PORT: Fixed ROM slots 3583.
                            if slot <> 3583 or instruction <> 16503 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 119).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:283
//		TS	PRIORITY
// PORT: Fixed ROM slots 3584.
                            if slot <> 3584 or instruction <> 22647 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22647, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 3586 {
                    if slot <= 3585 {
// PORT: SOURCE EXECUTIVE.agc:284
//		CAF	LOW7
// PORT: Fixed ROM slots 3585.
                        if slot <> 3585 or instruction <> 15420 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:285
//		MASK	BBANK
// PORT: Fixed ROM slots 3586.
                        if slot <> 3586 or instruction <> 28678 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 6).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3587 {
// PORT: SOURCE EXECUTIVE.agc:286
//		EXTEND
// PORT: Fixed ROM slots 3587.
                        if slot <> 3587 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3588 {
// PORT: SOURCE EXECUTIVE.agc:287
//		ROR	SUPERBNK	# SAVE OLD SUPERBANK VALUE.
// PORT: Fixed ROM slots 3588.
                            if slot <> 3588 or instruction <> 2055 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:288
//		TS	BANKSET
// PORT: Fixed ROM slots 3589.
                            if slot <> 3589 or instruction <> 22645 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22645, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 3594 {
                if slot <= 3591 {
                    if slot <= 3590 {
// PORT: SOURCE EXECUTIVE.agc:289
//		CS	ZERO
// PORT: Fixed ROM slots 3590.
                        if slot <> 3590 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:290
//JOBSLP2		TS	BUF 	+1	# HOLDS -- HIGHEST PRIORITY.
// PORT: Fixed ROM slots 3591.
                        if slot <> 3591 or instruction <> 22617 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22617, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3592 {
// PORT: SOURCE EXECUTIVE.agc:291
//		TCF	EJSCAN		# SCAN FOR HIGHEST PRIORITY ALA ENDOFJOB.
// PORT: Fixed ROM slots 3592.
                        if slot <> 3592 or instruction <> 5712 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5712, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3593 {
// PORT: SOURCE EXECUTIVE.agc:292
//
// PORT: SOURCE EXECUTIVE.agc:293
//NUCHANG2	INHINT			# QUICK... DON'T LET NEWJOB CHANGE TO +0.
// PORT: Fixed ROM slots 3593.
                            if slot <> 3593 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:294
//		CCS	NEWJOB
// PORT: Fixed ROM slots 3594.
                            if slot <> 3594 or instruction <> 4151 { return choose false if checkOnly else -1. }
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
                if slot <= 3596 {
                    if slot <= 3595 {
// PORT: SOURCE EXECUTIVE.agc:295
//		TCF	+3		# NEWJOB STILL PNZ
// PORT: Fixed ROM slots 3595.
                        if slot <> 3595 or instruction <> 5646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5646, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:296
//		RELINT			# NEW JOB HAS CHANGED TO +0.  WAKE UP JOB
// PORT: Fixed ROM slots 3596.
                        if slot <> 3596 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3597 {
// PORT: SOURCE EXECUTIVE.agc:297
//		TCF	ADVAN 	+2	# VIA NUDIRECT.  (VERY RARE CASE.)
// PORT: Fixed ROM slots 3597.
                        if slot <> 3597 or instruction <> 5774 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5774, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3598 {
// PORT: SOURCE EXECUTIVE.agc:298
//
// PORT: SOURCE EXECUTIVE.agc:299
//		CAF	TWO
// PORT: Fixed ROM slots 3598.
                            if slot <> 3598 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXECUTIVE.agc:300
//		EXTEND
// PORT: Fixed ROM slots 3599.
                            if slot <> 3599 or instruction <> 6 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[97] to agcAotUnit97@.

// PORT: Physical bank 01. Shared continuation entries, slots 3600–3608.
function agcAotUnit98 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3603 {
        if slot <= 3601 {
            if slot <= 3600 {
// PORT: SOURCE EXECUTIVE.agc:301
//		WOR	DSALMOUT	# TURN ON ACTIVITY LIGHT
// PORT: Fixed ROM slots 3600.
                if slot <> 3600 or instruction <> 2569 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:302
//		DXCH	LOC		# AND SAVE ADDRESS INFO FOR BENEFIT OF
// PORT: Fixed ROM slots 3601.
                if slot <> 3601 or instruction <> 21621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3602 {
// PORT: SOURCE EXECUTIVE.agc:303
//		TCF	CHANJOB +4	# 	POSSIBLE SLEEPINT JOB.
// PORT: Fixed ROM slots 3602.
                if slot <> 3602 or instruction <> 5578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:304
//
// PORT: SOURCE EXECUTIVE.agc:305
//# Page 1111
// PORT: SOURCE EXECUTIVE.agc:306
//# TO WAKE UP A JOB, EACH CORE SET IS FOUND TO LOCATE ALL JOBS WHICH ARE ASLEEP.  IF THE FCADR IN THE
// PORT: SOURCE EXECUTIVE.agc:307
//# LOC REGISTER OF ANY SUCH JOB MATCHES THAT SUPPLIED BY THE CALLER, THAT JOB IS AWAKENED.  IF NO JOB IS FOUND,
// PORT: SOURCE EXECUTIVE.agc:308
//# LOCCTR IS SET TO -1 AND NO FURTHER ACTION TAKES PLACE.
// PORT: SOURCE EXECUTIVE.agc:309
//
// PORT: SOURCE EXECUTIVE.agc:310
//JOBWAKE2	TS	EXECTEM1
// PORT: Fixed ROM slots 3603.
                if slot <> 3603 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3605 {
            if slot <= 3604 {
// PORT: SOURCE EXECUTIVE.agc:311
//		CAF	ZERO		# BEGIN CORE SET SCAN
// PORT: Fixed ROM slots 3604.
                if slot <> 3604 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:312
//		TS	LOCCTR
// PORT: Fixed ROM slots 3605.
                if slot <> 3605 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3606 {
// PORT: SOURCE EXECUTIVE.agc:313
//		CAF	NO.CORES
// PORT: Fixed ROM slots 3606.
                if slot <> 3606 or instruction <> 13724 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1436), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3607 {
// PORT: SOURCE EXECUTIVE.agc:314
//JOBWAKE4	TS	EXECTEM2
// PORT: Fixed ROM slots 3607.
                    if slot <> 3607 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:315
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3608.
                    if slot <> 3608 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[98] to agcAotUnit98@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:316
//		CCS	PRIORITY
// PORT: Fixed ROM slots 3609.
    3609, 8430
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3610–3610.
function agcAotUnit99 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXECUTIVE.agc:317
//		TCF	JOBWAKE3	# ACTIVE JOB -- CHECK NEXT CORE SET.
// PORT: Fixed ROM slots 3610.
    if slot <> 3610 or instruction <> 5661 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5661, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[99] to agcAotUnit99@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:318
//COREINC		DEC	12		# 12 REGISTERS PER CORE SET.
// PORT: Fixed ROM slots 3611.
    3611, 24
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3612–3621.
function agcAotUnit100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3616 {
        if slot <= 3613 {
            if slot <= 3612 {
// PORT: SOURCE EXECUTIVE.agc:319
//		TCF	WAKETEST	# SLEEPING JOB -- SEE IF CADR MATCHES.
// PORT: Fixed ROM slots 3612.
                if slot <> 3612 or instruction <> 5668 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5668, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:320
//
// PORT: SOURCE EXECUTIVE.agc:321
//JOBWAKE3	CAF	COREINC
// PORT: Fixed ROM slots 3613.
                if slot <> 3613 or instruction <> 13851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3614 {
// PORT: SOURCE EXECUTIVE.agc:322
//		ADS	LOCCTR
// PORT: Fixed ROM slots 3614.
                if slot <> 3614 or instruction <> 11316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3615 {
// PORT: SOURCE EXECUTIVE.agc:323
//		CCS	EXECTEM2
// PORT: Fixed ROM slots 3615.
                    if slot <> 3615 or instruction <> 4146 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:324
//		TCF	JOBWAKE4
// PORT: Fixed ROM slots 3616.
                    if slot <> 3616 or instruction <> 5655 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5655, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3618 {
            if slot <= 3617 {
// PORT: SOURCE EXECUTIVE.agc:325
//		CS	ONE		# EXIT IF SLEEPIN JOB NOT FOUND.
// PORT: Fixed ROM slots 3617.
                if slot <> 3617 or instruction <> 18923 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:326
//		TS	LOCCTR
// PORT: Fixed ROM slots 3618.
                if slot <> 3618 or instruction <> 22580 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22580, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3619 {
// PORT: SOURCE EXECUTIVE.agc:327
//		TCF	ENDFIND
// PORT: Fixed ROM slots 3619.
                if slot <> 3619 or instruction <> 6768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6768, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3620 {
// PORT: SOURCE EXECUTIVE.agc:328
//
// PORT: SOURCE EXECUTIVE.agc:329
//WAKETEST	CS	NEWLOC
// PORT: Fixed ROM slots 3620.
                    if slot <> 3620 or instruction <> 16437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 53).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:330
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3621.
                    if slot <> 3621 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[100] to agcAotUnit100@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:331
//		AD	LOC
// PORT: Fixed ROM slots 3622.
    3622, 49384
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3623–3626.
function agcAotUnit101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3624 {
        if slot <= 3623 {
// PORT: SOURCE EXECUTIVE.agc:332
//		EXTEND
// PORT: Fixed ROM slots 3623.
            if slot <> 3623 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:333
//		BZF	+2		# IF MATCH.
// PORT: Fixed ROM slots 3624.
            if slot <> 3624 or instruction <> 5674 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5674, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3625 {
// PORT: SOURCE EXECUTIVE.agc:334
//		TCF 	JOBWAKE3	# EXAMINE NEXT CORE SET IF NO MATCH.
// PORT: Fixed ROM slots 3625.
            if slot <> 3625 or instruction <> 5661 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5661, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:335
//
// PORT: SOURCE EXECUTIVE.agc:336
//		INDEX	LOCCTR		# RE-COMPLEMENT PRIORITY TO SHOW JOB AWAKE
// PORT: Fixed ROM slots 3626.
            if slot <> 3626 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[101] to agcAotUnit101@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:337
//		CS	PRIORITY
// PORT: Fixed ROM slots 3627.
    3627, 33006
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3628–3629.
function agcAotUnit102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3628 {
// PORT: SOURCE EXECUTIVE.agc:338
//		TS	NEWPRIO
// PORT: Fixed ROM slots 3628.
        if slot <> 3628 or instruction <> 22579 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22579, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXECUTIVE.agc:339
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3629.
        if slot <> 3629 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[102] to agcAotUnit102@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:340
//		TS	PRIORITY
// PORT: Fixed ROM slots 3630.
    3630, 45294
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3631–3636.
function agcAotUnit103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3633 {
        if slot <= 3631 {
// PORT: SOURCE EXECUTIVE.agc:341
//
// PORT: SOURCE EXECUTIVE.agc:342
//		CS	FBANKMSK	# MAKE UP THE 2CADR OF THE WAKE ADDRESS
// PORT: Fixed ROM slots 3631.
            if slot <> 3631 or instruction <> 18664 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3632 {
// PORT: SOURCE EXECUTIVE.agc:343
//		MASK	NEWLOC		# USING THE CADR IN NEWLOC AND THE EBANK
// PORT: Fixed ROM slots 3632.
                if slot <> 3632 or instruction <> 28725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 53).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:344
//		AD	2K		# HALF OF BBANK SAVED IN BANKSET.
// PORT: Fixed ROM slots 3633.
                if slot <> 3633 or instruction <> 27105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3634 {
// PORT: SOURCE EXECUTIVE.agc:345
//		XCH	NEWLOC
// PORT: Fixed ROM slots 3634.
            if slot <> 3634 or instruction <> 23605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 53, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3635 {
// PORT: SOURCE EXECUTIVE.agc:346
//		MASK	FBANKMSK
// PORT: Fixed ROM slots 3635.
                if slot <> 3635 or instruction <> 30952 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                    if fixedOperand = 31744 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:347
//		INDEX	LOCCTR
// PORT: Fixed ROM slots 3636.
                if slot <> 3636 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[103] to agcAotUnit103@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:348
//		AD	BANKSET
// PORT: Fixed ROM slots 3637.
    3637, 49386
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3638–3662.
function agcAotUnit104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3649 {
        if slot <= 3643 {
            if slot <= 3640 {
                if slot <= 3638 {
// PORT: SOURCE EXECUTIVE.agc:349
//		TS	NEWLOC +1
// PORT: Fixed ROM slots 3638.
                    if slot <> 3638 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3639 {
// PORT: SOURCE EXECUTIVE.agc:350
//
// PORT: SOURCE EXECUTIVE.agc:351
//		CCS	LOCCTR		# SPECIAL TREATMENT IF THIS JOB WAS
// PORT: Fixed ROM slots 3639.
                        if slot <> 3639 or instruction <> 4148 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:352
//		TCF	SETLOC		# ALREADY IN THE RUN (0) POSITION.
// PORT: Fixed ROM slots 3640.
                        if slot <> 3640 or instruction <> 5553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3641 {
// PORT: SOURCE EXECUTIVE.agc:353
//		TCF	SPECTEST
// PORT: Fixed ROM slots 3641.
                    if slot <> 3641 or instruction <> 5545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3642 {
// PORT: SOURCE EXECUTIVE.agc:354
//
// PORT: SOURCE EXECUTIVE.agc:355
//# Page 1112
// PORT: SOURCE EXECUTIVE.agc:356
//# PRIORITY CHANGE.  CHANGE THE CONTENTS OF PRIORITY AND SCAN FOR THE JOB OF HIGHEST PRIORITY.
// PORT: SOURCE EXECUTIVE.agc:357
//
// PORT: SOURCE EXECUTIVE.agc:358
//PRIOCH2		TS	LOC
// PORT: Fixed ROM slots 3642.
                        if slot <> 3642 or instruction <> 22644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:359
//		CAF	ZERO		# SET FLAG TO TELL ENDJOB SCANNER IF THIS
// PORT: Fixed ROM slots 3643.
                        if slot <> 3643 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3646 {
                if slot <= 3644 {
// PORT: SOURCE EXECUTIVE.agc:360
//		TS	BUF		# JOB IS STILL HIGHEST PRIORITY.
// PORT: Fixed ROM slots 3644.
                    if slot <> 3644 or instruction <> 22616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3645 {
// PORT: SOURCE EXECUTIVE.agc:361
//		CAF	LOW9
// PORT: Fixed ROM slots 3645.
                        if slot <> 3645 or instruction <> 14852 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:362
//		MASK	PRIORITY
// PORT: Fixed ROM slots 3646.
                        if slot <> 3646 or instruction <> 28791 { return choose false if checkOnly else -1. }
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
                if slot <= 3647 {
// PORT: SOURCE EXECUTIVE.agc:363
//		AD	NEWPRIO
// PORT: Fixed ROM slots 3647.
                    if slot <> 3647 or instruction <> 24627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 51).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3648 {
// PORT: SOURCE EXECUTIVE.agc:364
//		TS	PRIORITY
// PORT: Fixed ROM slots 3648.
                        if slot <> 3648 or instruction <> 22647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:365
//		COM
// PORT: Fixed ROM slots 3649.
                        if slot <> 3649 or instruction <> 16384 { return choose false if checkOnly else -1. }
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
        if slot <= 3655 {
            if slot <= 3652 {
                if slot <= 3650 {
// PORT: SOURCE EXECUTIVE.agc:366
//		TCF	JOBSLP2		# AND TO EJSCAN.
// PORT: Fixed ROM slots 3650.
                    if slot <> 3650 or instruction <> 5639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5639, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3651 {
// PORT: SOURCE EXECUTIVE.agc:367
//
// PORT: SOURCE EXECUTIVE.agc:368
//# Page 1113
// PORT: SOURCE EXECUTIVE.agc:369
//# RELEASE THIS CORE SET AND VAC AREA AND SCAN FOR THE JOB OF HIGHEST ACTIVE PRIORITY.
// PORT: SOURCE EXECUTIVE.agc:370
//
// PORT: SOURCE EXECUTIVE.agc:371
//ENDJOB1		INHINT
// PORT: Fixed ROM slots 3651.
                        if slot <> 3651 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:372
//		CS	ZERO
// PORT: Fixed ROM slots 3652.
                        if slot <> 3652 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3653 {
// PORT: SOURCE EXECUTIVE.agc:373
//		TS	BUF 	+1
// PORT: Fixed ROM slots 3653.
                    if slot <> 3653 or instruction <> 22617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22617, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3654 {
// PORT: SOURCE EXECUTIVE.agc:374
//		XCH	PRIORITY
// PORT: Fixed ROM slots 3654.
                        if slot <> 3654 or instruction <> 23671 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 119, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:375
//		MASK	LOW9
// PORT: Fixed ROM slots 3655.
                        if slot <> 3655 or instruction <> 31236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
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
            if slot <= 3658 {
                if slot <= 3656 {
// PORT: SOURCE EXECUTIVE.agc:376
//		TS	L
// PORT: Fixed ROM slots 3656.
                    if slot <> 3656 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3657 {
// PORT: SOURCE EXECUTIVE.agc:377
//
// PORT: SOURCE EXECUTIVE.agc:378
//		CS	FAKEPRET
// PORT: Fixed ROM slots 3657.
                        if slot <> 3657 or instruction <> 19060 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2676), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:379
//		AD	L
// PORT: Fixed ROM slots 3658.
                        if slot <> 3658 or instruction <> 24577 { return choose false if checkOnly else -1. }
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
                if slot <= 3660 {
                    if slot <= 3659 {
// PORT: SOURCE EXECUTIVE.agc:380
//
// PORT: SOURCE EXECUTIVE.agc:381
//		EXTEND
// PORT: Fixed ROM slots 3659.
                        if slot <> 3659 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:382
//		BZMF	EJSCAN		# NOVAC ENDOFJOB
// PORT: Fixed ROM slots 3660.
                        if slot <> 3660 or instruction <> 26192 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3661 {
// PORT: SOURCE EXECUTIVE.agc:383
//
// PORT: SOURCE EXECUTIVE.agc:384
//		CCS	L
// PORT: Fixed ROM slots 3661.
                        if slot <> 3661 or instruction <> 4097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:385
//		INDEX	A
// PORT: Fixed ROM slots 3662.
                        if slot <> 3662 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[104] to agcAotUnit104@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:386
//		TS	0
// PORT: Fixed ROM slots 3663.
    3663, 45056
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3664–3673.
function agcAotUnit105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3668 {
        if slot <= 3665 {
            if slot <= 3664 {
// PORT: SOURCE EXECUTIVE.agc:387
//
// PORT: SOURCE EXECUTIVE.agc:388
//EJSCAN		CCS	PRIORITY +12D
// PORT: Fixed ROM slots 3664.
                if slot <> 3664 or instruction <> 4227 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 131).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:389
//		TC	EJ1
// PORT: Fixed ROM slots 3665.
                if slot <> 3665 or instruction <> 1657 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1657, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3666 {
// PORT: SOURCE EXECUTIVE.agc:390
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3666.
                if slot <> 3666 or instruction <> 3013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3667 {
// PORT: SOURCE EXECUTIVE.agc:391
//		TCF	+1
// PORT: Fixed ROM slots 3667.
                    if slot <> 3667 or instruction <> 5716 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5716, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:392
//
// PORT: SOURCE EXECUTIVE.agc:393
//		CCS	PRIORITY +24D	# EXAMINE EACH PRIORITY REGISTER TO FIND
// PORT: Fixed ROM slots 3668.
                    if slot <> 3668 or instruction <> 4239 { return choose false if checkOnly else -1. }
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
        if slot <= 3670 {
            if slot <= 3669 {
// PORT: SOURCE EXECUTIVE.agc:394
//		TC	EJ1		# THE JOB OF HIGHEST ACTIVE PRIORITY.
// PORT: Fixed ROM slots 3669.
                if slot <> 3669 or instruction <> 1657 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1657, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:395
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3670.
                if slot <> 3670 or instruction <> 3013 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3013, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3671 {
// PORT: SOURCE EXECUTIVE.agc:396
//		TCF	+1
// PORT: Fixed ROM slots 3671.
                if slot <> 3671 or instruction <> 5720 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5720, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3672 {
// PORT: SOURCE EXECUTIVE.agc:397
//
// PORT: SOURCE EXECUTIVE.agc:398
//		CCS	PRIORITY +36D
// PORT: Fixed ROM slots 3672.
                    if slot <> 3672 or instruction <> 4251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 155).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:399
//		TC	EJ1
// PORT: Fixed ROM slots 3673.
                    if slot <> 3673 or instruction <> 1657 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1657, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[105] to agcAotUnit105@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:400
//-CCSPR		-CCS	PRIORITY
// PORT: Fixed ROM slots 3674.
    3674, 57104
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3675–3700.
function agcAotUnit106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3687 {
        if slot <= 3680 {
            if slot <= 3677 {
                if slot <= 3675 {
// PORT: SOURCE EXECUTIVE.agc:401
//		TCF	+1
// PORT: Fixed ROM slots 3675.
                    if slot <> 3675 or instruction <> 5724 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5724, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3676 {
// PORT: SOURCE EXECUTIVE.agc:402
//
// PORT: SOURCE EXECUTIVE.agc:403
//		CCS	PRIORITY +48D
// PORT: Fixed ROM slots 3676.
                        if slot <> 3676 or instruction <> 4263 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 167).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:404
//		TC	EJ1
// PORT: Fixed ROM slots 3677.
                        if slot <> 3677 or instruction <> 1657 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1657, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3678 {
// PORT: SOURCE EXECUTIVE.agc:405
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3678.
                    if slot <> 3678 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3679 {
// PORT: SOURCE EXECUTIVE.agc:406
//		TCF	+1
// PORT: Fixed ROM slots 3679.
                        if slot <> 3679 or instruction <> 5728 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5728, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:407
//
// PORT: SOURCE EXECUTIVE.agc:408
//		CCS	PRIORITY +60D
// PORT: Fixed ROM slots 3680.
                        if slot <> 3680 or instruction <> 4275 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 179).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3683 {
                if slot <= 3681 {
// PORT: SOURCE EXECUTIVE.agc:409
//		TC	EJ1
// PORT: Fixed ROM slots 3681.
                    if slot <> 3681 or instruction <> 1657 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1657, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3682 {
// PORT: SOURCE EXECUTIVE.agc:410
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3682.
                        if slot <> 3682 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:411
//		TCF	+1
// PORT: Fixed ROM slots 3683.
                        if slot <> 3683 or instruction <> 5732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5732, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3685 {
                    if slot <= 3684 {
// PORT: SOURCE EXECUTIVE.agc:412
//
// PORT: SOURCE EXECUTIVE.agc:413
//		CCS	PRIORITY +72D
// PORT: Fixed ROM slots 3684.
                        if slot <> 3684 or instruction <> 4287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 191).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:414
//		TC	EJ1
// PORT: Fixed ROM slots 3685.
                        if slot <> 3685 or instruction <> 1657 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1657, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3686 {
// PORT: SOURCE EXECUTIVE.agc:415
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3686.
                        if slot <> 3686 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:416
//		TCF	+1
// PORT: Fixed ROM slots 3687.
                        if slot <> 3687 or instruction <> 5736 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5736, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3693 {
            if slot <= 3690 {
                if slot <= 3688 {
// PORT: SOURCE EXECUTIVE.agc:417
//
// PORT: SOURCE EXECUTIVE.agc:418
//		CCS	PRIORITY +84D
// PORT: Fixed ROM slots 3688.
                    if slot <> 3688 or instruction <> 4299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 203).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3689 {
// PORT: SOURCE EXECUTIVE.agc:419
//# Page 1114
// PORT: SOURCE EXECUTIVE.agc:420
//		TC	EJ1
// PORT: Fixed ROM slots 3689.
                        if slot <> 3689 or instruction <> 1657 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1657, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:421
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3690.
                        if slot <> 3690 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3691 {
// PORT: SOURCE EXECUTIVE.agc:422
//		TCF	+1
// PORT: Fixed ROM slots 3691.
                    if slot <> 3691 or instruction <> 5740 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5740, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3692 {
// PORT: SOURCE EXECUTIVE.agc:423
//
// PORT: SOURCE EXECUTIVE.agc:424
//# Page 1115
// PORT: SOURCE EXECUTIVE.agc:425
//# EVALUATE THE RESULTS OF THE SCAN.
// PORT: SOURCE EXECUTIVE.agc:426
//
// PORT: SOURCE EXECUTIVE.agc:427
//		CCS	BUF 	+1	# SEE IF THERE ARE ANY ACTIVE JOBS WAITING
// PORT: Fixed ROM slots 3692.
                        if slot <> 3692 or instruction <> 4185 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 89).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:428
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3693.
                        if slot <> 3693 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3696 {
                if slot <= 3694 {
// PORT: SOURCE EXECUTIVE.agc:429
//		TC	CCSHOLE
// PORT: Fixed ROM slots 3694.
                    if slot <> 3694 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3695 {
// PORT: SOURCE EXECUTIVE.agc:430
//
// PORT: SOURCE EXECUTIVE.agc:431
//		TCF	+2
// PORT: Fixed ROM slots 3695.
                        if slot <> 3695 or instruction <> 5745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5745, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:432
//		TCF	DUMMYJOB
// PORT: Fixed ROM slots 3696.
                        if slot <> 3696 or instruction <> 5766 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5766, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3698 {
                    if slot <= 3697 {
// PORT: SOURCE EXECUTIVE.agc:433
//		CCS	BUF		# BUF IS ZERO IS THIS IS A PRIOCHNG AND
// PORT: Fixed ROM slots 3697.
                        if slot <> 3697 or instruction <> 4184 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 88).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:434
//		TCF	+2		# CHANGED PRIORITY IS STILL HIGHEST.
// PORT: Fixed ROM slots 3698.
                        if slot <> 3698 or instruction <> 5748 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5748, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3699 {
// PORT: SOURCE EXECUTIVE.agc:435
//		TCF	ENDPRCHG -1
// PORT: Fixed ROM slots 3699.
                        if slot <> 3699 or instruction <> 5620 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5620, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXECUTIVE.agc:436
//
// PORT: SOURCE EXECUTIVE.agc:437
//		INDEX	A		# OTHERWISE, SET NEWJOB TO THE RELATIVE
// PORT: Fixed ROM slots 3700.
                        if slot <> 3700 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[106] to agcAotUnit106@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:438
//		CAF	0 	-1	# ADDRESS OF THE NEW JOB'S CORE SET.
// PORT: Fixed ROM slots 3701.
    3701, 24574
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3702–3711.
function agcAotUnit107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3706 {
        if slot <= 3703 {
            if slot <= 3702 {
// PORT: SOURCE EXECUTIVE.agc:439
//		AD	-CCSPR
// PORT: Fixed ROM slots 3702.
                if slot <> 3702 or instruction <> 26202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1626), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:440
//		TS	NEWJOB
// PORT: Fixed ROM slots 3703.
                if slot <> 3703 or instruction <> 22583 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22583, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3704 {
// PORT: SOURCE EXECUTIVE.agc:441
//		TCF	CHANJOB -2
// PORT: Fixed ROM slots 3704.
                if slot <> 3704 or instruction <> 5572 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5572, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3705 {
// PORT: SOURCE EXECUTIVE.agc:442
//
// PORT: SOURCE EXECUTIVE.agc:443
//EJ1		TS	BUF 	+2
// PORT: Fixed ROM slots 3705.
                    if slot <> 3705 or instruction <> 22618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:444
//		AD	BUF 	+1	# - OLD HIGH PRIORITY.
// PORT: Fixed ROM slots 3706.
                    if slot <> 3706 or instruction <> 24665 { return choose false if checkOnly else -1. }
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
        if slot <= 3708 {
            if slot <= 3707 {
// PORT: SOURCE EXECUTIVE.agc:445
//		CCS	A
// PORT: Fixed ROM slots 3707.
                if slot <> 3707 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:446
//		CS	BUF 	+2
// PORT: Fixed ROM slots 3708.
                if slot <> 3708 or instruction <> 16474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 90).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3709 {
// PORT: SOURCE EXECUTIVE.agc:447
//		TCF	EJ2		# NEW HIGH PRIORITY.
// PORT: Fixed ROM slots 3709.
                if slot <> 3709 or instruction <> 5761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3710 {
// PORT: SOURCE EXECUTIVE.agc:448
//		NOOP
// PORT: Fixed ROM slots 3710.
                    if slot <> 3710 or instruction <> 5759 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5759, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:449
//		INDEX	Q
// PORT: Fixed ROM slots 3711.
                    if slot <> 3711 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[107] to agcAotUnit107@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:450
//		TC	2		# PROCEED WITH SEARCH.
// PORT: Fixed ROM slots 3712.
    3712, 4
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3713–3716.
function agcAotUnit108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3714 {
        if slot <= 3713 {
// PORT: SOURCE EXECUTIVE.agc:451
//
// PORT: SOURCE EXECUTIVE.agc:452
//EJ2		TS	BUF 	+1
// PORT: Fixed ROM slots 3713.
            if slot <> 3713 or instruction <> 22617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22617, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:453
//		EXTEND
// PORT: Fixed ROM slots 3714.
            if slot <> 3714 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3715 {
// PORT: SOURCE EXECUTIVE.agc:454
//		QXCH	BUF		# FOR LOCATING CCS PRIORITY + X INSTR.
// PORT: Fixed ROM slots 3715.
            if slot <> 3715 or instruction <> 9304 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 88, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:455
//		INDEX	BUF
// PORT: Fixed ROM slots 3716.
            if slot <> 3716 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[108] to agcAotUnit108@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:456
//		TC	2
// PORT: Fixed ROM slots 3717.
    3717, 4
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3718–3731.
function agcAotUnit109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3724 {
        if slot <= 3720 {
            if slot <= 3718 {
// PORT: SOURCE EXECUTIVE.agc:457
//
// PORT: SOURCE EXECUTIVE.agc:458
//# Page 1116
// PORT: SOURCE EXECUTIVE.agc:459
//# IDLING AND COMPUTER ACTIVITY (GREEN) LIGHT MAINTENANCE. THE IDLING ROUTINE IS NOT A JOB IN ITSELF,
// PORT: SOURCE EXECUTIVE.agc:460
//# BUT RATHER A SUBROUTINE OF THE EXECUTIVE.
// PORT: SOURCE EXECUTIVE.agc:461
//
// PORT: SOURCE EXECUTIVE.agc:462
//		EBANK=	SELFRET		# SELF-CHECK STORAGE IN EBANK.
// PORT: SOURCE EXECUTIVE.agc:463
//
// PORT: SOURCE EXECUTIVE.agc:464
//DUMMYJOB	CS	ZERO		# SET NEWJOB TO -0 FOR IDLING.
// PORT: Fixed ROM slots 3718.
                if slot <> 3718 or instruction <> 18925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3719 {
// PORT: SOURCE EXECUTIVE.agc:465
//		TS	NEWJOB
// PORT: Fixed ROM slots 3719.
                    if slot <> 3719 or instruction <> 22583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:466
//		RELINT
// PORT: Fixed ROM slots 3720.
                    if slot <> 3720 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3722 {
                if slot <= 3721 {
// PORT: SOURCE EXECUTIVE.agc:467
//		CS	TWO		# TURN OFF THE ACTIVITY LIGHT.
// PORT: Fixed ROM slots 3721.
                    if slot <> 3721 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:468
//		EXTEND
// PORT: Fixed ROM slots 3722.
                    if slot <> 3722 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3723 {
// PORT: SOURCE EXECUTIVE.agc:469
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 3723.
                    if slot <> 3723 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:470
//ADVAN		CCS	NEWJOB		# IS THE NEWJOB ACTIVE?
// PORT: Fixed ROM slots 3724.
                    if slot <> 3724 or instruction <> 4151 { return choose false if checkOnly else -1. }
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
        if slot <= 3727 {
            if slot <= 3725 {
// PORT: SOURCE EXECUTIVE.agc:471
//		TCF	NUCHANG2	# YES... ONE REQUIRING A CHANGE JOB.
// PORT: Fixed ROM slots 3725.
                if slot <> 3725 or instruction <> 5641 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5641, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3726 {
// PORT: SOURCE EXECUTIVE.agc:472
//		CAF	TWO		# NEW JOB ALREADY IN POSITION FOR
// PORT: Fixed ROM slots 3726.
                    if slot <> 3726 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:473
//		TCF	NUDIRECT	# EXECUTION
// PORT: Fixed ROM slots 3727.
                    if slot <> 3727 or instruction <> 5781 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5781, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3729 {
                if slot <= 3728 {
// PORT: SOURCE EXECUTIVE.agc:474
//
// PORT: SOURCE EXECUTIVE.agc:475
//		CA	SELFRET
// PORT: Fixed ROM slots 3728.
                    if slot <> 3728 or instruction <> 13041 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 753).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:476
//		TS	L		# PUT RETURN ADDRESS IN L.
// PORT: Fixed ROM slots 3729.
                    if slot <> 3729 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3730 {
// PORT: SOURCE EXECUTIVE.agc:477
//		CAF	SELFBANK
// PORT: Fixed ROM slots 3730.
                    if slot <> 3730 or instruction <> 13972 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1684), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXECUTIVE.agc:478
//		TCF	SUPDXCHZ +1	# AND DISPATCH JOB.
// PORT: Fixed ROM slots 3731.
                    if slot <> 3731 or instruction <> 6774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6774, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[109] to agcAotUnit109@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXECUTIVE.agc:479
//
// PORT: SOURCE EXECUTIVE.agc:480
//		EBANK=	SELFRET
// PORT: SOURCE EXECUTIVE.agc:481
//SELFBANK	BBCON	SELFCHK
// PORT: Fixed ROM slots 3732.
    3732, 55428
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3733–3736.
function agcAotUnit110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3734 {
        if slot <= 3733 {
// PORT: SOURCE EXECUTIVE.agc:482
//
// PORT: SOURCE EXECUTIVE.agc:483
//NUDIRECT	EXTEND			# TURN THE GREEN LIGHT BACK ON.
// PORT: Fixed ROM slots 3733.
            if slot <> 3733 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:484
//		WOR	DSALMOUT
// PORT: Fixed ROM slots 3734.
            if slot <> 3734 or instruction <> 2569 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3735 {
// PORT: SOURCE EXECUTIVE.agc:485
//		DXCH	LOC		# JOBS STARTED IN THIS FASHION MUST BE
// PORT: Fixed ROM slots 3735.
            if slot <> 3735 or instruction <> 21621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 117, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:486
//		TCF	SUPDXCHZ
// PORT: Fixed ROM slots 3736.
            if slot <> 3736 or instruction <> 6773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[110] to agcAotUnit110@.

// PORT: Physical bank 02. Shared continuation entries, slots 4725–4729.
function agcAotUnit189 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4726 {
        if slot <= 4725 {
// PORT: SOURCE EXECUTIVE.agc:487
//
// PORT: SOURCE EXECUTIVE.agc:488
//		BLOCK	2		# IN FIXED-FIXED SO OTHERS MAY USE.
// PORT: SOURCE EXECUTIVE.agc:489
//
// PORT: SOURCE EXECUTIVE.agc:490
//		COUNT*	$$/EXEC
// PORT: SOURCE EXECUTIVE.agc:491
//
// PORT: SOURCE EXECUTIVE.agc:492
//# SUPDXCHZ -- ROUTINE TO TRANSFER TO SUPEBANK.
// PORT: SOURCE EXECUTIVE.agc:493
//# CALLING SEQUENCE:
// PORT: SOURCE EXECUTIVE.agc:494
//#		TCF	SUPDXCHZ	# WITH 2CADR OF DESIRED LOCATION IN A + L.
// PORT: SOURCE EXECUTIVE.agc:495
//
// PORT: SOURCE EXECUTIVE.agc:496
//SUPDXCHZ	XCH	L		# BASIC.
// PORT: Fixed ROM slots 4725.
            if slot <> 4725 or instruction <> 23553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 1, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXECUTIVE.agc:497
// +1		EXTEND
// PORT: Fixed ROM slots 4726.
            if slot <> 4726 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4727 {
// PORT: SOURCE EXECUTIVE.agc:498
//		WRITE	SUPERBNK
// PORT: Fixed ROM slots 4727.
            if slot <> 4727 or instruction <> 519 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4728 {
// PORT: SOURCE EXECUTIVE.agc:499
//		TS	BBANK
// PORT: Fixed ROM slots 4728.
                if slot <> 4728 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXECUTIVE.agc:500
//		TC	L
// PORT: Fixed ROM slots 4729.
                if slot <> 4729 or instruction <> 1 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE EXECUTIVE.agc:501
//
// PORT: SOURCE EXECUTIVE.agc:502
//NEG100		OCT	77677
// PORT: Fixed ROM slots 4730.
    4730, 65406
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE EXECUTIVE.agc:503
//
