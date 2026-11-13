// KEYRUPT_UPRUPT.agc
// bank 04, slots 6844-6856
function agcAotUnit403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6849 {
        if slot <= 6846 {
            if slot <= 6844 {
// KEYRUPT_UPRUPT.agc:1
//# Copyright:	Public domain.
// KEYRUPT_UPRUPT.agc:2
//# Filename:	KEYRUPT_UPRUPT.agc
// KEYRUPT_UPRUPT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// KEYRUPT_UPRUPT.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// KEYRUPT_UPRUPT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// KEYRUPT_UPRUPT.agc:6
//# Assembler:	yaYUL
// KEYRUPT_UPRUPT.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// KEYRUPT_UPRUPT.agc:8
//# Website:	www.ibiblio.org/apollo.
// KEYRUPT_UPRUPT.agc:9
//# Pages:	1338-1340
// KEYRUPT_UPRUPT.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// KEYRUPT_UPRUPT.agc:11
//#				Luminary131 file, using page
// KEYRUPT_UPRUPT.agc:12
//#				images from Luminary 1A.
// KEYRUPT_UPRUPT.agc:13
//#
// KEYRUPT_UPRUPT.agc:14
//# This source code has been transcribed or otherwise adapted from
// KEYRUPT_UPRUPT.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// KEYRUPT_UPRUPT.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// KEYRUPT_UPRUPT.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// KEYRUPT_UPRUPT.agc:18
//# in storage size and consequent reduction in image quality as well) are
// KEYRUPT_UPRUPT.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// KEYRUPT_UPRUPT.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// KEYRUPT_UPRUPT.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// KEYRUPT_UPRUPT.agc:22
//# actually created.
// KEYRUPT_UPRUPT.agc:23
//#
// KEYRUPT_UPRUPT.agc:24
//# Notations on the hardcopy document read, in part:
// KEYRUPT_UPRUPT.agc:25
//#
// KEYRUPT_UPRUPT.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// KEYRUPT_UPRUPT.agc:27
//#	16:27 JULY 14, 1969
// KEYRUPT_UPRUPT.agc:28
//
// KEYRUPT_UPRUPT.agc:29
//# Page 1338
// KEYRUPT_UPRUPT.agc:30
//		BANK	14
// KEYRUPT_UPRUPT.agc:31
//		SETLOC	KEYRUPT
// KEYRUPT_UPRUPT.agc:32
//		BANK
// KEYRUPT_UPRUPT.agc:33
//		COUNT*	$$/KEYUP
// KEYRUPT_UPRUPT.agc:34
//
// KEYRUPT_UPRUPT.agc:35
//KEYRUPT1	TS	BANKRUPT
// slot 6844
                if slot <> 6844 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6845 {
// KEYRUPT_UPRUPT.agc:36
//		XCH	Q
// slot 6845
                    if slot <> 6845 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KEYRUPT_UPRUPT.agc:37
//		TS	QRUPT
// slot 6846
                    if slot <> 6846 or instruction <> 22538 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22538, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6847 {
// KEYRUPT_UPRUPT.agc:38
//		TC	LODSAMPT	# TIME IS SNATCHED IN RUPT FOR NOUN 65.
// slot 6847
                if slot <> 6847 or instruction <> 2304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6848 {
// KEYRUPT_UPRUPT.agc:39
//		CAF	LOW5
// slot 6848
                    if slot <> 6848 or instruction <> 14566 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KEYRUPT_UPRUPT.agc:40
//		EXTEND
// slot 6849
                    if slot <> 6849 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6852 {
            if slot <= 6850 {
// KEYRUPT_UPRUPT.agc:41
//		RAND	MNKEYIN		# CHECK IF KEYS 5M-1M ON
// slot 6850
                if slot <> 6850 or instruction <> 1037 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 13, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6851 {
// KEYRUPT_UPRUPT.agc:42
//KEYCOM		TS	RUPTREG4
// slot 6851
                    if slot <> 6851 or instruction <> 22587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KEYRUPT_UPRUPT.agc:43
//		CS	FLAGWRD5
// slot 6852
                    if slot <> 6852 or instruction <> 16449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 65).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6854 {
                if slot <= 6853 {
// KEYRUPT_UPRUPT.agc:44
//		MASK	DSKYFBIT
// slot 6853
                    if slot <> 6853 or instruction <> 31197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        if fixedOperand = 16384 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KEYRUPT_UPRUPT.agc:45
//		ADS	FLAGWRD5
// slot 6854
                    if slot <> 6854 or instruction <> 11329 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6855 {
// KEYRUPT_UPRUPT.agc:46
//
// KEYRUPT_UPRUPT.agc:47
//ACCEPTUP	CAF	CHRPRIO		# (NOTE: RUPTREG4 = KEYTEMP1)
// slot 6855
                    if slot <> 6855 or instruction <> 14573 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// KEYRUPT_UPRUPT.agc:48
//		TC	NOVAC
// slot 6856
                    if slot <> 6856 or instruction <> 2618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[403] to agcAotUnit403@.

agcAotInstallSourceRope(list(
// KEYRUPT_UPRUPT.agc:49
//		EBANK=	DSPCOUNT
// KEYRUPT_UPRUPT.agc:50
//		2CADR	CHARIN
// slot 6857 6858
    6857, 2174, 6858, 49282
)).

// bank 04, slots 6859-6860
function agcAotUnit404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6859 {
// KEYRUPT_UPRUPT.agc:51
//
// KEYRUPT_UPRUPT.agc:52
//		CA	RUPTREG4
// slot 6859
        if slot <> 6859 or instruction <> 12347 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 59).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// KEYRUPT_UPRUPT.agc:53
//		INDEX	LOCCTR
// slot 6860
        if slot <> 6860 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[404] to agcAotUnit404@.

agcAotInstallSourceRope(list(
// KEYRUPT_UPRUPT.agc:54
//		TS	MPAC		# LEAVE 5 BIT KEY CDE IN MPAC FOR CHARIN
// slot 6861
    6861, 45272
)).

// bank 04, slots 6862-6907
function agcAotUnit405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6884 {
        if slot <= 6872 {
            if slot <= 6866 {
                if slot <= 6863 {
                    if slot <= 6862 {
// KEYRUPT_UPRUPT.agc:55
//		TC	RESUME
// slot 6862
                        if slot <> 6862 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KEYRUPT_UPRUPT.agc:56
//
// KEYRUPT_UPRUPT.agc:57
//# Page 1339
// KEYRUPT_UPRUPT.agc:58
//# UPRUPT PROGRAM
// KEYRUPT_UPRUPT.agc:59
//
// KEYRUPT_UPRUPT.agc:60
//UPRUPT		TS	BANKRUPT
// slot 6863
                        if slot <> 6863 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6864 {
// KEYRUPT_UPRUPT.agc:61
//		XCH	Q
// slot 6864
                        if slot <> 6864 or instruction <> 23554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 2, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6865 {
// KEYRUPT_UPRUPT.agc:62
//		TS	QRUPT
// slot 6865
                            if slot <> 6865 or instruction <> 22538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:63
//		TC	LODSAMPT	# TIME IS SNATCHED IN RUPT FOR NOUN 65.
// slot 6866
                            if slot <> 6866 or instruction <> 2304 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2304, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 6869 {
                    if slot <= 6867 {
// KEYRUPT_UPRUPT.agc:64
//		CAF	ZERO
// slot 6867
                        if slot <> 6867 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6868 {
// KEYRUPT_UPRUPT.agc:65
//		XCH	INLINK
// slot 6868
                            if slot <> 6868 or instruction <> 23589 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 37, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:66
//		TS	KEYTEMP1
// slot 6869
                            if slot <> 6869 or instruction <> 22587 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22587, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6870 {
// KEYRUPT_UPRUPT.agc:67
//		CAF	BIT3		# TURN ON UPACT LIGHT
// slot 6870
                        if slot <> 6870 or instruction <> 14825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6871 {
// KEYRUPT_UPRUPT.agc:68
//		EXTEND			# (BIT 3 OF CHANNEL 11)
// slot 6871
                            if slot <> 6871 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:69
//		WOR	DSALMOUT
// slot 6872
                            if slot <> 6872 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 6878 {
                if slot <= 6875 {
                    if slot <= 6873 {
// KEYRUPT_UPRUPT.agc:70
//UPRPT1		CAF	LOW5		# TEST FOR TRIPLE CHAR REDUNDANCY
// slot 6873
                        if slot <> 6873 or instruction <> 14566 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6874 {
// KEYRUPT_UPRUPT.agc:71
//		MASK	KEYTEMP1	# LOW5 OF WORD
// slot 6874
                            if slot <> 6874 or instruction <> 28731 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 59).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:72
//		XCH	KEYTEMP1	# LOW5 INTO KEYTEMP1
// slot 6875
                            if slot <> 6875 or instruction <> 23611 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 59, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6876 {
// KEYRUPT_UPRUPT.agc:73
//		EXTEND
// slot 6876
                        if slot <> 6876 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6877 {
// KEYRUPT_UPRUPT.agc:74
//		MP	BIT10		# SHIFT RIGHT 5
// slot 6877
                            if slot <> 6877 or instruction <> 31202 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2530, readEffective:call(words, 2530)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:75
//		TS	KEYTEMP2
// slot 6878
                            if slot <> 6878 or instruction <> 23004 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23004, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 6881 {
                    if slot <= 6879 {
// KEYRUPT_UPRUPT.agc:76
//		MASK	LOW5		# MID 5
// slot 6879
                        if slot <> 6879 or instruction <> 30950 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6880 {
// KEYRUPT_UPRUPT.agc:77
//		AD	HI10
// slot 6880
                            if slot <> 6880 or instruction <> 26364 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1788), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:78
//		TC	UPTEST
// slot 6881
                            if slot <> 6881 or instruction <> 1785 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1785, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6882 {
// KEYRUPT_UPRUPT.agc:79
//		CAF	BIT10
// slot 6882
                        if slot <> 6882 or instruction <> 14818 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6883 {
// KEYRUPT_UPRUPT.agc:80
//		EXTEND
// slot 6883
                            if slot <> 6883 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:81
//		MP	KEYTEMP2	# SHIFT RIGHT 5
// slot 6884
                            if slot <> 6884 or instruction <> 29148 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 476, readEffective:call(words, 476)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 6895 {
            if slot <= 6889 {
                if slot <= 6886 {
                    if slot <= 6885 {
// KEYRUPT_UPRUPT.agc:82
//		MASK	LOW5		# HIGH 5
// slot 6885
                        if slot <> 6885 or instruction <> 30950 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// KEYRUPT_UPRUPT.agc:83
//		COM
// slot 6886
                        if slot <> 6886 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6887 {
// KEYRUPT_UPRUPT.agc:84
//		TC	UPTEST
// slot 6887
                        if slot <> 6887 or instruction <> 1785 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1785, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6888 {
// KEYRUPT_UPRUPT.agc:85
//
// KEYRUPT_UPRUPT.agc:86
//UPCK		CS	ELRCODE		# CODE IS GOOD. IF CODE = 'ERROR RESET',
// slot 6888
                            if slot <> 6888 or instruction <> 18175 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1791), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:87
//		AD	KEYTEMP1	# CLEAR UPLOCKFL(SET BIT4 OF FLAGWRD7 = 0)
// slot 6889
                            if slot <> 6889 or instruction <> 24635 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 59).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 6892 {
                    if slot <= 6890 {
// KEYRUPT_UPRUPT.agc:88
//		EXTEND			# IF CODE DOES NOT = 'ERROR RESET', ACCEPT
// slot 6890
                        if slot <> 6890 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6891 {
// KEYRUPT_UPRUPT.agc:89
//		BZF	CLUPLOCK	# CODE ONLY IF UPLOCKFL IS CLEAR (=0).
// slot 6891
                            if slot <> 6891 or instruction <> 5873 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5873, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:90
//
// KEYRUPT_UPRUPT.agc:91
//		CAF	UPLOCBIT	# TEST UPLOCKFL FOR 0 OR 1
// slot 6892
                            if slot <> 6892 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6893 {
// KEYRUPT_UPRUPT.agc:92
//		MASK	FLAGWRD7
// slot 6893
                        if slot <> 6893 or instruction <> 28739 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6894 {
// KEYRUPT_UPRUPT.agc:93
//		CCS	A
// slot 6894
                            if slot <> 6894 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:94
//		TC	RESUME		# UPLOCKFL = 1
// slot 6895
                            if slot <> 6895 or instruction <> 2744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 6901 {
                if slot <= 6898 {
                    if slot <= 6896 {
// KEYRUPT_UPRUPT.agc:95
//		TC	ACCEPTUP	# UPLOCKFL = 0
// slot 6896
                        if slot <> 6896 or instruction <> 1735 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1735, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6897 {
// KEYRUPT_UPRUPT.agc:96
//
// KEYRUPT_UPRUPT.agc:97
//CLUPLOCK	CS	UPLOCBIT	# CLEAR UPLOCKFL (I.E.,SET BIT 4 OF )
// slot 6897
                            if slot <> 6897 or instruction <> 18920 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:98
//		MASK	FLAGWRD7	# FLAGWRD7 = 0)
// slot 6898
                            if slot <> 6898 or instruction <> 28739 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6899 {
// KEYRUPT_UPRUPT.agc:99
//		TS	FLAGWRD7
// slot 6899
                        if slot <> 6899 or instruction <> 22595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22595, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6900 {
// KEYRUPT_UPRUPT.agc:100
//		TC	ACCEPTUP
// slot 6900
                            if slot <> 6900 or instruction <> 1735 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1735, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:101
//
// KEYRUPT_UPRUPT.agc:102
//					# CODE IS BAD
// KEYRUPT_UPRUPT.agc:103
//TMFAIL2		CS	FLAGWRD7	# LOCK OUT FURTHER UPLINK ACTIVITY
// slot 6901
                            if slot <> 6901 or instruction <> 16451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 67).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 6904 {
                    if slot <= 6902 {
// KEYRUPT_UPRUPT.agc:104
//		MASK	UPLOCBIT	# (BY SETTING UPLOCKFL = 1) UNTIL
// slot 6902
                        if slot <> 6902 or instruction <> 31208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            if fixedOperand = 8 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6903 {
// KEYRUPT_UPRUPT.agc:105
//		ADS	FLAGWRD7	# 'ERROR RESET' IS SENT VIA UPLINK.
// slot 6903
                            if slot <> 6903 or instruction <> 11331 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 67).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:106
//		TC	RESUME
// slot 6904
                            if slot <> 6904 or instruction <> 2744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 6905 {
// KEYRUPT_UPRUPT.agc:107
//UPTEST		AD	KEYTEMP1
// slot 6905
                        if slot <> 6905 or instruction <> 24635 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 59).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6906 {
// KEYRUPT_UPRUPT.agc:108
//# Page 1340
// KEYRUPT_UPRUPT.agc:109
//		CCS	A
// slot 6906
                            if slot <> 6906 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// KEYRUPT_UPRUPT.agc:110
//		TC	TMFAIL2
// slot 6907
                            if slot <> 6907 or instruction <> 1781 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1781, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[405] to agcAotUnit405@.

agcAotInstallSourceRope(list(
// KEYRUPT_UPRUPT.agc:111
//HI10		OCT	77740
// slot 6908
    6908, 65472
)).

// bank 04, slots 6909-6910
function agcAotUnit406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6909 {
// KEYRUPT_UPRUPT.agc:112
//		TC	TMFAIL2
// slot 6909
        if slot <> 6909 or instruction <> 1781 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1781, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// KEYRUPT_UPRUPT.agc:113
//		TC	Q
// slot 6910
        if slot <> 6910 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[406] to agcAotUnit406@.

agcAotInstallSourceRope(list(
// KEYRUPT_UPRUPT.agc:114
//
// KEYRUPT_UPRUPT.agc:115
//ELRCODE		OCT	22
// slot 6911
    6911, 36
)).

// bank 04, slots 6912-6912
function agcAotUnit407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// KEYRUPT_UPRUPT.agc:116
//
// KEYRUPT_UPRUPT.agc:117
//# 'UPLINK ACTIVITY LIGHT' IS TURNED OFF BY .....
// KEYRUPT_UPRUPT.agc:118
//#	   1.	  VBRELDSP
// KEYRUPT_UPRUPT.agc:119
//#	   2.	  ERROR RESET
// KEYRUPT_UPRUPT.agc:120
//#	   3.	  UPDATE PROGRAM(P27) ENTERED BY V70,V71,V72,AND V73.
// KEYRUPT_UPRUPT.agc:121
//#
// KEYRUPT_UPRUPT.agc:122
//#				    _
// KEYRUPT_UPRUPT.agc:123
//# THE RECEPTION OF A BAD CODE(I.E  CCC FAILURE) LOCKS OUT FURTHER UPLINK ACTIVITY BY SETTING BIT4 OF FLAGWRD7 = 1.
// KEYRUPT_UPRUPT.agc:124
//# THIS INDICATION WILL BE TRANSFERRED TO THE GROUND BY THE DOWNLINK WHICH DOWNLINKS ALL FLAGWORDS.
// KEYRUPT_UPRUPT.agc:125
//# WHEN UPLINK ACTIVITY IS LOCKED OUT ,IT CAN BE ALLOWED WHEN THE GROUND UPLINKS AND 'ERROR RESET' CODE.
// KEYRUPT_UPRUPT.agc:126
//# (IT IS RECOMMENDED THAT THE 'ERROR LIGHT RESET' CODE IS PRECEEDED BY 16 BITS THE FIRST OF WHICH IS 1 FOLLOWED
// KEYRUPT_UPRUPT.agc:127
//# BY 15 ZEROES. THIS WILL ELIMINATE EXTRANEOUS BITS FROM INLINK WHICH MAY HAVE BEEN LEFT OVER FROM THE ORIGINAL
// KEYRUPT_UPRUPT.agc:128
//# FAILURE)
// KEYRUPT_UPRUPT.agc:129
//# UPLINK ACTIVITY IS ALSO ALLOWED(UNLOCKED) DURING FRESH START WHEN FRESH START SETS BIT4 OF FLAGWRD7 = 0.
// KEYRUPT_UPRUPT.agc:130
//		CS	XDSPBIT
// slot 6912
    if slot <> 6912 or instruction <> 18923 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
        set words[0] to agcSignExtend(32767 - fixedOperand).
        return list(false, false, true, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[407] to agcAotUnit407@.

