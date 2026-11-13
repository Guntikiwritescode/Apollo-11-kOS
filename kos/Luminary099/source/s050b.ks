
// bank 25, slots 24043-24073
function agcAotUnit1586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24057 {
        if slot <= 24049 {
            if slot <= 24045 {
                if slot <= 24043 {
// P20-P25.agc:2629
//
// P20-P25.agc:2630
//		EXTEND
// slot 24043
                    if slot <> 24043 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24044 {
// P20-P25.agc:2631
//		DCS	COS1/2DG
// slot 24044
                        if slot <> 24044 or instruction <> 17976 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 1592, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2632
//		DAS	MPAC		# DIFFERENCE OF COSINES, SCALED B-2.
// slot 24045
                        if slot <> 24045 or instruction <> 8301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 109) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24047 {
                    if slot <= 24046 {
// P20-P25.agc:2633
//		CCS	MPAC
// slot 24046
                        if slot <> 24046 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2634
//		CA	ZERO		# IF COS ERROR BIGGER, ERROR IS SMALLER
// slot 24047
                        if slot <> 24047 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 24048 {
// P20-P25.agc:2635
//		TCF	+2
// slot 24048
                        if slot <> 24048 or instruction <> 5618 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5618, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2636
//		CA	ONE
// slot 24049
                        if slot <> 24049 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24053 {
                if slot <= 24051 {
                    if slot <= 24050 {
// P20-P25.agc:2637
//		TS	MPAC +1		# ZERO IF RR IS POINTED OK, ONE IF NOT.
// slot 24050
                        if slot <> 24050 or instruction <> 22637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2638
//# Page 551
// P20-P25.agc:2639
//# SEE IF TRACKER SHOULD BE ENABLED OR DISABLED.
// P20-P25.agc:2640
//
// P20-P25.agc:2641
//		CCS	RADMODES	# IF CONTINUOUS DESIGNATE WANTED, PUT OUT
// slot 24051
                        if slot <> 24051 or instruction <> 4168 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24052 {
// P20-P25.agc:2642
//		TCF	SIGNLCHK	# COMMANDS WITHOUT CHECKING MAGNITUDE OF
// slot 24052
                        if slot <> 24052 or instruction <> 5623 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5623, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2643
//		TCF	SIGNLCHK	# ERROR SIGNALS
// slot 24053
                        if slot <> 24053 or instruction <> 5623 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5623, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24055 {
                    if slot <= 24054 {
// P20-P25.agc:2644
//		TCF	DORROUT
// slot 24054
                        if slot <> 24054 or instruction <> 5647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2645
//SIGNLCHK	CCS	MPAC +1		# SEE IF BOTH AXES WERE WITHIN .5 DEGS.
// slot 24055
                        if slot <> 24055 or instruction <> 4205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24056 {
// P20-P25.agc:2646
//		TCF	DGOODCHK
// slot 24056
                        if slot <> 24056 or instruction <> 5632 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5632, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2647
//		CS	STATE		# IF WITHIN LIMITS AND NO LOCK-ON WANTED,
// slot 24057
                        if slot <> 24057 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 24065 {
            if slot <= 24061 {
                if slot <= 24059 {
                    if slot <= 24058 {
// P20-P25.agc:2648
//		MASK	LOKONBIT	# PROBLEM IS FINISHED.
// slot 24058
                        if slot <> 24058 or instruction <> 31207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            if fixedOperand = 16 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2649
//		CCS	A
// slot 24059
                        if slot <> 24059 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24060 {
// P20-P25.agc:2650
//		TCF	RRDESDUN
// slot 24060
                        if slot <> 24060 or instruction <> 5637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2651
//
// P20-P25.agc:2652
//		CAF	BIT14		# ENABLE THE TRACKER
// slot 24061
                        if slot <> 24061 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24063 {
                    if slot <= 24062 {
// P20-P25.agc:2653
//		EXTEND
// slot 24062
                        if slot <> 24062 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2654
//		WOR	CHAN12
// slot 24063
                        if slot <> 24063 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24064 {
// P20-P25.agc:2655
//
// P20-P25.agc:2656
//DGOODCHK	CAF	BIT4		# SEE IF DATA GOOD RECEIVED YET
// slot 24064
                        if slot <> 24064 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2657
//		EXTEND
// slot 24065
                        if slot <> 24065 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24069 {
                if slot <= 24067 {
                    if slot <= 24066 {
// P20-P25.agc:2658
//		RAND	CHAN33
// slot 24066
                        if slot <> 24066 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2659
//		CCS	A
// slot 24067
                        if slot <> 24067 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24068 {
// P20-P25.agc:2660
//		TCF	DORROUT
// slot 24068
                        if slot <> 24068 or instruction <> 5647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5647, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2661
//
// P20-P25.agc:2662
//RRDESDUN	CS	BIT10		# WHEN PROBLEM DONE, REMOVE BIT 10 SO NEXT
// slot 24069
                        if slot <> 24069 or instruction <> 18914 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24071 {
                    if slot <= 24070 {
// P20-P25.agc:2663
//		MASK	RADMODES	# WAITLIST TASK WE WILL GO TO RGOODEND.
// slot 24070
                        if slot <> 24070 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2664
//		INHINT
// slot 24071
                        if slot <> 24071 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24072 {
// P20-P25.agc:2665
//		TS 	RADMODES
// slot 24072
                        if slot <> 24072 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2666
//
// P20-P25.agc:2667
//		TC	DOWNFLAG	# RESET LOSCMFLG TO PREENT A
// slot 24073
                        if slot <> 24073 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1586] to agcAotUnit1586@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2668
//		ADRES 	LOSCMFLG	# RECOMPUTATION OF LOS AFTER DATA GOOD
// slot 24074
    24074, 66
)).

// bank 25, slots 24075-24083
function agcAotUnit1587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24078 {
        if slot <= 24076 {
            if slot <= 24075 {
// P20-P25.agc:2669
//		CS	BIT2		# TURN OFF ENABLE RR ERROR COUNTER
// slot 24075
                if slot <> 24075 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2670
//		EXTEND
// slot 24076
                if slot <> 24076 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24077 {
// P20-P25.agc:2671
//		WAND	CHAN12
// slot 24077
                if slot <> 24077 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2672
//		TCF	ENDOFJOB	# WITH ECTR DISABLED.
// slot 24078
                if slot <> 24078 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24080 {
            if slot <= 24079 {
// P20-P25.agc:2673
//
// P20-P25.agc:2674
//DORROUT		CA	FLAGWRD2	# IF BOTH LOSCMFLAG AND SEARCH FLAG ARE
// slot 24079
                if slot <> 24079 or instruction <> 12350 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2675
//		MASK	BIT12,14	# ZERO, BYPASS VELOCITY ADJUSTMENT TO LOS
// slot 24080
                if slot <> 24080 or instruction <> 32714 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4042), 32768).
                    if fixedOperand = 10240 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048 + mod(floor(words[0] / 8192), 2) * 8192).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24081 {
// P20-P25.agc:2676
//		EXTEND
// slot 24081
                if slot <> 24081 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24082 {
// P20-P25.agc:2677
//		BZF	NOTP20
// slot 24082
                    if slot <> 24082 or instruction <> 5665 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5665, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2678
//		TC	INTPRET
// slot 24083
                    if slot <> 24083 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1587] to agcAotUnit1587@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2679
//		VLOAD	VXSC		# MULTIPLY UNIT LOS BY MAGNITUDE
// slot 24084
    24084, 61946,
// P20-P25.agc:2680
//			RRTARGET
// slot 24085
    24085, 1156,
// P20-P25.agc:2681
//			MLOSV
// slot 24086
    24086, 2030,
// P20-P25.agc:2682
//		VSL1	PUSH
// slot 24087
    24087, 34548,
// P20-P25.agc:2683
//		VLOAD	VXSC		# ADD .5 SEC. OF VELOCITY
// slot 24088
    24088, 61946,
// P20-P25.agc:2684
//			LOSVEL		# TO LOS VECTOR
// slot 24089
    24089, 2018,
// P20-P25.agc:2685
//			MCTOMS
// slot 24090
    24090, 11380,
// P20-P25.agc:2686
//		VSR1	VAD
// slot 24091
    24091, 44516,
// P20-P25.agc:2687
//		UNIT
// slot 24092
    24092, 65372,
// P20-P25.agc:2688
//		STODL	RRTARGET	# STORE VELOCITY-CORRECTED LOS (UNIT)
// slot 24093
    24093, 13444,
// P20-P25.agc:2689
//# Page 552
// P20-P25.agc:2690
//			36D
// slot 24094
    24094, 74,
// P20-P25.agc:2691
//		STORE	MLOSV		# AND STORE MAGNITUDE
// slot 24095
    24095, 2030,
// P20-P25.agc:2692
//		EXIT
// slot 24096
    24096, 65532
)).

// bank 25, slots 24097-24109
function agcAotUnit1588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24102 {
        if slot <= 24099 {
            if slot <= 24097 {
// P20-P25.agc:2693
//NOTP20		INHINT
// slot 24097
                if slot <> 24097 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24098 {
// P20-P25.agc:2694
//		CS	RADMODES	# PUT OUT COMMAND UNLESS MONITOR
// slot 24098
                    if slot <> 24098 or instruction <> 16456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 72).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2695
//		MASK	REPOSBIT	# REPOSITION HAS TAKEN OVER
// slot 24099
                    if slot <> 24099 or instruction <> 31201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        if fixedOperand = 1024 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24100 {
// P20-P25.agc:2696
//		CCS	A
// slot 24100
                if slot <> 24100 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24101 {
// P20-P25.agc:2697
//		TC	RROUT
// slot 24101
                    if slot <> 24101 or instruction <> 1222 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1222, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2698
//
// P20-P25.agc:2699
//		CA	FLAGWRD2
// slot 24102
                    if slot <> 24102 or instruction <> 12350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24105 {
            if slot <= 24103 {
// P20-P25.agc:2700
//		MASK	LOSCMBIT	# IF LOSCMFLG NOT SET, DON'T TEST
// slot 24103
                if slot <> 24103 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24104 {
// P20-P25.agc:2701
//		EXTEND			# LOS COUNTER
// slot 24104
                    if slot <> 24104 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2702
//		BZF	ENDOFJOB
// slot 24105
                    if slot <> 24105 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24107 {
                if slot <= 24106 {
// P20-P25.agc:2703
//		CCS	LOSCOUNT	# TEST LOS COUNTER TO SEE IF TIME TO GET
// slot 24106
                    if slot <> 24106 or instruction <> 4910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 814).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2704
//		TC	DODESEND	# A NEW LOS
// slot 24107
                    if slot <> 24107 or instruction <> 1588 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1588, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24108 {
// P20-P25.agc:2705
//		INHINT
// slot 24108
                    if slot <> 24108 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2706
//		TC	KILLTASK	# YES -- KILL TASK WHICH SCHEDULES DODES
// slot 24109
                    if slot <> 24109 or instruction <> 3095 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3095, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1588] to agcAotUnit1588@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2707
//		CADR	DESLOOP +2
// slot 24110
    24110, 43780
)).

// bank 25, slots 24111-24111
function agcAotUnit1589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2708
//		RELINT
// slot 24111
    if slot <> 24111 or instruction <> 3 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1589] to agcAotUnit1589@.

// bank 25, slots 24112-24114
function agcAotUnit1590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24112 {
// P20-P25.agc:2709
//		CCS	NEWJOB
// slot 24112
        if slot <> 24112 or instruction <> 4151 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 55).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24113 {
// P20-P25.agc:2710
//		TC	CHANG1
// slot 24113
            if slot <> 24113 or instruction <> 2642 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2642, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2711
//		TC	BANKCALL
// slot 24114
            if slot <> 24114 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1590] to agcAotUnit1590@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2712
//		CADR	R21LEM2
// slot 24115
    24115, 41906
)).

// bank 25, slots 24116-24117
function agcAotUnit1591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24116 {
// P20-P25.agc:2713
//
// P20-P25.agc:2714
//DODESEND	TS	LOSCOUNT
// slot 24116
        if slot <> 24116 or instruction <> 23342 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23342, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:2715
//		TC	ENDOFJOB
// slot 24117
        if slot <> 24117 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1591] to agcAotUnit1591@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2716
//
// P20-P25.agc:2717
//RDESGAIN	DEC	.53624		# TRIES TO NULL .5 ERROR IN .5 SEC.
// slot 24118
    24118, 17572,
// P20-P25.agc:2718
//BIT12,14	EQUALS	PRIO24		# OCT 24000
// P20-P25.agc:2719
//COS1/2DG	2DEC	.999961923 B-2	# COSINE OF 0.5 DEGREES.
// slot 24119 24120
    24119, 8190, 24120, 27658,
// P20-P25.agc:2720
//MCTOMS		2DEC	100 B-13
// slot 24121 24122
    24121, 400, 24122, 0
)).

// bank 25, slots 24123-24123
function agcAotUnit1592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2721
//
// P20-P25.agc:2722
//# Page 553
// P20-P25.agc:2723
//# RADAR READ INITIALIZATION
// P20-P25.agc:2724
//#
// P20-P25.agc:2725
//# RADAR DATA READ BY A BANKCALL FOR THE APPROPRIATE LEAD-IN BELOW.
// P20-P25.agc:2726
//
// P20-P25.agc:2727
//LRALT		TC	INITREAD -1	# ONE SAMPLE PER READING.
// slot 24123
    if slot <> 24123 or instruction <> 1611 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1611, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1592] to agcAotUnit1592@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2728
//ALLREAD		OCT	17
// slot 24124
    24124, 30
)).

// bank 25, slots 24125-24125
function agcAotUnit1593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2729
//
// P20-P25.agc:2730
//LRVELZ		TC	INITREAD
// slot 24125
    if slot <> 24125 or instruction <> 1612 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1612, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1593] to agcAotUnit1593@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2731
//		OCT	16
// slot 24126
    24126, 28
)).

// bank 25, slots 24127-24127
function agcAotUnit1594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2732
//
// P20-P25.agc:2733
//LRVELY		TC	INITREAD
// slot 24127
    if slot <> 24127 or instruction <> 1612 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1612, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1594] to agcAotUnit1594@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2734
//		OCT	15
// slot 24128
    24128, 26
)).

// bank 25, slots 24129-24129
function agcAotUnit1595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2735
//
// P20-P25.agc:2736
//LRVELX		TC	INITREAD
// slot 24129
    if slot <> 24129 or instruction <> 1612 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1612, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1595] to agcAotUnit1595@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2737
//		OCT	14
// slot 24130
    24130, 24
)).

// bank 25, slots 24131-24131
function agcAotUnit1596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2738
//
// P20-P25.agc:2739
//RRRDOT		TC	INITREAD -1
// slot 24131
    if slot <> 24131 or instruction <> 1611 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1611, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1596] to agcAotUnit1596@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2740
//		OCT	12
// slot 24132
    24132, 20
)).

// bank 25, slots 24133-24133
function agcAotUnit1597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:2741
//
// P20-P25.agc:2742
//RRRANGE		TC	INITREAD -1
// slot 24133
    if slot <> 24133 or instruction <> 1611 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1611, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1597] to agcAotUnit1597@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2743
//		OCT	11
// slot 24134
    24134, 18
)).

// bank 25, slots 24135-24137
function agcAotUnit1598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24135 {
// P20-P25.agc:2744
//
// P20-P25.agc:2745
//# LRVEL IS THE ENTRY TO THE LR VELOCITY READ ROUTINE WHEN 5 SAMPLES ARE
// P20-P25.agc:2746
//# WANTED.  ENTER WITH C(A)= 0,2,4 FOR LRVELZ,LRVELY,LRVELX RESP.
// P20-P25.agc:2747
//
// P20-P25.agc:2748
//LRVEL		TS	TIMEHOLD	# STORE VBEAM INDEX HERE MOMENTARILY
// slot 24135
        if slot <> 24135 or instruction <> 23109 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23109, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24136 {
// P20-P25.agc:2749
//		CAF	FIVE		# SPECIFY FIVE SAMPLES
// slot 24136
            if slot <> 24136 or instruction <> 14830 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2750
//		INDEX	TIMEHOLD
// slot 24137
            if slot <> 24137 or instruction <> 21061 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21061, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21061, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1598] to agcAotUnit1598@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2751
//		TCF	LRVELZ
// slot 24138
    24138, 11386
)).

// bank 25, slots 24139-24156
function agcAotUnit1599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24147 {
        if slot <= 24142 {
            if slot <= 24140 {
                if slot <= 24139 {
// P20-P25.agc:2752
//
// P20-P25.agc:2753
//# Page 554
// P20-P25.agc:2754
// -1		CAF	ONE		# ENTRY TO TAKE ONLY 1 SAMPLE
// slot 24139
                    if slot <> 24139 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2755
//INITREAD	INHINT
// slot 24140
                    if slot <> 24140 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24141 {
// P20-P25.agc:2756
//
// P20-P25.agc:2757
//		TS	TIMEHOLD	# GET DT OF MIDPOINT OF NOMINAL SAMPLING
// slot 24141
                    if slot <> 24141 or instruction <> 23109 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23109, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2758
//		EXTEND			# INTERVAL (ASSUMES NO BAD SAMPLES WILL BE
// slot 24142
                    if slot <> 24142 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24144 {
                if slot <= 24143 {
// P20-P25.agc:2759
//		MP	BIT3		# ENCOUNTERED).
// slot 24143
                    if slot <> 24143 or instruction <> 31209 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2537, readEffective:call(words, 2537)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2760
//		DXCH	TIMEHOLD
// slot 24144
                    if slot <> 24144 or instruction <> 22086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 582, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24145 {
// P20-P25.agc:2761
//
// P20-P25.agc:2762
//		CCS	A
// slot 24145
                    if slot <> 24145 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24146 {
// P20-P25.agc:2763
//		TS	NSAMP
// slot 24146
                        if slot <> 24146 or instruction <> 23113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2764
//		AD	ONE
// slot 24147
                        if slot <> 24147 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 24151 {
            if slot <= 24149 {
                if slot <= 24148 {
// P20-P25.agc:2765
//# INSERT FOLLOWING INSTRUCTION TO GET 2N TRIES FOR N SAMPLES.
// P20-P25.agc:2766
//#		DOUBLE
// P20-P25.agc:2767
//		TS	SAMPLIM
// slot 24148
                    if slot <> 24148 or instruction <> 23104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2768
//
// P20-P25.agc:2769
//		CAF	DGBITS		# READ CURRENT VALUE OF DATA GOOD BITS.
// slot 24149
                    if slot <> 24149 or instruction <> 13927 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1639), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24150 {
// P20-P25.agc:2770
//		EXTEND
// slot 24150
                    if slot <> 24150 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2771
//		RAND	CHAN33
// slot 24151
                    if slot <> 24151 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24153 {
                if slot <= 24152 {
// P20-P25.agc:2772
//		TS	OLDATAGD
// slot 24152
                    if slot <> 24152 or instruction <> 23115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2773
//
// P20-P25.agc:2774
//		CS	ALLREAD
// slot 24153
                    if slot <> 24153 or instruction <> 17980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1596), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24154 {
// P20-P25.agc:2775
//		EXTEND
// slot 24154
                    if slot <> 24154 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24155 {
// P20-P25.agc:2776
//		WAND	CHAN13		# REMOVE ALL RADAR BITS
// slot 24155
                        if slot <> 24155 or instruction <> 1547 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2777
//
// P20-P25.agc:2778
//		INDEX	Q
// slot 24156
                        if slot <> 24156 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1599] to agcAotUnit1599@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2779
//		CAF	0
// slot 24157
    24157, 24576
)).

// bank 25, slots 24158-24166
function agcAotUnit1600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24161 {
        if slot <= 24159 {
            if slot <= 24158 {
// P20-P25.agc:2780
//		EXTEND
// slot 24158
                if slot <> 24158 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2781
//		WOR	CHAN13		# SET NEW RADAR BITS
// slot 24159
                if slot <> 24159 or instruction <> 2571 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24160 {
// P20-P25.agc:2782
//
// P20-P25.agc:2783
//		EXTEND
// slot 24160
                if slot <> 24160 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2784
//		DCA	TIME2
// slot 24161
                if slot <> 24161 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24163 {
            if slot <= 24162 {
// P20-P25.agc:2785
//		DAS	TIMEHOLD	# TIME OF NOMINAL MIDPOINT
// slot 24162
                if slot <> 24162 or instruction <> 8774 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 582) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2786
//
// P20-P25.agc:2787
//		CAF	ZERO
// slot 24163
                if slot <> 24163 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 24164 {
// P20-P25.agc:2788
//		TS	L
// slot 24164
                if slot <> 24164 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24165 {
// P20-P25.agc:2789
//		DXCH	SAMPLSUM
// slot 24165
                    if slot <> 24165 or instruction <> 22082 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 578, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2790
//		TCF	ROADBACK
// slot 24166
                    if slot <> 24166 or instruction <> 5366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1600] to agcAotUnit1600@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2791
//
// P20-P25.agc:2792
//DGBITS		OCT	230
// slot 24167
    24167, 304
)).

// bank 25, slots 24168-24180
function agcAotUnit1601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24173 {
        if slot <= 24170 {
            if slot <= 24168 {
// P20-P25.agc:2793
//
// P20-P25.agc:2794
//# Page 555
// P20-P25.agc:2795
//# RADAR RUPT READER
// P20-P25.agc:2796
//#
// P20-P25.agc:2797
//# THIS ROUTINE STARTS FROM A RADARUPT.  IT READS THE DATA & LOTS MORE.
// P20-P25.agc:2798
//
// P20-P25.agc:2799
//		SETLOC	RADARUPT
// P20-P25.agc:2800
//		BANK
// P20-P25.agc:2801
//
// P20-P25.agc:2802
//		COUNT*	$$/RRUPT
// P20-P25.agc:2803
//RADAREAD	EXTEND			# MUST SAVE SBANK BECAUSE OF RUPT EXITS
// slot 24168
                if slot <> 24168 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24169 {
// P20-P25.agc:2804
//		ROR	SUPERBNK	# VIA TASKOVER (BADEND OR GOODEND).
// slot 24169
                    if slot <> 24169 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2805
//		TS	BANKRUPT
// slot 24170
                    if slot <> 24170 or instruction <> 22542 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22542, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24171 {
// P20-P25.agc:2806
//		EXTEND
// slot 24171
                if slot <> 24171 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24172 {
// P20-P25.agc:2807
//		QXCH	QRUPT
// slot 24172
                    if slot <> 24172 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2808
//
// P20-P25.agc:2809
//		CAF	SEVEN
// slot 24173
                    if slot <> 24173 or instruction <> 14831 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24176 {
            if slot <= 24174 {
// P20-P25.agc:2810
//		EXTEND
// slot 24174
                if slot <> 24174 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24175 {
// P20-P25.agc:2811
//		RAND	CHAN13
// slot 24175
                    if slot <> 24175 or instruction <> 1035 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2812
//		TS	DNINDEX
// slot 24176
                    if slot <> 24176 or instruction <> 23261 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23261, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24178 {
                if slot <= 24177 {
// P20-P25.agc:2813
//		EXTEND			# IF RADAR SELECT BITS ZERO, DO NOT STORE
// slot 24177
                    if slot <> 24177 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2814
//		BZF	TRYCOUNT	# DATA FOR DOWNLIST (ERASABLE PROBLEMS)
// slot 24178
                    if slot <> 24178 or instruction <> 5750 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5750, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24179 {
// P20-P25.agc:2815
//		CA	RNRAD
// slot 24179
                    if slot <> 24179 or instruction <> 12326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 38).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2816
//		INDEX	DNINDEX
// slot 24180
                    if slot <> 24180 or instruction <> 21213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21213, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21213, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1601] to agcAotUnit1601@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2817
//		TS	DNRRANGE -1
// slot 24181
    24181, 46516
)).

// bank 25, slots 24182-24185
function agcAotUnit1602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24183 {
        if slot <= 24182 {
// P20-P25.agc:2818
//TRYCOUNT	CCS	SAMPLIM
// slot 24182
            if slot <> 24182 or instruction <> 4672 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 576).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2819
//		TCF	PLENTY
// slot 24183
            if slot <> 24183 or instruction <> 5769 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5769, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24184 {
// P20-P25.agc:2820
//		TCF	NOMORE
// slot 24184
            if slot <> 24184 or instruction <> 5756 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5756, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:2821
//		TC	ALARM
// slot 24185
            if slot <> 24185 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1602] to agcAotUnit1602@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2822
//		OCT	520
// slot 24186
    24186, 672
)).

// bank 25, slots 24187-24196
function agcAotUnit1603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24191 {
        if slot <= 24188 {
            if slot <= 24187 {
// P20-P25.agc:2823
//		TC	RESUME
// slot 24187
                if slot <> 24187 or instruction <> 2744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2744, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2824
//
// P20-P25.agc:2825
//NOMORE		CA	FLGWRD11	# IS LRBYPASS SET?
// slot 24188
                if slot <> 24188 or instruction <> 12359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 71).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24189 {
// P20-P25.agc:2826
//		MASK	LRBYBIT
// slot 24189
                if slot <> 24189 or instruction <> 31197 { return choose false if checkOnly else -1. }
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
                if slot <= 24190 {
// P20-P25.agc:2827
//		EXTEND
// slot 24190
                    if slot <> 24190 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2828
//		BZF	BADRAD		# NO.  R12 IS ON -- BYPASS 521 ALARM.
// slot 24191
                    if slot <> 24191 or instruction <> 5766 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5766, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24193 {
            if slot <= 24192 {
// P20-P25.agc:2829
//
// P20-P25.agc:2830
//		CS	FLAGWRD3	# CHECK R04FLAG.
// slot 24192
                if slot <> 24192 or instruction <> 16447 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 63).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:2831
//		MASK	R04FLBIT	# IF 1, R04 IS RUNNING.  DO NOT ALARM
// slot 24193
                if slot <> 24193 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24194 {
// P20-P25.agc:2832
//		EXTEND
// slot 24194
                if slot <> 24194 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24195 {
// P20-P25.agc:2833
//		BZF	BADRAD
// slot 24195
                    if slot <> 24195 or instruction <> 5766 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5766, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2834
//
// P20-P25.agc:2835
//		TC	ALARM		# P20 WANTS THE ALARM.
// slot 24196
                    if slot <> 24196 or instruction <> 2935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1603] to agcAotUnit1603@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2836
//		OCT	521
// slot 24197
    24197, 674
)).

// bank 25, slots 24198-24214
function agcAotUnit1604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24205 {
        if slot <= 24201 {
            if slot <= 24199 {
                if slot <= 24198 {
// P20-P25.agc:2837
//BADRAD		CS	ONE
// slot 24198
                    if slot <> 24198 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2838
//		TS	SAMPLIM
// slot 24199
                    if slot <> 24199 or instruction <> 23104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24200 {
// P20-P25.agc:2839
//		TC	RDBADEND -2
// slot 24200
                    if slot <> 24200 or instruction <> 1904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1904, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2840
//PLENTY		TS	SAMPLIM
// slot 24201
                    if slot <> 24201 or instruction <> 23104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24203 {
                if slot <= 24202 {
// P20-P25.agc:2841
//		CAF	BIT3
// slot 24202
                    if slot <> 24202 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2842
//		EXTEND
// slot 24203
                    if slot <> 24203 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24204 {
// P20-P25.agc:2843
//		RAND	CHAN13		# TO FIND OUT WHICH RADAR
// slot 24204
                    if slot <> 24204 or instruction <> 1035 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2844
//		EXTEND
// slot 24205
                    if slot <> 24205 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24209 {
            if slot <= 24207 {
                if slot <= 24206 {
// P20-P25.agc:2845
//# Page 556
// P20-P25.agc:2846
//		BZF	RENDRAD
// slot 24206
                    if slot <> 24206 or instruction <> 5822 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5822, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2847
//
// P20-P25.agc:2848
//		TC	R77CHECK	# R77 QUITS HERE.
// slot 24207
                    if slot <> 24207 or instruction <> 1780 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1780, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24208 {
// P20-P25.agc:2849
//LRPOSCHK	CA	RADMODES	# SEE IF LR IN DESIRED POSITION
// slot 24208
                    if slot <> 24208 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2850
//		EXTEND
// slot 24209
                    if slot <> 24209 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24211 {
                if slot <= 24210 {
// P20-P25.agc:2851
//		RXOR	CHAN33
// slot 24210
                    if slot <> 24210 or instruction <> 3099 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2852
//		MASK	BIT6
// slot 24211
                    if slot <> 24211 or instruction <> 31206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24212 {
// P20-P25.agc:2853
//		EXTEND
// slot 24212
                    if slot <> 24212 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24213 {
// P20-P25.agc:2854
//		BZF	VELCHK
// slot 24213
                        if slot <> 24213 or instruction <> 5785 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5785, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2855
//
// P20-P25.agc:2856
//		TC	ALARM
// slot 24214
                        if slot <> 24214 or instruction <> 2935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2935, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1604] to agcAotUnit1604@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2857
//		OCT	522
// slot 24215
    24215, 676
)).

// bank 25, slots 24216-24258
function agcAotUnit1605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24236 {
        if slot <= 24225 {
            if slot <= 24220 {
                if slot <= 24217 {
                    if slot <= 24216 {
// P20-P25.agc:2858
//		TC	BADRAD
// slot 24216
                        if slot <> 24216 or instruction <> 1670 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1670, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2859
//
// P20-P25.agc:2860
//VELCHK		CAF	BIN3		# = 00003 OCT
// slot 24217
                        if slot <> 24217 or instruction <> 15525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24218 {
// P20-P25.agc:2861
//		EXTEND
// slot 24218
                        if slot <> 24218 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24219 {
// P20-P25.agc:2862
//		RXOR	CHAN13		# RESET ACTIVITY BIT
// slot 24219
                            if slot <> 24219 or instruction <> 3083 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2863
//		MASK	BIN3
// slot 24220
                            if slot <> 24220 or instruction <> 31909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
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
                if slot <= 24222 {
                    if slot <= 24221 {
// P20-P25.agc:2864
//		EXTEND
// slot 24221
                        if slot <> 24221 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2865
//		BZF	LRHEIGHT	# TAKE A LR RANGE READING
// slot 24222
                        if slot <> 24222 or instruction <> 5818 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5818, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24223 {
// P20-P25.agc:2866
//
// P20-P25.agc:2867
//		CAF	POSMAX
// slot 24223
                        if slot <> 24223 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24224 {
// P20-P25.agc:2868
//		MASK	RNRAD
// slot 24224
                            if slot <> 24224 or instruction <> 28710 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 38).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2869
//		AD	LVELBIAS
// slot 24225
                            if slot <> 24225 or instruction <> 25600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 24230 {
                if slot <= 24227 {
                    if slot <= 24226 {
// P20-P25.agc:2870
//		TS	L
// slot 24226
                        if slot <> 24226 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2871
//		CAE	RNRAD
// slot 24227
                        if slot <> 24227 or instruction <> 12326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 38).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24228 {
// P20-P25.agc:2872
//		DOUBLE
// slot 24228
                        if slot <> 24228 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24229 {
// P20-P25.agc:2873
//		MASK	BIT1
// slot 24229
                            if slot <> 24229 or instruction <> 31211 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                if fixedOperand = 1 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2874
//		DXCH	ITEMP3
// slot 24230
                            if slot <> 24230 or instruction <> 21556 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24233 {
                    if slot <= 24231 {
// P20-P25.agc:2875
//
// P20-P25.agc:2876
//		CAF	BIT8		# DATA GOOD ISN'T CHECKED UNTIL AFTER READ-
// slot 24231
                        if slot <> 24231 or instruction <> 14820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24232 {
// P20-P25.agc:2877
//		TC	DGCHECK		# ING DATA SO SOME RADAR TESTS WILL WORK
// slot 24232
                            if slot <> 24232 or instruction <> 1826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1826, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2878
//					# INDEPENDENT OF DATA GOOD.
// P20-P25.agc:2879
//
// P20-P25.agc:2880
//		CCS	NSAMP
// slot 24233
                            if slot <> 24233 or instruction <> 4681 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 585).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24234 {
// P20-P25.agc:2881
//		TC	NOEND
// slot 24234
                        if slot <> 24234 or instruction <> 1714 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1714, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24235 {
// P20-P25.agc:2882
//GOODRAD		CS	ONE
// slot 24235
                            if slot <> 24235 or instruction <> 18923 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2883
//		TS	SAMPLIM
// slot 24236
                            if slot <> 24236 or instruction <> 23104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 24247 {
            if slot <= 24241 {
                if slot <= 24238 {
                    if slot <= 24237 {
// P20-P25.agc:2884
//		CS	ITEMP1		# WHEN ENOUGH GOOD DATA HAS BEEN GATHERED,
// slot 24237
                        if slot <> 24237 or instruction <> 16433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 49).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2885
//		MASK	RADMODES	# RESET DATA FAIL FLAGS FOR SETTRKF.
// slot 24238
                        if slot <> 24238 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24239 {
// P20-P25.agc:2886
//		TS	RADMODES
// slot 24239
                        if slot <> 24239 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24240 {
// P20-P25.agc:2887
//		TC	RADLITES	# LAMPS MAY GO OFF IF DATA JUST GOOD.
// slot 24240
                            if slot <> 24240 or instruction <> 1934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1934, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2888
//		TC	RGOODEND -2
// slot 24241
                            if slot <> 24241 or instruction <> 1899 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1899, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24244 {
                    if slot <= 24242 {
// P20-P25.agc:2889
//
// P20-P25.agc:2890
//NOEND		TS	NSAMP
// slot 24242
                        if slot <> 24242 or instruction <> 23113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24243 {
// P20-P25.agc:2891
//RESAMPLE	CCS	SAMPLIM		# SEE IF ANY MORE TRIES SHOULD BE MADE.
// slot 24243
                            if slot <> 24243 or instruction <> 4672 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 576).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2892
//		TCF	+2
// slot 24244
                            if slot <> 24244 or instruction <> 5814 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5814, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24245 {
// P20-P25.agc:2893
//		TCF	DATAFAIL	# N SAMPLES NOT AVAILABLE.
// slot 24245
                        if slot <> 24245 or instruction <> 5937 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5937, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24246 {
// P20-P25.agc:2894
//		CAF	BIT4		# RESET ACTIVITY BIT.
// slot 24246
                            if slot <> 24246 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2895
//		EXTEND
// slot 24247
                            if slot <> 24247 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 24252 {
                if slot <= 24249 {
                    if slot <= 24248 {
// P20-P25.agc:2896
//# Page 557
// P20-P25.agc:2897
//		WOR	CHAN13		# RESET ACTIVITY BIT
// slot 24248
                        if slot <> 24248 or instruction <> 2571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2898
//		TC	RESUME
// slot 24249
                        if slot <> 24249 or instruction <> 2744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24250 {
// P20-P25.agc:2899
//
// P20-P25.agc:2900
//
// P20-P25.agc:2901
//LRHEIGHT	CAF	BIT5
// slot 24250
                        if slot <> 24250 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24251 {
// P20-P25.agc:2902
//		TS	ITEMP1		# (POSITION OF DATA GOOD BIT IN CHAN 33)
// slot 24251
                            if slot <> 24251 or instruction <> 22577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22577, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2903
//
// P20-P25.agc:2904
//		CAF	BIT9
// slot 24252
                            if slot <> 24252 or instruction <> 14819 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24255 {
                    if slot <= 24253 {
// P20-P25.agc:2905
//		TC	SCALECHK -1
// slot 24253
                        if slot <> 24253 or instruction <> 1744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1744, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24254 {
// P20-P25.agc:2906
//
// P20-P25.agc:2907
//RENDRAD		CAF	REPOSBIT	# MAKE SURE ANTENNA HAS NOT GONE OUT OF
// slot 24254
                            if slot <> 24254 or instruction <> 14817 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2908
//		MASK	RADMODES	# LIMITS.
// slot 24255
                            if slot <> 24255 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24256 {
// P20-P25.agc:2909
//		CCS	A
// slot 24256
                        if slot <> 24256 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24257 {
// P20-P25.agc:2910
//		TCF	BADRAD
// slot 24257
                            if slot <> 24257 or instruction <> 5766 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5766, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2911
//
// P20-P25.agc:2912
//		CS	RADMODES	# BE SURE RR CDU HASN'T FAILED.
// slot 24258
                            if slot <> 24258 or instruction <> 16456 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 72).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1605] to agcAotUnit1605@.

// bank 25, slots 24259-24305
function agcAotUnit1606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24281 {
        if slot <= 24269 {
            if slot <= 24263 {
                if slot <= 24260 {
                    if slot <= 24259 {
// P20-P25.agc:2913
//		MASK	RCDUFBIT
// slot 24259
                        if slot <> 24259 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2914
//		CCS	A
// slot 24260
                        if slot <> 24260 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24261 {
// P20-P25.agc:2915
//		TCF	BADRAD
// slot 24261
                        if slot <> 24261 or instruction <> 5766 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5766, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24262 {
// P20-P25.agc:2916
//
// P20-P25.agc:2917
//		CAF	BIT4		# SEE IF DATA HAS BEEN GOOD.
// slot 24262
                            if slot <> 24262 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2918
//		TS	ITEMP1		# (POSITION OF DATA GOOD BIT IN CHAN 33)
// slot 24263
                            if slot <> 24263 or instruction <> 22577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22577, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24266 {
                    if slot <= 24264 {
// P20-P25.agc:2919
//
// P20-P25.agc:2920
//		CAF	BIT1		# SEE IF RR RDOT.
// slot 24264
                        if slot <> 24264 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24265 {
// P20-P25.agc:2921
//		EXTEND
// slot 24265
                            if slot <> 24265 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2922
//		RAND	CHAN13
// slot 24266
                            if slot <> 24266 or instruction <> 1035 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24267 {
// P20-P25.agc:2923
//		TS	Q		# FOR LATER TESTING.
// slot 24267
                        if slot <> 24267 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24268 {
// P20-P25.agc:2924
//		CCS	A
// slot 24268
                            if slot <> 24268 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2925
//		TCF	+2
// slot 24269
                            if slot <> 24269 or instruction <> 5839 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5839, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 24275 {
                if slot <= 24272 {
                    if slot <= 24270 {
// P20-P25.agc:2926
//		TCF	RADIN		# NO SCALE CHECK FOR RR RDOT.
// slot 24270
                        if slot <> 24270 or instruction <> 5849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5849, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24271 {
// P20-P25.agc:2927
//		CAF	BIT3
// slot 24271
                            if slot <> 24271 or instruction <> 14825 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2928
//		TS	L
// slot 24272
                            if slot <> 24272 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24273 {
// P20-P25.agc:2929
//
// P20-P25.agc:2930
//SCALECHK	EXTEND
// slot 24273
                        if slot <> 24273 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24274 {
// P20-P25.agc:2931
//		RAND	CHAN33		# SCALE STATUS NOW
// slot 24274
                            if slot <> 24274 or instruction <> 1051 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2932
//		XCH	L
// slot 24275
                            if slot <> 24275 or instruction <> 23553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 1, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24278 {
                    if slot <= 24276 {
// P20-P25.agc:2933
//		MASK	RADMODES	# SCALE STATUS BEFORE
// slot 24276
                        if slot <> 24276 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24277 {
// P20-P25.agc:2934
//		EXTEND
// slot 24277
                            if slot <> 24277 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2935
//		RXOR	LCHAN		# SEE IF THEY DIFFER
// slot 24278
                            if slot <> 24278 or instruction <> 3073 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24279 {
// P20-P25.agc:2936
//		CCS	A
// slot 24279
                        if slot <> 24279 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24280 {
// P20-P25.agc:2937
//		TC	SCALCHNG	# THEY DIFFER.
// slot 24280
                            if slot <> 24280 or instruction <> 1768 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1768, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2938
//
// P20-P25.agc:2939
//RADIN		CAF	POSMAX
// slot 24281
                            if slot <> 24281 or instruction <> 14811 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 24293 {
            if slot <= 24287 {
                if slot <= 24284 {
                    if slot <= 24282 {
// P20-P25.agc:2940
//		MASK	RNRAD
// slot 24282
                        if slot <> 24282 or instruction <> 28710 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 38).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24283 {
// P20-P25.agc:2941
//		TS	ITEMP4
// slot 24283
                            if slot <> 24283 or instruction <> 22580 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22580, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2942
//
// P20-P25.agc:2943
//		CAE	RNRAD
// slot 24284
                            if slot <> 24284 or instruction <> 12326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 38).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24285 {
// P20-P25.agc:2944
//		DOUBLE
// slot 24285
                        if slot <> 24285 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24286 {
// P20-P25.agc:2945
//		MASK	BIT1
// slot 24286
                            if slot <> 24286 or instruction <> 31211 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                if fixedOperand = 1 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2946
//		TS	ITEMP3
// slot 24287
                            if slot <> 24287 or instruction <> 22579 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22579, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24290 {
                    if slot <= 24288 {
// P20-P25.agc:2947
//# Page 558
// P20-P25.agc:2948
//		CCS	Q		# SEE IF RR RDOT.
// slot 24288
                        if slot <> 24288 or instruction <> 4098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24289 {
// P20-P25.agc:2949
//		TCF	SCALADJ		# NO, BUT SCALE CHANGING MAY BE NEEDED.
// slot 24289
                            if slot <> 24289 or instruction <> 5890 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5890, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2950
//
// P20-P25.agc:2951
//		EXTEND			# IF RR RANGE RATE, THROW OUT BIAS
// slot 24290
                            if slot <> 24290 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24291 {
// P20-P25.agc:2952
//		DCS	RDOTBIAS
// slot 24291
                        if slot <> 24291 or instruction <> 17410 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 1026, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24292 {
// P20-P25.agc:2953
//DASAMPL		DAS	ITEMP3
// slot 24292
                            if slot <> 24292 or instruction <> 8244 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 52) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2954
//DGCHECK2	CA	ITEMP1		# SEE THAT DATA HAS BEEN GOOD BEFORE AND
// slot 24293
                            if slot <> 24293 or instruction <> 12337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 49).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 24299 {
                if slot <= 24296 {
                    if slot <= 24294 {
// P20-P25.agc:2955
//		TC	DGCHECK +1	# AFTER TAKING SAMPLE.
// slot 24294
                        if slot <> 24294 or instruction <> 1827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1827, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24295 {
// P20-P25.agc:2956
//		TC	GOODRAD
// slot 24295
                            if slot <> 24295 or instruction <> 1707 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1707, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2957
//
// P20-P25.agc:2958
//SCALCHNG	LXCH	RADMODES
// slot 24296
                            if slot <> 24296 or instruction <> 9288 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 72, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24297 {
// P20-P25.agc:2959
//		AD	BIT1
// slot 24297
                        if slot <> 24297 or instruction <> 27115 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24298 {
// P20-P25.agc:2960
//		EXTEND
// slot 24298
                            if slot <> 24298 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2961
//		RXOR	LCHAN
// slot 24299
                            if slot <> 24299 or instruction <> 3073 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 24302 {
                    if slot <= 24300 {
// P20-P25.agc:2962
//		TS	RADMODES
// slot 24300
                        if slot <> 24300 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24301 {
// P20-P25.agc:2963
//		CAF	DGBITS		# UPDATE LAST VALUE OF DATA GOOD BITS.
// slot 24301
                            if slot <> 24301 or instruction <> 13927 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1639), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2964
//		EXTEND
// slot 24302
                            if slot <> 24302 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 24303 {
// P20-P25.agc:2965
//		RAND	CHAN33
// slot 24303
                        if slot <> 24303 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24304 {
// P20-P25.agc:2966
//		TS	OLDATAGD
// slot 24304
                            if slot <> 24304 or instruction <> 23115 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23115, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:2967
//		TC	UPFLAG		# SET RNGSCFLG
// slot 24305
                            if slot <> 24305 or instruction <> 2884 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2884, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1606] to agcAotUnit1606@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2968
//		ADRES	RNGSCFLG	# FOR LRS24.1
// slot 24306
    24306, 160
)).

// bank 25, slots 24307-24320
function agcAotUnit1607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24313 {
        if slot <= 24309 {
            if slot <= 24307 {
// P20-P25.agc:2969
//		TCF	BADRAD
// slot 24307
                if slot <> 24307 or instruction <> 5766 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5766, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24308 {
// P20-P25.agc:2970
//
// P20-P25.agc:2971
//# R77 MUST IGNORE DATA FAILS SO AS NOT TO DISTURB BOB.
// P20-P25.agc:2972
//
// P20-P25.agc:2973
//R77CHECK	CS	FLAGWRD5
// slot 24308
                    if slot <> 24308 or instruction <> 16449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 65).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2974
//		MASK	R77FLBIT
// slot 24309
                    if slot <> 24309 or instruction <> 31201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        if fixedOperand = 1024 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24311 {
                if slot <= 24310 {
// P20-P25.agc:2975
//		CCS	A
// slot 24310
                    if slot <> 24310 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2976
//		TC	Q		# NOT R77
// slot 24311
                    if slot <> 24311 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24312 {
// P20-P25.agc:2977
//		CS	BITS5,8		# UPDATE LR DATA GOOD BITS IN RADMODES
// slot 24312
                    if slot <> 24312 or instruction <> 18177 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1793), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2978
//		MASK	RADMODES
// slot 24313
                    if slot <> 24313 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24316 {
            if slot <= 24314 {
// P20-P25.agc:2979
//		TS	L
// slot 24314
                if slot <> 24314 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24315 {
// P20-P25.agc:2980
//		CA	BITS5,8
// slot 24315
                    if slot <> 24315 or instruction <> 14081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1793), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2981
//		EXTEND
// slot 24316
                    if slot <> 24316 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24318 {
                if slot <= 24317 {
// P20-P25.agc:2982
//		RAND	CHAN33
// slot 24317
                    if slot <> 24317 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2983
//		AD	L
// slot 24318
                    if slot <> 24318 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24319 {
// P20-P25.agc:2984
//		TS	RADMODES
// slot 24319
                    if slot <> 24319 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:2985
//		TC	RGOODEND -2
// slot 24320
                    if slot <> 24320 or instruction <> 1899 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1899, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1607] to agcAotUnit1607@.

agcAotInstallSourceRope(list(
// P20-P25.agc:2986
//BITS5,8		OCT	220
// slot 24321
    24321, 288
)).

// bank 25, slots 24322-24352
function agcAotUnit1608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24336 {
        if slot <= 24328 {
            if slot <= 24324 {
                if slot <= 24322 {
// P20-P25.agc:2987
//
// P20-P25.agc:2988
//# Page 559
// P20-P25.agc:2989
//# THE FOLLOWING ROUTINE INCORPORATES RR RANGE AND LR ALT SCALE INFORMATION AND LEAVES DATA AT LO SCALE.
// P20-P25.agc:2990
//
// P20-P25.agc:2991
//SCALADJ		CCS	L		# L HAS SCALE INBIT FOR THIS RADAR.
// slot 24322
                    if slot <> 24322 or instruction <> 4097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24323 {
// P20-P25.agc:2992
//		TCF	+2		# ON HIGH SCALE.
// slot 24323
                        if slot <> 24323 or instruction <> 5893 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5893, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2993
//		TCF	DGCHECK2
// slot 24324
                        if slot <> 24324 or instruction <> 5861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5861, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24326 {
                    if slot <= 24325 {
// P20-P25.agc:2994
//
// P20-P25.agc:2995
//		CA	DNINDEX
// slot 24325
                        if slot <> 24325 or instruction <> 13021 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 733).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2996
//		MASK 	BIT3
// slot 24326
                        if slot <> 24326 or instruction <> 31209 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            if fixedOperand = 4 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24327 {
// P20-P25.agc:2997
//		CCS	A
// slot 24327
                        if slot <> 24327 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:2998
//		TCF	LRSCK
// slot 24328
                        if slot <> 24328 or instruction <> 5903 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5903, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24332 {
                if slot <= 24330 {
                    if slot <= 24329 {
// P20-P25.agc:2999
//
// P20-P25.agc:3000
//		DXCH	ITEMP3
// slot 24329
                        if slot <> 24329 or instruction <> 21556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3001
//		DDOUBL
// slot 24330
                        if slot <> 24330 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24331 {
// P20-P25.agc:3002
//		DDOUBL
// slot 24331
                        if slot <> 24331 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3003
//		DDOUBL
// slot 24332
                        if slot <> 24332 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24334 {
                    if slot <= 24333 {
// P20-P25.agc:3004
//		DXCH	ITEMP3
// slot 24333
                        if slot <> 24333 or instruction <> 21556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3005
//
// P20-P25.agc:3006
//		TCF	DGCHECK2
// slot 24334
                        if slot <> 24334 or instruction <> 5861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5861, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24335 {
// P20-P25.agc:3007
//
// P20-P25.agc:3008
//LRSCK		CCS	ITEMP3
// slot 24335
                        if slot <> 24335 or instruction <> 4147 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 51).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3009
//		TCF	+11
// slot 24336
                        if slot <> 24336 or instruction <> 5913 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5913, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 24344 {
            if slot <= 24340 {
                if slot <= 24338 {
                    if slot <= 24337 {
// P20-P25.agc:3010
//		CS	ITEMP4
// slot 24337
                        if slot <> 24337 or instruction <> 16436 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 52).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3011
//		AD	HISCALIM
// slot 24338
                        if slot <> 24338 or instruction <> 26401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1825), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24339 {
// P20-P25.agc:3012
//		EXTEND
// slot 24339
                        if slot <> 24339 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3013
//		BZMF	+5
// slot 24340
                        if slot <> 24340 or instruction <> 26393 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26393, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24342 {
                    if slot <= 24341 {
// P20-P25.agc:3014
//
// P20-P25.agc:3015
//		CS	FLGWRD11
// slot 24341
                        if slot <> 24341 or instruction <> 16455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 71).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3016
//		MASK	SCABBIT
// slot 24342
                        if slot <> 24342 or instruction <> 31209 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            if fixedOperand = 4 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24343 {
// P20-P25.agc:3017
//		ADS	FLGWRD11
// slot 24343
                        if slot <> 24343 or instruction <> 11335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3018
//		TCF	+4
// slot 24344
                        if slot <> 24344 or instruction <> 5916 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5916, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24348 {
                if slot <= 24346 {
                    if slot <= 24345 {
// P20-P25.agc:3019
//
// P20-P25.agc:3020
//		CS	SCABBIT
// slot 24345
                        if slot <> 24345 or instruction <> 18921 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3021
//		MASK	FLGWRD11
// slot 24346
                        if slot <> 24346 or instruction <> 28743 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24347 {
// P20-P25.agc:3022
//		TS	FLGWRD11
// slot 24347
                        if slot <> 24347 or instruction <> 22599 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22599, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3023
//
// P20-P25.agc:3024
//		EXTEND
// slot 24348
                        if slot <> 24348 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24350 {
                    if slot <= 24349 {
// P20-P25.agc:3025
//		DCA	ITEMP3
// slot 24349
                        if slot <> 24349 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 52, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3026
//		DDOUBL
// slot 24350
                        if slot <> 24350 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24351 {
// P20-P25.agc:3027
//		DDOUBL
// slot 24351
                        if slot <> 24351 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3028
//		TCF	DASAMPL
// slot 24352
                        if slot <> 24352 or instruction <> 5860 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5860, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1608] to agcAotUnit1608@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3029
//
// P20-P25.agc:3030
//HISCALIM	DEC	460		# 2481.7 FT ******************************
// slot 24353
    24353, 920
)).

// bank 25, slots 24354-24389
function agcAotUnit1609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24371 {
        if slot <= 24362 {
            if slot <= 24357 {
                if slot <= 24355 {
                    if slot <= 24354 {
// P20-P25.agc:3031
//# Page 560
// P20-P25.agc:3032
//DGCHECK		TS	ITEMP1		# UPDATE DATA GOOD BIT IN OLDATAGD AND
// slot 24354
                        if slot <> 24354 or instruction <> 22577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22577, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3033
//		EXTEND			# MAKE SURE IT WAS ON BEFORE AND AFTER THE
// slot 24355
                        if slot <> 24355 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24356 {
// P20-P25.agc:3034
//		RAND	CHAN33		# SAMPLE WAS TAKEN BEFORE RETURNING.  IF
// slot 24356
                        if slot <> 24356 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3035
//		TS	L		# NOT, GOES TO RESAMPLE TO TRY AGAIN.  IF
// slot 24357
                        if slot <> 24357 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24359 {
                    if slot <= 24358 {
// P20-P25.agc:3036
//		CS	ITEMP1		# MAX NUMBER OF TRIES HAS BEEN REACHED,
// slot 24358
                        if slot <> 24358 or instruction <> 16433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 49).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3037
//		MASK	OLDATAGD	# THE BIT CORRESPONDING TO THE DATA GOOD
// slot 24359
                        if slot <> 24359 or instruction <> 29259 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 587).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24360 {
// P20-P25.agc:3038
//		AD	L		# WHICH FAILED TO APPEAR IS IN ITEMP1 AND
// slot 24360
                        if slot <> 24360 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24361 {
// P20-P25.agc:3039
//		XCH	OLDATAGD	# CAN BE USED TO SET RADMODES WHICH VIA
// slot 24361
                            if slot <> 24361 or instruction <> 24139 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 587, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:3040
//		MASK	ITEMP1		# SETTRKF SETS THE TRACKER FAIL LAMP.
// slot 24362
                            if slot <> 24362 or instruction <> 28721 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 49).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 24366 {
                if slot <= 24364 {
                    if slot <= 24363 {
// P20-P25.agc:3041
//		AD	L
// slot 24363
                        if slot <> 24363 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3042
//		CCS	A		# SHOULD BOTH BE ZERO.
// slot 24364
                        if slot <> 24364 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24365 {
// P20-P25.agc:3043
//		TC	RESAMPLE
// slot 24365
                        if slot <> 24365 or instruction <> 1715 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1715, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3044
//		DXCH	ITEMP3		# IF DATA GOOD BEFORE AND AFTER, ADD TO
// slot 24366
                        if slot <> 24366 or instruction <> 21556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24368 {
                    if slot <= 24367 {
// P20-P25.agc:3045
//		DAS	SAMPLSUM	# ACCUMULATION.
// slot 24367
                        if slot <> 24367 or instruction <> 8770 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 578) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3046
//		TC	Q
// slot 24368
                        if slot <> 24368 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24369 {
// P20-P25.agc:3047
//
// P20-P25.agc:3048
//DATAFAIL	CS	ITEMP1		# IN THE ABOVE CASE, SET RADMODES BIT
// slot 24369
                        if slot <> 24369 or instruction <> 16433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 49).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24370 {
// P20-P25.agc:3049
//		MASK	RADMODES	# SHOWING SOME RADAR DATA FAILED.
// slot 24370
                            if slot <> 24370 or instruction <> 28744 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:3050
//		AD	ITEMP1
// slot 24371
                            if slot <> 24371 or instruction <> 24625 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 49).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 24380 {
            if slot <= 24375 {
                if slot <= 24373 {
                    if slot <= 24372 {
// P20-P25.agc:3051
//		TS	RADMODES
// slot 24372
                        if slot <> 24372 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3052
//
// P20-P25.agc:3053
//		DXCH	ITEMP3		# IF WE HAVE BEEN UNABLE TO GATHER N
// slot 24373
                        if slot <> 24373 or instruction <> 21556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24374 {
// P20-P25.agc:3054
//		DXCH	SAMPLSUM	# SAMPLES, USE LAST ONE ONLY.
// slot 24374
                        if slot <> 24374 or instruction <> 22082 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 578, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3055
//		TC	RADLITES
// slot 24375
                        if slot <> 24375 or instruction <> 1934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1934, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24377 {
                    if slot <= 24376 {
// P20-P25.agc:3056
//		TCF	NOMORE
// slot 24376
                        if slot <> 24376 or instruction <> 5756 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5756, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3057
//# Page 561
// P20-P25.agc:3058
//# THIS ROUTINE CHANGES THE LR POSITION, AND CHECKS THAT IT GOT THERE.
// P20-P25.agc:3059
//
// P20-P25.agc:3060
//		SETLOC	P20S1
// P20-P25.agc:3061
//		BANK
// P20-P25.agc:3062
//
// P20-P25.agc:3063
//		COUNT*	$$/RSUB
// P20-P25.agc:3064
//LRPOS2		INHINT
// slot 24377
                        if slot <> 24377 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24378 {
// P20-P25.agc:3065
//
// P20-P25.agc:3066
//		CS	RADMODES
// slot 24378
                        if slot <> 24378 or instruction <> 16456 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 72).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24379 {
// P20-P25.agc:3067
//		MASK	LRPOSBIT	# SHOW DESIRED LR POSITION IS 2
// slot 24379
                            if slot <> 24379 or instruction <> 31206 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                if fixedOperand = 32 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:3068
//		ADS	RADMODES
// slot 24380
                            if slot <> 24380 or instruction <> 11336 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 72).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 24384 {
                if slot <= 24382 {
                    if slot <= 24381 {
// P20-P25.agc:3069
//
// P20-P25.agc:3070
//		CAF	BIT7
// slot 24381
                        if slot <> 24381 or instruction <> 14821 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3071
//		EXTEND
// slot 24382
                        if slot <> 24382 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24383 {
// P20-P25.agc:3072
//		RAND	CHAN33		# SEE IF ALREADY THERE.
// slot 24383
                        if slot <> 24383 or instruction <> 1051 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3073
//		EXTEND
// slot 24384
                        if slot <> 24384 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24386 {
                    if slot <= 24385 {
// P20-P25.agc:3074
//		BZF	RADNOOP
// slot 24385
                        if slot <> 24385 or instruction <> 5976 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5976, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3075
//
// P20-P25.agc:3076
//		CAF	BIT13
// slot 24386
                        if slot <> 24386 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24387 {
// P20-P25.agc:3077
//		EXTEND
// slot 24387
                        if slot <> 24387 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 24388 {
// P20-P25.agc:3078
//		WOR	CHAN12		# COMMAND TO POSITION 2
// slot 24388
                            if slot <> 24388 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:3079
//		CAF	6SECS		# START SCANNING FOR INBIT AFTER 7 SECS.
// slot 24389
                            if slot <> 24389 or instruction <> 14181 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1893), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
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
set agcAotRoutes[1609] to agcAotUnit1609@.

// bank 25, slots 24390-24390
function agcAotUnit1610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3080
//		TC	WAITLIST
// slot 24390
    if slot <> 24390 or instruction <> 2691 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2691, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1610] to agcAotUnit1610@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3081
//		EBANK=	LOSCOUNT
// P20-P25.agc:3082
//		2CADR	LRPOSCAN
// slot 24391 24392
    24391, 3782, 24392, 43118
)).

// bank 25, slots 24393-24395
function agcAotUnit1611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24393 {
// P20-P25.agc:3083
//
// P20-P25.agc:3084
//		TC	ROADBACK
// slot 24393
        if slot <> 24393 or instruction <> 1270 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1270, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24394 {
// P20-P25.agc:3085
//
// P20-P25.agc:3086
//LRPOSNXT	TS	SAMPLIM
// slot 24394
            if slot <> 24394 or instruction <> 23104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23104, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3087
//		TC	FIXDELAY	# SCAN ONCE PER SECOND 15 TIMES MAX AFTER
// slot 24395
            if slot <> 24395 or instruction <> 2705 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2705, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1611] to agcAotUnit1611@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3088
//		DEC	100		# INITIAL DELAY OF 7 SECONDS.
// slot 24396
    24396, 200
)).

// bank 25, slots 24397-24409
function agcAotUnit1612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24402 {
        if slot <= 24399 {
            if slot <= 24397 {
// P20-P25.agc:3089
//
// P20-P25.agc:3090
//		CAF	BIT7		# SEE IF LR POS2 IS ON
// slot 24397
                if slot <> 24397 or instruction <> 14821 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24398 {
// P20-P25.agc:3091
//		EXTEND
// slot 24398
                    if slot <> 24398 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3092
//		RAND	CHAN33
// slot 24399
                    if slot <> 24399 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24400 {
// P20-P25.agc:3093
//		EXTEND
// slot 24400
                if slot <> 24400 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24401 {
// P20-P25.agc:3094
//		BZF	LASTLRDT	# IF THERE, WAIT FINAL SECOND FOR BOUNCE.
// slot 24401
                    if slot <> 24401 or instruction <> 5981 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5981, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3095
//
// P20-P25.agc:3096
//		CCS	SAMPLIM		# SEE IF MAX TIME UP.
// slot 24402
                    if slot <> 24402 or instruction <> 4672 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 576).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24405 {
            if slot <= 24403 {
// P20-P25.agc:3097
//		TCF	LRPOSNXT
// slot 24403
                if slot <> 24403 or instruction <> 5962 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5962, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24404 {
// P20-P25.agc:3098
//
// P20-P25.agc:3099
//		CS	BIT13		# IF TIME UP, DISABLE COMMAND AND ALARM.
// slot 24404
                    if slot <> 24404 or instruction <> 18911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3100
//		EXTEND
// slot 24405
                    if slot <> 24405 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 24407 {
                if slot <= 24406 {
// P20-P25.agc:3101
//		WAND	CHAN12
// slot 24406
                    if slot <> 24406 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3102
//		TCF	RDBADEND
// slot 24407
                    if slot <> 24407 or instruction <> 6002 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6002, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24408 {
// P20-P25.agc:3103
//
// P20-P25.agc:3104
//RADNOOP		CAF	ONE		# NO FURTHER ACTION REQUESTED.
// slot 24408
                    if slot <> 24408 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3105
//		TC	WAITLIST
// slot 24409
                    if slot <> 24409 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1612] to agcAotUnit1612@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3106
//		EBANK=	LOSCOUNT
// P20-P25.agc:3107
//		2CADR	RGOODEND
// slot 24410 24411
    24410, 3802, 24411, 43118
)).

// bank 25, slots 24412-24420
function agcAotUnit1613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24415 {
        if slot <= 24413 {
            if slot <= 24412 {
// P20-P25.agc:3108
//# Page 562
// P20-P25.agc:3109
//		TC	ROADBACK
// slot 24412
                if slot <> 24412 or instruction <> 1270 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1270, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3110
//
// P20-P25.agc:3111
//LASTLRDT	CA	2SECS		# WAIT TWO SECONDS AFTER RECEIPT OF INBIT
// slot 24413
                if slot <> 24413 or instruction <> 14848 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24414 {
// P20-P25.agc:3112
//		TC	VARDELAY	# TO WAIT FOR ANTENNA BOUNCE TO DIE OUT.
// slot 24414
                if slot <> 24414 or instruction <> 2708 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2708, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3113
//
// P20-P25.agc:3114
//		CS	BIT13		# REMOVE COMMAND
// slot 24415
                if slot <> 24415 or instruction <> 18911 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24417 {
            if slot <= 24416 {
// P20-P25.agc:3115
//		EXTEND
// slot 24416
                if slot <> 24416 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3116
//		WAND	CHAN12
// slot 24417
                if slot <> 24417 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24418 {
// P20-P25.agc:3117
//		TCF	RGOODEND
// slot 24418
                if slot <> 24418 or instruction <> 5997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5997, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24419 {
// P20-P25.agc:3118
//
// P20-P25.agc:3119
//LRPOSCAN	CAF	FOURTEEN	# SET UP FOR 15 SAMPLES.
// slot 24419
                    if slot <> 24419 or instruction <> 14543 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2255), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3120
//		TCF	LRPOSNXT
// slot 24420
                    if slot <> 24420 or instruction <> 5962 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5962, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1613] to agcAotUnit1613@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3121
//6SECS		DEC	600
// slot 24421
    24421, 1200
)).

// bank 25, slots 24422-24430
function agcAotUnit1614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24425 {
        if slot <= 24423 {
            if slot <= 24422 {
// P20-P25.agc:3122
//# Page 563
// P20-P25.agc:3123
//# SEQUENCES TO TERMINATE RR OPERATIONS.
// P20-P25.agc:3124
//
// P20-P25.agc:3125
//ENDRADAR	CAF	RCDUFBIT	# PROLOG TO CHECK RR CDU FAIL BEFORE END.
// slot 24422
                if slot <> 24422 or instruction <> 14821 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3126
//		MASK	RADMODES
// slot 24423
                if slot <> 24423 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24424 {
// P20-P25.agc:3127
//		CCS	A
// slot 24424
                if slot <> 24424 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3128
//		TCF	RGOODEND
// slot 24425
                if slot <> 24425 or instruction <> 5997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5997, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24427 {
            if slot <= 24426 {
// P20-P25.agc:3129
//		TCF	RDBADEND
// slot 24426
                if slot <> 24426 or instruction <> 6002 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6002, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3130
// -2		CS	ZERO		# RGOODEND WHEN NOT UNDER WAITLIST CONTROL
// slot 24427
                if slot <> 24427 or instruction <> 18925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24428 {
// P20-P25.agc:3131
//		TS	RUPTAGN
// slot 24428
                if slot <> 24428 or instruction <> 23004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24429 {
// P20-P25.agc:3132
//
// P20-P25.agc:3133
//RGOODEND	CAF	TWO
// slot 24429
                    if slot <> 24429 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3134
//		TC	POSTJUMP
// slot 24430
                    if slot <> 24430 or instruction <> 2461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1614] to agcAotUnit1614@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3135
//		CADR	GOODEND
// slot 24431
    24431, 16234
)).

// bank 25, slots 24432-24435
function agcAotUnit1615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24433 {
        if slot <= 24432 {
// P20-P25.agc:3136
//
// P20-P25.agc:3137
// -2		CS	ZERO		# RDBADEND WHEN NOT UNDER WIATLIST.
// slot 24432
            if slot <> 24432 or instruction <> 18925 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3138
//		TS	RUPTAGN
// slot 24433
            if slot <> 24433 or instruction <> 23004 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23004, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24434 {
// P20-P25.agc:3139
//RDBADEND	CAF	TWO
// slot 24434
            if slot <> 24434 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3140
//		TC	POSTJUMP
// slot 24435
            if slot <> 24435 or instruction <> 2461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1615] to agcAotUnit1615@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3141
//		CADR	BADEND
// slot 24436
    24436, 16228,
// P20-P25.agc:3142
//
// P20-P25.agc:3143
//BIN3		EQUALS	THREE
// P20-P25.agc:3144
//
// P20-P25.agc:3145
//# Page 564
// P20-P25.agc:3146
//# PROGRAM NAME:  LPS20.1 VECTOR EXTRAPOLATION AND LOS COMPUTATION
// P20-P25.agc:3147
//# MOD. NO. 2	BY COYNE KERMAN	SDC	DATE 12-7-66
// P20-P25.agc:3148
//#
// P20-P25.agc:3149
//# FUNCTIONAL DESCRPIPTION:
// P20-P25.agc:3150
//#	1)	EXTRAPOLATE THE LEM AND CSM VECTORS IN ACCORDANCE WITH THE TIME REFERRED TO IN CALLER + 1.
// P20-P25.agc:3151
//#	2)	COMPUTES THE LOS VECTOR TO THE CSM, CONVERTS IT TO STABLE MEMBER COORDINATES AND STORES IT IN RRTARGET.
// P20-P25.agc:3152
//#	3)	COMPUTES THE MAGNITUDE OF TEH LOS VECTOR AND STORES IT IN MLOSV
// P20-P25.agc:3153
//#
// P20-P25.agc:3154
//# CALLING SEQUENCE:	CALL
// P20-P25.agc:3155
//#				LPS20.1
// P20-P25.agc:3156
//#
// P20-P25.agc:3157
//# SUBROUTINES CALLED:
// P20-P25.agc:3158
//#	LEMPREC, CSMPREC
// P20-P25.agc:3159
//#
// P20-P25.agc:3160
//# NORMAL EXIT:  RETURN TO CALLER + 2.
// P20-P25.agc:3161
//#
// P20-P25.agc:3162
//# ERROR EXITS:  NONE
// P20-P25.agc:3163
//#
// P20-P25.agc:3164
//# ALARMS:  NONE
// P20-P25.agc:3165
//#
// P20-P25.agc:3166
//# OUTPUT:
// P20-P25.agc:3167
//#	LOS VECTOR (HALF UNIT) IN SM COORDINATES STORED IN RRTARGET
// P20-P25.agc:3168
//#	MAGNITUDE OF TEH LOS VECTOR (METERS SCALED B-29) STORED IN MSLOV
// P20-P25.agc:3169
//#	RRNBSW CLEARED.
// P20-P25.agc:3170
//#
// P20-P25.agc:3171
//# INITIALIZED ERASABLE
// P20-P25.agc:3172
//#	TDEC1 MUST CONTAIN THE TIME FOR EXTRAPOLATION
// P20-P25.agc:3173
//#	SEE ORBITAL INTEGRATION ROUTINE
// P20-P25.agc:3174
//#
// P20-P25.agc:3175
//# DEBRIS:
// P20-P25.agc:3176
//#	MPAC DESTROYED BY THE ROUTINE
// P20-P25.agc:3177
//
// P20-P25.agc:3178
//		BANK	23
// P20-P25.agc:3179
//		SETLOC	P20S
// P20-P25.agc:3180
//		BANK
// P20-P25.agc:3181
//# Page 565
// P20-P25.agc:3182
//		COUNT*	$$/LPS20
// P20-P25.agc:3183
//
// P20-P25.agc:3184
//LPS20.1		STQ	BOFF
// slot 23213
    23213, 35872,
// P20-P25.agc:3185
//			LS21X
// slot 23214
    23214, 2014,
// P20-P25.agc:3186
//			LOSCMFLG	# LOSCMFLG = 0 MEANS NOT CALLED BY R21
// slot 23215
    23215, 1478,
// P20-P25.agc:3187
//			LMINT		# SO CALL LEMCONIC TO GET LM STATE
// slot 23216
    23216, 42344,
// P20-P25.agc:3188
//		BON			# IF IN R21 AND ON MUN SURFACE
// slot 23217
    23217, 65304,
// P20-P25.agc:3189
//			SURFFLAG	# DON'T CALL LEMCONIC
// slot 23218
    23218, 4494,
// P20-P25.agc:3190
//			CSMINT
// slot 23219
    23219, 42360,
// P20-P25.agc:3191
//LMINT		CALL
// slot 23220
    23220, 65320,
// P20-P25.agc:3192
//			LEMCONIC	# EXTRAPOLATE LEM
// slot 23221
    23221, 23680,
// P20-P25.agc:3193
//		VLOAD
// slot 23222
    23222, 65530,
// P20-P25.agc:3194
//			RATT
// slot 23223
    23223, 2,
// P20-P25.agc:3195
//		STOVL	LMPOS		# SAVE LM POSITION B-29
// slot 23224
    23224, 22996,
// P20-P25.agc:3196
//			VATT
// slot 23225
    23225, 14,
// P20-P25.agc:3197
//		STODL	LMVEL		# SAVE LM VELOCITY B-7
// slot 23226
    23226, 14816,
// P20-P25.agc:3198
//			TAT
// slot 23227
    23227, 26,
// P20-P25.agc:3199
//CSMINT		STCALL	TDEC1
// slot 23228
    23228, 28738,
// P20-P25.agc:3200
//			CSMCONIC	# EXTRAPOLATE CSM
// slot 23229
    23229, 23660,
// P20-P25.agc:3201
//		VLOAD	VSU		# COMPUTE RELATIVE VELOCITY V(CSM) - V(LM)
// slot 23230
    23230, 43514,
// P20-P25.agc:3202
//			VATT
// slot 23231
    23231, 14,
// P20-P25.agc:3203
//			LMVEL
// slot 23232
    23232, 2528,
// P20-P25.agc:3204
//		MXV	VSL1
// slot 23233
    23233, 64162,
// P20-P25.agc:3205
//			REFSMMAT
// slot 23234
    23234, 1976,
// P20-P25.agc:3206
//		EXIT
// slot 23235
    23235, 65532
)).

// bank 24, slots 23236-23236
function agcAotUnit1523 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3207
//		TC	KILLTASK	# KILL THE TASK WHICH CALLS DODES SINCE
// slot 23236
    if slot <> 23236 or instruction <> 3095 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3095, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1523] to agcAotUnit1523@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3208
//		CADR	DESLOOP +2	# STORING INTO ERASEABLES DODES USES
// slot 23237
    23237, 43780
)).

// bank 24, slots 23238-23238
function agcAotUnit1524 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3209
//		TC	INTPRET
// slot 23238
    if slot <> 23238 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1524] to agcAotUnit1524@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3210
//		STOVL	LOSVEL
// slot 23239
    23239, 22498,
// P20-P25.agc:3211
//			RATT
// slot 23240
    23240, 2,
// P20-P25.agc:3212
//		VSU	BOFF
// slot 23241
    23241, 35922,
// P20-P25.agc:3213
//			LMPOS
// slot 23242
    23242, 2516,
// P20-P25.agc:3214
//			RNDVZFLG
// slot 23243
    23243, 464,
// P20-P25.agc:3215
//			NOTSHIFT
// slot 23244
    23244, 42402,
// P20-P25.agc:3216
//		BOVB
// slot 23245
    23245, 65288,
// P20-P25.agc:3217
//			TCDANZIG
// slot 23246
    23246, 49110,
// P20-P25.agc:3218
//		VSL
// slot 23247
    23247, 65378,
// P20-P25.agc:3219
//			9D
// slot 23248
    23248, 16660,
// P20-P25.agc:3220
//NOTSHIFT	UNIT	BOVB		# IF OVERFLOW, RANGE MUST BE GREATER
// slot 23249
    23249, 33884,
// P20-P25.agc:3221
//			526ALARM	# THAN 400 N. M.
// slot 23250
    23250, 41092,
// P20-P25.agc:3222
//		MXV	VSL1
// slot 23251
    23251, 64162,
// P20-P25.agc:3223
//			REFSMMAT	# CONVERT TO STABLE MEMBER
// slot 23252
    23252, 1976,
// P20-P25.agc:3224
//		STODL	RRTARGET
// slot 23253
    23253, 13444,
// P20-P25.agc:3225
//			36D		# SAVE MAGNITUDE OF LOS VECTOR FOR
// slot 23254
    23254, 74,
// P20-P25.agc:3226
//		STORE	MLOSV		# VELOCITY CORRECTION IN DESIGNATE
// slot 23255
    23255, 2030,
// P20-P25.agc:3227
//		CLRGO
// slot 23256
    23256, 65304,
// P20-P25.agc:3228
//			RRNBSW
// slot 23257
    23257, 306,
// P20-P25.agc:3229
//			LS21X
// slot 23258
    23258, 2014,
// P20-P25.agc:3230
//
// P20-P25.agc:3231
//# Page 566
// P20-P25.agc:3232
//# PROGRAM NAME:  LPS20.2  400 NM RANGE CHECK
// P20-P25.agc:3233
//# MOD. NO. 2	BY COYNE KERMAN	SDC	DATE 12-7-66
// P20-P25.agc:3234
//#
// P20-P25.agc:3235
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:3236
//#	COMPARES THE MAGNITUDE OF THE LOS VECTOR TO 400 NM.
// P20-P25.agc:3237
//#
// P20-P25.agc:3238
//# CALLING SEQUENCE:	CALL
// P20-P25.agc:3239
//#				LPS20.2
// P20-P25.agc:3240
//#
// P20-P25.agc:3241
//# SUBROUTINES CALLED:  NONE
// P20-P25.agc:3242
//#
// P20-P25.agc:3243
//# NORMAL EXIT:  RETURN TO CALLER +1, MPAC EQ 0 (RANGE 400NM OR LESS.)
// P20-P25.agc:3244
//#
// P20-P25.agc:3245
//# ERROR EXITS:  RETURN TO CALLER +1, MPAC EQ 1 (RANGE GREATER THAN 400NM)
// P20-P25.agc:3246
//#
// P20-P25.agc:3247
//# ALARMS:  NONE
// P20-P25.agc:3248
//#
// P20-P25.agc:3249
//# OUTPUT:  NONE
// P20-P25.agc:3250
//#
// P20-P25.agc:3251
//# INITIALIZED ERASEABLE:
// P20-P25.agc:3252
//#	PDL 36D MUST CONTAIN THE MAGNITUDE OF THE VECTOR
// P20-P25.agc:3253
//#
// P20-P25.agc:3254
//# DEBRIS:
// P20-P25.agc:3255
//#	MPAC DESTROYED BY THIS ROUTINE
// P20-P25.agc:3256
//
// P20-P25.agc:3257
//		SETLOC	P20S1
// P20-P25.agc:3258
//		BANK
// P20-P25.agc:3259
//		COUNT*	$$/LPS20
// P20-P25.agc:3260
//
// P20-P25.agc:3261
//LPS20.2		DLOAD	DSU
// slot 24437
    24437, 38346,
// P20-P25.agc:3262
//			MLOSV		# MAGNITUDE OF LOS
// slot 24438
    24438, 2030,
// P20-P25.agc:3263
//			FHNM		# OVER 400NM
// slot 24439
    24439, 12032,
// P20-P25.agc:3264
//		BPL
// slot 24440
    24440, 65352,
// P20-P25.agc:3265
//			TOFAR
// slot 24441
    24441, 44792,
// P20-P25.agc:3266
//		SLOAD	RVQ
// slot 24442
    24442, 36538,
// P20-P25.agc:3267
//			ZERO/SP
// slot 24443
    24443, 6820,
// P20-P25.agc:3268
//TOFAR		SLOAD	RVQ
// slot 24444
    24444, 36538,
// P20-P25.agc:3269
//			ONE/SP
// slot 24445
    24445, 12030,
// P20-P25.agc:3270
//ONE/SP		DEC	1
// slot 24446
    24446, 2,
// P20-P25.agc:3271
//# Page 567
// P20-P25.agc:3272
//FHNM		2DEC	740800 B-20	# 400 NAUTICAL MILES IN METERS B-20
// slot 24447 24448
    24447, 23150, 24448, 0
)).

// bank 32, slots 28918-28920
function agcAotUnit1848 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28918 {
// P20-P25.agc:3273
//
// P20-P25.agc:3274
//# Page 568
// P20-P25.agc:3275
//# PROGRAM NAME:  LRS22.1 (DATA READ SUBROUTINE 1)
// P20-P25.agc:3276
//# MOD. NO.: 1		BY: VOLANTE KERMAN  SDC		DATE:  11-15-66
// P20-P25.agc:3277
//#
// P20-P25.agc:3278
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:3279
//#	1)	READS RENDEZVOUS RADAR RANGE AND RANGE-RATE, TRUNNION AND SHAFT ANGLES, THREE CDU VALUES AND TIME.  CONVERTS THIS
// P20-P25.agc:3280
//#		DATA AND LEAVES IT FOR THE MEASUREMENT INCORPORATION ROUTINE (LSR22.3).  CHECKS FOR THE RR DATA GOOD DISCRETE, FOR
// P20-P25.agc:3281
//#		RR REPOSITION AND RR CDU FAIL
// P20-P25.agc:3282
//#	2)	COMPARES RADAR LOS WITH LOS COMPUTED FROM STATE VECTORS TO SEE IF THEY ARE WITHIN THREE DEGREES
// P20-P25.agc:3283
//#
// P20-P25.agc:3284
//# CALLING SEQUENCE:  BANKCALL FOR LRS22.1
// P20-P25.agc:3285
//#
// P20-P25.agc:3286
//# SUBROUTINES CALLED:
// P20-P25.agc:3287
//#	RRDOT		LPS20.1
// P20-P25.agc:3288
//#	RRRANGE		BANKCALL
// P20-P25.agc:3289
//#	RADSTALL	CDULOGIC
// P20-P25.agc:3290
//#	RRNB		SMNB
// P20-P25.agc:3291
//#
// P20-P25.agc:3292
//# NORMAL EXIT:  RETURN TO CALLER+1 WITH MPAC SET TO +0
// P20-P25.agc:3293
//#
// P20-P25.agc:3294
//# ERROR EXITS:  RETURN TO CALLER+1 WITH ERROR CODE STORED IN MPAC AS FOLLOWS:
// P20-P25.agc:3295
//#	00001 -- ERROR EXIT 1 -- RR DATA NO GOOD (NO RR DATA GOOD DISCRETE OR RR CDU FAIL OR RR REPOSITION)
// P20-P25.agc:3296
//#	00002 -- ERROR EXIT 2 -- RR LOS NOT WITHIN THREE DEGREES OF LOS COMPUTED FROM STATE VECTORS
// P20-P25.agc:3297
//#
// P20-P25.agc:3298
//# ALARMS:  521 -- COULD NOT READ RADAR DATA (RR DATA GOOD DISCRETE NOT PRESENT BEFORE AND AFTER READING THE RADAR)
// P20-P25.agc:3299
//#	(THIS ALARM IS ISSUED BY RADARREAD SUBROUTINE WHICH IS ENTERED FROM A RADARUPT)
// P20-P25.agc:3300
//#
// P20-P25.agc:3301
//# OUTPUT:  RRLOSVEC -- THE RR LINE-OF-SIGHT VECTOR (USED BY LRS22.2) -- A HALF-UNIT VECTOR
// P20-P25.agc:3302
//# 	RM -- THE RR RANGE READING (TO THE CSM) DP, IN METERS SCALED BY B-29 (USED BY LRS22.2 AND LRS22.3)
// P20-P25.agc:3303
//#
// P20-P25.agc:3304
//#	ALL OF THE FOLLOWING OUTPUTS ARE USED BY LRS22.3:
// P20-P25.agc:3305
//#		RDOTM -- THE RR RANGE-RATE READING, DP, IN METERS PER CENTISECOND, SCALED BY B-7
// P20-P25.agc:3306
//#		RRTRUN -- THE RR TRUNNION ANGLE, DP, IN REVOLUTIONS, SCALED B0
// P20-P25.agc:3307
//#		RRSHAFT -- RR SHAFT ANGLE, DP, IN REVOLUTIONS, SCALED B0
// P20-P25.agc:3308
//#		AIG,AMG,AOG -- THE CDU ANGLES, THREE SP WORDS
// P20-P25.agc:3309
//#		MKTIME -- THE TIME OF THE RR READING, DP, IN CENTISECONDS
// P20-P25.agc:3310
//#
// P20-P25.agc:3311
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:3312
//#	RNRAD, THE RADAR READ COUNTER FROM WHICH IS OBTAINED:
// P20-P25.agc:3313
//# Page 569
// P20-P25.agc:3314
//#		1) RR RANGE SCALED 9.38 FT. PER BIT ON THE LOW SCALE AND 75.04 FT. PER BIT ON THE HIGH SCALE
// P20-P25.agc:3315
//#		2) RR RANGE RATE, SCALED .6278 FT./SEC. PER BIT
// P20-P25.agc:3316
//#	THE CDU ANGLES FROM CDUX, CDUY, CDUZ, AND TIME1 AND TIME2
// P20-P25.agc:3317
//#
// P20-P25.agc:3318
//# DEBRIS:  LRS22.1X, A, L, Q, PUSHLIST
// P20-P25.agc:3319
//
// P20-P25.agc:3320
//		BANK	32
// P20-P25.agc:3321
//		SETLOC	LRS22
// P20-P25.agc:3322
//		BANK
// P20-P25.agc:3323
//		COUNT*	$$/LRS22
// P20-P25.agc:3324
//
// P20-P25.agc:3325
//LRS22.1		TC	MAKECADR
// slot 28918
        if slot <> 28918 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28919 {
// P20-P25.agc:3326
//		TS	LRS22.1X
// slot 28919
            if slot <> 28919 or instruction <> 23519 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23519, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3327
//		TC	DOWNFLAG
// slot 28920
            if slot <> 28920 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1848] to agcAotUnit1848@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3328
//		ADRES	RNGSCFLG
// slot 28921
    28921, 160
)).

// bank 32, slots 28922-28932
function agcAotUnit1849 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28926 {
        if slot <= 28923 {
            if slot <= 28922 {
// P20-P25.agc:3329
//		INHINT
// slot 28922
                if slot <> 28922 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3330
//		CAF	BIT3
// slot 28923
                if slot <> 28923 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28924 {
// P20-P25.agc:3331
//		EXTEND			# GET RR RANGE SCALE
// slot 28924
                if slot <> 28924 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28925 {
// P20-P25.agc:3332
//		RAND	CHAN33		# FROM CHANNEL 33 BIT 3
// slot 28925
                    if slot <> 28925 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3333
//		TS	L
// slot 28926
                    if slot <> 28926 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28929 {
            if slot <= 28927 {
// P20-P25.agc:3334
//		CS	RRRSBIT
// slot 28927
                if slot <> 28927 or instruction <> 18921 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28928 {
// P20-P25.agc:3335
//		MASK	RADMODES
// slot 28928
                    if slot <> 28928 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3336
//		AD	L
// slot 28929
                    if slot <> 28929 or instruction <> 24577 { return choose false if checkOnly else -1. }
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
            if slot <= 28930 {
// P20-P25.agc:3337
//		TS	RADMODES
// slot 28930
                if slot <> 28930 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28931 {
// P20-P25.agc:3338
//		RELINT
// slot 28931
                    if slot <> 28931 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3339
//READRDOT	TC	BANKCALL
// slot 28932
                    if slot <> 28932 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1849] to agcAotUnit1849@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3340
//		CADR	RRRDOT		# READ RANGE-RATE (ONE SAMPLE)
// slot 28933
    28933, 44166
)).

// bank 32, slots 28934-28934
function agcAotUnit1850 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3341
//		TC	BANKCALL
// slot 28934
    if slot <> 28934 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1850] to agcAotUnit1850@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3342
//		CADR	RADSTALL	# WAIT FOR DATA READ COMPLETION
// slot 28935
    28935, 16280
)).

// bank 32, slots 28936-28954
function agcAotUnit1851 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28944 {
        if slot <= 28939 {
            if slot <= 28937 {
                if slot <= 28936 {
// P20-P25.agc:3343
//		TCF	EREXIT1		# COULD NOT READ RADAR-ERROR EXIT 1
// slot 28936
                    if slot <> 28936 or instruction <> 5474 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5474, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3344
//
// P20-P25.agc:3345
//		INHINT			# NO INTERRUPTS WHILE READING TIME AND CDU
// slot 28937
                    if slot <> 28937 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28938 {
// P20-P25.agc:3346
//		DXCH	TIMEHOLD	# SET MARK TIME EQUAL TO THE MID-POINT
// slot 28938
                    if slot <> 28938 or instruction <> 22086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 582, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3347
//		DXCH	MPAC +5		# TEMP BUFFER FOR DOWNLINK
// slot 28939
                    if slot <> 28939 or instruction <> 21618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28941 {
                if slot <= 28940 {
// P20-P25.agc:3348
//		DXCH	SAMPLSUM	# SAVE RANGE-RATE READING
// slot 28940
                    if slot <> 28940 or instruction <> 22082 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 578, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3349
//		DXCH	RDOTMSAV
// slot 28941
                    if slot <> 28941 or instruction <> 22503 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 999, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28942 {
// P20-P25.agc:3350
//		EXTEND
// slot 28942
                    if slot <> 28942 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28943 {
// P20-P25.agc:3351
//		DCA	CDUY		# SAVE ICDU ANGLES
// slot 28943
                        if slot <> 28943 or instruction <> 12316 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 28, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3352
//		DXCH	MPAC +3		# TEMP BUFFER FOR DOWNLINK
// slot 28944
                        if slot <> 28944 or instruction <> 21616 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 28949 {
            if slot <= 28946 {
                if slot <= 28945 {
// P20-P25.agc:3353
//		CA	CDUX
// slot 28945
                    if slot <> 28945 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3354
//		TS	MPAC +2		# TEMP BUFFER FOR DOWNLINK
// slot 28946
                    if slot <> 28946 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28947 {
// P20-P25.agc:3355
//		EXTEND
// slot 28947
                    if slot <> 28947 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28948 {
// P20-P25.agc:3356
//		DCA	TIME2		# SAVE TIME
// slot 28948
                        if slot <> 28948 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3357
//		DXCH	MPAC		# SAVE TIME OF CDUY READINGS IN MPAC
// slot 28949
                        if slot <> 28949 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 28951 {
                if slot <= 28950 {
// P20-P25.agc:3358
//		EXTEND
// slot 28950
                    if slot <> 28950 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3359
//		DCA	CDUT		# SAVE TRUNNION AND SHAFT ANGLES FOR RRNB
// slot 28951
                    if slot <> 28951 or instruction <> 12318 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28952 {
// P20-P25.agc:3360
//		DXCH	TANG
// slot 28952
                    if slot <> 28952 or instruction <> 22088 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 28953 {
// P20-P25.agc:3361
//# Page 570
// P20-P25.agc:3362
//		RELINT
// slot 28953
                        if slot <> 28953 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:3363
//		TC	BANKCALL
// slot 28954
                        if slot <> 28954 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1851] to agcAotUnit1851@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3364
//		CADR	RRRANGE		# READ RR RANGE (ONE SAMPLE)
// slot 28955
    28955, 44170
)).

// bank 32, slots 28956-28956
function agcAotUnit1852 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3365
//		TC	BANKCALL
// slot 28956
    if slot <> 28956 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1852] to agcAotUnit1852@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3366
//		CADR	RADSTALL	# WAIT FOR READ COMPLETE
// slot 28957
    28957, 16280
)).

// bank 32, slots 28958-28971
function agcAotUnit1853 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28964 {
        if slot <= 28960 {
            if slot <= 28958 {
// P20-P25.agc:3367
//		TC	CHEXERR		# CHECK FOR ERRORS DURING READ
// slot 28958
                if slot <> 28958 or instruction <> 1374 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1374, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28959 {
// P20-P25.agc:3368
//		INHINT			# COPY CYCLE FOR MARK DATA ON DOWNLINK
// slot 28959
                    if slot <> 28959 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3369
//		DXCH	DNRRANGE	# RANGE, RANGE RATE (RAW DATA)
// slot 28960
                    if slot <> 28960 or instruction <> 22236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 732, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28962 {
                if slot <= 28961 {
// P20-P25.agc:3370
//		DXCH	RANGRDOT
// slot 28961
                    if slot <> 28961 or instruction <> 22513 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1009, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3371
//		DXCH	MPAC +5
// slot 28962
                    if slot <> 28962 or instruction <> 21618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28963 {
// P20-P25.agc:3372
//		DXCH	MKTIME		# MARK TIME
// slot 28963
                    if slot <> 28963 or instruction <> 22509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1005, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3373
//		DXCH	MPAC +3
// slot 28964
                    if slot <> 28964 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28967 {
            if slot <= 28965 {
// P20-P25.agc:3374
//		DXCH	AIG		# CDUY, CDUZ
// slot 28965
                if slot <> 28965 or instruction <> 22320 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28966 {
// P20-P25.agc:3375
//		EXTEND
// slot 28966
                    if slot <> 28966 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3376
//		DCA	TANG		# PRESERVE TANG
// slot 28967
                    if slot <> 28967 or instruction <> 12872 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 584, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28969 {
                if slot <= 28968 {
// P20-P25.agc:3377
//		DXCH	TANGNB		# TRUNNION AND SHAFT ANGLES
// slot 28968
                    if slot <> 28968 or instruction <> 22507 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1003, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3378
//		CA	MPAC +2
// slot 28969
                    if slot <> 28969 or instruction <> 12398 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 110).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 28970 {
// P20-P25.agc:3379
//		TS	AOG		# CDUX
// slot 28970
                    if slot <> 28970 or instruction <> 23345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3380
//		TC	INTPRET
// slot 28971
                    if slot <> 28971 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1853] to agcAotUnit1853@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3381
//		STODL	20D		# SAVE TIME OF CDU READINGS IN 20D
// slot 28972
    28972, 12330,
// P20-P25.agc:3382
//			RDOTMSAV	# CONVERT RDOT UNITS AND SCALING
// slot 28973
    28973, 4046,
// P20-P25.agc:3383
//		SL	DMPR		# START WITH READING SCALED B-28, -.6278
// slot 28974
    28974, 48482,
// P20-P25.agc:3384
//			14D		# FT./SECOND PER BIT
// slot 28975
    28975, 16670,
// P20-P25.agc:3385
//			RDOTCONV	# END WITH METERS/CENTISECOND, B-7
// slot 28976
    28976, 20484,
// P20-P25.agc:3386
//		STORE	RDOTM
// slot 28977
    28977, 4050,
// P20-P25.agc:3387
//		SLOAD	RTB
// slot 28978
    28978, 40122,
// P20-P25.agc:3388
//			TANG		# GET TRUNNION ANGLE
// slot 28979
    28979, 1168,
// P20-P25.agc:3389
//			CDULOGIC	# CONVERT TO DP ONES COMP. IN REVOLUTIOINS
// slot 28980
    28980, 18172,
// P20-P25.agc:3390
//		STORE	RRTRUN		# AND SAVE FOR TMI ROUTINE (LSR22.3)
// slot 28981
    28981, 4024,
// P20-P25.agc:3391
//		SLOAD	RTB
// slot 28982
    28982, 40122,
// P20-P25.agc:3392
//			TANG +1		# DITTO FOR SHAFT ANGLE
// slot 28983
    28983, 1170,
// P20-P25.agc:3393
//			CDULOGIC
// slot 28984
    28984, 18172,
// P20-P25.agc:3394
//		STODL	RRSHAFT
// slot 28985
    28985, 16316,
// P20-P25.agc:3395
//			SAMPLSUM
// slot 28986
    28986, 1156,
// P20-P25.agc:3396
//		DMP	SL2R		# CONVERT UNITS AND SCALING DP RANGE
// slot 28987
    28987, 55818,
// P20-P25.agc:3397
//			RANGCONV	# PER BIT, END WITH METERS, SCALED -29
// slot 28988
    28988, 20488,
// P20-P25.agc:3398
//		STCALL	RM
// slot 28989
    28989, 32734,
// P20-P25.agc:3399
//			RRNB		# COMPUTE RADAR LOS USING RRNB
// slot 28990
    28990, 38978,
// P20-P25.agc:3400
//		STODL	RRBORSIT	# AND SAVE
// slot 28991
    28991, 16322,
// P20-P25.agc:3401
//			20D
// slot 28992
    28992, 42,
// P20-P25.agc:3402
//		STCALL	TDEC1		# GET STATE VECTOR LOS AT TIME OF CDU READ
// slot 28993
    28993, 28738,
// P20-P25.agc:3403
//			LPS20.1
// slot 28994
    28994, 42330,
// P20-P25.agc:3404
//		EXIT
// slot 28995
    28995, 65532
)).

// bank 32, slots 28996-29002
function agcAotUnit1854 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28998 {
        if slot <= 28996 {
// P20-P25.agc:3405
//		CA	AIG		# STORE IMU CDU ANGLES AT MARKTIME
// slot 28996
            if slot <> 28996 or instruction <> 13103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 815).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28997 {
// P20-P25.agc:3406
//		TS	CDUSPOT		# IN CDUSPOT FOR TRG*SMNB
// slot 28997
                if slot <> 28997 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3407
//		CA	AMG
// slot 28998
                if slot <> 28998 or instruction <> 13104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 816).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29000 {
            if slot <= 28999 {
// P20-P25.agc:3408
//		TS	CDUSPOT +2
// slot 28999
                if slot <> 28999 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3409
//		CA	AOG
// slot 29000
                if slot <> 29000 or instruction <> 13105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 817).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29001 {
// P20-P25.agc:3410
//		TS	CDUSPOT +4
// slot 29001
                if slot <> 29001 or instruction <> 23034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3411
//		TC	INTPRET
// slot 29002
                if slot <> 29002 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1854] to agcAotUnit1854@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3412
//# Page 571
// P20-P25.agc:3413
//		VLOAD	CALL		# LOAD VECTOR AND CALL TRANSFORMATION
// slot 29003
    29003, 38138,
// P20-P25.agc:3414
//			RRTARGET
// slot 29004
    29004, 1156,
// P20-P25.agc:3415
//			TRG*SMNB	# ROTATE LOS AT MARKTIME FROM SM TO NB.
// slot 29005
    29005, 40786,
// P20-P25.agc:3416
//		DOT			# DOT WITH RADAR LOS TO GET ANGLE
// slot 29006
    29006, 65346,
// P20-P25.agc:3417
//			RRBORSIT
// slot 29007
    29007, 4034,
// P20-P25.agc:3418
//		SL1	ACOS		# BETWEEN THEM
// slot 29008
    29008, 54996,
// P20-P25.agc:3419
//		STORE	DSPTEM1		# STORE FOR POSSIBLE DISPLAY
// slot 29009
    29009, 1100,
// P20-P25.agc:3420
//		DSU	BMN		# IS IT LESS THAN 3 DEGREES
// slot 29010
    29010, 41002,
// P20-P25.agc:3421
//			THREEDEG
// slot 29011
    29011, 21196,
// P20-P25.agc:3422
//			NORMEXIT	# YES -- NORMAL EXIT
// slot 29012
    29012, 53938,
// P20-P25.agc:3423
//
// P20-P25.agc:3424
//		EXIT			# ERROR EXIT 2
// slot 29013
    29013, 65532
)).

// bank 32, slots 29014-29016
function agcAotUnit1855 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29014 {
// P20-P25.agc:3425
//		CAF	BIT2		# SET ERROR CODE
// slot 29014
        if slot <> 29014 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29015 {
// P20-P25.agc:3426
//		TS	MPAC
// slot 29015
            if slot <> 29015 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3427
//		TCF	OUT22.1
// slot 29016
            if slot <> 29016 or instruction <> 5468 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5468, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1855] to agcAotUnit1855@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3428
//
// P20-P25.agc:3429
//NORMEXIT	EXIT			# NORMAL EXIT -- SET MPAC EQUAL ZERO
// slot 29017
    29017, 65532
)).

// bank 32, slots 29018-29028
function agcAotUnit1856 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29022 {
        if slot <= 29019 {
            if slot <= 29018 {
// P20-P25.agc:3430
//		CAF	ZERO
// slot 29018
                if slot <> 29018 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3431
//		TS	MPAC
// slot 29019
                if slot <> 29019 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29020 {
// P20-P25.agc:3432
//OUT22.1		CAE	LRS22.1X	# EXIT FROM LRS22.1
// slot 29020
                if slot <> 29020 or instruction <> 13279 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 991).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29021 {
// P20-P25.agc:3433
//		TC	BANKJUMP
// slot 29021
                    if slot <> 29021 or instruction <> 2464 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2464, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3434
//CHEXERR		CAE	FLAGWRD5
// slot 29022
                    if slot <> 29022 or instruction <> 12353 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29025 {
            if slot <= 29023 {
// P20-P25.agc:3435
//		MASK	RNGSCBIT
// slot 29023
                if slot <> 29023 or instruction <> 31202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    if fixedOperand = 512 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29024 {
// P20-P25.agc:3436
//		CCS	A		# CHECK IF RANGE SCALE CHANGED
// slot 29024
                    if slot <> 29024 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3437
//		TCF	READRDOT	# YES -- TAKE ANOTHER READING
// slot 29025
                    if slot <> 29025 or instruction <> 5380 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5380, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29026 {
// P20-P25.agc:3438
//
// P20-P25.agc:3439
//EREXIT1		CA	BIT1		# SET ERROR CODE
// slot 29026
                if slot <> 29026 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29027 {
// P20-P25.agc:3440
//		TS	MPAC
// slot 29027
                    if slot <> 29027 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3441
//		TC	OUT22.1
// slot 29028
                    if slot <> 29028 or instruction <> 1372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1856] to agcAotUnit1856@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3442
//THREEDEG	2DEC	.008333333	# THREE DEGREES, SCALED REVS, B0
// slot 29029 29030
    29029, 272, 29030, 17476
)).

// bank 24, slots 23259-23261
function agcAotUnit1525 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23259 {
// P20-P25.agc:3443
//
// P20-P25.agc:3444
//RRLOSVEC	EQUALS	RRTARGET
// P20-P25.agc:3445
//
// P20-P25.agc:3446
//# Page 572
// P20-P25.agc:3447
//# PROGRAM NAME -- LRS22.2 (DATA READ SUBROUTINE 2)
// P20-P25.agc:3448
//# MOD. NO.: 1		BY: VOLANTE KERMAN  SDC		DATE: 4-11-67
// P20-P25.agc:3449
//#
// P20-P25.agc:3450
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:3451
//#	(Yes, I know point #1 is missing.  It is missing from the program listing -- RSB 2003)
// P20-P25.agc:3452
//#	2)  CHECKS IF THE RR LOS (I.E., THE RADAR BORESIGHT VECTOR) IS WITHIN 30 DEGREES OF THE LM +Z AXIS
// P20-P25.agc:3453
//#
// P20-P25.agc:3454
//# CALLING SEQUENCE:  BANKCALL FOR LRS22.2
// P20-P25.agc:3455
//#
// P20-P25.agc:3456
//# SUBROUTINES CALLED:  G+N, AUTO, SETMAXDB
// P20-P25.agc:3457
//#
// P20-P25.agc:3458
//# NORMAL EXIT:  RETURN TO CALLER WITH MPAC SET TO +0 (VIA SWRETURN)
// P20-P25.agc:3459
//#
// P20-P25.agc:3460
//# ERROR EXIT:  RETURN TO CALLER WITH MPAC SET TO 00001 -- RADAR LOS NOT WITHIN 30 DEGREES OF LM +Z AXIS.
// P20-P25.agc:3461
//#
// P20-P25.agc:3462
//# ALARMS:  NONE
// P20-P25.agc:3463
//#
// P20-P25.agc:3464
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:3465
//#	RRLOSVEC -- THE RR LINE-OF-SIGHT VECTOR -- A HALF UNIT VECTOR COMPUTED BY LRS22.1
// P20-P25.agc:3466
//#	RM -- RR RANGE, METERS B-29, FROM LRS22.1
// P20-P25.agc:3467
//#	BIT 14 CHANNEL 31 -- INDICATES AUTOPILOT IS IN AUTO MODE
// P20-P25.agc:3468
//#
// P20-P25.agc:3469
//# DEBRIS -- A,L,Q,MPAC -- PUSHLIST AND PUSHLOC ARE NOT CHANGED BY THIS ROUTINE
// P20-P25.agc:3470
//
// P20-P25.agc:3471
//		SETLOC	P20S
// P20-P25.agc:3472
//		BANK
// P20-P25.agc:3473
//LRS22.2		TC	MAKECADR
// slot 23259
        if slot <> 23259 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23260 {
// P20-P25.agc:3474
//		TS	LRS22.1X
// slot 23260
            if slot <> 23260 or instruction <> 23519 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23519, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3475
//		TC	INTPRET
// slot 23261
            if slot <> 23261 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1525] to agcAotUnit1525@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3476
//					# CHECK IF RR LOS IS WITHIN 30 DEG OF
// P20-P25.agc:3477
//30DEGCHK	DLOAD	ACOS		# THE SPACECRAFT +Z AXIT
// slot 23262
    23262, 54986,
// P20-P25.agc:3478
//			RRBORSIT +4	# BY TAKING ARCCOS OF Z-COMP. OF THE RR
// slot 23263
    23263, 4042,
// P20-P25.agc:3479
//					# LOS VECTOR, A HALF UNIT VECTOR
// P20-P25.agc:3480
//					# IN NAV BASE AXES)
// P20-P25.agc:3481
//		DSU	BMN
// slot 23264
    23264, 41002,
// P20-P25.agc:3482
//			30DEG
// slot 23265
    23265, 9690,
// P20-P25.agc:3483
//			OKEXIT		# NORMAL EXIT -- WITHIN 30 DEG.
// slot 23266
    23266, 42446,
// P20-P25.agc:3484
//		EXIT			# ERROR EXIT -- NOT WITHIN 30 DEG.
// slot 23267
    23267, 65532
)).

// bank 24, slots 23268-23270
function agcAotUnit1526 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23268 {
// P20-P25.agc:3485
//		CAF	BIT1		# SETS ERROR CODE IN MPAC
// slot 23268
        if slot <> 23268 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 23269 {
// P20-P25.agc:3486
//		TS	MPAC
// slot 23269
            if slot <> 23269 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3487
//		TCF	OUT22.2
// slot 23270
            if slot <> 23270 or instruction <> 5866 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5866, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1526] to agcAotUnit1526@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3488
//OKEXIT		EXIT			# NORMAL EXIT -- SET MPAC = ZERO
// slot 23271
    23271, 65532
)).

// bank 24, slots 23272-23275
function agcAotUnit1527 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23273 {
        if slot <= 23272 {
// P20-P25.agc:3489
//
// P20-P25.agc:3490
//# Page 573
// P20-P25.agc:3491
//		CAF	ZERO
// slot 23272
            if slot <> 23272 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3492
//		TS	MPAC
// slot 23273
            if slot <> 23273 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23274 {
// P20-P25.agc:3493
//OUT22.2		CAE	LRS22.1X
// slot 23274
            if slot <> 23274 or instruction <> 13279 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 991).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3494
//		TC	BANKJUMP
// slot 23275
            if slot <> 23275 or instruction <> 2464 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2464, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1527] to agcAotUnit1527@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3495
//
// P20-P25.agc:3496
//30DEG		2DEC	.083333333	# THIRTY DEGREES, SCALED REVS, B0
// slot 23276 23277
    23276, 2730, 23277, 10922,
// P20-P25.agc:3497
//
// P20-P25.agc:3498
//# Page 574
// P20-P25.agc:3499
//# PROGRAM NAME -- LSR22.3				DATE -- 29 MAY 1967
// P20-P25.agc:3500
//# MOD. NO 3						LOG SECTION -- P20-P25
// P20-P25.agc:3501
//# MOD. BY -- DANFORTH KERMAN					ASSEMBLY LEMP20S REV 10
// P20-P25.agc:3502
//#
// P20-P25.agc:3503
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:3504
//#	THIS ROUTINE COMPUTES THE B-VECTORS ADN DELTA Q FOR EACH OF THE QUANTITIES MEASURED BY THE RENDEZVOUS
// P20-P25.agc:3505
//#	RADAR.  (RANGE, RANGE RATE, SHAFT AND TRUNNION ANGLES).  THE ROUTINE CALLS THE INCORP1 AND INCORP2 ROUTINES
// P20-P25.agc:3506
//#	WHICH COMPUTE THE DEVIATIONS AND CORRECT THE STATE VECTOR.
// P20-P25.agc:3507
//#
// P20-P25.agc:3508
//# CALLING SEQUENCE:
// P20-P25.agc:3509
//#	THIS ROUTINE IS PART OF P20 RENDEZVOUS NAVIGATION FOR THE LM COMPUTER ONLY.  THE ROUTINE IS ENTERED FROM
// P20-P25.agc:3510
//# 	R22 LEM ONLY AND RETURNS DIRECTLY TO R22LEM FOLLOWING SUCCESSFUL INCORPORATION OF MEASURED DATA.  IF THE
// P20-P25.agc:3511
//#	COMPUTED STATE VECTOR DEVATIONS EXCEED THE MAXIMUM PERMITTED.  THE ROUTINE RETURNS TO R22LEM TO DISPLAY
// P20-P25.agc:3512
//#	THE DEVIATIONS.  IF BOB ACCEPTS THE DATA R22LEM RETURNS TO LSR22.3 TO INCORPORATE THE
// P20-P25.agc:3513
//#	DEVIATIONS INTO THE STATE VECTOR.  IF BOB REJECTS THE DEVIATIONS, NO MORE MEASUREMENTS ARE
// P20-P25.agc:3514
//#	PROCESSED FOR THIS MARK, I.E.,  R22LEM GETS THE NEXT MARK.
// P20-P25.agc:3515
//#
// P20-P25.agc:3516
//# SUBROUTINES CALLED:
// P20-P25.agc:3517
//#	WLINIT		LGCUPDTE	INTEGRV		INCORP1		ARCTAN
// P20-P25.agc:3518
//#	GETULC		RADARANG	INCORP2		NBSM		INTSTALL
// P20-P25.agc:3519
//#
// P20-P25.agc:3520
//# OUTPUT:
// P20-P25.agc:3521
//#	CORRECTED LM OR CSM STATE VECTOR (PERMANENT)
// P20-P25.agc:3522
//#	NUMBER OF MARKS INCORPORATED IN MARKCTR
// P20-P25.agc:3523
//#	MAGNITUDE OF POSITION DEVIATION (FOR DISPLAY) IN R22DISP METERS B-29
// P20-P25.agc:3524
//#	MAGNITUDE OF VELOCITY DEVIATION (FOR DISPLAY) IN R22DISP +2 M/CSEC B-7
// P20-P25.agc:3525
//#	UPDATED W-MATRIX
// P20-P25.agc:3526
//#
// P20-P25.agc:3527
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:3528
//#	LM AND CSM STATE VECTORS
// P20-P25.agc:3529
//#	W-MATRIX
// P20-P25.agc:3530
//#	MARK TIME IN MKTIME
// P20-P25.agc:3531
//#	RADAR RANGE IN RM METERS B-29
// P20-P25.agc:3532
//#		RANGE RATE IN RDOTM METERS/CSES B-7
// P20-P25.agc:3533
//#		SHAFT ANGLE IN RRSHAFT REVS. B0
// P20-P25.agc:3534
//#		TRUNNION ANGLE IN RRTRUN REVS. B0
// P20-P25.agc:3535
//#	GIMBAL ANGLES	INNER IN AIG
// P20-P25.agc:3536
//#			MIDDLE IN AMG
// P20-P25.agc:3537
//#			OUTER IN ACG
// P20-P25.agc:3538
//#	REFSMMAT
// P20-P25.agc:3539
//#	RENDWFLG
// P20-P25.agc:3540
//#	NOANGFLG
// P20-P25.agc:3541
//#	VEHUPFLG
// P20-P25.agc:3542
//#
// P20-P25.agc:3543
//# DEBRIS:
// P20-P25.agc:3544
//#	PUSHLIST -- ALL
// P20-P25.agc:3545
//#	MX, MY, MZ (VECTORS)
// P20-P25.agc:3546
//# Page 575
// P20-P25.agc:3547
//#	ULC, RXZ, SINTHETA, LGRET, RDRET, BVECTOR, W.IND, X78T
// P20-P25.agc:3548
//
// P20-P25.agc:3549
//		BANK	13
// P20-P25.agc:3550
//		SETLOC	P20S3
// P20-P25.agc:3551
//		BANK
// P20-P25.agc:3552
//
// P20-P25.agc:3553
//		EBANK=	LOSCOUNT
// P20-P25.agc:3554
//		COUNT*	$$/LSR22
// P20-P25.agc:3555
//LSR22.3		CALL
// slot 24842
    24842, 65320,
// P20-P25.agc:3556
//			GRP2PC
// slot 24843
    24843, 9544,
// P20-P25.agc:3557
//		BON	SET
// slot 24844
    24844, 35864,
// P20-P25.agc:3558
//			SURFFLAG	# ARE WE ON MUN SURFACE
// slot 24845
    24845, 4494,
// P20-P25.agc:3559
//			LSR22.4		# YES
// slot 24846
    24846, 46336,
// P20-P25.agc:3560
//			DMENFLG
// slot 24847
    24847, 2668,
// P20-P25.agc:3561
//		BOFF	CALL
// slot 24848
    24848, 37912,
// P20-P25.agc:3562
//			VEHUPFLG
// slot 24849
    24849, 974,
// P20-P25.agc:3563
//			DOLEM
// slot 24850
    24850, 45656,
// P20-P25.agc:3564
//			INTSTALL
// slot 24851
    24851, 24088,
// P20-P25.agc:3565
//		CLEAR	CALL		# LM PRECISION INTEGRATION
// slot 24852
    24852, 37912,
// P20-P25.agc:3566
//			VINTFLAG
// slot 24853
    24853, 1912,
// P20-P25.agc:3567
//			SETIFLGS
// slot 24854
    24854, 23368,
// P20-P25.agc:3568
//		CALL
// slot 24855
    24855, 65320,
// P20-P25.agc:3569
//			INTGRCAL
// slot 24856
    24856, 46404,
// P20-P25.agc:3570
//		CALL
// slot 24857
    24857, 65320,
// P20-P25.agc:3571
//			GRP2PC
// slot 24858
    24858, 9544,
// P20-P25.agc:3572
//		CALL
// slot 24859
    24859, 65320,
// P20-P25.agc:3573
//			INTSTALL
// slot 24860
    24860, 24088,
// P20-P25.agc:3574
//		CLEAR	BOFF
// slot 24861
    24861, 35864,
// P20-P25.agc:3575
//			DIM0FLAG
// slot 24862
    24862, 1916,
// P20-P25.agc:3576
//			RENDWFLG
// slot 24863
    24863, 3036,
// P20-P25.agc:3577
//			NOTWCSM
// slot 24864
    24864, 45640,
// P20-P25.agc:3578
//		SET	SET		# CSM WITH W-MATRIX INTEGRATION
// slot 24865
    24865, 35864,
// P20-P25.agc:3579
//			DIM0FLAG
// slot 24866
    24866, 1660,
// P20-P25.agc:3580
//			D6OR9FLG
// slot 24867
    24867, 1658,
// P20-P25.agc:3581
//NOTWCSM		SET	CLEAR
// slot 24868
    24868, 35864,
// P20-P25.agc:3582
//			VINTFLAG
// slot 24869
    24869, 1656,
// P20-P25.agc:3583
//			INTYPFLG
// slot 24870
    24870, 1910,
// P20-P25.agc:3584
//		SET	CALL
// slot 24871
    24871, 37912,
// P20-P25.agc:3585
//			STATEFLG
// slot 24872
    24872, 1652,
// P20-P25.agc:3586
//			INTGRCAL
// slot 24873
    24873, 46404,
// P20-P25.agc:3587
//		GOTO
// slot 24874
    24874, 65360,
// P20-P25.agc:3588
//			MARKTEST
// slot 24875
    24875, 45704,
// P20-P25.agc:3589
//DOLEM		CALL
// slot 24876
    24876, 65320,
// P20-P25.agc:3590
//			INTSTALL
// slot 24877
    24877, 24088,
// P20-P25.agc:3591
//		SET	CALL
// slot 24878
    24878, 37912,
// P20-P25.agc:3592
//			VINTFLAG
// slot 24879
    24879, 1656,
// P20-P25.agc:3593
//			SETIFLGS
// slot 24880
    24880, 23368,
// P20-P25.agc:3594
//		CALL
// slot 24881
    24881, 65320,
// P20-P25.agc:3595
//			INTGRCAL
// slot 24882
    24882, 46404,
// P20-P25.agc:3596
//# Page 576
// P20-P25.agc:3597
//		CALL
// slot 24883
    24883, 65320,
// P20-P25.agc:3598
//			GRP2PC
// slot 24884
    24884, 9544,
// P20-P25.agc:3599
//		CALL
// slot 24885
    24885, 65320,
// P20-P25.agc:3600
//			INTSTALL
// slot 24886
    24886, 24088,
// P20-P25.agc:3601
//		CLEAR	BOFF
// slot 24887
    24887, 35864,
// P20-P25.agc:3602
//			DIM0FLAG
// slot 24888
    24888, 1916,
// P20-P25.agc:3603
//			RENDWFLG
// slot 24889
    24889, 3036,
// P20-P25.agc:3604
//			NOTWLEM
// slot 24890
    24890, 45692,
// P20-P25.agc:3605
//		SET	SET		# LM WITH W-MATRIX INTEGRATION
// slot 24891
    24891, 35864,
// P20-P25.agc:3606
//			DIM0FLAG
// slot 24892
    24892, 1660,
// P20-P25.agc:3607
//			D6OR9FLG
// slot 24893
    24893, 1658,
// P20-P25.agc:3608
//NOTWLEM		CLEAR	CLEAR
// slot 24894
    24894, 35864,
// P20-P25.agc:3609
//			INTYPFLG
// slot 24895
    24895, 1910,
// P20-P25.agc:3610
//			VINTFLAG
// slot 24896
    24896, 1912,
// P20-P25.agc:3611
//		SET	CALL
// slot 24897
    24897, 37912,
// P20-P25.agc:3612
//			STATEFLG
// slot 24898
    24898, 1652,
// P20-P25.agc:3613
//			INTGRCAL
// slot 24899
    24899, 46404,
// P20-P25.agc:3614
//MARKTEST	BON	CALL		# HAS W-MATRIX BEEN INVALIDATED
// slot 24900
    24900, 37912,
// P20-P25.agc:3615
//			RENDWFLG	# HAS W-MATRIX BEEN INVALIDATED
// slot 24901
    24901, 2972,
// P20-P25.agc:3616
//			RANGEBQ
// slot 24902
    24902, 45712,
// P20-P25.agc:3617
//			WLINIT		# YES -- REINITIALIZE
// slot 24903
    24903, 46418,
// P20-P25.agc:3618
//RANGEBQ		BON	EXIT		# DON'T CALL R65 IF ON SURFACE
// slot 24904
    24904, 65048,
// P20-P25.agc:3619
//			SURFFLAG
// slot 24905
    24905, 4494,
// P20-P25.agc:3620
//			RANGEBQ1
// slot 24906
    24906, 45728
)).

// bank 26, slots 24907-24909
function agcAotUnit1644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24907 {
// P20-P25.agc:3621
//		CA	ZERO
// slot 24907
        if slot <> 24907 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24908 {
// P20-P25.agc:3622
//		TS	R65CNTR
// slot 24908
            if slot <> 24908 or instruction <> 23525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23525, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:3623
//		TC	BANKCALL
// slot 24909
            if slot <> 24909 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1644] to agcAotUnit1644@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3624
//		CADR	R65LEM
// slot 24910
    24910, 39078
)).

// bank 26, slots 24911-24911
function agcAotUnit1645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:3625
//		TC	INTPRET
// slot 24911
    if slot <> 24911 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1645] to agcAotUnit1645@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3626
//RANGEBQ1	AXT,2	BON		# CLEAR X2
// slot 24912
    24912, 36088,
// P20-P25.agc:3627
//			0
// slot 24913
    24913, 0,
// P20-P25.agc:3628
//			LMOONFLG	# IS MUN SPHERE OF INFLUENCE
// slot 24914
    24914, 4488,
// P20-P25.agc:3629
//			SETX2		# YES.  STORE ZERO IN SCALSHFT REGISTER
// slot 24915
    24915, 45740,
// P20-P25.agc:3630
//		INCR,2
// slot 24916
    24916, 65432,
// P20-P25.agc:3631
//			2
// slot 24917
    24917, 4,
// P20-P25.agc:3632
//SETX2		SXA,2	CALL
// slot 24918
    24918, 38072,
// P20-P25.agc:3633
//			SCALSHFT	# 0 -- MUN.  2 -- KERBIN.
// slot 24919
    24919, 4000,
// P20-P25.agc:3634
//			GRP2PC
// slot 24920
    24920, 9544,
// P20-P25.agc:3635
//		AXT,1	SXA,1		# STORE RANGE CODE (1) FOR R3 IN NOUN 49
// slot 24921
    24921, 55536,
// P20-P25.agc:3636
//			1
// slot 24922
    24922, 2,
// P20-P25.agc:3637
//			WHCHREAD
// slot 24923
    24923, 4042,
// P20-P25.agc:3638
//		SLOAD	SR		# GET SINGLE PRECISION RVARMIN (B-12)
// slot 24924
    24924, 45498,
// P20-P25.agc:3639
//			RVARMIN		# SHIFT TO TRIPLE PRECISION (B-40)
// slot 24925
    24925, 2042,
// P20-P25.agc:3640
//			28D
// slot 24926
    24926, 17210,
// P20-P25.agc:3641
//		RTB
// slot 24927
    24927, 65336,
// P20-P25.agc:3642
//			TPMODE		# AND SAVE IN 20D
// slot 24928
    24928, 18230,
// P20-P25.agc:3643
//		STORE	20D
// slot 24929
    24929, 42,
// P20-P25.agc:3644
//		CALL			# BEGIN COMPUTING THE B-VECTORS, DELTAQ
// slot 24930
    24930, 65320,
// P20-P25.agc:3645
//			GETULC		# B-VECTORS FOR RANGE
// slot 24931
    24931, 46518,
// P20-P25.agc:3646
//		BON	VCOMP		# B0, COMP. IF LM BEING CORRECTED
// slot 24932
    24932, 48664,
// P20-P25.agc:3647
//# Page 577
// P20-P25.agc:3648
//			VEHUPFLG
// slot 24933
    24933, 910,
// P20-P25.agc:3649
//			+1
// slot 24934
    24934, 45774,
// P20-P25.agc:3650
//		STOVL	BVECTOR
// slot 24935
    24935, 24234,
// P20-P25.agc:3651
//			ZEROVECS
// slot 24936
    24936, 6820,
// P20-P25.agc:3652
//		STORE	BVECTOR +6	# B1
// slot 24937
    24937, 3766,
// P20-P25.agc:3653
//		STODL	BVECTOR +12D	# B2
// slot 24938
    24938, 16066,
// P20-P25.agc:3654
//			36D
// slot 24939
    24939, 74,
// P20-P25.agc:3655
//		SRR*	BDSU
// slot 24940
    24940, 37214,
// P20-P25.agc:3656
//			2,2		# SHIFT FROM KERBIN/MUN SPHERE TO B-29
// slot 24941
    24941, 47352,
// P20-P25.agc:3657
//			RM		# RM - (MAGNITUDE RCSM-RLM)
// slot 24942
    24942, 4062,
// P20-P25.agc:3658
//		SLR*
// slot 24943
    24943, 65374,
// P20-P25.agc:3659
//			2,2		# SHIFT TO KERBIN/MUN SPHERE
// slot 24944
    24944, 47864,
// P20-P25.agc:3660
//		STODL	DELTAQ		# KERBIN B-29.  MUN B-27
// slot 24945
    24945, 16078,
// P20-P25.agc:3661
//			36D		# RLC B-29/B-27
// slot 24946
    24946, 74,
// P20-P25.agc:3662
//		NORM	DSQ		# NORMALIZE AND SQUARE
// slot 24947
    24947, 52866,
// P20-P25.agc:3663
//			X1
// slot 24948
    24948, 78,
// P20-P25.agc:3664
//		DMP	SR*
// slot 24949
    24949, 44810,
// P20-P25.agc:3665
//			RANGEVAR	# MULTIPLY BY RANGEVAR (B12) THEN
// slot 24950
    24950, 2034,
// P20-P25.agc:3666
//			0 -2,1		# UNNORMALIZE
// slot 24951
    24951, 17150,
// P20-P25.agc:3667
//		SR*	SR*
// slot 24952
    24952, 44894,
// P20-P25.agc:3668
//			0,1
// slot 24953
    24953, 17154,
// P20-P25.agc:3669
//			0,2
// slot 24954
    24954, 48380,
// P20-P25.agc:3670
//		SR*	RTB
// slot 24955
    24955, 40030,
// P20-P25.agc:3671
//			0,2
// slot 24956
    24956, 48380,
// P20-P25.agc:3672
//			TPMODE
// slot 24957
    24957, 18230,
// P20-P25.agc:3673
//		STORE	VARIANCE	# B-40
// slot 24958
    24958, 2958,
// P20-P25.agc:3674
//		DCOMP	TAD
// slot 24959
    24959, 63868,
// P20-P25.agc:3675
//			20D		# B-40
// slot 24960
    24960, 42,
// P20-P25.agc:3676
//		BMN	TLOAD
// slot 24961
    24961, 59712,
// P20-P25.agc:3677
//			QOK
// slot 24962
    24962, 45834,
// P20-P25.agc:3678
//			20D		# B-40
// slot 24963
    24963, 42,
// P20-P25.agc:3679
//		STORE	VARIANCE
// slot 24964
    24964, 2958,
// P20-P25.agc:3680
//QOK		CALL
// slot 24965
    24965, 65320,
// P20-P25.agc:3681
//			LGCUPDTE
// slot 24966
    24966, 46594,
// P20-P25.agc:3682
//
// P20-P25.agc:3683
//		SSP	CALL
// slot 24967
    24967, 38066,
// P20-P25.agc:3684
//			WHCHREAD
// slot 24968
    24968, 4044,
// P20-P25.agc:3685
//		DEC	2		# STORE R-RATE CODE (2) FOR R3 IN NOUN 49
// slot 24969
    24969, 4,
// P20-P25.agc:3686
//			GRP2PC
// slot 24970
    24970, 9544,
// P20-P25.agc:3687
//		CALL			# B-VECTOR, DELTAQ FOR RANGE RATE
// slot 24971
    24971, 65320,
// P20-P25.agc:3688
//			GETULC
// slot 24972
    24972, 46518,
// P20-P25.agc:3689
//		PDDL	SR*		# GET RLC SCALED B-29/B-27
// slot 24973
    24973, 44970,
// P20-P25.agc:3690
//			36D		# AND SHIFT TO B-23
// slot 24974
    24974, 74,
// P20-P25.agc:3691
//			0 -4,2
// slot 24975
    24975, 48388,
// P20-P25.agc:3692
//		STOVL	36D		# THEN STORE BACK IN 36D
// slot 24976
    24976, 20554,
// P20-P25.agc:3693
//		BON	VCOMP		# B1, COMP. IF LM BEING CORRECTED
// slot 24977
    24977, 48664,
// P20-P25.agc:3694
//			VEHUPFLG
// slot 24978
    24978, 910,
// P20-P25.agc:3695
//			+1
// slot 24979
    24979, 45864,
// P20-P25.agc:3696
//		VXSC
// slot 24980
    24980, 65506,
// P20-P25.agc:3697
//			36D		# B1 = RLC (B-24/B-22)
// slot 24981
    24981, 74,
// P20-P25.agc:3698
//# Page 578
// P20-P25.agc:3699
//		STOVL	BVECTOR +6
// slot 24982
    24982, 24246,
// P20-P25.agc:3700
//			NUVLEM
// slot 24983
    24983, 1878,
// P20-P25.agc:3701
//		VSR*	VAD
// slot 24984
    24984, 44382,
// P20-P25.agc:3702
//			6,2		# SHIFT FOR KERBIN/MUN SPHERE
// slot 24985
    24985, 48368,
// P20-P25.agc:3703
//			VCVLEM		# KERBIN B-7. MUN B-5
// slot 24986
    24986, 1902,
// P20-P25.agc:3704
//		PDVL	VSR*		# VL TO PD6
// slot 24987
    24987, 44954,
// P20-P25.agc:3705
//			NUVCSM
// slot 24988
    24988, 1794,
// P20-P25.agc:3706
//			6,2		# SHIFT FOR KERBIN/MUN SPHERE
// slot 24989
    24989, 48368,
// P20-P25.agc:3707
//		VAD	VSU
// slot 24990
    24990, 43354,
// P20-P25.agc:3708
//			VCVCSM
// slot 24991
    24991, 1818,
// P20-P25.agc:3709
//		PDVL	DOT		# VC - VL = VLC TO PD6
// slot 24992
    24992, 41370,
// P20-P25.agc:3710
//			0
// slot 24993
    24993, 2,
// P20-P25.agc:3711
//			6
// slot 24994
    24994, 14,
// P20-P25.agc:3712
//		PUSH	SRR*		# RDOT B-8/B-6 TO PD12
// slot 24995
    24995, 44812,
// P20-P25.agc:3713
//			2,2		# SHIFT FROM KERBIN/MUN SPHERE TO B-8
// slot 24996
    24996, 47352,
// P20-P25.agc:3714
//		DSQ	DMPR		# RDOT**2 B-16 X RATEVAR B12
// slot 24997
    24997, 48540,
// P20-P25.agc:3715
//			RATEVAR
// slot 24998
    24998, 2038,
// P20-P25.agc:3716
//		STORE	VARIANCE
// slot 24999
    24999, 2958,
// P20-P25.agc:3717
//		SLOAD	SR
// slot 25000
    25000, 45498,
// P20-P25.agc:3718
//			VVARMIN		# GET SINGLE PRECISION VVARMIN (B+12)
// slot 25001
    25001, 2044,
// P20-P25.agc:3719
//			16D		# SHIFT TO DP (B-4)
// slot 25002
    25002, 17186,
// P20-P25.agc:3720
//		STORE	24D		# AND SAVE IN 24D
// slot 25003
    25003, 50,
// P20-P25.agc:3721
//		DSU	BMN		# IS MIN. VARIANCE > COMPUTED VARIANCE
// slot 25004
    25004, 41002,
// P20-P25.agc:3722
//			VARIANCE
// slot 25005
    25005, 2958,
// P20-P25.agc:3723
//			VOK		# BRANCH -- NO
// slot 25006
    25006, 45924,
// P20-P25.agc:3724
//		DLOAD			# YES -- USE MINIMUM VARIANCE
// slot 25007
    25007, 65482,
// P20-P25.agc:3725
//			24D
// slot 25008
    25008, 50,
// P20-P25.agc:3726
//		STORE 	VARIANCE
// slot 25009
    25009, 2958,
// P20-P25.agc:3727
//VOK		DLOAD	SR2		# RDOT (PD12) FROM B-8/B-6
// slot 25010
    25010, 49866,
// P20-P25.agc:3728
//		PDDL	SLR*		# TO B-10/B-8
// slot 25011
    25011, 44970,
// P20-P25.agc:3729
//			RDOTM		# SHIFT TO KERBIN/MUN SPHERE
// slot 25012
    25012, 4050,
// P20-P25.agc:3730
//			0 -1,2		# B-7 TO B-10/B-8
// slot 25013
    25013, 47870,
// P20-P25.agc:3731
//		DSU
// slot 25014
    25014, 65322,
// P20-P25.agc:3732
//		DMPR
// slot 25015
    25015, 65402,
// P20-P25.agc:3733
//			36D
// slot 25016
    25016, 74,
// P20-P25.agc:3734
//		STOVL	DELTAQ		# B-33
// slot 25017
    25017, 24270,
// P20-P25.agc:3735
//			0		# NOW GET B0
// slot 25018
    25018, 2,
// P20-P25.agc:3736
//		VXV	VXV		# (ULC X VLC) X ULC
// slot 25019
    25019, 40250,
// P20-P25.agc:3737
//		BON	VCOMP		# B0, COMP. IF LM BEING CORRECTED
// slot 25020
    25020, 48664,
// P20-P25.agc:3738
//			VEHUPFLG
// slot 25021
    25021, 910,
// P20-P25.agc:3739
//			+1
// slot 25022
    25022, 45950,
// P20-P25.agc:3740
//		VSR*
// slot 25023
    25023, 65374,
// P20-P25.agc:3741
//			0 -2,2		# SCALED B-5
// slot 25024
    25024, 48384,
// P20-P25.agc:3742
//		STOVL	BVECTOR
// slot 25025
    25025, 24234,
// P20-P25.agc:3743
//			ZEROVECS
// slot 25026
    25026, 6820,
// P20-P25.agc:3744
//		STORE	20D		# ZERO OUT 20 TO 25 IN PUSHLIST
// slot 25027
    25027, 42,
// P20-P25.agc:3745
//		STOVL	BVECTOR +12D
// slot 25028
    25028, 24258,
// P20-P25.agc:3746
//			BVECTOR
// slot 25029
    25029, 3754,
// P20-P25.agc:3747
//		ABVAL	NORM		# LOAD B0, GET MAGNITUDE AND NORMALIZE
// slot 25030
    25030, 49484,
// P20-P25.agc:3748
//			20D		# SHIFT COUNT IN 20D
// slot 25031
    25031, 42,
// P20-P25.agc:3749
//# Page 579
// P20-P25.agc:3750
//		VLOAD	ABVAL
// slot 25032
    25032, 42746,
// P20-P25.agc:3751
//			BVECTOR +6D	# LOAD B1, GET MAGNITUDE AND NORMALIZE
// slot 25033
    25033, 3766,
// P20-P25.agc:3752
//		NORM	DLOAD
// slot 25034
    25034, 58754,
// P20-P25.agc:3753
//			22D		# SHIFT COUNT IN 22D
// slot 25035
    25035, 46
)).

agcAotInstallSourceRope(list(
// P20-P25.agc:3754
//			22D		# FIND WHICH SHIFT IS SMALLER
// slot 25036
    25036, 46,
// P20-P25.agc:3755
//		DSU	BMN		# BRANCH -- B0 HAS A SMALLER SHIFT COUNT
// slot 25037
    25037, 41002,
// P20-P25.agc:3756
//			20D
// slot 25038
    25038, 42,
// P20-P25.agc:3757
//			VOK1
// slot 25039
    25039, 45990,
// P20-P25.agc:3758
//		LXA,1	GOTO
// slot 25040
    25040, 43216,
// P20-P25.agc:3759
//			22D		# LOAD X2 WITH THE SMALLER SHIFT COUNT
// slot 25041
    25041, 44,
// P20-P25.agc:3760
//			VOK2
// slot 25042
    25042, 45994,
// P20-P25.agc:3761
//VOK1		LXA,1
// slot 25043
    25043, 65488,
// P20-P25.agc:3762
//			20D
// slot 25044
    25044, 40,
// P20-P25.agc:3763
//VOK2		VLOAD	VSL*		# THEN ADJUST B0, B1, DELTAQ AND VARIANCE
// slot 25045
    25045, 45050,
// P20-P25.agc:3764
//			BVECTOR		# WITH THI SSHIFT COUNT
// slot 25046
    25046, 3754,
// P20-P25.agc:3765
//			0,1
// slot 25047
    25047, 16642,
// P20-P25.agc:3766
//		STOVL	BVECTOR
// slot 25048
    25048, 24234,
// P20-P25.agc:3767
//			BVECTOR +6
// slot 25049
    25049, 3766,
// P20-P25.agc:3768
//		VSL*
// slot 25050
    25050, 65374,
// P20-P25.agc:3769
//			0,1
// slot 25051
    25051, 16642,
// P20-P25.agc:3770
//		STODL	BVECTOR +6
// slot 25052
    25052, 16054,
// P20-P25.agc:3771
//			DELTAQ
// slot 25053
    25053, 3790,
// P20-P25.agc:3772
//		SL*
// slot 25054
    25054, 65374,
// P20-P25.agc:3773
//			0,1
// slot 25055
    25055, 16642,
// P20-P25.agc:3774
//		STORE	DELTAQ
// slot 25056
    25056, 3790,
// P20-P25.agc:3775
//		DLOAD	SL*		# GET RLC AND ADJUST FOR SCALE SHIFT
// slot 25057
    25057, 45002,
// P20-P25.agc:3776
//			36D
// slot 25058
    25058, 74,
// P20-P25.agc:3777
//			0 -1,1
// slot 25059
    25059, 16640,
// P20-P25.agc:3778
//		DSQ	DMP		# MULTIPLY RLC**2 BY VARIANCE
// slot 25060
    25060, 34204,
// P20-P25.agc:3779
//			VARIANCE
// slot 25061
    25061, 2958,
// P20-P25.agc:3780
//		SL4	RTB		# SHIFT TO CONFORM TO BVECTORS AND DELTAQ
// slot 25062
    25062, 39956,
// P20-P25.agc:3781
//			TPMODE
// slot 25063
    25063, 18230,
// P20-P25.agc:3782
//		STCALL	VARIANCE	# AND STORE TP VARIANCE
// slot 25064
    25064, 31630,
// P20-P25.agc:3783
//			LGCUPDTE
// slot 25065
    25065, 46594,
// P20-P25.agc:3784
//
// P20-P25.agc:3785
//		CALL
// slot 25066
    25066, 65320,
// P20-P25.agc:3786
//			GRP2PC
// slot 25067
    25067, 9544,
// P20-P25.agc:3787
//		BON	EXIT		# ARE ANGLES TO BE DONE
// slot 25068
    25068, 65048,
// P20-P25.agc:3788
//			SURFFLAG
// slot 25069
    25069, 4494,
// P20-P25.agc:3789
//			RENDEND		# NO
// slot 25070
    25070, 46332
)).

// bank 26, slots 25071-25079
function agcAotUnit1646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25074 {
        if slot <= 25072 {
            if slot <= 25071 {
// P20-P25.agc:3790
//		EBANK=	AIG
// P20-P25.agc:3791
//MXMYMZ		CAF	AIGBANK
// slot 25071
                if slot <> 25071 or instruction <> 14042 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1754), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3792
//		TS	BBANK
// slot 25072
                if slot <> 25072 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25073 {
// P20-P25.agc:3793
//		CA	AIG		# YES, COMPUTE	MX, MY, MZ
// slot 25073
                if slot <> 25073 or instruction <> 13103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 815).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3794
//		TS	CDUSPOT
// slot 25074
                if slot <> 25074 or instruction <> 23030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23030, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25076 {
            if slot <= 25075 {
// P20-P25.agc:3795
//		CA	AMG
// slot 25075
                if slot <> 25075 or instruction <> 13104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 816).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:3796
//		TS	CDUSPOT +2
// slot 25076
                if slot <> 25076 or instruction <> 23032 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23032, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25077 {
// P20-P25.agc:3797
//		CA 	AOG
// slot 25077
                if slot <> 25077 or instruction <> 13105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 817).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25078 {
// P20-P25.agc:3798
//		TS	CDUSPOT +4	# GIMBAL ANGLES NOW IN CDUSPOT FOR TRG*NBSM
// slot 25078
                    if slot <> 25078 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:3799
//		TC	INTPRET
// slot 25079
                    if slot <> 25079 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1646] to agcAotUnit1646@.

agcAotInstallSourceRope(list(
// P20-P25.agc:3800
//# Page 580
// P20-P25.agc:3801
//		VLOAD	CALL
// slot 25080
    25080, 38138,
// P20-P25.agc:3802
//			UNITX
// slot 25081
    25081, 6816,
// P20-P25.agc:3803
//			TRG*NBSM
// slot 25082
    25082, 40808,
// P20-P25.agc:3804
//		VXM	VSL1
// slot 25083
    25083, 64138,
// P20-P25.agc:3805
//			REFSMMAT
// slot 25084
    25084, 1976,
// P20-P25.agc:3806
//		STOVL	MX
// slot 25085
    25085, 24446,
// P20-P25.agc:3807
//			UNITY
// slot 25086
    25086, 6812,
// P20-P25.agc:3808
//		CALL
// slot 25087
    25087, 65320,
// P20-P25.agc:3809
//			*NBSM*
// slot 25088
    25088, 40822,
// P20-P25.agc:3810
//		VXM	VSL1
// slot 25089
    25089, 64138,
// P20-P25.agc:3811
//			REFSMMAT
// slot 25090
    25090, 1976,
// P20-P25.agc:3812
//		STOVL	MY
// slot 25091
    25091, 24458,
// P20-P25.agc:3813
//			UNITZ
// slot 25092
    25092, 6808,
// P20-P25.agc:3814
//		CALL
// slot 25093
    25093, 65320,
// P20-P25.agc:3815
//			*NBSM*
// slot 25094
    25094, 40822,
// P20-P25.agc:3816
//		VXM	VSL1
// slot 25095
    25095, 64138,
// P20-P25.agc:3817
//			REFSMMAT
// slot 25096
    25096, 1976,
// P20-P25.agc:3818
//SHAFTBQ		STCALL	MZ
// slot 25097
    25097, 32662,
// P20-P25.agc:3819
//			RADARANG
// slot 25098
    25098, 46562,
// P20-P25.agc:3820
//		SSP	CALL		# STORE SHAFT CODE (3) FOR R3 IN NOUN 49
// slot 25099
    25099, 38066,
// P20-P25.agc:3821
//			WHCHREAD
// slot 25100
    25100, 4044,
// P20-P25.agc:3822
//		DEC	3
// slot 25101
    25101, 6,
// P20-P25.agc:3823
//			GRP2PC
// slot 25102
    25102, 9544,
// P20-P25.agc:3824
//		VLOAD	DOT		# COMPUTE DELTAQ,B VECTORS FOR SHAFT ANG.
// slot 25103
    25103, 41466,
// P20-P25.agc:3825
//			ULC
// slot 25104
    25104, 4008,
// P20-P25.agc:3826
//			MX
// slot 25105
    25105, 3966,
// P20-P25.agc:3827
//		SL1
// slot 25106
    25106, 65492,
// P20-P25.agc:3828
//		STOVL	SINTH		# 18D
// slot 25107
    25107, 20518,
// P20-P25.agc:3829
//			ULC
// slot 25108
    25108, 4008,
// P20-P25.agc:3830
//		DOT	SL1
// slot 25109
    25109, 59970,
// P20-P25.agc:3831
//			MZ
// slot 25110
    25110, 3990,
// P20-P25.agc:3832
//		STCALL	COSTH		# 16D
// slot 25111
    25111, 28706,
// P20-P25.agc:3833
//			ARCTAN
// slot 25112
    25112, 23184,
// P20-P25.agc:3834
//		BDSU	DMP
// slot 25113
    25113, 34082,
// P20-P25.agc:3835
//			RRSHAFT
// slot 25114
    25114, 4028,
// P20-P25.agc:3836
//			2PI/8
// slot 25115
    25115, 13890,
// P20-P25.agc:3837
//		SL3R	PUSH
// slot 25116
    25116, 34420,
// P20-P25.agc:3838
//		DLOAD	SL3
// slot 25117
    25117, 43722,
// P20-P25.agc:3839
//			X789
// slot 25118
    25118, 1922,
// P20-P25.agc:3840
//		SRR*	BDSU		# SHIFT FROM -5/-3 TO B0
// slot 25119
    25119, 37214,
// P20-P25.agc:3841
//			0,2
// slot 25120
    25120, 47356,
// P20-P25.agc:3842
//		DMP	SRR*
// slot 25121
    25121, 44810,
// P20-P25.agc:3843
//			RXZ
// slot 25122
    25122, 4004,
// P20-P25.agc:3844
//			0,1		# SHIFT TO KERBIN/MUN SPHERE
// slot 25123
    25123, 18178,
// P20-P25.agc:3845
//		STOVL	DELTAQ		# KERBIN B-29.  MUN B-27
// slot 25124
    25124, 24270,
// P20-P25.agc:3846
//			ULC
// slot 25125
    25125, 4008,
// P20-P25.agc:3847
//		VXV	VSL1
// slot 25126
    25126, 64058,
// P20-P25.agc:3848
//			MY
// slot 25127
    25127, 3978,
// P20-P25.agc:3849
//		UNIT
// slot 25128
    25128, 65372,
// P20-P25.agc:3850
//		BOFF	VCOMP		# B0, COMP. IF CSM BEING CORRECTED
// slot 25129
    25129, 48664,
// P20-P25.agc:3851
//# Page 581
// P20-P25.agc:3852
//			VEHUPFLG
// slot 25130
    25130, 974,
// P20-P25.agc:3853
//			+1
// slot 25131
    25131, 46168,
// P20-P25.agc:3854
//		STOVL	BVECTOR
// slot 25132
    25132, 24234,
// P20-P25.agc:3855
//			ZEROVECS
// slot 25133
    25133, 6820,
// P20-P25.agc:3856
//		STORE	BVECTOR +6
// slot 25134
    25134, 3766,
// P20-P25.agc:3857
//		STODL	BVECTOR +12D
// slot 25135
    25135, 16066,
// P20-P25.agc:3858
//			RXZ
// slot 25136
    25136, 4004,
// P20-P25.agc:3859
//		SR*	SRR*		# SHIFT FROM KERBIN/MUN SPHERE TO B-25
// slot 25137
    25137, 44894,
// P20-P25.agc:3860
//			0 -2,1
// slot 25138
    25138, 17150,
// P20-P25.agc:3861
//			0,2
// slot 25139
    25139, 47356,
// P20-P25.agc:3862
//		STORE	BVECTOR +12D
// slot 25140
    25140, 3778,
// P20-P25.agc:3863
//		SLOAD
// slot 25141
    25141, 65466,
// P20-P25.agc:3864
//			SHAFTVAR
// slot 25142
    25142, 2066,
// P20-P25.agc:3865
//		DAD	DMP
// slot 25143
    25143, 34074,
// P20-P25.agc:3866
//			IMUVAR		# RAD**2 B12
// slot 25144
    25144, 13884,
// P20-P25.agc:3867
//			RXZ
// slot 25145
    25145, 4004,
// P20-P25.agc:3868
//		SRR*	DMP
// slot 25146
    25146, 34142,
// P20-P25.agc:3869
//			0,1		# SHIFT TO KERBIN/MUN SPHERE
// slot 25147
    25147, 18178,
// P20-P25.agc:3870
//			RXZ
// slot 25148
    25148, 4004,
// P20-P25.agc:3871
//		SR*	SR*
// slot 25149
    25149, 44894,
// P20-P25.agc:3872
//			0 -2,1
// slot 25150
    25150, 17150,
// P20-P25.agc:3873
//			0,2
// slot 25151
    25151, 48380,
// P20-P25.agc:3874
//		SR*	RTB
// slot 25152
    25152, 40030,
// P20-P25.agc:3875
//			0,2
// slot 25153
    25153, 48380,
// P20-P25.agc:3876
//			TPMODE		# STORE VARIANCE TRIPLE PRECISION
// slot 25154
    25154, 18230,
// P20-P25.agc:3877
//		STCALL	VARIANCE	# B-40
// slot 25155
    25155, 31630,
// P20-P25.agc:3878
//			LGCUPDTE
// slot 25156
    25156, 46594,
// P20-P25.agc:3879
//
// P20-P25.agc:3880
//		CALL
// slot 25157
    25157, 65320,
// P20-P25.agc:3881
//			GRP2PC
// slot 25158
    25158, 9544,
// P20-P25.agc:3882
//TRUNBQ		CALL
// slot 25159
    25159, 65320,
// P20-P25.agc:3883
//			RADARANG
// slot 25160
    25160, 46562,
// P20-P25.agc:3884
//		SSP	CALL		# STORE TRUNNION CODE (4) FOR R3 IN N49
// slot 25161
    25161, 38066,
// P20-P25.agc:3885
//			WHCHREAD
// slot 25162
    25162, 4044,
// P20-P25.agc:3886
//		DEC	4
// slot 25163
    25163, 8,
// P20-P25.agc:3887
//			GRP2PC
// slot 25164
    25164, 9544,
// P20-P25.agc:3888
//		VLOAD	VXV
// slot 25165
    25165, 40442,
// P20-P25.agc:3889
//			ULC
// slot 25166
    25166, 4008,
// P20-P25.agc:3890
//			MY
// slot 25167
    25167, 3978,
// P20-P25.agc:3891
//		VSL1	VXV
// slot 25168
    25168, 40436,
// P20-P25.agc:3892
//			ULC
// slot 25169
    25169, 4008,
// P20-P25.agc:3893
//		VSL1			# (ULC X MY) X ULC
// slot 25170
    25170, 65524,
// P20-P25.agc:3894
//		BOFF	VCOMP		# B0, COMP. IF CSM BEING CORRECTED
// slot 25171
    25171, 48664,
// P20-P25.agc:3895
//			VEHUPFLG
// slot 25172
    25172, 974,
// P20-P25.agc:3896
//			+1
// slot 25173
    25173, 46252,
// P20-P25.agc:3897
//		STOVL	BVECTOR
// slot 25174
    25174, 24234,
// P20-P25.agc:3898
//			ZEROVECS
// slot 25175
    25175, 6820,
// P20-P25.agc:3899
//		STORE	BVECTOR +6
// slot 25176
    25176, 3766,
// P20-P25.agc:3900
//		STODL	BVECTOR +12D
// slot 25177
    25177, 16066,
// P20-P25.agc:3901
//			RXZ
// slot 25178
    25178, 4004,
// P20-P25.agc:3902
//# Page 582
// P20-P25.agc:3903
//		SR*	SRR*		# SHIFT FROM KERBIN/MUN SPHERE TO B-25
// slot 25179
    25179, 44894,
// P20-P25.agc:3904
//			0 -2,1
// slot 25180
    25180, 17150,
// P20-P25.agc:3905
//			0,2
// slot 25181
    25181, 47356,
// P20-P25.agc:3906
//		STORE	BVECTOR +14D
// slot 25182
    25182, 3782,
// P20-P25.agc:3907
//		SLOAD
// slot 25183
    25183, 65466,
// P20-P25.agc:3908
//			TRUNVAR
// slot 25184
    25184, 2068,
// P20-P25.agc:3909
//		DAD	DMP
// slot 25185
    25185, 34074,
// P20-P25.agc:3910
//			IMUVAR
// slot 25186
    25186, 13884,
// P20-P25.agc:3911
//			RXZ
// slot 25187
    25187, 4004,
// P20-P25.agc:3912
//		SRR*	DMP
// slot 25188
    25188, 34142,
// P20-P25.agc:3913
//			0,1		# SHIFT TO KERBIN/MUN SPHERE
// slot 25189
    25189, 18178,
// P20-P25.agc:3914
//			RXZ
// slot 25190
    25190, 4004,
// P20-P25.agc:3915
//		SR*	SR*
// slot 25191
    25191, 44894,
// P20-P25.agc:3916
//			0 -2,1
// slot 25192
    25192, 17150,
// P20-P25.agc:3917
//			0,2
// slot 25193
    25193, 48380,
// P20-P25.agc:3918
//		SR*	RTB
// slot 25194
    25194, 40030,
// P20-P25.agc:3919
//			0,2
// slot 25195
    25195, 48380,
// P20-P25.agc:3920
//			TPMODE		# STORE VARIANCE TRIPLE PRECISION
// slot 25196
    25196, 18230,
// P20-P25.agc:3921
//		STODL	VARIANCE
// slot 25197
    25197, 15246,
// P20-P25.agc:3922
//			SINTHETA
// slot 25198
    25198, 4020,
// P20-P25.agc:3923
//		ASIN	BDSU		# SIN THETA IN PD6
// slot 25199
    25199, 37308,
// P20-P25.agc:3924
//			RRTRUN
// slot 25200
    25200, 4024,
// P20-P25.agc:3925
//		DMP	SL3R
// slot 25201
    25201, 47626,
// P20-P25.agc:3926
//			2PI/8
// slot 25202
    25202, 13890,
// P20-P25.agc:3927
//		PDDL	SL3
// slot 25203
    25203, 43690
)).

agcAotInstallSourceRope(list(
// P20-P25.agc:3928
//			X789 +2
// slot 25204
    25204, 1926,
// P20-P25.agc:3929
//		SRR*	BDSU		# SHIFT FROM -5/-3 TO B0
// slot 25205
    25205, 37214,
// P20-P25.agc:3930
//			0,2
// slot 25206
    25206, 47356,
// P20-P25.agc:3931
//		DMP	SRR*
// slot 25207
    25207, 44810,
// P20-P25.agc:3932
//			RXZ
// slot 25208
    25208, 4004,
// P20-P25.agc:3933
//			0,1
// slot 25209
    25209, 18178,
// P20-P25.agc:3934
//		STCALL	DELTAQ		# KERBIN B-29.  MUN B-27
// slot 25210
    25210, 32462,
// P20-P25.agc:3935
//			LGCUPDTE
// slot 25211
    25211, 46594,
// P20-P25.agc:3936
//		CALL
// slot 25212
    25212, 65320,
// P20-P25.agc:3937
//			GRP2PC
// slot 25213
    25213, 9544,
// P20-P25.agc:3938
//RENDEND		GOTO
// slot 25214
    25214, 65360,
// P20-P25.agc:3939
//			R22LEM93
// slot 25215
    25215, 41708,
// P20-P25.agc:3940
//
// P20-P25.agc:3941
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:3942
//#	LSR22.4 IS THE ENTRY TO PERFORM MUN SURFACE NAVIGATION FOR THE LM
// P20-P25.agc:3943
//#	COMPUTER ONLY.  THIS ROUTINE COMPUTES THE BE-VECTORS AND DELTA Q FOR RANGE
// P20-P25.agc:3944
//#	AND RANGE RATE MEASURED BY THE RENDEZVOUS RADAR
// P20-P25.agc:3945
//#
// P20-P25.agc:3946
//# SUBROUTINES CALLED:
// P20-P25.agc:3947
//#	INTSTALL	LGCUPDTE	INCORP1		RP-TO-R
// P20-P25.agc:3948
//#	INTEGRV		GETULC		INCORP2
// P20-P25.agc:3949
//#
// P20-P25.agc:3950
//# OUTPUT
// P20-P25.agc:3951
//#	CORRECTED CSM STATE VECTOR (PERMANENT)
// P20-P25.agc:3952
//#	NUMBER OF MARKS INCORPORATED IN MARKCTR
// P20-P25.agc:3953
//# Page 583
// P20-P25.agc:3954
//#	MAGNITUDE OF POSITION DEVIATION (FOR DISPLAY) IN R22 DISP METERS B-29
// P20-P25.agc:3955
//# 	MAGNITUDE OF VELOCITY DEVIATION (FOR DISPLAY) IN R22DISP +2 M/CSEC B-7
// P20-P25.agc:3956
//# 	UPDATED W-MATRIX
// P20-P25.agc:3957
//
// P20-P25.agc:3958
//# ERASABLE INITIALIZATION REQUIRED
// P20-P25.agc:3959
//#	LM AND CSM STATE VECTORS
// P20-P25.agc:3960
//#	W-MATRIX
// P20-P25.agc:3961
//#	MARK TIME IN MKTIME
// P20-P25.agc:3962
//#	RADAR RANGE IN RM METERS B-29
// P20-P25.agc:3963
//#	RANGE RATE IN RDOTM METERS/CSEC B-7
// P20-P25.agc:3964
//#	VEHUPFLG
// P20-P25.agc:3965
//
// P20-P25.agc:3966
//LSR22.4		CALL
// slot 25216
    25216, 65320,
// P20-P25.agc:3967
//			INTSTALL
// slot 25217
    25217, 24088,
// P20-P25.agc:3968
//		SET	CLEAR
// slot 25218
    25218, 35864,
// P20-P25.agc:3969
//			STATEFLG
// slot 25219
    25219, 1652,
// P20-P25.agc:3970
//			VINTFLAG	# CALL TO GET LM POS + VEL IN REF COORD.
// slot 25220
    25220, 1912,
// P20-P25.agc:3971
//		CALL
// slot 25221
    25221, 65320,
// P20-P25.agc:3972
//			INTGRCAL
// slot 25222
    25222, 46404,
// P20-P25.agc:3973
//		CALL
// slot 25223
    25223, 65320,
// P20-P25.agc:3974
//			GRP2PC
// slot 25224
    25224, 9544,
// P20-P25.agc:3975
//		CLEAR	CALL
// slot 25225
    25225, 37912,
// P20-P25.agc:3976
//			DMENFLG		# SET MATRIX SIZE TO 6X6 FOR INCORP
// slot 25226
    25226, 2924,
// P20-P25.agc:3977
//			INTSTALL
// slot 25227
    25227, 24088,
// P20-P25.agc:3978
//		DLOAD	BHIZ		# IS THIS FIRST TIME THROUGH
// slot 25228
    25228, 39114,
// P20-P25.agc:3979
//			MARKCTR
// slot 25229
    25229, 3686,
// P20-P25.agc:3980
//			INITWMX6	# YES, INITIALIZE 6X6 W-MATRIX
// slot 25230
    25230, 46386,
// P20-P25.agc:3981
//		CLEAR	SET
// slot 25231
    25231, 35864,
// P20-P25.agc:3982
//			D6OR9FLG
// slot 25232
    25232, 1914,
// P20-P25.agc:3983
//			DIM0FLAG
// slot 25233
    25233, 1660,
// P20-P25.agc:3984
//		SET	CLEAR
// slot 25234
    25234, 35864,
// P20-P25.agc:3985
//			VINTFLAG
// slot 25235
    25235, 1656,
// P20-P25.agc:3986
//			INTYPFLG
// slot 25236
    25236, 1910,
// P20-P25.agc:3987
//		CALL
// slot 25237
    25237, 65320,
// P20-P25.agc:3988
//			INTGRCAL
// slot 25238
    25238, 46404,
// P20-P25.agc:3989
//		GOTO
// slot 25239
    25239, 65360,
// P20-P25.agc:3990
//			RANGEBQ
// slot 25240
    25240, 45712,
// P20-P25.agc:3991
//
// P20-P25.agc:3992
//INITWMX6	CALL
// slot 25241
    25241, 65320,
// P20-P25.agc:3993
//			WLINIT		# INITIALIZE W-MATRIX
// slot 25242
    25242, 46418,
// P20-P25.agc:3994
//		SET	CALL
// slot 25243
    25243, 37912,
// P20-P25.agc:3995
//			VINTFLAG
// slot 25244
    25244, 1656,
// P20-P25.agc:3996
//			SETIFLGS
// slot 25245
    25245, 23368,
// P20-P25.agc:3997
//		CALL
// slot 25246
    25246, 65320,
// P20-P25.agc:3998
//			INTGRCAL
// slot 25247
    25247, 46404,
// P20-P25.agc:3999
//		GOTO
// slot 25248
    25248, 65360,
// P20-P25.agc:4000
//			RANGEBQ
// slot 25249
    25249, 45712,
// P20-P25.agc:4001
//
// P20-P25.agc:4002
//# THIS ROUTINE CLEARS RFINAL (DP) AND CALLS INTEGRV
// P20-P25.agc:4003
//# Page 584
// P20-P25.agc:4004
//INTGRCAL	STQ	DLOAD
// slot 25250
    25250, 58656,
// P20-P25.agc:4005
//			IGRET
// slot 25251
    25251, 3962,
// P20-P25.agc:4006
//			MKTIME
// slot 25252
    25252, 4058,
// P20-P25.agc:4007
//		STCALL	TDEC1
// slot 25253
    25253, 28738,
// P20-P25.agc:4008
//			INTEGRV
// slot 25254
    25254, 23736,
// P20-P25.agc:4009
//		GOTO
// slot 25255
    25255, 65360,
// P20-P25.agc:4010
//			IGRET
// slot 25256
    25256, 3962,
// P20-P25.agc:4011
//
// P20-P25.agc:4012
//# THIS ROUTINE INITIALIZES THE W-MATRIX BY ZEROING ALL W THEN SETTING
// P20-P25.agc:4013
//# DIAGONAL ELEMENTS TO INITIAL STORED VALUES.
// P20-P25.agc:4014
//
// P20-P25.agc:4015
//		EBANK=	W
// P20-P25.agc:4016
//WLINIT		EXIT
// slot 25257
    25257, 65532
)).

// bank 26, slots 25258-25263
function agcAotUnit1647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25260 {
        if slot <= 25258 {
// P20-P25.agc:4017
//		CAF	WBANK
// slot 25258
            if slot <> 25258 or instruction <> 14041 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1753), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25259 {
// P20-P25.agc:4018
//		TS	BBANK
// slot 25259
                if slot <> 25259 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4019
//		CAF	WSIZE
// slot 25260
                if slot <> 25260 or instruction <> 14111 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1823), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25261 {
// P20-P25.agc:4020
//		TS	W.IND
// slot 25261
            if slot <> 25261 or instruction <> 23215 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23215, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25262 {
// P20-P25.agc:4021
//		CAF	ZERO
// slot 25262
                if slot <> 25262 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4022
//		INDEX	W.IND
// slot 25263
                if slot <> 25263 or instruction <> 21167 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21167, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21167, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1647] to agcAotUnit1647@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4023
//		TS	W
// slot 25264
    25264, 46592
)).

// bank 26, slots 25265-25269
function agcAotUnit1648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25266 {
        if slot <= 25265 {
// P20-P25.agc:4024
//		CCS	W.IND
// slot 25265
            if slot <> 25265 or instruction <> 4783 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 687).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4025
//		TC	-5
// slot 25266
            if slot <> 25266 or instruction <> 1709 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1709, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25267 {
// P20-P25.agc:4026
//		CAF	AIGBANK		# RESTORE EBANK 7
// slot 25267
            if slot <> 25267 or instruction <> 14042 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1754), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25268 {
// P20-P25.agc:4027
//		TS	BBANK
// slot 25268
                if slot <> 25268 or instruction <> 22534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4028
//		TC	INTPRET
// slot 25269
                if slot <> 25269 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1648] to agcAotUnit1648@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4029
//		BON	SLOAD		# IF ON MUN SURFACE, INITIALIZE WITH
// slot 25270
    25270, 56600,
// P20-P25.agc:4030
//			SURFFLAG	# WSURFPOS AND WSURFVEL INSTEAD OF
// slot 25271
    25271, 4494,
// P20-P25.agc:4031
//			WLSRFPOS	# WRENDPOS AND WRENDVEL
// slot 25272
    25272, 46456,
// P20-P25.agc:4032
//			WRENDPOS
// slot 25273
    25273, 2050,
// P20-P25.agc:4033
//		GOTO
// slot 25274
    25274, 65360,
// P20-P25.agc:4034
//			WPOSTORE
// slot 25275
    25275, 46460,
// P20-P25.agc:4035
//WLSRFPOS	SLOAD
// slot 25276
    25276, 65466,
// P20-P25.agc:4036
//			WSURFPOS
// slot 25277
    25277, 2062,
// P20-P25.agc:4037
//WPOSTORE	SR			# SHIFT TO B-19 SCALE
// slot 25278
    25278, 65378,
// P20-P25.agc:4038
//			5
// slot 25279
    25279, 17164,
// P20-P25.agc:4039
//		STORE	W
// slot 25280
    25280, 2562,
// P20-P25.agc:4040
//		STORE	W +8D
// slot 25281
    25281, 2578,
// P20-P25.agc:4041
//		STORE	W +16D
// slot 25282
    25282, 2594,
// P20-P25.agc:4042
//		BON	SLOAD
// slot 25283
    25283, 56600,
// P20-P25.agc:4043
//			SURFFLAG
// slot 25284
    25284, 4494,
// P20-P25.agc:4044
//			WLSRFVEL
// slot 25285
    25285, 46482,
// P20-P25.agc:4045
//			WRENDVEL
// slot 25286
    25286, 2052,
// P20-P25.agc:4046
//		GOTO
// slot 25287
    25287, 65360,
// P20-P25.agc:4047
//			WVELSTOR
// slot 25288
    25288, 46486,
// P20-P25.agc:4048
//WLSRFVEL	SLOAD
// slot 25289
    25289, 65466,
// P20-P25.agc:4049
//			WSURFVEL
// slot 25290
    25290, 2064,
// P20-P25.agc:4050
//WVELSTOR	STORE	W +72D
// slot 25291
    25291, 2706,
// P20-P25.agc:4051
//		STORE	W +80D
// slot 25292
    25292, 2722,
// P20-P25.agc:4052
//		STORE	W +88D
// slot 25293
    25293, 2738,
// P20-P25.agc:4053
//		SLOAD
// slot 25294
    25294, 65466,
// P20-P25.agc:4054
//# Page 585
// P20-P25.agc:4055
//			WSHAFT
// slot 25295
    25295, 2054,
// P20-P25.agc:4056
//		STORE	W +144D
// slot 25296
    25296, 2850,
// P20-P25.agc:4057
//		SLOAD
// slot 25297
    25297, 65466,
// P20-P25.agc:4058
//			WTRUN
// slot 25298
    25298, 2056,
// P20-P25.agc:4059
//		STORE	W +152D
// slot 25299
    25299, 2866,
// P20-P25.agc:4060
//		SET	SSP		# SET RENDWFLG -- W-MATRIX VALID
// slot 25300
    25300, 55576,
// P20-P25.agc:4061
//			RENDWFLG
// slot 25301
    25301, 2684,
// P20-P25.agc:4062
//			MARKCTR		# SET MARK COUNTER EQUAL ZERO
// slot 25302
    25302, 3686,
// P20-P25.agc:4063
//			0
// slot 25303
    25303, 0,
// P20-P25.agc:4064
//		RVQ
// slot 25304
    25304, 65308,
// P20-P25.agc:4065
//
// P20-P25.agc:4066
//		EBANK=	W
// P20-P25.agc:4067
//WBANK		BBCON	WLINIT
// slot 25305
    25305, 45162,
// P20-P25.agc:4068
//		EBANK=	AIG
// P20-P25.agc:4069
//AIGBANK		BBCON	LSR22.3
// slot 25306
    25306, 45166,
// P20-P25.agc:4070
//
// P20-P25.agc:4071
//# GETULC
// P20-P25.agc:4072
//#
// P20-P25.agc:4073
//# THIS SUBROUTINE COMPUTES THE RELATIVE POSITION VECTOR BETWEEN THE CSM
// P20-P25.agc:4074
//# AND THE LM, LEAVING THE UNIT VECTOR IN THE PUSHLIST AND MPAC AND THE
// P20-P25.agc:4075
//# MAGNITUDE IN 36D.
// P20-P25.agc:4076
//
// P20-P25.agc:4077
//GETULC		SETPD	VLOAD
// slot 25307
    25307, 64770,
// P20-P25.agc:4078
//			0
// slot 25308
    25308, 2,
// P20-P25.agc:4079
//			DELTALEM
// slot 25309
    25309, 1866,
// P20-P25.agc:4080
//		LXA,2
// slot 25310
    25310, 65496,
// P20-P25.agc:4081
//			SCALSHFT	# LOAD X2 WITH SCALE SHIFT
// slot 25311
    25311, 4000,
// P20-P25.agc:4082
//		VSR*	VAD
// slot 25312
    25312, 44382,
// P20-P25.agc:4083
//			9D,2		# SHIFT FOR KERBIN/MUN SPHERE
// slot 25313
    25313, 48362,
// P20-P25.agc:4084
//			RCVLEM
// slot 25314
    25314, 1890,
// P20-P25.agc:4085
//		PDVL	VSR*
// slot 25315
    25315, 44954,
// P20-P25.agc:4086
//			DELTACSM
// slot 25316
    25316, 1782,
// P20-P25.agc:4087
//			9D,2		# SHIFT FOR KERBIN/MUN SPHERE
// slot 25317
    25317, 48362,
// P20-P25.agc:4088
//		VAD	VSU
// slot 25318
    25318, 43354,
// P20-P25.agc:4089
//			RCVCSM
// slot 25319
    25319, 1806,
// P20-P25.agc:4090
//		RTB	PUSH		# USE NORMUNIT TO PRESERVE ACCURACY
// slot 25320
    25320, 34360,
// P20-P25.agc:4091
//			NORMUNX1
// slot 25321
    25321, 18344,
// P20-P25.agc:4092
//		STODL	ULC
// slot 25322
    25322, 16296,
// P20-P25.agc:4093
//			36D
// slot 25323
    25323, 74,
// P20-P25.agc:4094
//		SL*			# ADJUST MAGNITUDE FROM NORMUNIT
// slot 25324
    25324, 65374,
// P20-P25.agc:4095
//			0,1
// slot 25325
    25325, 16642,
// P20-P25.agc:4096
//		STOVL	36D		# ULC IN PD0 AND MPAC,RLC IN 36D
// slot 25326
    25326, 20554,
// P20-P25.agc:4097
//			ULC
// slot 25327
    25327, 4008,
// P20-P25.agc:4098
//		RVQ
// slot 25328
    25328, 65308,
// P20-P25.agc:4099
//
// P20-P25.agc:4100
//# RADARANG
// P20-P25.agc:4101
//#
// P20-P25.agc:4102
//# THIS SUBROUTINE COMPUTS SINTHETA = -ULC DOT MY
// P20-P25.agc:4103
//# RXZ = (SQRT (1-SINTHETA**2))RLC
// P20-P25.agc:4104
//# OUTPUT
// P20-P25.agc:4105
//#	ULC IN ULC, PD0
// P20-P25.agc:4106
//# Page 586
// P20-P25.agc:4107
//#	RLC IN PD36D
// P20-P25.agc:4108
//#	SIN THETA IN SINTHETA AND PD6
// P20-P25.agc:4109
//#	RXZ NORM IN RXZ (N IN X1)
// P20-P25.agc:4110
//
// P20-P25.agc:4111
//RADARANG	STQ	CALL
// slot 25329
    25329, 37920,
// P20-P25.agc:4112
//			RDRET
// slot 25330
    25330, 3962,
// P20-P25.agc:4113
//			GETULC
// slot 25331
    25331, 46518,
// P20-P25.agc:4114
//		VCOMP	DOT
// slot 25332
    25332, 41340,
// P20-P25.agc:4115
//			MY
// slot 25333
    25333, 3978,
// P20-P25.agc:4116
//		SL1R	PUSH		# SIN THETA TO PD6
// slot 25334
    25334, 34548,
// P20-P25.agc:4117
//		STORE	SINTHETA
// slot 25335
    25335, 4020,
// P20-P25.agc:4118
//		DSQ	BDSU
// slot 25336
    25336, 37276,
// P20-P25.agc:4119
//			DP1/4TH		# 1-(SIN THETA)**2
// slot 25337
    25337, 6804,
// P20-P25.agc:4120
//		SQRT	DMP
// slot 25338
    25338, 34284,
// P20-P25.agc:4121
//			36D
// slot 25339
    25339, 74,
// P20-P25.agc:4122
//		SL1	NORM
// slot 25340
    25340, 49620,
// P20-P25.agc:4123
//			X1		# SET SHIFT COUNTER IN X1
// slot 25341
    25341, 78,
// P20-P25.agc:4124
//		STORE	RXZ
// slot 25342
    25342, 4004,
// P20-P25.agc:4125
//		GOTO			# EXIT
// slot 25343
    25343, 65360,
// P20-P25.agc:4126
//			RDRET
// slot 25344
    25344, 3962,
// P20-P25.agc:4127
//LGCUPDTE	STQ	CALL
// slot 25345
    25345, 37920,
// P20-P25.agc:4128
//			LGRET
// slot 25346
    25346, 3962,
// P20-P25.agc:4129
//			INCORP1
// slot 25347
    25347, 39602,
// P20-P25.agc:4130
//		VLOAD	ABVAL
// slot 25348
    25348, 42746,
// P20-P25.agc:4131
//			DELTAX +6
// slot 25349
    25349, 2934,
// P20-P25.agc:4132
//		LXA,2	SRR*
// slot 25350
    25350, 45016,
// P20-P25.agc:4133
//			SCALSHFT	# 0 -- MUN.  2 -- KERBIN
// slot 25351
    25351, 4000,
// P20-P25.agc:4134
//			2,2		# SET VEL DISPLAY TO B-7
// slot 25352
    25352, 47352,
// P20-P25.agc:4135
//		STOVL	R22DISP +2
// slot 25353
    25353, 20894,
// P20-P25.agc:4136
//			DELTAX
// slot 25354
    25354, 2922,
// P20-P25.agc:4137
//		ABVAL	SRR*
// slot 25355
    25355, 44876,
// P20-P25.agc:4138
//			2,2		# SET POS DISPLAY TO B-29
// slot 25356
    25356, 47352,
// P20-P25.agc:4139
//		STORE	R22DISP
// slot 25357
    25357, 410,
// P20-P25.agc:4140
//		SLOAD	SR
// slot 25358
    25358, 45498,
// P20-P25.agc:4141
//			RMAX
// slot 25359
    25359, 2058,
// P20-P25.agc:4142
//			10D
// slot 25360
    25360, 17174,
// P20-P25.agc:4143
//		DSU	BMN
// slot 25361
    25361, 41002,
// P20-P25.agc:4144
//			R22DISP
// slot 25362
    25362, 410,
// P20-P25.agc:4145
//			R22LEM96	# GO DISPLAY
// slot 25363
    25363, 41716,
// P20-P25.agc:4146
//		SLOAD	DSU
// slot 25364
    25364, 38330,
// P20-P25.agc:4147
//			VMAX
// slot 25365
    25365, 2060,
// P20-P25.agc:4148
//			R22DISP +2	# VMAX MINUS VEL. DEVIATION
// slot 25366
    25366, 414,
// P20-P25.agc:4149
//		BMN
// slot 25367
    25367, 65344,
// P20-P25.agc:4150
//			R22LEM96	# GO DISPLAY
// slot 25368
    25368, 41716,
// P20-P25.agc:4151
//ASTOK		CALL
// slot 25369
    25369, 65320,
// P20-P25.agc:4152
//			INCORP2
// slot 25370
    25370, 39878,
// P20-P25.agc:4153
//		GOTO
// slot 25371
    25371, 65360,
// P20-P25.agc:4154
//			LGRET
// slot 25372
    25372, 3962,
// P20-P25.agc:4155
//IMUVAR		2DEC	E-6 B12		# RAD**2
// slot 25373 25374
    25373, 134, 25374, 3568,
// P20-P25.agc:4156
//
// P20-P25.agc:4157
//WSIZE		DEC	161
// slot 25375
    25375, 322
)).

agcAotInstallSourceRope(list(
// P20-P25.agc:4158
//# Page 587
// P20-P25.agc:4159
//2PI/8		2DEC	3.141592653 B-2
// slot 25376 25377
    25376, 25734, 25377, 31572
)).

// bank 26, slots 25378-25389
function agcAotUnit1649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25383 {
        if slot <= 25380 {
            if slot <= 25378 {
// P20-P25.agc:4160
//
// P20-P25.agc:4161
//		EBANK=	LOSCOUNT
// P20-P25.agc:4162
//# Page 588
// P20-P25.agc:4163
//
// P20-P25.agc:4164
//# PROGRAM NAME LRS24.1		RR SEARCH ROUTINE
// P20-P25.agc:4165
//# MCD NO. 0			BY VOLANTE KERMAN, SDC		DATE 1-15-67
// P20-P25.agc:4166
//#
// P20-P25.agc:4167
//# FUNCTIONAL DESCRIPTION
// P20-P25.agc:4168
//#
// P20-P25.agc:4169
//# DRIVES THE RENDEZVOUS RADAR IN A HEXAGONAL SEARCH PATTERN ABOUT THE LOS TO THE CSM (COMPUTED FROM THE CSM AND LM
// P20-P25.agc:4170
//# STATE VECTORS) CHECKING FOR THE DATA GOOD DISCRETE AND MONITORING THE ANGLE BETWEEN THE RADAR BORESIGHT AND THE
// P20-P25.agc:4171
//# LM +Z AXIS.  IF THIS ANGLE EXCEEDS 30 DEGREES THE PREFERRED TRACKING ATTITUDE ROUTINE IS CALLED TO PERFORM AN
// P20-P25.agc:4172
//# ATTITUDE MANEUVER.
// P20-P25.agc:4173
//#
// P20-P25.agc:4174
//# CALLING SEQUENCE -- BANKCALL FOR LRS24.1
// P20-P25.agc:4175
//#
// P20-P25.agc:4176
//# SUBROUTINES CALLED
// P20-P25.agc:4177
//#
// P20-P25.agc:4178
//#	LEMCONIC	R61LEM
// P20-P25.agc:4179
//#	CSMCONIC	RRDESSM
// P20-P25.agc:4180
//#	JOBDELAY	FLAGDOWN
// P20-P25.agc:4181
//#	WAITLIST	FLAGUP
// P20-P25.agc:4182
//#	RRNB		BANKCALL
// P20-P25.agc:4183
//#
// P20-P25.agc:4184
//# EXIT -- TO ENDOFJOB WHEN THE SEARCH FLAG (SRCHOPT) IS NOT SET
// P20-P25.agc:4185
//#
// P20-P25.agc:4186
//# OUTPUT
// P20-P25.agc:4187
//#
// P20-P25.agc:4188
//#	DATAGOOD (SP) -- FOR DISPLAY IN R1 --	00000 INDICATES NO LOCKON
// P20-P25.agc:4189
//#						11111 INDICATES LOCKON ACHIEVED
// P20-P25.agc:4190
//#	OMEGAD (SP)   -- FOR DISPLAY IN R2 --	ANGLE BETWEEN RR BORESIGNT VECTOR AND THE SPACECRAFT +Z AXIS
// P20-P25.agc:4191
//#
// P20-P25.agc:4192
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:4193
//#
// P20-P25.agc:4194
//#	SEARCH FLAG MUST BE SET
// P20-P25.agc:4195
//#	LM AND CSM STATE VECTORS AND REFSMMAT MATRIX
// P20-P25.agc:4196
//#
// P20-P25.agc:4197
//# DEBRIS
// P20-P25.agc:4198
//#
// P20-P25.agc:4199
//#	RLMSRCH		UXVECT
// P20-P25.agc:4200
//#	VXRLM		UYVECT
// P20-P25.agc:4201
//#	LOSDESRD	NSRCHPNT
// P20-P25.agc:4202
//#	DATAGOOD	OMEGAD
// P20-P25.agc:4203
//#	MPAC		PUSHLIST
// P20-P25.agc:4204
//
// P20-P25.agc:4205
//		COUNT*	$$/LRS24
// P20-P25.agc:4206
//LRS24.1		CAF	ZERO
// slot 25378
                if slot <> 25378 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25379 {
// P20-P25.agc:4207
//		TS	NSRCHPNT	# SET SEARCH PATTERN POINT COUNTER TO ZERO
// slot 25379
                    if slot <> 25379 or instruction <> 23518 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23518, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4208
//CHKSRCH		CAF	BIT14		# ISSUE AUTO TRACK ENABLE TO RADAR
// slot 25380
                    if slot <> 25380 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25381 {
// P20-P25.agc:4209
//		EXTEND
// slot 25381
                if slot <> 25381 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25382 {
// P20-P25.agc:4210
//# Page 589
// P20-P25.agc:4211
//		WOR	CHAN12
// slot 25382
                    if slot <> 25382 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4212
//		CAF	SRCHOBIT	# CHECK IF SEARCH STILL REQUESTED
// slot 25383
                    if slot <> 25383 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25386 {
            if slot <= 25384 {
// P20-P25.agc:4213
//		MASK	FLAGWRD2	# (SRCHOPT FLAG SET)
// slot 25384
                if slot <> 25384 or instruction <> 28734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25385 {
// P20-P25.agc:4214
//		EXTEND
// slot 25385
                    if slot <> 25385 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4215
//		BZF	ENDOFJOB	# NO-TERMINATE JOB
// slot 25386
                    if slot <> 25386 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25387 {
// P20-P25.agc:4216
//
// P20-P25.agc:4217
//		CAF	6SECONDS	# SCHEDULE TASK TO DRIVE RADAR TO NEXT PT.
// slot 25387
                if slot <> 25387 or instruction <> 14283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1995), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25388 {
// P20-P25.agc:4218
//		INHINT
// slot 25388
                    if slot <> 25388 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4219
//		TC	WAITLIST	# IN 6 SECONDS
// slot 25389
                    if slot <> 25389 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1649] to agcAotUnit1649@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4220
//		EBANK=	LOSCOUNT
// P20-P25.agc:4221
//		2CADR	CALLDGCH
// slot 25390 25391
    25390, 3910, 25391, 45166
)).

// bank 26, slots 25392-25397
function agcAotUnit1650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25394 {
        if slot <= 25392 {
// P20-P25.agc:4222
//
// P20-P25.agc:4223
//		RELINT
// slot 25392
            if slot <> 25392 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25393 {
// P20-P25.agc:4224
//		CS	RADMODES	# IS REMODE IN PROGRESS
// slot 25393
                if slot <> 25393 or instruction <> 16456 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 72).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4225
//		MASK	REMODBIT
// slot 25394
                if slot <> 25394 or instruction <> 31198 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    if fixedOperand = 8192 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25395 {
// P20-P25.agc:4226
//		EXTEND
// slot 25395
            if slot <> 25395 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25396 {
// P20-P25.agc:4227
//		BZF	ENDOFJOB	# YES -- WAIT SIX SECONDS
// slot 25396
                if slot <> 25396 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4228
//		TC	INTPRET
// slot 25397
                if slot <> 25397 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1650] to agcAotUnit1650@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4229
//
// P20-P25.agc:4230
//		RTB	DAD		# COMPUTE LOS AT PRESENT TIME + 1.5 SEC.
// slot 25398
    25398, 36152,
// P20-P25.agc:4231
//			LOADTIME
// slot 25399
    25399, 18166,
// P20-P25.agc:4232
//			1.5SECS
// slot 25400
    25400, 14234,
// P20-P25.agc:4233
//LRS24.11	STCALL	TDEC1
// slot 25401
    25401, 28738,
// P20-P25.agc:4234
//			LEMCONIC	# EXTRAPOLATE LM STATE VECTOR
// slot 25402
    25402, 23680,
// P20-P25.agc:4235
//		VLOAD
// slot 25403
    25403, 65530,
// P20-P25.agc:4236
//			RATT
// slot 25404
    25404, 2,
// P20-P25.agc:4237
//		STOVL	RLMSRCH		# SAVE LEM POSITION
// slot 25405
    25405, 24444,
// P20-P25.agc:4238
//			VATT
// slot 25406
    25406, 14,
// P20-P25.agc:4239
//		STODL	SAVLEMV		# SAVE LEM VELOCITY
// slot 25407
    25407, 16320,
// P20-P25.agc:4240
//			TAT
// slot 25408
    25408, 26,
// P20-P25.agc:4241
//		STCALL	TDEC1		# EXTRAPOLATE CSM STATE VECTOR
// slot 25409
    25409, 28738,
// P20-P25.agc:4242
//			CSMCONIC	# EXTRAPOLATE CSM STATE VECTOR
// slot 25410
    25410, 23660,
// P20-P25.agc:4243
//		VLOAD	VSU		# LOS VECTOR = R(CSM) - R(LM)
// slot 25411
    25411, 43514,
// P20-P25.agc:4244
//			RATT
// slot 25412
    25412, 2,
// P20-P25.agc:4245
//			RLMSRCH
// slot 25413
    25413, 3964,
// P20-P25.agc:4246
//		UNIT
// slot 25414
    25414, 65372,
// P20-P25.agc:4247
//		STOVL	LOSDESRD	# STORE DESIRED LOS
// slot 25415
    25415, 24468,
// P20-P25.agc:4248
//			VATT		# COMPUTE UNIT(V(CM) CROSS R(CM))
// slot 25416
    25416, 14,
// P20-P25.agc:4249
//		UNIT	VXV
// slot 25417
    25417, 40284,
// P20-P25.agc:4250
//			RATT
// slot 25418
    25418, 2,
// P20-P25.agc:4251
//		UNIT
// slot 25419
    25419, 65372,
// P20-P25.agc:4252
//		STORE	VXRCM
// slot 25420
    25420, 3976,
// P20-P25.agc:4253
//		VLOAD	VSU
// slot 25421
    25421, 43514,
// P20-P25.agc:4254
//			VATT
// slot 25422
    25422, 14,
// P20-P25.agc:4255
//			SAVLEMV
// slot 25423
    25423, 4032,
// P20-P25.agc:4256
//		MXV	VSL1		# CONVERT FROM REFERENCE TO STABLE MEMBER
// slot 25424
    25424, 64162,
// P20-P25.agc:4257
//			REFSMMAT
// slot 25425
    25425, 1976,
// P20-P25.agc:4258
//		STORE	SAVLEMV		# VLC = V(CSM) - V(LM)
// slot 25426
    25426, 4032,
// P20-P25.agc:4259
//		SLOAD	BZE		# CHECK IF N=0
// slot 25427
    25427, 44218,
// P20-P25.agc:4260
//# Page 590
// P20-P25.agc:4261
//			NSRCHPNT
// slot 25428
    25428, 4030,
// P20-P25.agc:4262
//			DESGLOS		# YES -- DESIGNATE ALONG LOS
// slot 25429
    25429, 46908,
// P20-P25.agc:4263
//		DSU	BZE		# IS N=1
// slot 25430
    25430, 44074,
// P20-P25.agc:4264
//			ONEOCT		# YES -- CALCULATE X AND Y AXES OF
// slot 25431
    25431, 14226,
// P20-P25.agc:4265
//			CALCXY		# SEARCH PATTERN COORDINATE SYSTEM
// slot 25432
    25432, 46886,
// P20-P25.agc:4266
//		VLOAD			# NO -- ROTATE X-Y AXES TO NEXT SEARCH POINT
// slot 25433
    25433, 65530,
// P20-P25.agc:4267
//			UXVECT
// slot 25434
    25434, 4000,
// P20-P25.agc:4268
//		STOVL	UXVECTPR	# SAVE ORIGINAL X AND Y VECTORS
// slot 25435
    25435, 20506,
// P20-P25.agc:4269
//			UYVECT		# UXPRIME = ORIGINAL UX
// slot 25436
    25436, 4012,
// P20-P25.agc:4270
//		STORE	UYVECTPR	# UYPRIME = ORIGINAL UY
// slot 25437
    25437, 38,
// P20-P25.agc:4271
//		VXSC
// slot 25438
    25438, 65506,
// P20-P25.agc:4272
//			SIN60DEG	# UX = (COS 60)UXPR + (SIN 60)UYPR
// slot 25439
    25439, 14218,
// P20-P25.agc:4273
//		STOVL	UXVECT
// slot 25440
    25440, 24480,
// P20-P25.agc:4274
//			UXVECTPR
// slot 25441
    25441, 26,
// P20-P25.agc:4275
//		VXSC	VAD
// slot 25442
    25442, 44514,
// P20-P25.agc:4276
//			COS60DEG
// slot 25443
    25443, 6816,
// P20-P25.agc:4277
//			UXVECT
// slot 25444
    25444, 4000,
// P20-P25.agc:4278
//		UNIT
// slot 25445
    25445, 65372,
// P20-P25.agc:4279
//		STOVL	UXVECT
// slot 25446
    25446, 24480,
// P20-P25.agc:4280
//			UXVECTPR	# UY = (-SIN 60)UXPR + (COS 60)UYPR
// slot 25447
    25447, 26,
// P20-P25.agc:4281
//		VXSC
// slot 25448
    25448, 65506,
// P20-P25.agc:4282
//			SIN60DEG
// slot 25449
    25449, 14218,
// P20-P25.agc:4283
//		STOVL	UYVECT
// slot 25450
    25450, 24492,
// P20-P25.agc:4284
//			UYVECTPR
// slot 25451
    25451, 38,
// P20-P25.agc:4285
//		VXSC	VSU
// slot 25452
    25452, 43490,
// P20-P25.agc:4286
//			COS60DEG
// slot 25453
    25453, 6816,
// P20-P25.agc:4287
//			UYVECT
// slot 25454
    25454, 4012,
// P20-P25.agc:4288
//		UNIT
// slot 25455
    25455, 65372,
// P20-P25.agc:4289
//		STORE	UYVECT
// slot 25456
    25456, 4012,
// P20-P25.agc:4290
//OFFCALC		VXSC	VAD		# OFFSET VECTOR = K(UY)
// slot 25457
    25457, 44514,
// P20-P25.agc:4291
//			OFFSTFAC	# LOS VECTOR + OFFSET VECTOR DEFINES
// slot 25458
    25458, 14222,
// P20-P25.agc:4292
//			LOSDESRD	# DESIRED POINT IN SEARCH PATTERN
// slot 25459
    25459, 3988,
// P20-P25.agc:4293
//		UNIT	MXV
// slot 25460
    25460, 53596,
// P20-P25.agc:4294
//			REFSMMAT	# CONVERT TO STABLE MEMBER COORDINATES
// slot 25461
    25461, 1976,
// P20-P25.agc:4295
//		VSL1
// slot 25462
    25462, 65524,
// P20-P25.agc:4296
//CONTDESG	STOVL	RRTARGET
// slot 25463
    25463, 21636,
// P20-P25.agc:4297
//			SAVLEMV
// slot 25464
    25464, 4032,
// P20-P25.agc:4298
//		STORE	LOSVEL
// slot 25465
    25465, 2018,
// P20-P25.agc:4299
//		EXIT
// slot 25466
    25466, 65532
)).

// bank 26, slots 25467-25468
function agcAotUnit1651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25467 {
// P20-P25.agc:4300
//		INHINT
// slot 25467
        if slot <> 25467 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4301
//		TC	KILLTASK	# KILL ANY PRESENTLY WAITLISTED TASK
// slot 25468
        if slot <> 25468 or instruction <> 3095 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3095, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1651] to agcAotUnit1651@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4302
//		CADR	DESLOOP +2	# WHICH WOULD DESIGNATE TO THE LAST
// slot 25469
    25469, 43780
)).

// bank 26, slots 25470-25474
function agcAotUnit1652 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25471 {
        if slot <= 25470 {
// P20-P25.agc:4303
//					# POINT IN THE PATTERN
// P20-P25.agc:4304
//CONTDES2	CS	CDESBIT
// slot 25470
            if slot <> 25470 or instruction <> 18909 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4305
//		MASK	RADMODES	# SET BIT 15 OF RADMODES TO INDICATE
// slot 25471
            if slot <> 25471 or instruction <> 28744 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 72).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 25472 {
// P20-P25.agc:4306
//		AD	CDESBIT		# A CONTINUOUS DESIGNATE WANTED.
// slot 25472
            if slot <> 25472 or instruction <> 27101 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25473 {
// P20-P25.agc:4307
//		TS	RADMODES
// slot 25473
                if slot <> 25473 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4308
//		TC	INTPRET
// slot 25474
                if slot <> 25474 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1652] to agcAotUnit1652@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4309
//
// P20-P25.agc:4310
//		CALL
// slot 25475
    25475, 65320,
// P20-P25.agc:4311
//# Page 591
// P20-P25.agc:4312
//			RRDESSM		# DESIGNATE RADAR TO RRTARGET VECTOR
// slot 25476
    25476, 43510,
// P20-P25.agc:4313
//
// P20-P25.agc:4314
//		EXIT
// slot 25477
    25477, 65532
)).

// bank 26, slots 25478-25483
function agcAotUnit1653 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25480 {
        if slot <= 25478 {
// P20-P25.agc:4315
//		TC	LIMALARM	# LOS NOT IN MODE 2 COVERAGE (P22)
// slot 25478
            if slot <> 25478 or instruction <> 1981 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1981, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25479 {
// P20-P25.agc:4316
//		TC	LIMALARM	# VEHICLE MANEUVER REQUIRED (P20)
// slot 25479
                if slot <> 25479 or instruction <> 1981 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1981, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4317
//
// P20-P25.agc:4318
//					# COMPUTE OMEGA,ANGLE BETWEEN RR LOS AND
// P20-P25.agc:4319
//					# SPACECRAFT +Z AXIS
// P20-P25.agc:4320
//OMEGCALC	EXTEND
// slot 25480
                if slot <> 25480 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25481 {
// P20-P25.agc:4321
//		DCA	CDUT
// slot 25481
            if slot <> 25481 or instruction <> 12318 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25482 {
// P20-P25.agc:4322
//		DXCH	TANGNB
// slot 25482
                if slot <> 25482 or instruction <> 22507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1003, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4323
//		TC	INTPRET
// slot 25483
                if slot <> 25483 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1653] to agcAotUnit1653@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4324
//		CALL
// slot 25484
    25484, 65320,
// P20-P25.agc:4325
//			RRNB
// slot 25485
    25485, 38978,
// P20-P25.agc:4326
//		DLOAD	ACOS		# OMEGA IS ARCCOSINE OF Z-COMPONENT OF
// slot 25486
    25486, 54986,
// P20-P25.agc:4327
//			36D		# VECTOR COMPUTED BY RRNB (LEFT AT 32D)
// slot 25487
    25487, 74,
// P20-P25.agc:4328
//		STORE	OMEGDISP	# STORE FOR DISPLAY IN R2
// slot 25488
    25488, 4026,
// P20-P25.agc:4329
//		EXIT
// slot 25489
    25489, 65532
)).

// bank 26, slots 25490-25490
function agcAotUnit1654 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4330
//		TC	ENDOFJOB
// slot 25490
    if slot <> 25490 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1654] to agcAotUnit1654@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4331
//# Page 592
// P20-P25.agc:4332
//# CALCULATE X AND Y VECTORS FOR SEARCH PATTERN COORDINATE SYSTEM.
// P20-P25.agc:4333
//
// P20-P25.agc:4334
//CALCXY		VLOAD	VXV
// slot 25491
    25491, 40442,
// P20-P25.agc:4335
//			VXRCM
// slot 25492
    25492, 3976,
// P20-P25.agc:4336
//			LOSDESRD
// slot 25493
    25493, 3988,
// P20-P25.agc:4337
//		UNIT
// slot 25494
    25494, 65372,
// P20-P25.agc:4338
//		STOVL	UXVECT		# UX = (VLM X RLM) X LOS
// slot 25495
    25495, 24480,
// P20-P25.agc:4339
//			LOSDESRD
// slot 25496
    25496, 3988,
// P20-P25.agc:4340
//		VXV	UNIT
// slot 25497
    25497, 44602,
// P20-P25.agc:4341
//			UXVECT
// slot 25498
    25498, 4000,
// P20-P25.agc:4342
//		STORE	UYVECT		# UY = LOS X UX
// slot 25499
    25499, 4012,
// P20-P25.agc:4343
//		GOTO
// slot 25500
    25500, 65360,
// P20-P25.agc:4344
//			OFFCALC
// slot 25501
    25501, 46818,
// P20-P25.agc:4345
//
// P20-P25.agc:4346
//DESGLOS		VLOAD	MXV		# WHEN N= 0,DESIGNATE ALONG LOS
// slot 25502
    25502, 53754,
// P20-P25.agc:4347
//			LOSDESRD
// slot 25503
    25503, 3988,
// P20-P25.agc:4348
//			REFSMMAT	# CONVERT LOS FROM REFERENCE TO SM COORDS
// slot 25504
    25504, 1976,
// P20-P25.agc:4349
//		VSL1	GOTO
// slot 25505
    25505, 43252,
// P20-P25.agc:4350
//			CONTDESG
// slot 25506
    25506, 46830
)).

// bank 26, slots 25507-25512
function agcAotUnit1655 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25509 {
        if slot <= 25507 {
// P20-P25.agc:4351
//
// P20-P25.agc:4352
//CALLDGCH	CAE	FLAGWRD0	# IS RENDEZVOUS FLAG SET
// slot 25507
            if slot <> 25507 or instruction <> 12348 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 60).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25508 {
// P20-P25.agc:4353
//		MASK	RNDVZBIT
// slot 25508
                if slot <> 25508 or instruction <> 31205 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    if fixedOperand = 64 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4354
//		EXTEND
// slot 25509
                if slot <> 25509 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25510 {
// P20-P25.agc:4355
//		BZF	TASKOVER	# NO -- EXIT R24
// slot 25510
            if slot <> 25510 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25511 {
// P20-P25.agc:4356
//		CAF	PRIO25		# YES -- SCHEDULE JOB TO DRIVE RADAR TO NEXT
// slot 25511
                if slot <> 25511 or instruction <> 16331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4043), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4357
//		TC	FINDVAC		# PONT IN SEARCH PATTERN
// slot 25512
                if slot <> 25512 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1655] to agcAotUnit1655@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4358
//		EBANK=	RLMSRCH
// P20-P25.agc:4359
//		2CADR	DATGDCHK
// slot 25513 25514
    25513, 3928, 25514, 45166
)).

// bank 26, slots 25515-25530
function agcAotUnit1656 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25522 {
        if slot <= 25518 {
            if slot <= 25516 {
                if slot <= 25515 {
// P20-P25.agc:4360
//
// P20-P25.agc:4361
//		TC	TASKOVER
// slot 25515
                    if slot <> 25515 or instruction <> 2737 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2737, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4362
//
// P20-P25.agc:4363
//DATGDCHK	CAF	BIT4
// slot 25516
                    if slot <> 25516 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25517 {
// P20-P25.agc:4364
//		EXTEND			# CHECK IF DATA GOOD DISCRETE PRESENT
// slot 25517
                    if slot <> 25517 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4365
//		RAND	CHAN33
// slot 25518
                    if slot <> 25518 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25520 {
                if slot <= 25519 {
// P20-P25.agc:4366
//		EXTEND
// slot 25519
                    if slot <> 25519 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4367
//		BZF	STORE1S		# YES -- GO TO STORE 11111 FOR DISPLAY IN R1
// slot 25520
                    if slot <> 25520 or instruction <> 6071 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6071, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25521 {
// P20-P25.agc:4368
//		CS	SIX
// slot 25521
                    if slot <> 25521 or instruction <> 19618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4369
//		AD	NSRCHPNT	# IS N GREATER THAN 6
// slot 25522
                    if slot <> 25522 or instruction <> 25566 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 990).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25526 {
            if slot <= 25524 {
                if slot <= 25523 {
// P20-P25.agc:4370
//		EXTEND
// slot 25523
                    if slot <> 25523 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4371
//		BZF	LRS24.1		# YES -- RESET N = 0 AND START AROUND AGAIN
// slot 25524
                    if slot <> 25524 or instruction <> 5922 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5922, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25525 {
// P20-P25.agc:4372
//		INCR	NSRCHPNT	# NO -- SET N = N+1 AND GO TO
// slot 25525
                    if slot <> 25525 or instruction <> 11230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 990).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4373
//		TCF	CHKSRCH		# NEXT POINT IN PATTERN
// slot 25526
                    if slot <> 25526 or instruction <> 5924 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5924, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25528 {
                if slot <= 25527 {
// P20-P25.agc:4374
//
// P20-P25.agc:4375
//STORE1S		CAF	ALL1S		# STORE 11111 FOR DISPLAY IN R1
// slot 25527
                    if slot <> 25527 or instruction <> 14275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1987), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4376
//		TS	DATAGOOD
// slot 25528
                    if slot <> 25528 or instruction <> 23515 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23515, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25529 {
// P20-P25.agc:4377
//# Page 593
// P20-P25.agc:4378
//		INHINT
// slot 25529
                    if slot <> 25529 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4379
//		TC	KILLTASK	# DELETE DESIGNATE TASK FROM
// slot 25530
                    if slot <> 25530 or instruction <> 3095 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3095, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1656] to agcAotUnit1656@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4380
//		CADR	DESLOOP +2	# WAITLIST USING KILLTASK
// slot 25531
    25531, 43780
)).

// bank 26, slots 25532-25533
function agcAotUnit1657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25532 {
// P20-P25.agc:4381
//		TC	ENDOFJOB
// slot 25532
        if slot <> 25532 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4382
//
// P20-P25.agc:4383
//LIMALARM	TC	ALARM		# ISSUE ALARM 527 -- LOS NOT IN MODE2
// slot 25533
        if slot <> 25533 or instruction <> 2935 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2935, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1657] to agcAotUnit1657@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4384
//		OCT	527		# COVERAGE IN P22 OR VEHICLE MANEUVER
// slot 25534
    25534, 686
)).

// bank 26, slots 25535-25536
function agcAotUnit1658 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25535 {
// P20-P25.agc:4385
//		INHINT			# REQUIRED IN P20
// slot 25535
        if slot <> 25535 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4386
//		TC	KILLTASK	# KILL WAITLIST CALL FOR NEXT
// slot 25536
        if slot <> 25536 or instruction <> 3095 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3095, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1658] to agcAotUnit1658@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4387
//		CADR	CALLDGCH	# POINT IN SEARCH PATTERN
// slot 25537
    25537, 46918
)).

// bank 26, slots 25538-25538
function agcAotUnit1659 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4388
//		TC	ENDOFJOB
// slot 25538
    if slot <> 25538 or instruction <> 2669 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2669, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1659] to agcAotUnit1659@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4389
//
// P20-P25.agc:4390
//ALL1S		DEC	11111
// slot 25539
    25539, 22222,
// P20-P25.agc:4391
//SIN60DEG	2DEC	.86603
// slot 25540 25541
    25540, 28378, 25541, 1164,
// P20-P25.agc:4392
//COS60DEG	=	DPHALF		# (2DEC .50)
// P20-P25.agc:4393
//UXVECTPR	EQUALS	12D		# PREVIOUS
// P20-P25.agc:4394
//UYVECTPR	EQUALS	18D
// P20-P25.agc:4395
//RLMUNIT		EQUALS	12D
// P20-P25.agc:4396
//OFFSTFAC	2DEC	0.05678		# TANGENT OF 3.25 DEGREES
// slot 25542 25543
    25542, 1860, 25543, 9290,
// P20-P25.agc:4397
//
// P20-P25.agc:4398
//ONEOCT		OCT	00001		# **** NOTE -- THESE TWO CONSTANTS MUST ****
// slot 25544
    25544, 2,
// P20-P25.agc:4399
//3SECONDS	2DEC	300		# **** BE IN THIS ORDER BECAUSE         ****
// slot 25545 25546
    25545, 0, 25546, 600,
// P20-P25.agc:4400
//
// P20-P25.agc:4401
//					# **** ONEOCT NEEDS A LOWER ORDER 	****
// P20-P25.agc:4402
//					# **** WORD OF ZEROES			****
// P20-P25.agc:4403
//6SECONDS	DEC	600
// slot 25547
    25547, 1200,
// P20-P25.agc:4404
//1.5SECS		2DEC	150
// slot 25548 25549
    25548, 0, 25549, 300
)).

// bank 03, slots 5138-5140
function agcAotUnit252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5138 {
// P20-P25.agc:4405
//
// P20-P25.agc:4406
//ZERO/SP		EQUALS	HI6ZEROS
// P20-P25.agc:4407
//
// P20-P25.agc:4408
//		BLOCK	02
// P20-P25.agc:4409
//		SETLOC	FFTAG5
// P20-P25.agc:4410
//		BANK
// P20-P25.agc:4411
//		COUNT*	$$/P20
// P20-P25.agc:4412
//GOTOV56		EXTEND			# P20 TERMINATES BY GOTOV56 INSTEAD OF
// slot 5138
        if slot <> 5138 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 5139 {
// P20-P25.agc:4413
//		DCA	VB56CADR	# GOTOPOOH
// slot 5139
            if slot <> 5139 or instruction <> 15382 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 3094, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4414
//		TCF	SUPDXCHZ
// slot 5140
            if slot <> 5140 or instruction <> 6773 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6773, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[252] to agcAotUnit252@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4415
//		EBANK=	WHOCARES
// P20-P25.agc:4416
//VB56CADR	2CADR	TRMTRACK
// slot 5141 5142
    5141, 3112, 5142, 55438
)).

// bank 33, slots 29733-29748
function agcAotUnit1908 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29740 {
        if slot <= 29736 {
            if slot <= 29734 {
                if slot <= 29733 {
// P20-P25.agc:4417
//
// P20-P25.agc:4418
//# Page 594
// P20-P25.agc:4419
//# PROGRAM NAME: R29 	(RENDEZVOUS RADAR DESIGNATE DURING POWERED FLIGHT)
// P20-P25.agc:4420
//# MOD NO. 2	BY BLAIR-SMITH KERMAN	JULY 2, 1968
// P20-P25.agc:4421
//#
// P20-P25.agc:4422
//# FUNCTIONAL DESCRIPTION:
// P20-P25.agc:4423
//#
// P20-P25.agc:4424
//#	DESIGNATES THE RENDEZVOUS RADAR TOWARD THE COMPUTES LOS TO THE CSM, WITH THE CHIEF OBJECTIVE OF OBTAINING RANGE
// P20-P25.agc:4425
//#	AND RANGE RATE DATA AT 2-SECOND INTERVALS FOR TRANSMISSION TO THE GROUND.  WHEN THE RR IS WITHIN .5 DEGREE OF
// P20-P25.agc:4426
//#	THE COMPUTED LOS, TRACKING IS ENABLED, AND DESIGNATION CONTINUES UNTIL THE DATA-GOOD DISCRETE IS RECEIVED.  AT
// P20-P25.agc:4427
//#	THAT POINT, DESIGNATION CEASES AND A RADAR-READING ROUTINE TAKES OVER, PREPARING A CONSISTENT SET OF DATA FOR
// P20-P25.agc:4428
//#	DOWN TELEMETRY.  THE SET INCLUDES RANGE, RANGE RATE, MARK TIME, TWO RR CDU ANGLES, THREE IMUCDU ANGLES, AND AN
// P20-P25.agc:4429
//#	INDICATOR WHICH IS 1 WHEN THE SET IS CONSISTENT AND 0 OTHERWISE.  THE INDICATOR IS IN TRKMKCNT.
// P20-P25.agc:4430
//#
// P20-P25.agc:4431
//# CALLING SEQUENCE:  BEGUN EVERY 2 SECONDS AS AN INTEGRAL PART OF SERVICER
// P20-P25.agc:4432
//#
// P20-P25.agc:4433
//# SUBROUTINES CALLED:
// P20-P25.agc:4434
//#
// P20-P25.agc:4435
//#	REMODE		RRPONLY
// P20-P25.agc:4436
//#	UNIT		MPACVBUF
// P20-P25.agc:4437
//#	QUICTRIG	AX*SR*T
// P20-P25.agc:4438
//#	SPSIN		SPCOS
// P20-P25.agc:4439
//#	SETRRECR	RROUT
// P20-P25.agc:4440
//#	RRRDOT		RRRANGE
// P20-P25.agc:4441
//#
// P20-P25.agc:4442
//# EXIT:  TO NOR29NOW, IN SERVICER.
// P20-P25.agc:4443
//#
// P20-P25.agc:4444
//# OUTPUT:  (ALL FOR DOWNLINK)
// P20-P25.agc:4445
//#
// P20-P25.agc:4446
//#	RM		RDOTM		(RAW)
// P20-P25.agc:4447
//#	AIG		AMG
// P20-P25.agc:4448
//#	AOG		TRKMKCNT	TRKMKCNT = 00001 IF SET IS CONSISTENT,
// P20-P25.agc:4449
//#	TANGNB		TANGNB +1	OTHERWISE TRKMKCNT = 00000.
// P20-P25.agc:4450
//#	MKTIME
// P20-P25.agc:4451
//# Page 595
// P20-P25.agc:4452
//#
// P20-P25.agc:4453
//# ERASABLE INITIALIZATION REQUIRED:
// P20-P25.agc:4454
//#
// P20-P25.agc:4455
//#	NOR29FLG	READRFLG		(TO 1 AND 0 BY FRESH START) (RESET NOR29FLG TO LET SERVICER RUN R29)
// P20-P25.agc:4456
//#	PIPTIME		RADMODES (BIT 10)	(BIT SET TO 0 BY FRESH START)
// P20-P25.agc:4457
//#	R(CSM)		V(CSM)
// P20-P25.agc:4458
//#	R		V			(PIPTIME THRU V BY AVE G IN SERVICER)
// P20-P25.agc:4459
//#
// P20-P25.agc:4460
//# DEBRIS:
// P20-P25.agc:4461
//#
// P20-P25.agc:4462
//#	RADMODES (BIT 10)
// P20-P25.agc:4463
//#	LOSSM		LOSVDT/4		(= RRTARGET & LOSVEL)
// P20-P25.agc:4464
//#	SAVECDUT	OLDESFLG		(SAVECDUT = MLOSV)
// P20-P25.agc:4465
//#	LOSCMFLG	READRFLG
// P20-P25.agc:4466
//#
// P20-P25.agc:4467
//# ALARMS:  NONE.
// P20-P25.agc:4468
//#
// P20-P25.agc:4469
//# COMPONENT JOBS AND TASKS:
// P20-P25.agc:4470
//#
// P20-P25.agc:4471
//#	INITIALIZING, IF RR IS FOUND TO BE IN MODE 1:  JOB R29REMOJ AND TASK REMODE:  ALWAYS: TASK PREPOS29.
// P20-P25.agc:4472
//#	DESIGNATING:  TASK BEGDES29 & JOB R29DODES.
// P20-P25.agc:4473
//#	RADAR READING:  TASK R29READ AND JOB R29RDJOB.  ALL JOBS ARE NOVAC TYPE.
// P20-P25.agc:4474
//
// P20-P25.agc:4475
//		BANK	33
// P20-P25.agc:4476
//		SETLOC	R29/SERV
// P20-P25.agc:4477
//		BANK
// P20-P25.agc:4478
//
// P20-P25.agc:4479
//		COUNT*	$$/r29
// P20-P25.agc:4480
//
// P20-P25.agc:4481
//NR29&RDR	EQUALS	EBANK5
// P20-P25.agc:4482
//
// P20-P25.agc:4483
//# Page 596
// P20-P25.agc:4484
//# SERVICER COMES TO R29 FROM "R29?" IF NOR29FLG, READRFLG, RRREMODE, RRCDUZRO, RRREPOS, AND DISPLAY-INERTIAL-DATA
// P20-P25.agc:4485
//# ARE ALL RESET, AND THE RR IS IN LGC MODE (OFTEN CONFUSINGLY CALLED AUTO MODE).
// P20-P25.agc:4486
//
// P20-P25.agc:4487
//R29		CS	RADMODES
// slot 29733
                    if slot <> 29733 or instruction <> 16456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 72).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4488
//		MASK	DESIGBIT
// slot 29734
                    if slot <> 29734 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29735 {
// P20-P25.agc:4489
//		EXTEND
// slot 29735
                    if slot <> 29735 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4490
//		BZF	R29.LOS		# BRANCH IF DESIGNATION IS ALREADY ON.
// slot 29736
                    if slot <> 29736 or instruction <> 5203 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5203, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29738 {
                if slot <= 29737 {
// P20-P25.agc:4491
//
// P20-P25.agc:4492
//		INHINT
// slot 29737
                    if slot <> 29737 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4493
//		ADS	RADMODES	# SHOW THAT DESIGNATION IS NOW ON.
// slot 29738
                    if slot <> 29738 or instruction <> 11336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29739 {
// P20-P25.agc:4494
//		CS	BIT14
// slot 29739
                    if slot <> 29739 or instruction <> 18910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4495
//		EXTEND
// slot 29740
                    if slot <> 29740 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29744 {
            if slot <= 29742 {
                if slot <= 29741 {
// P20-P25.agc:4496
//		WAND	CHAN12		# REMOVE RR TRACK ENABLE DISCRETE.
// slot 29741
                    if slot <> 29741 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4497
//		CS	LOSCMBIT
// slot 29742
                    if slot <> 29742 or instruction <> 18912 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29743 {
// P20-P25.agc:4498
//		MASK	FLAGWRD2
// slot 29743
                    if slot <> 29743 or instruction <> 28734 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4499
//		TS	FLAGWRD2	# CLEAR LOSCMFLG TO SHOW DES. LOOP IS OFF.
// slot 29744
                    if slot <> 29744 or instruction <> 22590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22590, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29746 {
                if slot <= 29745 {
// P20-P25.agc:4500
//		CS	OLDESBIT
// slot 29745
                    if slot <> 29745 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4501
//		MASK	STATE
// slot 29746
                    if slot <> 29746 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29747 {
// P20-P25.agc:4502
//		TS	STATE		# SHOW THAT DES. LOOP IS NOT REQUESTED.
// slot 29747
                    if slot <> 29747 or instruction <> 22588 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22588, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4503
//		TC	BANKCALL
// slot 29748
                    if slot <> 29748 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1908] to agcAotUnit1908@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4504
//		CADR	SETRRECR	# ENABLE RR ERROR COUNTERS.
// slot 29749
    29749, 43228
)).

// bank 33, slots 29750-29755
function agcAotUnit1909 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29752 {
        if slot <= 29750 {
// P20-P25.agc:4505
//		CA	ANTENBIT
// slot 29750
            if slot <> 29750 or instruction <> 14816 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29751 {
// P20-P25.agc:4506
//		MASK	RADMODES
// slot 29751
                if slot <> 29751 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4507
//		CCS	A		# TEST RR MODE BIT.
// slot 29752
                if slot <> 29752 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29753 {
// P20-P25.agc:4508
//		TCF	SETPRPOS	# MODE 2.
// slot 29753
            if slot <> 29753 or instruction <> 5188 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5188, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29754 {
// P20-P25.agc:4509
//
// P20-P25.agc:4510
//		CA	PRIO21		# MODE 1:  MUST REMODE.
// slot 29754
                if slot <> 29754 or instruction <> 14873 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2585), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4511
//		TC	NOVAC
// slot 29755
                if slot <> 29755 or instruction <> 2618 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2618, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1909] to agcAotUnit1909@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4512
//		EBANK=	LOSCOUNT
// P20-P25.agc:4513
//		2CADR	R29REM0J	# NEEDS OWN JOB TO RADSTALL IN.
// slot 29756 29757
    29756, 2198, 29757, 55406
)).

// bank 33, slots 29758-29765
function agcAotUnit1910 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29761 {
        if slot <= 29759 {
            if slot <= 29758 {
// P20-P25.agc:4514
//
// P20-P25.agc:4515
//		CS	DESIGBIT
// slot 29758
                if slot <> 29758 or instruction <> 18914 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4516
//		MASK	RADMODES	# CLEAR DESIGNATE FLAG IN RADMODES
// slot 29759
                if slot <> 29759 or instruction <> 28744 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29760 {
// P20-P25.agc:4517
//		TS	RADMODES	# BEFORE CALLING REMODE
// slot 29760
                if slot <> 29760 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4518
//		CA	REMODBIT
// slot 29761
                if slot <> 29761 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29763 {
            if slot <= 29762 {
// P20-P25.agc:4519
//		ADS	RADMODES	# SHOW THAT REMODING IS ON.
// slot 29762
                if slot <> 29762 or instruction <> 11336 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 72).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4520
//		TCF	NOR29NOW	# CONTINUE SERVICER FUNCTIONS.
// slot 29763
                if slot <> 29763 or instruction <> 5496 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5496, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29764 {
// P20-P25.agc:4521
//
// P20-P25.agc:4522
//SETPRPOS	CA	ONE
// slot 29764
                if slot <> 29764 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4523
//		TC	WAITLIST
// slot 29765
                if slot <> 29765 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1910] to agcAotUnit1910@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4524
//		EBANK=	LOSCOUNT
// P20-P25.agc:4525
//		2CADR	PREPOS29	# TASK TO SET TRUNNION ANGLE TO 180 DEG.
// slot 29766 29767
    29766, 3842, 29767, 43118
)).

// bank 33, slots 29768-29772
function agcAotUnit1911 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29769 {
        if slot <= 29768 {
// P20-P25.agc:4526
//
// P20-P25.agc:4527
//		CA	REPOSBIT
// slot 29768
            if slot <> 29768 or instruction <> 14817 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4528
//		ADS	RADMODES	# SHOW THAT REPOSITIONING IS ON.
// slot 29769
            if slot <> 29769 or instruction <> 11336 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 72).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29770 {
// P20-P25.agc:4529
//		TCF	NOR29NOW
// slot 29770
            if slot <> 29770 or instruction <> 5496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5496, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29771 {
// P20-P25.agc:4530
//
// P20-P25.agc:4531
//# Page 597
// P20-P25.agc:4532
//# FORCE RENDEZVOUS RADAR INTO MODE 2.
// P20-P25.agc:4533
//
// P20-P25.agc:4534
//R29REM0J	CA	ONE
// slot 29771
                if slot <> 29771 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4535
//		TC	WAITLIST
// slot 29772
                if slot <> 29772 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1911] to agcAotUnit1911@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4536
//		EBANK=	LOSCOUNT
// P20-P25.agc:4537
//		2CADR	REMODE		# REMODE MUST RUN AS A TASK.
// slot 29773 29774
    29773, 2290, 29774, 43118
)).

// bank 33, slots 29775-29775
function agcAotUnit1912 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4538
//
// P20-P25.agc:4539
//		TC	BANKCALL	# WAIT FOR END OF REMODING
// slot 29775
    if slot <> 29775 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1912] to agcAotUnit1912@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4540
//		CADR	RADSTALL
// slot 29776
    29776, 16280
)).

// bank 33, slots 29777-29778
function agcAotUnit1913 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29777 {
// P20-P25.agc:4541
//
// P20-P25.agc:4542
//		TCF	ENDOFJOB	# BAD EXIT CAN'T HAPPEN.
// slot 29777
        if slot <> 29777 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4543
//		TCF	ENDOFJOB
// slot 29778
        if slot <> 29778 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1913] to agcAotUnit1913@.

// bank 25, slots 24449-24454
function agcAotUnit1616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24451 {
        if slot <= 24449 {
// P20-P25.agc:4544
//
// P20-P25.agc:4545
//# TASK TO PREPOSITION THE RR TRUNNION ANGLE TO -180 DEG.
// P20-P25.agc:4546
//
// P20-P25.agc:4547
//		SETLOC	R29S1
// P20-P25.agc:4548
//		BANK
// P20-P25.agc:4549
//
// P20-P25.agc:4550
//PREPOS29	CA	NEGMAX		# -180 DEG.
// slot 24449
            if slot <> 24449 or instruction <> 14813 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24450 {
// P20-P25.agc:4551
//		TC	RRTONLY		# DRIVE TRUNNION CDU.
// slot 24450
                if slot <> 24450 or instruction <> 1185 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1185, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4552
//		CS	REPOSBIT	# SHOW THAT REPOSITIONING IS OFF.
// slot 24451
                if slot <> 24451 or instruction <> 18913 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24452 {
// P20-P25.agc:4553
//		MASK	RADMODES
// slot 24452
            if slot <> 24452 or instruction <> 28744 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 72).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24453 {
// P20-P25.agc:4554
//		TS	RADMODES
// slot 24453
                if slot <> 24453 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4555
//		TCF	TASKOVER
// slot 24454
                if slot <> 24454 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1616] to agcAotUnit1616@.

// bank 33, slots 29779-29790
function agcAotUnit1914 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29784 {
        if slot <= 29781 {
            if slot <= 29779 {
// P20-P25.agc:4556
//
// P20-P25.agc:4557
//# COMPUTE THE LINE-OF-SIGHT AND LOS VELOCITY, AND PASS THEM TO THE R29DODES LOOP.
// P20-P25.agc:4558
//
// P20-P25.agc:4559
//		SETLOC	R29
// P20-P25.agc:4560
//		BANK
// P20-P25.agc:4561
//
// P20-P25.agc:4562
//R29.LOS		EXTEND
// slot 29779
                if slot <> 29779 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29780 {
// P20-P25.agc:4563
//		DCS	PIPTIME
// slot 29780
                    if slot <> 29780 or instruction <> 17053 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 669, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4564
//		DXCH	MPAC
// slot 29781
                    if slot <> 29781 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29782 {
// P20-P25.agc:4565
//		EXTEND
// slot 29782
                if slot <> 29782 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29783 {
// P20-P25.agc:4566
//		DCA	TIME2
// slot 29783
                    if slot <> 29783 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4567
//		DAS	MPAC		# (MPAC) = T-PIPTIME, SCALED B-28.
// slot 29784
                    if slot <> 29784 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29787 {
            if slot <= 29785 {
// P20-P25.agc:4568
//		TS	MODE		# SET MODE TO DOUBLE PRECISION.
// slot 29785
                if slot <> 29785 or instruction <> 22643 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22643, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29786 {
// P20-P25.agc:4569
//		CA	MPAC +1
// slot 29786
                    if slot <> 29786 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 109).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4570
//		EXTEND
// slot 29787
                    if slot <> 29787 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29788 {
// P20-P25.agc:4571
//		MP	BIT12
// slot 29788
                if slot <> 29788 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2528, readEffective:call(words, 2528)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29789 {
// P20-P25.agc:4572
//		DXCH	MPAC		# T-PIPTIME NOW SCALED B-17.
// slot 29789
                    if slot <> 29789 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4573
//		TC	INTPRET
// slot 29790
                    if slot <> 29790 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1914] to agcAotUnit1914@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4574
//# Page 598
// P20-P25.agc:4575
//# LOSCMFLG = 0 MEANS THAT THE DESIGNATION IS READY FOR NEW DATA.  SETTING LOSCMFLG MAKES IT GO AWAY SO SETUP29D CAN
// P20-P25.agc:4576
//# START IT UP WHEN THE DATA IS IN PLACE.
// P20-P25.agc:4577
//
// P20-P25.agc:4578
//		PDVL	VSU		# PUSH DOWN T-PIPTIME
// slot 29791
    29791, 43418,
// P20-P25.agc:4579
//			V(CSM)
// slot 29792
    29792, 1964,
// P20-P25.agc:4580
//			V		# LOSVEL = V(CSM) - V
// slot 29793
    29793, 3758,
// P20-P25.agc:4581
//		PDDL	VXSC		# SWAP LOSVEL FOR T-PIPTIME, MULTIPLY THEM
// slot 29794
    29794, 61866,
// P20-P25.agc:4582
//		VAD	VSU		# 	AND ADD THE RESULT TO R(CSM) - R TO GET
// slot 29795
    29795, 43354,
// P20-P25.agc:4583
//			R(CSM)		# 	AN UP-TO-DATE LOS VECTOR IN SM AXES.
// slot 29796
    29796, 1952,
// P20-P25.agc:4584
//			R
// slot 29797
    29797, 3746,
// P20-P25.agc:4585
//		BOFSET	EXIT		# (BOFSET DOES ITS THING INHINTED.)
// slot 29798
    29798, 65048,
// P20-P25.agc:4586
//			LOSCMFLG	# IF DESIGNATE LOOP IS OFF, CHANGE LOSCM-
// slot 29799
    29799, 1094,
// P20-P25.agc:4587
//			SETUP29D	# FLG TO ON AND GO TO SET UP NEW DATA.
// slot 29800
    29800, 55508
)).

// bank 33, slots 29801-29801
function agcAotUnit1915 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4588
//		TCF	NOR29NOW	# IF DES. LOOP IS ON, LET IT USE OLD DATA.
// slot 29801
    if slot <> 29801 or instruction <> 5496 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5496, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1915] to agcAotUnit1915@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4589
//
// P20-P25.agc:4590
//SETUP29D	STOVL	LOSSM		# LINE-OF-SIGHT VECTOR, STABLE MEMBER AXES
// slot 29802
    29802, 21636,
// P20-P25.agc:4591
//			0
// slot 29803
    29803, 2,
// P20-P25.agc:4592
//		VXSC
// slot 29804
    29804, 65506,
// P20-P25.agc:4593
//			.5SECB17
// slot 29805
    29805, 22782,
// P20-P25.agc:4594
//		STORE	LOSVDT/4	# 1/2 SECOND'S WORTH OF LOS VELOCITY.
// slot 29806
    29806, 2018,
// P20-P25.agc:4595
//		CLEAR	EXIT
// slot 29807
    29807, 65048,
// P20-P25.agc:4596
//			LOSCMFLG	# LET R29DLOOP USE NEW DATA.
// slot 29808
    29808, 1382
)).

// bank 33, slots 29809-29818
function agcAotUnit1916 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29813 {
        if slot <= 29810 {
            if slot <= 29809 {
// P20-P25.agc:4597
//
// P20-P25.agc:4598
//		CS	STATE
// slot 29809
                if slot <> 29809 or instruction <> 16444 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 60).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4599
//		MASK	OLDESBIT
// slot 29810
                if slot <> 29810 or instruction <> 31211 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    if fixedOperand = 1 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29811 {
// P20-P25.agc:4600
//		EXTEND
// slot 29811
                if slot <> 29811 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29812 {
// P20-P25.agc:4601
//		BZF	NOR29NOW	# BRANCH IF R29 DES. LOOP IS REQUESTED.
// slot 29812
                    if slot <> 29812 or instruction <> 5496 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5496, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4602
//		INHINT
// slot 29813
                    if slot <> 29813 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29815 {
            if slot <= 29814 {
// P20-P25.agc:4603
//		ADS	STATE		# OTHERWISE REQUEST IT NOW.
// slot 29814
                if slot <> 29814 or instruction <> 11324 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4604
//
// P20-P25.agc:4605
//		CCS	PIPCTR		# SEE IF TASK SHOULD BE OFFSET ONE SECOND.
// slot 29815
                if slot <> 29815 or instruction <> 4654 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 558).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29816 {
// P20-P25.agc:4606
//		CS	SUPER110	# -96D +100D = 4.
// slot 29816
                if slot <> 29816 or instruction <> 18942 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2558), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29817 {
// P20-P25.agc:4607
//		AD	1SEC		# 0 +100D = 100D.
// slot 29817
                    if slot <> 29817 or instruction <> 27135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4608
//		TC	WAITLIST
// slot 29818
                    if slot <> 29818 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1916] to agcAotUnit1916@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4609
//		EBANK=	LOSCOUNT
// P20-P25.agc:4610
//		2CADR	BEGDES29	# START BEGDES29 TASK ASAP.
// slot 29819 29820
    29819, 3548, 29820, 41070
)).

// bank 33, slots 29821-29821
function agcAotUnit1917 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4611
//
// P20-P25.agc:4612
//		TCF	NOR29NOW	# RELINT AND CONTINUE SERVICER FUNCTIONS.
// slot 29821
    if slot <> 29821 or instruction <> 5496 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5496, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1917] to agcAotUnit1917@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4613
//
// P20-P25.agc:4614
//.5SECB17	2DEC	50 B-17
// slot 29822 29823
    29822, 12, 29823, 8192
)).

// bank 24, slots 23278-23279
function agcAotUnit1528 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23278 {
// P20-P25.agc:4615
//
// P20-P25.agc:4616
//# Page 599
// P20-P25.agc:4617
//# R29 DESIGNATE JOB AND TASK MACHINERY.  TASK RECURS EVERY .5 SEC UNTIL DESIGNATE IS CALLED OFF; IT MAY WAIT FOR A
// P20-P25.agc:4618
//# CENTISECOND OR TWO IF IT COMES UP WHILE SETUP29D IS SUPPLYING NEW DATA.
// P20-P25.agc:4619
//
// P20-P25.agc:4620
//		BANK	24
// P20-P25.agc:4621
//		SETLOC	P20S
// P20-P25.agc:4622
//		BANK
// P20-P25.agc:4623
//
// P20-P25.agc:4624
//		COUNT*	$$/R29
// P20-P25.agc:4625
//
// P20-P25.agc:4626
//BEGDES29	CAF	PRIO21
// slot 23278
        if slot <> 23278 or instruction <> 14873 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2585), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4627
//		TC	NOVAC
// slot 23279
        if slot <> 23279 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1528] to agcAotUnit1528@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4628
//		EBANK=	LOSVDT/4
// P20-P25.agc:4629
//		2CADR	R29DODES	# START R29DODES JOB TWICE A SECOND.
// slot 23280 23281
    23280, 2766, 23281, 53350
)).

// bank 24, slots 23282-23295
function agcAotUnit1529 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23288 {
        if slot <= 23284 {
            if slot <= 23282 {
// P20-P25.agc:4630
//
// P20-P25.agc:4631
//R29DLOOP	CAF	.5SEC
// slot 23282
                if slot <> 23282 or instruction <> 14844 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2556), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23283 {
// P20-P25.agc:4632
//		TC	VARDELAY
// slot 23283
                    if slot <> 23283 or instruction <> 2708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2708, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4633
//
// P20-P25.agc:4634
//		CS	RADMODES
// slot 23284
                    if slot <> 23284 or instruction <> 16456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 72).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23286 {
                if slot <= 23285 {
// P20-P25.agc:4635
//		MASK	DESIGBIT
// slot 23285
                    if slot <> 23285 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4636
//		CCS	A
// slot 23286
                    if slot <> 23286 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23287 {
// P20-P25.agc:4637
//		TCF	TASKOVER	# QUIT IF DESIGNATION IS CALLED OFF.
// slot 23287
                    if slot <> 23287 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4638
//
// P20-P25.agc:4639
//		CS	FLAGWRD2
// slot 23288
                    if slot <> 23288 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23291 {
            if slot <= 23289 {
// P20-P25.agc:4640
//		MASK	LOSCMBIT
// slot 23289
                if slot <> 23289 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23290 {
// P20-P25.agc:4641
//		EXTEND
// slot 23290
                    if slot <> 23290 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4642
//		BZF	+3		# BRANCH IF SETUP29D'S SUPPLYING NEW DATA.
// slot 23291
                    if slot <> 23291 or instruction <> 5886 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5886, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23293 {
                if slot <= 23292 {
// P20-P25.agc:4643
//		ADS	FLAGWRD2	# SET LOSCMFLG:  SHOW THAT DES. LOOP IS ON.
// slot 23292
                    if slot <> 23292 or instruction <> 11326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4644
//		TCF	BEGDES29
// slot 23293
                    if slot <> 23293 or instruction <> 5870 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5870, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23294 {
// P20-P25.agc:4645
//
// P20-P25.agc:4646
//		CA	ONE
// slot 23294
                    if slot <> 23294 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4647
//		TCF	R29DLOOP +1	# WAIT A CENTISECOND FOR NEW DATA.
// slot 23295
                    if slot <> 23295 or instruction <> 5875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1529] to agcAotUnit1529@.

// bank 32, slots 29031-29039
function agcAotUnit1857 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29034 {
        if slot <= 29032 {
            if slot <= 29031 {
// P20-P25.agc:4648
//# Page 600
// P20-P25.agc:4649
//# R29DODES:  RR DESIGNATION LOOP FOR R29
// P20-P25.agc:4650
//#
// P20-P25.agc:4651
//# THIS ROUTINE DOES MUCH THE SAME THING AS DODES, BUT A GREAT DEAL FASTER.  IT TAKES THE NON-UNITIZED LOS VECTOR
// P20-P25.agc:4652
//# IN STABLE MEMBER COORDINATES (LOSSM) AND A DELTA-LOS IN SM AXES (LOSVDT/4) WHICH IS 1/2 SEC TIMES LOS VELOCITY,
// P20-P25.agc:4653
//# AND DEVELOPS THE SHAFT AND TRUNNION COMMANDS USING SINGLE PRECISION AS MUCH AS POSSIBLE, AND INTERPRETIVE NOT AT
// P20-P25.agc:4654
//# ALL.  THE UNIT(LOSM + LOSVEL * 1 SEC) IS COMPUTED IN DP AND TRANSFORMED TO NAV BASE COORDINATES IN DOUBLE PRE-
// P20-P25.agc:4655
//# CISION (USING SP SINES AND COSINES OF CDU ANGLES), AND THE REST IS DONE IN SP.
// P20-P25.agc:4656
//#
// P20-P25.agc:4657
//# THE FUNCTIONAL DIFFERENCE IS THAT R29DODES ALWAYS CLEARS LOSCMFLG WHEN IT ENDS, AND IT STARTS UP THE R29READ
// P20-P25.agc:4658
//# TASK WHEN LOCK-ON IS ACHIEVED.
// P20-P25.agc:4659
//
// P20-P25.agc:4660
//		BANK	32
// P20-P25.agc:4661
//		SETLOC	F2DPS*32
// P20-P25.agc:4662
//		BANK
// P20-P25.agc:4663
//
// P20-P25.agc:4664
//		COUNT*	$$/R29
// P20-P25.agc:4665
//		EBANK=	LOSVDT/4
// P20-P25.agc:4666
//
// P20-P25.agc:4667
//R29DODES	CA	ONE
// slot 29031
                if slot <> 29031 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4668
//		TS	TANG		# INDICATE 1ST PASS THRU VECTOR LOOP.
// slot 29032
                if slot <> 29032 or instruction <> 23111 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23111, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29033 {
// P20-P25.agc:4669
//		CA	FIVE
// slot 29033
                if slot <> 29033 or instruction <> 14830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4670
//
// P20-P25.agc:4671
//R29DVBEG	CCS	A		# COUNT DOWN BY TWO'S IN VECTOR LOOP.
// slot 29034
                if slot <> 29034 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29036 {
            if slot <= 29035 {
// P20-P25.agc:4672
//		TS	Q
// slot 29035
                if slot <> 29035 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4673
//		CCS	TANG
// slot 29036
                if slot <> 29036 or instruction <> 4679 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 583).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29037 {
// P20-P25.agc:4674
//		TCF	R29DPAS1	# DO THIS ON 1ST PASS THRU LOOP.
// slot 29037
                if slot <> 29037 or instruction <> 5491 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5491, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29038 {
// P20-P25.agc:4675
//
// P20-P25.agc:4676
//		EXTEND			# (A "PASS" HERE MEANS 3 TIMES AROUND).
// slot 29038
                    if slot <> 29038 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4677
//		INDEX	Q
// slot 29039
                    if slot <> 29039 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1857] to agcAotUnit1857@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4678
//		DCA	LOSVDT/4
// slot 29040
    29040, 26594
)).

// bank 32, slots 29041-29041
function agcAotUnit1858 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4679
//		INDEX	Q
// slot 29041
    if slot <> 29041 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1858] to agcAotUnit1858@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4680
//		DAS	LOSSM		# ADVANCE LOS VECTOR 1/2 SECOND.
// slot 29042
    29042, 17540
)).

// bank 32, slots 29043-29044
function agcAotUnit1859 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29043 {
// P20-P25.agc:4681
//
// P20-P25.agc:4682
//R29DPAS1	EXTEND
// slot 29043
        if slot <> 29043 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4683
//		INDEX	Q
// slot 29044
        if slot <> 29044 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1859] to agcAotUnit1859@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4684
//		DCA	LOSSM
// slot 29045
    29045, 25732
)).

// bank 32, slots 29046-29046
function agcAotUnit1860 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4685
//		INDEX	Q		# MOVE CURRENT LOS (1ST PASS) OR LOS PRO-
// slot 29046
    if slot <> 29046 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1860] to agcAotUnit1860@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4686
//		DXCH	MPAC +1		# JECTED 1/2 SEC AHEAD (2ND PASS).
// slot 29047
    29047, 43228
)).

// bank 32, slots 29048-29051
function agcAotUnit1861 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29049 {
        if slot <= 29048 {
// P20-P25.agc:4687
//		CCS	TANG
// slot 29048
            if slot <> 29048 or instruction <> 4679 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 583).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4688
//		TCF	R29DVEND	# BUG OUT HERE IN 1ST PASS.
// slot 29049
            if slot <> 29049 or instruction <> 5503 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5503, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29050 {
// P20-P25.agc:4689
//
// P20-P25.agc:4690
//		EXTEND
// slot 29050
            if slot <> 29050 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4691
//		INDEX	Q
// slot 29051
            if slot <> 29051 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1861] to agcAotUnit1861@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4692
//		DCA	LOSVDT/4
// slot 29052
    29052, 26594
)).

// bank 32, slots 29053-29053
function agcAotUnit1862 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4693
//		INDEX	Q
// slot 29053
    if slot <> 29053 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1862] to agcAotUnit1862@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4694
//		DAS	MPAC +1		# PROJECT LOS 1 SECOND AHEAD (2ND PASS).
// slot 29054
    29054, 16604
)).

// bank 32, slots 29055-29061
function agcAotUnit1863 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29057 {
        if slot <= 29055 {
// P20-P25.agc:4695
//
// P20-P25.agc:4696
//R29DVEND	CCS	Q
// slot 29055
            if slot <> 29055 or instruction <> 4098 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29056 {
// P20-P25.agc:4697
//		TCF	R29DVBEG	# BRANCH TO CONTINUE VECTOR LOOP.
// slot 29056
                if slot <> 29056 or instruction <> 5482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4698
//
// P20-P25.agc:4699
//# Page 601
// P20-P25.agc:4700
//# UNITIZE AND TRANSFORM TO NAV BASE AXES THE PRESENT LOS (1ST PASS) OR THE 1-SEC PROJECTED LOS (2ND PASS).
// P20-P25.agc:4701
//
// P20-P25.agc:4702
//		DXCH	MPAC +1
// slot 29057
                if slot <> 29057 or instruction <> 21614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29059 {
            if slot <= 29058 {
// P20-P25.agc:4703
//		DXCH	MPAC
// slot 29058
                if slot <> 29058 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4704
//		CA	R29FXLOC	# = ADRES INTB15 + -34D
// slot 29059
                if slot <> 29059 or instruction <> 13820 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1532), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29060 {
// P20-P25.agc:4705
//		TS	FIXLOC
// slot 29060
                if slot <> 29060 or instruction <> 22608 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22608, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4706
//		TC	USPRCADR	# WITH FIXLOC ARMED FOR LENGTH AND LENGTH
// slot 29061
                if slot <> 29061 or instruction <> 2507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2507, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1863] to agcAotUnit1863@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4707
//		CADR	UNIT		# SQUARED, BORROW UNITIZING ROUTINE.
// slot 29062
    29062, 1062
)).

// bank 32, slots 29063-29077
function agcAotUnit1864 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29069 {
        if slot <= 29065 {
            if slot <= 29063 {
// P20-P25.agc:4708
//		TC	MPACVBUF	# MOVE UNIT(LOS) TO AX*SR*T ARG AREA.
// slot 29063
                if slot <> 29063 or instruction <> 3930 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3930, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29064 {
// P20-P25.agc:4709
//
// P20-P25.agc:4710
//		CCS	TANG
// slot 29064
                    if slot <> 29064 or instruction <> 4679 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 583).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4711
//		TCF	+2
// slot 29065
                    if slot <> 29065 or instruction <> 5515 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5515, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29067 {
                if slot <= 29066 {
// P20-P25.agc:4712
//		TCF	GOTANGLS	# GET CDU ANGLES ONLY AFTER 1ST PASS.
// slot 29066
                    if slot <> 29066 or instruction <> 5527 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5527, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4713
//		INHINT			# ENSURE CONSISTENT CDU READINGS.
// slot 29067
                    if slot <> 29067 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29068 {
// P20-P25.agc:4714
//		EXTEND
// slot 29068
                    if slot <> 29068 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4715
//		DCA	CDUT
// slot 29069
                    if slot <> 29069 or instruction <> 12318 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29073 {
            if slot <= 29071 {
                if slot <= 29070 {
// P20-P25.agc:4716
//		DXCH	SAVECDUT	# TRUNNION AND SHAFT ANGLES.
// slot 29070
                    if slot <> 29070 or instruction <> 22519 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1015, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4717
//		CA	CDUY
// slot 29071
                    if slot <> 29071 or instruction <> 12315 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 27).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29072 {
// P20-P25.agc:4718
//		TS	CDUSPOT
// slot 29072
                    if slot <> 29072 or instruction <> 23030 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23030, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4719
//		CA	CDUZ
// slot 29073
                    if slot <> 29073 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 28).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29075 {
                if slot <= 29074 {
// P20-P25.agc:4720
//		TS	CDUSPOT +2
// slot 29074
                    if slot <> 29074 or instruction <> 23032 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23032, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4721
//		CA	CDUX
// slot 29075
                    if slot <> 29075 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29076 {
// P20-P25.agc:4722
//		TS	CDUSPOT +4	# CDU ANGLES IN FUNNY ORDER FOR AX*SR*T.
// slot 29076
                    if slot <> 29076 or instruction <> 23034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23034, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4723
//		TC	BANKCALL
// slot 29077
                    if slot <> 29077 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1864] to agcAotUnit1864@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4724
//		CADR	QUICTRIG	# GET SINES AND COSINES OF CDU ANGLES.
// slot 29078
    29078, 40730
)).

// bank 32, slots 29079-29080
function agcAotUnit1865 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29079 {
// P20-P25.agc:4725
//
// P20-P25.agc:4726
//GOTANGLS	CS	THREE
// slot 29079
        if slot <> 29079 or instruction <> 19621 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 3237), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4727
//		TC	BANKCALL
// slot 29080
        if slot <> 29080 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1865] to agcAotUnit1865@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4728
//		CADR	AX*SR*T		# TRANSFORM UNIT LOS TO NB AXES (ULOSNB).
// slot 29081
    29081, 40826
)).

// bank 32, slots 29082-29096
function agcAotUnit1866 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29088 {
        if slot <= 29084 {
            if slot <= 29082 {
// P20-P25.agc:4729
//
// P20-P25.agc:4730
//		CCS	TANG
// slot 29082
                if slot <> 29082 or instruction <> 4679 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 583).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29083 {
// P20-P25.agc:4731
//		TCF	+2
// slot 29083
                    if slot <> 29083 or instruction <> 5533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4732
//		TCF	R29DPAS2	# GO TO RR COMMAND COMP. AFTER 2ND PASS.
// slot 29084
                    if slot <> 29084 or instruction <> 5570 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5570, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29086 {
                if slot <= 29085 {
// P20-P25.agc:4733
//
// P20-P25.agc:4734
//# Page 602
// P20-P25.agc:4735
//# COMPUTE COSINE OF THE ANGLE BETWEEN THE PRESENT LOS AND THE RR BORESIGHT VECTOR, AND SET THE SELFTRACK ENABLE IF
// P20-P25.agc:4736
//# THE COSINE IS APPROXIMATELY COS(.5 DEG) OR GREATER (I.E., SMALLER ANGLE).
// P20-P25.agc:4737
//
// P20-P25.agc:4738
//		INHINT
// slot 29085
                    if slot <> 29085 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4739
//		TS	TANG		# INDICATE 2ND PASS THRU VECTOR LOOP.
// slot 29086
                    if slot <> 29086 or instruction <> 23111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29087 {
// P20-P25.agc:4740
//		CA	SAVECDUT
// slot 29087
                    if slot <> 29087 or instruction <> 13302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1014).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4741
//		TC	SPCOS
// slot 29088
                    if slot <> 29088 or instruction <> 2586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29092 {
            if slot <= 29090 {
                if slot <= 29089 {
// P20-P25.agc:4742
//		TS	PUSHLOC		# PUSHLOC = COS T.
// slot 29089
                    if slot <> 29089 or instruction <> 22646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22646, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4743
//		CS	SAVECDUT
// slot 29090
                    if slot <> 29090 or instruction <> 17398 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 1014).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29091 {
// P20-P25.agc:4744
//		TC	SPSIN
// slot 29091
                    if slot <> 29091 or instruction <> 2587 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2587, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4745
//		TS	MODE		# MODE = -SIN T.
// slot 29092
                    if slot <> 29092 or instruction <> 22643 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29094 {
                if slot <= 29093 {
// P20-P25.agc:4746
//		EXTEND
// slot 29093
                    if slot <> 29093 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4747
//		MP	VBUF +2		# FORM - SIN T ULOSNBY.
// slot 29094
                    if slot <> 29094 or instruction <> 28756 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 84, readEffective:call(words, 84)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29095 {
// P20-P25.agc:4748
//		DXCH	MPAC
// slot 29095
                    if slot <> 29095 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4749
//		CA	SAVECDUT +1
// slot 29096
                    if slot <> 29096 or instruction <> 13303 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1015).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1866] to agcAotUnit1866@.

// bank 32, slots 29097-29159
function agcAotUnit1867 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29127 {
        if slot <= 29111 {
            if slot <= 29103 {
                if slot <= 29099 {
                    if slot <= 29097 {
// P20-P25.agc:4750
//		TC	SPSIN
// slot 29097
                        if slot <> 29097 or instruction <> 2587 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2587, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 29098 {
// P20-P25.agc:4751
//		TS	SAVECDUT	# SAVECDUT NOW = SIN S.
// slot 29098
                            if slot <> 29098 or instruction <> 23542 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23542, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4752
//		EXTEND
// slot 29099
                            if slot <> 29099 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29101 {
                        if slot <= 29100 {
// P20-P25.agc:4753
//		MP	PUSHLOC
// slot 29100
                            if slot <> 29100 or instruction <> 28790 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 118, readEffective:call(words, 118)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4754
//		EXTEND
// slot 29101
                            if slot <> 29101 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29102 {
// P20-P25.agc:4755
//		MP	VBUF		# FORM SIN S COS T ULOSNBX.
// slot 29102
                            if slot <> 29102 or instruction <> 28754 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 82, readEffective:call(words, 82)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4756
//		DAS	MPAC
// slot 29103
                            if slot <> 29103 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29107 {
                    if slot <= 29105 {
                        if slot <= 29104 {
// P20-P25.agc:4757
//		CA	SAVECDUT +1
// slot 29104
                            if slot <> 29104 or instruction <> 13303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1015).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4758
//		TC	SPCOS
// slot 29105
                            if slot <> 29105 or instruction <> 2586 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2586, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29106 {
// P20-P25.agc:4759
//		TS	SAVECDUT +1	# SAVECDUT +1 NOW = COS S.
// slot 29106
                            if slot <> 29106 or instruction <> 23543 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23543, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4760
//		EXTEND
// slot 29107
                            if slot <> 29107 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29109 {
                        if slot <= 29108 {
// P20-P25.agc:4761
//		MP	PUSHLOC
// slot 29108
                            if slot <> 29108 or instruction <> 28790 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 118, readEffective:call(words, 118)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4762
//		EXTEND
// slot 29109
                            if slot <> 29109 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29110 {
// P20-P25.agc:4763
//		MP	VBUF +4		# FORM COS S COS T ULOSNBZ.
// slot 29110
                            if slot <> 29110 or instruction <> 28758 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 86, readEffective:call(words, 86)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4764
//		DAS	MPAC		# COS(ERROR) = ULOSNB . (SIN S COS T,
// slot 29111
                            if slot <> 29111 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 29119 {
                if slot <= 29115 {
                    if slot <= 29113 {
                        if slot <= 29112 {
// P20-P25.agc:4765
//		EXTEND			# -SIN T, COS S COS T).
// slot 29112
                            if slot <> 29112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4766
//		DCA	MPAC
// slot 29113
                            if slot <> 29113 or instruction <> 12397 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29114 {
// P20-P25.agc:4767
//TESTCOS		DAS	MPAC		# (ULOSNB IN VBUF WAS A HALF-UNIT VECTOR).
// slot 29114
                            if slot <> 29114 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4768
//		CCS	A		# TEST FOR + OVERFLOW, NONE, OR MINUS.
// slot 29115
                            if slot <> 29115 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29117 {
                        if slot <= 29116 {
// P20-P25.agc:4769
//		CA	BIT14
// slot 29116
                            if slot <> 29116 or instruction <> 14814 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4770
//		NOOP
// slot 29117
                            if slot <> 29117 or instruction <> 5566 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5566, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29118 {
// P20-P25.agc:4771
//		EXTEND
// slot 29118
                            if slot <> 29118 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4772
//		WOR	CHAN12		# IF PLUS OVERFLOW, SET SELFTRACK ENABLE.
// slot 29119
                            if slot <> 29119 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29123 {
                    if slot <= 29121 {
                        if slot <= 29120 {
// P20-P25.agc:4773
//		RELINT
// slot 29120
                            if slot <> 29120 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4774
//		TCF	R29DVBEG -1	# MAKE 2ND PASS THRU VECTOR LOOP.
// slot 29121
                            if slot <> 29121 or instruction <> 5481 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5481, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29122 {
// P20-P25.agc:4775
//
// P20-P25.agc:4776
//# Page 603
// P20-P25.agc:4777
//# COMPUTE SHAFT AND TRUNNION COMMANDS TO NULL HAVE THE ERROR IN HALF A SECOND.
// P20-P25.agc:4778
//
// P20-P25.agc:4779
//R29DPAS2	CA	SAVECDUT +1
// slot 29122
                            if slot <> 29122 or instruction <> 13303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1015).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4780
//		EXTEND
// slot 29123
                            if slot <> 29123 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29125 {
                        if slot <= 29124 {
// P20-P25.agc:4781
//		MP	VBUF		# FORM COS S ULOSNB'X.
// slot 29124
                            if slot <> 29124 or instruction <> 28754 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 82, readEffective:call(words, 82)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4782
//		DXCH	TANG
// slot 29125
                            if slot <> 29125 or instruction <> 22088 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29126 {
// P20-P25.agc:4783
//		CS	SAVECDUT
// slot 29126
                            if slot <> 29126 or instruction <> 17398 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 1014).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4784
//		EXTEND
// slot 29127
                            if slot <> 29127 or instruction <> 6 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 29143 {
            if slot <= 29135 {
                if slot <= 29131 {
                    if slot <= 29129 {
                        if slot <= 29128 {
// P20-P25.agc:4785
//		MP	VBUF +4		# FORM - SIN S ULOSNB'Z.
// slot 29128
                            if slot <> 29128 or instruction <> 28758 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 86, readEffective:call(words, 86)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4786
//		DAS	TANG		# RAW SHAFT CMD = ULOSNB' . (COS S, 0,
// slot 29129
                            if slot <> 29129 or instruction <> 8776 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 584) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29130 {
// P20-P25.agc:4787
//		CS	MODE		# - SIN S)
// slot 29130
                            if slot <> 29130 or instruction <> 16499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 115).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4788
//		EXTEND
// slot 29131
                            if slot <> 29131 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29133 {
                        if slot <= 29132 {
// P20-P25.agc:4789
//		MP	SAVECDUT
// slot 29132
                            if slot <> 29132 or instruction <> 29686 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1014, readEffective:call(words, 1014)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4790
//		EXTEND
// slot 29133
                            if slot <> 29133 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29134 {
// P20-P25.agc:4791
//		MP	VBUF		# FORM SIN T SIN S ULOSNB'X.
// slot 29134
                            if slot <> 29134 or instruction <> 28754 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 82, readEffective:call(words, 82)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4792
//		DXCH	MPAC
// slot 29135
                            if slot <> 29135 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29139 {
                    if slot <= 29137 {
                        if slot <= 29136 {
// P20-P25.agc:4793
//		CA	PUSHLOC
// slot 29136
                            if slot <> 29136 or instruction <> 12406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 118).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4794
//		EXTEND
// slot 29137
                            if slot <> 29137 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29138 {
// P20-P25.agc:4795
//		MP	VBUF +2		# FORM COS T ULOSNB'Y.
// slot 29138
                            if slot <> 29138 or instruction <> 28756 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 84, readEffective:call(words, 84)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4796
//		DAS	MPAC
// slot 29139
                            if slot <> 29139 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29141 {
                        if slot <= 29140 {
// P20-P25.agc:4797
//		CS	MODE
// slot 29140
                            if slot <> 29140 or instruction <> 16499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 115).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4798
//		EXTEND
// slot 29141
                            if slot <> 29141 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29142 {
// P20-P25.agc:4799
//		MP	SAVECDUT +1
// slot 29142
                            if slot <> 29142 or instruction <> 29687 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1015, readEffective:call(words, 1015)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4800
//		EXTEND
// slot 29143
                            if slot <> 29143 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 29151 {
                if slot <= 29147 {
                    if slot <= 29145 {
                        if slot <= 29144 {
// P20-P25.agc:4801
//		MP	VBUF +4		# FORM SIN T COS S ULOSNB'Z.
// slot 29144
                            if slot <> 29144 or instruction <> 28758 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 86, readEffective:call(words, 86)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4802
//		DAS	MPAC		# RAW TRUNNION CMD = ULOSNB'.
// slot 29145
                            if slot <> 29145 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29146 {
// P20-P25.agc:4803
//		CA	MPAC		# (SIN S SIN T, COS T, SIN S COS T).
// slot 29146
                            if slot <> 29146 or instruction <> 12396 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 108).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4804
//		EXTEND
// slot 29147
                            if slot <> 29147 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29149 {
                        if slot <= 29148 {
// P20-P25.agc:4805
//		MP	RR29GAIN
// slot 29148
                            if slot <> 29148 or instruction <> 30205 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1533, readEffective:call(words, 1533)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4806
//		XCH	TANG		# STORE REFINED T CMD, GET RAW S CMD.
// slot 29149
                            if slot <> 29149 or instruction <> 24135 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 583, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29150 {
// P20-P25.agc:4807
//		EXTEND
// slot 29150
                            if slot <> 29150 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4808
//		MP	RR29GAIN
// slot 29151
                            if slot <> 29151 or instruction <> 30205 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1533, readEffective:call(words, 1533)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 29155 {
                    if slot <= 29153 {
                        if slot <= 29152 {
// P20-P25.agc:4809
//		TS	TANG +1		# STORE REFINED S CMD.
// slot 29152
                            if slot <> 29152 or instruction <> 23112 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23112, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4810
//
// P20-P25.agc:4811
//# Page 604
// P20-P25.agc:4812
//# WHETHER OR NOT TRACKING WAS ENABLED THIS TIME, CHECK ON RR DATA-GOOD.  IF PRESENT, STOP DESIGNATING AND START
// P20-P25.agc:4813
//# READING DATA FROM THE RENDEZVOUS RADAR.
// P20-P25.agc:4814
//
// P20-P25.agc:4815
//DGOOD?		CAF	BIT4
// slot 29153
                            if slot <> 29153 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29154 {
// P20-P25.agc:4816
//		EXTEND
// slot 29154
                            if slot <> 29154 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4817
//		RAND	CHAN33		# GET RR DATA-GOOD BIT.
// slot 29155
                            if slot <> 29155 or instruction <> 1051 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 29157 {
                        if slot <= 29156 {
// P20-P25.agc:4818
//		INHINT			# (MAINLY FOR RROUT).
// slot 29156
                            if slot <> 29156 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4819
//		EXTEND
// slot 29157
                            if slot <> 29157 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 29158 {
// P20-P25.agc:4820
//		BZF	R29LOKON	# BRANCH IF DATA-GOOD IS PRESENT.
// slot 29158
                            if slot <> 29158 or instruction <> 5610 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5610, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P20-P25.agc:4821
//
// P20-P25.agc:4822
//		TC	BANKCALL
// slot 29159
                            if slot <> 29159 or instruction <> 2446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2446, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1867] to agcAotUnit1867@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4823
//		CADR	RROUT		# DATA-GOOD IS ABSENT, SO SEND COMMANDS.
// slot 29160
    29160, 43404
)).

// bank 32, slots 29161-29173
function agcAotUnit1868 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29166 {
        if slot <= 29163 {
            if slot <= 29161 {
// P20-P25.agc:4824
//		TCF	END29DOD
// slot 29161
                if slot <> 29161 or instruction <> 5624 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5624, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29162 {
// P20-P25.agc:4825
//
// P20-P25.agc:4826
//R29LOKON	CS	DESIGBIT
// slot 29162
                    if slot <> 29162 or instruction <> 18914 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4827
//		MASK	RADMODES
// slot 29163
                    if slot <> 29163 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29164 {
// P20-P25.agc:4828
//		TS	RADMODES	# SHOW THAT DESIGNATION IS OVER.
// slot 29164
                if slot <> 29164 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29165 {
// P20-P25.agc:4829
//		CS	BIT2
// slot 29165
                    if slot <> 29165 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4830
//		EXTEND
// slot 29166
                    if slot <> 29166 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29169 {
            if slot <= 29167 {
// P20-P25.agc:4831
//		WAND	CHAN12		# DISABLE RR ERROR COUNTERS.
// slot 29167
                if slot <> 29167 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29168 {
// P20-P25.agc:4832
//		CA	READRBIT
// slot 29168
                    if slot <> 29168 or instruction <> 14819 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4833
//		ADS	FLAGWRD3	# SHOW THAT READING HAS BEEN REQUESTED.
// slot 29169
                    if slot <> 29169 or instruction <> 11327 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29171 {
                if slot <= 29170 {
// P20-P25.agc:4834
//		CCS	PIPCTR		# SEE IF TASK SHOULD BE OFFSET 1 SEC.
// slot 29170
                    if slot <> 29170 or instruction <> 4654 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 558).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4835
//		CS	SUPER110	# -96D + 100D = 4.
// slot 29171
                    if slot <> 29171 or instruction <> 18942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2558), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29172 {
// P20-P25.agc:4836
//		AD	1SEC		# 0 + 100D = 100D.
// slot 29172
                    if slot <> 29172 or instruction <> 27135 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4837
//		TC	WAITLIST
// slot 29173
                    if slot <> 29173 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1868] to agcAotUnit1868@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4838
//		EBANK=	LOSCOUNT
// P20-P25.agc:4839
//		2CADR	R29READ		# START READING TASK AND JOB.
// slot 29174 29175
    29174, 3584, 29175, 41070
)).

// bank 32, slots 29176-29179
function agcAotUnit1869 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29177 {
        if slot <= 29176 {
// P20-P25.agc:4840
//
// P20-P25.agc:4841
//END29DOD	CS	LOSCMBIT
// slot 29176
            if slot <> 29176 or instruction <> 18912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4842
//		MASK	FLAGWRD2
// slot 29177
            if slot <> 29177 or instruction <> 28734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 62).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29178 {
// P20-P25.agc:4843
//		TS	FLAGWRD2	# ALWAYS CLEAR LOSCMFLG.
// slot 29178
            if slot <> 29178 or instruction <> 22590 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22590, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4844
//		TCF	ENDOFJOB
// slot 29179
            if slot <> 29179 or instruction <> 6765 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6765, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1869] to agcAotUnit1869@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4845
//
// P20-P25.agc:4846
//R29FXLOC	ADRES	INTB15+ -34D
// slot 29180
    29180, 84,
// P20-P25.agc:4847
//RR29GAIN	DEC	-.53624
// slot 29181
    29181, 47962
)).

// bank 24, slots 23296-23297
function agcAotUnit1530 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23296 {
// P20-P25.agc:4848
//LOSVDT/4	EQUALS	LOSVEL
// P20-P25.agc:4849
//LOSSM		EQUALS	RRTARGET
// P20-P25.agc:4850
//SAVECDUT	EQUALS 	MLOSV
// P20-P25.agc:4851
//
// P20-P25.agc:4852
//# Page 605
// P20-P25.agc:4853
//# RR READING IS SET UP BY R29DODES WHEN IT DETECTS RR LOCK-ON
// P20-P25.agc:4854
//
// P20-P25.agc:4855
//		BANK	24
// P20-P25.agc:4856
//		SETLOC	P20S
// P20-P25.agc:4857
//		BANK
// P20-P25.agc:4858
//
// P20-P25.agc:4859
//		COUNT*	$$/R29
// P20-P25.agc:4860
//
// P20-P25.agc:4861
//		EBANK=	LOSCOUNT
// P20-P25.agc:4862
//
// P20-P25.agc:4863
//R29READ		CAF	PRIO26		# CALLED BY WAITLIST
// slot 23296
        if slot <> 23296 or instruction <> 16332 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4044), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P20-P25.agc:4864
//		TC	NOVAC
// slot 23297
        if slot <> 23297 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1530] to agcAotUnit1530@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4865
//		EBANK=	LOSCOUNT
// P20-P25.agc:4866
//		2CADR	R29RDJOB	# START JOB TO READ AND DOWNLINK FOR R29.
// slot 23298 23299
    23298, 3606, 23299, 41070
)).

// bank 24, slots 23300-23315
function agcAotUnit1531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23307 {
        if slot <= 23303 {
            if slot <= 23301 {
                if slot <= 23300 {
// P20-P25.agc:4867
//
// P20-P25.agc:4868
//		CA	2SECS
// slot 23300
                    if slot <> 23300 or instruction <> 14848 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4869
//		TC	VARDELAY
// slot 23301
                    if slot <> 23301 or instruction <> 2708 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2708, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23302 {
// P20-P25.agc:4870
//
// P20-P25.agc:4871
//		CA	FLAGWRD3	# 2 SECONDS LATER, SEE IF READING IS STILL
// slot 23302
                    if slot <> 23302 or instruction <> 12351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4872
//		MASK	READRBIT	# ALLOWED (NO TRACKER FAIL ETC.)
// slot 23303
                    if slot <> 23303 or instruction <> 31203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        if fixedOperand = 256 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23305 {
                if slot <= 23304 {
// P20-P25.agc:4873
//		CCS	A
// slot 23304
                    if slot <> 23304 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4874
//		TCF	R29READ		# IT'S OK:  CALL IT AGAIN.
// slot 23305
                    if slot <> 23305 or instruction <> 5888 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5888, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23306 {
// P20-P25.agc:4875
//		TCF	TASKOVER	# IT AIN'T:  WAIT FOR REDESIGNATE.
// slot 23306
                    if slot <> 23306 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4876
//
// P20-P25.agc:4877
//R29RDJOB	CA	FLAGWRD3	# CALLED VIA NOVAC.
// slot 23307
                    if slot <> 23307 or instruction <> 12351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 63).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23311 {
            if slot <= 23309 {
                if slot <= 23308 {
// P20-P25.agc:4878
//		MASK	NR29FBIT
// slot 23308
                    if slot <> 23308 or instruction <> 31201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        if fixedOperand = 1024 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4879
//		CCS	A		# TEST "NOR29FLG".
// slot 23309
                    if slot <> 23309 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23310 {
// P20-P25.agc:4880
//		TCF	ENDRRD29	# R29 IS NOW OVER, STOP AT ONCE.
// slot 23310
                    if slot <> 23310 or instruction <> 5949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5949, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4881
//
// P20-P25.agc:4882
//		CA	RADMODES
// slot 23311
                    if slot <> 23311 or instruction <> 12360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23313 {
                if slot <= 23312 {
// P20-P25.agc:4883
//		MASK	AUTOMBIT
// slot 23312
                    if slot <> 23312 or instruction <> 31210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4884
//		CCS	A		# TEST RR-NOT-IN-AUTO-MODE BIT.
// slot 23313
                    if slot <> 23313 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23314 {
// P20-P25.agc:4885
//		TCF	ENDRRD29	# ASTRO TOOK RR OUT OF AUTO MODE.
// slot 23314
                    if slot <> 23314 or instruction <> 5949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5949, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4886
//
// P20-P25.agc:4887
//		TC	BANKCALL
// slot 23315
                    if slot <> 23315 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1531] to agcAotUnit1531@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4888
//		CADR	RRRDOT		# INITIATE READING OF RANGE RATE.
// slot 23316
    23316, 44166
)).

// bank 24, slots 23317-23317
function agcAotUnit1532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4889
//		TC	BANKCALL
// slot 23317
    if slot <> 23317 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1532] to agcAotUnit1532@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4890
//		CADR	RADSTALL	# GOT TO SLEEP UNTIL IT'S READY.
// slot 23318
    23318, 16280
)).

// bank 24, slots 23319-23331
function agcAotUnit1533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23324 {
        if slot <= 23321 {
            if slot <= 23319 {
// P20-P25.agc:4891
//		TCF	ENDRRD29	# BAD READ; REDESIGNATE.
// slot 23319
                if slot <> 23319 or instruction <> 5949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23320 {
// P20-P25.agc:4892
//
// P20-P25.agc:4893
//# Page 606
// P20-P25.agc:4894
//# R29 RADAR READING CONTINUED.
// P20-P25.agc:4895
//
// P20-P25.agc:4896
//		DXCH	TIMEHOLD
// slot 23320
                    if slot <> 23320 or instruction <> 22086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 582, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4897
//		DXCH	MPAC		# TIME OF RR READING, FOR DOWNLINK.
// slot 23321
                    if slot <> 23321 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23322 {
// P20-P25.agc:4898
//		INHINT			# BE SURE OF 5 CONSISTENT CDU ANGLES.
// slot 23322
                if slot <> 23322 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23323 {
// P20-P25.agc:4899
//		EXTEND
// slot 23323
                    if slot <> 23323 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4900
//		DCA	CDUT
// slot 23324
                    if slot <> 23324 or instruction <> 12318 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 23327 {
            if slot <= 23325 {
// P20-P25.agc:4901
//		DXCH	MPAC +2		# RRCDU ANGLES AT RR READ, FOR DOWNLINK.
// slot 23325
                if slot <> 23325 or instruction <> 21615 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 23326 {
// P20-P25.agc:4902
//		EXTEND
// slot 23326
                    if slot <> 23326 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4903
//		DCA	CDUY
// slot 23327
                    if slot <> 23327 or instruction <> 12316 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 28, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 23329 {
                if slot <= 23328 {
// P20-P25.agc:4904
//		DXCH	MPAC +4		# MPAC'S 7 WORDS ARE BUFFERED FOR COPYCYCLE.
// slot 23328
                    if slot <> 23328 or instruction <> 21617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4905
//		CA	CDUX
// slot 23329
                    if slot <> 23329 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23330 {
// P20-P25.agc:4906
//		TS	MPAC +6		# IMUCDU ANGLES AT RR READ, FOR DOWNLINK.
// slot 23330
                    if slot <> 23330 or instruction <> 22642 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22642, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4907
//
// P20-P25.agc:4908
//R29RANGE	TC	BANKCALL
// slot 23331
                    if slot <> 23331 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1533] to agcAotUnit1533@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4909
//		CADR	RRRANGE		# INITIATE READING OF RR RANGE.
// slot 23332
    23332, 44170
)).

// bank 24, slots 23333-23333
function agcAotUnit1534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4910
//		TC	BANKCALL
// slot 23333
    if slot <> 23333 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1534] to agcAotUnit1534@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4911
//		CADR	RADSTALL	# GO TO SLEEP UNTIL IT'S READY.
// slot 23334
    23334, 16280
)).

// bank 24, slots 23335-23354
function agcAotUnit1535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23344 {
        if slot <= 23339 {
            if slot <= 23336 {
                if slot <= 23335 {
// P20-P25.agc:4912
//		TCF	R29RRR?		# BAD READ OR SCALE CHANGE ... WHICH?
// slot 23335
                    if slot <> 23335 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4913
//
// P20-P25.agc:4914
//		INHINT
// slot 23336
                    if slot <> 23336 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23337 {
// P20-P25.agc:4915
//		DXCH	DNRRANGE	# COPYCYCLE TO LAY OUT NEW R29 DOWNLINK.
// slot 23337
                    if slot <> 23337 or instruction <> 22236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 732, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23338 {
// P20-P25.agc:4916
//		DXCH	RM
// slot 23338
                        if slot <> 23338 or instruction <> 22511 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1007, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:4917
//		DXCH	MPAC
// slot 23339
                        if slot <> 23339 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23341 {
                if slot <= 23340 {
// P20-P25.agc:4918
//		DXCH	MKTIME
// slot 23340
                    if slot <> 23340 or instruction <> 22509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1005, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4919
//		DXCH	MPAC +2
// slot 23341
                    if slot <> 23341 or instruction <> 21615 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 111, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23342 {
// P20-P25.agc:4920
//		DXCH	TANGNB
// slot 23342
                    if slot <> 23342 or instruction <> 22507 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1003, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23343 {
// P20-P25.agc:4921
//		DXCH	MPAC +4
// slot 23343
                        if slot <> 23343 or instruction <> 21617 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 113, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:4922
//		DXCH	AIG
// slot 23344
                        if slot <> 23344 or instruction <> 22320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 816, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 23349 {
            if slot <= 23346 {
                if slot <= 23345 {
// P20-P25.agc:4923
//		CA	MPAC +6
// slot 23345
                    if slot <> 23345 or instruction <> 12402 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4924
//		TS	AOG
// slot 23346
                    if slot <> 23346 or instruction <> 23345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23347 {
// P20-P25.agc:4925
//		CA	ONE
// slot 23347
                    if slot <> 23347 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23348 {
// P20-P25.agc:4926
//		TS	TRKMKCNT	# SHOW THAT DOWNLINK DATA IS CONSISTENT.
// slot 23348
                        if slot <> 23348 or instruction <> 23346 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23346, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:4927
//		TCF	ENDOFJOB
// slot 23349
                        if slot <> 23349 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 23351 {
                if slot <= 23350 {
// P20-P25.agc:4928
//
// P20-P25.agc:4929
//R29RRR?		CS	FLAGWRD5
// slot 23350
                    if slot <> 23350 or instruction <> 16449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 65).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4930
//		MASK	BIT10
// slot 23351
                    if slot <> 23351 or instruction <> 31202 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                        if fixedOperand = 512 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 23352 {
// P20-P25.agc:4931
//		CCS	A		# WAS IT A SCALE CHANGE (REAL OR PHONY)?
// slot 23352
                    if slot <> 23352 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 23353 {
// P20-P25.agc:4932
//		TCF	ENDRRD29	# NO, A BAD READ; REDESIGNATE.
// slot 23353
                        if slot <> 23353 or instruction <> 5949 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5949, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:4933
//		TC	DOWNFLAG
// slot 23354
                        if slot <> 23354 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1535] to agcAotUnit1535@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4934
//		ADRES	RNGSCFLG
// slot 23355
    23355, 160
)).

// bank 24, slots 23356-23359
function agcAotUnit1536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23357 {
        if slot <= 23356 {
// P20-P25.agc:4935
//		TCF	R29RANGE	# YES; CLEAR FLAG AND READ AGAIN.
// slot 23356
            if slot <> 23356 or instruction <> 5923 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5923, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4936
//
// P20-P25.agc:4937
//ENDRRD29	CA	ZERO		# TROUBLE MADE US COME HERE TO LEAVE THE
// slot 23357
            if slot <> 23357 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        if slot <= 23358 {
// P20-P25.agc:4938
//		TS	TRKMKCNT	# RR-READING MODE.  DISCREDIT DOWNTEL.
// slot 23358
            if slot <> 23358 or instruction <> 23346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23346, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4939
//		TC	DOWNFLAG
// slot 23359
            if slot <> 23359 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1536] to agcAotUnit1536@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4940
//		ADRES	READRFLG
// slot 23360
    23360, 102
)).

// bank 24, slots 23361-23364
function agcAotUnit1537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23362 {
        if slot <= 23361 {
// P20-P25.agc:4941
//		CS	BIT14
// slot 23361
            if slot <> 23361 or instruction <> 18910 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4942
//		EXTEND
// slot 23362
            if slot <> 23362 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 23363 {
// P20-P25.agc:4943
//# Page 607
// P20-P25.agc:4944
//		WAND	CHAN12		# REMOVE TRACK-ENABLE DISCRETE.
// slot 23363
            if slot <> 23363 or instruction <> 1546 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P20-P25.agc:4945
//		TCF	ENDOFJOB
// slot 23364
            if slot <> 23364 or instruction <> 6765 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6765, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1537] to agcAotUnit1537@.

// bank 31, slots 27655-27655
function agcAotUnit1746 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4946
//
// P20-P25.agc:4947
//# Page 608
// P20-P25.agc:4948
//# W-MATRIX MONITOR
// P20-P25.agc:4949
//
// P20-P25.agc:4950
//		BANK	31
// P20-P25.agc:4951
//		SETLOC	VB67
// P20-P25.agc:4952
//		BANK
// P20-P25.agc:4953
//		COUNT*	$$/EXTVB
// P20-P25.agc:4954
//
// P20-P25.agc:4955
//		EBANK=	WWPOS
// P20-P25.agc:4956
//
// P20-P25.agc:4957
//V67CALL		TC	INTPRET
// slot 27655
    if slot <> 27655 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1746] to agcAotUnit1746@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4958
//		CALL
// slot 27656
    27656, 65320,
// P20-P25.agc:4959
//			V67WW
// slot 27657
    27657, 51360,
// P20-P25.agc:4960
//		EXIT
// slot 27658
    27658, 65532
)).

// bank 31, slots 27659-27669
function agcAotUnit1747 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27663 {
        if slot <= 27660 {
            if slot <= 27659 {
// P20-P25.agc:4961
//		EXTEND			# SAVE THE PRESENT N99 VALUES FOR
// slot 27659
                if slot <> 27659 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4962
//		DCA	WWPOS		# COMPARISON AFTER THE DISPLAY
// slot 27660
                if slot <> 27660 or instruction <> 13185 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 897, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27661 {
// P20-P25.agc:4963
//		DXCH	WWBIAS +2
// slot 27661
                if slot <> 27661 or instruction <> 22407 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 903, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27662 {
// P20-P25.agc:4964
//		EXTEND
// slot 27662
                    if slot <> 27662 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4965
//		DCA	WWVEL
// slot 27663
                    if slot <> 27663 or instruction <> 13187 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 899, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27666 {
            if slot <= 27664 {
// P20-P25.agc:4966
//		DXCH	WWBIAS +4
// slot 27664
                if slot <> 27664 or instruction <> 22409 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 905, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27665 {
// P20-P25.agc:4967
//		EXTEND
// slot 27665
                    if slot <> 27665 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4968
//		DCA	WWBIAS
// slot 27666
                    if slot <> 27666 or instruction <> 13189 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 901, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27667 {
// P20-P25.agc:4969
//		DXCH	WWBIAS +6
// slot 27667
                if slot <> 27667 or instruction <> 22411 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 907, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27668 {
// P20-P25.agc:4970
//V06N99DS	CAF	V06N99
// slot 27668
                    if slot <> 27668 or instruction <> 13411 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1123), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:4971
//		TC	BANKCALL
// slot 27669
                    if slot <> 27669 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1747] to agcAotUnit1747@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4972
//		CADR	GOXDSPF
// slot 27670
    27670, 16824
)).

// bank 31, slots 27671-27677
function agcAotUnit1748 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27673 {
        if slot <= 27671 {
// P20-P25.agc:4973
//		TCF	ENDEXT
// slot 27671
            if slot <> 27671 or instruction <> 6970 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6970, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27672 {
// P20-P25.agc:4974
//		TCF	V6N99PRO
// slot 27672
                if slot <> 27672 or instruction <> 5146 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5146, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4975
//		TCF	V06N99DS
// slot 27673
                if slot <> 27673 or instruction <> 5140 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5140, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27675 {
            if slot <= 27674 {
// P20-P25.agc:4976
//V6N99PRO	ZL
// slot 27674
                if slot <> 27674 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4977
//		CA	FIVE
// slot 27675
                if slot <> 27675 or instruction <> 14830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27676 {
// P20-P25.agc:4978
//N99LOOP		TS	Q
// slot 27676
                if slot <> 27676 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4979
//		INDEX	Q
// slot 27677
                if slot <> 27677 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1748] to agcAotUnit1748@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4980
//		CS	WWPOS
// slot 27678
    27678, 34560
)).

// bank 31, slots 27679-27679
function agcAotUnit1749 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4981
//		INDEX	Q
// slot 27679
    if slot <> 27679 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1749] to agcAotUnit1749@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4982
//		AD	WWPOS +6
// slot 27680
    27680, 50956
)).

// bank 31, slots 27681-27687
function agcAotUnit1750 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27683 {
        if slot <= 27681 {
// P20-P25.agc:4983
//		ADS	L
// slot 27681
            if slot <> 27681 or instruction <> 11265 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27682 {
// P20-P25.agc:4984
//		CCS	Q		# THE SUM OF ALL DIFFERENCES MUST BE ZERO.
// slot 27682
                if slot <> 27682 or instruction <> 4098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4985
//		TCF	N99LOOP
// slot 27683
                if slot <> 27683 or instruction <> 5148 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5148, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27685 {
            if slot <= 27684 {
// P20-P25.agc:4986
//		LXCH	A
// slot 27684
                if slot <> 27684 or instruction <> 9216 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 0, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4987
//		EXTEND
// slot 27685
                if slot <> 27685 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27686 {
// P20-P25.agc:4988
//		BZF	V06N9933
// slot 27686
                if slot <> 27686 or instruction <> 5161 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5161, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:4989
//		TC	UPFLAG
// slot 27687
                if slot <> 27687 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1750] to agcAotUnit1750@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4990
//		ADRES	V67FLAG
// slot 27688
    27688, 224
)).

// bank 31, slots 27689-27689
function agcAotUnit1751 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4991
//
// P20-P25.agc:4992
//V06N9933	TC	INTPRET
// slot 27689
    if slot <> 27689 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1751] to agcAotUnit1751@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4993
//		BON	EXIT
// slot 27690
    27690, 65048,
// P20-P25.agc:4994
//			V67FLAG
// slot 27691
    27691, 3982,
// P20-P25.agc:4995
//			+2
// slot 27692
    27692, 51292
)).

// bank 31, slots 27693-27693
function agcAotUnit1752 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:4996
//		TCF	ENDEXT
// slot 27693
    if slot <> 27693 or instruction <> 6970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1752] to agcAotUnit1752@.

agcAotInstallSourceRope(list(
// P20-P25.agc:4997
//		DLOAD
// slot 27694
    27694, 65482,
// P20-P25.agc:4998
//# Page 609
// P20-P25.agc:4999
//			WWPOS
// slot 27695
    27695, 2306,
// P20-P25.agc:5000
//		SL4	SL1
// slot 27696
    27696, 59924,
// P20-P25.agc:5001
//		STODL	0D
// slot 27697
    27697, 12290,
// P20-P25.agc:5002
//			WWVEL
// slot 27698
    27698, 2310,
// P20-P25.agc:5003
//		STODL	2D
// slot 27699
    27699, 12294,
// P20-P25.agc:5004
//			WWBIAS
// slot 27700
    27700, 2314,
// P20-P25.agc:5005
//		SL			# SHIFT FROM NOUN SCALING (B-5) TO
// slot 27701
    27701, 65378,
// P20-P25.agc:5006
//			10D		# INTERNAL SCALING (B+5)
// slot 27702
    27702, 16662,
// P20-P25.agc:5007
//		STORE	4D
// slot 27703
    27703, 10,
// P20-P25.agc:5008
//		BON	LXA,1
// slot 27704
    27704, 59416,
// P20-P25.agc:5009
//			SURFFLAG
// slot 27705
    27705, 4494,
// P20-P25.agc:5010
//			V67SURF
// slot 27706
    27706, 51332,
// P20-P25.agc:5011
//			0D
// slot 27707
    27707, 0,
// P20-P25.agc:5012
//		SXA,1	LXA,1
// slot 27708
    27708, 59568,
// P20-P25.agc:5013
//			WRENDPOS
// slot 27709
    27709, 2048,
// P20-P25.agc:5014
//			2D
// slot 27710
    27710, 4,
// P20-P25.agc:5015
//		SXA,1	GOTO
// slot 27711
    27711, 43184,
// P20-P25.agc:5016
//			WRENDVEL
// slot 27712
    27712, 2050,
// P20-P25.agc:5017
//			V67CLRF
// slot 27713
    27713, 51344,
// P20-P25.agc:5018
//V67SURF		LXA,1	SXA,1
// slot 27714
    27714, 55504,
// P20-P25.agc:5019
//			0D
// slot 27715
    27715, 0,
// P20-P25.agc:5020
//			WSURFPOS
// slot 27716
    27716, 2060,
// P20-P25.agc:5021
//		LXA,1	SXA,1
// slot 27717
    27717, 55504,
// P20-P25.agc:5022
//			2D
// slot 27718
    27718, 4,
// P20-P25.agc:5023
//			WSURFVEL
// slot 27719
    27719, 2062,
// P20-P25.agc:5024
//V67CLRF		LXA,1	SXA,1
// slot 27720
    27720, 55504,
// P20-P25.agc:5025
//			4D
// slot 27721
    27721, 8,
// P20-P25.agc:5026
//			WTRUN
// slot 27722
    27722, 2054,
// P20-P25.agc:5027
//		SXA,1
// slot 27723
    27723, 65456,
// P20-P25.agc:5028
//			WSHAFT
// slot 27724
    27724, 2052,
// P20-P25.agc:5029
//		CLEAR	EXIT
// slot 27725
    27725, 65048,
// P20-P25.agc:5030
//			RENDWFLG
// slot 27726
    27726, 2940
)).

// bank 31, slots 27727-27727
function agcAotUnit1753 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:5031
//		TCF	ENDEXT
// slot 27727
    if slot <> 27727 or instruction <> 6970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1753] to agcAotUnit1753@.

agcAotInstallSourceRope(list(
// P20-P25.agc:5032
//V67WW		STQ	BOV
// slot 27728
    27728, 32800,
// P20-P25.agc:5033
//			S2
// slot 27729
    27729, 82,
// P20-P25.agc:5034
//			+1
// slot 27730
    27730, 51366,
// P20-P25.agc:5035
//		CLEAR	CALL
// slot 27731
    27731, 37912,
// P20-P25.agc:5036
//			V67FLAG
// slot 27732
    27732, 3950,
// P20-P25.agc:5037
//			INTSTALL
// slot 27733
    27733, 24088,
// P20-P25.agc:5038
//		SSP	DLOAD
// slot 27734
    27734, 58802,
// P20-P25.agc:5039
//			S1
// slot 27735
    27735, 82,
// P20-P25.agc:5040
//		DEC	6
// slot 27736
    27736, 12,
// P20-P25.agc:5041
//			ZEROVECS
// slot 27737
    27737, 6820,
// P20-P25.agc:5042
//		STORE	WWPOS
// slot 27738
    27738, 2306,
// P20-P25.agc:5043
//		STORE	WWVEL
// slot 27739
    27739, 2310,
// P20-P25.agc:5044
//		STORE	WWBIAS
// slot 27740
    27740, 2314,
// P20-P25.agc:5045
//		AXT,1
// slot 27741
    27741, 65520,
// P20-P25.agc:5046
//		DEC	54
// slot 27742
    27742, 108,
// P20-P25.agc:5047
//NXPOSVEL	VLOAD*	VSQ
// slot 27743
    27743, 40694,
// P20-P25.agc:5048
//			W +54D,1
// slot 27744
    27744, 2670,
// P20-P25.agc:5049
//# Page 610
// P20-P25.agc:5050
//		GOTO
// slot 27745
    27745, 65360,
// P20-P25.agc:5051
//			ADDPOS
// slot 27746
    27746, 49156,
// P20-P25.agc:5052
//V06N99		VN	0699
// slot 27747
    27747, 1734,
// P20-P25.agc:5053
//
// P20-P25.agc:5054
//		SETLOC	VB67A
// P20-P25.agc:5055
//		BANK
// P20-P25.agc:5056
//		COUNT*	$$/EXTVB
// P20-P25.agc:5057
//
// P20-P25.agc:5058
//ADDPOS		DAD
// slot 26626
    26626, 65306,
// P20-P25.agc:5059
//			WWPOS
// slot 26627
    26627, 2306,
// P20-P25.agc:5060
//		STORE	WWPOS
// slot 26628
    26628, 2306,
// P20-P25.agc:5061
//		VLOAD*	VSQ
// slot 26629
    26629, 40694,
// P20-P25.agc:5062
//			W +108D,1
// slot 26630
    26630, 2778,
// P20-P25.agc:5063
//		DAD
// slot 26631
    26631, 65306,
// P20-P25.agc:5064
//			WWVEL
// slot 26632
    26632, 2310,
// P20-P25.agc:5065
//		STORE	WWVEL
// slot 26633
    26633, 2310,
// P20-P25.agc:5066
//		VLOAD*	VSQ
// slot 26634
    26634, 40694,
// P20-P25.agc:5067
//			W +162D,1
// slot 26635
    26635, 2886,
// P20-P25.agc:5068
//		DAD
// slot 26636
    26636, 65306,
// P20-P25.agc:5069
//			WWBIAS
// slot 26637
    26637, 2314,
// P20-P25.agc:5070
//		STORE	WWBIAS
// slot 26638
    26638, 2314,
// P20-P25.agc:5071
//		TIX,1	SQRT
// slot 26639
    26639, 63104,
// P20-P25.agc:5072
//			NXPOSVEL
// slot 26640
    26640, 51390,
// P20-P25.agc:5073
//		SR			# SHIFT FROM INTERNAL SCALING (B+5) TO
// slot 26641
    26641, 65378,
// P20-P25.agc:5074
//			10D		# NOUN SCALING (B-5)
// slot 26642
    26642, 17174,
// P20-P25.agc:5075
//		STODL	WWBIAS
// slot 26643
    26643, 14602,
// P20-P25.agc:5076
//			WWVEL
// slot 26644
    26644, 2310,
// P20-P25.agc:5077
//		SQRT
// slot 26645
    26645, 65516,
// P20-P25.agc:5078
//		STODL	WWVEL
// slot 26646
    26646, 14598,
// P20-P25.agc:5079
//			WWPOS
// slot 26647
    26647, 2306,
// P20-P25.agc:5080
//		SQRT
// slot 26648
    26648, 65516,
// P20-P25.agc:5081
//		STORE	WWPOS
// slot 26649
    26649, 2306,
// P20-P25.agc:5082
//		BOV	GOTO
// slot 26650
    26650, 43008,
// P20-P25.agc:5083
//			+2
// slot 26651
    26651, 49210,
// P20-P25.agc:5084
//			V67XXX
// slot 26652
    26652, 49220,
// P20-P25.agc:5085
//		DLOAD
// slot 26653
    26653, 65482,
// P20-P25.agc:5086
//			DPPOSMAX
// slot 26654
    26654, 6832,
// P20-P25.agc:5087
//		STORE	WWPOS
// slot 26655
    26655, 2306,
// P20-P25.agc:5088
//		STORE	WWVEL
// slot 26656
    26656, 2310,
// P20-P25.agc:5089
//		STORE	WWBIAS
// slot 26657
    26657, 2314,
// P20-P25.agc:5090
//V67XXX		DLOAD	DSU
// slot 26658
    26658, 38346,
// P20-P25.agc:5091
//			WWPOS
// slot 26659
    26659, 2306,
// P20-P25.agc:5092
//			FT99999
// slot 26660
    26660, 16480,
// P20-P25.agc:5093
//		BMN	DLOAD
// slot 26661
    26661, 58688,
// P20-P25.agc:5094
//			+3
// slot 26662
    26662, 49234,
// P20-P25.agc:5095
//			FT99999
// slot 26663
    26663, 16480,
// P20-P25.agc:5096
//		STORE	WWPOS
// slot 26664
    26664, 2306,
// P20-P25.agc:5097
//		LXA,1	SXA,1
// slot 26665
    26665, 55504,
// P20-P25.agc:5098
//			S2
// slot 26666
    26666, 82,
// P20-P25.agc:5099
//			QPRET
// slot 26667
    26667, 84,
// P20-P25.agc:5100
//# Page 611
// P20-P25.agc:5101
//		EXIT
// slot 26668
    26668, 65532
)).

// bank 30, slots 26669-26669
function agcAotUnit1684 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P20-P25.agc:5102
//		TC	POSTJUMP
// slot 26669
    if slot <> 26669 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1684] to agcAotUnit1684@.

agcAotInstallSourceRope(list(
// P20-P25.agc:5103
//		CADR	INTWAKE
// slot 26670
    26670, 24106,
// P20-P25.agc:5104
//
// P20-P25.agc:5105
//FT99999		2DEC	30479 B-19
// slot 26671 26672
    26671, 1904, 26672, 15360
)).

// bank 25, slots 24455-24484
function agcAotUnit1617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24469 {
        if slot <= 24461 {
            if slot <= 24457 {
                if slot <= 24455 {
// P20-P25.agc:5106
//
// P20-P25.agc:5107
//# Page 612
// P20-P25.agc:5108
//		BANK	25
// P20-P25.agc:5109
//		SETLOC	RADARUPT
// P20-P25.agc:5110
//		BANK
// P20-P25.agc:5111
//		COUNT*	$$/RRUPT
// P20-P25.agc:5112
//
// P20-P25.agc:5113
//		EBANK=	LOSCOUNT
// P20-P25.agc:5114
//
// P20-P25.agc:5115
//R12LITES	CA	ONE
// slot 24455
                    if slot <> 24455 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24456 {
// P20-P25.agc:5116
//		MASK 	IMODES33
// slot 24456
                        if slot <> 24456 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5117
//		CCS	A
// slot 24457
                        if slot <> 24457 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24459 {
                    if slot <= 24458 {
// P20-P25.agc:5118
//		TCF	ISWRETRN
// slot 24458
                        if slot <> 24458 or instruction <> 6599 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6599, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5119
//
// P20-P25.agc:5120
//		TC	HLIGHT
// slot 24459
                        if slot <> 24459 or instruction <> 1944 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1944, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24460 {
// P20-P25.agc:5121
//		TC	HLIGHT -3
// slot 24460
                        if slot <> 24460 or instruction <> 1941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5122
//		TCF	ISWRETRN
// slot 24461
                        if slot <> 24461 or instruction <> 6599 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6599, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24465 {
                if slot <= 24463 {
                    if slot <= 24462 {
// P20-P25.agc:5123
//
// P20-P25.agc:5124
//RADLITES	CA	BIT1
// slot 24462
                        if slot <> 24462 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5125
//		MASK	IMODES33
// slot 24463
                        if slot <> 24463 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24464 {
// P20-P25.agc:5126
//		CCS	A
// slot 24464
                        if slot <> 24464 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5127
//		TC	Q
// slot 24465
                        if slot <> 24465 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24467 {
                    if slot <= 24466 {
// P20-P25.agc:5128
//
// P20-P25.agc:5129
//		CS	BIT5
// slot 24466
                        if slot <> 24466 or instruction <> 18919 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5130
//		AD	ITEMP1
// slot 24467
                        if slot <> 24467 or instruction <> 24625 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 49).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24468 {
// P20-P25.agc:5131
//		CCS	A
// slot 24468
                        if slot <> 24468 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5132
//		CS	ONE
// slot 24469
                        if slot <> 24469 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 24476 {
            if slot <= 24472 {
                if slot <= 24470 {
// P20-P25.agc:5133
//		TCF	VLIGHT
// slot 24470
                    if slot <> 24470 or instruction <> 6068 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6068, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24471 {
// P20-P25.agc:5134
//
// P20-P25.agc:5135
//		TCF	RRTRKF
// slot 24471
                        if slot <> 24471 or instruction <> 6520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5136
//
// P20-P25.agc:5137
//HLIGHT		TS	ITEMP5		# ZERO ITEMP5 FOR H INDEX
// slot 24472
                        if slot <> 24472 or instruction <> 22581 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22581, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24474 {
                    if slot <= 24473 {
// P20-P25.agc:5138
//
// P20-P25.agc:5139
//		CA	HLITE
// slot 24473
                        if slot <> 24473 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5140
//		TS	L
// slot 24474
                        if slot <> 24474 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24475 {
// P20-P25.agc:5141
//
// P20-P25.agc:5142
//		CA	FLGWRD11
// slot 24475
                        if slot <> 24475 or instruction <> 12359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5143
//		MASK	SCABBIT
// slot 24476
                        if slot <> 24476 or instruction <> 31209 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            if fixedOperand = 4 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
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
            if slot <= 24480 {
                if slot <= 24478 {
                    if slot <= 24477 {
// P20-P25.agc:5144
//		CCS	A
// slot 24477
                        if slot <> 24477 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5145
//		TCF	ONLITES
// slot 24478
                        if slot <> 24478 or instruction <> 6062 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6062, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24479 {
// P20-P25.agc:5146
//		CA	LRALTBIT
// slot 24479
                        if slot <> 24479 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5147
//BOTHLITS	MASK	RADMODES
// slot 24480
                        if slot <> 24480 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 24482 {
                    if slot <= 24481 {
// P20-P25.agc:5148
//		CCS	A
// slot 24481
                        if slot <> 24481 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5149
//		TCF	ONLITES
// slot 24482
                        if slot <> 24482 or instruction <> 6062 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6062, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 24483 {
// P20-P25.agc:5150
//
// P20-P25.agc:5151
//		CA	FLGWRD11
// slot 24483
                        if slot <> 24483 or instruction <> 12359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 71).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P20-P25.agc:5152
//		INDEX	ITEMP5
// slot 24484
                        if slot <> 24484 or instruction <> 20533 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20533, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20533, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1617] to agcAotUnit1617@.

agcAotInstallSourceRope(list(
// P20-P25.agc:5153
//		MASK	HFLSHBIT
// slot 24485
    24485, 62422
)).

// bank 25, slots 24486-24494
function agcAotUnit1618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24489 {
        if slot <= 24487 {
            if slot <= 24486 {
// P20-P25.agc:5154
//		CCS	A
// slot 24486
                if slot <> 24486 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5155
//		TCF	RRTRKF
// slot 24487
                if slot <> 24487 or instruction <> 6520 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6520, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24488 {
// P20-P25.agc:5156
//# Page 613
// P20-P25.agc:5157
//LITIT		EXTEND
// slot 24488
                if slot <> 24488 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5158
//		QXCH	ITEMP6
// slot 24489
                if slot <> 24489 or instruction <> 9270 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 54, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24491 {
            if slot <= 24490 {
// P20-P25.agc:5159
//		TC	TRKFLON +1
// slot 24490
                if slot <> 24490 or instruction <> 2434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2434, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5160
//
// P20-P25.agc:5161
//		EXTEND
// slot 24491
                if slot <> 24491 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24492 {
// P20-P25.agc:5162
//		QXCH	ITEMP6
// slot 24492
                if slot <> 24492 or instruction <> 9270 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 54, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24493 {
// P20-P25.agc:5163
//		TCF	RRTRKF
// slot 24493
                    if slot <> 24493 or instruction <> 6520 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6520, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:5164
//
// P20-P25.agc:5165
//
// P20-P25.agc:5166
//ONLITES		INDEX	ITEMP5
// slot 24494
                    if slot <> 24494 or instruction <> 20533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20533, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1618] to agcAotUnit1618@.

agcAotInstallSourceRope(list(
// P20-P25.agc:5167
//		CS	HFLSHBIT
// slot 24495
    24495, 37846
)).

// bank 25, slots 24496-24504
function agcAotUnit1619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24499 {
        if slot <= 24497 {
            if slot <= 24496 {
// P20-P25.agc:5168
//		MASK	FLGWRD11
// slot 24496
                if slot <> 24496 or instruction <> 28743 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 71).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5169
//		TS	FLGWRD11
// slot 24497
                if slot <> 24497 or instruction <> 22599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24498 {
// P20-P25.agc:5170
//
// P20-P25.agc:5171
//		CA	L
// slot 24498
                if slot <> 24498 or instruction <> 12289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5172
//		TCF	LITIT
// slot 24499
                if slot <> 24499 or instruction <> 6056 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6056, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24501 {
            if slot <= 24500 {
// P20-P25.agc:5173
//VLIGHT		TS	ITEMP5
// slot 24500
                if slot <> 24500 or instruction <> 22581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22581, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P20-P25.agc:5174
//		CA	VLITE
// slot 24501
                if slot <> 24501 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24502 {
// P20-P25.agc:5175
//		TS	L
// slot 24502
                if slot <> 24502 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24503 {
// P20-P25.agc:5176
//		CA	BIT8
// slot 24503
                    if slot <> 24503 or instruction <> 14820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P20-P25.agc:5177
//		TCF	BOTHLITS
// slot 24504
                    if slot <> 24504 or instruction <> 6048 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6048, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1619] to agcAotUnit1619@.

// no code for the lines below
// P20-P25.agc:5178
//
// P20-P25.agc:5179
//HLITE		EQUALS	BIT5
// P20-P25.agc:5180
//VLITE		EQUALS	BIT3
// P20-P25.agc:5181
//
// P20-P25.agc:5182
//# *** END OF LEMP20S .127 ***
